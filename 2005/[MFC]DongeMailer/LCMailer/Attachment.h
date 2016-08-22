#if !defined(AFX_ATTACHMENT_H__3A3695C9_8AFA_4458_A188_596523023255__INCLUDED_)
#define AFX_ATTACHMENT_H__3A3695C9_8AFA_4458_A188_596523023255__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Attachment.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CAttachment dialog

#include "LCMailerDlg.h"

class CLCMailerDlg;

//##ModelId=43B25EC901C5
class CAttachment : public CDialog
{
// Construction
public:
	//##ModelId=43B25EC901D5
	CAttachment(CWnd* pParent = NULL);   // standard constructor

	//Ö÷¶Ô»°¿ò£º
	//##ModelId=43B25EC901E5
	CLCMailerDlg *m_pLCMailerDlg;

// Dialog Data
	//{{AFX_DATA(CAttachment)
	enum { IDD = IDD_ATTACHMENT_DIALOG };
	//##ModelId=43B25EC901F5
	CMacButton	m_ctrlDel;
	//##ModelId=43B25EC90204
	CMacButton	m_ctrlAdd;
	//##ModelId=43B25EC90223
	CListCtrl	m_ctrlAttachment;
	//##ModelId=43B25EC90233
	CMacButton	m_ctrlOK;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAttachment)
	protected:
	//##ModelId=43B25EC90242
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CAttachment)
	//##ModelId=43B25EC90261
	virtual BOOL OnInitDialog();
	//##ModelId=43B25EC90263
	afx_msg void OnButtonAdd();
	//##ModelId=43B25EC90272
	afx_msg void OnItemchangedListAttachment(NMHDR* pNMHDR, LRESULT* pResult);
	//##ModelId=43B25EC90290
	afx_msg void OnButtonDel();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_ATTACHMENT_H__3A3695C9_8AFA_4458_A188_596523023255__INCLUDED_)
