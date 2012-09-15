// AirTicket.cpp: implementation of the AirTicket class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "Ticket.h"
#include "AirTicket.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

AirTicket::AirTicket()
{

}

AirTicket::AirTicket(   CString		Date,
						CString		FlightSn,
						UINT4		Price,
						CString		Site,
						CString		Url,
						CString		DepartTime,
						CString		ArriveTime,
						CString		DepartAirport,
						CString		ArriveAirport,
						CString		Company,
						CString		PlaneType,
						CString		TimeStamp	):
						Date(Date),
						FlightSn(FlightSn),
						Price(Price),
						Site(Site),						
						Url(Url),
						DepartTime(DepartTime),
						ArriveTime(ArriveTime),
						DepartAirport(DepartAirport),
						ArriveAirport(ArriveAirport),
						Company(Company),
						PlaneType(PlaneType),
						TimeStamp(TimeStamp)
{
}

AirTicket::~AirTicket()
{

}
