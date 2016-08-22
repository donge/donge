// ServerSetup.cpp : implementation file
//

#include "stdafx.h"
#include "LCMailer.h"
#include "ServerSetup.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CServerSetup dialog


//##ModelId=43B25EC200AC
CServerSetup::CServerSetup(CWnd* pParent /*=NULL*/)
	: CDialog(CServerSetup::IDD, pParent)
{
	//{{AFX_DATA_INIT(CServerSetup)
	//}}AFX_DATA_INIT
}


//##ModelId=43B25EC20167
void CServerSetup::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CServerSetup)
	DDX_Control(pDX, IDC_EDIT_FROM, m_ctrlFrom);
	DDX_Control(pDX, IDC_CHECK_NEEDAUTH, m_ctrlNeedAuth);
	DDX_Control(pDX, IDC_EDIT_ACCOUNT, m_ctrlAccount);
	DDX_Control(pDX, IDOK, m_ctrlOK);
	DDX_Control(pDX, IDCANCEL, m_ctrlCancel);
	DDX_Control(pDX, IDC_EDIT_USERNAME, m_ctrlUsername);
	DDX_Control(pDX, IDC_EDIT_SERVERNAME, m_ctrlServerName);
	DDX_Control(pDX, IDC_EDIT_PORT, m_ctrlPort);
	DDX_Control(pDX, IDC_EDIT_PASSWORD, m_ctrlPassword);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CServerSetup, CDialog)
	//{{AFX_MSG_MAP(CServerSetup)
	ON_BN_CLICKED(IDC_CHECK_NEEDAUTH, OnCheckNeedAuth)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CServerSetup message handlers

//##ModelId=43B25EC20186
void CServerSetup::OnCheckNeedAuth() 
{
	// TODO: Add your control notification handler code here
	m_ctrlAccount.EnableWindow(m_ctrlNeedAuth.GetCheck());
	m_ctrlPassword.EnableWindow(m_ctrlNeedAuth.GetCheck());
}

//##ModelId=43B25EC20196
BOOL CServerSetup::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here

	m_ctrlServerName.SetWindowText(m_pLCMailerDlg->m_szServerName);
	m_ctrlPort.SetWindowText(m_pLCMailerDlg->m_nPort);
	m_ctrlNeedAuth.SetCheck(atoi(m_pLCMailerDlg->m_nNeedAuth));
	m_ctrlAccount.SetWindowText(m_pLCMailerDlg->m_szAccount);
	m_ctrlPassword.SetWindowText(m_pLCMailerDlg->m_szPassword);
	m_ctrlFrom.SetWindowText(m_pLCMailerDlg->m_szFrom);
	m_ctrlUsername.SetWindowText(m_pLCMailerDlg->m_szUsername);

	m_ctrlAccount.EnableWindow(atoi(m_pLCMailerDlg->m_nNeedAuth));
	m_ctrlPassword.EnableWindow(atoi(m_pLCMailerDlg->m_nNeedAuth));

	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

//##ModelId=43B25EC20198
void CServerSetup::OnOK() 
{
	// TODO: Add extra validation here

	CString szBuf;

	//返回“SMTP服务器”：
	m_ctrlServerName.GetWindowText(szBuf);
	m_pLCMailerDlg->m_szServerName = szBuf;

	//返回“端口”：
	m_ctrlPort.GetWindowText(szBuf);
	m_pLCMailerDlg->m_nPort = szBuf;

	//返回“需要验证”：
	szBuf.Format("%d", m_ctrlNeedAuth.GetCheck());
	m_pLCMailerDlg->m_nNeedAuth = szBuf;

	//返回“用户帐号”：
	m_ctrlAccount.GetWindowText(szBuf);
	m_pLCMailerDlg->m_szAccount = szBuf;

	//返回“用户密码”：
	m_ctrlPassword.GetWindowText(szBuf);
	m_pLCMailerDlg->m_szPassword = szBuf;

	//返回“发信人信箱”：
	m_ctrlFrom.GetWindowText(szBuf);
	m_pLCMailerDlg->m_szFrom = szBuf;

	//返回“发信人姓名”：
	m_ctrlUsername.GetWindowText(szBuf);
	m_pLCMailerDlg->m_szUsername = szBuf;

	CDialog::OnOK();
}
