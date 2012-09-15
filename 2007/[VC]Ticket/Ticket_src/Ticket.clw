; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=TicketListVew
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "Ticket.h"
LastPage=0

ClassCount=7
Class1=CTicketApp
Class2=CTicketDoc
Class3=CTicketView
Class4=CMainFrame

ResourceCount=7
Resource1=IDD_PROPPAGE_MEDIUM (English (U.S.))
Class5=CAboutDlg
Resource2=IDD_ABOUTBOX
Class6=TicketListVew
Resource3=IDR_MAINFRAME
Resource4=IDD_OLE_PROPPAGE_SMALL (English (U.S.))
Resource5=IDD_FORMVIEW
Resource6=IDD_PROPPAGE_SMALL (English (U.S.))
Class7=PropPageFirst
Resource7=IDD_PROPPAGE_FIRST

[CLS:CTicketApp]
Type=0
HeaderFile=Ticket.h
ImplementationFile=Ticket.cpp
Filter=N

[CLS:CTicketDoc]
Type=0
HeaderFile=TicketDoc.h
ImplementationFile=TicketDoc.cpp
Filter=N
LastObject=CTicketDoc

[CLS:CTicketView]
Type=0
HeaderFile=TicketView.h
ImplementationFile=TicketView.cpp
Filter=C
BaseClass=CFormView
VirtualFilter=VWC
LastObject=CTicketView


[CLS:CMainFrame]
Type=0
HeaderFile=MainFrm.h
ImplementationFile=MainFrm.cpp
Filter=T
LastObject=CMainFrame
BaseClass=CFrameWnd
VirtualFilter=fWC




[CLS:CAboutDlg]
Type=0
HeaderFile=Ticket.cpp
ImplementationFile=Ticket.cpp
Filter=D

[DLG:IDD_ABOUTBOX]
Type=1
Class=CAboutDlg
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[MNU:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_FILE_SAVE_AS
Command5=ID_FILE_PRINT
Command6=ID_FILE_PRINT_PREVIEW
Command7=ID_FILE_PRINT_SETUP
Command8=ID_FILE_MRU_FILE1
Command9=ID_APP_EXIT
Command10=ID_EDIT_UNDO
Command11=ID_EDIT_CUT
Command12=ID_EDIT_COPY
Command13=ID_EDIT_PASTE
Command14=ID_VIEW_TOOLBAR
Command15=ID_VIEW_STATUS_BAR
Command16=ID_APP_ABOUT
CommandCount=16

[ACL:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_FILE_PRINT
Command5=ID_EDIT_UNDO
Command6=ID_EDIT_CUT
Command7=ID_EDIT_COPY
Command8=ID_EDIT_PASTE
Command9=ID_EDIT_UNDO
Command10=ID_EDIT_CUT
Command11=ID_EDIT_COPY
Command12=ID_EDIT_PASTE
Command13=ID_NEXT_PANE
Command14=ID_PREV_PANE
CommandCount=14

[TB:IDR_MAINFRAME]
Type=1
Class=CMainFrame
Command1=ID_FILE_NEW
Command2=ID_FILE_OPEN
Command3=ID_FILE_SAVE
Command4=ID_EDIT_CUT
Command5=ID_EDIT_COPY
Command6=ID_EDIT_PASTE
Command7=ID_FILE_PRINT
Command8=ID_APP_ABOUT
Command9=ID_BUTTON_RUN
Command10=ID_BUTTON_PROPERTY
CommandCount=10

[DLG:IDR_MAINFRAME]
Type=1
Class=?
ControlCount=2
Control1=IDC_STATIC,static,1342308352
Control2=IDC_BUTTON_SET,button,1342242816

[DLG:IDD_FORMVIEW]
Type=1
Class=TicketListVew
ControlCount=10
Control1=IDC_STATIC,static,1342308352
Control2=IDC_TICKET_LIST,SysListView32,1350631425
Control3=IDC_DATETIMEPICKER,SysDateTimePick32,1342242848
Control4=IDC_COMBO_DEPART,combobox,1344340226
Control5=IDC_COMBO_ARRIVE,combobox,1344340226
Control6=IDC_BUTTON,button,1476460544
Control7=IDC_LOG_LIST,listbox,1352728835
Control8=IDC_STATIC,static,1342308352
Control9=IDC_STATIC,static,1342308352
Control10=IDC_STATIC,static,1342308352

[CLS:TicketListVew]
Type=0
HeaderFile=TicketListVew.h
ImplementationFile=TicketListVew.cpp
BaseClass=CDialog
Filter=D
VirtualFilter=dWC
LastObject=IDC_TICKET_LIST

[DLG:IDD_OLE_PROPPAGE_SMALL (English (U.S.))]
Type=1
Class=?
ControlCount=1
Control1=IDC_STATIC,static,1342308352

[DLG:IDD_PROPPAGE_MEDIUM (English (U.S.))]
Type=1
Class=?
ControlCount=1
Control1=IDC_STATIC,static,1342308352

[DLG:IDD_PROPPAGE_SMALL (English (U.S.))]
Type=1
Class=?
ControlCount=1
Control1=IDC_STATIC,static,1342308352

[DLG:IDD_PROPPAGE_FIRST]
Type=1
Class=PropPageFirst
ControlCount=7
Control1=IDC_STATIC,static,1342308352
Control2=IDC_SPIN_REFRESH,msctls_updown32,1342177318
Control3=IDC_EDIT_REFRESH,edit,1350762624
Control4=IDC_STATIC,button,1342308359
Control5=IDC_CHECK_TIMER,button,1342242819
Control6=IDC_STATIC,button,1342308359
Control7=IDC_EDIT_PRICELINE,edit,1350762624

[CLS:PropPageFirst]
Type=0
HeaderFile=PropPageFirst.h
ImplementationFile=PropPageFirst.cpp
BaseClass=CDialog
Filter=D
LastObject=IDC_CHECK_TIMER
VirtualFilter=dWC

