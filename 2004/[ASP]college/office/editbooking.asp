<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/checked.asp"-->
<!--#include file="asp/keepformat.asp"-->
<%
'-----------------------------------------
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
<center><b>��ԴԤԼ��ϸ��Ϣ</b></center>
<%
call bgmid()
%>
<center>
<br><br>

<%
id=request("id")
if request("submit")="ɾ��" then
set conn=opendb("oabusy","conn","accessdsn")
sql="delete * from booking where id=" & id
conn.Execute sql
%>
<br>�ɹ�ɾ��ԤԼ��<br><br>
<form method="post" action="booking.asp">
<input type="submit" value="����">
</form>
<%
else
set conn=opendb("oabusy","conn","accessdsn")
set rs1=server.createobject("adodb.recordset")
sql="select * from booking where id=" & id
rs1.open sql,conn,1
if not rs1.bof and not rs1.eof then
%>
<table border="1"  cellspacing="0" cellpadding="0" width=80%>
<tr>
<td width=120><b>ԤԼʹ����Դ���ƣ�</b></td><td><%=rs1("equipment")%></td>
</tr>
<tr>
<td><b>Ԥ�ƿ�ʼʹ��ʱ�䣺</b></td><td><%=rs1("starttime")%></td>
</tr>
<tr>
<td><b>Ԥ�ƽ���ʹ��ʱ�䣺</b></td><td><%=rs1("endtime")%></td>
</tr>
<tr>
<td colspan="2">
<%
'������Ա����
set conn=opendb("oabusy","conn","accessdsn")
set rs3=server.createobject("adodb.recordset")
sql="select * from userinf where username=" & sqlstr(rs1("username"))
rs3.open sql,conn,1
if not rs3.eof and not rs3.bof then
if oabusyusername=rs1("username") then response.write "<font color=red>"
%>
ԤԼ�ˣ�<%=rs3("name")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ڲ��ţ�<%=rs3("userdept")%>
<%
if oabusyusername=rs1("username") then response.write "</font>"
end if
%>
</td>
</tr>
<tr>
<td colspan="2" height=100 valign=top>
<b>ʹ��˵����</b><br>
<%=keepformat(rs1("purpose"))%>
</td>
</tr>
</table>
<form method="post" action="editbooking.asp">
<input type="button" value="����" onclick="window.location.href='booking.asp'">
<%
if oabusyusername=rs1("username") then
%>
<input type="submit" name="submit" value="ɾ��" onclick="return window.confirm('�����Ҫɾ������ԤԼ��')">
<input type="hidden" name="id" value=<%=id%>>

<%
end if
%>
</form>
<%
end if
end if
%>



</center>
<%
bgback()
%>
</body>
</html>










