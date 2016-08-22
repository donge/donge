// SendDlg.cpp : implementation file
//

#include "stdafx.h"
#include "LCMailer.h"
#include "SendDlg.h"

#include "SMTP.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CSendDlg dialog

int m_nCount = 0;

//##ModelId=43B25EC201C6
CSendDlg::CSendDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CSendDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CSendDlg)
	m_Status = _T("");
	//}}AFX_DATA_INIT
}


//##ModelId=43B25EC20290
void CSendDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CSendDlg)
	DDX_Control(pDX, IDCANCEL, m_Cancel);
	DDX_Text(pDX, IDC_STATIC_STATUS, m_Status);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CSendDlg, CDialog)
	//{{AFX_MSG_MAP(CSendDlg)
	//ON_MESSAGE(WM_THREADFINISHED, OnThreadFinished)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CSendDlg message handlers

//##ModelId=43B25EC2029F
void CSendDlg::OnCancel() 
{
	// TODO: Add extra cleanup here
	if(m_nCount == 0)
	{
		CDialog::OnCancel();
	}
	else
	{
		m_nCount = m_nCopyNumber;
	}
}

UINT SendMailMulti(LPVOID pParam)
{
	CSendDlg *pSendThread = (CSendDlg *)pParam;
	CSMTP smtp(pSendThread->m_strSmtpServer, pSendThread->m_nPort);

	//��ʼ���ʼ����ݣ�
	smtp.m_strAccount = pSendThread->m_strAccount;
	smtp.m_strPassword = pSendThread->m_strPassword;
	smtp.m_strFrom = pSendThread->m_strFrom;
	smtp.m_strTo = pSendThread->m_strTo;
	smtp.m_strSubject = pSendThread->m_strSubject;
	smtp.m_strBody = pSendThread->m_strBody;
	smtp.m_strUsername = pSendThread->m_strUsername;
	smtp.m_szFilenames.Copy(pSendThread->m_szFilenames);

	//���ӷ�������
	pSendThread->SetDlgItemText(IDC_STATIC_STATUS, "�������ӷ���������");

	if(!smtp.Connect())
	{
		AfxMessageBox(smtp.GetLastError());
		pSendThread->SetDlgItemText(IDC_STATIC_STATUS, "���ӷ�����ʧ�ܣ�");
		pSendThread->m_Cancel.SetWindowText("�˳�");
		return FALSE;
	}

	//����Ҫ��������֤��ʱ��
	if(pSendThread->m_bNeedAuth == 1)
	{
		pSendThread->SetDlgItemText(IDC_STATIC_STATUS, "������֤ �û���/���� ����");
		if(!smtp.Auth())
		{
			AfxMessageBox(smtp.GetLastError());
			pSendThread->SetDlgItemText(IDC_STATIC_STATUS, "�û���/���� ��֤������");
			pSendThread->m_Cancel.SetWindowText("�˳�");
			return FALSE;
		}
	}

	//��ʼ�����ʼ���
	CProgressCtrl *pBar;
	pBar = (CProgressCtrl *)pSendThread->GetDlgItem(IDC_PROGRESS_SEND);

	pSendThread->SetDlgItemText(IDC_STATIC_STATUS, "���ڷ����ż�����");

	for(m_nCount; m_nCount < pSendThread->m_nCopyNumber; ::InterlockedIncrement((long *)&m_nCount))
	{
		if(!smtp.SendMessage())
		{
			AfxMessageBox(smtp.GetLastError());
			smtp.Disconnect();
			pSendThread->SetDlgItemText(IDC_STATIC_STATUS, "�����ż�������");
			pSendThread->m_Cancel.SetWindowText("�˳�");
			return FALSE;
		}
		else
		{
			pSendThread->SetDlgItemText(IDC_STATIC_STATUS, "���ڷ����ż�����");
			pBar->SetPos((m_nCount + 1) * 100 / pSendThread->m_nCopyNumber);
			smtp.Disconnect();
		}
	}

	//�ʼ��ѱ��ɹ����ͣ�
	pSendThread->SetDlgItemText(IDC_STATIC_STATUS, "������ϣ�");
	pSendThread->SetDlgItemText(IDCANCEL, "���");
	pSendThread->m_Cancel.SetWindowText("�˳�");
	m_nCount = 0;

	return TRUE;
}

//##ModelId=43B25EC202BF
BOOL CSendDlg::OnInitDialog() 
{
	CDialog::OnInitDialog();
	
	// TODO: Add extra initialization here
	AfxBeginThread(SendMailMulti, this);

	return TRUE;  // return TRUE unless you set the focus to a control
	              // EXCEPTION: OCX Property Pages should return FALSE
}