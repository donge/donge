<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/keepformat.asp"-->
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
<title>����칫ϵͳ</title>
</head>
<body bgcolor="#eeeeee" topmargin="5" leftmargin="5">
<% call bghead() %>
<center>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from helpinf where id=" & request("id")
rs.open sql,conn,1
%>
<table>
<tr>
<td><b><%=rs("helptitle")%>������Ϣ</b>&nbsp;&nbsp;&nbsp;&nbsp;</td><form method="post" action="edithelpinf.asp"><td><input type="submit" value="�༭"><input type="hidden" name="id" value=<%=rs("id")%>></td></form><td><input type="button" value="����" onclick="history.go( -1 );return true;"></td>
</tr>
</table>
</center>
<%
call bgmid()
%>

<center>
<br>
<table border="0"  cellspacing="0" cellpadding="0" width="80%">
<tr>
<td><%=keepformat(rs("helpcontent"))%></td>
</tr>
</table>
</center>
<%
call bgback()
%>
</body>
</html>










