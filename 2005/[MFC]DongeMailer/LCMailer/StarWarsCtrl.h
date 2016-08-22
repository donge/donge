#if !defined(AFX_STARWARSCTRL_H__B75B0B9E_367D_11D6_AB38_00D0B70C3D79__INCLUDED_)
#define AFX_STARWARSCTRL_H__B75B0B9E_367D_11D6_AB38_00D0B70C3D79__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// StarWarsCtrl.h : header file
//

#define NUM_STARS 100


//##ModelId=43B25EC1000F
class CStarWarsCtrl : public CStatic
{
	//##ModelId=43B25EC10222
	struct CStar
	{
		//##ModelId=43B25EC10242
		int x;
		//##ModelId=43B25EC10243
		int y;
		//##ModelId=43B25EC10251
		int z;
	};

	//##ModelId=43B25EC1002F
	CStar m_StarArray[NUM_STARS];
		
// Construction
public:
	//##ModelId=43B25EC1003E
	CStarWarsCtrl();

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CStarWarsCtrl)
	protected:
	//##ModelId=43B25EC1003F
	virtual void PreSubclassWindow();
	//}}AFX_VIRTUAL

// Implementation
public:
	//##ModelId=43B25EC1004E
	void AddTextLine(LPCTSTR lpszText);
	//##ModelId=43B25EC1005D
	void SetStarSpeed(int nSpeed);
	//##ModelId=43B25EC1005F
	void SetScrollSpeed(int nSpeed);
	//##ModelId=43B25EC1006E
	virtual ~CStarWarsCtrl();

	// Generated message map functions
protected:
	//##ModelId=43B25EC1007D
	int m_nStarsSpeed;
	//##ModelId=43B25EC100CB
	int m_nScrollSpeed;
	//##ModelId=43B25EC100DA
	int m_nScrollPos;
	//##ModelId=43B25EC100EA
	void DoScrollText(CDC *pDC);
	//##ModelId=43B25EC100FB
	void DoStars(CDC *pDC);
	//##ModelId=43B25EC1010A
	void InvalidateCtrl();

	//##ModelId=43B25EC1011A
	CFont m_Font;

	//##ModelId=43B25EC10128
	CRect  m_rectClient;

	//##ModelId=43B25EC10149
	CDC     m_MainDC;
	//##ModelId=43B25EC10158
	CBitmap m_MainBitmap;

	//##ModelId=43B25EC10178
	CBitmap *m_pOldBitmap;

	//##ModelId=43B25EC10187
	CStringArray m_TextLines;
	//{{AFX_MSG(CStarWarsCtrl)
	//##ModelId=43B25EC10196
	afx_msg void OnPaint();
	//##ModelId=43B25EC101A6
	afx_msg void OnSize(UINT nType, int cx, int cy);
	//##ModelId=43B25EC101D4
	afx_msg void OnTimer(UINT nIDEvent);
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_STARWARSCTRL_H__B75B0B9E_367D_11D6_AB38_00D0B70C3D79__INCLUDED_)
