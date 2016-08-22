<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/checked.asp"-->
<%
'-----------------------------------------
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then response.redirect "default.asp"
'--------------------------------------
if request("submit")="应用" then
allow_edit_person_personinf=request("allow_edit_person_personinf")
if allow_edit_person_personinf="" then allow_edit_person_personinf="no"

allow_see_all_personinf=request("allow_see_all_personinf")
if allow_see_all_personinf="" then allow_see_all_personinf="no"

allow_see_dept_personinf=request("allow_see_dept_personinf")
if allow_see_dept_personinf="" then allow_see_dept_personinf="no"

set conn=opendb("oabusy","conn","accessdsn")
sql="update userinf set "
sql=sql & "allow_edit_person_personinf=" & sqlstr(allow_edit_person_personinf) & ","
sql=sql & "allow_see_dept_personinf=" & sqlstr(allow_see_dept_personinf) & ","
sql=sql & "allow_see_all_personinf=" & sqlstr(allow_see_all_personinf) & " where id=" & request("id")
conn.Execute sql

end if
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
<table>
<tr>
<td><b>基本档案权限设置</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<%
'打开数据库，读出部门
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select DISTINCT userdept from userinf"
rs.open sql,conn,1
%>
<form method="post" action="personinfpopedom.asp">
<td>
<select size=1 name="userdept">
<%
if not rs.eof and not rs.bof then userdept=rs("userdept")
if request("userdept")<>"" then userdept=request("userdept")
while not rs.eof and not rs.bof
%>
<option value="<%=rs("userdept")%>"<%=selected(userdept,rs("userdept"))%>><%=rs("userdept")%></option>
<%
rs.movenext
wend
%>
</select><input type="submit" value="查看">
</td>
</form>
</tr>
</table>
</center>
<%
call bgmid()
%>

<center>
<table border="1"  cellspacing="0" cellpadding="0" width="95%">
<tr bgcolor="#aaaaaa"><td align=center height=25><b>姓名</b></td><td align=center><b>部门</b></td><td align=center><b>职位</b></td><td align=center><b>可编辑本人档案</b></td><td align=center><b>可看所有员工档案</b></td><td align=center><b>可看本部门档案</b></td><td>&nbsp;</td></tr>
<%
'显示用户表
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where userdept=" & sqlstr(userdept)
rs.open sql,conn,1
while not rs.eof and not rs.bof
%>
<form method="post" action="personinfpopedom.asp">
<tr>
<td align=center><%=rs("name")%></td><td align=center><%=rs("userdept")%></td><td align=center><%=rs("userlevel")%></td>
<td align=center><input type="checkbox" name="allow_edit_person_personinf" value="yes"<%=checked(rs("allow_edit_person_personinf"),"yes")%>></td>
<td align=center><input type="checkbox" name="allow_see_all_personinf" value="yes"<%=checked(rs("allow_see_all_personinf"),"yes")%>></td>
<td align=center><input type="checkbox" name="allow_see_dept_personinf" value="yes"<%=checked(rs("allow_see_dept_personinf"),"yes")%>></td>
<td align=center><input type="submit" name="submit" value="应用"></td>
</tr>
<input type="hidden" name="id" value=<%=rs("id")%>>
<input type="hidden" name="userdept" value=<%=userdept%>>
</form>
<%
rs.movenext
wend
%>
</table>
</center>
<br>
<%
call bgback()
%>

</body>
</html>