<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%
if session("admins")="" then
response.redirect "adminn.asp"
end if
%>
<HTML>
<HEAD>
<TITLE> left </TITLE>
<meta http-equiv="content-type" content="text/html; charset=gb2312">
<link href="css.css" rel="stylesheet" type="text/css">
</HEAD>
<!-- #include file="conn.asp"-->
<BODY>
<center>
<TABLE width="98%" border="1" cellpadding="2" cellspacing="0" bordercolordark="#ffffff" bordercolorlight="#cccccc">
<TR>
	<TD class="css" bgcolor="#f7f7f7" height="27" align="center"><b>��̨����</b></TD>
</TR>
<TR>
	<TD class="css" align="center"><a href="main.asp?action=vset" target="main">ϵͳ����</a></TD>
</TR>
<TR>
	<TD class="css" align="center"><a href="main.asp?action=addedit" target="main">��ӡ��޸�Ͷ����Ŀ</a></TD>
</TR>

<TR>
	<TD class="css" align="center"><a href="adminn.asp?action=logout" target="_parent">�˳�����</a></TD>
</TR>
</TABLE></center>
</BODY>
</HTML>
