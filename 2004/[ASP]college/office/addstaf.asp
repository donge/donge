<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/addstaf.asp"-->
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
<script language="javascript1.2" src="js/openwin.js"></script>
<title>网络办公系统</title>
</head>
<body bgcolor="#eeeeee" topmargin="5" leftmargin="5">
<% call bghead() %>
<center>
<b>增加<%=oabusyuserdept%>员工用户</b><br><font color=red>*</font>项必须填写
</center>
<%
call bgmid()
%>
&nbsp;<br>
<center>
<% call addstaf("addstaf.asp") %>
</center>


<%
call bgback()
%>

</body>
</html>