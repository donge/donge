<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%
if session("admins")="" then
response.redirect "adminn.asp"
end if
%>
<HTML>
<HEAD>
<TITLE> main </TITLE>
<meta http-equiv="content-type" content="text/html; charset=gb2312">
<link href="css.css" rel="stylesheet" type="text/css">
</HEAD>
<!-- #include file="conn.asp"-->
<BODY>
<%
edit=request.querystring("edit")
select case edit
case "edit"
admins=htmlencode(killbad(trim(request.form("admins"))))
passs=htmlencode(killbad(trim(request.form("passs"))))
sitename=htmlencode(killbad(trim(request.form("sitename"))))
check=htmlencode(killbad(trim(request.form("check"))))
if admins<>"" then
set ed=server.createobject("adodb.recordset")
ed.open "select * from vset",conn,1,3
ed("admins")=admins
ed("passs")=passs
ed("sitename")=sitename
ed("check")=check
ed.update
ed.close
set ed=nothing
response.redirect "main.asp?action=vset"
end if
case "addvote"
addvote=htmlencode(killbad(trim(request.form("addvote"))))
if addvote<>"" then
set adv=server.createobject("adodb.recordset")
adv.open "select * from vote",conn,1,3
adv.addnew
adv("vname")=addvote
adv.update
adv.close
set adv=nothing
response.redirect "main.asp?action=viewvote"
end if
case "editxm"
votenames=htmlencode(killbad(trim(request.form("votenames"))))
if votenames<>"" then
set vot=server.createobject("adodb.recordset")
vot.open "select * from vset",conn,1,3
if not vot.eof then
vot("votename")=votenames
vot.update
vot.close
set vot=nothing
response.redirect "main.asp?action=addedit"
end if
end if

end select
%>
<%
action=request.querystring("action")
select case action
case "vset"
%>
<TABLE width="98%" border="1" cellpadding="2" cellspacing="0" bordercolordark="#ffffff" bordercolorlight="#cccccc">
<TR><form method="post" action="main.asp?edit=edit">
	<TD class="css" height="27" bgcolor="#f7f7f7"colspan="2" align="center"><b>ϵͳ����</b></TD>
</TR>
<TR>
<%
set rs=server.createobject("adodb.recordset")
rs.open "select * from vset",conn,1,1
if not rs.eof then
%>
	<TD class="css" align="center">����Ա���ƣ�</TD>
	<TD class="css"><input type="text" name="admins" class="inputt" value="<%=rs("admins")%>"></TD>
</TR>
<TR>
	<TD class="css" align="center">����Ա���룺</TD>
	<TD class="css"><input type="text" name="passs" class="inputt" value="<%=rs("passs")%>"></TD>
</TR>
<TR>
	<TD class="css" align="center">��վ���ƣ�</TD>
	<TD class="css"><input type="text" name="sitename" class="inputt" value="<%=rs("sitename")%>"></TD>
</TR>
<!--
<TR>
	<TD class="css" align="center">ͶƱ���ͣ�<br>&nbsp;&nbsp;<font color="#cc0000">"1"Ϊ��ѡͶƱ��"0"Ϊ��ѡͶƱ</font></TD>
	<TD class="css"><input type="text" name="check" class="inputt" value="<%=rs("check")%>"></TD>
</TR>-->
<TR>
	<TD class="css" align="center" colspan="2"><input type="submit" value="�޸�" class="buttonn">&nbsp;&nbsp;<input type="reset" value="ȡ���޸�" class="buttonn"></TD>
</TR>
<%end if%>
</form>
</TABLE>
<%
case "editxm"
%>
<TABLE border="1" cellpadding="2" cellspacing="0" bordercolordark="#ffffff" bordercolorlight="#cccccc">
<TR>
	<TD class="css" align="center" bgcolor="#f7f7f7" height="27"><b>�޸�ͶƱ����</b></TD>
</TR><%
set vname=server.createobject("adodb.recordset")
vname.open "select * from vset",conn,1,1
if not vname.eof then
%>

<TR><form method="post" action="main.asp?edit=editxm">
	<TD class="css"><input type="text" class="inputt" name="votenames" value="<%=vname("votename")%>" size="50">&nbsp;&nbsp;<input type="submit" value="�޸�" class="buttonn"></TD></form><%
	end if
	vname.close
	set vname=nothing
%>
</TR>
</TABLE>
<%
case "addedit"
%>
<TABLE width="98%" border="0" cellpadding="2" cellspacing="0" bordercolordark="#ffffff" bordercolorlight="#cccccc">
<TR>
	<TD class="css" align="center"><a href="main.asp?action=addedit">�鿴����ͶƱ</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="main.asp?action=">�����ͶƱ</a></TD>
	
</TR>
<%
set vv=server.createobject("adodb.recordset")
vv.open "select * from vset",conn,1,1
if not vv.eof then
%>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<TR>
	<TD class="css" align="center">����ͶƱ��Ŀ:<br><br>1��<a href="main.asp?action=viewvote"><font color="#cc0000"><%=vv("votename")%></font></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="main.asp?action=editxm">�� ��</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">ɾ ��</a></TD>
	
</TR>
<%
end if
%>
</TABLE>
<%
case "delxx"
idd=request.querystring("idd")
conn.execute("delete * from vote where id=cint('"&idd&"')")
response.redirect "main.asp?action=viewvote"
%>
<%
case "editxx"
%>
<TABLE width="98%" border="0" cellpadding="2" cellspacing="0" bordercolordark="#ffffff" bordercolorlight="#cccccc">
<TR>
	<TD class="css" align="center"><a href="main.asp?action=addedit">�鿴����ͶƱ</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="main.asp?action=">�����ͶƱ</a></TD>
	
</TR>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<%
idd=request.querystring("idd")
set vvv=server.createobject("adodb.recordset")
vvv.open "select * from vote where id=cint('"&idd&"')",conn,1,1
if not vvv.eof then
%>
<%
vname=htmlencode(killbad(trim(request.form("vname"))))
vcount=htmlencode(killbad(trim(request.form("vcount"))))
if vname<>"" then
set vvvs=server.createobject("adodb.recordset")
vvvs.open "select * from vote where id=cint('"&idd&"')",conn,1,3
if not vvvs.eof then
vvvs("vname")=vname
vvvs("vcount")=vcount
vvvs.update
vvvs.close
set vvvs=nothing
end if
end if
%>
<tr><td class="css" align="center"><a href="main.asp?action=viewvote"><font color="#cc0000">����ͶƱ��Ŀ</font></a></td></tr><form method="post" action="">
<tr><td class="css" align="center">��Ŀ���ƣ�<input type="text" name="vname" value="<%=vvv("vname")%>" class="inputt"></td></tr>
<tr><td class="css" align="center">ͶƱ����<input type="text" value="<%=vvv("vcount")%>" name="vcount" class="inputt" size="10">&nbsp;&nbsp;<input type="submit" value="�޸�" class="buttonn"></td></tr></form>
<%
end if
%></table>
<%
case "viewvote"
%>
<TABLE width="98%" border="0" cellpadding="2" cellspacing="0" bordercolordark="#ffffff" bordercolorlight="#cccccc">
<TR>
	<TD class="css" align="center"><a href="main.asp?action=addedit">�鿴����ͶƱ</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="main.asp?action=">�����ͶƱ</a></TD>
	
</TR>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<tr>
<td class="css" align="center">
<TABLE border="1" cellpadding="2" cellspacing="0" bordercolordark="#ffffff" bordercolorlight="#cccccc">
<TR>
	<TD class="css" align="center" bgcolor="#f7f7f7" height="27">���</TD>
	<TD class="css" align="center" bgcolor="#f7f7f7" height="27">��Ŀ����</TD>
	<TD class="css" align="center" bgcolor="#f7f7f7" height="27">ͶƱ��</TD>
	<TD class="css" align="center" bgcolor="#f7f7f7" height="27">�޸�</TD>
	<TD class="css" align="center" bgcolor="#f7f7f7" height="27">ɾ��</TD>
</TR>
<%
set vvo=server.createobject("adodb.recordset")
vvo.open "select * from vote",conn,1,1
if not vvo.eof then
do while not vvo.eof
i=i+1
%>
<tr>
	<td class="css" align="center"><%=i%>��</td>
	<td class="css"><%=vvo("vname")%></td>
	<td class="css" align="center"><%=vvo("vcount")%></td>
	<td class="css" align="center"><a href="main.asp?action=editxx&idd=<%=vvo("id")%>">�޸�</a></td>
	<td class="css" align="center"><a href="main.asp?action=delxx&idd=<%=vvo("id")%>">ɾ��</a></td>
</tr>
<%
vvo.movenext
loop
end if
%>
<tr><form method="post" action="main.asp?edit=addvote">
<td class="css" colspan="5">���ͶƱ��Ŀ��<input type="text" name="addvote" class="inputt">&nbsp;<input type="submit" value="���" class="buttonn"></td>
</form>
</tr>
</TABLE>


</td></tr>
</table>
<%
end select
%>

</BODY>
</HTML>
