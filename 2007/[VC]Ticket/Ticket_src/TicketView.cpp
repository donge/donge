// TicketView.cpp : implementation of the CTicketView class
//

#include "stdafx.h"
#include "Ticket.h"

#include "TicketDoc.h"
#include "TicketView.h"

#include "PropPageFirst.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CTicketView

IMPLEMENT_DYNCREATE(CTicketView, CFormView)

BEGIN_MESSAGE_MAP(CTicketView, CFormView)
	//{{AFX_MSG_MAP(CTicketView)
	ON_COMMAND(ID_BUTTON_RUN, OnButtonRun)
	ON_NOTIFY(NM_CLICK, IDC_TICKET_LIST, OnClickTicketList)
	ON_BN_CLICKED(IDC_BUTTON, OnButtonGo)
	ON_COMMAND(ID_BUTTON_PROPERTY, OnButtonProperty)
	ON_WM_TIMER()
	ON_NOTIFY(NM_DBLCLK, IDC_TICKET_LIST, OnDblclkTicketList)
	//}}AFX_MSG_MAP
	// Standard printing commands
	ON_COMMAND(ID_FILE_PRINT, CFormView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_DIRECT, CFormView::OnFilePrint)
	ON_COMMAND(ID_FILE_PRINT_PREVIEW, CFormView::OnFilePrintPreview)
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTicketView construction/destruction


CTicketView::CTicketView() : CFormView(CTicketView::IDD)
{
	// TODO: add construction code here

}

CTicketView::~CTicketView()
{
}

BOOL CTicketView::PreCreateWindow(CREATESTRUCT& cs)
{
	// TODO: Modify the Window class or styles here by modifying
	//  the CREATESTRUCT cs

	return CView::PreCreateWindow(cs);
}

/////////////////////////////////////////////////////////////////////////////
// CTicketView drawing
void CTicketView::OnPrint(CDC* pDC, CPrintInfo* /*pInfo*/)
{
	CTicketDoc* pDoc = GetDocument();
	ASSERT_VALID(pDoc);
	// TODO: add draw code for native data here	
}
/////////////////////////////////////////////////////////////////////////////
// CTicketView printing

BOOL CTicketView::OnPreparePrinting(CPrintInfo* pInfo)
{
	// default preparation
	return DoPreparePrinting(pInfo);
}

void CTicketView::OnBeginPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add extra initialization before printing
}

void CTicketView::OnEndPrinting(CDC* /*pDC*/, CPrintInfo* /*pInfo*/)
{
	// TODO: add cleanup after printing
}

/////////////////////////////////////////////////////////////////////////////
// CTicketView diagnostics

#ifdef _DEBUG
void CTicketView::AssertValid() const
{
	CView::AssertValid();
}

void CTicketView::Dump(CDumpContext& dc) const
{
	CView::Dump(dc);
}

CTicketDoc* CTicketView::GetDocument() // non-debug version is inline
{
	ASSERT(m_pDocument->IsKindOf(RUNTIME_CLASS(CTicketDoc)));
	return (CTicketDoc*)m_pDocument;
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CTicketView message handlers

// 后台线程抓取
UINT Fetch(LPVOID lpParam);
struct ThreadInfo
{
	BOOL bRunning;
	CTicketDoc* pDoc;
	CTicketView* pView;
	CString szParam1;
	CString szParam2;
	CString szParam3;
};
ThreadInfo MyThread;

void CTicketView::OnButtonRun() 
{
	// TODO: Add your command handler code here
	CTicketDoc* pDoc = GetDocument();
	CString szDeapart, szArrive, szDate;
	ASSERT_VALID(pDoc);

	CComboBox* pComboDepart = (CComboBox*)GetDlgItem(IDC_COMBO_DEPART);
	CComboBox* pComboArrive = (CComboBox*)GetDlgItem(IDC_COMBO_ARRIVE);
	CDateTimeCtrl* pDate = (CDateTimeCtrl*)GetDlgItem(IDC_DATETIMEPICKER);
	// 取得控件参数
	pComboDepart->GetWindowText(szDeapart);
	pComboArrive->GetWindowText(szArrive);
	pDate->GetWindowText(szDate);

	if (MyThread.bRunning == 0)
	{
		MyThread.bRunning = 1;
		MyThread.pDoc = pDoc;
		MyThread.pView = this;
		MyThread.szParam1 = szDeapart;
		MyThread.szParam2 = szArrive;
		MyThread.szParam3 = szDate;

		CWinThread* pThread = AfxBeginThread(Fetch, &MyThread);
	}

}

UINT Fetch(LPVOID lpParam)
{
	ThreadInfo* pThread = (ThreadInfo*)lpParam;
	pThread->pDoc->GetWebInfo(pThread->szParam1, pThread->szParam2, pThread->szParam3);
	pThread->pView->UpdateTickeList();
	// 关闭线程
	pThread->bRunning = 0;
	return 0;
}


void CTicketView::OnInitialUpdate() 
{
	CFormView::OnInitialUpdate();
	
	CListCtrl* pTicketList = (CListCtrl*) GetDlgItem(IDC_TICKET_LIST);
	// TODO: Add your specialized code here and/or call the base class
	pTicketList->SetExtendedStyle(pTicketList->GetExtendedStyle() | 
								  LVS_EX_FULLROWSELECT|LVS_EX_GRIDLINES);
	// 初始化表格
	pTicketList->InsertColumn(0, "ID", LVCFMT_LEFT, 30, 0);
	pTicketList->InsertColumn(1, "Date", LVCFMT_LEFT, 80, 1);
	pTicketList->InsertColumn(2, "Depart Airport", LVCFMT_LEFT, 100, 2);
	pTicketList->InsertColumn(3, "Depart Time", LVCFMT_LEFT, 50, 3);
	pTicketList->InsertColumn(4, "Arrive Airport", LVCFMT_LEFT, 100, 4);
	pTicketList->InsertColumn(5, "Arrive Time", LVCFMT_LEFT, 50, 5);
	pTicketList->InsertColumn(6, "Price", LVCFMT_LEFT, 50, 6);
	pTicketList->InsertColumn(7, "Flight Compnany", LVCFMT_LEFT, 120, 7);
	pTicketList->InsertColumn(8, "Plane Type", LVCFMT_LEFT, 50, 8);
	pTicketList->InsertColumn(9, "Web Site", LVCFMT_LEFT, 100, 9);
	pTicketList->InsertColumn(10, "URL", LVCFMT_LEFT, 160, 10);

	// 初始化城市列表
	CComboBox* pComboDepart = (CComboBox*)GetDlgItem(IDC_COMBO_DEPART);
	CComboBox* pComboArrive = (CComboBox*)GetDlgItem(IDC_COMBO_ARRIVE);

	for(int i = 0; i < AIRPORT_CNT; ++i)
	{
		pComboDepart->AddString(AirportData[i][1]);
		pComboArrive->AddString(AirportData[i][1]);
	}
	pComboDepart->SetWindowText("北京");
	pComboArrive->SetWindowText("大连");

}

// 全局szUrl
CString szUrl;
#define MAX_PRICE 10000
void CTicketView::UpdateTickeList()
{
	CTicketDoc* pDoc = GetDocument();
	CListCtrl* pTicketList = (CListCtrl*)GetDlgItem(IDC_TICKET_LIST);
	CListBox* pLogList = (CListBox*)GetDlgItem(IDC_LOG_LIST);

	CString szTmp;
	int MinPrice = MAX_PRICE;
	int Selected = 0;

	pTicketList->DeleteAllItems();
	for(int i = pDoc->MyTable.TableSize() - 1; i >= 0; --i)
	{
		szTmp.Format("%d", i);
		pTicketList->InsertItem(0, szTmp);
		pTicketList->SetItemText(0, 1, pDoc->GetAirTicketInfo(i, FLIGHT_DATE));
		pTicketList->SetItemText(0, 2, pDoc->GetAirTicketInfo(i, DEPART_AIRPORT));
		pTicketList->SetItemText(0, 3, pDoc->GetAirTicketInfo(i, DEPART_TIME));
		pTicketList->SetItemText(0, 4, pDoc->GetAirTicketInfo(i, ARRIVE_AIRPORT));
		pTicketList->SetItemText(0, 5, pDoc->GetAirTicketInfo(i, ARRIVE_TIME));
		pTicketList->SetItemText(0, 6, pDoc->GetAirTicketInfo(i, PRICE));
		pTicketList->SetItemText(0, 7, pDoc->GetAirTicketInfo(i, COMPANY));
		pTicketList->SetItemText(0, 8, pDoc->GetAirTicketInfo(i, PLANE_TYPE));
		pTicketList->SetItemText(0, 9, pDoc->GetAirTicketInfo(i, SITE));
		pTicketList->SetItemText(0, 10, pDoc->GetAirTicketInfo(i, URL));

		// 最小票价判断
		if (atoi(pDoc->GetAirTicketInfo(i, PRICE)) < MinPrice)
		{
			MinPrice = atoi(pDoc->GetAirTicketInfo(i, PRICE));
			Selected = i;
			szUrl = pDoc->GetAirTicketInfo(i, URL);
		}
	}

	// 选中最低票
	pTicketList->SetItemState(Selected, LVIS_SELECTED, LVIS_SELECTED);
	pTicketList->SetFocus();

	// 出现最低票，记录日志
	if (MinPrice != MAX_PRICE)
	{
		CTime tm = CTime::GetCurrentTime();
		CString szTime = tm.Format("%H:%M:%S (%Y-%m-%d)");
		szTmp.Format("%s - %d, %s, %s, %s(%s)->%s(%s), RMB: %s / %s.", 
					szTime,
					Selected,
					pDoc->GetAirTicketInfo(Selected, COMPANY), 
					pDoc->GetAirTicketInfo(Selected, FLIGHT_DATE),
					pDoc->GetAirTicketInfo(Selected, DEPART_AIRPORT),
					pDoc->GetAirTicketInfo(Selected, DEPART_TIME),
					pDoc->GetAirTicketInfo(Selected, ARRIVE_AIRPORT),
					pDoc->GetAirTicketInfo(Selected, ARRIVE_TIME),
					pDoc->GetAirTicketInfo(Selected, PRICE),
					pDoc->GetAirTicketInfo(Selected, SITE));
		pLogList->InsertString(0, szTmp);
	}
	
	// 最低票按钮
	if(MinPrice != MAX_PRICE)
	{
		szTmp.Format("最低票价: %d RMB", MinPrice);
	}
	else
	{
		szTmp.Format("此航班无票");
	}
	CButton* pButton = (CButton*)GetDlgItem(IDC_BUTTON);
	pButton->SetWindowText(szTmp);
	pButton->EnableWindow();

	// 特价票警告
	if (MinPrice < MyPageFirst.m_PriceLine)
	{
		if (IDOK == MessageBox("发现特价票，是否访问该订票网站？", "发现特价票", MB_YESNO))
		{
			OnButtonGo();
		}
	}

}

void CTicketView::OnClickTicketList(NMHDR* pNMHDR, LRESULT* pResult) 
{
	// TODO: Add your control notification handler code here
}

void CTicketView::OnButtonGo() 
{
	// TODO: Add your control notification handler code here
    // ShellExecute(0, _T("open"), "iexplore", NULL, NULL, SW_SHOWMAXIMIZED);
	// ShellExecute(0, _T("open"), "http://www.163.com", NULL, NULL, SW_SHOWMAXIMIZED);
	ShellExecute(0, _T("open"), szUrl, NULL, NULL, SW_SHOWNORMAL);
}

#define MIN_S (1000 * 60)
void CTicketView::OnButtonProperty() 
{
	// TODO: Add your command handler code here
	CPropertySheet MySheet("设置");

	MySheet.AddPage(&MyPageFirst);
	if (IDOK == MySheet.DoModal())
	{
		// TODO: 
	}

	if(TRUE == MyPageFirst.m_TimerEnable)
	{
		SetTimer(0, MyPageFirst.m_RefreshTime * MIN_S, NULL);
	}
}

void CTicketView::OnTimer(UINT nIDEvent) 
{
	// TODO: Add your message handler code here and/or call default
	OnButtonRun();
	CFormView::OnTimer(nIDEvent);
}

void CTicketView::OnDblclkTicketList(NMHDR* pNMHDR, LRESULT* pResult) 
{
	// TODO: Add your control notification handler code here
	CTicketDoc* pDoc = GetDocument();

	CListCtrl* pTicketList = (CListCtrl*)GetDlgItem(IDC_TICKET_LIST);
	szUrl = pDoc->GetAirTicketInfo(pTicketList->GetNextItem(-1,  LVNI_SELECTED), URL);
	OnButtonGo();

	*pResult = 0;
}
