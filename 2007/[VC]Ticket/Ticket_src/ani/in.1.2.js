var gsug=null;
function textInit(){
	gsug=new apsug();
	gsug.init();
}
function gE(x){return document.getElementById(x);}
function gETop(x){var t=0;while(x){t+=x.offsetTop;x=x.offsetParent;}return t;}
function gEBottom(x){return (x.offsetHeight+gETop(x));}
function gELeft(x){var l=0;while(x){l+=x.offsetLeft;x=x.offsetParent;}return l;}
function gERight(x){return (x.offsetWidth+gELeft(x));}

function isUpDownKey(kc){
	if(kc==40 || kc==38 || kc == 33 || kc== 34){//down,up,pageup,pagedown,enter
		return true;
	}else{
		return false;
	}
}
function isCtrlKey(kc){
	if(kc==16 || kc==17 || kc == 18){//shift,ctrl,alt
		return true;
	}else{
		return false;
	}
}

var apdata = [['AOG','鞍山','anshan','AS'],
['AQG','安庆','anqing','AQ'],
['AYN','安阳','anyang','AY'],
['AKA','安康','ankang','AK'],
['AKU','阿克苏','akesu','AKS'],
['AAT','阿勒泰','aletai','ALT'],
['AVA','安顺','anshun','AS'],
['PEK','北京','beijing','BJ'],
['BFU','蚌埠','bengbu','BB'],
['BHY','北海','beihai','BH'],
['BSD','保山','baoshan','BS'],
['BAV','包头','baotou','BT'],
['CTU','成都','chengdu','CD'],
['CKG','重庆','chongqing','CQ'],
['CSX','长沙','changsha','CS'],
['CGQ','长春','changchun','CC'],
['CZX','常州','changzhou','CZ'],
['CGD','常德','changde','CD'],
['CEH','承德','chengde','CD'],
['CHG','朝阳','chaoyang','CY'],
['CIH','长治','changzhi','CZ'],
['CIF','赤峰','chifeng','CF'],
['BPX','昌都','changdu','CD'],
['CNI','长海','changhai','CH'],
['DLC','大连','dalian','DL'],
['DLU','大理','dali','DL'],
['DOY','东营','dongying','DY'],
['DNH','敦煌','dunhuang','DH'],
['DDG','丹东','dandong','DD'],
['DAT','大同','datong','DT'],
['DAX','达县','daxian','DX'],
['DIG','迪庆','diqing','DQ'],
['ENH','恩施','enshi','ES'],
['FOC','福州','fuzhou','FZ'],
['ZCP','佛山','foshan','FS'],
['FUG','阜阳','fuyang','FY'],
['FYN','富蕴','fuyun','FY'],
['CAN','广州','guangzhou','GZ'],
['KWL','桂林','guilin','GL'],
['KWE','贵阳','guiyang','GY'],
['KOW','赣州','ganzhou','GZ'],
['GOQ','格尔木','geermu','GEM'],
['GYS','广元','guangyuan','GY'],
['GHN','广汉','guanghan','GH'],
['HGH','杭州','hangzhou','HZ'],
['HRB','哈尔滨','haerbin','HEB'],
['HFE','合肥','hefei','HF'],
['HAK','海口','haikou','HK'],
['HET','呼和浩特','huhehaote','HHHT'],
['TXN','黄山','huangshan','HS'],
['HNY','衡阳','hengyang','HY'],
['HEK','黑河','heihe','HH'],
['HLD','海拉尔','hailaer','HLE'],
['HMI','哈密','hami','HM'],
['HYN','黄岩','huangyan','HY'],
['HZG','汉中','hanzhong','HZ'],
['HUZ','徽州','huizhou','HZ'],
['HTN','和田','hetian','HT'],
['TNA','济南','jinan','JN'],
['JIL','吉林','jilin','JL'],
['JZH','九寨沟','jiuzhaigou','JZG'],
['JDZ','景德镇','jingdezhen','JDZ'],
['JGS','井冈山','jinggangshan','JGS'],
['JNZ','锦州','jinzhou','JZ'],
['JJN','晋江/泉州','jinjiang','JJ'],
['JIU','九江','jiujiang','JJ'],
['JNG','济宁','jining','JN'],
['SHS','荆州','jingzhou','JZ'],
['JHG','景洪','jinghong','JH'],
['KNC','吉安','jian','JA'],
['JGN','嘉峪关','jiayuguan','JYG'],
['JMU','佳木斯','jiamusi','JMS'],
['CHW','酒泉','jiuquan','JQ'],
['KMG','昆明','kunming','KM'],
['KUS','昆山','kunshan','KS'],
['KHG','喀什','kashi','KS'],
['KCA','库车','kuche','KC'],
['KRL','库尔勒','kuerle','KEL'],
['KRY','克拉玛依','kelamayi','KLMY'],
['LHW','兰州','lanzhou','LZ'],
['LXA','拉萨','lasa','LS'],
['LJG','丽江','lijiang','LJ'],
['LUZ','庐山','lushan','LS'],
['LZO','泸州','luzhou','LZ'],
['LZH','柳州','liuzhou','LZ'],
['LYG','连云港','lianyungang','LYG'],
['LYA','洛阳','luoyang','LY'],
['LCX','龙岩','longyan','LY'],
['LCX','连城','liancheng','LC'],
['LYI','临沂','linyi','LY'],
['LNJ','临沧','lincang','LC'],
['LZY','林芝','linzhi','LZ'],
['LDG','罗定','luoding','LD'],
['WXN','梁平','Liangping','LP'],
['LXI','林西','linxi','LX'],
['MDG','牡丹江','mudanjiang','MDJ'],
['MIG','绵阳','mianyang','MY'],
['MXZ','梅县','meixian','MX'],
['NZH','满洲里','manzhouli','MZL'],
['LUM','芒市','mangshi','MS'],
['NKG','南京','nanjing','NJ'],
['KHN','南昌','nanchang','NC'],
['NGB','宁波','ningbo','NB'],
['NNG','南宁','nanning','NN'],
['NTG','南通','nantong','NT'],
['NNY','南阳','nanyang','NY'],
['NAO','南充','nanchong','NC'],
['WUS','南平','nanping','NP'],
['PZI','攀枝花','panzhihua','PZH'],
['SYM','普洱','puer','PE'],
['TAO','青岛','qingdao','QD'],
['SHP','秦皇岛','qinhuangdao','QHD'],
['JJN','泉州/晋江','quanzhou','QZ'],
['NDG','齐齐哈尔','qiqihaer','QQHE'],
['JUZ','衢州','quzhou','QZ'],
['IQM','且末','qiemo','QM'],
['IQN','庆阳','qingyang','QY'],
['SHA','上海','shanghai','SH'],
['SZX','深圳','shenzhen','SZ'],
['SHE','沈阳','shenyang','SY'],
['SYX','三亚','sanya','SY'],
['SJW','石家庄','shijiazhuang','SJZ'],
['SZV','苏州','suzhou','SZ'],
['SWA','汕头','shantou','ST'],
['SHS','沙市','shashi','SS'],
['SYM','思茅','simao','SM'],
['SSA','鄯善','shanshan','SS'],
['TSN','天津','tianjin','TJ'],
['TYN','太原','taiyuan','TY'],
['TNH','通化','tonghua','TH'],
['TGO','通辽','tongliao','TL'],
['TEN','铜仁','tongren','TR'],
['TCG','塔城','tacheng','TC'],
['WUH','武汉','wuhan','WH'],
['URC','乌鲁木齐','wulumuqi','WLMQ'],
['WNZ','温州','wenzhou','WZ'],
['WUX','无锡','wuxi','WX'],
['WEF','潍坊','weifang','WF'],
['WEH','威海','weihai','WH'],
['WUS','武夷山','wuyishan','WYS'],
['ZSWU','芜湖','wuhu','WH'],
['HLH','乌兰浩特','wulanhaote','WLHT'],
['WXN','万州','wanzhou','WZ'],
['WUZ','梧州','wuzhou','WZ'],
['WUA','乌海','wuhai','WH'],
['XIY','西安','xian','XA'],
['XMN','厦门','xiamen','XM'],
['XUZ','徐州','xuzhou','XZ'],
['XNN','西宁','xining','XN'],
['JHG','西双版纳','xishuangbanna','XSBN'],
['XFN','襄樊','xiangfan','XF'],
['XNT','邢台','xingtai','XT'],
['XIC','西昌','xichang','XC'],
['XEN','兴城','xingcheng','XC'],
['XIN','兴宁','xingning','XN'],
['XIL','锡林浩特','xilinhaote','XLHT'],
['YNT','烟台','yantai','YT'],
['YNZ','盐城','yancheng','YC'],
['INC','银川','yinchuan','YC'],
['ENY','延安','yanan','YA'],
['YBP','宜宾','yibin','YB'],
['YIH','宜昌','yichang','YC'],
['YIW','义乌','yiwu','YW'],
['YNJ','延吉','yanji','YJ'],
['YCU','运城','yuncheng','YC'],
['LLF','永州','yongzhou','YZ'],
['UYN','榆林','yulin','YL'],
['ZYYL','依兰','yilan','YL'],
['YUA','元谋','yuanmou','YM'],
['YIN','伊宁','yining','YN'],
['CGO','郑州','zhengzhou','ZZ'],
['ZUH','珠海','zhuhai','ZH'],
['DYG','张家界','zhangjiajie','ZJJ'],
['HSN','舟山','zhoushan','ZS'],
['ZYI','遵义','zunyi','ZY'],
['ZHA','湛江','zhanjiang','ZJ'],
['ZAT','昭通','zhaotong','ZT']
];
function apsug() {
	var inputobj = null;
	var sugdiv = null;

	var focusBySelect = false;
	var currInputObj = null;
	var prevInputValue = null;
	
	var showarr = null;
	var showfocus = - 1;
	var FOCity = null;
	var onDocumentClick = null;
}
apsug.prototype.setInputObj = function(o){
	o.onkeydown = OnInputKeyDown;
	o.onfocus = OnInputFocus;
	o.onblur = OnInputBlur;
}
apsug.prototype.init = function(){
	if(this.sugdiv==null){
		this.sugdiv=document.createElement('DIV');
		this.sugdiv.style.display='none';
		this.sugdiv.className='sug';
		this.sugdiv.innerHTML='';
		this.sugdiv.onscroll=OnSugScroll;
		var bs=document.getElementsByTagName('BODY');
		bs[0].appendChild(this.sugdiv);
	}
	this.focusBySelect = false;
}
function OnSugScroll(){
	if(gsug.currInputObj==null){return;}
	gsug.focusBySelect=true;
	gsug.currInputObj.focus();
//	gsug.getElementByTagName("LI").
}
function OnDocClick(e){
	var x,y,t,b,l,r;
	var d;
	if(window.event){
		e=window.event;
		x=e.clientX+document.body.parentNode.scrollLeft;
		y=e.clientY+document.body.parentNode.scrollTop;
	}else{
		x=e.pageX;
		y=e.pageY;
	}
	d=gsug.currInputObj;
	if(!d){document.onclick=gsug.onDocumentClick;return;}
	t=gETop(d);
	l=gELeft(d);
	b=gEBottom(d);
	r=gERight(d);
	if(x>=l && x<r && y>=t && y<b){return;}
	d=gsug.sugdiv;
	t=gETop(d);
	l=gELeft(d);
	b=gEBottom(d);
	r=gERight(d);
	if(x>=l && x<r && y>=t && y<b){return;}
	gsug.select();
}
var global_focus_flag=false;
var inString ='汉字、拼音或首字母';
function OnInputFocus(){
	if(gsug.currInputObj != null && gsug.currInputObj != this)
	{
		gsug.select_blur();
	}
	global_focus_flag = true;
	gsug.currInputObj = this;
	gsug.prevInputValue = null;
	if(this.value == inString) {
		this.value= '';
	}
	this.style.color = '';
	if(gsug.focusBySelect){
		gsug.focusBySelect=false;
		return;
	}
	gsug.focusBySelect=false;
	InputChecking();

}
function OnInputBlur(){
	var obj = gsug.currInputObj;
	if(obj != null)
	{
		if(obj.value == '')
		{
			if(gsug.sugdiv.style.display == "none")
			{
				obj.value = inString;
				obj.style.color = "#CCC";
			}
		}
		else
		{
			obj.style.color = "#000";
		}
	}
	return;
}
function InputChecking(){
	if(gsug.currInputObj == null){return;}
	var v=gsug.currInputObj.value;
	if(gsug.prevInputValue==null || gsug.prevInputValue!=v){
		gsug.update(v);
	}
	setTimeout("InputChecking()", 10);
}
function OnInputKeyDown(e){
	if(gsug.currInputObj==null){
		gsug.currInputObj = this;
		gsug.prevInputValue = null;
		InputChecking();
	}
	var bCtrlDown=0;
	if(!e && window.event){
		e=window.event;
	}
	if(window.event){
		bCtrlDown=e.ctrlKey;
	}else{
		bCtrlDown=(e.modifiers & Event.CONTROL_MASK) > 0;
	}
	if(bCtrlDown){
		return true;
	}
	var kc=e.keyCode;
	if(isCtrlKey(kc)){
		return true;
	}
	return (InputRealKeyDown(kc));
}
function InputRealKeyDown(kc) {
	global_focus_flag = false;
	if(isUpDownKey(kc)){
		if(kc==38){// up
			gsug.move(1,0);
		}else if(kc==40){//down
			gsug.move(1,1);
		}else if(kc==33){//pageup
			gsug.move(0,0);
		}else if(kc==34){//pagedown
			gsug.move(0,1);
		}
		return false;
	}else if(kc==13){//enter
		if(gsug.sugdiv.style.display==''){
			gsug.select();
			return false;
		}else{
			gsug.select();
		}
	}else if(kc==9){//tab
		gsug.select();
		return true;
	}else if(kc==27){//esc
		gsug.hide();
		return true;
	}
	return true;
}

apsug.prototype.select = function() {
	if(this.sugdiv.style.display=='none'){return false;}
	if(this.showfocus>=0 && this.showarr!=null && this.showfocus<this.showarr.length && this.currInputObj!=null){
		var i=this.showarr[this.showfocus];
		this.currInputObj.value=apdata[i][1];
		this.focusBySelect=true;
		this.currInputObj.focus();
		if(window.event){
			var r=this.currInputObj.createTextRange();
			r.move("character", r.text.length);
			r.select();
		}else{
			var v=apdata[i][1].length;
			this.currInputObj.setSelectionRange(v, v);
		}
		this.currInputObj.style.color = "#000";
	}
	this.hide();
	//this.currInputObj=null;
}

apsug.prototype.select_blur = function() {
	if(this.sugdiv.style.display=='none')
	{
		return false;
	}
	if(this.showfocus>=0 && this.showarr!=null && this.showfocus<this.showarr.length && this.currInputObj!=null){
		var i=this.showarr[this.showfocus];
		this.currInputObj.value=apdata[i][1];
		if(window.event){
			var r=this.currInputObj.createTextRange();
			r.move("character", r.text.length);
		}else{
			var v=apdata[i][1].length;
			this.currInputObj.setSelectionRange(v, v);
		}
	}

	var obj = this.currInputObj;
	if(obj.value == '' || obj.value == inString)
	{
		obj.style.color = "#CCC";
	}
	else
	{
		obj.style.color = "#000";
	}
	this.hide();
}
apsug.prototype.highlight = function(idx) {
	if(this.sugdiv.style.display=='none'){return false;}
	if(idx==this.showfocus){return true;}
	var i;
	var ls = this.sugdiv.getElementsByTagName('LI');
	if(this.showfocus>=0&&this.showfocus<ls.length){
		ls[this.showfocus].className='';
	}
	if(idx>=0&&this.showfocus<ls.length){
		ls[idx].className='hover';
		this.showfocus=parseInt(idx);
	}

}
apsug.prototype.move = function(m,n){
	var a=this.showfocus;
	if(m==1&&n==0){
		a--;
	}else if(m==1&&n==1){
		a++;
	}else if(m==0&&n==0){
		a-=5;
	}else if(m==0&&n==1){
		a+=5;
	}
	if(a<0){
		a=0;
	}else if(a>=this.showarr.length){
		a=this.showarr.length-1;
	}
	var i,j,k;
	i=(this.sugdiv.scrollTop)/20;
	if(a<=i){
		this.sugdiv.scrollTop=a*20;
	}else if(a>=i+10){
		this.sugdiv.scrollTop=(a-9)*20;
	}
	this.highlight(a);
}
apsug.prototype.hide = function(v) {
	if(this.sugdiv.style.display!='none'){
		this.sugdiv.style.display='none';
		document.onclick=this.onDocumentClick;
	}
}
apsug.prototype.update = function(v) {
	this.prevInputValue = v;
	v=v.toLowerCase();
	if(this.showfocus == null)
		this.showfocus = -1;
	if(this.showarr==null){
		this.showarr = new Array();
	}else{
		this.showarr.length = 0;
	}
	var i,j,s;
	if(v.length==0){//all
		for(i=0;i<apdata.length;i++){
			this.showarr[i]=i;
		}
	}else{
		for(i=0;i<apdata.length;i++){
			for(j=1;j<apdata[i].length;j++){
				if(apdata[i][j].toLowerCase().indexOf(v) == 0){
					this.showarr[this.showarr.length]=i;
					break;
				}
			}
		}
	}

	if(this.showarr.length<=0||(this.showarr.length==1&&v==apdata[this.showarr[0]][1])){
		this.hide();
		return;
	}
	if(global_focus_flag){
		return;
	}
	
	var obj = this.currInputObj;
	var strStyle = "left:" + gELeft(obj) + "px; top:" + gEBottom(obj) + "px;";
	var deltaX = 3;
	strStyle += "width:" + (obj.offsetWidth - deltaX) + "px;";
	strStyle += "display:'';";
	this.sugdiv.setAttribute("style", strStyle);
	this.sugdiv.style.cssText = strStyle;

	s='<ul>';
	for(i=0;i<this.showarr.length;i++){
		s+='<li'+(i==0?' class="hover"':'')+' onmousemove="gsug.highlight('+i+')" onclick="OnSugClick();">'+apdata[this.showarr[i]][1]+'('+apdata[this.showarr[i]][3]+')</li>';
	}
	s+='</ul>';
	this.sugdiv.innerHTML=s;
	this.showfocus=0;
	this.sugdiv.scrollTop = 0;
	this.onDocumentClick=document.onclick;
	document.onclick=OnDocClick;
}

function OnSugClick(){
	gsug.select();
}

function onUrl(From,to){
	var i,From_v,to_v,be_f;
	From = From.replace(/\s+/g,"");
	to = to.replace(/\s+/g,"");
	var be_f1 = false;
	var be_f2 = false;
	var flag = false;
	for(i=0;i<apdata.length;i++){
		if(From==inString || to ==inString){
			flag = true;
		}
		if(apdata[i][1]==From){
			From_v = apdata[i][0];
			be_f1 = true;
		}
		if(apdata[i][1]==to){
			to_v = apdata[i][0];
			be_f2 = true;
		}
		if (be_f1 && be_f2) break;
	}
	if((!be_f1 || !be_f2)&&!flag){
		alert ("你输入的城市名不在查询范围内");return false;
	}
	else if(document.s.t.value == inString || document.s.q.value == inString){
		return false;
	}
	else if(From == to&&!flag) { alert("出发城市和到达城市重复！");return false;}
	if(From_v!=''){document.s.From.value = From_v;}else document.s.From.value = "";
	if(to_v!=''){document.s.to.value = to_v;}else document.s.to.value = "";
	return true;
}
function on_load_url(){
	if(st_city=='NAY'){st_city='PEK'}
	if(st_city=='PVG'){st_city='SHA'}
	if(en_city=='NAY'){en_city='PEK'}
	if(en_city=='PVG'){en_city='SHA'}
	var i,f_v,t_v;
	var result;
	for(i=0;i<apdata.length;i++){
		if(apdata[i][0]==st_city){
			f_v = apdata[i][1];
		}
		 if(apdata[i][0]==en_city){
			t_v = apdata[i][1];
		}
		
	}

	result = new Array(f_v,t_v);
	return result;
} 

function on_load_url_index(){
	var fromcity,cf,ct;
        cf=getCookie("jpFrom");
        ct=getCookie("jpTo");
	fromcity = document.s.fromCity.value;
	if(!cf){
		if(fromcity=='其它'){
			document.s.t.value = inString;
			document.s.t.style.color="#CCC";
			document.title='酷讯机票 - 特价机票、比价机票、打折机票、机票查询，酷讯生活搜索';
		}else if(fromcity=='北京'){
			document.s.t.value = "北京";
			document.s.t.style.color="";
			document.title='北京机票 - 特价机票、比价机票、打折机票、机票查询，酷讯生活搜索';
		}else if(fromcity=='上海'){
			document.s.t.value = "上海";
			document.s.t.style.color="";
			document.title='上海机票 - 特价机票、比价机票、打折机票、机票查询，酷讯生活搜索';

		}else{
			document.s.t.value = fromcity;
			document.s.t.style.color="";
			document.title=fromcity+'机票 - 特价机票、比价机票、打折机票、机票查询，酷讯生活搜索';
		}
	}else{
		for(i=0;i<apdata.length;i++){
			if(apdata[i][0]==cf){
                        document.s.t.value = apdata[i][1];
			}    
		}
	}
	if(!ct){
		document.s.q.value = inString;
		if(document.s.q.value == inString){
			document.s.q.style.color="#CCC";
		}
		else{
			document.s.q.style.color="#FFF";
		}
	}else{
		for(i=0;i<apdata.length;i++){
                        if(apdata[i][0]==ct){
	                        document.s.q.value = apdata[i][1];
                        }                    
                }


	}
	return true;
}

window.onresize = function()
{
	var sugdiv = gsug.sugdiv;
	if(sugdiv && sugdiv.style.display != 'none')
	{
		var obj = gsug.currInputObj;
		var strStyle = "left:" + gELeft(obj) + "px; top:" + gEBottom(obj) + "px;";
		sugdiv.setAttribute("style", strStyle);
		sugdiv.style.cssText = strStyle;
	}

}
