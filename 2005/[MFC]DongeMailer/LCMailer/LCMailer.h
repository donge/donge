// LCMailer.h : main header file for the LCMAILER application
//

#if !defined(AFX_LCMAILER_H__EF38D7FC_466F_4402_8B6F_B247CA181349__INCLUDED_)
#define AFX_LCMAILER_H__EF38D7FC_466F_4402_8B6F_B247CA181349__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CLCMailerApp:
// See LCMailer.cpp for the implementation of this class
//

//##ModelId=43B25EC9005D
class CLCMailerApp : public CWinApp
{
public:
	//##ModelId=43B25EC9006E
	CLCMailerApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CLCMailerApp)
	public:
	//##ModelId=43B25EC9007D
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CLCMailerApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_LCMAILER_H__EF38D7FC_466F_4402_8B6F_B247CA181349__INCLUDED_)
