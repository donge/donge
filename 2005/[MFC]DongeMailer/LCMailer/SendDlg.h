#if !defined(AFX_SENDDLG_H__2871C42F_5B4F_42AB_BDE9_DB154867E2E6__INCLUDED_)
#define AFX_SENDDLG_H__2871C42F_5B4F_42AB_BDE9_DB154867E2E6__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// SendDlg.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CSendDlg dialog

#define WM_THREADFINISHED (WM_USER + 100)

//##ModelId=43B25EC201B5
class CSendDlg : public CDialog
{
// Construction
public:
	//##ModelId=43B25EC201C6
	CSendDlg(CWnd* pParent = NULL);   // standard constructor

	//##ModelId=43B25EC201D5
	CString m_strAccount;
	//##ModelId=43B25EC201E4
	CString m_strPassword;
	//##ModelId=43B25EC201E5
	CString m_strFrom;
	//##ModelId=43B25EC201F4
	CString m_strTo;
	//##ModelId=43B25EC20203
	CString m_strSubject;
	//##ModelId=43B25EC20204
	CString m_strBody;
	//##ModelId=43B25EC20213
	CString m_strUsername;
	//##ModelId=43B25EC20222
	int m_nCopyNumber;
	//##ModelId=43B25EC20223
	int m_nPort;
	//##ModelId=43B25EC20232
	CString m_strSmtpServer;
	//##ModelId=43B25EC20251
	int m_bNeedAuth;

	//##ModelId=43B25EC20262
	CStringArray m_szFilenames;

	//void EnableUI(BOOL bEnable);//, BOOL bAvi);

// Dialog Data
	//{{AFX_DATA(CSendDlg)
	enum { IDD = IDD_SEND_DIALOG };
	//##ModelId=43B25EC20272
	CMacButton	m_Cancel;
	//##ModelId=43B25EC20280
	CString	m_Status;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CSendDlg)
	protected:
	//##ModelId=43B25EC20290
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CSendDlg)
	//##ModelId=43B25EC2029F
	virtual void OnCancel();
	//##ModelId=43B25EC202A1
	afx_msg LRESULT OnThreadFinished(WPARAM wParam, LPARAM lParam);
	//##ModelId=43B25EC202BF
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SENDDLG_H__2871C42F_5B4F_42AB_BDE9_DB154867E2E6__INCLUDED_)
