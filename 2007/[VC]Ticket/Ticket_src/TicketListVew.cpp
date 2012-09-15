// TicketListVew.cpp : implementation file
//

#include "stdafx.h"
#include "Ticket.h"
#include "TicketListVew.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// TicketListVew dialog


TicketListVew::TicketListVew(CWnd* pParent /*=NULL*/)
	: CDialog(TicketListVew::IDD, pParent)
{
	//{{AFX_DATA_INIT(TicketListVew)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT

}


void TicketListVew::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(TicketListVew)
	DDX_Control(pDX, IDC_COMBO_ARRIVE, m_ComboArrive);
	DDX_Control(pDX, IDC_COMBO_DEPART, m_ComboDepart);
	DDX_Control(pDX, IDC_TICKET_LIST, m_MyTicketList);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(TicketListVew, CDialog)
	//{{AFX_MSG_MAP(TicketListVew)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// TicketListVew message handlers

//DEL void TicketListVew::OnButton() 
//DEL {
//DEL 	m_ComboArrive.AddString("gfh");
//DEL 	UpdateData(TRUE);
//DEL }

//DEL void TicketListVew::OnButtonGo() 
//DEL {
//DEL 	// TODO: Add your control notification handler code here
//DEL 	ShellExecute(this->m_hWnd, "open", " http://www.google.com", "", "", SW_SHOW);
//DEL }
