// MailViewDlg.cpp : implementation file
//

#include "stdafx.h"
#include "LCMailer.h"
#include "MailViewDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CMailViewDlg dialog


//##ModelId=43B25EC30109
CMailViewDlg::CMailViewDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CMailViewDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CMailViewDlg)
	m_szSubject = _T("");
	szMailView = _T("");
	m_szDate = _T("");
	m_szTo = _T("");
	//}}AFX_DATA_INIT
}


//##ModelId=43B25EC30138
void CMailViewDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CMailViewDlg)
	DDX_Text(pDX, IDC_STATIC_SUBJECT, m_szSubject);
	DDX_Text(pDX, IDC_EDIT_MAIL, szMailView);
	DDX_Text(pDX, IDC_STATIC_DATE, m_szDate);
	DDX_Text(pDX, IDC_STATIC_TO, m_szTo);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CMailViewDlg, CDialog)
	//{{AFX_MSG_MAP(CMailViewDlg)
	ON_BN_CLICKED(IDC_BUTTON_RE, OnButtonRe)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMailViewDlg message handlers

//##ModelId=43B25EC30149
BOOL CMailViewDlg::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	char temp[50];
	GetSub(temp, "Subject:");
	m_szSubject = temp;
	GetSub(temp, "Date:");
	m_szDate = temp;
	GetSub(temp, "FROM:");
	m_szTo = temp;

	UpdateData(FALSE);

	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

//##ModelId=43B25EC300EA
bool CMailViewDlg::GetSub(char *sub, const char *buf)
{
	char* p = strstr(szMailView, buf);
	if ( p == NULL )
		return false;

	p = p + strlen(buf) + 1;
	for (int i = 0; i < 50; i++) {
		if ( p[i] == '\r' || p[i] == '\n' ) {
			sub[i] = '\0';
			break;
		}
		sub[i] = p[i];
	}
	return true;

}

//##ModelId=43B25EC30158
void CMailViewDlg::OnButtonRe() 
{
	// TODO: Add your control notification handler code here
	m_pLCMailerDlg->m_ctrlTo.SetWindowText(m_szTo);
	m_pLCMailerDlg->m_ctrlSubject.SetWindowText("Re: " + m_szSubject);

	CDialog::OnOK();
}
