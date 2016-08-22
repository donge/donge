<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/opendb.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="css/css.css">
<title>网络办公系统</title>
</head>
<base target="main">
<body bgcolor="#eeeeee" topmargin="0" leftmargin="5">
<table border="0" width="100%" cellspacing="0" cellpadding="0">
<tr>
<td height=5></td>
</tr>
</table>
<%
call bghead()
%>
<b>帮助</b>
<%
call bgmid()
%>
<%
'打开数据库显示帮助类别
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from helpsort"
rs.open sql,conn,1
while not rs.eof and not rs.bof
%>
<img src="images/bookhelp.gif" width=16 height=16 border=0><a href="helpinf.asp?helpsort=<%=rs("helpsort")%>"><%=rs("helpsort")%></a><br>
<%
rs.movenext
wend
%>
<center><hr color=red size=1 width="80%"></center>
<img src="images/plus.gif" width=30 height=15 border=0><a href="edithelpsort.asp">管理帮助类别</a><br>
<img src="images/plus.gif" width=30 height=15 border=0><a href="inputhelpinf.asp">输入帮助信息</a><br>

<%
call bgback()
%>
</body>
</html>