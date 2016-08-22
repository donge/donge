<!--#include file="asp/keepformat.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/sqlstr.asp"-->
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
sql="select * from senddate where id=" & request("id")
rs.open sql,conn,1
%>
<center>
<table>
<tr>
<td align=center>
<b><%=rs("title")%></b></td><td rowspan="2">
<%
if rs("filename")<>"" then
%>
<a href="listsendfile.asp?id=<%=rs("id")%>" target="_blank"><img src="images/attach.gif" width=30 height=30 border=0></a>
<%
end if
%>
</td>
<tr>
<td>
[发送日期：<%=rs("inputdate")%>][接收人所在部门：<%=rs("recipientuserdept")%>]

<%
if rs("recipientusername")="所有人" then
%>
[接收者：<%=rs("recipientusername")%>]
<%
else
set conn=opendb("oabusy","conn","accessdsn")
Set rs1=Server.CreateObject("ADODB.recordset")
sql="select name from userinf where username=" & sqlstr(rs("recipientusername"))
rs1.open sql,conn,1
if not rs1.eof and not rs1.bof then
%>
[接收者：<%=rs1("name")%>]
<%
end if
end if
%>
</td>
</tr>
</table>
</center>
<%
call bgmid()
%>
&nbsp;<br>
<%=keepformat(rs("content"))%>


<%
'打开数据库读出回复
set conn=opendb("oabusy","conn","accessdsn")
Set rs2=Server.CreateObject("ADODB.recordset")
sql="select * from senddate where reid=" & request("id") & " order by id desc"
rs2.open sql,conn,1
while not rs2.bof and not rs2.eof
%>
<br><br>
-----------------------------------<br>
<%=rs2("title")%><br>
[回复时间：<%=rs2("inputdate")%>]
<%
set conn=opendb("oabusy","conn","accessdsn")
Set rs3=Server.CreateObject("ADODB.recordset")
sql="select userdept,name from userinf where username=" & sqlstr(rs2("sender"))
rs3.open sql,conn,1
if not rs3.eof and not rs3.bof then
%>
[回复部门：<%=rs3("userdept")%>][回复者：<%=rs3("name")%>]<br><br>
<%=keepformat(rs2("content"))%>
<%
end if
rs2.movenext
wend
%>

<%
call bgback()
%>
</body>
</html>