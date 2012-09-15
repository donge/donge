#if !defined(AFX_TICKETLISTVEW_H__8C4A05CE_9EC1_4F09_BE1F_1F152AD07A44__INCLUDED_)
#define AFX_TICKETLISTVEW_H__8C4A05CE_9EC1_4F09_BE1F_1F152AD07A44__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// TicketListVew.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// TicketListVew dialog

class TicketListVew : public CDialog
{
// Construction
public:
	TicketListVew(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(TicketListVew)
	enum { IDD = IDD_FORMVIEW };
	CComboBox	m_ComboArrive;
	CComboBox	m_ComboDepart;
	CListCtrl	m_MyTicketList;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(TicketListVew)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(TicketListVew)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TICKETLISTVEW_H__8C4A05CE_9EC1_4F09_BE1F_1F152AD07A44__INCLUDED_)
