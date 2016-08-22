#include "afxsock.h"

#define SMTP_PORT 25
#define RESPONSE_BUFFER_SIZE 1024

//class CLCMailerDlg;

//##ModelId=43B25EC10280
class CSMTP
{
public:
	//##ModelId=43B25EC10290
	CSMTP(LPCTSTR szSMTPServerName, UINT nPort = SMTP_PORT);
	//##ModelId=43B25EC1029F
	virtual ~CSMTP();
	//##ModelId=43B25EC102A1
	CString GetLastError();
	//##ModelId=43B25EC102AF
	UINT GetPort();
	//##ModelId=43B25EC102B0
	BOOL Disconnect();
	//##ModelId=43B25EC102BF
	BOOL Connect();
	//##ModelId=43B25EC102C0
	BOOL Auth();
	//virtual BOOL FormatMailMessage(CMailMessage *msg);
	//##ModelId=43B25EC102CE
	BOOL SendMessage();
	//##ModelId=43B25EC102CF
	CString GetServerHostName();

	//##ModelId=43B25EC102D0
	CString m_strAccount;
	//##ModelId=43B25EC102DE
	CString m_strPassword;
	//##ModelId=43B25EC102EE
	CString m_strFrom;
	//##ModelId=43B25EC102EF
	CString m_strTo;
	//##ModelId=43B25EC102FD
	CString m_strSubject;
	//##ModelId=43B25EC1030D
	CString m_strHeader;
	//##ModelId=43B25EC1030E
	CTime m_tDateTime;
	//##ModelId=43B25EC1031C
	CString m_strBody;
	//##ModelId=43B25EC1032C
	CString m_strUsername;

	//##ModelId=43B25EC1033D
	CStringArray m_szFilenames;

	//Ö÷¶Ô»°¿ò£º
	//CLCMailerDlg *m_pLCMailerDlg;

private:
	//##ModelId=43B25EC1034B
	BOOL get_response(UINT response_expected);
	//CString cook_body(CMailMessage *msg);
	//##ModelId=43B25EC1035B
	CString m_sError;
	//##ModelId=43B25EC1036B
	BOOL m_bConnected;
	//##ModelId=43B25EC1037A
	UINT m_nPort;
	//##ModelId=43B25EC1038A
	CString m_sSMTPServerHostName;
	//##ModelId=43B25EC1039A
	CSocket m_wsSMTPServer;

protected:
	//##ModelId=43B25EC103A9
	virtual BOOL transmit_message();
	//##ModelId=43B25EC20000
	struct response_code
	{
		//##ModelId=43B25EC2000F
		UINT nResponse;
		//##ModelId=43B25EC20010
		TCHAR *sMessage;
	};
	//##ModelId=43B25EC2001F
	enum eResponse
	{
		//##ModelId=43B25EC2003E
		GENERIC_SUCCESS = 0,
		//##ModelId=43B25EC2003F
		AUTHLOGIN_SUCCESS,
		//##ModelId=43B25EC2004E
		AUTH_SUCCESS,
		//##ModelId=43B25EC2005D
		CONNECT_SUCCESS,
		//##ModelId=43B25EC2006D
		DATA_SUCCESS,
		//##ModelId=43B25EC2006E
		QUIT_SUCCESS,
		//##ModelId=43B25EC2007D
		LAST_RESPONSE
	};
	//##ModelId=43B25EC103B9
	TCHAR *response_buf;
	//##ModelId=43B25EC103C9
	static response_code response_table[];
};
