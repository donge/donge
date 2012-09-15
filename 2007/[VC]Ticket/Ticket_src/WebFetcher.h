// WebFetcher.h: interface for the WebFetcher class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_WEBFETCHER_H__AD7D905A_BA82_440B_AB6E_93946521D077__INCLUDED_)
#define AFX_WEBFETCHER_H__AD7D905A_BA82_440B_AB6E_93946521D077__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
typedef char CHAR;
#include "AirTicketTable.h"

class WebFetcher  
{
	CHAR       *pContent;

public:
	CString		Url;

	void UTF_8ToGB2312();
	void Parse(AirTicketTable &MyTable);
	CHAR *GetHttp (LPCSTR lpServerName);
	void Run();
	WebFetcher();
	WebFetcher(CString Url);
	virtual ~WebFetcher();
};

#endif // !defined(AFX_WEBFETCHER_H__AD7D905A_BA82_440B_AB6E_93946521D077__INCLUDED_)
