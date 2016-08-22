#if !defined(AFX_MACBUTTONS_H__B9D2AA55_ABF4_11D3_90F4_0020AFBC499D__INCLUDED_)
#define AFX_MACBUTTONS_H__B9D2AA55_ABF4_11D3_90F4_0020AFBC499D__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
//
// MacButtons.h : header file
//
// Feel free to modifiy and/or distribute this file, but
// do not remove this header.
//
// I would appreciate a notification of any bugs discovered or 
// improvements that could be made.
//
// This file is provided "as is" with no expressed or implied warranty.
//
/////////////////////////////////////////////////////////////////////////////


#define CHECKBOX_HEIGHT		12

#define TYPE_STANDARD	0
#define TYPE_CHECKBOX	1
#define TYPE_RADIO		2
#define TYPE_MORE			3

#define IMAGE_EFFECT_NONE		0
#define IMAGE_EFFECT_RAISED	1
#define IMAGE_EFFECT_SUNKEN	2

#define CHECK_STYLE_CHECK	0
#define CHECK_STYLE_CROSS	1

/////////////////////////////////////////////////////////////////////////////
//
//	CMacButton class, version 2.0
//
//	Copyright (c) 1999 Paul Meidinger (pmmeidinger@yahoo.com)
//
//	History:
//		PMM	12/13/1999		Initial implementation.		
//
//		PMM	12/29/1999		Minor changes made.
//
/////////////////////////////////////////////////////////////////////////////

//##ModelId=43B25EC3029F
class CMacButton : public CButton
{

// Construction
public:
	//##ModelId=43B25EC302B0
	CMacButton();

// Attributes
public:

// Operations
public:
	//##ModelId=43B25EC3035B
	void SetCheck(int nCheck);							// Sets the button's checked state
	//##ModelId=43B25EC3038A
	int GetCheck() const;								// Gets the button's checked state
	//##ModelId=43B25EC303A9
	void SetBold(BOOL bBold = TRUE);					// Sets the button's bold flag
	//##ModelId=43B25EC303D8
	BOOL GetBold() const;								// Gets the button's bold flag

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMacButton)
	public:
	//##ModelId=43B25EC4000F
	virtual void DrawItem(LPDRAWITEMSTRUCT lpDrawItemStruct);
	protected:
	//##ModelId=43B25EC400BB
	virtual void PreSubclassWindow();
	//}}AFX_VIRTUAL

// Implementation
public:
	//##ModelId=43B25EC40157
	void SetImageEffect(int nEffect);					// Sets the image effect
	//##ModelId=43B25EC40186
	HICON SetIcon(HICON hIcon);							// Sets the button's icon
	//##ModelId=43B25EC401D4
	HBITMAP SetBitmap(HBITMAP hBitmap);					// Sets the button's bitmap
	//##ModelId=43B25EC40222
	virtual ~CMacButton();

	// Generated message map functions
protected:
	//{{AFX_MSG(CMacButton)
	//##ModelId=43B25EC402BF
	afx_msg void OnSysColorChange();
	//##ModelId=43B25EC4032C
	afx_msg void OnLButtonDblClk(UINT nFlags, CPoint point);
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()
protected:
	//##ModelId=43B25EC40399
	BOOL m_bBold;
	//##ModelId=43B25EC403A9
	int m_nCheckStyle;
	//##ModelId=43B25EC403B9
	int m_nImageEffect;
	//##ModelId=43B25EC403C8
	int m_nType;

	//##ModelId=43B25EC403D8
	void DrawButton(LPDRAWITEMSTRUCT lpDIS);
	//##ModelId=43B25EC5008C
	void DrawCheckBox(CDC *pDC, CRect rect, UINT nStyle, UINT nState);
	//##ModelId=43B25EC50138
	void DrawRadioButton(CDC *pDC, CRect rect, UINT nStyle, UINT nState);

	//##ModelId=43B25EC501D4
	void DrawPushLikeButton(CDC *pDC, const CRect &rect, UINT nStyle, UINT nState);
	//##ModelId=43B25EC50213
	void DrawPressedPushButton(CDC *pDC, const CRect &rect);
	//##ModelId=43B25EC50261
	void DrawUnpressedPushButton(CDC *pDC, const CRect &rect);
	//##ModelId=43B25EC502AF
	void DrawCornerShadows(CDC *pDC, const CRect &rect);

	//##ModelId=43B25EC502EE
	void DrawImage(CDC *pDC, CRect &rect, UINT nStyle, UINT nState);
	//##ModelId=43B25EC5035B
	void DrawButtonText(CDC *pDC, CRect &rect, const CString &sText, UINT nStyle, UINT nState);

	//##ModelId=43B25EC50399
	HBITMAP GetDitherBitmap(CDC *pDC, COLORREF crColor1, COLORREF crColo2);
	//##ModelId=43B25EC60000
	CRect GetCheckRect(const CRect &rect, UINT nStyle);
	//##ModelId=43B25EC6004E
	void RedrawCheck();

	//##ModelId=43B25EC6007D
	COLORREF LightenColor(COLORREF crColor, BYTE byIncreaseVal);
	//##ModelId=43B25EC6008D
	COLORREF DarkenColor(COLORREF crColor, BYTE byReduceVal);

	//##ModelId=43B25EC6009D
	CSize m_sizeImage;
	//##ModelId=43B25EC600AB
	HICON m_hIcon;
	//##ModelId=43B25EC600BB
	HBITMAP m_hBitmap;

	//##ModelId=43B25EC600CB
	BOOL m_bMouseDown;
	//##ModelId=43B25EC600DA
	int m_nCheck;

	//##ModelId=43B25EC600EA
	void CreatePens();
	//##ModelId=43B25EC60148
	void DeletePens();
	//##ModelId=43B25EC60197
	CPen m_penHilight;
	//##ModelId=43B25EC601B6
	CPen m_penFace;
	//##ModelId=43B25EC601C6
	CPen m_penLiteFace;
	//##ModelId=43B25EC601E5
	CPen m_penLiteShadow;
	//##ModelId=43B25EC60203
	CPen m_penShadow;
	//##ModelId=43B25EC60214
	CPen m_penDkShadow;
	//##ModelId=43B25EC60233
	CPen m_penDarkDkShadow;

	//##ModelId=43B25EC60242
	void GetColors();
	//##ModelId=43B25EC602AF
	COLORREF m_crHilight;
	//##ModelId=43B25EC602BF
	COLORREF m_crLiteFace;
	//##ModelId=43B25EC602CE
	COLORREF m_crFace;
	//##ModelId=43B25EC602EE
	COLORREF m_crLiteShadow;
	//##ModelId=43B25EC602FD
	COLORREF m_crShadow;
	//##ModelId=43B25EC6031C
	COLORREF m_crDkShadow;
	//##ModelId=43B25EC6033C
	COLORREF m_crDarkDkShadow;

private:
	//##ModelId=43B25EC6034B
	void DrawStandardButton(CDC *pDC, const CRect &rect, UINT nStyle, UINT nState);
};


/////////////////////////////////////////////////////////////////////////////
//
//	CMacCheckBox class, version 2.0
//
//	Copyright (c) 1999, 2000 Paul M. Meidinger (pmmeidinger@yahoo.com)
//
// Thanks to:
//		Eric Hwang <erichw@21cn.com>
//			For fixing the problem that was not sending a message
//			to the parent when the button was clicked.
//
//	History:
//		PMM	12/13/1999		Initial implementation.		
//
//		PMM	12/17/1999		Modified drawing code to use a memory DC. 
//									Added CPen member variables in an attempt to 
//									speed up drawing. Made other minor changes.
//
//		PMM	12/29/1999		Fixed a bug that would not send a message to the parent
//									when the button was clicked (fix by Eric Hwang). Added
//									code to draw a push-like button when that style is used.
//
/////////////////////////////////////////////////////////////////////////////

//##ModelId=43B25EC7009C
class CMacCheckBox : public CMacButton
{
	
// Construction
public:
	//##ModelId=43B25EC700AC
	CMacCheckBox();

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMacCheckBox)
	public:
	//##ModelId=43B25EC700CB
	virtual void DrawItem(LPDRAWITEMSTRUCT lpDrawItemStruct);
	protected:
	//}}AFX_VIRTUAL

// Implementation
public:
	//##ModelId=43B25EC700FA
	void SetCheckStyle(int nStyle = CHECK_STYLE_CHECK);	// Sets the check style
	//##ModelId=43B25EC70119
	int GetCheckStyle() const;										// Gets the check style
	//##ModelId=43B25EC70128
	virtual ~CMacCheckBox();

	// Generated message map functions
protected:
	//{{AFX_MSG(CMacCheckBox)
	//##ModelId=43B25EC70148
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	//##ModelId=43B25EC70177
	afx_msg void OnLButtonUp(UINT nFlags, CPoint point);
	//##ModelId=43B25EC701A5
	afx_msg void OnKeyUp(UINT nChar, UINT nRepCnt, UINT nFlags);
	//##ModelId=43B25EC701C5
	afx_msg void OnMouseMove(UINT nFlags, CPoint point);
	//##ModelId=43B25EC701F4
	afx_msg void OnLButtonDblClk(UINT nFlags, CPoint point);
	//##ModelId=43B25EC70213
	afx_msg void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////
//
//	CMacRadioButton class, version 2.0
//
//	Copyright (c) 1999, 2000 Paul M. Meidinger (pmmeidinger@yahoo.com)
//
// Thanks to:
//		Eric Hwang <erichw@21cn.com>
//			For fixing the problem that was not sending a message
//			to the parent when the button was clicked.
//
//	History:
//		PMM	12/13/1999		Initial implementation.		
//
//		PMM	12/17/1999		Modified drawing code to use a memory DC. 
//									Added CPen member variables in an attempt to 
//									speed up drawing. Made other minor changes.
//
//		PMM	12/29/1999		Fixed a bug that was not checking the radio
//									and unchecking others when the space bar is pressed.
//									Fixed a bug that would not send a message to the parent
//									when the button was clicked (fix by Eric Hwang). Added
//									code to draw a push-like button when that style is used.
//
/////////////////////////////////////////////////////////////////////////////

//##ModelId=43B25EC702BF
class CMacRadioButton : public CMacButton
{

// Construction
public:
	//##ModelId=43B25EC702CF
	CMacRadioButton();

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMacRadioButton)
	public:
	//##ModelId=43B25EC702DE
	virtual void DrawItem(LPDRAWITEMSTRUCT lpDrawItemStruct);
	//##ModelId=43B25EC702FD
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	protected:
	//}}AFX_VIRTUAL

// Implementation
public:
	//##ModelId=43B25EC7030D
	virtual ~CMacRadioButton();

	// Generated message map functions
protected:
	//{{AFX_MSG(CMacRadioButton)
	//##ModelId=43B25EC7032C
	afx_msg void OnLButtonUp(UINT nFlags, CPoint point);
	//##ModelId=43B25EC7034B
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	//##ModelId=43B25EC7036B
	afx_msg void OnMouseMove(UINT nFlags, CPoint point);
	//##ModelId=43B25EC7037A
	afx_msg void OnLButtonDblClk(UINT nFlags, CPoint point);
	//##ModelId=43B25EC70399
	afx_msg void OnSysColorChange();
	//##ModelId=43B25EC703A9
	afx_msg void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
	//##ModelId=43B25EC703C8
	afx_msg void OnKeyUp(UINT nChar, UINT nRepCnt, UINT nFlags);
	//##ModelId=43B25EC80000
	afx_msg void OnSetFocus(CWnd* pOldWnd);
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()
private:
	//##ModelId=43B25EC80010
	void UncheckOtherRadios();
};


/////////////////////////////////////////////////////////////////////////////
//
//	CMacMoreButton class, version 2.0
//
//	Copyright (c) 2000 Paul M. Meidinger (pmmeidinger@yahoo.com)
//
//	History:
//		PMM	1/21/2000		Initial implementation.		
//
/////////////////////////////////////////////////////////////////////////////

#define ALIGN_TEXT_LEFT		0
#define ALIGN_TEXT_RIGHT	1

//##ModelId=43B25EC8007D
class CMacMoreButton : public CMacButton
{
// Construction
public:
	//##ModelId=43B25EC8009C
	CMacMoreButton();

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMacMoreButton)
	public:
	//##ModelId=43B25EC8009D
	virtual void DrawItem(LPDRAWITEMSTRUCT lpDrawItemStruct);
	protected:
	//##ModelId=43B25EC800AC
	virtual void PreSubclassWindow();
	//}}AFX_VIRTUAL

// Implementation
public:
	//##ModelId=43B25EC800BB
	void SetTextAlign(int nAlign);			// Sets the text alignment
	//##ModelId=43B25EC800CB
	BOOL GetMoreShown() const;					// Gets the flag specifying whether "more" is shown
	//##ModelId=43B25EC800CD
	void SetColor(COLORREF crColor);			// Sets the button color
	//##ModelId=43B25EC800DB
	virtual ~CMacMoreButton();

	// Generated message map functions
protected:
	//##ModelId=43B25EC800DD
	BOOL m_bDoEffect;
	//{{AFX_MSG(CMacMoreButton)
	//##ModelId=43B25EC800EA
	afx_msg void OnLButtonUp(UINT nFlags, CPoint point);
	//##ModelId=43B25EC80109
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()
private:
	//##ModelId=43B25EC80119
	int m_nAlignText;
	//##ModelId=43B25EC80128
	BOOL m_bMoreShown;
	//##ModelId=43B25EC80138
	BOOL m_bMouseDown;
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_MACBUTTONS_H__B9D2AA55_ABF4_11D3_90F4_0020AFBC499D__INCLUDED_)
