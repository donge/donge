// AirTicketTable.cpp: implementation of the AirTicketTable class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "Ticket.h"
#include "AirTicketTable.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

AirTicketTable::AirTicketTable()
{

}

AirTicketTable::~AirTicketTable()
{

}

void AirTicketTable::Clear()
{
	Table.clear();
}

int AirTicketTable::Add(AirTicket MyAirTicket)
{
	Table.push_back(MyAirTicket);
	return 0;
}

AirTicket AirTicketTable::GetAirTicket(int id)
{
	ASSERT(id < Table.size());
	return Table[id];
}

int AirTicketTable::TableSize()
{
	return Table.size();
}
