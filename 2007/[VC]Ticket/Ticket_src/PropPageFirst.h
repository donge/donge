#if !defined(AFX_PROPPAGEFIRST_H__2966CB76_A329_4CEF_A03C_C5A9B1A96599__INCLUDED_)
#define AFX_PROPPAGEFIRST_H__2966CB76_A329_4CEF_A03C_C5A9B1A96599__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// PropPageFirst.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// PropPageFirst dialog

class PropPageFirst : public CPropertyPage
{
// Construction
public:
	PropPageFirst(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(PropPageFirst)
	enum { IDD = IDD_PROPPAGE_FIRST };
	CEdit	m_EditRefresh;
	CSpinButtonCtrl	m_SpinRefresh;
	int		m_RefreshTime;
	BOOL	m_TimerEnable;
	int		m_PriceLine;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(PropPageFirst)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(PropPageFirst)
	virtual BOOL OnInitDialog();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_PROPPAGEFIRST_H__2966CB76_A329_4CEF_A03C_C5A9B1A96599__INCLUDED_)
