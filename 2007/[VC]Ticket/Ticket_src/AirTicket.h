// AirTicket.h: interface for the AirTicket class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_AIRTICKET_H__E3829F5F_9C84_448B_9353_67C7BF8C6713__INCLUDED_)
#define AFX_AIRTICKET_H__E3829F5F_9C84_448B_9353_67C7BF8C6713__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
typedef unsigned int UINT4;

class AirTicket  
{
//private:
public:
	CString		Date;
	CString		FlightSn;
	UINT4		Price;
	CString		Site;
	CString		Url;
	CString		DepartTime;
	CString		ArriveTime;
	CString		DepartAirport;
	CString		ArriveAirport;
	CString		Company;
	CString		PlaneType;
	CString		TimeStamp;

public:
	AirTicket();
	AirTicket(  CString		Date,
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
				CString		TimeStamp	);
	virtual ~AirTicket();

};

#endif // !defined(AFX_AIRTICKET_H__E3829F5F_9C84_448B_9353_67C7BF8C6713__INCLUDED_)
