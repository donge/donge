<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/monthlycal.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/checked.asp"-->
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then response.redirect "default.asp"
cook_allow_see_all_workrep=request.cookies("cook_allow_see_all_workrep")
cook_allow_see_dept_workrep=request.cookies("cook_allow_see_dept_workrep")

if request("username")<>"" then username=request("username")
'取得当前日期
mydate=date
'取得当前月
mymonth=month(now())
if request("mymonth")<>"" then mymonth=cint(request("mymonth"))
'取得当前年
myyear=year(now())
if request("myyear")<>"" then myyear=cint(request("myyear"))
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="css/css.css">
<script language="javascript1.2" src="js/openwin.js"></script>
<title>网络办公系统</title>
</head>
<body bgcolor="#eeeeee" topmargin="5" leftmargin="5">
<% call bghead() %>
<center>
<%
if cook_allow_see_all_workrep="yes" then
%>
<table>
<tr>
<form action="stafdayrep.asp" method=get name="form1">
<td>
<select name="userdept" size=1 onChange="document.form1.submit();">
<%
'打开数据库读出部门
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select DISTINCT userdept from userinf"
rs.open sql,conn,1
if not rs.eof and not rs.bof then firstdept=rs("userdept")
if request("userdept")<>"" then firstdept=request("userdept")
while not rs.eof and not rs.bof
%>
<option value="<%=rs("userdept")%>"<%=selected(firstdept,rs("userdept"))%>><%=rs("userdept")%></option>
<%
rs.movenext
wend
%>
</select>
</td>
</form>
<form action="stafdayrep.asp" method=get name="form2">
<td>
<input type="hidden" name="userdept" value="<%=firstdept%>">
<select name="username" size=1>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select name,username from userinf where userdept=" & sqlstr(firstdept) & " and userlevel<>'总管' and forbid='no'"
rs.open sql,conn,1
if not rs.eof and not rs.bof then username=rs("username")
if request("username")<>"" then username=request("username")
while not rs.eof and not rs.bof
%>
<option value="<%=rs("username")%>"<%=selected(username,rs("username"))%>><%=rs("name")%></option>
<%
rs.movenext
wend
%>
</select>
<select name="myyear" size=1>
<option value=2001<%=selected(2001,myyear)%>>2001年</option>
<option value=2002<%=selected(2002,myyear)%>>2002年</option>
<option value=2003<%=selected(2003,myyear)%>>2003年</option>
<option value=2004<%=selected(2004,myyear)%>>2004年</option>
<option value=2005<%=selected(2005,myyear)%>>2005年</option>
<option value=2006<%=selected(2006,myyear)%>>2006年</option>
<option value=2007<%=selected(2007,myyear)%>>2007年</option>
<option value=2008<%=selected(2008,myyear)%>>2008年</option>
<option value=2009<%=selected(2009,myyear)%>>2009年</option>
</select>
<select name="mymonth" size=1>
<option value=1<%=selected(1,mymonth)%>>1月</option>
<option value=2<%=selected(2,mymonth)%>>2月</option>
<option value=3<%=selected(3,mymonth)%>>3月</option>
<option value=4<%=selected(4,mymonth)%>>4月</option>
<option value=5<%=selected(5,mymonth)%>>5月</option>
<option value=6<%=selected(6,mymonth)%>>6月</option>
<option value=7<%=selected(7,mymonth)%>>7月</option>
<option value=8<%=selected(8,mymonth)%>>8月</option>
<option value=9<%=selected(9,mymonth)%>>9月</option>
<option value=10<%=selected(10,mymonth)%>>10月</option>
<option value=11<%=selected(11,mymonth)%>>11月</option>
<option value=12<%=selected(12,mymonth)%>>12月&nbsp;&nbsp;</option>
</select>
<input type="submit" name="submit" value="查询">
</td>
</form>
</tr>
</table>
<%
else
%>

<table>
<tr>
<form action="stafdayrep.asp" method=get name="form1">
<td>
<select name="username" size=1>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where userdept=" & sqlstr(oabusyuserdept) & " and userlevel<>'总管' and forbid='no'"
rs.open sql,conn,1
if not rs.eof and not rs.bof then username=rs("username")
if request("username")<>"" then username=request("username")
while not rs.eof and not rs.bof

%>
<option value="<%=rs("username")%>"<%=selected(username,rs("username"))%>><%=rs("name")%></option>
<%
rs.movenext
wend
%>
</select>
<select name="myyear" size=1>
<option value=2001<%=selected(2001,myyear)%>>2001年</option>
<option value=2002<%=selected(2002,myyear)%>>2002年</option>
<option value=2003<%=selected(2003,myyear)%>>2003年</option>
<option value=2004<%=selected(2004,myyear)%>>2004年</option>
<option value=2005<%=selected(2005,myyear)%>>2005年</option>
<option value=2006<%=selected(2006,myyear)%>>2006年</option>
<option value=2007<%=selected(2007,myyear)%>>2007年</option>
<option value=2008<%=selected(2008,myyear)%>>2008年</option>
<option value=2009<%=selected(2009,myyear)%>>2009年</option>
</select>
<select name="mymonth" size=1>
<option value=1<%=selected(1,mymonth)%>>1月</option>
<option value=2<%=selected(2,mymonth)%>>2月</option>
<option value=3<%=selected(3,mymonth)%>>3月</option>
<option value=4<%=selected(4,mymonth)%>>4月</option>
<option value=5<%=selected(5,mymonth)%>>5月</option>
<option value=6<%=selected(6,mymonth)%>>6月</option>
<option value=7<%=selected(7,mymonth)%>>7月</option>
<option value=8<%=selected(8,mymonth)%>>8月</option>
<option value=9<%=selected(9,mymonth)%>>9月</option>
<option value=10<%=selected(10,mymonth)%>>10月</option>
<option value=11<%=selected(11,mymonth)%>>11月</option>
<option value=12<%=selected(12,mymonth)%>>12月&nbsp;&nbsp;</option>
</select>
<input type="submit" name="submit" value="查询">
</td>
</form>
</tr>
</table>
<%
end if
%>
<%
'读出姓名
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where username=" & sqlstr(username)
rs.open sql,conn,1
if not rs.eof and not rs.bof then
name=rs("name")
else
%>
</center>
<%
call bgmid()
%>
<br><br><center><font color=red size=3>
请增加下属员工后再来！
</font></center>
<%
call bgback()
%>
<%
response.end
end if
%>
<%=name%>的<%=myyear%>年<%=mymonth%>月工作计划
</center>
<%
call bgmid()
%>
<br>
<center>标题为黑色表示此工作性质一般且没完成，标题为<font color=blue>兰色</font>表示此工作性质一般且已完成<br>标题为<font color=red>红色</font>表示此工作性质重要且没完成，标题为<font color=#770000>棕色</font>表示此工作性质重要且已完成</center>
<br>
<% call monthlycal(username,oabusyusername) %>
<%
call bgback()
%>



</body>
</html>