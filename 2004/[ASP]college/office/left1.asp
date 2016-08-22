<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/sqlstr.asp"-->
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
<b>通用</b>
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
'打开数据库，读出权限
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where username=" & sqlstr(oabusyusername)
rs.open sql,conn,1
cook_allow_see_all_personinf=rs("allow_see_all_personinf")
cook_allow_see_dept_personinf=rs("allow_see_dept_personinf")

cook_allow_edit_all_jobchanginf=rs("allow_edit_all_jobchanginf")
cook_allow_edit_dept_jobchanginf=rs("allow_edit_dept_jobchanginf")

cook_allow_edit_all_rewpuninf=rs("allow_edit_all_rewpuninf")
cook_allow_edit_dept_rewpuninf=rs("allow_edit_dept_rewpuninf")

cook_allow_edit_all_checkinf=rs("allow_edit_all_checkinf")
cook_allow_edit_dept_checkinf=rs("allow_edit_dept_checkinf")

%>
<br>

<div id='KB1Parent' class='parent'>
<a href="#" onClick="expandIt('KB1'); return false">
<IMG SRC='images/workplan.gif' BORDER=0 width="30" height="16" alt="在这里安排自己或下属工作">工作计划管理
</a>
</div>
<div id='KB1Child' class='child'>
<%
if cook_allow_see_all_workrep="yes" or cook_allow_see_dept_workrep="yes" then
%>
<a href="stafdayrep.asp"> <IMG SRC='images/blank.gif' BORDER=0>员工工作计划</a><br>
<%
end if
%>
<a href="dayrep.asp"> <IMG SRC='images/blankend.gif' BORDER=0>本人工作计划</a><br>
</div>

<div id='KB2Parent' class='parent'>
<a href="#" onClick="expandIt('KB2'); return false">
<IMG SRC='images/tonggao.gif' BORDER=0 width="30" height="16" alt="在这里发布通告或查阅通告">通告信息管理
</a>
</div>
<div id='KB2Child' class='child'>
<%
if cook_allow_send_note="yes" then
%>
<a href="newnotice.asp"> <IMG SRC='images/blank.gif' BORDER=0>发布通告</a><br>
<%
end if
%>
<%
if cook_allow_control_note="yes" then
%>
<a href="noticecontrol.asp"> <IMG SRC='images/blank.gif' BORDER=0>管理通告</a><br>
<%
end if
%>
<a href="noticelook.asp"> <IMG SRC='images/blankend.gif' BORDER=0>浏览通告</a>
</div>

<div id='KB3Parent' class='parent'>
<a href="#" onClick="expandIt('KB3'); return false">
<IMG SRC='images/gongwen.gif' BORDER=0 width="30" height="16" alt="在这里发送或查阅公司内部公文">公文信息管理
</a>
</div>
<div id='KB3Child' class='child'>
<%
if cook_allow_control_file="yes" then
%>
<a href="senddatecontrol.asp"> <IMG SRC='images/blank.gif' BORDER=0>公文管理</a><br>
<%
end if
%>
<a href="senddate.asp"> <IMG SRC='images/blank.gif' BORDER=0>发送公文</a><br>
<a href="havesenddate.asp"> <IMG SRC='images/blank.gif' BORDER=0>已发公文</a><br>
<a href="havercidate.asp"> <IMG SRC='images/blankend.gif' BORDER=0>已收公文</a>
</div>

<div id='KB4Parent' class='parent'>
<a href="#" onClick="expandIt('KB4'); return false">
<IMG SRC='images/renli.gif' BORDER=0 width="30" height="16" alt="在这里管理公司员工档案">人力资源管理
</a>
</div>
<div id='KB4Child' class='child'>
<a href="personinf.asp"> <IMG SRC='images/blank.gif' BORDER=0>个人基本档案</a><br>
<%
if cook_allow_see_all_personinf="yes" or cook_allow_see_dept_personinf="yes" then
%>
<a href="stafpersoninf.asp"> <IMG SRC='images/blank.gif' BORDER=0>员工基本档案</a><br>
<%
end if
%>
<%
if cook_allow_edit_all_jobchanginf="yes" or cook_allow_edit_dept_jobchanginf="yes" then
%>
<a href="jobchanginf.asp"> <IMG SRC='images/blank.gif' BORDER=0>员工职位变动</a><br>
<%
end if
%>
<%
if cook_allow_edit_all_rewpuninf="yes" or cook_allow_edit_dept_rewpuninf="yes" then
%>
<a href="rewpuninf.asp"> <IMG SRC='images/blank.gif' BORDER=0>员工奖惩情况</a><br>
<%
end if
%>
<%
if cook_allow_edit_all_checkinf="yes" or cook_allow_edit_dept_checkinf="yes" then
%>
<a href="checkinf.asp"> <IMG SRC='images/blank.gif' BORDER=0>员工考核情况</a><br>
<%
end if
%>
<a href="wageinf.asp"> <IMG SRC='images/blankend.gif' BORDER=0>员工工资档案</a><br>
</div>

<div id='KB5Parent' class='parent'>
<a href="#" onClick="expandIt('KB5'); return false">
<IMG SRC='images/kehu.gif' BORDER=0 BORDER=0 width="30" height="16" alt="这里是通讯录管理">通讯资料管理
</a>
</div>
<div id='KB5Child' class='child'>
<a href="stafaddressinf.asp">
<IMG SRC='images/blank.gif' BORDER=0>员工资料管理
</a><br>
<a href="clientinf.asp">
<IMG SRC='images/blankend.gif' BORDER=0>客户资料管理
</a><br>
</div>

<div id='KB6Parent' class='parent'>
<a href="#" onClick="expandIt('KB6'); return false">
<IMG SRC='images/yuyue.gif' BORDER=0 width="30" height="16" alt="在这里预约使用公司设备">资源预约管理
</a>
</div>
<div id='KB6Child' class='child'>
<a href="booking.asp">
<IMG SRC='images/blankend1.gif' BORDER=0>资源预约管理
</a><br>
</div>
<%
call bgback()
%>

<SCRIPT>
numTotal=6;scores[1]='KB6';scores[2]='KB1';scores[3]='KB2';scores[4]='KB3';scores[5]='KB4';scores[6]='KB5';</SCRIPT>

</body>
</html>