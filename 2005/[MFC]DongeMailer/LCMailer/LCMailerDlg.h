// LCMailerDlg.h : header file
//

#if !defined(AFX_LCMAILERDLG_H__482F9E3B_A01B_4755_BABC_036C21BC7BCA__INCLUDED_)
#define AFX_LCMAILERDLG_H__482F9E3B_A01B_4755_BABC_036C21BC7BCA__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CLCMailerDlg dialog

//##ModelId=43B25EC80177
class CLCMailerDlg : public CDialog
{
// Construction
public:
	//##ModelId=43B25EC80196
	CString Mails[20];
	//##ModelId=43B25EC80197
	int num;

	//##ModelId=43B25EC801A5
	CString m_szPop3Server;
	//##ModelId=43B25EC801B5
	CString m_nPop3Port;
	//##ModelId=43B25EC801B6
	CLCMailerDlg(CWnd* pParent = NULL);	// standard constructor

	//##ModelId=43B25EC801C6
	CString szIniFile;
	
	//##ModelId=43B25EC801D4
	CString m_szServerName;
	//##ModelId=43B25EC801E4
	CString m_nPort;
	//##ModelId=43B25EC801E5
	CString m_nNeedAuth;
	//##ModelId=43B25EC801F4
	CString m_szAccount;
	//##ModelId=43B25EC80203
	CString m_szPassword;
	//##ModelId=43B25EC80204
	CString m_szFrom;
	//##ModelId=43B25EC80213
	CString m_szUsername;

	//##ModelId=43B25EC80223
	CStringArray m_szFilenames;

// Dialog Data
	//{{AFX_DATA(CLCMailerDlg)
	enum { IDD = IDD_LCMAILER_DIALOG };
	//##ModelId=43B25EC80233
	CStatic	m_ctrlState;
	//##ModelId=43B25EC80243
	CListCtrl	m_ctrlMailList;
	//##ModelId=43B25EC80252
	CFlatEdit	m_ctrlBody;
	//##ModelId=43B25EC80272
	CFlatEdit	m_ctrlSubject;
	//##ModelId=43B25EC80281
	CFlatEdit	m_ctrlTo;
	//##ModelId=43B25EC80291
	CMacButton	m_ctrlServerSetup;
	//##ModelId=43B25EC802A0
	CMacButton	m_ctrlSend;
	//##ModelId=43B25EC802C0
	CMacButton	m_ctrlExit;
	//##ModelId=43B25EC802CF
	CMacButton	m_ctrlAttachment;
	//##ModelId=43B25EC802EF
	CMacButton	m_ctrlAbout;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CLCMailerDlg)
	public:
	//##ModelId=43B25EC802FD
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	protected:
	//##ModelId=43B25EC8031C
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//##ModelId=43B25EC8033C
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CLCMailerDlg)
	//##ModelId=43B25EC8035B
	virtual BOOL OnInitDialog();
	//##ModelId=43B25EC8036B
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	//##ModelId=43B25EC8038A
	afx_msg void OnPaint();
	//##ModelId=43B25EC8039A
	afx_msg HCURSOR OnQueryDragIcon();
	//##ModelId=43B25EC803A9
	afx_msg void OnButtonServerSetup();
	//##ModelId=43B25EC803B9
	afx_msg void OnButtonAbout();
	//##ModelId=43B25EC803C8
	afx_msg void OnButtonExit();
	//##ModelId=43B25EC803CA
	afx_msg void OnButtonSend();
	//##ModelId=43B25EC803D9
	afx_msg void OnDestroy();
	//##ModelId=43B25EC90001
	afx_msg void OnButtonAttachment();
	//##ModelId=43B25EC9000F
	afx_msg void OnButton1();
	//##ModelId=43B25EC90011
	afx_msg void OnBtnPop3setup();
	//##ModelId=43B25EC90020
	afx_msg void OnButtonRecv();
	//##ModelId=43B25EC9002E
	afx_msg void OnDblclkListMail(NMHDR* pNMHDR, LRESULT* pResult);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_LCMAILERDLG_H__482F9E3B_A01B_4755_BABC_036C21BC7BCA__INCLUDED_)
