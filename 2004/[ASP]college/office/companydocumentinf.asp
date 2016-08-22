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
<td><b>本公司文挡</b></td>
<form method="post" action="creatcompamyfolder.asp">
<td>
<input type="submit" value="建立文件夹">
</td>
</form>
</tr>
</table>
</center>
<%
call bgmid()
%>
<center>
<%
'打开数据库，读出文件夹
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from companydocument"
rs.open sql,conn,1
if rs.eof or rs.bof then
%>
<br><br><br>
<font color=red size=3>
还没建立文件夹!
</font>
<%
else
%>
文件夹

<%
end if
%>
</center>
<%
call bgback()
%>

</body>
</html>