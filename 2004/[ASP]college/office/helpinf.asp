<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/checked.asp"-->
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then response.redirect "default.asp"
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
<td><b><%=request("helpsort")%>帮助信息</b></td>
</tr>
</table>
</center>
<%
call bgmid()
%>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from helpinf where helpsort=" & sqlstr(request("helpsort"))
rs.open sql,conn,1
%>
<center>
<br>
<table border="1"  cellspacing="0" cellpadding="0" width="80%">
<tr>
<td align=center><b><%=request("helpsort")%>类帮助信息列表</b></td>
</tr>
<%
while not rs.eof and not rs.bof
%>
<tr>
<td><img src="images/menu_help.gif" width=16 height=16 border=0><a href="showhelpinf.asp?id=<%=rs("id")%>"><%=rs("helptitle")%></a></td></tr>
<%
rs.movenext
wend
%>
</table>
</center>
<%
call bgback()
%>
</body>
</html>










