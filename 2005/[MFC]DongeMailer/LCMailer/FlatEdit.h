#if !defined(AFX_FLATEDIT_H__1D80B920_5AC8_11D2_B1E0_525400DAACF0__INCLUDED_)
#define AFX_FLATEDIT_H__1D80B920_5AC8_11D2_B1E0_525400DAACF0__INCLUDED_

#if _MSC_VER >= 1000
#pragma once
#endif // _MSC_VER >= 1000
// FlatEdit.h : header file
//
#define FE_MOUSEOVER 1
#define FE_MOUSEOUT 2

/////////////////////////////////////////////////////////////////////////////
// CFlatEdit window

//##ModelId=43B25EC9009C
class CFlatEdit : public CEdit
{
// Construction
public:
	//##ModelId=43B25EC900AC
	CFlatEdit();
	//##ModelId=43B25EC900AD
	void DrawEdit(int style, COLORREF clrTopLeft, COLORREF clrBottomRight);
	//##ModelId=43B25EC900BE
	bool m_bDrawGripper;
	//##ModelId=43B25EC900CB
	bool m_bDrawSeperator;
	//##ModelId=43B25EC900DA
	void SetIndent(int margin);
	//##ModelId=43B25EC900EA
	bool m_bFlatStyle;		//We got 2 flat styles, true is to make it 'Microsoft Flat'
						// false is to make it look like the heavy border around check boxes that are flat
	

// Attributes
public:
	//##ModelId=43B25EC900EB
	bool m_bLBtnDown;
	//##ModelId=43B25EC900FA
	COLORREF m_clrHilite;
	//##ModelId=43B25EC90109
	COLORREF m_clrShadow;
	//##ModelId=43B25EC9010A
	COLORREF m_clrDkShad;
	//##ModelId=43B25EC90119
	COLORREF m_clrButton;

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CFlatEdit)
	//}}AFX_VIRTUAL

// Implementation
public:
	//##ModelId=43B25EC90128
	virtual ~CFlatEdit();

	// Generated message map functions
protected:
	//{{AFX_MSG(CFlatEdit)
	//##ModelId=43B25EC9012A
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	//##ModelId=43B25EC9013A
	afx_msg void OnPaint();
	//##ModelId=43B25EC90148
	afx_msg void OnLButtonUp(UINT nFlags, CPoint point);
	//##ModelId=43B25EC90159
	afx_msg void OnMouseMove(UINT nFlags, CPoint point);
	//##ModelId=43B25EC90169
	afx_msg void OnSysColorChange();
	//##ModelId=43B25EC90178
	afx_msg void OnTimer(UINT nIDEvent);
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Developer Studio will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_FLATEDIT_H__1D80B920_5AC8_11D2_B1E0_525400DAACF0__INCLUDED_)
