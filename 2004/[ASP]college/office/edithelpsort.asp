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
<title>����칫ϵͳ</title>
</head>
<body bgcolor="#eeeeee" topmargin="5" leftmargin="5">
<% call bghead() %>
<center>
<table>
<tr>
<td><b>������Ϣ����</b></td>
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
if request("submit")="����" and helpsort<>"" then
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from helpsort where helpsort=" & sqlstr(helpsort)
rs.open sql,conn,1
if not rs.eof and not rs.bof then
%>
<center>
<br><font color=red>�����ӵ�����Ѿ�����</font>
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
if request("submit")="ɾ��" then
set conn=opendb("oabusy","conn","accessdsn")
sql = "delete from helpsort where id=" & id
conn.Execute sql
sql = "delete from helpinf where helpsort=" & sqlstr(oldhelpsort)
conn.Execute sql
end if
'-------------------------------
if request("submit")="����" then
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
<td align=center width=30><b>ɾ��</b></td><td align=center width=100><b>������Ϣ���</b></td><td align=center width=30><b>����</b></td>
</tr>
<%
'��ʾ�������
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from helpsort"
rs.open sql,conn,1
while not rs.eof and not rs.bof
%>
<tr>
<form method="post" action="edithelpsort.asp">
<td align=center width=30><input type="submit" name="submit" value="ɾ��" onclick="return window.confirm('������ɾ�����������а�����Ϣ����ȷ��Ҫɾ����')"></td><td align=center width=100><input type="text" name="helpsort" size=20 value="<%=rs("helpsort")%>"></td><td align=center width=30><input type="submit" name="submit" value="����"><input type="hidden" name="id" value=<%=rs("id")%>><input type="hidden" name="oldhelpsort" value="<%=rs("helpsort")%>"></td>
</form>
</tr>
<%
rs.movenext
wend
%>
</table>
<hr color=blue size=1 width=200>
<form method="post" action="edithelpsort.asp">
<input type="text" name="helpsort" size=20><input type="submit" name="submit" value="����">
</form>
</center>
<%
call bgback()
%>
</body>
</html>










