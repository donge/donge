// AirTicketTable.h: interface for the AirTicketTable class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_AIRTICKETTABLE_H__005FD12D_9922_4E03_9488_6D05B5EDB7F7__INCLUDED_)
#define AFX_AIRTICKETTABLE_H__005FD12D_9922_4E03_9488_6D05B5EDB7F7__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include <vector>
#include "AirTicket.h"
using namespace std;

class AirTicketTable  
{
private:
	vector <AirTicket> Table;
public:
	int TableSize();
	AirTicket GetAirTicket(int id);
	int Add (AirTicket MyAirTicket);
	void Clear();
	AirTicketTable();
	virtual ~AirTicketTable();

};

#endif // !defined(AFX_AIRTICKETTABLE_H__005FD12D_9922_4E03_9488_6D05B5EDB7F7__INCLUDED_)
