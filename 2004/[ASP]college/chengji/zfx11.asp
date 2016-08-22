<!--#include file="conn.asp"-->


<%

  if Session.Contents("gws")=true or Session.Contents("gws1")=true then

 zybj=request("zybj")
 
 dim rs
 dim sql
  set rs=server.createobject("adodb.recordset")
 sql="select * from zybjmc where zybj='" + zybj + "'"
 rs.open sql,conn,3,3
%>






<html>
<head>
<style fprolloverstyle>A:hover {color: #FF0000; font-size: 1.2em; font-family: 华文行楷; font-weight: bold}
</style>
<style>
.shakeimage{
position:relative
}
</style>
<script language="JavaScript1.2">
var rector=3

var stopit=0 
var a=1

function init(which){
stopit=0
shake=which
shake.style.left=0
shake.style.top=0
}

function rattleimage(){
if ((!document.all&&!document.getElementById)||stopit==1)
return
if (a==1){
shake.style.top=parseInt(shake.style.top)+rector
}
else if (a==2){
shake.style.left=parseInt(shake.style.left)+rector
}
else if (a==3){
shake.style.top=parseInt(shake.style.top)-rector
}
else{
shake.style.left=parseInt(shake.style.left)-rector
}
if (a<4)
a++
else
a=1
setTimeout("rattleimage()",50)
}

function stoprattle(which){
stopit=1
which.style.left=0
which.style.top=0
}

</script>









<script language=javaScript>
<!--// 

function clockon() {
thistime= new Date()
var hours=thistime.getHours()
var minutes=thistime.getMinutes()
var seconds=thistime.getSeconds()
if (eval(hours) <10) {hours="0"+hours}
if (eval(minutes) < 10) {minutes="0"+minutes}
if (seconds < 10) {seconds="0"+seconds}
thistime = hours+":"+minutes+":"+seconds

if(document.all) {
bgclocknoshade.innerHTML=thistime
bgclockshade.innerHTML=thistime
}


var timer=setTimeout("clockon()",200)
}
//-->
</script>





















<title>龚文生的菜单</title>

<style type="text/css">

body {  font-family: "宋体"; font-size: 9pt; margin-top: 0px; margin-left: 5px; margin-right: 0px}
A:hover {
	COLOR: blue; TEXT-DECORATION: underline
}
a:visited {  color: black; text-decoration: none}
a:link {  color: #222222; text-decoration: none}
TD {
	FONT: 9pt "宋体"; MARGIN-TOP: 0px; TEXT-DECORATION: none
}
</style>
<script language="JavaScript1.2">
scores = new Array(20);
var numTotal=0;
NS4 = (document.layers) ? 1 : 0;
IE4 = (document.all) ? 1 : 0;
ver4 = (NS4 || IE4) ? 1 : 0;

if (ver4) {
    with (document) {
        write("<STYLE TYPE='text/css'>");
        if (NS4) {
            write(".parent {position:absolute; visibility:visible}");
            write(".child {position:absolute; visibility:visible}");
            write(".regular {position:absolute; visibility:visible}")
        }
        else {
            write(".child {display:none}")
        }
        write("</STYLE>");
    }
}

function getIndex(el) {
    ind = null;
    for (i=0; i<document.layers.length; i++) {
        whichEl = document.layers[i];
        if (whichEl.id == el) {
            ind = i;
            break;
        }
    }
    return ind;
}

function arrange() {
    nextY = document.layers[firstInd].pageY +document.layers[firstInd].document.height;
    for (i=firstInd+1; i<document.layers.length; i++) {
        whichEl = document.layers[i];
        if (whichEl.visibility != "hide") {
            whichEl.pageY = nextY;
            nextY += whichEl.document.height;
        }
    }
}

function initIt(){
    if (!ver4) return;
    if (NS4) {
        for (i=0; i<document.layers.length; i++) {
            whichEl = document.layers[i];
            if (whichEl.id.indexOf("Child") != -1) whichEl.visibility = "hide";
       }
        arrange();
    }
    else {
        divColl = document.all.tags("DIV");
        for (i=0; i<divColl.length; i++) {
            whichEl = divColl(i);
            if (whichEl.className == "child") whichEl.style.display = "none";
        }
    }
}

function expandIt(el) {
	if (!ver4) return;
    if (IE4) {
        whichEl1 = eval(el + "Child");
		for(i=1;i<=numTotal;i++){
			whichEl = eval(scores[i] + "Child");
			if(whichEl!=whichEl1) {
				whichEl.style.display = "none";
			}
		}
        whichEl1 = eval(el + "Child");
        if (whichEl1.style.display == "none") {
            whichEl1.style.display = "block";
        }
        else {
            whichEl1.style.display = "none";
        }
    }
    else {
        whichEl = eval("document." + el + "Child");
		for(i=1;i<=numTotal;i++){
			whichEl = eval("document." + scores[i] + "Child");
			if(whichEl!=whichEl1) {
				whichEl.visibility = "hide";
			}
		}
        if (whichEl.visibility == "hide") {
            whichEl.visibility = "show";
        }
        else {
            whichEl.visibility = "hide";
        }
        arrange();
    }
}
onload = initIt;
</script>











</head>

<body bgcolor="#fef4d9" leftmargin="0" topmargin="0" text="#000000" onLoad="clockon()">




<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="124" id="AutoNumber1" height="80">
<td width="140" height="80">
<center>
<a title="回查询主页" href='index.asp' target='_parent'><img src="11.gif"  width="69" height="67"  border="0" onMouseover="init(this);rattleimage()" onMouseout="stoprattle(this)"  class="shakeimage" ></a></td>
</center>
</table>
<center>
<b><font color=blue size="4">成绩分析</font>
</center>









<TABLE border=0 cellPadding=0 cellSpacing=0 width=130>
  <TBODY>
  <TR>
    <TD>
<div id='KB1Parent' class='parent'><a href="#" onClick="expandIt('KB1'); return false">
<IMG SRC='plus.gif' BORDER=0 width="26" height="13">第一学期</a></div><div id='KB1Child' class='child'>
<a href='bjxqfx.asp?zybj=<%=zybj%>&mc=1' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11">学期分析</a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs10")%>&sj=fs10' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs10")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs11")%>&sj=fs11' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs11")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs12")%>&sj=fs12' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs12")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs13")%>&sj=fs13' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs13")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs14")%>&sj=fs14' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs14")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs15")%>&sj=fs15' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs15")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs16")%>&sj=fs16' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs16")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs17")%>&sj=fs17' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs17")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs18")%>&sj=fs18' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs18")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs19")%>&sj=fs19' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs19")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs110")%>&sj=fs110' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs110")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs111")%>&sj=fs111' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs111")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs112")%>&sj=fs112' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs112")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs113")%>&sj=fs113' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs113")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs114")%>&sj=fs114' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs114")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs115")%>&sj=fs115' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs115")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs116")%>&sj=fs116' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs116")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs117")%>&sj=fs117' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs117")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs118")%>&sj=fs118' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs118")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs119")%>&sj=fs119' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs119")%></a><br>

</div>

<div id='KB2Parent' class='parent'><a href="#" onClick="expandIt('KB2'); return false">
<IMG SRC='plus.gif' BORDER=0 width="26" height="13">第二学期</a></div><div id='KB2Child' class='child'>
<a href='bjxqfx.asp?zybj=<%=zybj%>&mc=2' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11">学期分析</a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs20")%>&sj=fs20' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs20")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs21")%>&sj=fs21' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs21")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs22")%>&sj=fs22' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs22")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs23")%>&sj=fs23' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs23")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs24")%>&sj=fs24' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs24")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs25")%>&sj=fs25' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs25")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs26")%>&sj=fs26' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs26")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs27")%>&sj=fs27' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs27")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs28")%>&sj=fs28' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs28")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs29")%>&sj=fs29' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs29")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs120")%>&sj=fs120' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs120")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs121")%>&sj=fs121' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs121")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs122")%>&sj=fs122' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs122")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs123")%>&sj=fs123' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs123")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs124")%>&sj=fs124' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs124")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs125")%>&sj=fs125' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs125")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs126")%>&sj=fs126' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs126")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs127")%>&sj=fs127' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs127")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs128")%>&sj=fs128' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs128")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs129")%>&sj=fs129' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs129")%></a><br>

</div>

<div id='KB3Parent' class='parent'><a href="#" onClick="expandIt('KB3'); return false">
<IMG SRC='plus.gif' BORDER=0 width="26" height="13">第三学期</a></div><div id='KB3Child' class='child'>
<a href='bjxqfx.asp?zybj=<%=zybj%>&mc=3' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11">学期分析</a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs30")%>&sj=fs30' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs30")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs31")%>&sj=fs31' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs31")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs32")%>&sj=fs32' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs32")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs33")%>&sj=fs33' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs33")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs34")%>&sj=fs34' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs34")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs35")%>&sj=fs35' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs35")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs36")%>&sj=fs36' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs36")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs37")%>&sj=fs37' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs37")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs38")%>&sj=fs38' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs38")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs39")%>&sj=fs39' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs39")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs130")%>&sj=fs130' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs130")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs131")%>&sj=fs131' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs131")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs132")%>&sj=fs132' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs132")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs133")%>&sj=fs133' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs133")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs134")%>&sj=fs134' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs134")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs135")%>&sj=fs135' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs135")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs136")%>&sj=fs136' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs136")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs137")%>&sj=fs137' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs137")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs138")%>&sj=fs138' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs138")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs139")%>&sj=fs139' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs139")%></a><br>

</div>

<div id='KB4Parent' class='parent'><a href="#" onClick="expandIt('KB4'); return false">
<IMG SRC='plus.gif' BORDER=0 width="26" height="13">第四学期</a></div><div id='KB4Child' class='child'>
<a href='bjxqfx.asp?zybj=<%=zybj%>&mc=4' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11">学期分析</a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs40")%>&sj=fs40' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs40")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs41")%>&sj=fs41' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs41")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs42")%>&sj=fs42' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs42")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs43")%>&sj=fs43' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs43")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs44")%>&sj=fs44' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs44")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs45")%>&sj=fs45' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs45")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs46")%>&sj=fs46' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs46")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs47")%>&sj=fs47' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs47")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs48")%>&sj=fs48' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs48")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs49")%>&sj=fs49' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs49")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs140")%>&sj=fs140' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs140")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs141")%>&sj=fs141' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs141")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs142")%>&sj=fs142' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs142")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs143")%>&sj=fs143' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs143")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs144")%>&sj=fs144' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs144")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs145")%>&sj=fs145' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs145")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs146")%>&sj=fs146' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs146")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs147")%>&sj=fs147' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs147")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs148")%>&sj=fs148' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs148")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs149")%>&sj=fs149' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs149")%></a><br>

</div>

<div id='KB5Parent' class='parent'><a href="#" onClick="expandIt('KB5'); return false">
<IMG SRC='plus.gif' BORDER=0 width="26" height="13">第五学期</a></div><div id='KB5Child' class='child'>
<a href='bjxqfx.asp?zybj=<%=zybj%>&mc=5' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11">学期分析</a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs50")%>&sj=fs50' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs50")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs51")%>&sj=fs51' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs51")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs52")%>&sj=fs52' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs52")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs53")%>&sj=fs53' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs53")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs54")%>&sj=fs54' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs54")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs55")%>&sj=fs55' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs55")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs56")%>&sj=fs56' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs56")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs57")%>&sj=fs57' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs57")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs58")%>&sj=fs58' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs58")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs59")%>&sj=fs59' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs59")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs150")%>&sj=fs150' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs150")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs151")%>&sj=fs151' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs151")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs152")%>&sj=fs152' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs152")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs153")%>&sj=fs153' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs153")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs154")%>&sj=fs154' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs154")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs155")%>&sj=fs155' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs155")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs156")%>&sj=fs156' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs156")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs157")%>&sj=fs157' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs157")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs158")%>&sj=fs158' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs158")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs159")%>&sj=fs159' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs159")%></a><br>

</div>


<div id='KB6Parent' class='parent'><a href="#" onClick="expandIt('KB6'); return false">
<IMG SRC='plus.gif' BORDER=0 width="26" height="13">第六学期</a></div><div id='KB6Child' class='child'>
<a href='bjxqfx.asp?zybj=<%=zybj%>&mc=6' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11">学期分析</a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs60")%>&sj=fs60' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs60")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs61")%>&sj=fs61' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs61")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs62")%>&sj=fs62' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs62")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs63")%>&sj=fs63' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs63")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs64")%>&sj=fs64' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs64")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs65")%>&sj=fs65' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs65")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs66")%>&sj=fs66' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs66")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs67")%>&sj=fs67' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs67")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs68")%>&sj=fs68' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs68")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs69")%>&sj=fs69' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs69")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs160")%>&sj=fs160' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs160")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs161")%>&sj=fs161' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs161")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs162")%>&sj=fs162' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs162")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs163")%>&sj=fs163' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs163")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs164")%>&sj=fs164' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs164")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs165")%>&sj=fs165' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs165")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs166")%>&sj=fs166' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs166")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs167")%>&sj=fs167' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs167")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs168")%>&sj=fs168' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs168")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs169")%>&sj=fs169' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs169")%></a><br>

</div>


<div id='KB7Parent' class='parent'><a href="#" onClick="expandIt('KB7'); return false">
<IMG SRC='plus.gif' BORDER=0 width="26" height="13">第七学期</a></div><div id='KB7Child' class='child'>
<a href='bjxqfx.asp?zybj=<%=zybj%>&mc=7' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11">学期分析</a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs70")%>&sj=fs70' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs70")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs71")%>&sj=fs71' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs71")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs72")%>&sj=fs72' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs72")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs73")%>&sj=fs73' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs73")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs74")%>&sj=fs74' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs74")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs75")%>&sj=fs75' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs75")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs76")%>&sj=fs76' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs76")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs77")%>&sj=fs77' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs77")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs78")%>&sj=fs78' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs78")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs79")%>&sj=fs79' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs79")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs170")%>&sj=fs170' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs170")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs171")%>&sj=fs171' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs171")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs172")%>&sj=fs172' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs172")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs173")%>&sj=fs173' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs173")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs174")%>&sj=fs174' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs174")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs175")%>&sj=fs175' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs175")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs176")%>&sj=fs176' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs176")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs177")%>&sj=fs177' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs177")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs178")%>&sj=fs178' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs178")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs179")%>&sj=fs179' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs179")%></a><br>

</div>


<div id='KB8Parent' class='parent'><a href="#" onClick="expandIt('KB8'); return false">
<IMG SRC='plus.gif' BORDER=0 width="26" height="13">第八学期</a></div><div id='KB8Child' class='child'>
<a href='bjxqfx.asp?zybj=<%=zybj%>&mc=8' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11">学期分析</a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs80")%>&sj=fs80' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs80")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs81")%>&sj=fs81' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs81")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs82")%>&sj=fs82' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs82")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs83")%>&sj=fs83' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs83")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs84")%>&sj=fs84' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs84")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs85")%>&sj=fs85' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs85")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs86")%>&sj=fs86' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs86")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs87")%>&sj=fs87' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs87")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs88")%>&sj=fs88' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs88")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs89")%>&sj=fs89' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs89")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs180")%>&sj=fs180' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs180")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs181")%>&sj=fs181' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs181")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs182")%>&sj=fs182' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs182")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs183")%>&sj=fs183' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs183")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs184")%>&sj=fs184' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs184")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs185")%>&sj=fs185' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs185")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs186")%>&sj=fs186' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs186")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs187")%>&sj=fs187' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs187")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs188")%>&sj=fs188' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs188")%></a><br>
<a href='mf.asp?zybj=<%=zybj%>&mc=<%=rs("fs189")%>&sj=fs189' target='gws'>&nbsp;<IMG SRC='xy.gif' BORDER=0 width="9" height="11"><%=rs("fs189")%></a><br>

</div>



  <SCRIPT>numTotal=8;scores[1]='KB1';scores[2]='KB2';scores[3]='KB3';scores[4]='KB4';scores[5]='KB5';scores[6]='KB6';scores[7]='KB7';scores[8]='KB8';
</SCRIPT>
</TD></TR>
  </TBODY></TABLE>
<center>
<p></p>
</center>





<div id="bgclockshade" style="position:absolute;visibility:visible;font-family:Arial;color:ffff00;font-size:18px;top:6px;left:30px"></div>




<div id="bgclocknoshade" style="position:absolute;visibility:visible;font-family:Arial;color:ff0000;font-size:18px;top:7px;left:31px"></div>

<div id="mainbody" style="position:absolute; visibility:visible">
</div>
<center>
<p></p>
</center>

</b>

</body>
</html>
<%
else
 response.write"<script language='javascript'>" 
		 response.write"alert('你没有登录！');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end


end if
%>