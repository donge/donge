#if !defined(AFX_SERVERSETUP_H__1B13E6C6_3CCF_4241_9DC5_BDC2DF47C357__INCLUDED_)
#define AFX_SERVERSETUP_H__1B13E6C6_3CCF_4241_9DC5_BDC2DF47C357__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// ServerSetup.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CServerSetup dialog

#include "LCMailerDlg.h"

class CLCMailerDlg;

//##ModelId=43B25EC2009C
class CServerSetup : public CDialog
{
// Construction
public:
	//##ModelId=43B25EC200AC
	CServerSetup(CWnd* pParent = NULL);   // standard constructor

	//Ö÷¶Ô»°¿ò£º
	//##ModelId=43B25EC200BD
	CLCMailerDlg *m_pLCMailerDlg;

// Dialog Data
	//{{AFX_DATA(CServerSetup)
	enum { IDD = IDD_SERVERSETUP_DIALOG };
	//##ModelId=43B25EC200CC
	CFlatEdit	m_ctrlFrom;
	//##ModelId=43B25EC200DB
	CMacCheckBox	m_ctrlNeedAuth;
	//##ModelId=43B25EC200EB
	CFlatEdit	m_ctrlAccount;
	//##ModelId=43B25EC200FB
	CMacButton	m_ctrlOK;
	//##ModelId=43B25EC2010A
	CMacButton	m_ctrlCancel;
	//##ModelId=43B25EC20129
	CFlatEdit	m_ctrlUsername;
	//##ModelId=43B25EC20139
	CFlatEdit	m_ctrlServerName;
	//##ModelId=43B25EC20149
	CFlatEdit	m_ctrlPort;
	//##ModelId=43B25EC20158
	CFlatEdit	m_ctrlPassword;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CServerSetup)
	protected:
	//##ModelId=43B25EC20167
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CServerSetup)
	//##ModelId=43B25EC20186
	afx_msg void OnCheckNeedAuth();
	//##ModelId=43B25EC20196
	virtual BOOL OnInitDialog();
	//##ModelId=43B25EC20198
	virtual void OnOK();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_SERVERSETUP_H__1B13E6C6_3CCF_4241_9DC5_BDC2DF47C357__INCLUDED_)
