<!--#include file="asp/bgsub.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="css/css.css">
<title>网络办公系统</title>
</head>
<base target="main">

<script language="JavaScript1.2">
scores = new Array(20);
var numTotal=0;
NS4 = (document.layers) ? 1 : 0;
IE4 = (document.all) ? 1 : 0;
ver4 = (NS4 || IE4) ? 1 : 0;

if (ver4) {    with (document) {        write("<STYLE TYPE='text/css'>");        if (NS4) {            write(".parent {position:absolute; visibility:visible}");            write(".child {position:absolute; visibility:visible}");            write(".regular {position:absolute; visibility:visible}")        }        else {            write(".child {display:none}")        }        write("</STYLE>");    }}



function getIndex(el) {    ind = null;    for (i=0; i<document.layers.length; i++) {        whichEl = document.layers[i];        if (whichEl.id == el) {            ind = i;            break;        }    }    return ind;}


function arrange() {    nextY = document.layers[firstInd].pageY +document.layers[firstInd].document.height;    for (i=firstInd+1; i<document.layers.length; i++) {        whichEl = document.layers[i];        if (whichEl.visibility != "hide") {            whichEl.pageY = nextY;            nextY += whichEl.document.height;        }    }}function initIt(){    if (!ver4) return;    if (NS4) {        for (i=0; i<document.layers.length; i++) {            whichEl = document.layers[i];            if (whichEl.id.indexOf("Child") != -1) whichEl.visibility = "hide";       }        arrange();    }    else {        divColl = document.all.tags("DIV");        for (i=0; i<divColl.length; i++) {            whichEl = divColl(i);            if (whichEl.className == "child") whichEl.style.display = "none";        }    }}


function expandIt(el) {	if (!ver4) return;    if (IE4) {        whichEl1 = eval(el + "Child");		for(i=1;i<=numTotal;i++){			whichEl = eval(scores[i] + "Child");			if(whichEl!=whichEl1) {				whichEl.style.display = "none";			}		}        whichEl1 = eval(el + "Child");        if (whichEl1.style.display == "none") {            whichEl1.style.display = "block";        }        else {            whichEl1.style.display = "none";        }    }    else {        whichEl = eval("document." + el + "Child");		for(i=1;i<=numTotal;i++){			whichEl = eval("document." + scores[i] + "Child");			if(whichEl!=whichEl1) {				whichEl.visibility = "hide";			}		}        if (whichEl.visibility == "hide") {            whichEl.visibility = "show";        }        else {            whichEl.visibility = "hide";        }        arrange();    }}



onload = initIt;

</script>




<body bgcolor="#eeeeee" topmargin="0" leftmargin="5">
<table border="0" width="100%" cellspacing="0" cellpadding="0">
<tr>
<td height=5></td>
</tr>
</table>
<%
call bghead()
%>
<b>设置</b>
<%
call bgmid()
%>






<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")

cook_allow_see_all_workrep=request.cookies("cook_allow_see_all_workrep")
cook_allow_see_dept_workrep=request.cookies("cook_allow_see_dept_workrep")
cook_allow_control_dept_user=request.cookies("cook_allow_control_dept_user")
cook_allow_control_all_user=request.cookies("cook_allow_control_all_user")
cook_allow_send_note=request.cookies("cook_allow_send_note")
cook_allow_control_note=request.cookies("cook_allow_control_note")
cook_allow_control_file=request.cookies("cook_allow_control_file")
cook_allow_control_level=request.cookies("cook_allow_control_level")
%>

<div id='KB1Parent' class='parent'>
<a href="#" onClick="expandIt('KB1'); return false">
<IMG SRC='images/plus.gif' BORDER=0>用户帐号设置
</a>
</div>
<div id='KB1Child' class='child'>
<%
if cook_allow_control_dept_user="yes" then
%>
<a href="addstaf.asp"> <IMG SRC='images/blank.gif' BORDER=0>增加下属用户</a><br>
<a href="stafcontrol.asp"> <IMG SRC='images/blank.gif' BORDER=0>管理下属用户</a><br>
<%
end if
%>
<%
if cook_allow_control_all_user="yes" then
%>
<a href="adduser.asp"> <IMG SRC='images/blank.gif' BORDER=0>增加用户</a><br>
<a href="usercontrol.asp"> <IMG SRC='images/blank.gif' BORDER=0>管理用户</a><br>
<%
end if
%>
<a href="userinf.asp"> <IMG SRC='images/blankend.gif' BORDER=0>个人资料维护</a>
</div>


<div id='KB2Parent' class='parent'>
<a href="#" onClick="expandIt('KB2'); return false">
<IMG SRC='images/plus.gif' BORDER=0>用户权限设置
</a>
</div>
<div id='KB2Child' class='child'>
<%
if cook_allow_control_level="yes" then
%>
<a href="workplanpopedom.asp"> <IMG SRC='images/blank.gif' BORDER=0>工作计划权限</a><br>
<a href="noticefilepopedom.asp"> <IMG SRC='images/blank.gif' BORDER=0>通告公文权限</a><br>
<a href="personinfpopedom.asp"> <IMG SRC='images/blank.gif' BORDER=0>基本档案权限</a><br>
<a href="jobchanginfpopedom.asp"> <IMG SRC='images/blank.gif' BORDER=0>职务变动权限</a><br>
<a href="rewpunpopedom.asp"> <IMG SRC='images/blank.gif' BORDER=0>奖惩编辑权限</a><br>
<a href="checkinfpopedom.asp"> <IMG SRC='images/blank.gif' BORDER=0>考核编辑权限</a><br>
<a href="wageinfpopedom.asp"> <IMG SRC='images/blank.gif' BORDER=0>工资编辑权限</a><br>
<a href="addressinfpopedom.asp"> <IMG SRC='images/blank.gif' BORDER=0>通讯资料权限</a><br>
<a href="usercontrolpopedom.asp"> <IMG SRC='images/blankend1.gif' BORDER=0>用户管理权限</a><br>
<%
end if
%>
</div>







<%
call bgback()
%>

<SCRIPT>
numTotal=2;scores[1]='KB2';scores[2]='KB1';</SCRIPT>

</body>
</html>