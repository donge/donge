// WebFetcher.cpp: implementation of the WebFetcher class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "Ticket.h"
#include "WebFetcher.h"

//#pragma warning (disable : 4786) // identifier was truncated to '255' characters in the browser information

#include <afxinet.h>
#include <comdef.h>
#include <FSTREAM>
#include <ASSERT.H>
#include "ChineseCodeLib.h"
#pragma comment(lib, "wininet.lib")

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif


//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

WebFetcher::WebFetcher()
{

}

WebFetcher::WebFetcher(CString Url):Url(Url)
{
}

WebFetcher::~WebFetcher()
{
	if(NULL != pContent)
	{
		delete[] pContent;
	}
}

void WebFetcher::Run()
{
	pContent = GetHttp(Url);
	UTF_8ToGB2312();

	return;	
}
#if 0
CHAR* WebFetcher::GetHttp(LPCSTR lpServerName)
{
	CInternetSession sess;

    // 统一以二进制方式下载
    DWORD dwFlag = INTERNET_FLAG_TRANSFER_BINARY|INTERNET_FLAG_DONT_CACHE|INTERNET_FLAG_RELOAD;
    CHttpFile *pF = (CHttpFile*)sess.OpenURL(lpServerName, 1, dwFlag); ASSERT(pF);
    if (!pF)
    {
		AfxThrowInternetException(1);
	}

    // 得到文件大小
    CString str;
    pF->QueryInfo(HTTP_QUERY_CONTENT_LENGTH, str);
    int nFileSize = _ttoi(str);

    char *p = new char[nFileSize];
    while (true)
    {
        // 每次下载8Kb
        int n = pF->Read(p, (nFileSize < 8192) ? nFileSize : 8192);
        if (n <= 0)
		{
            break;
		}
        p += n;
		nFileSize -= n;
    }

    //delete[] p;
	pF->Close();
    delete pF;

	return p;
}
#endif
    static bstr_t QueryTempFilePath()
    {
        TCHAR   szTmpPath[MAX_PATH],
                szFilename[MAX_PATH] ;
        ::GetTempPath (MAX_PATH, szTmpPath) ;
        ::GetTempFileName (szTmpPath, TEXT("foo"), 0, szFilename) ;
        return szFilename ;
    }

	static void LoadFileToBuffer (const char* szFilename, char*& pBuffer, int& nLength)
    {
        pBuffer = 0;
		nLength = 0;
        std::ifstream inFile(szFilename, std::ios::in|std::ios::binary) ;
        if (!inFile.is_open())
            {assert(false); return;}

        // get file length
        inFile.seekg (0, std::ios::end) ;
        nLength = (int)inFile.tellg() ;
        if (nLength <= 0)
            {assert(false); return;}

        // read file into memory
        pBuffer = new char[nLength + 8] ;
        memset (&pBuffer[nLength], 0, 8) ;
        inFile.seekg (0, std::ios::beg) ;
        inFile.read (pBuffer, nLength) ;
    }

#if 1
CHAR* WebFetcher::GetHttp(LPCSTR lpServerName)
{

        // start download file
        char   *pBuf = NULL ;
        int    nBufLen = 0 ;
        TRY
        {
            // connection
            CInternetSession   sess ;
            sess.SetOption (INTERNET_OPTION_CONNECT_TIMEOUT, 30 * 1000) ;
            sess.SetOption (INTERNET_OPTION_CONNECT_BACKOFF, 1000) ;
            sess.SetOption (INTERNET_OPTION_CONNECT_RETRIES, 1) ;

            DWORD       dwFlag = INTERNET_FLAG_TRANSFER_BINARY|INTERNET_FLAG_DONT_CACHE|INTERNET_FLAG_RELOAD ;
            CHttpFile   * pF = (CHttpFile*)sess.OpenURL(lpServerName, 1, dwFlag); ASSERT(pF);
            if (!pF)
                {AfxThrowInternetException(1);}

            // connection status
            CString      str ;
            pF->QueryInfo (HTTP_QUERY_STATUS_CODE, str) ;

            // Proxy Authentication Required
            if (str == _T("407"))
            {
                CString   strUsername, strPassword ;
//                pPara->pThis->df_Notify (GetMsg_ProxyValidate(), &WM_DLF_PROXY_VALIDATE(&lpServerName, &strUsername, &strPassword)) ;
                pF->SetOption (INTERNET_OPTION_PROXY_USERNAME, (VOID*)(LPCTSTR)strUsername, strUsername.GetLength()) ;
                pF->SetOption (INTERNET_OPTION_PROXY_PASSWORD, (VOID*)(LPCTSTR)strPassword, strPassword.GetLength()) ;
                pF->SendRequest (NULL) ;
            }

            pF->QueryInfo (HTTP_QUERY_STATUS_CODE, str) ;
            if (str != _T("200"))
            {
                pF->Close() ;
                delete pF ;
                AfxThrowInternetException(1);
            }

            // confirm update
            pF->QueryInfo (HTTP_QUERY_LAST_MODIFIED, str) ;
/*            if (!pPara->pThis->df_Notify (GetMsg_CheckTime(), &WM_DLF_CHECKTIME(&lpServerName, &str)))
            {
                pF->Close() ;
                delete pF ;
                AfxThrowInternetException(1);
            }
*/
            // start download
            pF->QueryInfo (HTTP_QUERY_CONTENT_LENGTH, str) ; // file's length
  //          pPara->pThis->df_Notify (GetMsg_StartDownload(), &pPara->strFileURL) ;

            if (_ttoi(str))
            {
                // know file's size
                int     nLen = (nBufLen = _ttoi(str)) ;
                char    * p = (pBuf = new char[nLen+8]) ;
                ZeroMemory (p, nLen+8) ;

               // while (IsWindow(pPara->pThis->GetSafeHwnd()))
				while (true)
                {
                    // download 8K every
                    int   n = pF->Read (p, (nLen < 8192) ? nLen : 8192) ;
                    if (n <= 0)
                        break ; // success exit
                    p += n ; nLen -= n ;

                    //pPara->pThis->df_Notify (GetMsg_Progress(), &WM_DLF_PROGRESS(&pPara->strFileURL, nBufLen-nLen, nBufLen)) ;
                }

                // interrupted
                if (nLen != 0)
                {
                    delete[] pBuf;
					pBuf=NULL;
                    nBufLen = 0 ;
                }
            }
            else
            {
                // don't know file's size, save context to a temp file.
                bstr_t   strFile = QueryTempFilePath() ;
                CFile    outFile (strFile, CFile::modeCreate|CFile::modeReadWrite) ;
                int      n = (int)pF->GetLength() ;
                while (n)
                {
                    char   * pa = new char[n] ;
                    n = pF->Read (pa, n) ;
                    outFile.Write (pa, n) ;
               //     pPara->pThis->df_Notify (GetMsg_Progress(), &WM_DLF_PROGRESS(&pPara->strFileURL, (int)outFile.GetLength(), 0)) ;
                    n = (int)pF->GetLength() ;
                    delete[] pa ;
                }
                outFile.Close() ;

                // success
                if (n == 0)
                {
                    DWORD   dw ;
                    if (::InternetQueryDataAvailable ((HINTERNET)(*pF), &dw, 0, 0) && (dw == 0))
                    {
                        LoadFileToBuffer (strFile, pBuf, nBufLen) ;
                    }
                }
                ::DeleteFile(strFile) ;
            }

            pF->Close() ;
            delete pF ;
        }
        CATCH_ALL(e) {}
        END_CATCH_ALL
/*
        if (pBuf)
        {
            //pPara->pThis->df_Notify (GetMsg_DownFinished(), &WM_DLF_FINISHED(&pPara->strFileURL, pBuf, nBufLen)) ;
            delete[] pBuf ;
        }
        else
        {
            //pPara->pThis->df_Notify (GetMsg_Error(), &pPara->strFileURL) ;
        }*/
		//AfxMessageBox(pBuf);
        return pBuf;
    //}
}
#endif

void WebFetcher::Parse(AirTicketTable &MyTable)
{
	CString szTmp(pContent);

	const int HEAD_LEN = 12;
	const int TAIL_LEN = 2;

	int nStart = szTmp.Find("var cached=\"", 0);
	int nEnd   = szTmp.Find("\";", nStart);

	nStart += HEAD_LEN;
	nEnd += TAIL_LEN;
	// 获得有效信息内容
	szTmp = szTmp.Mid(nStart, nEnd - nStart);

	CString		Date;
	CString		FlightSn;
	UINT4		Price;
	CString		Site;
	CString		Url;
	CString		DepartTime;
	CString		ArriveTime;
	CString		DepartAirport;
	CString		ArriveAirport;
	CString		Company;
	CString		PlaneType;
	CString		TimeStamp;
	// 分词列表
	vector<CString> StrList;

	nStart = 0;
	int Split = szTmp.Find("\\t", nStart);
	// 没有机票信息
	if (-1 == Split)
	{
		return;
	}
	// 分割机票信息
	while (-1 != Split)
	{
		CString Str = szTmp.Mid(nStart, Split - nStart);
		// 发现换行，即下一条机票
		if (-1 != Str.Find("\\n", 0))
		{
			StrList.push_back(Str.Mid(0, Str.Find("\\n", 0)));
			StrList.push_back(Str.Mid(Str.Find("\\n", 0) + 2));
		}
		else
		{
			StrList.push_back(Str);
		}
		nStart = Split + 2;
		Split = szTmp.Find("\\t", nStart);
	}
	StrList.push_back(szTmp.Mid(nStart, Split - nStart));

	// 使用分词列表建立机票信息库
	for (int i = 0; i < StrList.size(); i+= 12)
	{
		Date			= StrList[i];
		FlightSn		= StrList[i + 1];
		Price			= atoi(StrList[i + 2]);
		Site			= StrList[i + 3];
		Url				= StrList[i + 4];
		// 如果使用相对网址
		if (-1 == Url.Find("http://", 0))
		{
			Url = "http://jipiao.kooxoo.com" + Url; 
		}
		DepartTime		= StrList[i + 5];
		ArriveTime		= StrList[i + 6];
	    DepartAirport	= StrList[i + 7];
	    ArriveAirport	= StrList[i + 8];
	    Company			= StrList[i + 9];
	    PlaneType		= StrList[i + 10];
	    TimeStamp		= StrList[i + 11];
	
		AirTicket MyTicket(Date,
						   FlightSn,
						   Price,
						   Site,
						   Url,
						   DepartTime,
						   ArriveTime,
						   DepartAirport,
						   ArriveAirport,
						   Company,
						   PlaneType,
						   TimeStamp);
		MyTable.Add(MyTicket);
	}
	
	return;
}

void WebFetcher::UTF_8ToGB2312()
{
	string UTFStr;
	CChineseCodeLib::UTF_8ToGB2312(UTFStr, pContent, strlen(pContent));
	strcpy(pContent, UTFStr.c_str());
}
