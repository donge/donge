#include "StdAfx.h"
#include "SMTP.h"
#include "Base64.h"

//##ModelId=43B25EC103C9
CSMTP::response_code CSMTP::response_table[] =
{
	//GENERIC_SUCCESS
	{250, _T("SMTP 服务器错误")},
	//AUTHLOGIN_SUCCESS
	{334, _T("SMTP 验证连接错误")},
	//AUTH_SUCCESS
	{235, _T("SMTP 用户名/密码验证错误")},
	//CONNECT_SUCCESS
	{220, _T("SMTP 服务器不可用")},
	//DATA_SUCCESS
	{354, _T("SMTP 服务器不能接收数据")},
	//QUIT_SUCCESS
	{221, _T("SMTP 没有中止会话")}
};

//##ModelId=43B25EC10290
CSMTP::CSMTP(LPCTSTR szSMTPServerName, UINT nPort)
{
	ASSERT(szSMTPServerName != NULL);
	AfxSocketInit();
	m_sSMTPServerHostName = szSMTPServerName;
	m_nPort = nPort;
	m_bConnected = FALSE;
	m_sError = _T("OK");
	response_buf = NULL;
}

//##ModelId=43B25EC1029F
CSMTP::~CSMTP()
{
	Disconnect();
}

//****************************************
// 函数功能：连接服务器
//****************************************
//##ModelId=43B25EC102BF
BOOL CSMTP::Connect()
{
	if(m_bConnected)
		return TRUE;
	
	try
	{
		response_buf = new TCHAR[RESPONSE_BUFFER_SIZE];
		if(response_buf == NULL)
		{
			m_sError = _T("内存不足！");
			return FALSE;
		}
	}
	catch(CException *e)
	{
		response_buf = NULL;
		m_sError = _T("内存不足！");
		delete e;
		return FALSE;
	}

	if(!m_wsSMTPServer.Create())
	{
		m_sError = _T("无法创建套接字！");
		delete response_buf;
		response_buf = NULL;
		return FALSE;
	}

	if(!m_wsSMTPServer.Connect(GetServerHostName(), GetPort()))
	{
		m_sError = _T("无法连接到服务器！");
		m_wsSMTPServer.Close();
		delete response_buf;
		response_buf = NULL;
		return FALSE;
	}

	if(!get_response(CONNECT_SUCCESS))
	{
		m_sError = _T("服务器没有响应！");
		m_wsSMTPServer.Close();
		delete response_buf;
		response_buf = NULL;
		return FALSE;
	}

	//发送“EHLO %SMTP-Server Name%”：
	CString szHello;
	szHello.Format(_T("EHLO %s\r\n"), m_sSMTPServerHostName);
	m_wsSMTPServer.Send((LPCTSTR)szHello, szHello.GetLength());
	if(!get_response(GENERIC_SUCCESS))
	{
		m_sError = _T("无法连接到服务器");
		m_wsSMTPServer.Close();
		delete response_buf;
		response_buf = NULL;
		return FALSE;
	}

	m_bConnected = TRUE;
	return TRUE;
}

//****************************************
// 函数功能：服务器验证
//****************************************
//##ModelId=43B25EC102C0
BOOL CSMTP::Auth()
{
	CString szAccount;
	CString szPassword;
	CBase64 Base64;

	if(!m_bConnected)
	{
		m_sError = _T("必须首先创建连接！");
		return FALSE;
	}

	//发送“AUTH LOGIN”：
	m_wsSMTPServer.Send(_T("AUTH LOGIN\r\n"), lstrlen(_T("AUTH LOGIN\r\n")));
	if(!get_response(AUTHLOGIN_SUCCESS))
	{
		m_wsSMTPServer.Close();
		delete response_buf;
		response_buf = NULL;
		return FALSE;
	}

	//发送经过Base64编码的用户帐号：
	szAccount.Format("%s\r\n", Base64.Encode(m_strAccount, lstrlen(m_strAccount)));
	m_wsSMTPServer.Send((LPCTSTR)szAccount, szAccount.GetLength());
	if(!get_response(AUTHLOGIN_SUCCESS))
	{
		m_wsSMTPServer.Close();
		delete response_buf;
		response_buf = NULL;
		return FALSE;
	}

	//发送经过Base64编码的用户密码：
	szPassword.Format("%s\r\n", Base64.Encode(m_strPassword, lstrlen(m_strPassword)));
	m_wsSMTPServer.Send((LPCTSTR)szPassword, szPassword.GetLength());
	if(!get_response(AUTH_SUCCESS))
	{
		m_wsSMTPServer.Close();
		delete response_buf;
		response_buf = NULL;
		return FALSE;
	}

	return TRUE;
}

//****************************************
// 函数功能：获得服务器返回信息
//****************************************
//##ModelId=43B25EC1034B
BOOL CSMTP::get_response(UINT response_expected)
{
	ASSERT(response_expected >= GENERIC_SUCCESS);
	ASSERT(response_expected < LAST_RESPONSE);

	CString sResponse;
	UINT response;
	response_code *pResp;

	if(m_wsSMTPServer.Receive(response_buf, RESPONSE_BUFFER_SIZE) == SOCKET_ERROR)
	{
		m_sError = _T("套接字错误！");
		return FALSE;
	}

	sResponse = response_buf;
	sscanf((LPCTSTR)sResponse.Left(3), _T("%d"), &response);
	pResp = &response_table[response_expected];
	if(response != pResp->nResponse)
	{
		m_sError.Format(_T("%d:%s"), response, (LPCTSTR)pResp->sMessage);
		return FALSE;
	}

	return TRUE;
}

//##ModelId=43B25EC102CF
CString CSMTP::GetServerHostName()
{
	return m_sSMTPServerHostName;
}

//##ModelId=43B25EC102AF
UINT CSMTP::GetPort()
{
	return m_nPort;
}

//##ModelId=43B25EC102CE
BOOL CSMTP::SendMessage()
{
	//ASSERT(msg != NULL);

	if(!m_bConnected)
	{
		m_sError = _T("必须首先创建连接！");
		return FALSE;
	}

	if(transmit_message() == FALSE)
	{
		return FALSE;
	}

	return TRUE;
}

//****************************************
// 函数功能：生成并传输邮件内容
//****************************************
//##ModelId=43B25EC103A9
BOOL CSMTP::transmit_message()
{
	CString szFrom;
	CString szTo;
	CString szDateTime;
	CString szSubject;
	CString szBodyHead;
	CString szBody;
	CString szContent;
	CString szAttachment;
	CString szTemp;
	CBase64 Base64;
	CString msg;
	
	ASSERT(msg != NULL);

	if(!m_bConnected)
	{
		m_sError = _T("必须首先创建连接！");
		return FALSE;
	}

	//发送Header中的“MAIL FROM”：
	szFrom.Format(_T("MAIL FROM: <%s>\r\n"), (LPCTSTR)m_strFrom);
	m_wsSMTPServer.Send((LPCTSTR)szFrom, szFrom.GetLength());
	if(!get_response(GENERIC_SUCCESS))
	{
		m_wsSMTPServer.Close();
		delete response_buf;
		response_buf = NULL;
		return FALSE;
	}

	//发送Header中的“RCPT TO”：
	szTo.Format(_T("RCPT TO: <%s>\r\n"), (LPCTSTR)m_strTo);
	m_wsSMTPServer.Send((LPCTSTR)szTo, szTo.GetLength());
	if(!get_response(GENERIC_SUCCESS))
	{
		m_wsSMTPServer.Close();
		delete response_buf;
		response_buf = NULL;
		return FALSE;
	}

	//发送“DATA\r\n”：
	m_wsSMTPServer.Send("DATA\r\n", strlen("DATA\r\n"));
	if(!get_response(DATA_SUCCESS))
	{
		m_wsSMTPServer.Close();
		delete response_buf;
		response_buf = NULL;
		return FALSE;
	}

	//以下进行 Body 的处理：
	szFrom.Format(_T("FROM: %s<%s>\r\n"), (LPCTSTR)m_strUsername, (LPCTSTR)m_strFrom);
	szTo.Format(_T("TO: <%s>\r\n"), (LPCTSTR)m_strTo);
	m_tDateTime = m_tDateTime.GetCurrentTime();
	szDateTime = "Date: ";
	szDateTime += m_tDateTime.Format("%a, %d %b %Y %H:%M:%S %Z");
	szDateTime += "\r\n";
	szSubject.Format(_T("Subject: %s\r\n"), (LPCTSTR)m_strSubject);
	szBodyHead = "X-Mailer: LCMailer [ch]\r\n";
	szBodyHead += "MIME_Version:1.0\r\n";
	szBodyHead += "Content-type:multipart/mixed;Boundary=donge.org\r\n\r\n";
	szBodyHead += "--donge.org\r\n";
	szBodyHead += "Content-type:text/plain;Charset=gb2312\r\n";
	szBodyHead += "Content-Transfer-Encoding:8bit\r\n\r\n";
	szBody.Format(_T("%s\r\n\r\n"), (LPCTSTR)m_strBody);

	//以下进行附件的处理：
	if(m_szFilenames.GetSize() != 0)
	{
		szTemp = "--donge.org\r\n";
		szTemp += "Content-Type:application/octet-stream;Name=%s\r\n";
		szTemp += "Content-Disposition:attachment;FileName=%s\r\n";
		szTemp += "Content-Transfer-Encoding:Base64\r\n\r\n";
		szTemp += "%s\r\n\r\n";

		szContent = szFrom + szTo + szDateTime + szSubject + szBodyHead + szBody;
		for(int i = 0; i < m_szFilenames.GetSize(); i++)
		{
			CFile hFile;
			if(hFile.Open(m_szFilenames.GetAt(i), CFile::modeRead))
			{
				DWORD dwFileSize = hFile.GetLength();
				CString szFileBuffer;
				hFile.Read(szFileBuffer.GetBuffer(dwFileSize), dwFileSize);
				szAttachment.Format(szTemp, hFile.GetFileName(), hFile.GetFileName(), Base64.Encode(szFileBuffer, dwFileSize));
				szFileBuffer.ReleaseBuffer();
				hFile.Close();
				szContent += szAttachment;
			}
		}

		//连接成 Content ：
		szContent += "--donge.org--\r\n.\r\n";
	}
	else
	{
		//连接成 Content ：
		szContent = szFrom + szTo + szDateTime + szSubject + szBodyHead + szBody + "--donge.org" + "\r\n.\r\n";
	}

	//发送 Content ：
	m_wsSMTPServer.Send((LPCTSTR)szContent, szContent.GetLength());
	if(!get_response(GENERIC_SUCCESS))
	{
		m_wsSMTPServer.Close();
		delete response_buf;
		response_buf = NULL;
		return FALSE;
	}

	//发送“Quit”：
	m_wsSMTPServer.Send(_T("QUIT\r\n"), lstrlen(_T("QUIT\r\n")));
	if(!get_response(QUIT_SUCCESS))
	{
		m_wsSMTPServer.Close();
		delete response_buf;
		response_buf = NULL;
		return FALSE;
	}

	return TRUE;
}

//****************************************
// 函数功能：断开服务器连接
//****************************************
//##ModelId=43B25EC102B0
BOOL CSMTP::Disconnect()
{
	BOOL ret;
	if(!m_bConnected)
		return TRUE;
	CString sQuit = _T("QUIT\r\n");
	m_wsSMTPServer.Send((LPCTSTR)sQuit, sQuit.GetLength());

	ret = get_response(QUIT_SUCCESS);
	m_wsSMTPServer.Close();

	if(response_buf != NULL)
	{
		delete[] response_buf;
		response_buf = NULL;
	}

	m_bConnected = FALSE;
	
	return ret;
}

//****************************************
// 函数功能：获得错误代码
//****************************************
//##ModelId=43B25EC102A1
CString CSMTP::GetLastError()
{
	return m_sError;
}
