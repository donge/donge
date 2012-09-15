// PropPageFirst.cpp : implementation file
//

#include "stdafx.h"
#include "Ticket.h"
#include "PropPageFirst.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// PropPageFirst dialog


PropPageFirst::PropPageFirst(CWnd* pParent /*=NULL*/)
	: CPropertyPage(PropPageFirst::IDD)
{
	//{{AFX_DATA_INIT(PropPageFirst)
	m_RefreshTime = 10;
	m_TimerEnable = FALSE;
	m_PriceLine = 500;
	//}}AFX_DATA_INIT
}


void PropPageFirst::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(PropPageFirst)s
	DDX_Control(pDX, IDC_EDIT_REFRESH, m_EditRefresh);
	DDX_Control(pDX, IDC_SPIN_REFRESH, m_SpinRefresh);
	DDX_Text(pDX, IDC_EDIT_REFRESH, m_RefreshTime);
	DDV_MinMaxInt(pDX, m_RefreshTime, 1, 300);
	DDX_Check(pDX, IDC_CHECK_TIMER, m_TimerEnable);
	DDX_Text(pDX, IDC_EDIT_PRICELINE, m_PriceLine);
	DDV_MinMaxInt(pDX, m_PriceLine, 1, 10000);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(PropPageFirst, CDialog)
	//{{AFX_MSG_MAP(PropPageFirst)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// PropPageFirst message handlers

//DEL void PropPageFirst::OnSpinRefresh(NMHDR* pNMHDR, LRESULT* pResult) 
//DEL {
//DEL 	// TODO: Add your control notification handler code here
//DEL 	
//DEL 	*pResult = 0;
//DEL }

BOOL PropPageFirst::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	m_SpinRefresh.SetBuddy(&m_EditRefresh);
	m_SpinRefresh.SetRange(1, 300);
	m_SpinRefresh.SetPos(10);
	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}
