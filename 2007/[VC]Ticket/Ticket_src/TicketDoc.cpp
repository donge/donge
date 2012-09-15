// TicketDoc.cpp : implementation of the CTicketDoc class
//

#include "stdafx.h"
#include "Ticket.h"

#include "TicketDoc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CTicketDoc

IMPLEMENT_DYNCREATE(CTicketDoc, CDocument)

BEGIN_MESSAGE_MAP(CTicketDoc, CDocument)
	//{{AFX_MSG_MAP(CTicketDoc)
		// NOTE - the ClassWizard will add and remove mapping macros here.
		//    DO NOT EDIT what you see in these blocks of generated code!
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CTicketDoc construction/destruction

CTicketDoc::CTicketDoc()
{
	// TODO: add one-time construction code here
}

CTicketDoc::~CTicketDoc()
{
}

BOOL CTicketDoc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CTicketDoc serialization

void CTicketDoc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: add storing code here
	}
	else
	{
		// TODO: add loading code here
	}
}

/////////////////////////////////////////////////////////////////////////////
// CTicketDoc diagnostics

#ifdef _DEBUG
void CTicketDoc::AssertValid() const
{
	CDocument::AssertValid();
}

void CTicketDoc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CTicketDoc commands


CString CTicketDoc::GetAirTicketInfo(int id, int type)
{
	ASSERT(id < MyTable.TableSize());

	CString szTmp;
	switch (type)
	{
	case FLIGHT_DATE:
		return MyTable.GetAirTicket(id).Date;
	case FLIGHT_SN:
		return MyTable.GetAirTicket(id).FlightSn;
    case PRICE:
		szTmp.Format("%d", MyTable.GetAirTicket(id).Price);
		return szTmp;
	case SITE:
		return MyTable.GetAirTicket(id).Site;
	case URL:
		return MyTable.GetAirTicket(id).Url;
	case DEPART_TIME:
		return MyTable.GetAirTicket(id).DepartTime;
	case ARRIVE_TIME:
		return MyTable.GetAirTicket(id).ArriveTime;
    case DEPART_AIRPORT:
		return MyTable.GetAirTicket(id).DepartAirport;
    case ARRIVE_AIRPORT:
		return MyTable.GetAirTicket(id).ArriveAirport;
	case COMPANY:
		return MyTable.GetAirTicket(id).Company;
	case PLANE_TYPE:
		return MyTable.GetAirTicket(id).PlaneType;
	case TIME_STAMP:
		return MyTable.GetAirTicket(id).TimeStamp;
	default:
		ASSERT(0);
	}
	return  _T("");
}

extern CString GetAirportAbbr(CString);
void CTicketDoc::GetWebInfo(CString szDepart, CString szArrive, CString szDate)
{
	CString szDepartAbbr = GetAirportAbbr(szDepart);
	CString szArriveAbbr = GetAirportAbbr(szArrive);
	// 调整时间参数2000-1-1 => 2000-01-01
	if (szDate[6] == '-')
	{
		szDate.Insert(5, '0');
	}
	if (szDate.GetLength() == 9)
	{
		szDate.Insert(8, '0');
	}

	// kooxoo格式
	// http://jipiao.kooxoo.com/fcgi-bin/fast_air_search_wrap?len=0&kxlog=kxjpsearch_i&
	// t=%E5%8C%97%E4%BA%AC&From=PEK&q=%E5%A4%A7%E8%BF%9E&to=DLC&date=2008-02-05&fromCity=%E5%8C%97%E4%BA%AC
	CString Url = "http://jipiao.kooxoo.com/fcgi-bin/fast_air_search_wrap?len=0&kxlog=kxjpsearch_i&t=" +
				  szDepart +  "&From=" + szDepartAbbr + "&q=" +   
				  szArrive +  "&to="  + szArriveAbbr + "&date=" + 
				  szDate +  "&fromCity=" +
				  szDepartAbbr;

	WebFetcher MyFetcher(Url);
	MyTable.Clear();
	MyFetcher.Run();
	MyFetcher.Parse(MyTable);

	// 重名机场,bug
	if("北京" == szDepart || "北京" == szArrive || "上海" == szDepart || "上海" == szArrive)
	{
		if ("北京" == szDepart) szDepartAbbr = "NAY";
		if ("上海" == szDepart) szDepartAbbr = "PVG";
		if ("北京" == szArrive) szArriveAbbr = "NAY";
		if ("上海" == szArrive) szArriveAbbr = "PVG";

		Url = "http://jipiao.kooxoo.com/fcgi-bin/fast_air_search_wrap?len=0&kxlog=kxjpsearch_i&t=" +
			  szDepart + "&From=" + szDepartAbbr + "&q=" +   
			  szArrive +  "&to="  + szArriveAbbr + "&date=" + 
			  szDate +  "&fromCity=" +
			  szDepartAbbr;
		MyFetcher.Url = Url;
		MyFetcher.Run();
		MyFetcher.Parse(MyTable);
	}
}
