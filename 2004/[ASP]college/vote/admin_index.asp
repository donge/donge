<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%
if session("admins")="" then
response.redirect "adminn.asp"
end if
%>
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<meta http-equiv="content-type" content="text/html; charset=gb2312">
</HEAD>

<FRAMESET ROWS="289" COLS="156,622">
	<FRAME SRC="left.asp" NAME="">
	<FRAME SRC="main.asp" NAME="main">
</FRAMESET>
<noframes></noframes>

</HTML>
