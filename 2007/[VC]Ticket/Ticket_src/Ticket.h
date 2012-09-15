// Ticket.h : main header file for the TICKET application
//

#if !defined(AFX_TICKET_H__E2FFFB1D_F6AE_419D_BD3E_DD1127E33813__INCLUDED_)
#define AFX_TICKET_H__E2FFFB1D_F6AE_419D_BD3E_DD1127E33813__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CTicketApp:
// See Ticket.cpp for the implementation of this class
//

class CTicketApp : public CWinApp
{
public:
	CTicketApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CTicketApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation
	//{{AFX_MSG(CTicketApp)
	afx_msg void OnAppAbout();
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

// ����ȫ�ֱ���
const unsigned int AIRPORT_CNT = 177;
const CString AirportData[AIRPORT_CNT][4] =
	{
		{"AOG", "��ɽ", "anshan", "AS"}, 
		{"AQG", "����", "anqing", "AQ"}, 
		{"AYN", "����", "anyang", "AY"}, 
		{"AKA", "����", "ankang", "AK"}, 
		{"AKU", "������", "akesu", "AKS"}, 
		{"AAT", "����̩", "aletai", "ALT"}, 
		{"AVA", "��˳", "anshun", "AS"}, 
		{"PEK", "����", "beijing", "BJ"}, 
		{"BFU", "����", "bengbu", "BB"}, 
		{"BHY", "����", "beihai", "BH"}, 
		{"BSD", "��ɽ", "baoshan", "BS"}, 
		{"BAV", "��ͷ", "baotou", "BT"}, 
		{"CTU", "�ɶ�", "chengdu", "CD"}, 
		{"CKG", "����", "chongqing", "CQ"}, 
		{"CSX", "��ɳ", "changsha", "CS"}, 
		{"CGQ", "����", "changchun", "CC"}, 
		{"CZX", "����", "changzhou", "CZ"}, 
		{"CGD", "����", "changde", "CD"}, 
		{"CEH", "�е�", "chengde", "CD"}, 
		{"CHG", "����", "chaoyang", "CY"}, 
		{"CIH", "����", "changzhi", "CZ"}, 
		{"CIF", "���", "chifeng", "CF"}, 
		{"BPX", "����", "changdu", "CD"}, 
		{"CNI", "����", "changhai", "CH"}, 
		{"DLC", "����", "dalian", "DL"}, 
		{"DLU", "����", "dali", "DL"}, 
		{"DOY", "��Ӫ", "dongying", "DY"}, 
		{"DNH", "�ػ�", "dunhuang", "DH"}, 
		{"DDG", "����", "dandong", "DD"}, 
		{"DAT", "��ͬ", "datong", "DT"}, 
		{"DAX", "����", "daxian", "DX"}, 
		{"DIG", "����", "diqing", "DQ"}, 
		{"ENH", "��ʩ", "enshi", "ES"}, 
		{"FOC", "����", "fuzhou", "FZ"}, 
		{"ZCP", "��ɽ", "foshan", "FS"}, 
		{"FUG", "����", "fuyang", "FY"}, 
		{"FYN", "����", "fuyun", "FY"}, 
		{"CAN", "����", "guangzhou", "GZ"}, 
		{"KWL", "����", "guilin", "GL"}, 
		{"KWE", "����", "guiyang", "GY"}, 
		{"KOW", "����", "ganzhou", "GZ"}, 
		{"GOQ", "���ľ", "geermu", "GEM"}, 
		{"GYS", "��Ԫ", "guangyuan", "GY"}, 
		{"GHN", "�㺺", "guanghan", "GH"}, 
		{"HGH", "����", "hangzhou", "HZ"}, 
		{"HRB", "������", "haerbin", "HEB"}, 
		{"HFE", "�Ϸ�", "hefei", "HF"}, 
		{"HAK", "����", "haikou", "HK"}, 
		{"HET", "���ͺ���", "huhehaote", "HHHT"}, 
		{"TXN", "��ɽ", "huangshan", "HS"}, 
		{"HNY", "����", "hengyang", "HY"}, 
		{"HEK", "�ں�", "heihe", "HH"}, 
		{"HLD", "������", "hailaer", "HLE"}, 
		{"HMI", "����", "hami", "HM"}, 
		{"HYN", "����", "huangyan", "HY"}, 
		{"HZG", "����", "hanzhong", "HZ"}, 
		{"HUZ", "����", "huizhou", "HZ"}, 
		{"HTN", "����", "hetian", "HT"}, 
		{"TNA", "����", "jinan", "JN"}, 
		{"JIL", "����", "jilin", "JL"}, 
		{"JZH", "��կ��", "jiuzhaigou", "JZG"}, 
		{"JDZ", "������", "jingdezhen", "JDZ"}, 
		{"JGS", "����ɽ", "jinggangshan", "JGS"}, 
		{"JNZ", "����", "jinzhou", "JZ"}, 
		{"JJN", "����/Ȫ��", "jinjiang", "JJ"}, 
		{"JIU", "�Ž�", "jiujiang", "JJ"}, 
		{"JNG", "����", "jining", "JN"}, 
		{"SHS", "����", "jingzhou", "JZ"}, 
		{"JHG", "����", "jinghong", "JH"}, 
		{"KNC", "����", "jian", "JA"}, 
		{"JGN", "������", "jiayuguan", "JYG"}, 
		{"JMU", "��ľ˹", "jiamusi", "JMS"}, 
		{"CHW", "��Ȫ", "jiuquan", "JQ"}, 
		{"KMG", "����", "kunming", "KM"}, 
		{"KUS", "��ɽ", "kunshan", "KS"}, 
		{"KHG", "��ʲ", "kashi", "KS"}, 
		{"KCA", "�⳵", "kuche", "KC"}, 
		{"KRL", "�����", "kuerle", "KEL"}, 
		{"KRY", "��������", "kelamayi", "KLMY"}, 
		{"LHW", "����", "lanzhou", "LZ"}, 
		{"LXA", "����", "lasa", "LS"}, 
		{"LJG", "����", "lijiang", "LJ"}, 
		{"LUZ", "®ɽ", "lushan", "LS"}, 
		{"LZO", "����", "luzhou", "LZ"}, 
		{"LZH", "����", "liuzhou", "LZ"}, 
		{"LYG", "���Ƹ�", "lianyungang", "LYG"}, 
		{"LYA", "����", "luoyang", "LY"}, 
		{"LCX", "����", "longyan", "LY"}, 
		{"LCX", "����", "liancheng", "LC"}, 
		{"LYI", "����", "linyi", "LY"}, 
		{"LNJ", "�ٲ�", "lincang", "LC"}, 
		{"LZY", "��֥", "linzhi", "LZ"}, 
		{"LDG", "�޶�", "luoding", "LD"}, 
		{"WXN", "��ƽ", "Liangping", "LP"}, 
		{"LXI", "����", "linxi", "LX"}, 
		{"MDG", "ĵ����", "mudanjiang", "MDJ"}, 
		{"MIG", "����", "mianyang", "MY"}, 
		{"MXZ", "÷��", "meixian", "MX"}, 
		{"NZH", "������", "manzhouli", "MZL"}, 
		{"LUM", "â��", "mangshi", "MS"}, 
		{"NKG", "�Ͼ�", "nanjing", "NJ"}, 
		{"KHN", "�ϲ�", "nanchang", "NC"}, 
		{"NGB", "����", "ningbo", "NB"}, 
		{"NNG", "����", "nanning", "NN"}, 
		{"NTG", "��ͨ", "nantong", "NT"}, 
		{"NNY", "����", "nanyang", "NY"}, 
		{"NAO", "�ϳ�", "nanchong", "NC"}, 
		{"WUS", "��ƽ", "nanping", "NP"}, 
		{"PZI", "��֦��", "panzhihua", "PZH"}, 
		{"SYM", "�ն�", "puer", "PE"}, 
		{"TAO", "�ൺ", "qingdao", "QD"}, 
		{"SHP", "�ػʵ�", "qinhuangdao", "QHD"}, 
		{"JJN", "Ȫ��/����", "quanzhou", "QZ"}, 
		{"NDG", "�������", "qiqihaer", "QQHE"}, 
		{"JUZ", "����", "quzhou", "QZ"}, 
		{"IQM", "��ĩ", "qiemo", "QM"}, 
		{"IQN", "����", "qingyang", "QY"}, 
		{"SHA", "�Ϻ�", "shanghai", "SH"}, 
		{"SZX", "����", "shenzhen", "SZ"}, 
		{"SHE", "����", "shenyang", "SY"}, 
		{"SYX", "����", "sanya", "SY"}, 
		{"SJW", "ʯ��ׯ", "shijiazhuang", "SJZ"}, 
		{"SZV", "����", "suzhou", "SZ"}, 
		{"SWA", "��ͷ", "shantou", "ST"}, 
		{"SHS", "ɳ��", "shashi", "SS"}, 
		{"SYM", "˼é", "simao", "SM"}, 
		{"SSA", "۷��", "shanshan", "SS"}, 
		{"TSN", "���", "tianjin", "TJ"}, 
		{"TYN", "̫ԭ", "taiyuan", "TY"}, 
		{"TNH", "ͨ��", "tonghua", "TH"}, 
		{"TGO", "ͨ��", "tongliao", "TL"}, 
		{"TEN", "ͭ��", "tongren", "TR"}, 
		{"TCG", "����", "tacheng", "TC"}, 
		{"WUH", "�人", "wuhan", "WH"}, 
		{"URC", "��³ľ��", "wulumuqi", "WLMQ"}, 
		{"WNZ", "����", "wenzhou", "WZ"}, 
		{"WUX", "����", "wuxi", "WX"}, 
		{"WEF", "Ϋ��", "weifang", "WF"}, 
		{"WEH", "����", "weihai", "WH"}, 
		{"WUS", "����ɽ", "wuyishan", "WYS"}, 
		{"ZSWU", "�ߺ�", "wuhu", "WH"}, 
		{"HLH", "��������", "wulanhaote", "WLHT"}, 
		{"WXN", "����", "wanzhou", "WZ"}, 
		{"WUZ", "����", "wuzhou", "WZ"}, 
		{"WUA", "�ں�", "wuhai", "WH"}, 
		{"XIY", "����", "xian", "XA"}, 
		{"XMN", "����", "xiamen", "XM"}, 
		{"XUZ", "����", "xuzhou", "XZ"}, 
		{"XNN", "����", "xining", "XN"}, 
		{"JHG", "��˫����", "xishuangbanna", "XSBN"}, 
		{"XFN", "�差", "xiangfan", "XF"}, 
		{"XNT", "��̨", "xingtai", "XT"}, 
		{"XIC", "����", "xichang", "XC"}, 
		{"XEN", "�˳�", "xingcheng", "XC"}, 
		{"XIN", "����", "xingning", "XN"}, 
		{"XIL", "���ֺ���", "xilinhaote", "XLHT"}, 
		{"YNT", "��̨", "yantai", "YT"}, 
		{"YNZ", "�γ�", "yancheng", "YC"}, 
		{"INC", "����", "yinchuan", "YC"}, 
		{"ENY", "�Ӱ�", "yanan", "YA"}, 
		{"YBP", "�˱�", "yibin", "YB"}, 
		{"YIH", "�˲�", "yichang", "YC"}, 
		{"YIW", "����", "yiwu", "YW"}, 
		{"YNJ", "�Ӽ�", "yanji", "YJ"}, 
		{"YCU", "�˳�", "yuncheng", "YC"}, 
		{"LLF", "����", "yongzhou", "YZ"}, 
		{"UYN", "����", "yulin", "YL"}, 
		{"ZYYL", "����", "yilan", "YL"}, 
		{"YUA", "Ԫı", "yuanmou", "YM"}, 
		{"YIN", "����", "yining", "YN"}, 
		{"CGO", "֣��", "zhengzhou", "ZZ"}, 
		{"ZUH", "�麣", "zhuhai", "ZH"}, 
		{"DYG", "�żҽ�", "zhangjiajie", "ZJJ"}, 
		{"HSN", "��ɽ", "zhoushan", "ZS"}, 
		{"ZYI", "����", "zunyi", "ZY"}, 
		{"ZHA", "տ��", "zhanjiang", "ZJ"}, 
		{"ZAT", "��ͨ", "zhaotong", "ZT"}
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TICKET_H__E2FFFB1D_F6AE_419D_BD3E_DD1127E33813__INCLUDED_)
