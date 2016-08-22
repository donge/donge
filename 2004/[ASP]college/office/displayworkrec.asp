<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/keepformat.asp"-->
<!--#include file="asp/checked.asp"-->
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then response.redirect "default.asp"
'--------------------------
function havefinished(value)
if value="yes" then
havefinished="已完成"
else
havefinished="<font color=red>未完成</font>"
end if
end function
'---------------------------
function impdegree(value)
if value="yes" then
impdegree="<font color=red>重要</font>"
else
impdegree="一般"
end if
end function
'---------------------------
%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="css/css.css">
<title>网络办公系统</title>
</head>
<body bgcolor="#eeeeee" topmargin="5" leftmargin="5">
<%
call bghead()
%>
<%
username=request("username")
superior=request("superior")
recdate=request("recdate")
'打开数据库读出用户姓名
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select name from userinf where username=" & sqlstr(username)
rs.open sql,conn,1
if not rs.eof and not rs.bof then stafname=rs("name")
%>
<center>
<table border="0"  cellspacing="0" cellpadding="0">
<tr>
<td><b><%=stafname%>的工作计划（<%=recdate%>）</b></td>
<form action="addworkrep.asp" method=post name="form1">
<td><input type="submit" name="addworkrep" value="增加"></td>
<input type="hidden" name="username" value="<%=username%>">
<input type="hidden" name="superior" value="<%=superior%>">
<input type="hidden" name="recdate" value="<%=recdate%>">
</form>
</tr>
</table>
</center>
<%
call bgmid()
%>
&nbsp;<br>
<center>
<%
'打开数据库，读出日期为recdate，用户名为username的记录
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from workrep where username=" & sqlstr(username) & " and recdate=" & "#" & recdate & "#"
rs.open sql,conn,1
while not rs.eof and not rs.bof
'读出任务委派者姓名
if rs("superior")<>"" then
set conn=opendb("oabusy","conn","accessdsn")
set rs1=server.createobject("adodb.recordset")
sql="select name from userinf where username=" & sqlstr(rs("superior"))
rs1.open sql,conn,1
superiorname=rs1("name")
end if
%>
<table border="1"  cellspacing="0" cellpadding="0" width="90%">
<tr>
<form method="post" name="a1" action="editworkrep.asp">
<td width=60 align=center>
<%
if (username=oabusyusername) or (superior=oabusyusername) then
%>
<input type="submit" value="编辑" name="submit">
<input type="hidden" name="username" value="<%=username%>">
<input type="hidden" name="superior" value="<%=superior%>">
<input type="hidden" name="recdate" value="<%=recdate%>">
<input type="hidden" name="id" value=<%=rs("id")%>>
<%
else
%>
不可编辑
<%
end if
%>
</td>
</form>
<td width=50>完成情况</td><td><%=havefinished(rs("finished"))%></td>
<td width=50>重要程度</td><td><%=impdegree(rs("imp"))%></td>
<td width=60>委派任务者</td><td width=60><%=checked3(superiorname)%></td>
</tr>
<tr>
<td align=center>简要标题</td><td colspan="6"><%=rs("title")%></td>
</tr>
<tr>
<td align=center>详细说明</td><td colspan="6"><%=checked3(keepformat(rs("remark")))%></td>
</tr>
</table>
<hr color=red size=1 width=90%>
<%


rs.movenext
wend
%>
</center>

<%
call bgback()
%>
</body>
</html>