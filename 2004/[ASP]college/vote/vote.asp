<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><!-- #include file="conn.asp"-->
<%
set ti=server.createobject("adodb.recordset")
ti.open "select * from vset",conn,1,1
if not ti.eof then
%>
<HEAD>
<TITLE> <%=ti("sitename")%>---投票查看 </TITLE>
<meta http-equiv="content-type" content="text/html; charset=gb2312">
<link href="css.css" rel="stylesheet" type="text/css">
</HEAD>

<BODY>
<TABLE border="0" width="98%" cellpadding="2" cellspacing="0" bordercolordark="#ffffff" bordercolorlight="#cccccc">
<TR>
	<TD class="css" colspan="4" align="center" height="27"><b><font color="#cc0000"><%=ti("votename")%></font></b><br><FONT color="#666666">目前共有
	<font color="#cc0000"><%
	set co=server.createobject("adodb.recordset")
	co.open "select sum(vcount) as sm from vote",conn,1,1
	if not co.eof then
response.write co("sm")
%></font>

	人投票</font></TD>
</TR>
<%
set rs=server.createobject("adodb.recordset")
rs.open "select * from vote",conn,1,1
if not rs.eof then
do while not rs.eof
i=i+1
%>
<TR>
	<TD class="css"><%=i%>、<%=rs("vname")%>&nbsp;<FONT color="#666666">(</font><FONT color="#cc0000"><%=rs("vcount")%></font><FONT color="#666666">)</font></TD>
	<TD class="css" align="right"><img src="ba.gif" border="0" width="<%=left((rs("vcount")/co("sm"))*100,3)%>" height="10"></td><td class="css" align="center">&nbsp;<%=formatnumber((rs("vcount")/co("sm"))*100,1)%>%</TD>
	
</TR>
<%
rs.movenext
loop
end if
rs.close
set rs=nothing
%>
</TABLE>
<%
	end if
	co.close
	set co=nothing
	%>
<%end if%>
</BODY>
</HTML>
