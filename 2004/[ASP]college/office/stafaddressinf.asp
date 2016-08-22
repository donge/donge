<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/checked.asp"-->
<!--#include file="asp/maillink.asp"-->
<%
'-----------------------------------------
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then response.redirect "default.asp"
'--------------------------------------
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
<td><b>本公司员工通讯录</b></td>
<%
'打开数据库，读出部门
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select DISTINCT userdept from userinf"
rs.open sql,conn,1
%>
<form method="post" action="stafaddressinf.asp">
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
<table border="0"  cellspacing="0" cellpadding="0" width="95%" height=10>
<tr><td></td></td></tr></table>
<b><%=userdept%>通讯录</b>
<table border="0"  cellspacing="0" cellpadding="0" width="95%" height=10>
<tr><td></td></td></tr></table>
<table border="1"  cellspacing="0" cellpadding="0" width="95%">
<tr bgcolor="#aaaaaa"><td align=center height=25><b>姓名</b></td><td align=center><b>部门</b></td><td align=center><b>职位</b></td><td align=center><b>公司电话或分机</b></td><td align=center><b>Email</b></td></tr>
<%
'显示职员表
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where userdept=" & sqlstr(userdept)
rs.open sql,conn,1
while not rs.eof and not rs.bof
%>
<tr>
<td align=center><a href="showstafaddressinf.asp?userdept=<%=userdept%>&username=<%=rs("username")%>&name=<%=rs("name")%>&userlevel=<%=rs("userlevel")%>"><%=rs("name")%></a></td><td align=center><%=rs("userdept")%></td><td align=center><%=rs("userlevel")%></td>
<%
'打开数据库显示通讯信息
set conn=opendb("oabusy","conn","accessdsn")
set rs1=server.createobject("adodb.recordset")
sql="select * from stafaddressinf where username=" & sqlstr(rs("username"))
rs1.open sql,conn,1
if not rs1.eof and not rs1.bof then
companytel=rs1("companytel")
email=rs1("email")
else
companytel=""
email=""
end if
%>
<td align=center><%=checked3(companytel)%></td>
<td align=center><%=maillink(email)%></td>
</tr>
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