function showitem(id,name,target)
{
	if(target==null || target.length==0)
		return ("<span class=smallFont><a href='"+id+"' target=mainFrame>"+name+"</a></span><br>");
	else
		return ("<span class=smallFont><a target="+target+" href='"+id+"'>"+name+"</a></span><br>");
}


function switchoutlookBar(number)
{
	var i=outlookbar.opentitle;
	outlookbar.opentitle=number;
	var id1,id2,id1b,id2b
	if (number!=i && outlooksmoothstat==0){
	if (number!=-1)
		{
			if (i==-1)
				{
				id2="blankdiv";
				id2b="blankdiv";}
			else{
				id2="outlookdiv"+i;
				id2b="outlookdivin"+i;
				document.all("outlooktitle"+i).style.border="0px solid white";
				document.all("outlooktitle"+i).style.background="#d4d0c8";
				document.all("outlooktitle"+i).style.color="black";
				document.all("outlooktitle"+i).style.textalign="center";
				}
			id1="outlookdiv"+number
			id1b="outlookdivin"+number
			document.all("outlooktitle"+number).style.border="0px solid black";
			document.all("outlooktitle"+number).style.background="#FAF8F5";
			document.all("outlooktitle"+number).style.color="black";
			document.all("outlooktitle"+number).style.textalign="center";
			smoothout(id1,id2,id1b,id2b,0);
		}
	else
		{
			document.all("blankdiv").style.display="";
			document.all("blankdiv").sryle.height="100%";
			document.all("outlookdiv"+i).style.display="none";
			document.all("outlookdiv"+i).style.height="0%";
			document.all("outlooktitle"+i).style.border="1px solid navy";
			document.all("outlooktitle"+i).style.background="#6666be";
			document.all("outlooktitle"+i).style.color="black";
			document.all("outlooktitle"+i).style.textalign="center";
		}
	}
			
}

function smoothout(id1,id2,id1b,id2b,stat)
{
	if(stat==0){
		tempinnertext1=document.all(id1b).innerHTML;
		tempinnertext2=document.all(id2b).innerHTML;
		document.all(id1b).innerHTML="";
		document.all(id2b).innerHTML="";
		outlooksmoothstat=1;
		document.all(id1b).style.overflow="hidden";
		document.all(id2b).style.overflow="hidden";
		document.all(id1).style.height="0%";
		document.all(id1).style.display="";
		setTimeout("smoothout('"+id1+"','"+id2+"','"+id1b+"','"+id2b+"',"+outlookbar.inc+")",outlookbar.timedalay);
	}
	else
	{
		stat+=outlookbar.inc;
		if (stat>100)
			stat=100;
		document.all(id1).style.height=stat+"%";
		document.all(id2).style.height=(100-stat)+"%";
		if (stat<100)
			setTimeout("smoothout('"+id1+"','"+id2+"','"+id1b+"','"+id2b+"',"+stat+")",outlookbar.timedalay);
		else
			{
			document.all(id1b).innerHTML=tempinnertext1;
			document.all(id2b).innerHTML=tempinnertext2;
			outlooksmoothstat=0;
			document.all(id1b).style.overflow="auto";
			document.all(id2).style.display="none";
			}
	}
}

function getOutLine()
{
	outline="<table class=uptitle cellspacing=0 bordercolorlight=#808080 bordercolordark=#FFFFFF cellpadding=2 border=0 "+outlookbar.otherclass+">";
	for (i=0;i<(outlookbar.titlelist.length);i++)
		{
			outline+="<tr><td name=outlooktitle"+i+" id=outlooktitle"+i+" ";		
			if (i!=outlookbar.opentitle)
				outline+=" nowrap align=center style='cursor:hand;heibackground-color:#d4d0c8;color:black' ";
			else
				outline+=" nowrap align=center style='cursor:hand;background-color:#d4d0c8;color:black;height:5' ";
			outline+=outlookbar.titlelist[i].otherclass
			outline+=" onclick='switchoutlookBar("+i+")'><span class=smallFont>";
			outline+=outlookbar.titlelist[i].title+"</span></td></tr>";
			outline+="<tr><td name=outlookdiv"+i+" valign=top align=center  id=outlookdiv"+i+" style='width:100%"
			if (i!=outlookbar.opentitle)
				outline+=";display:none;height:0%;";
			else
				outline+=";display:;height:100%;";
			outline+="'><div name=outlookdivin"+i+" id=outlookdivin"+i+" style='overflow:auto;width:100%;height:100%'>";
			outline+="<table " + outlookbar.currentclass + ">";
			for (j=0;j<outlookbar.itemlist[i].length;j++) {
				outline += "<tr><td align=center>"
				outline+=showitem(outlookbar.itemlist[i][j].key,outlookbar.itemlist[i][j].title,outlookbar.itemlist[i][j].target);
			}
			outline+="</table>"
			outline+="</div></td></tr>"
		}
	outline+="<tr><td name=blankdiv valign=top align=center  id=blankdiv style='height:100%;width:100%:"
	if (outlookbar.opentitle!=-1)
				outline+=";display:none;";
			else
				outline+=";display:;";
	outline+="'><div style='overflow:auto;width:100%;height:100%'>";
	outline+="</div></td></tr>"
	
	outline+="</table>"
	return outline

}

function show()
{
	var outline;
	outline="<div id=outLookBarDiv name=outLookBarDiv style='width=100%;height:100%'>"
	outline+=outlookbar.getOutLine();
	outline+="</div>"
	document.write(outline);
}

function theitem(intitle,instate,inkey, target)
{
	this.state=instate;
	this.otherclass=" nowrap ";
	this.key=inkey;
	this.title=intitle;
	this.target=target;
}

function addtitle(intitle)
{
	outlookbar.itemlist[outlookbar.titlelist.length]=new Array();
	outlookbar.titlelist[outlookbar.titlelist.length]=new theitem(intitle,1,0);
	if (outlookbar.titlelist.length != (outlookbar.starttitle+1))
		outlookbar.titlelist[outlookbar.titlelist.length-1].otherclass=" nowrap align=center style='cursor:hand;background-color:#d4d0c8;color:white;height:5' ";
	else
		outlookbar.titlelist[outlookbar.titlelist.length-1].otherclass=" nowrap align=center style='cursor:hand;background-color:#d4d0c8;color:#6666b3;height:5' ";
	return(outlookbar.titlelist.length-1);
}

function additem(intitle,parentid,inkey,target)
{
	if (parentid>=0 && parentid<=outlookbar.titlelist.length)
	{
		outlookbar.itemlist[parentid][outlookbar.itemlist[parentid].length]=new theitem(intitle,2,inkey,target);
		outlookbar.itemlist[parentid][outlookbar.itemlist[parentid].length-1].otherclass=" nowrap align=left style='backgroundColor:#d4d0c8;height:5' ";
		return(outlookbar.itemlist[parentid].length-1);
	}
	else
		additem=-1;
}

function outlook()
{
	this.titlelist=new Array();
	this.itemlist=new Array();
	this.divstyle="style='height:100%;width:100%;overflow:auto' ";
	this.otherclass="border=0 cellspacing='0' style='height:100%;width:100%' valign=middle align=center ";
	this.currentclass="border=0 cellspacing='0' cellpadding='3' style='width:100%' ";//����
	this.addtitle=addtitle;
	this.additem=additem;
	this.starttitle=-1;
	this.show=show;
	this.getOutLine=getOutLine;
	this.opentitle=this.starttitle;
	this.reflesh=outreflesh;
	this.timedelay=50;
	this.inc=10;
	
}

function outreflesh()
{
	document.all("outLookBarDiv").innerHTML=outlookbar.getOutLine();
}

function locatefold(foldname)
{
	for (var i=0;i<outlookbar.titlelist.length;i++)
		if(foldname==outlookbar.titlelist[i].title)
			{
				 outlookbar.starttitle=i;
				 outlookbar.opentitle=i;
			}
}
var outlookbar=new outlook();
var tempinnertext1,tempinnertext2,outlooksmoothstat
outlooksmoothstat=0;

function loadURL(url) {
window.parent.mainFrame.location=url;
}