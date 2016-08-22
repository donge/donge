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
<td><b>帮助信息分类</b></td>
</tr>
</table>
</center>
<%
call bgmid()
%>



<%
helpsort=request("helpsort")
id=request("id")
oldhelpsort=request("oldhelpsort")
'----------------------------
if request("submit")="增加" and helpsort<>"" then
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from helpsort where helpsort=" & sqlstr(helpsort)
rs.open sql,conn,1
if not rs.eof and not rs.bof then
%>
<center>
<br><font color=red>你增加的类别已经有了</font>
</center>
<%
else
set conn=opendb("oabusy","conn","accessdsn")
sql = "Insert Into helpsort (helpsort) Values( "
sql = sql & SqlStr(helpsort) & ")"
conn.Execute sql
end if
end if
'-------------------------------
if request("submit")="删除" then
set conn=opendb("oabusy","conn","accessdsn")
sql = "delete from helpsort where id=" & id
conn.Execute sql
sql = "delete from helpinf where helpsort=" & sqlstr(oldhelpsort)
conn.Execute sql
end if
'-------------------------------
if request("submit")="更改" then
set conn=opendb("oabusy","conn","accessdsn")
sql = "update helpsort set helpsort=" & sqlstr(helpsort) & " where id=" & id
conn.Execute sql
sql = "update helpinf set helpsort=" & sqlstr(helpsort) & " where helpsort=" & sqlstr(oldhelpsort)
conn.Execute sql
end if
'-------------------------------
%>

<br>
<center>
<table border="1"  cellspacing="0" cellpadding="0">
<tr>
<td align=center width=30><b>删除</b></td><td align=center width=100><b>帮助信息类别</b></td><td align=center width=30><b>更改</b></td>
</tr>
<%
'显示帮助类别
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from helpsort"
rs.open sql,conn,1
while not rs.eof and not rs.bof
%>
<tr>
<form method="post" action="edithelpsort.asp">
<td align=center width=30><input type="submit" name="submit" value="删除" onclick="return window.confirm('这样会删除这类别的所有帮助信息，你确定要删除吗？')"></td><td align=center width=100><input type="text" name="helpsort" size=20 value="<%=rs("helpsort")%>"></td><td align=center width=30><input type="submit" name="submit" value="更改"><input type="hidden" name="id" value=<%=rs("id")%>><input type="hidden" name="oldhelpsort" value="<%=rs("helpsort")%>"></td>
</form>
</tr>
<%
rs.movenext
wend
%>
</table>
<hr color=blue size=1 width=200>
<form method="post" action="edithelpsort.asp">
<input type="text" name="helpsort" size=20><input type="submit" name="submit" value="增加">
</form>
</center>
<%
call bgback()
%>
</body>
</html>










