#if !defined(AFX_POP3DALOG_H__5B6202CF_4E9F_44D4_8D75_90044B8B8BAC__INCLUDED_)
#define AFX_POP3DALOG_H__5B6202CF_4E9F_44D4_8D75_90044B8B8BAC__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "LCMailerDlg.h"
// Pop3Dalog.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CPop3Dalog dialog

//##ModelId=43B25EC202CE
class CPop3Dalog : public CDialog
{
// Construction
public:
	//##ModelId=43B25EC202EF
	CLCMailerDlg *m_pLCMailerDlg;
	//##ModelId=43B25EC202FD
	CPop3Dalog(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CPop3Dalog)
	enum { IDD = IDD_POP3SETUP_DIALOG };
	//##ModelId=43B25EC20300
	CEdit	m_ctrlPop3Port;
	//##ModelId=43B25EC2031D
	CEdit	m_ctrlUserName;
	//##ModelId=43B25EC2032D
	CEdit	m_ctrlPassWord;
	//##ModelId=43B25EC2034C
	CEdit	m_ctrlPop3Server;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CPop3Dalog)
	protected:
	//##ModelId=43B25EC2035B
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CPop3Dalog)
	//##ModelId=43B25EC2036C
	virtual BOOL OnInitDialog();
	//##ModelId=43B25EC2037A
	virtual void OnOK();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_POP3DALOG_H__5B6202CF_4E9F_44D4_8D75_90044B8B8BAC__INCLUDED_)
