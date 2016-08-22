<!--#include file="asp/keepformat.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/bgsub.asp"-->
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
<title>网络办公系统</title>
</head>
<body bgcolor="#eeeeee" topmargin="0" leftmargin="5">
<%
call bghead()
%>
<%
set conn=opendb("oabusy","conn","accessdsn")
Set rs=Server.CreateObject("ADODB.recordset")
sql="select * from newnotice where id=" & request("id")
rs.open sql,conn,1
%>
<center>
<b>通告标题：<%=rs("title")%></b><br>[发布日期：<%=rs("noticedate")%>]
</center>
<%
call bgmid()
%>
&nbsp;<br>
<%=keepformat(rs("content"))%>
<%
call bgback()
%>
</body>
</html>