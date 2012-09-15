// TicketDoc.h : interface of the CTicketDoc class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_TICKETDOC_H__8600A355_B6D0_49E8_BEF8_E8E72BA8B11C__INCLUDED_)
#define AFX_TICKETDOC_H__8600A355_B6D0_49E8_BEF8_E8E72BA8B11C__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include "AirTicketTable.h"
#include "WebFetcher.h"


enum Type
{
	FLIGHT_DATE,
	FLIGHT_SN,
    PRICE,
	SITE,
	URL,
	DEPART_TIME,
	ARRIVE_TIME,
    DEPART_AIRPORT,
    ARRIVE_AIRPORT,
	COMPANY,
	PLANE_TYPE,
	TIME_STAMP,
};

class CTicketDoc : public CDocument
{

protected: // create from serialization only
	CTicketDoc();
	DECLARE_DYNCREATE(CTicketDoc)

// Attributes
public:
 	AirTicketTable MyTable;
// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTicketDoc)
	public:
	virtual BOOL OnNewDocument();
	virtual void Serialize(CArchive& ar);
	//}}AFX_VIRTUAL

// Implementation
public:
	void GetWebInfo(CString from, CString to, CString date);
	CString CTicketDoc::GetAirTicketInfo(int id, int type);
	virtual ~CTicketDoc();
#ifdef _DEBUG
	virtual void AssertValid() const;
	virtual void Dump(CDumpContext& dc) const;
#endif

protected:

// Generated message map functions
protected:
	//{{AFX_MSG(CTicketDoc)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TICKETDOC_H__8600A355_B6D0_49E8_BEF8_E8E72BA8B11C__INCLUDED_)
