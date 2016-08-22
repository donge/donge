<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<meta http-equiv="content-type" content="text/html; charset=gb2312">
<link href="css.css" rel="stylesheet" type="text/css">
</HEAD>
<!-- #include file="conn.asp"-->
<BODY>
<%
action=request.querystring("action")
select case action
case "login"
admins=htmlencode(killbad(trim(request.form("admins"))))
passs=htmlencode(killbad(trim(request.form("passs"))))
if admins<>"" then
set rs=server.createobject("adodb.recordset")
rs.open "select * from vset where admins='"&admins&"'",conn,1,1
if not rs.eof then
	if rs("passs")=passs then
	session("admins")=admins
	response.redirect "admin_index.asp"
	else
    response.write "<script>alert('您输入的用户名或密码不正确，请重新输入!');history.back();</script>"
	end if
else
response.write "<script>alert('您输入的用户名或密码不正确，请重新输入!');history.back();</script>"
end if
end if
case "logout"
session("admins")=""
response.redirect "index.asp"
end select
%>

<center>
<TABLE border="1" width="90%" cellpadding="2" cellspacing="0" bordercolordark="#ffffff" bordercolorlight="#cccccc">
<TR>
	<TD class="css" colspan="2" align="center" bgcolor="#f7f7f7"><b>后台管理</b></TD>
	
</TR>
<TR><form method="post" action="adminn.asp?action=login">
	<TD class="css" align="center">管理员用户名:</TD>
	<TD class="css"><input type="text" name="admins" class="inputt"></TD>
</TR>
<TR>
	<TD class="css" align="center">管理员密 码:</TD>
	<TD class="css"><input type="password" name="passs" class="inputt"></TD>
</TR>
<TR>
	<TD colspan="2" class="css" align="center"><input type="submit" value="登陆" class="buttonn">&nbsp;&nbsp;<input type="reset" value="重填" class="buttonn"></TD>
</TR></form>
</TABLE>
</center>
</BODY>
</HTML>
