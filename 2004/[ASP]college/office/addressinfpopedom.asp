<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/checked.asp"-->
<%
'-----------------------------------------
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then response.redirect "default.asp"
'--------------------------------------
if request("submit")="Ӧ��" then
allow_edit_person_addressinf=request("allow_edit_person_addressinf")
if allow_edit_person_addressinf="" then allow_edit_person_addressinf="no"

allow_edit_dept_addressinf=request("allow_edit_dept_addressinf")
if allow_edit_dept_addressinf="" then allow_edit_dept_addressinf="no"

allow_edit_all_addressinf=request("allow_edit_all_addressinf")
if allow_edit_all_addressinf="" then allow_edit_all_addressinf="no"

allow_edit_client_addressinf=request("allow_edit_client_addressinf")
if allow_edit_client_addressinf="" then allow_edit_client_addressinf="no"

set conn=opendb("oabusy","conn","accessdsn")
sql="update userinf set "
sql=sql & "allow_edit_person_addressinf=" & sqlstr(allow_edit_person_addressinf) & ","
sql=sql & "allow_edit_all_addressinf=" & sqlstr(allow_edit_all_addressinf) & ","
sql=sql & "allow_edit_client_addressinf=" & sqlstr(allow_edit_client_addressinf) & ","
sql=sql & "allow_edit_dept_addressinf=" & sqlstr(allow_edit_dept_addressinf) & " where id=" & request("id")
conn.Execute sql

end if
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
<td><b>�༭ͨѶ¼Ȩ������</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<%
'�����ݿ⣬��������
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select DISTINCT userdept from userinf"
rs.open sql,conn,1
%>
<form method="post" action="addressinfpopedom.asp">
<td>
<select size=1 name="userdept">
<%
if not rs.eof and not rs.bof then userdept=rs("userdept")
if request("userdept")<>"" then userdept=request("userdept")
while not rs.eof and not rs.bof
%>
<option value="<%=rs("userdept")%>"<%=selected(userdept,rs("userdept"))%>><%=rs("userdept")%></option>
<%
rs.movenext
wend
%>
</select><input type="submit" value="�鿴">
</td>
</form>
</tr>
</table>
</center>
<%
call bgmid()
%>
<br>
<center>
<table border="1"  cellspacing="0" cellpadding="0" width="95%">
<tr bgcolor="#aaaaaa"><td align=center height=25><b>����</b></td><td align=center><b>����</b></td><td align=center><b>ְλ</b></td><td align=center><b>�ɱ༭����</b></td><td align=center><b>�ɱ༭������</b></td><td align=center><b>�ɱ༭ȫԱ</b></td><td align=center><b>�ɱ༭�ͻ�</b></td><td>&nbsp;</td></tr>
<%
'��ʾ�û���
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where userdept=" & sqlstr(userdept)
rs.open sql,conn,1
while not rs.eof and not rs.bof
%>
<form method="post" action="addressinfpopedom.asp">
<tr>
<td align=center><%=rs("name")%></td><td align=center><%=rs("userdept")%></td><td align=center><%=rs("userlevel")%></td>
<td align=center><input type="checkbox" name="allow_edit_person_addressinf" value="yes"<%=checked(rs("allow_edit_person_addressinf"),"yes")%>></td>
<td align=center><input type="checkbox" name="allow_edit_dept_addressinf" value="yes"<%=checked(rs("allow_edit_dept_addressinf"),"yes")%>></td>
<td align=center><input type="checkbox" name="allow_edit_all_addressinf" value="yes"<%=checked(rs("allow_edit_all_addressinf"),"yes")%>></td>
<td align=center><input type="checkbox" name="allow_edit_client_addressinf" value="yes"<%=checked(rs("allow_edit_client_addressinf"),"yes")%>></td>
<td align=center><input type="submit" name="submit" value="Ӧ��"></td>
</tr>
<input type="hidden" name="id" value=<%=rs("id")%>>
<input type="hidden" name="userdept" value=<%=userdept%>>
</form>
<%
rs.movenext
wend
%>
</table>
</center>
<br>
<%
call bgback()
%>

</body>
</html>