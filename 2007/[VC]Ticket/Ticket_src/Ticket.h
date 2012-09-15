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

// 机场全局变量
const unsigned int AIRPORT_CNT = 177;
const CString AirportData[AIRPORT_CNT][4] =
	{
		{"AOG", "鞍山", "anshan", "AS"}, 
		{"AQG", "安庆", "anqing", "AQ"}, 
		{"AYN", "安阳", "anyang", "AY"}, 
		{"AKA", "安康", "ankang", "AK"}, 
		{"AKU", "阿克苏", "akesu", "AKS"}, 
		{"AAT", "阿勒泰", "aletai", "ALT"}, 
		{"AVA", "安顺", "anshun", "AS"}, 
		{"PEK", "北京", "beijing", "BJ"}, 
		{"BFU", "蚌埠", "bengbu", "BB"}, 
		{"BHY", "北海", "beihai", "BH"}, 
		{"BSD", "保山", "baoshan", "BS"}, 
		{"BAV", "包头", "baotou", "BT"}, 
		{"CTU", "成都", "chengdu", "CD"}, 
		{"CKG", "重庆", "chongqing", "CQ"}, 
		{"CSX", "长沙", "changsha", "CS"}, 
		{"CGQ", "长春", "changchun", "CC"}, 
		{"CZX", "常州", "changzhou", "CZ"}, 
		{"CGD", "常德", "changde", "CD"}, 
		{"CEH", "承德", "chengde", "CD"}, 
		{"CHG", "朝阳", "chaoyang", "CY"}, 
		{"CIH", "长治", "changzhi", "CZ"}, 
		{"CIF", "赤峰", "chifeng", "CF"}, 
		{"BPX", "昌都", "changdu", "CD"}, 
		{"CNI", "长海", "changhai", "CH"}, 
		{"DLC", "大连", "dalian", "DL"}, 
		{"DLU", "大理", "dali", "DL"}, 
		{"DOY", "东营", "dongying", "DY"}, 
		{"DNH", "敦煌", "dunhuang", "DH"}, 
		{"DDG", "丹东", "dandong", "DD"}, 
		{"DAT", "大同", "datong", "DT"}, 
		{"DAX", "达县", "daxian", "DX"}, 
		{"DIG", "迪庆", "diqing", "DQ"}, 
		{"ENH", "恩施", "enshi", "ES"}, 
		{"FOC", "福州", "fuzhou", "FZ"}, 
		{"ZCP", "佛山", "foshan", "FS"}, 
		{"FUG", "阜阳", "fuyang", "FY"}, 
		{"FYN", "富蕴", "fuyun", "FY"}, 
		{"CAN", "广州", "guangzhou", "GZ"}, 
		{"KWL", "桂林", "guilin", "GL"}, 
		{"KWE", "贵阳", "guiyang", "GY"}, 
		{"KOW", "赣州", "ganzhou", "GZ"}, 
		{"GOQ", "格尔木", "geermu", "GEM"}, 
		{"GYS", "广元", "guangyuan", "GY"}, 
		{"GHN", "广汉", "guanghan", "GH"}, 
		{"HGH", "杭州", "hangzhou", "HZ"}, 
		{"HRB", "哈尔滨", "haerbin", "HEB"}, 
		{"HFE", "合肥", "hefei", "HF"}, 
		{"HAK", "海口", "haikou", "HK"}, 
		{"HET", "呼和浩特", "huhehaote", "HHHT"}, 
		{"TXN", "黄山", "huangshan", "HS"}, 
		{"HNY", "衡阳", "hengyang", "HY"}, 
		{"HEK", "黑河", "heihe", "HH"}, 
		{"HLD", "海拉尔", "hailaer", "HLE"}, 
		{"HMI", "哈密", "hami", "HM"}, 
		{"HYN", "黄岩", "huangyan", "HY"}, 
		{"HZG", "汉中", "hanzhong", "HZ"}, 
		{"HUZ", "徽州", "huizhou", "HZ"}, 
		{"HTN", "和田", "hetian", "HT"}, 
		{"TNA", "济南", "jinan", "JN"}, 
		{"JIL", "吉林", "jilin", "JL"}, 
		{"JZH", "九寨沟", "jiuzhaigou", "JZG"}, 
		{"JDZ", "景德镇", "jingdezhen", "JDZ"}, 
		{"JGS", "井冈山", "jinggangshan", "JGS"}, 
		{"JNZ", "锦州", "jinzhou", "JZ"}, 
		{"JJN", "晋江/泉州", "jinjiang", "JJ"}, 
		{"JIU", "九江", "jiujiang", "JJ"}, 
		{"JNG", "济宁", "jining", "JN"}, 
		{"SHS", "荆州", "jingzhou", "JZ"}, 
		{"JHG", "景洪", "jinghong", "JH"}, 
		{"KNC", "吉安", "jian", "JA"}, 
		{"JGN", "嘉峪关", "jiayuguan", "JYG"}, 
		{"JMU", "佳木斯", "jiamusi", "JMS"}, 
		{"CHW", "酒泉", "jiuquan", "JQ"}, 
		{"KMG", "昆明", "kunming", "KM"}, 
		{"KUS", "昆山", "kunshan", "KS"}, 
		{"KHG", "喀什", "kashi", "KS"}, 
		{"KCA", "库车", "kuche", "KC"}, 
		{"KRL", "库尔勒", "kuerle", "KEL"}, 
		{"KRY", "克拉玛依", "kelamayi", "KLMY"}, 
		{"LHW", "兰州", "lanzhou", "LZ"}, 
		{"LXA", "拉萨", "lasa", "LS"}, 
		{"LJG", "丽江", "lijiang", "LJ"}, 
		{"LUZ", "庐山", "lushan", "LS"}, 
		{"LZO", "泸州", "luzhou", "LZ"}, 
		{"LZH", "柳州", "liuzhou", "LZ"}, 
		{"LYG", "连云港", "lianyungang", "LYG"}, 
		{"LYA", "洛阳", "luoyang", "LY"}, 
		{"LCX", "龙岩", "longyan", "LY"}, 
		{"LCX", "连城", "liancheng", "LC"}, 
		{"LYI", "临沂", "linyi", "LY"}, 
		{"LNJ", "临沧", "lincang", "LC"}, 
		{"LZY", "林芝", "linzhi", "LZ"}, 
		{"LDG", "罗定", "luoding", "LD"}, 
		{"WXN", "梁平", "Liangping", "LP"}, 
		{"LXI", "林西", "linxi", "LX"}, 
		{"MDG", "牡丹江", "mudanjiang", "MDJ"}, 
		{"MIG", "绵阳", "mianyang", "MY"}, 
		{"MXZ", "梅县", "meixian", "MX"}, 
		{"NZH", "满洲里", "manzhouli", "MZL"}, 
		{"LUM", "芒市", "mangshi", "MS"}, 
		{"NKG", "南京", "nanjing", "NJ"}, 
		{"KHN", "南昌", "nanchang", "NC"}, 
		{"NGB", "宁波", "ningbo", "NB"}, 
		{"NNG", "南宁", "nanning", "NN"}, 
		{"NTG", "南通", "nantong", "NT"}, 
		{"NNY", "南阳", "nanyang", "NY"}, 
		{"NAO", "南充", "nanchong", "NC"}, 
		{"WUS", "南平", "nanping", "NP"}, 
		{"PZI", "攀枝花", "panzhihua", "PZH"}, 
		{"SYM", "普洱", "puer", "PE"}, 
		{"TAO", "青岛", "qingdao", "QD"}, 
		{"SHP", "秦皇岛", "qinhuangdao", "QHD"}, 
		{"JJN", "泉州/晋江", "quanzhou", "QZ"}, 
		{"NDG", "齐齐哈尔", "qiqihaer", "QQHE"}, 
		{"JUZ", "衢州", "quzhou", "QZ"}, 
		{"IQM", "且末", "qiemo", "QM"}, 
		{"IQN", "庆阳", "qingyang", "QY"}, 
		{"SHA", "上海", "shanghai", "SH"}, 
		{"SZX", "深圳", "shenzhen", "SZ"}, 
		{"SHE", "沈阳", "shenyang", "SY"}, 
		{"SYX", "三亚", "sanya", "SY"}, 
		{"SJW", "石家庄", "shijiazhuang", "SJZ"}, 
		{"SZV", "苏州", "suzhou", "SZ"}, 
		{"SWA", "汕头", "shantou", "ST"}, 
		{"SHS", "沙市", "shashi", "SS"}, 
		{"SYM", "思茅", "simao", "SM"}, 
		{"SSA", "鄯善", "shanshan", "SS"}, 
		{"TSN", "天津", "tianjin", "TJ"}, 
		{"TYN", "太原", "taiyuan", "TY"}, 
		{"TNH", "通化", "tonghua", "TH"}, 
		{"TGO", "通辽", "tongliao", "TL"}, 
		{"TEN", "铜仁", "tongren", "TR"}, 
		{"TCG", "塔城", "tacheng", "TC"}, 
		{"WUH", "武汉", "wuhan", "WH"}, 
		{"URC", "乌鲁木齐", "wulumuqi", "WLMQ"}, 
		{"WNZ", "温州", "wenzhou", "WZ"}, 
		{"WUX", "无锡", "wuxi", "WX"}, 
		{"WEF", "潍坊", "weifang", "WF"}, 
		{"WEH", "威海", "weihai", "WH"}, 
		{"WUS", "武夷山", "wuyishan", "WYS"}, 
		{"ZSWU", "芜湖", "wuhu", "WH"}, 
		{"HLH", "乌兰浩特", "wulanhaote", "WLHT"}, 
		{"WXN", "万州", "wanzhou", "WZ"}, 
		{"WUZ", "梧州", "wuzhou", "WZ"}, 
		{"WUA", "乌海", "wuhai", "WH"}, 
		{"XIY", "西安", "xian", "XA"}, 
		{"XMN", "厦门", "xiamen", "XM"}, 
		{"XUZ", "徐州", "xuzhou", "XZ"}, 
		{"XNN", "西宁", "xining", "XN"}, 
		{"JHG", "西双版纳", "xishuangbanna", "XSBN"}, 
		{"XFN", "襄樊", "xiangfan", "XF"}, 
		{"XNT", "邢台", "xingtai", "XT"}, 
		{"XIC", "西昌", "xichang", "XC"}, 
		{"XEN", "兴城", "xingcheng", "XC"}, 
		{"XIN", "兴宁", "xingning", "XN"}, 
		{"XIL", "锡林浩特", "xilinhaote", "XLHT"}, 
		{"YNT", "烟台", "yantai", "YT"}, 
		{"YNZ", "盐城", "yancheng", "YC"}, 
		{"INC", "银川", "yinchuan", "YC"}, 
		{"ENY", "延安", "yanan", "YA"}, 
		{"YBP", "宜宾", "yibin", "YB"}, 
		{"YIH", "宜昌", "yichang", "YC"}, 
		{"YIW", "义乌", "yiwu", "YW"}, 
		{"YNJ", "延吉", "yanji", "YJ"}, 
		{"YCU", "运城", "yuncheng", "YC"}, 
		{"LLF", "永州", "yongzhou", "YZ"}, 
		{"UYN", "榆林", "yulin", "YL"}, 
		{"ZYYL", "依兰", "yilan", "YL"}, 
		{"YUA", "元谋", "yuanmou", "YM"}, 
		{"YIN", "伊宁", "yining", "YN"}, 
		{"CGO", "郑州", "zhengzhou", "ZZ"}, 
		{"ZUH", "珠海", "zhuhai", "ZH"}, 
		{"DYG", "张家界", "zhangjiajie", "ZJJ"}, 
		{"HSN", "舟山", "zhoushan", "ZS"}, 
		{"ZYI", "遵义", "zunyi", "ZY"}, 
		{"ZHA", "湛江", "zhanjiang", "ZJ"}, 
		{"ZAT", "昭通", "zhaotong", "ZT"}
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_TICKET_H__E2FFFB1D_F6AE_419D_BD3E_DD1127E33813__INCLUDED_)
