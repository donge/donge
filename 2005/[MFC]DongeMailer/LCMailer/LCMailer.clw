; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CMailViewDlg
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "LCMailer.h"

ClassCount=8
Class1=CLCMailerApp
Class2=CLCMailerDlg
Class3=CAboutDlg

ResourceCount=11
Resource1=IDD_LCMAILER_DIALOG
Resource2=IDR_MAINFRAME
Resource3=IDD_ATTACHMENT_DIALOG
Class4=CServerSetup
Resource4=IDD_ABOUTBOX
Class5=CSendDlg
Resource5=IDD_RECV_DIALOG
Class6=CAttachment
Resource6=IDD_SERVERSETUP_DIALOG
Class7=CPop3Dalog
Resource7=IDD_POP3SETUP_DIALOG
Resource8=IDD_DIALOG_VIEWMAIL
Resource9=IDD_FORMVIEW (English (U.S.))
Class8=CMailViewDlg
Resource10=IDD_SEND_DIALOG
Resource11=IDR_MENU_MAIN

[CLS:CLCMailerApp]
Type=0
HeaderFile=LCMailer.h
ImplementationFile=LCMailer.cpp
Filter=N

[CLS:CLCMailerDlg]
Type=0
HeaderFile=LCMailerDlg.h
ImplementationFile=LCMailerDlg.cpp
Filter=D
BaseClass=CDialog
VirtualFilter=dWC
LastObject=CLCMailerDlg

[CLS:CAboutDlg]
Type=0
HeaderFile=LCMailerDlg.h
ImplementationFile=LCMailerDlg.cpp
Filter=D
LastObject=IDC_BUTTON_HOMEPAGE
BaseClass=CDialog
VirtualFilter=dWC

[DLG:IDD_ABOUTBOX]
Type=1
Class=CAboutDlg
ControlCount=4
Control1=IDOK,button,1342373889
Control2=IDC_STATIC_STARWAR,static,1350696960
Control3=IDC_BUTTON_MAILME,button,1342242816
Control4=IDC_BUTTON_HOMEPAGE,button,1342242816

[DLG:IDD_LCMAILER_DIALOG]
Type=1
Class=CLCMailerDlg
ControlCount=15
Control1=IDC_EDIT_MAILTO,edit,1350631552
Control2=IDC_EDIT_SUBJECT,edit,1350631552
Control3=IDC_EDIT_BODY,edit,1352732676
Control4=IDC_BUTTON_ATTACHMENT,button,1342242816
Control5=IDC_BUTTON_SEND,button,1342242816
Control6=IDC_BUTTON_SERVERSETUP,button,1342242816
Control7=IDC_BUTTON_ABOUT,button,1342242816
Control8=IDC_BUTTON_EXIT,button,1342242816
Control9=IDC_STATIC,static,1342308352
Control10=IDC_STATIC,static,1342308352
Control11=IDC_STATIC,button,1342177287
Control12=IDC_BUTTON_RECV,button,1342242816
Control13=IDC_BTN_POP3SETUP,button,1342242816
Control14=IDC_LIST_MAIL,SysListView32,1350631425
Control15=IDC_STATIC_STATE,static,1342308352

[CLS:CServerSetup]
Type=0
HeaderFile=serversetup.h
ImplementationFile=serversetup.cpp
BaseClass=CDialog
Filter=D
VirtualFilter=dWC
LastObject=CServerSetup

[DLG:IDD_SERVERSETUP_DIALOG]
Type=1
Class=CServerSetup
ControlCount=17
Control1=IDC_EDIT_SERVERNAME,edit,1350631552
Control2=IDC_EDIT_PORT,edit,1350639744
Control3=IDC_CHECK_NEEDAUTH,button,1342242819
Control4=IDC_EDIT_ACCOUNT,edit,1350631552
Control5=IDC_EDIT_PASSWORD,edit,1350631584
Control6=IDC_EDIT_FROM,edit,1350631552
Control7=IDC_EDIT_USERNAME,edit,1350631552
Control8=IDC_STATIC,static,1342308352
Control9=IDC_STATIC,static,1342308352
Control10=IDC_STATIC,static,1342308352
Control11=IDC_STATIC,button,1342177287
Control12=IDC_STATIC,static,1342308352
Control13=IDC_STATIC,static,1342308352
Control14=IDC_STATIC,button,1342177287
Control15=IDC_STATIC,static,1342308352
Control16=IDOK,button,1342242816
Control17=IDCANCEL,button,1342242816

[DLG:IDD_SEND_DIALOG]
Type=1
Class=CSendDlg
ControlCount=3
Control1=IDCANCEL,button,1342242816
Control2=IDC_PROGRESS_SEND,msctls_progress32,1350565888
Control3=IDC_STATIC_STATUS,static,1342308352

[CLS:CSendDlg]
Type=0
HeaderFile=SendDlg.h
ImplementationFile=SendDlg.cpp
BaseClass=CDialog
Filter=D
VirtualFilter=dWC
LastObject=CSendDlg

[DLG:IDD_ATTACHMENT_DIALOG]
Type=1
Class=CAttachment
ControlCount=4
Control1=IDOK,button,1342242817
Control2=IDC_LIST_ATTACHMENT,SysListView32,1342275585
Control3=IDC_BUTTON_ADD,button,1342242816
Control4=IDC_BUTTON_DEL,button,1342242816

[CLS:CAttachment]
Type=0
HeaderFile=Attachment.h
ImplementationFile=Attachment.cpp
BaseClass=CDialog
Filter=D
VirtualFilter=dWC
LastObject=IDC_BUTTON_DEL

[DLG:IDD_POP3SETUP_DIALOG]
Type=1
Class=CPop3Dalog
ControlCount=10
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_EDIT_USERNAME,edit,1350631552
Control4=IDC_STATIC,static,1342308352
Control5=IDC_STATIC,static,1342308352
Control6=IDC_STATIC,static,1342308352
Control7=IDC_EDIT_PASSWORD,edit,1350631584
Control8=IDC_EDIT_POP3SERVER,edit,1350631552
Control9=IDC_STATIC,static,1342308352
Control10=IDC_EDIT_POP3PORT,edit,1350631552

[CLS:CPop3Dalog]
Type=0
HeaderFile=Pop3Dalog.h
ImplementationFile=Pop3Dalog.cpp
BaseClass=CDialog
Filter=D
VirtualFilter=dWC
LastObject=IDC_EDIT_POP3SERVER

[DLG:IDD_RECV_DIALOG]
Type=1
Class=?
ControlCount=3
Control1=IDCANCEL,button,1342242816
Control2=IDC_PROGRESS_SEND,msctls_progress32,1350565888
Control3=IDC_STATIC_STATUS,static,1342308352

[DLG:IDD_FORMVIEW (English (U.S.))]
Type=1
Class=?
ControlCount=1
Control1=IDC_STATIC,static,1342308352

[DLG:IDD_DIALOG_VIEWMAIL]
Type=1
Class=CMailViewDlg
ControlCount=11
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_EDIT_MAIL,edit,1350638596
Control4=IDC_STATIC,static,1342308363
Control5=IDC_STATIC,static,1342308352
Control6=IDC_STATIC,static,1342308352
Control7=IDC_STATIC_SUBJECT,static,1342308352
Control8=IDC_STATIC_DATE,static,1342308352
Control9=IDC_STATIC_TO,static,1342308352
Control10=IDC_BUTTON_RE,button,1342242816
Control11=IDC_STATIC,static,1342308352

[CLS:CMailViewDlg]
Type=0
HeaderFile=MailViewDlg.h
ImplementationFile=MailViewDlg.cpp
BaseClass=CDialog
Filter=D
LastObject=IDC_EDIT_MAIL
VirtualFilter=dWC

[MNU:IDR_MENU_MAIN]
Type=1
Class=?
Command1=ID_MENUITEM_SEND
Command2=ID_MENUITEM_RECV
Command3=ID_MENUITEM_EXIT
CommandCount=3

