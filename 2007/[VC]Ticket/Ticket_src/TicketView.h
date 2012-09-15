// TicketView.h : interface of the CTicketView class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_TICKETVIEW_H__E0EECA90_C23F_4681_BE2E_734F8F9C4D00__INCLUDED_)
#define AFX_TICKETVIEW_H__E0EECA90_C23F_4681_BE2E_734F8F9C4D00__INCLUDED_

#include "PropPageFirst.h"	// Added by ClassView
#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000


class CTicketView : public CFormView
{
protected: // create from serialization only
	CTicketView();
	DECLARE_DYNCREATE(CTicketView)

public:
	//{{AFX_DATA(CTest1View)
	enum{ IDD = IDD_FORMVIEW };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Attributes
public:
	CTicketDoc* GetDocument();

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTicketView)
	public:
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	virtual void OnInitialUpdate();
	protected:
	virtual BOOL OnPreparePrinting(CPrintInfo* pInfo);
	virtual void OnBeginPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnEndPrinting(CDC* pDC, CPrintInfo* pInfo);
	virtual void OnPrint(CDC* pDC, CPrintInfo* pInfo);
	//}}AFX_VIRTUAL

// Implementation
public:
	PropPageFirst MyPageFirst;
	void UpdateTickeList();
	virtual ~CTicketView();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CTicketView)
	afx_msg void OnButtonRun();
	afx_msg void OnClickTicketList(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnButtonGo();
	afx_msg void OnButtonProperty();
	afx_msg void OnTimer(UINT nIDEvent);
	afx_msg void OnDblclkTicketList(NMHDR* pNMHDR, LRESULT* pResult);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#ifndef _DEBUG  // debug version in TicketView.cpp
inline CTicketDoc* CTicketView::GetDocument()
   { return (CTicketDoc*)m_pDocument; }
#endif

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TICKETVIEW_H__E0EECA90_C23F_4681_BE2E_734F8F9C4D00__INCLUDED_)
