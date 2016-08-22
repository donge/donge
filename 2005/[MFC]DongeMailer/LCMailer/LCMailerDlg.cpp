// LCMailerDlg.cpp : implementation file
//

#include "StdAfx.h"
#include "LCMailer.h"
#include "LCMailerDlg.h"
#include "ServerSetup.h"
#include "Pop3Dalog.h"
#include "SendDlg.h"
#include "Attachment.h"
#include "base64.h"
#include "pop3.h"
#include "MailViewDlg.h"


#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif


	



/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

//##ModelId=43B25EC902AF
class CAboutDlg : public CDialog
{
public:
	//##ModelId=43B25EC902C0
	CAboutDlg();
	//���Ի���
	//##ModelId=43B25EC902DF
	CLCMailerDlg *m_pLCMailerDlg;

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//##ModelId=43B25EC902EF
	CMacButton	m_ctrlMailMe;
	//##ModelId=43B25EC9030E
	CMacButton	m_ctrlHomepage;
	//##ModelId=43B25EC9032D
	CMacButton	m_OK;
	//##ModelId=43B25EC9034C
	CStarWarsCtrl	m_StarWarsCtrl;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	//##ModelId=43B25EC9035B
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//##ModelId=43B25EC9037A
	virtual BOOL OnInitDialog();
	//##ModelId=43B25EC90399
	afx_msg void OnButtonMailme();
	//##ModelId=43B25EC903A9
	afx_msg void OnButtonHomepage();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//##ModelId=43B25EC902C0
CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

//##ModelId=43B25EC9035B
void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	DDX_Control(pDX, IDC_BUTTON_MAILME, m_ctrlMailMe);
	DDX_Control(pDX, IDC_BUTTON_HOMEPAGE, m_ctrlHomepage);
	DDX_Control(pDX, IDOK, m_OK);
	DDX_Control(pDX, IDC_STATIC_STARWAR, m_StarWarsCtrl);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
	ON_BN_CLICKED(IDC_BUTTON_MAILME, OnButtonMailme)
	ON_BN_CLICKED(IDC_BUTTON_HOMEPAGE, OnButtonHomepage)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CLCMailerDlg dialog

//##ModelId=43B25EC801B6
CLCMailerDlg::CLCMailerDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CLCMailerDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CLCMailerDlg)
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

//##ModelId=43B25EC8031C
void CLCMailerDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CLCMailerDlg)
	DDX_Control(pDX, IDC_STATIC_STATE, m_ctrlState);
	DDX_Control(pDX, IDC_LIST_MAIL, m_ctrlMailList);
	DDX_Control(pDX, IDC_EDIT_BODY, m_ctrlBody);
	DDX_Control(pDX, IDC_EDIT_SUBJECT, m_ctrlSubject);
	DDX_Control(pDX, IDC_EDIT_MAILTO, m_ctrlTo);
	DDX_Control(pDX, IDC_BUTTON_SERVERSETUP, m_ctrlServerSetup);
	DDX_Control(pDX, IDC_BUTTON_SEND, m_ctrlSend);
	DDX_Control(pDX, IDC_BUTTON_EXIT, m_ctrlExit);
	DDX_Control(pDX, IDC_BUTTON_ATTACHMENT, m_ctrlAttachment);
	DDX_Control(pDX, IDC_BUTTON_ABOUT, m_ctrlAbout);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CLCMailerDlg, CDialog)
	//{{AFX_MSG_MAP(CLCMailerDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTON_SERVERSETUP, OnButtonServerSetup)
	ON_BN_CLICKED(IDC_BUTTON_ABOUT, OnButtonAbout)
	ON_BN_CLICKED(IDC_BUTTON_EXIT, OnButtonExit)
	ON_BN_CLICKED(IDC_BUTTON_SEND, OnButtonSend)
	ON_WM_DESTROY()
	ON_BN_CLICKED(IDC_BUTTON_ATTACHMENT, OnButtonAttachment)
	ON_BN_CLICKED(IDC_BTN_POP3SETUP, OnBtnPop3setup)
	ON_BN_CLICKED(IDC_BUTTON_RECV, OnButtonRecv)
	ON_NOTIFY(NM_DBLCLK, IDC_LIST_MAIL, OnDblclkListMail)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CLCMailerDlg message handlers

//##ModelId=43B25EC8035B
BOOL CLCMailerDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.
	//���� ListCtrl �ĸ������ԣ�

	//��� ListCtrl �� rect��
	CRect rect;
	m_ctrlMailList.GetClientRect(rect);

	//���� ListCtrl �� Columns ��
	m_ctrlMailList.InsertColumn(0, "����", LVCFMT_LEFT, 2 * rect.Width() / 3);
	m_ctrlMailList.InsertColumn(1, "����", LVCFMT_LEFT, rect.Width() / 3);



	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon

	// TODO: Add extra initialization here

	//��ʼ��ini�ļ���·����
	GetCurrentDirectory(MAX_PATH, szIniFile.GetBuffer(10));
	szIniFile = szIniFile.GetBuffer(10);
	szIniFile += "\\DMail.ini";

	//��ʼ��NeedAuth��״̬��
	m_nNeedAuth.Format("%d", GetPrivateProfileInt("Server Options", "Need ESMTP", 0, szIniFile));

	//���롰SMTP�������������ݣ�
	GetPrivateProfileString("Server Options", "Server Name", "", m_szServerName.GetBuffer(10), 15, szIniFile);

	//���롰�˿ڡ������ݣ�
	m_nPort.Format("%d", GetPrivateProfileInt("Server Options", "Port", 25, szIniFile));

	//���롰POP3�������������ݣ�
	GetPrivateProfileString("Server Options", "Pop3 Server", "", m_szPop3Server.GetBuffer(10), 15, szIniFile);
	//���롰POP3�˿ڡ������ݣ�
	m_nPop3Port.Format("%d", GetPrivateProfileInt("Server Options", "Pop3 Port", 25, szIniFile));
	
	//���롰�û��ʺš������ݣ�
	GetPrivateProfileString("Server Options", "Data1", "", m_szAccount.GetBuffer(10), 100, szIniFile);

	//���롰�û����롱�����ݣ�
	GetPrivateProfileString("Server Options", "Data2", "", m_szPassword.GetBuffer(10), 100, szIniFile);

	//���롰���������䡱�����ݣ�
	GetPrivateProfileString("User Info", "Mail From", "", m_szFrom.GetBuffer(10), 100, szIniFile);

	//���롰�����������������ݣ�
	GetPrivateProfileString("User Info", "Username", "", m_szUsername.GetBuffer(10), 100, szIniFile);

	szIniFile.ReleaseBuffer();

	return TRUE;  // return TRUE  unless you set the focus to a control
}

//##ModelId=43B25EC8036B
void CLCMailerDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

//##ModelId=43B25EC8038A
void CLCMailerDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
//##ModelId=43B25EC8039A
HCURSOR CLCMailerDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

//##ModelId=43B25EC803A9
void CLCMailerDlg::OnButtonServerSetup() 
{
	// TODO: Add your control notification handler code here
	CServerSetup hSetupDlg;
	hSetupDlg.m_pLCMailerDlg = this;
	hSetupDlg.DoModal();
}

//##ModelId=43B25EC9037A
BOOL CAboutDlg::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here

	//���á�StarWar�����Ǻǡ���
	m_StarWarsCtrl.SetStarSpeed(30);
	m_StarWarsCtrl.SetScrollSpeed(2);
	m_StarWarsCtrl.AddTextLine("��ӭʹ��");
	m_StarWarsCtrl.AddTextLine("");
	m_StarWarsCtrl.AddTextLine("DongeMail 1.0");
	m_StarWarsCtrl.AddTextLine("");
	m_StarWarsCtrl.AddTextLine("");
	m_StarWarsCtrl.AddTextLine("");
	m_StarWarsCtrl.AddTextLine("����� 0206��");
	m_StarWarsCtrl.AddTextLine("���");
	m_StarWarsCtrl.AddTextLine("0204591");
	m_StarWarsCtrl.AddTextLine("");
	m_StarWarsCtrl.AddTextLine("ָ����ʦ");
	m_StarWarsCtrl.AddTextLine("���ź�");
	m_StarWarsCtrl.AddTextLine("");
	m_StarWarsCtrl.AddTextLine("");
	m_StarWarsCtrl.AddTextLine("2005��12��");
	m_StarWarsCtrl.AddTextLine("");
	m_StarWarsCtrl.AddTextLine("");
	m_StarWarsCtrl.AddTextLine("");
	m_StarWarsCtrl.AddTextLine("");
	m_StarWarsCtrl.AddTextLine("");
	m_StarWarsCtrl.AddTextLine("http://donge.org");
	m_StarWarsCtrl.AddTextLine("");
	m_StarWarsCtrl.AddTextLine("");
	m_StarWarsCtrl.AddTextLine("");
	m_StarWarsCtrl.AddTextLine("");
	m_StarWarsCtrl.AddTextLine("");
	m_StarWarsCtrl.AddTextLine("");
	m_StarWarsCtrl.AddTextLine("");

	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}

//##ModelId=43B25EC803B9
void CLCMailerDlg::OnButtonAbout() 
{
	// TODO: Add your control notification handler code here
	CAboutDlg hDlg;
	hDlg.m_pLCMailerDlg = this;
	hDlg.DoModal();
}

//##ModelId=43B25EC803C8
void CLCMailerDlg::OnButtonExit() 
{
	// TODO: Add your control notification handler code here
	PostQuitMessage(0);
}

//##ModelId=43B25EC802FD
BOOL CLCMailerDlg::PreTranslateMessage(MSG* pMsg) 
{
	// TODO: Add your specialized code here and/or call the base class
	
	//����IDOK��IDCANCEL��Ϣ��
	if(pMsg->message == WM_KEYDOWN && pMsg->wParam == VK_RETURN || pMsg->wParam == VK_ESCAPE)
	{
		CWnd *hWnd = FromHandle(pMsg->hwnd);
		char ClassName[16];
		if(GetClassName(hWnd->GetSafeHwnd(), ClassName, sizeof(ClassName)) != 0)
		{
			DWORD style = ::GetWindowLong(pMsg->hwnd, GWL_STYLE);
			if((style & ES_MULTILINE) == 0)
			{
				if(strnicmp(ClassName, "EDIT", 5) == 0)
				{
					return TRUE;
				}
			}
		}
	}
	
	return CDialog::PreTranslateMessage(pMsg);
}

//##ModelId=43B25EC803CA
void CLCMailerDlg::OnButtonSend() 
{
	// TODO: Add your control notification handler code here

	CString szBuf;

	CSendDlg hSendDlg;
	hSendDlg.m_nCopyNumber = 1;

	m_ctrlTo.GetWindowText(szBuf);
	if(szBuf.IsEmpty())
	{
		MessageBox("������д���������䣡", "��������", MB_OK | MB_ICONHAND);
		m_ctrlTo.SetFocus();
		return;
	}

	//��SMTP����������
	hSendDlg.m_strSmtpServer = m_szServerName;

	//���˿ڡ���
	hSendDlg.m_nPort = atoi(m_nPort);

	//���û��ʺš���
	hSendDlg.m_strAccount = m_szAccount;

	//���û����롱��
	hSendDlg.m_strPassword = m_szPassword;

	//�������ˡ���
	hSendDlg.m_strFrom = m_szFrom;

	//���û���������
	hSendDlg.m_strUsername = m_szUsername;

	//�������ˡ���
	m_ctrlTo.GetWindowText(szBuf);
	hSendDlg.m_strTo = szBuf;

	//�����⡱��
	m_ctrlSubject.GetWindowText(szBuf);
	hSendDlg.m_strSubject = szBuf;

	//�����ġ���
	m_ctrlBody.GetWindowText(szBuf);
	hSendDlg.m_strBody = szBuf;

	//�����ļ��б���
	hSendDlg.m_szFilenames.Copy(m_szFilenames);

	//�Ƿ���Ҫ��֤��
	hSendDlg.m_bNeedAuth = atoi(m_nNeedAuth);
	
	//��ʽ���ͣ�
	hSendDlg.DoModal();

	//�����㡱��
	m_ctrlTo.SetWindowText("");
	m_ctrlSubject.SetWindowText("");
	m_ctrlBody.SetWindowText("");
	m_szFilenames.RemoveAll();
	m_ctrlTo.SetFocus();

}

//##ModelId=43B25EC803D9
void CLCMailerDlg::OnDestroy() 
{
	CDialog::OnDestroy();

	//����SMTP��������������д��ini�ļ��У�
	//m_ctrlServerName.GetWindowText(m_szServerName);
	WritePrivateProfileString("Server Options", "Server Name", m_szServerName, szIniFile);

	//�����˿ڡ�������д��ini�ļ��У�
	//m_ctrlPort.GetWindowText(m_iPort);
	WritePrivateProfileString("Server Options", "Port", m_nPort, szIniFile);

	//����POP3��������������д��ini�ļ��У�
	//m_ctrlServerName.GetWindowText(m_szServerName);
	WritePrivateProfileString("Server Options", "Pop3 Server", m_szPop3Server, szIniFile);

	//�����˿ڡ�������д��ini�ļ��У�
	//m_ctrlPort.GetWindowText(m_iPort);
	WritePrivateProfileString("Server Options", "Pop3 Port", m_nPop3Port, szIniFile);

	//��NeedAuth��״̬д��ini�ļ��У�
	WritePrivateProfileString("Server Options", "Need ESMTP", m_nNeedAuth, szIniFile);

	//�����û��ʺš�д��ini�ļ��У�
	//m_ctrlAccount.GetWindowText(m_szAccount);
	WritePrivateProfileString("Server Options", "Data1", m_szAccount, szIniFile);

	//�����û����롱д��ini�ļ��У�
	//m_ctrlPassword.GetWindowText(m_szPassword);
	WritePrivateProfileString("Server Options", "Data2", m_szPassword, szIniFile);

	//�������������䡱д��ini�ļ��У�
	//m_ctrlFrom.GetWindowText(m_szFrom);
	WritePrivateProfileString("User Info", "Mail From", m_szFrom, szIniFile);

	//����������������д��ini�ļ��У�
	//m_ctrlUsername.GetWindowText(m_szUsername);
	WritePrivateProfileString("User Info", "Username", m_szUsername, szIniFile);
	
	// TODO: Add your message handler code here
	
}

//##ModelId=43B25EC90001
void CLCMailerDlg::OnButtonAttachment() 
{
	// TODO: Add your control notification handler code here
	CAttachment hAttachmentDlg;
	hAttachmentDlg.m_pLCMailerDlg = this;
	hAttachmentDlg.DoModal();
}

//##ModelId=43B25EC90399
void CAboutDlg::OnButtonMailme() 
{
	// TODO: Add your control notification handler code here

	//д�Ÿ��ң�
	//ShellExecute(this->m_hWnd, "open", "mailto:lcother@163.net", NULL, NULL, SW_SHOWNORMAL);
	m_pLCMailerDlg->m_ctrlTo.SetWindowText("23jh@163.com");
	m_pLCMailerDlg->m_ctrlSubject.SetWindowText("��ӭʹ�� DongeMail 1.0");
	CAboutDlg::OnOK();
}

//##ModelId=43B25EC903A9
void CAboutDlg::OnButtonHomepage() 
{
	// TODO: Add your control notification handler code here
	
	//�����ҵ���ҳ��
	ShellExecute(this->m_hWnd, "open", "http://donge.org", NULL, NULL, SW_SHOWNORMAL);
}


//##ModelId=43B25EC90011
void CLCMailerDlg::OnBtnPop3setup() 
{
	// TODO: Add your control notification handler code here
	CPop3Dalog hPop3Dlg;
	hPop3Dlg.m_pLCMailerDlg = this;
	hPop3Dlg.DoModal();
}

//##ModelId=43B25EC90020
void CLCMailerDlg::OnButtonRecv() 
{
	// TODO: Add your control notification handler code here
	num=0;
	int sum;
	CString szState;

	char szMail[65536];
	char szMailName[50];
	char szSubject[50];
	FILE *fp;

	CPop3 pop3;
	m_ctrlMailList.DeleteAllItems();

	pop3.Create(m_szAccount, m_szPassword, m_szPop3Server, 110);
	
	m_ctrlState.SetWindowText("�������ӷ�����...");
	pop3.Connect();
	pop3.Login();
	pop3.List(sum);

	if ( sum <= 0 )
		m_ctrlState.SetWindowText("������û�����ʼ�!");
	else
		m_ctrlState.SetWindowText("�����������ʼ�!");
		
	for (int i = 1; i <= sum; i++) {
		szState.Format("���ڽ��յ� %d ���ʼ�!", i);
		m_ctrlState.SetWindowText(szState);
//////////////////////
//		ȡ���ļ�������Mails
			pop3.FetchEx(i);

		sprintf(szMailName, "%d.eml", i);

		if((fp=fopen(szMailName,"r"))!=NULL)
		{
			int i=0;char c;
			while ((c = fgetc(fp)) != EOF)
			{
				szMail[i++]=c;
			}
		}
/////////////////////////		
		pop3.GetSubject(szSubject, szMail);
		Mails[num++]=szMail;
//��ʾ����	MessageBox(szMail);
		CString szTemp;
		szTemp.Format("��%d��", i);
	
		m_ctrlMailList.InsertItem(i, szSubject, i);
		m_ctrlMailList.SetItem(i, 1, LVIF_TEXT, szTemp, 0, LVIS_SELECTED, LVIS_SELECTED, 0);

		szState.Format(szState, i);
    }    
    
	pop3.Quit();

	m_ctrlState.SetWindowText("�ʼ���ȡ���!");
}


//##ModelId=43B25EC9002E
void CLCMailerDlg::OnDblclkListMail(NMHDR* pNMHDR, LRESULT* pResult) 
{
	// TODO: Add your control notification handler code here
	NM_LISTVIEW* pNMListView = (NM_LISTVIEW*)pNMHDR;
	//�õ���ǰ��ѡ��� Item �� Index ��
	int nItem = -1;
	CString szMsg;
	nItem = m_ctrlMailList.GetNextItem(nItem, LVNI_SELECTED);
	szMsg.Format("%d", nItem);

	if(nItem!=-1){
		//��ʾ���MessageBox(szMsg);
	//	MessageBox(Mails[nItem]);
	CMailViewDlg hMailViewDlg;
	hMailViewDlg.m_pLCMailerDlg = this;
	hMailViewDlg.szMailView = Mails[nItem];
	hMailViewDlg.DoModal();
	}



	*pResult = 0;
}