#if !defined(AFX_MAILVIEWDLG_H__058D161F_F6A4_47A2_A341_D48B66A99950__INCLUDED_)
#define AFX_MAILVIEWDLG_H__058D161F_F6A4_47A2_A341_D48B66A99950__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// MailViewDlg.h : header file
//
#include "LCMailerDlg.h"

/////////////////////////////////////////////////////////////////////////////
// CMailViewDlg dialog

//##ModelId=43B25EC300CB
class CMailViewDlg : public CDialog
{
// Construction
public:
	//##ModelId=43B25EC300EA
	bool GetSub(char* sub, const char * buf);
	//CString szMailView;
	//##ModelId=43B25EC300FB
	CLCMailerDlg *m_pLCMailerDlg;
	//##ModelId=43B25EC30109
	CMailViewDlg(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CMailViewDlg)
	enum { IDD = IDD_DIALOG_VIEWMAIL };
	//##ModelId=43B25EC3010B
	CString	m_szSubject;
	//##ModelId=43B25EC30119
	CString	szMailView;
	//##ModelId=43B25EC30128
	CString	m_szDate;
	//##ModelId=43B25EC30129
	CString	m_szTo;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMailViewDlg)
	protected:
	//##ModelId=43B25EC30138
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CMailViewDlg)
	//##ModelId=43B25EC30149
	virtual BOOL OnInitDialog();
	//##ModelId=43B25EC30158
	afx_msg void OnButtonRe();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_MAILVIEWDLG_H__058D161F_F6A4_47A2_A341_D48B66A99950__INCLUDED_)
