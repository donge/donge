/* functions  start */
function IsUncachedEmpty(){
	for(var i=0;i<gUncachedSites.length;i++){
		if(gUncachedSites[i].length>0)	break;
	}
	if(i == gUncachedSites.length) return true;
	return false;
}
function getElementByAttribName(obj, attrib, attribvalue, tij){
	var plist = obj.getElementsByTagName(tij);
	for(i=0;i<plist.length;i++)	{
		if(plist[i].getAttribute(attrib) == attribvalue)	return plist[i];
	}
	return null;
}
function displayRect(obj){
	if(obj)	obj.style.display = "";
}
function undisplayRect(obj){
	if(obj) obj.style.display = "none";
}
function comp1(node1 , node2){
	if(node1.price != node2.price)
		return node1.price - node2.price
	else
		return node2.pri - node1.pri
}
function comp2(node1 , node2){
	if(node1.pri != node2.pri)
		return node2.pri - node1.pri
	else
		return node1.price - node2.price
}
function sortLineData(m){
	var fitem = new Array();
	if(gAgents[m].length>1){
		gAgents[m].sort(comp1);
		fitem.push(gAgents[m].shift());
		if(gAgents[m].length>1){
			gAgents[m].sort(comp2);
			fitem.push(gAgents[m].shift());
			fitem.push(gAgents[m].shift());
			if(gAgents[m].length>1){
				gAgents[m].sort(comp1);
			}
		}       
		gAgents[m] = fitem.concat(gAgents[m]);
	}
}
var order = new Array();
function sortData(bu){
	var i,j,m,l,lp,t;
	var pa,pb,pl,pp;
	l=gFlights.length;
	for(i=0;i<l;i++){
		k=i;
		for(j=i+1;j<l;j++){
			pa=gFlights[k][gSortRow];
			pb=gFlights[j][gSortRow];
		//	if((gSortDir&&pa>pb) || (!gSortDir&&pa<pb)){
			if((gSortDir&&((pa>pb)||((pa==pb)&&(gFlights[k][1]<gFlights[j][1])))) || (!gSortDir&&((pa<pb)||((pa==pb)&&(gFlights[k][1]>gFlights[j][1]))))){
				k=j;
			}
		}
		if(k!=i){
			t=gFlights[i];
			gFlights[i]=gFlights[k];
			gFlights[k]=t;
			t = used[gFlights[i][2]]; m=used[gFlights[k][2]];
			used[gFlights[i][2]] = m;
			used[gFlights[k][2]] = t;
		}
	}
	for(i=0,j=0,pl=0;i<l;i++){
		if(pl==0 || gFlights[i][0]<pl || (gFlights[i][0]==pl && gFlights[i][1]>pp)){
			pl=gFlights[i][0];
			pp=gFlights[i][1];
			j=i;
		}
	}
	if(l>0 && bu){
		gLowerPrice = pl;
		gLowerLine = j;
	}
	for(key in used){
		order[used[key]] = key;
	}
}
function resortData(d){
	if(gSortRow==d){
		gSortDir=!gSortDir;
	}else{
		gSortRow=d;
		gSortDir=true;
	}
	sortData(false);
	showData(0);
}
function GetAirPortCode(port,code){
	if(port =='北京首都机场') return 'PEK';
	else if(port =='北京南苑机场') return 'NAY';
	else if(port =='上海虹桥机场') return 'SHA';
	else if(port =='上海浦东机场') return 'PVG';
	else return code ;
}
function GetRevisedCityCode(strCityCode){
	if(strCityCode == "NAY") return "PEK";
	else if(strCityCode == "PVG") return "SHA";
        else if(strCityCode == "SHA") return "PVG";
        else if(strCityCode == "PEK") return "NAY";
	else return strCityCode;
}
function GetReviseCityCode(strCityCode){
        if(strCityCode == "NAY") return "PEK";
        else if(strCityCode == "PVG") return "SHA";
	else return strCityCode
}
function GetZhekou(price){
	if (!(full_price > 0 && price > 0 && price < full_price))
		return 0;
	var zk0 = parseInt(Math.ceil(100.0*price/full_price)+0.5);
	var zk1 = zk0 + 1;
	var zk2 = zk0 - 1;
	var pr0 = parseInt((zk0*full_price+500)/1000)*10;
	var pr1 = parseInt((zk1*full_price+500)/1000)*10;
	var pr2 = parseInt((zk2*full_price+500)/1000)*10;
	var zk = 0;
	if ((zk0 % 5) == 0 && pr0 == price)
		zk = zk0;
	else if ((zk1 % 5) == 0 && pr1 == price)
		zk = zk1;
	else if ((zk2 % 5) == 0 && pr2 == price)
		zk = zk2;
	else
		zk = zk0;
	if (zk > 99)
		zk = 99;
	if (zk < 1)
		zk = 1;
	return zk/10;
}
function GetCnCtime(vctime,ifcol){
	var vcoltime;
	if(vctime=="") {vctime="2分钟";vcoltime="<font color=red>2</font>分钟";}
	else{
		vctime=cur_time-parseInt(vctime);
		if(vctime<=60) {vctime="1分钟";vcoltime="<font color=red>1</font>分钟";}
		else{
			vctime=Math.ceil(vctime/60);
			if(vctime<60) {vcoltime='<font color=red>'+vctime+"</font>分钟";vctime=vctime+"分钟";}
			else{
				vctime=Math.floor(vctime/60);
				if(vctime>5) vctime=5;
				vcoltime='<font color=red>'+vctime+"</font>小时";vctime=vctime+"小时";
			}
		}
	}
	if(ifcol) return vcoltime;
	else return vctime;
}
/* functions  end */
/* functions for jixing begin */
var playdetail330 = new Array("空客A330","宽体","256","412","330");
var playdetail737 = new Array("波音737","窄体","92","189","737");
var playdetail763 = new Array("波音767-300","宽体","203","290","763");
var playdetail300 = new Array("空客A300","宽体","－","266","300");
var playdetail321 = new Array("空客A321","窄体","174","220","321");
var playdetail340 = new Array("空客A340","宽体","228","420","340");
var playdetail333 = new Array("空客A330-300","宽体","256","412","333");
var playdetail738 = new Array("波音737-800","窄体","144","189","738");
var playdetail73G = new Array("波音737-700","窄体","137","－","73G");
var playdetail777 = new Array("波音777","宽体","281","440","777");
var playdetail757 = new Array("波音757","窄体","148","239","757");
var playdetail734 = new Array("波音737-400","窄体","144","171","734");
var playdetail320 = new Array("空客A320","窄体","123","180","320");
var playdetail319 = new Array("空客A319","窄体","112","134","319");
var playdetail762 = new Array("波音767-200","宽体","161","234","762");
var playdetail733 = new Array("波音737-300","窄体","102","145","733");
var playdetail74E = new Array("波音747-400","宽体","287","420","74E");
var playdetail767 = new Array("波音767","宽体","161","290","767");
var playdetail772 = new Array("波音777-200","宽体","281","440","772");
var playdetail77B = new Array("-","-","-","-","77B");
var playdetailM90 = new Array("麦道MD-90","-","-","-","M90");
var playdetail739 = new Array("波音739","-","-","-","739");
var playdetail73A = new Array("波音737-200","窄体","109","148","73A");
var playdetailCRJ = new Array("-","-","-","-","CRJ");
var playdetailAB6 = new Array("空客A300-600","宽体","207","317","AB6");
var arrplaytypes = new Array("330","737","763","300","321","340","333","738","73G","777","757","734","320","319","762","733","74E","767","772","77B","M90","739","73A","CRJ","AB6");
var arrallplaydetail = new Array(playdetail330,playdetail737,playdetail763,playdetail300,playdetail321,playdetail340,playdetail333,playdetail738,playdetail73G,playdetail777,playdetail757,playdetail734,playdetail320,playdetail319,playdetail762 ,playdetail733 ,playdetail74E,playdetail767,playdetail772,playdetail77B,playdetailM90,playdetail739,playdetail73A,playdetailCRJ,playdetailAB6);
var   offsetx   =   -130; var   offsety   =   10;
var   mousex   =   0; var   mousey   =   0;
var   lastplanetype = 0;
var   lastmousex = 0;var   lastmousey = 0;
function getplanedetail(planetype){
	var j = arrplaytypes.length+1;
	var playdetail = new Array();
	for (i=0;i<arrplaytypes.length;i++){
		if (arrplaytypes[i]==planetype){
			j=i;
			break;
		}
	}
	if (j>arrplaytypes.length){
		for (k=0;k<4;k++){
			playdetail[k]="-";
		}
		playdetail[4]="../img/planegif/739.gif";
	}else{
		for (k=0;k<4;k++){
			playdetail[k]=arrallplaydetail[j][k];
		}
		playdetail[4]="../img/planegif/"+arrallplaydetail[j][4]+".gif";
	}
	return playdetail;
}
function   showplane(planetype,evt) {
	var cx = 0;	var cy = 0;
	cx = evt.x?evt.x:evt.pageX;
	cy = evt.y?evt.y:evt.pageY;
	var isMSIE = (navigator.appName == "Microsoft Internet Explorer");
	var isFirefox= (window.event==null);
	if(isMSIE){
		var mousex = cx+document.documentElement.scrollLeft;
		var mousey = cy+document.documentElement.scrollTop;
	}else
	{var mousex=cx;var mousey=cy;}
	if ((planetype==lastplanetype)&&(Math.abs(lastmousex-mousex)<10)&&(Math.abs(lastmousey-mousey)<10)){
		if (gE("overDiv").style.display   ==   "")
			gE("overDiv").style.display   =   "none";
		else{
			log_info('kxjpjixing');
			gE("overDiv").style.display   =   "";
		}
	}else{
		gE("overDiv").style.display   =   "none";
		lastplanetype = planetype;
		lastmousex = mousex;
		lastmousey = mousey;
		var playdetail=getplanedetail(planetype);
		var  txt  = '<table style="BORDER-RIGHT: #b1c8ff 3px solid; BORDER-TOP: #b1c8ff 3px solid; BORDER-LEFT: #b1c8ff 3px solid; BORDER-BOTTOM: #b1c8ff 3px solid" cellSpacing=0 cellPadding=0 width=260 align=center border=0>';
		txt  =    txt+'<tbody>';
		txt  =    txt+'<tr>';
		txt  =    txt+'<td style="BORDER-RIGHT: #5b91ff 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #5b91ff 1px solid; PADDING-LEFT: 2px; FONT-WEIGHT: bold; FONT-SIZE: 13px; PADDING-BOTTOM: 2px; MARGIN: 2px 0px; BORDER-LEFT: #5b91ff 1px solid; COLOR: #003399; PADDING-TOP: 2px; cursor:pointer; BORDER-BOTTOM: #5b91ff 1px" onclick=window.parent.closeshow(); colSpan=5>'+playdetail[0]+'<SPAN style="FONT-SIZE: 13px; FLOAT: right; MARGIN: -14px 2px 0px 0px; TEXT-DECORATION: none">【关闭】</SPAN></td>';
		txt  =    txt+'</tr>';
		txt  =    txt+'<tr>';
		txt  =    txt+'<td style="BORDER-RIGHT: #5b91ff 1px solid; PADDING-RIGHT: 0px; BORDER-TOP: #5b91ff 1px solid; PADDING-LEFT: 2px; FONT-WEIGHT: bold; FONT-SIZE: 12px; PADDING-BOTTOM: 1px; BORDER-LEFT: #5b91ff 1px solid; COLOR: #3778ff; PADDING-TOP: 1px; BORDER-BOTTOM: #5b91ff 1px solid" width=31>机型</td>';
		txt  =    txt+'<td style="BORDER-RIGHT: #5b91ff 1px solid; BORDER-TOP: #5b91ff 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 12px; BORDER-LEFT: #5b91ff 1px; COLOR: #3778ff; BORDER-BOTTOM: #5b91ff 1px solid" width=77>机型名称</td>';
		txt  =    txt+'<td style="BORDER-RIGHT: #5b91ff 1px solid; BORDER-TOP: #5b91ff 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 12px; BORDER-LEFT: #5b91ff 1px; COLOR: #3778ff; BORDER-BOTTOM: #5b91ff 1px solid" width=36>类型</td>';
		txt  =    txt+'<td style="BORDER-RIGHT: #5b91ff 1px solid; BORDER-TOP: #5b91ff 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 12px; BORDER-LEFT: #5b91ff 1px; COLOR: #3778ff; BORDER-BOTTOM: #5b91ff 1px solid" width=56>最少座位</td>';
		txt  =    txt+'<td style="BORDER-RIGHT: #5b91ff 1px solid; BORDER-TOP: #5b91ff 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 12px; BORDER-LEFT: #5b91ff 1px; COLOR: #3778ff; BORDER-BOTTOM: #5b91ff 1px solid" width=60>最多座位</td>';
		txt  =    txt+'</tr>';
		txt  =    txt+'<tr>';
		txt  =    txt+'<td style="BORDER-RIGHT: #5b91ff 1px solid; PADDING-RIGHT: 0px; BORDER-TOP: #5b91ff 1px solid; PADDING-LEFT: 2px; FONT-WEIGHT: bold; FONT-SIZE: 12px; PADDING-BOTTOM: 1px; BORDER-LEFT: #5b91ff 1px solid; COLOR: #3778ff; PADDING-TOP: 1px; BORDER-BOTTOM: #5b91ff 1px solid" width=31>'+planetype+'</td>';
		txt  =    txt+'<td style="BORDER-RIGHT: #5b91ff 1px solid; BORDER-TOP: #5b91ff 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 12px; BORDER-LEFT: #5b91ff 1px; COLOR: #3778ff; BORDER-BOTTOM: #5b91ff 1px solid" width=77>'+playdetail[0]+'</td>';
		txt  =    txt+'<td style="BORDER-RIGHT: #5b91ff 1px solid; BORDER-TOP: #5b91ff 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 12px; BORDER-LEFT: #5b91ff 1px; COLOR: #3778ff; BORDER-BOTTOM: #5b91ff 1px solid" width=36>'+playdetail[1]+'</td>';
		txt  =    txt+'<td style="BORDER-RIGHT: #5b91ff 1px solid; BORDER-TOP: #5b91ff 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 12px; BORDER-LEFT: #5b91ff 1px; COLOR: #3778ff; BORDER-BOTTOM: #5b91ff 1px solid" width=56>'+playdetail[2]+'</td>';
		txt  =    txt+'<td style="BORDER-RIGHT: #5b91ff 1px solid; BORDER-TOP: #5b91ff 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 12px; BORDER-LEFT: #5b91ff 1px; COLOR: #3778ff; BORDER-BOTTOM: #5b91ff 1px solid" width=60>'+playdetail[3]+'</td>';
		txt  =    txt+'</tr>';
		txt  =    txt+'<tr>';
		if(isMSIE)
			txt  =    txt+'<td style="BORDER-RIGHT: #5b91ff 1px solid; BORDER-TOP: #5b91ff 1px; MARGIN: 4px 0px; BORDER-LEFT: #5b91ff 1px solid; BORDER-BOTTOM: #5b91ff 1px solid" align=middle colSpan=5><IMG style="BORDER-RIGHT: #999 1px solid; PADDING-RIGHT: 1px; BORDER-TOP: #999 1px solid; MARGIN-TOP: 5px; PADDING-LEFT: 1px; PADDING-BOTTOM: 1px; BORDER-LEFT: #999 1px solid; PADDING-TOP: 1px; BORDER-BOTTOM: #999 1px solid"  src="'+playdetail[4]+'"> </td>'
		else
			txt  =    txt+'<td style="BORDER-RIGHT: #5b91ff 1px solid; BORDER-TOP: #5b91ff 1px; MARGIN: 4px 0px; BORDER -LEFT: #5b91ff 1px solid; BORDER-BOTTOM: #5b91ff 1px solid" align=middle colSpan=5><IMG style="BORDER-RIGHT: #999 1px solid; PADDING-RIGHT: 1px; BORDER-TOP: #999 1px solid; MARGIN-TOP: 5px;MARGIN-LEFT:5px; PADDING-LEFT: 1px; PADDING-BOTTOM: 1px; BORDER-LEFT: #999 1px solid; PADDING-TOP: 1px; BORDER-BOTTOM: #999 1px solid"  src="'+playdetail[4]+'"> </td>'
		txt  =    txt+'</tr></tbody></table>';
		gE("overDiv").innerHTML   =   txt;
		gE("overDiv").style.left   =   mousex+offsetx+"px";
		gE("overDiv").style.top   =   mousey+offsety+"px";
		gE("overDiv").style.width   =  "260px";
		gE("overDiv").style.display   =   "";
		log_info('kxjpjixing');
	}
}
function closeshow(){
	gE("overDiv").style.display   =   "none";
}
/* functions for jixing end */
/* functions for showdata begin */
function initData(){
	var ra=uncached.split('\n');
	var rb;
	gUncachedSites[0].length=0;
	for(i=0; i<ra.length; i++){
		rb=ra[i].split('\t');
		if(rb.length<2) continue;
		gUncachedSites[0][gUncachedSites[0].length]=rb[0];
	}
	for(i=1;i<gGetAllSites*2;i++){
		gUncachedSites[i] = new Array();
		for( j=0;j<all_sites_arr.length;j++){
			gUncachedSites[i][j] = j;
		}
	}
	if(gGetAllSites && gUncachedSites[0].length==0 ) curUnCached = 1;
	newDataArray(cached.split('\n'));
	showData(0);
	if(gFlights.length>0){
		log_firstlow();	
	}
	showProcess()
	showAd();
	setTimeout("moreData()", 3000);
}
function newDataArray(ra){
	var i,j,m,n,rb;
	var no,price,proxy,vurl,ftime,ttime,fplain,tplain,corp,vtype,ctime,zhekou,pri,siteno,vno,stport,enport;
	var fitem;
	for(i=0; i<ra.length; i++){
		rb=ra[i].split('\t');
		if(rb.length<11) continue;
		no=rb[1];if(no=="" || no.length<3) continue;
		price=rb[2];if(price=="" || price.length<2) continue;
		price=parseInt(price); if(price<=0) continue;
		proxy=rb[3]; if(proxy =="") continue;
		vurl=rb[4]; if(vurl =="") continue;
		ftime=rb[5];ttime=rb[6];fplain=rb[7];tplain=rb[8];corp=rb[9];vtype=rb[10];ctime=rb[11];
		pri=0;
		for(j=0;j<all_sites_arr.length;j++){
			if(all_sites_arr[j]==proxy){
				pri=parseInt(site_pri_addr[j]);
				break;
			}else pri=parseInt(site_pri_addr[20]);
		}
		if(full_price&&full_price>0)
			zhekou = GetZhekou(price);
		else
			zhekou = 0;
		siteno = ((j==all_sites_arr.length)?20:j);
		if(used[no]!= null){
			n = gAgents[no];
			for(m=0;m<n.length;m++){
				if(siteno == n[m].siteno){
					gAgents[no][m] = {"price":price,"vurl":vurl,"ctime":ctime,"pri":pri,"siteno":siteno,"proxy":proxy,"zhekou":zhekou}
					break;
				}
			}
			if(m == n.length){
				gAgents[no][gAgents[no].length]= {"price":price,"vurl":vurl,"ctime":ctime,"pri":pri,"siteno":siteno,"proxy":proxy,"zhekou":zhekou}
				gTotalInfoNum++
			}	
			var tt = used[no];
			if(price < gFlights[tt][0] || (pri > gFlights[tt][1] && price==gFlights[tt][0] )){
				gFlights[tt][0] = price; gFlights[tt][1]=pri;gFlights[tt][11]=zhekou;gFlights[tt][12]=siteno;gFlights[tt][13]=proxy;gFlights[tt][14]=vurl;gFlights[tt][15]=ctime;
			}
		}else{
			if(st_port) stport = st_port
			else stport = GetAirPortCode(fplain,st_port)
			if(en_port) enport = en_port
			else enport = GetAirPortCode(tplain,en_port)
			used[no] = gFlights.length;
			gFlights[gFlights.length] = Array(price,pri,no,ftime,ttime,fplain,tplain,corp,vtype,stport,enport,zhekou,siteno,proxy,vurl,ctime);		
			gAgents[no] = new Array();										
			gAgents[no][gAgents[no].length] = {"price":price,"vurl":vurl,"ctime":ctime,"pri":pri,"siteno":siteno,"proxy":proxy,"zhekou":zhekou}
			gTotalInfoNum++;
		}
	}
	sortData(true);
	gTotalLineNum = gFlights.length;
}
function showNum(){
	var d=gE('totalInfoNum');
	if(d){d.innerHTML=gTotalInfoNum;}
	d=gE('totalLineNum');
	if(d){d.innerHTML=gTotalLineNum;}
}
function showData(bneat){
	var s='',m,n,no,logo,sno,proxy,fps,tmp;
	var m,n,k,trc,z,zIndex,zaddr,zap,Koofrom,Kooto;
	var i,h,l,om,isrc,j,x,bspec;
	var s='';
	var loop,urlpop;
	var  neighborarr;
	if(gFlights.length==0){
		if(IsUncachedEmpty()){
			var d=gE('noresulttip');
			if(gKX||!d){
				s+='<div id="no-result">';
				s+='	<h1>'+result[0]+' - '+result[1]+' 该区间该天没有直飞航线</h1>';
					
				    if(neighbor_air_ports.indexOf(";")!=-1)
					{
						neighborarr = neighbor_air_ports.split(';');
						s += '酷讯推荐路线：<br>';
						for(z=0;z<neighborarr.length;z++){
							zIndex++;
							zaddr = neighborarr[z].split(':'); 
							if(zIndex>3){break;}
							for(zap=0;zap<apdata.length;zap++){
								if(zaddr[0]==apdata[zap][0]){Koofrom=apdata[zap][1];}
								if(zaddr[1]==apdata[zap][0]){Kooto=apdata[zap][1];}
							}
							s += '<a href="/fcgi-bin/fast_air_search_wrap?From='+zaddr[0]+'&to='+zaddr[1]+'&date='+st_date;
							if(oem) s += '&oem='+oem;
							if(fromid) s+= '&fromid='+fromid;
							s +='"><apan>'+Koofrom+'-'+Kooto+'</span></a>&nbsp;&nbsp;';
						}
						if(white==1){
           						for(zap=0;zap<apdata.length;zap++)
								{
							    	if(st_city==apdata[zap][0]){yuyuefrom=apdata[zap][1];}
							    	if(en_city==apdata[zap][0]){yuyueto=apdata[zap][1];}
						        }
								s+='<br><br>您也可以预约'+'<a href="/yuyue.php?fromcity='+st_city+'&tocity='+en_city+'&startdate='+st_date+'" target="_blank">'+yuyuefrom+'-'+yuyueto+'</a>'+'近期的特价机票';
						}
					}
					else if(neighbor_air_ports=="")
					{
						neighborarr = "";
						s +='';	
					}
					else
					{
						neighborarr = neighbor_air_ports;
						zaddr = neighborarr.split(':'); 
						for(zap=0;zap<apdata.length;zap++){
							if(zaddr[0]==apdata[zap][0]){Koofrom=apdata[zap][1];}
							if(zaddr[1]==apdata[zap][0]){Kooto=apdata[zap][1];}
						}
						s += '酷讯推荐路线：';
						s +=  '<a href="/fcgi-bin/fast_air_search_wrap?From='+zaddr[0]+'&to='+zaddr[1]+'&date='+st_date;
						if(oem) s += '&oem='+oem;
						if(fromid) s+= '&fromid='+fromid;
						s +=  '"><apan>'+Koofrom+'-'+ Kooto+'</span></a>&nbsp;&nbsp;';

						if(white==1){
           						for(zap=0;zap<apdata.length;zap++)
								{
							    	if(st_city==apdata[zap][0]){yuyuefrom=apdata[zap][1];}
							    	if(en_city==apdata[zap][0]){yuyueto=apdata[zap][1];}
						        }
								s+='<br><br>您也可以预约'+'<a href="/yuyue.php?fromcity='+st_city+'&tocity='+en_city+'&startdate='+st_date+'" target="_blank">'+yuyuefrom+'-'+yuyueto+'</a>'+'近期的特价机票';
						}

					}
				s+='	<p><strong>建议您：</strong></p>';
				s+='	<ol>';
				s+='	<li>查看选择的目的地城市与出发城市是否匹配。</li>';
				s+='	<li>阅读<a href="http://home.kooxoo.com/help/product-jipiao.html">酷讯帮助</a>。</li>';
				s+='	</ol>';
				s+='</div>';
			}else{
				s=d.innerHTML;
				s=s.replace(/TIPSREPLACE/g,st_city_str+' - '+en_city_str+' 该区间该天没有直飞航线');
			}
			var u = '/fcgi-bin/air_query_logger?lowest='+st_city+'$'+en_city+'$'+st_date+'$0$0';
			ajaxGetFile(u,log_gocallback);
		}
		gE('search-list').innerHTML=s;
		if(s!=''){
			gE('loading-info-2').style.display='none';
			gE('sub-ad').style.display='';
		}
		showNav();
		showNum();
		return ;
	}	
	gE('loading-info-2').style.display='none';
	gE('sub-ad').style.display='';	
	if(bneat==1) gCurrPage=Math.floor(gOpenIdx/gPageNum);
	s+='<div  id="overDiv"   style="position:absolute;background-color: #FFFFFF;  display: none; z-index:   1;"></div>';	
	s+='<table  class="data-table" id="bjia-data"><tr>';
	s+='<th class="col1">航班号/航空公司</th>';
	s+='<th class="col2">起降机场</th>';
	s+='<th class="col3" style="cursor:pointer" title="按起降时间排序"  onclick="resortData(3);log_info(\'kxjprts\');">起降时间 <img title="按起飞时间排序" alt="按起飞时间排序" src="/img/'+(gSortRow==3?(gSortDir?'sort2_inc.gif':'sort2_des.gif'):'sort2.gif')+'" width="11" height="11" /></th>';
	s+='<th class="col4">机型</th>';
	s+='<th onclick="resortData(0);log_info(\'kxjprps\');" style="cursor:pointer"  title="按最低价排序" >最低价(不含税费)<span class="col3"><img alt="按最低价排序" src="/img/'+(gSortRow==0?(gSortDir?'sort2_inc.gif':'sort2_des.gif'):'sort2.gif')+'" width="11" height="11" /></span></th>';
	s+='</tr>';
	for(m=gCurrPage*gPageNum; m<gTotalLineNum && m<(gCurrPage+1)*gPageNum; m++){
		tmp = gFlights[m];
		no = tmp[2];
		fps = gAgents[no];
		logo=no.substr(0,2).toLowerCase();
		s+='<tr onclick="toggleAllSite(this,'+m+',0)">';
		s+='<td class="col1"><img src="/img/logo/'+logo+'.gif" alt="'+no+'" onerror="this.src=\'/img/flight-logo.gif\';this.onerror=function(){this.style.display=\'none\';};" /><div class="f-co"><strong>'+no+'</strong><br />'+tmp[7]+'</div></td>';
		s+='<td class="col2">起：'+tmp[5]+'<br />降：'+tmp[6]+'</td>';
		s+='<td class="col3">'+tmp[3]+'<br>'+tmp[4]+'</td>';
		s+='<td class="col4"><span title="点击查看机型" onclick="javascript:showplane(\''+tmp[8]+'\',event),event.cancelBubble=true;"  style="cursor:pointer"  ><U>'+tmp[8]+'</U></span></td>';
		s+='<td class="col5"><strong'+(tmp[0]==parseInt(gLowerPrice)?' class="best-price"':' class="price"')+'>'+tmp[0]+'元</strong>'+(tmp[11]==0?'':'('+tmp[11]+'折)')+'<br /><img src="'+(gOpenIdx==m?btnimgb.src:btnimga.src)+'" alt="" style="cursor:pointer" onclick="toggleAllSite(this.parentNode.parentNode,'+m+',1);event.cancelBubble=true;">';
		s+='</tr>';
		
		if(gOpenIdx ==m){
			s+='<tbody class="ding-list">';
			s+='<tr><td class="col7 bg-color" colspan="5"><div class="infobox">'
			var linetxt = createLine(m)	;
			s += linetxt;
			s+='</div></td></tr>';
			s+='</tbody>';
		}else{
			s+='<tbody class="ding-list" style="display:none"><tr><td class="col7 bg-color" colspan="5"><div class="infobox"></div></td></tr></tbody>';
		}
	}
	s+='</table>';
	gE('search-list').innerHTML=s;
	showNav();
	showNum();
}
function createLine(m){
	var s='',x,y,j,urlpop;
	var fps ,sno,proxy,n; 
	var no = order[m];
	sortLineData(no);
	s+='<table border="0" cellpadding="0" cellspacing="0" id="inforlist">';
	s+='<tbody class="ding-list">';
	var starpos=0;
	if(gAgents[no].length>=2){
		if(gAgents[no][0].pri>gAgents[no][1].pri) starpos=0;
		else starpos =1;
	}
	for(n=0; n<gAgents[no].length; n++){
		fps = gAgents[no][n];
		sno = fps.siteno;
		proxy = fps.proxy;
		s+='<tr onclick="log_goresult('+m+','+n+',2);if(this.childNodes[2]){window.open(this.childNodes[2].childNodes[0].href);}else{window.open(this.childNodes[1].childNodes[0].href);}" onmouseover="this.className=\'hover-on\';" onmouseout="this.className=\'even\';" style="cursor:pointer">';
		s+='	<td class="td1"><strong>'+proxy+'</strong>';
		if(n==starpos){
			j=parseInt(site_star_arr[sno]);
			if(j>0){
				s+'<span class="stars">';
				for(x=0;x<j&&x<5;x++);
				s+='<span class="hstar" style="padding:0  0 0 '+(x*13-4)+'px">&nbsp;</span>';
				s+='<span class="lstar" style="padding:0  0 0 '+((5-x)*x*13-4)+'px">&nbsp;</span>';
				s+="</span>";
				if(gViewKX) s+='<img class="kx-feat" src="/img/kx-feat.gif" alt="酷讯推荐" />';
			}
		}
		s+='<br />';
		if(sno == 20){
			for(i=0;i<adwords.length;i++){
				if(adwords[i][0] == proxy)	s+=adwords[i][1];
				break;
			}
			if(i==adwords.length) s+=site_addrs_arr[20];
		}else{
			if(no.substr(0,2).toLowerCase()=='ca' && fps.price<50)
				s+='<font color=red><b>此价格只能电话购买，请电话：4008100999-162</b></font>';
			else
				s+='<span style="line-height:1.6em;text-align:left;">'+site_addrs_arr[sno]+'</span>';
		}
		s+='</td>';
		urlpop=fps.vurl;
		var bspec=false;
		if(sno ==3 || sno==20){
			bspec =  true;
			urlpop+=suffix;
		}
		s+='<td class="td2"><a href="'+urlpop+'" target="_blank" onclick="log_goresult('+m+','+n+',2);event.cancelBubble=true;"><strong>'+fps.price+'元</strong></a>'+(fps.zhekou==0?'':'<span class="discount">('+fps.zhekou+'折)'+'</span>')+' <a href="'+urlpop+'" target="_blank" onclick="log_goresult('+m+','+n+',2);event.cancelBubble=true;"><img src="'+(bspec?btnimgd.src:btnimgc.src)+'" alt="(预定)" style="margin-bottom:-3px;" /></a><br /><span class="last-update">最后更新:'+GetCnCtime(fps.ctime,0)+'以前</span></td>';
		s+='</tr>';
		if(n==2 && gAgents[no].length>3){
			s+='</tbody>';
			s+='<tbody class="more-btn" onclick="toggleMoreSite(this,'+m+')"><tr><td  colspan="2" class="td3"><span class="on">查看其余'+(gAgents[no].length-3)+'	家订票网站</span></td></tr></tbody>';
			s+='<tbody class="ding-list"'+(gMoreOpen && gOpenIdx ==m?'':' style="display:none"')+'>';
		}
	}	
	s+='</tbody>';
	s+='</table>';
	return s;
}
var arrFlyDate;
function printDateNav(){
	var curd=new Date(cur_time*1000);
	var sdarr=st_date.replace(/-0/,"-").replace(/-0/,"-").split('-');
	if(sdarr.length!=3){return}
	var sd=new Date(parseInt(sdarr[0]), parseInt(sdarr[1])-1, parseInt(sdarr[2]));
	var cd=new Date(curd.getYear()%100+2000, curd.getMonth(), curd.getDate());
	var st=sd.getTime();var ct=cd.getTime();
	var t=st-259200000;
	var m,i,d,ds,u,title,ps,ns;
	var days= new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
	for(;t<ct;t+=86400000);
	m='';
	d=new Date();
	for(i=0;i<7;i++,t+=86400000){
		d.setTime(t);
		title = days[d.getDay()];
		if(t==st){
			if(arrFlyDate!=null){
				for(j=0;j<arrFlyDate.length;j++){
					ns = arrFlyDate[j];
					if(ns ==st_date) break;
				}
				if(j!=arrFlyDate.length){
					m+='<strong title="' + title + '">'+st_date.substr(5,st_date.length)+'<span class="red">('+arrPriceOff[j]+')</span></strong>&nbsp;'
				}else{
					m+='<strong title="' + title + '">'+st_date+'</strong>&nbsp;';
				}	
			}else{
					m+='<strong title="' + title + '">'+st_date+'</strong>&nbsp;';
			}
		}else{
			mydmonth = d.getMonth()+1;myddate = d.getDate();
			if(mydmonth<10)  mydmonth = '0'+mydmonth;
			if(myddate<10)  myddate = '0'+myddate;
			ds=(d.getYear()%100+2000)+'-'+mydmonth+'-'+myddate;
			ps = mydmonth+'-'+myddate;
			u='/fcgi-bin/fast_air_search_wrap?From='+st_city+'&to='+en_city+'&date='+ds+'&kxlog=kxjprstab&dt2='+st_date;
			if(gLowerLine!=-1){
				var finfo=gFlights[gLowerLine];
				u+='&no='+finfo[2]+'&st='+finfo[3]+'&et='+finfo[4]+'&zk='+(finfo[11]*10)+'&pr='+finfo[0];
			}
			u+=suffix;
			if(arrFlyDate!=null){
				for(j=0;j<arrFlyDate.length;j++){
					ns = arrFlyDate[j];
					if(ns==ds) break;
				}
				if(j!=arrFlyDate.length){
					m+='<a href="'+u+'" title="' + title + '">'+ps+'<span class="red">('+arrPriceOff[j]+')</span></a>&nbsp;'
				}else{
					m+='<a href="'+u+'" title="' + title + '">'+ds+'</a>&nbsp;';
				}	
			}else
					m+='<a href="'+u+'" title="' + title + '">'+ds+'</a>&nbsp;';
		}
	}
	m+='<span id="returntxt"></span><a id="fancheng-link" onclick="event.cancelBubble=true;" href="javascript:showCalendar(\'fancheng-link\',false,\'i-date\',\'i-date\',\'calcallback\')"';
	m+='">返程</a>';
	gE('sub-nav').innerHTML=m;
}
function showNav(){
	var d=gE('pages');d.style.display='';
	var s='';
	if(gPageNum<gFlights.length){
		var i,j,n;
		n=Math.ceil(gTotalLineNum/gPageNum);
		for(i=0;i<n;i++){
			j=i+1;
			s+='&nbsp;';
			if(i==gCurrPage) s+='<strong>'+j+'</strong>';
			else s+='<a href="#" onclick="changePage('+i+');return false;">['+j+']</a>'
			s+='&nbsp;';
		}
	}
	d.innerHTML=s;
}
function changePage(n){
	if(n*gPageNum>gTotalLineNum) return;
	gCurrPage=n;
	gOpenIdx = gPageNum *gCurrPage + 1.1;
	showData(0);
	log_info('kxjprsp');
	window.scroll(0,0);
}
function moreData(){
	if(IsUncachedEmpty()) return true;
	var d=new Date();
	if(curUnCached ==0){
		 url='/fcgi-bin/fast_air_search_wrap?From='+st_city+'&to='+en_city+'&date='+st_date+'&sites='+gUncachedSites[curUnCached].join('-');
	}else{
		if(gUncachedSites.length==4){
			if(curUnCached==1) url='/fcgi-bin/fast_air_search_wrap?From='+st_city+'&to='+GetRevisedCityCode(en_city)+'&date='+st_date+'&sites='+gUncachedSites[curUnCached].join('-');
	 		if(curUnCached==2) url='/fcgi-bin/fast_air_search_wrap?From='+GetRevisedCityCode(st_city)+'&to='+en_city+'&date='+st_date+'&sites='+gUncachedSites[curUnCached].join('-');
		  	if(curUnCached==3) url='/fcgi-bin/fast_air_search_wrap?From='+GetRevisedCityCode(st_city)+'&to='+GetRevisedCityCode(en_city)+'&date='+st_date+'&sites='+gUncachedSites[curUnCached].join('-');
		}else if(gUncachedSites.length==2){
			if(curUnCached==1) url='/fcgi-bin/fast_air_search_wrap?From='+GetRevisedCityCode(st_city)+'&to='+GetRevisedCityCode(en_city)+'&date='+st_date+'&sites='+gUncachedSites[curUnCached].join('-');
		}
	}
	ajaxGetFile(url, gotMoreData);
}
function gotMoreData(str){
	var arr=str.split('\n');
	var i,j,unarr,datarr;
	for(i=0,j=0;i<arr.length;i++){
		if(arr[i]==''){
			if(j==0){
				unarr=arr.slice(0,i);
			}else if(j==1){
				datarr=arr.slice(unarr.length+1,i);
			}
			j++;
		}
	}
	if(j>=2){
		gUncachedSites[curUnCached]=Array();
		for(i=0;i<unarr.length;i++){
			arr=unarr[i].split('\t');
			if(arr.length<2){continue;}
			gUncachedSites[curUnCached][gUncachedSites[curUnCached].length]=arr[0];
		}
		newDataArray(datarr);
		showData(1);
		showAd();
		printDateNav();
	}
	if(!IsUncachedEmpty()){
		curUnCached++;
		if(curUnCached <gUncachedSites.length){
			for(var hd=curUnCached;hd<gUncachedSites.length;hd++){
				if(gUncachedSites[hd].length!=0){
					curUnCached = hd;
					break;
				}
			}
			if(hd==gUncachedSites.length){
				for( curUnCached=0;curUnCached<gUncachedSites.length;curUnCached++){
					if(gUncachedSites[curUnCached].length!=0){
						break;
					}
				}
			}
		}else{
			for( curUnCached=0;curUnCached<gUncachedSites.length;curUnCached++){
				if(gUncachedSites[curUnCached].length!=0){
					break;
				}
			}
		}
		var t=3;
		gMoreNum++;
		if(gMoreNum<2) t=3;
		else if(gMoreNum<5) t=5;
		else t=10;
		if(gMoreNum<=20)
			setTimeout("moreData()", t*1000);
		else
			gUncachedSites= Array(Array());
	}else{
		return;
	}
}
function showProcess(){
	var l,o,i;
	var d=gE('loading-info');
	var lowww = gE('mylowest');
	if(!d){gE('search-name').style.display='none';return;}
	for(i=0;i<all_sites_arr.length;i++){
		if(all_sites_arr[i]==""){
			all_sites_arr.splice(i,1);
		}
	}
	l=all_sites_arr.length;
	o=l-gUncachedSites.length;
	if(IsUncachedEmpty()){
		log_done();
		var bReRun = false;
		if(gFlights.length > 0 && GetCnCtime(gFlights[0][15]).indexOf("小时") != -1)	bReRun = true;
		if(!bReRun)	{
			m='搜索完成';
			d.innerHTML=m;
			if(gLowerPrice==''||gLowerPrice=='-')
				lowww.innerHTML='-';
			else
				lowww.innerHTML=gLowerPrice;
			gE('search-name').style.display='';
			printDateNav();
			showData(0);
		}else	setTimeout("RefreshData()", 2000);
		return;
	}
	if(o<=0) o=1;
	gProcessNum++;
	var m='<img id="loading-icon" src="/img/lvyou/loading.gif" alt="" /> 正在搜索';
	m+=all_sites_arr[gProcessNum%l];
	gE('search-name').style.display=''
		d.innerHTML=m;
	if(gLowerPrice==''||gLowerPrice=='-')
		lowww.innerHTML='-';
	else
		lowww.innerHTML=gLowerPrice;
	setTimeout("showProcess()", 2000);
}
function RefreshData(){
	var l=all_sites_arr.length;
	for(var i = 0; i < gUncachedSites.length; ++ i){
		for(var j = 0; j < l; ++ j)	{
			gUncachedSites[i][j] = j;
		}
	}
	gFlights = new Array();
	gAgents = new Array();
	used = new Array();
	order = new Array();
	gCurrPage = 0; 	gTotalLineNum = 0;	gTotalInfoNum = 0;
	gLowerPrice = '';	
	gProcessNum = 0;	curUnCached = 0;	gMoreNum = 0;
	showData(0);showAd();moreData();showProcess();
	gOpenIdx = 0;
	gLowerLine = 0;
}
function toggleAllSite(p,m,flag){
	var overDiv = gE("overDiv");
	if(overDiv != null){
		overDiv.style.display = 'none'
	}
	var show = p.parentNode.nextSibling.style.display;var tmp;
	if(show == 'none'){     
		var ts = document.getElementById("bjia-data").childNodes;
		for(k=0;k<ts.length;k++){
			if(ts[k].className=='ding-list' && ts[k].style.display!='none'){
				ts[k].style.display='none';
				if(ts[k].previousSibling.childNodes.length==2)
					tmp = ts[k].previousSibling.childNodes[1];
				else tmp = ts[k].previousSibling.childNodes[0];
				tmp.childNodes[4].getElementsByTagName('img')[0].src = btnimga.src;
				break;
			}
		}
		p.childNodes[4].getElementsByTagName('img')[0].src = btnimgb.src;
		p.parentNode.nextSibling.style.display = '';
		var innertxt = createLine(m);
		p.parentNode.nextSibling.childNodes[0].childNodes[0].childNodes[0].innerHTML = innertxt 
		if(p.parentNode.nextSibling.getElementsByTagName("tbody").length==3)
		p.parentNode.nextSibling.getElementsByTagName("tbody")[2].style.display='none'
		log_open(m,0,1);
		gOpenIdx = m;
		gMoreOpen = false;
	}
	if(flag && show !='none'){
		p.parentNode.nextSibling.style.display = 'none'    
		p.childNodes[4].getElementsByTagName('img')[0].src = btnimga.src;
		gOpenIdx = gOpenIdx+0.1;
	}
}
function toggleMoreSite(p,m){
	var show = p.nextSibling.style.display;
	if(show == 'none'){
		p.nextSibling.style.display = '';	
		log_open(m,0,2);
		gMoreOpen = true;
	}else{
		p.nextSibling.style.display = 'none'	
		gMoreOpen = false;
	}
}
function showAd(){
	var res = new Array();
	var gres = new Array();
	var reslen = 1;
	var d = gE("square-ad");
	var msg;
	var step;
	var i,j,urlpop,vno;
	for(i=0;i<gTotalLineNum;i++){
		if(reslen > 5-adtops.length) break;
		var no = gFlights[i][2];
		vno = gFlights[i][2].substr(0,2).toLowerCase();
		if(res[vno] == null){
			res[vno] = 1;
			gres[gres.length] = i;
			reslen ++;
		}
	}
	msg = '<table><tr>';
	for( i=0;i<gres.length;i++){
		step = gres[i];
		no = gFlights[step][2];
		vno = no.substr(0,2).toLowerCase();
		urlpop = gFlights[step][14];
		if(gFlights[step][12]==3 || gFlights[step][12]==20) urlpop+=suffix;
		msg += '<td><div class="fly-ad-c" onmouseover="this.className=\'fly-ad-c expand\'" onmouseout="this.className=\'fly-ad-c\'" onclick="log_info(\'tgtop_'+(i+1)+'_'+gFlights[step].siteno+'\');window.open(\''+urlpop+'\')"><div class="fly-ad"><div class="fly-ad-main"><div class="fly-ad-border">';
		msg += '<p><img src="/img/logo/'+vno+'.gif" alt="" /></p>';
		msg += '<p>'+cor_s[vno] + gFlights[step][2]+'</p>';
		msg += '<p><strong class="best-price">'+gFlights[step][0]+'元</strong></p>';
		msg += '<div class="fly-ad-sub">';
		msg += '<table><tr>';
		msg += '<td align="right">起'+gFlights[step][3]+'</td>';
		msg += '<td  style="font-family:simsun;font-weight:bold;">&gt;</td>';
		msg += '<td>降'+gFlights[step][4]+'</td>';
		msg += '</tr>';
		msg += '<tr>';
		msg += '<td align="center" colspan="3">数据来源:'+GetCnCtime(gFlights[step][15],1)+'前</td>';
		msg += '</tr></table>';
		if(vno == 'ca')
			msg += '<p align=center><img src="/img/tuijian-yuding-buttom.gif" alt="预定"></p>';
		else if(gFlights[step]==3 || gFlights[step][12]==20)
			msg += '<p align=center><img src="/img/wangshangyuding-buttom.gif" alt="网上预定"></p>';
		else
			msg += '<p align=center><img src="/img/yuding-buttom.gif"></p>';
		msg +='</div></div>';
		//msg+='<!-- hack for ie6 --><!--[if lte IE 6.5]><iframe></iframe><![endif]-->';
		msg += '</div></div></div></td>';
	}
	for(j=0;j<adtops.length;j++){
		msg += '<td><div class="fly-ad-c"><div class="fly-img">';
		msg += '<a href="'+adtops[j][1]+'" target="_blank">';
		msg +='<img src="/img/flight_'+(j+1)+'b.gif" alt=""  onclick="log_info(\'tgbuy_'+(j+1)+'_'+adtops[j][0]+'\')"/></a>';
		msg +='</div></div></td>';
	}
	msg += '<td><div class="fly-ad-c"><div class="fly-img">';
	msg += '<a href="/donghang/donghang.php?kxlog=donghang" target="_blank">';
	msg +='<img src="/img/donghangad2.gif" alt=""  /></a>';
	msg +='</div></td>';

	msg += '<td><div class="fly-ad-c"><div class="fly-img">';
	msg += '<a href="http://www.shanghai-air.com/index-from-koo.htm?kxlog=shanghang" target="_blank">';
	msg +='<img src="/img/flight_2b.gif" alt=""  /></a>';
	msg +='</div></td>';
	
	for(j=0;j<5-i-adtops.length;j++){
		msg += '<td><div class="fly-ad-c cur-default"><div class="fly-img">';
		msg +='<img src="/img/flight_default.gif" alt="" />';
		msg +='</div></div></td>';
	}
	msg += '</tr></table>';
	d.innerHTML = msg;
}
/* functions for showdata end */
/*  log functions begin */
function log_firstlow(){
	var u = '/air_cache_lowest.php?From='+gFlights[0][9]+'&to='+gFlights[0][10]+'&date='+st_date+'&price='+gFlights[0][0]+'&zk='+(gFlights[0][11]*10)+'&flightno='+gFlights[0][2]+'&siteno='+gFlights[0][12]+'&takeoff='+gFlights[0][3]+'&arrival='+gFlights[0][4];	
	ajaxGetFile(u,log_gocallback);
}
function log_open(fi,li,mode){
	if(fi>=gTotalLineNum) return;
	no =gFlights[fi][2];
	if(li>=gAgents[no].length) return;
	var finfo=gAgents[no][li];
	var u= '/null.htm?kxlog=kxjpr'+(fi+1);
	if(mode==1){
		u+='bw';
	}else if(mode==2){
		u+='bwmore';
	}
	u+='&sc='+st_city+'&dc='+en_city+'&dt='+st_date+'&no='+no;
	u+='&st='+gFlights[fi][3]+'&et='+gFlights[fi][4]+'&pr='+finfo.price+'&zk='+(finfo.zhekou*10);
	u+=suffix;
	ajaxGetFile(u,log_gocallback);
}
function log_goresult(fi,li,mode){
	if(fi>=gTotalLineNum) return;
	no =gFlights[fi][2];
	if(li>=gAgents[no].length) return;
	var stport = (st_port)?st_port:gFlights[fi][9];
	var enport = (en_port)?en_port:gFlights[fi][10];
	var finfo=gAgents[no][li];
	var u='/null.htm?kxlog=kxjpr';
	if(mode==1) u+='fgo';
	else if(mode==2) u+=(fi+1)+'.'+(li+1)+'go';
	u+='&sc='+stport+'&dc='+enport+'&dt='+st_date+'&no='+no+'&st='+gFlights[fi][3]+'&et='+gFlights[fi][4];
	u+='&pr='+finfo.price+'&zk='+(finfo.zhekou*10)+'&go='+finfo.siteno;
	u+=suffix;
	ajaxGetFile(u,log_gocallback);
	u= '/fcgi-bin/fast_air_log_wrap?From='+stport+'&to='+enport+'&date='+st_date+'&log_name=air_green&log_str='+stport+'$'+enport+'$'+st_date+'$'+finfo.siteno;
	ajaxGetFile(u,log_gocallback);
}
function log_info(id){
	var u=  '/null.htm?kxlog='+id+suffix;
	ajaxGetFile(u,log_gocallback);
}
function log_gocallback(str){}
function log_done(){
	if(gLowerLine==-1) return;
	var finfo=gFlights[gLowerLine];
	var no=finfo[2];
	var vno,price,stport,enport,fitem,lowstep=0;
	var container = new Array();
	var u=  '/null.htm?kxlog=kxjprlp&sc='+st_city+'&dc='+en_city+'&dt='+st_date+'&no='+no+'&st='+finfo[3]+'&et='+finfo[4];
	u+='&zk='+(finfo[11]*10)+'&pr='+finfo[0]+'&siteno='+finfo[12];
	u+=suffix;
	ajaxGetFile(u,log_gocallback)
		u = '/fcgi-bin/air_query_logger?lowest='+st_city+'$'+en_city+'$'+st_date+'$'+finfo[0]+'$'+(finfo[11]?finfo[11]:10)*10+'$'+no+'$'+finfo[12]+'$'+finfo[3]+'$'+finfo[4];
	ajaxGetFile(u,log_gocallback);
	for(var i=0;i<gTotalLineNum;i++){
		stport = gFlights[i][9];
		enport = gFlights[i][10];
		price = gFlights[i][0];
		vno = gFlights[i][2];
		sortLineData(vno);
		fitem = gAgents[vno];
		if(container[stport+'-'+enport] ==null){ 
			container[stport+'-'+enport] = new Array();
			container[stport+'-'+enport]['all'] = '-';
			container[stport+'-'+enport]['lowest'] = '-';
			container[stport+'-'+enport]['count'] = 0;
		}	
		for(var j=0;j<3 && j<fitem.length;j++){
			if(container[stport+'-'+enport]['all'].indexOf('-'+fitem[j].siteno+'-') == -1){
				container[stport+'-'+enport]['all'] += fitem[j].siteno+'-';
			}	
			if(container[stport+'-'+enport]['count']<3){
				if(container[stport+'-'+enport]['lowest'].indexOf('-'+fitem[j].siteno+'-') == -1)
					container[stport+'-'+enport]['lowest'] += fitem[j].siteno+'-';

			}
		}
		container[stport+'-'+enport]['count']++;
	}
	for(var key in container){
		var s = key.split("-");
		u= '/fcgi-bin/fast_air_log_wrap?From='+s[0]+'&to='+s[1]+'&date='+st_date+'&log_name=air_green&log_str='+s[0]+'$'+s[1]+'$'+st_date+'$'+container[key]['lowest'].substr(1,container[key]['lowest'].length-2)+'$'+container[key]['all'].substr(1,container[key]['all'].length-2);
		ajaxGetFile(u,log_gocallback)
	}

}
/*  log functions end */
/*  hangqing functions begin  */
function RenderHangqing(str){
	var obj = gE("jipiaohangqing");
	if(!obj) return;
	var strminprice=nMinPriceFrom;
	var d=gE('piao_minprice');
	var index_=0;
	for (j=0;j<arrPrice.length;j++){	if (arrPrice[j]==strminprice) {index_=j;break;}}
	var strfrom = arrFromCity[index_];
	var strto = arrToCity[index_];
	var strdate=arrFlyDate[index_];
	var strmon=strdate.substr(5,2);
	var strday=strdate.substr(8,2);
	var strpriceoff=arrPriceOff[index_];
	if(d){d.innerHTML='<a target="_blank" href="/fcgi-bin/fast_air_search_wrap?kxlog=kxjpminhq&From='+strfrom+'&to='+strto+'&date='+strdate+'">未来一月内最低价:<font color="red">'+strmon+'月'+strday+'日'+strminprice+'元('+strpriceoff+')</font></a>';}
	obj.innerHTML = str;
	parentObj = obj.parentNode;
	var labObj = getElementByAttribName(parentObj, "name", "labFromTo", "label");
	labObj.innerHTML = strCityFromCN + "-" + strCityToCN;
	labObj = getElementByAttribName(parentObj, "name", "labToFrom", "label");
	labObj.innerHTML = strCityToCN + "-" + strCityFromCN;
	obj.style.display = "";
	parentObj.style.display = "";
}
function GetDivHtml(index_){
	var index = parseInt(index_);
	var str ='<p style="font-size:12px;margin:0.3em 0;"><a href="/fcgi-bin/fast_air_search_wrap?kxlog=kxjphangqing&From=' + arrFromCity[index]  + '&to=' + arrToCity[index] + '&date=' + arrFlyDate[index] + '" class="ad-url" target="_blank">查看详情</a></p>';
	str +='<p style="font-size:12px;margin:0.3em 0;"><img src="/jipiaohangqing/php/img/' + arrAirSer[index].substr(0,2).toLowerCase()+'.gif" /></p>';
	str +='<p style="font-size:12px;margin:0.3em 0;color:#666;" >'+ arrAirCompany[index] + arrAirSer[index] + '</p>';
	str +='<p style="font-size:18px; margin:0.3em 0; color:#f60;" ><strong class="price">' + arrPrice[index] +'元('+ arrPriceOff[index] +')</strong></p>';
	str +='<p style="font-size:12px;margin:0.3em 0;color:#666" ><strong>'+ arrFlyDate[index] + '</strong></p>';
	str +='<div style="font-size:12px;" >';
	str +='<table><tr>';
	if(index < 30){
		str +='<td style="font-size:12px;color:#666;" align="right" width="50" >'+ strCityFromCN +'</td>';
		str +='<td style="color:#666;" rowspan="2">&rArr;</td>';
		str +='<td style="font-size:12px;color:#666" align="left" width="50">'+ strCityToCN+'</td>';
	}else{
		str +='<td style="font-size:12px;color:#666;" align="right" width="50" >'+ strCityToCN +'</td>';
		str +='<td style="color:#666;" rowspan="2">&rArr;</td>';
		str +='<td style="font-size:12px;color:#666" align="left" width="50">'+ strCityFromCN+'</td>';
	}
	str +='</tr><tr>';
	str +='<td style="font-size:12px;color:#666" align="right">' + arrFlyTime[index] +'</td>';
	str +='<td style="font-size:12px;color:#666" align="left">' + arrLandTime[index] +'</td>';
	str +='</tr>';
	str +='<tr><th style="font-size:12px;color:#666" colspan="3">' + arrSite[index] +'</th></tr></table>';
	str +='</div>';
	return str;
}
function GetCenterPoint(coords){
	var xL = 0;	var yL = 0;
	var arrCoords = coords.split(",");
	for(i = 0; i < arrCoords.length; )	{
		xL += parseInt(arrCoords[i]);
		yL += parseInt(arrCoords[i + 1]);
		i += 2;
	}
	var xy = {};
	xy[0] = xL / arrCoords.length * 2;
	xy[1] = yL / arrCoords.length * 2;
	return xy;
}
function showInfo_(thisObj){
	var jphqObj = gE("jipiaohangqing");
	var detail = getElementByAttribName(jphqObj, "id", "detailInfo", "div");
	if(!thisObj){
		if(detail) detail.style.display = "none";
		return;
	}
	var type = thisObj.getAttribute("type");var chk;
	if(type == "from")
		chk = getElementByAttribName(gE("hangqingwrapper"), "name", "chkFromTo", "input");
	else
		chk = getElementByAttribName(gE("hangqingwrapper"), "name", "chkToFrom", "input");
	if(!chk.checked)  return;
	var index = parseInt(thisObj.getAttribute("no"));
	if(type == "to")  index += 30;
	var pointCur = GetCenterPoint(thisObj.getAttribute("coords"));
	var xm = 5;	var ym = 5;
	var strStyle = "border: 1px solid rgb(0, 65, 132); width:125px; height:175px;text-indent:0; color:666; text-align:center; font-size:12px; position:absolute;z-index: 1000; background-color: rgb(239, 239, 239); left:" + (pointCur[0] + xm) + "px; top:" + (pointCur[1] + ym) + "px;";
	detail.setAttribute("style", strStyle);
	detail.style.cssText = strStyle;
	var str = GetDivHtml(index);
	detail.innerHTML = str;detail.style.display = "";
}
function switchimg(chk){
	var strName = chk.getAttribute("name");
	var strNameBuddy;
	if(strName == "chkFromTo") strNameBuddy = "chkToFrom";
	else strNameBuddy = "chkFromTo";
	var chkBuddy = getElementByAttribName(gE("hangqingwrapper"), "name", strNameBuddy, "input");
	var postfix, sign, signBuddy;
	if(chk.checked)	sign = "_1";
	else sign = "_0";
	if(chkBuddy.checked) signBuddy = "_1";
	else signBuddy = "_0";
	if(strName == "chkFromTo") postfix = sign + signBuddy;
	else postfix = signBuddy + sign;
	var idstr = "chart" + postfix;
	var plist = gE("jipiaohangqing").getElementsByTagName("img");
	for(i=0;i<plist.length;i++){
		if(plist[i].getAttribute("id") == idstr) plist[i].style.display = "";
		else plist[i].style.display = "none";
	}
}
function InitHangqing(){
	if(document.s.city_reverse)	{
		var strUrl = "/jipiaohangqing/cdver/imgcreator/airsearch_atp.php?from=" + strCityFromEN + "&to=" + strCityToEN;
		ajaxGetFile(strUrl, RenderHangqing);
	}
}
/*  hangqing functions end  */
/* Calendar begin */
function showCalendar(sImg,bOpenBound,sFld1,sFld2,sCallback){
	var fld1,fld2,cf,wcf;
	if(sCallback != null){
		cf=gE("CalFrameb");
		wcf=window.frames.CalFrameb;
	}else{
		cf=gE("CalFrame");
		wcf=window.frames.CalFrame;
	}
	var oImg=gE(sImg);
	fld1=gE(sFld1);
	fld2=gE(sFld2);
	if(!wcf.bCalLoaded){alert("日历未成功装载！请刷新页面！");return;}
	if(cf.style.display=="block"){cf.style.display="none";return;}
	var sT=document.body.scrollTop,sL=document.body.scrollLeft;
	var eH=oImg.clientHeight,eW=oImg.clientWidth;
	var eT=0,eL=0,p=oImg;
	while(p&&p.tagName!="BODY"){eT+=p.offsetTop;eL+=p.offsetLeft;p=p.offsetParent;}
	if(sCallback){
		var isFirefox= (window.event==null)
		if(isFirefox){
			cf.style.top=((document.body.clientHeight-(eT)-eH>=cf.height)?eT+eH:eT+24)+"px";
			cf.style.left=((document.body.clientWidth-(eL)>=cf.width)?eL:eL+eW-cf.width)+"px";
		}else{
			cf.style.top=((document.body.clientHeight-(eT-sT)-eH>=cf.height)?eT+eH:eT-cf.height)+"px";
			cf.style.left=((document.body.clientWidth-(eL-sL)>=cf.width)?eL:eL+eW-cf.width)+"px";
		}
	}
	cf.style.display="block";
	wcf.openbound=bOpenBound;
	wcf.fld1=fld1;	wcf.fld2=fld2;
	wcf.callback=sCallback;
	wcf.initCalendar();
}
function hideCalendar(){
	var cf=gE("CalFrame");
	cf.style.display="none";
	var cf=gE("CalFrameb");
	cf.style.display="none";
}
function calcallback(str){
	window.location = "/fcgi-bin/fast_air_search_wrap?kxlog=return&From="+en_city+"&to="+st_city+"&date="+str+suffix;
}
/* Calendar end */
/* scripts for ad begin */
function tg4happylife(){
	if(st_city == "SHA" || st_city == "PVG")	{
		var str = '<dl><dt><a href="/txtlink_go.php?kxlog=tgtext_myhappylife" target="_blank">《现代家庭生活》杂志</a></dt>';
		str += '<dd><p>订阅“现代家庭”赢取超值大奖</p></dd></dl>';
		document.write(str);
	}
}
function tg4newhouse(){
	var arrHouseCities = new Array("三亚","上海","东莞","东营","中山","丽江","义乌","乌鲁木齐","佛山","兰州","北京","南京","南宁","南昌","南通","厦门","合肥","呼和浩特","哈尔滨","唐山","大连","天津","太原","威海","宁波","常州","广州","徐州","成都","扬州","无锡","日照","昆山","昆明","杭州","武汉","沈阳","济南","海口","淄博","深圳","湛江","潍坊","烟台","珠海","石家庄","福州","绍兴","苏州","菏泽","西安","贵阳","连云港","郑州","重庆","长春","长沙","青岛");
	var i = 0;
	var strSrcCity = document.s.t.value;
	for(;i < arrHouseCities.length; ++ i)  if(arrHouseCities[i] == strSrcCity)	break;
	if(i == arrHouseCities.length)  return;
	var strSrcCity_ = encodeURI(strSrcCity);
	var exp = /%/g;
	strSrcCity_ = strSrcCity_.replace(exp, "");
	var str = '<dl><dt><a href="/txtlink_go.php?kxlog=tgtext_newhouse&city=' + strSrcCity_ + '" target="_blank">本月新开盘楼盘排行榜</a></dt></dl>';
	document.write(str);
}

function tg4bottom5(){
	if(st_city == "PEK")
	{
		document.write('<div class="fly-ad-c fly-static" ><div class="fly-ad"><a href="/img/go.php?kxlog=tgbottom_5" target="_blank"><img src="/img/bottom_youyou.gif" alt="" width="95" height="95" border="0" /></a></div></div>');
	}
	else
	{
		document.write('<div class="fly-ad-c fly-static cur-default"><div class="fly-ad"><img src="/img/flight_default.gif" alt="" width="95" height="95" border="0" /></div></div>');
	}
}

function seekvillager(){
	if(null != strProvince && strProvince != "")
		document.write('&nbsp;&nbsp;<span class="koowa"><a href="http://bbs.kooxoo.com/f/search?name=' + encodeURI(strProvince + '人在' + document.s.t.value) + '" target="_blank">我要找在' + document.s.t.value + '的' + strProvince + '老乡</a></span>');
}
/* scripts for ad end */
/* functions for init begin */
function on_load_url(){
	nst_city = GetReviseCityCode(st_city);
	nen_city = GetReviseCityCode(en_city);
	var i,f_v,t_v,result;
	for(i=0;i<apdata.length;i++){
		if(apdata[i][0]==nst_city)	f_v = apdata[i][1];
		if(apdata[i][0]==nen_city) t_v = apdata[i][1];
	}
	nst_city = GetRevisedCityCode(st_city);
        if(nst_city != st_city) gGetAllSites ++;
	else st_port  =  st_city;
        nen_city = GetRevisedCityCode(en_city);
        if(nen_city != en_city)  gGetAllSites ++;
	else en_port = en_city;
	result = new Array(f_v,t_v);
	return result;
}
function defaultForm(){
	var s=document.s;	var o;
	s.date.value=st_date;
	if(fromid!="")	{
		var i=document.createElement("INPUT");
		i.type='hidden';i.name='fromid';i.value=fromid;
		s.appendChild(i);
	}
	if(oem!="")	{
		var i=document.createElement("INPUT");
		i.type='hidden';i.name='oem';i.value=oem;
		s.appendChild(i);
	}
	s.t.value=result[0];
	s.q.value=result[1];
}
var gGetAllSites = 0;
var nst_city, nen_city, st_port, en_port ;
var all_sites_arr=all_sites.split('\n');
var site_addrs_arr=site_addrs.split('\n');
var site_pri_addr=site_prioritys.split('\n');
var site_star_arr=site_stars.split('\n');
var gCurrPage = 0; //CurrentPageNum
var gPageNum = 10;
var gTotalLineNum = 0;var gTotalInfoNum = 0;
var gLowerPrice = '';
var gLowerLine=-1;var gSortRow=0;//default price
var gSortDir=true;
var gProcessNum = 0;
var curUnCached = 0;
var gUncachedSites=new Array(Array());
var gMoreNum = 0;
var gViewKX=true;
var gKX=true;
var gOpenIdx = 0;gMoreOpen = false;
var gOpenMore = false;
var gunarr = new Array();
var vTmp = new Array(),used = new Array();
var gFlights = new Array(),gAgents = new Array();
var result = on_load_url();
document.onclick=function(){
	hideCalendar();
	var cf=gE("overDiv");
	if(cf!=null) cf.style.display='none'
}	
var suffix = ''+ ((fromid!=null && fromid!='')?'&fromid='+fromid:'') + ((oem!=null && oem!='')?'&oem='+oem:'');
var is_site_arr = is_air_company.split("\n");
var gres = new Array();
var cor_s = new Object();
cor_s["3u"] = "川航";cor_s["8c"] = "东星";cor_s["ca"] = "国航";cor_s["cz"] = "南航";cor_s["fm"] = "上航";cor_s["hu"] = "海航";cor_s["mf"] = "厦航";cor_s["mu"] = "东航";cor_s["sc"] = "山航";cor_s["zh"] = "深航";cor_s["kn"] = "联航";cor_s["8l"] = "祥鹏";cor_s["g5"] = "华夏";cor_s["ho"] = "吉祥";cor_s["nx"] = "澳航";cor_s["uo"] = "港联";cor_s["cx"] = "国泰";cor_s["br"] = "长荣";cor_s["ka"] = "港龙";cor_s["tg"] = "泰航";cor_s["jl"] = "日航";cor_s["2z"] = "长安";cor_s["9c"] = "春秋";cor_s["bk"] = "奥凯";cor_s["3q"] = "云南";cor_s["cj"] = "北航";cor_s["g8"] = "长城";cor_s["sz"] = "西南";cor_s["wh"] = "西北";cor_s["xo"] = "新疆";cor_s["x2"] = "新华";cor_s["wu"] = "武汉";cor_s["pn"] = "西部";cor_s["gs"] = "大新华";cor_s["eu"] = "鹰联";cor_s["ns"] = "东北航";cor_s["cn"] = "海航";
st_date = st_date.replace(/-([1-9]{1})-/,"-0$1-");
st_date = st_date.replace(/-([1-9]{1})$/,"-0$1");
document.title= result[0]+'-'+result[1]+'机票查询结果 - 特价机票、比价机票、打折机票、机票查询，酷讯生活信息搜索引擎';
var adwords = Array(Array('青岛嘉合航服','<font color="red">即日起，网上订票，送价值100万元的航空保险！</font>'),Array('天津军华航服','<font color="red">即日起，网上订票，送价值40万元的航空保险！</font>'),Array('河北天翊航服','<font color="red">即日起，网上订票，送价值40万元的航空保险！</font>'));
//var adtops = Array(Array("5","http://www.airchina.com.cn/9chong/ad01.htm"), Array("22", "http://www.shanghai-air.com/index-from-koo.htm"));
//var adtops = Array(Array("5","http://www.airchina.com.cn/9chong/ad01.htm"));
var adtops = Array(Array("5","http://a.oadz.com/link/C/196/23999/1dinJGtF8RXVQHEZHZkLUx4xYnc_/a/350?www.airchina.com.cn/cxxx/cxcp/17764.shtml"));
var btnimga = new Image();
btnimga.src='/img/ding-botton.gif';
var btnimgb = new Image();
btnimgb.src='/img/ding-botton-pressed.gif';
var btnimgc = new Image();
btnimgc.src='/img/btn-yuding2.gif';
var btnimgd = new Image();
btnimgd.src='/img/btn-xiadan2.gif';

/* functions for init end */
