<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- #include file="conn.asp"-->

<%
set ti=server.createobject("adodb.recordset")
ti.open "select * from vset",conn,1,1
if not ti.eof then
%>
<HTML>
<HEAD>
<TITLE><%=ti("sitename")%>--- 投票首页 </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	background-color: #EEEEEE;
}
.style3 {color: #006600}
-->
</style></HEAD>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
<BODY>
<TABLE width="100%" border="1" cellpadding="2" cellspacing="0" bordercolorlight="#cccccc" bordercolordark="#ffffff">
<TR>
	<TD class="css" height="27"><div align="center" class="style3"><%=ti("votename")%></div></TD>
</TR>
<%
if ti("check")="0" then
action=request.querystring("action")
select case action
case "tou"
if session("times")="" then
vv=request.form("vv")
response.write vv
if vv<>"" then
conn.execute("update vote set vcount=vcount+1 where id=cint('"&vv&"')")
session("times")=now()
response.write "<script>alert('投票成功,谢谢支持!!');history.back();</script>"
else
response.write "<script>alert('您没有选择任何投票项目，请返回后重新输入!');history.back();</script>"
end if
else
response.write "<script>alert('您已经投过票,请不要重复投票!');history.back();</script>"
end if
end select
%>
<form method="post" action="index.asp?action=tou">
<TR>	<TD class="css">
<%
set rs=server.createobject("adodb.recordset")
rs.open "select * from vote",conn,1,1
if not rs.eof then
do while not rs.eof

%>

<input type="radio" name="vv" value="<%=rs("id")%>"><%=rs("vname")%><br>

<%
rs.movenext
loop
end if
rs.close
set rs=nothing
%>
<%
else
%>
<%
action=request.querystring("action")
select case action
case "tou"
if session("times")="" then
vv=request.form("vv")
response.write vv
if vv<>"" then
conn.execute("update vote set vcount=vcount+1 where id=cint('"&vv&"')")
session("times")=now()
response.write "<script>alert('投票成功,谢谢支持!!');history.back();</script>"
else
response.write "<script>alert('您没有选择任何投票项目，请返回后重新输入!');history.back();</script>"
end if
else
response.write "<script>alert('您已经投过票,请不要重复投票!');history.back();</script>"
end if
end select
%>
<form method="post" action="index.asp?action=tou">
<TR>	<TD class="css">
<%
set rs=server.createobject("adodb.recordset")
rs.open "select * from vote",conn,1,1
if not rs.eof then
do while not rs.eof

%>

<input type="checkbox" name="vv" value="<%=rs("id")%>"><%=rs("vname")%><br>

<%
rs.movenext
loop
end if
rs.close
set rs=nothing
end if
%>
</TD>

</TR>
<TR>

	<TD align="center"><input type="submit" value="投票" class="buttonn">
	
	  <input type="button" value="查看" onclick="MM_openBrWindow('vote.asp','dd','scrollbars=yes,width=500,height=300')" class="buttonn"></TD></form>
</TR>
</TABLE>
<%end if
ti.close
set ti=nothing%>
</BODY>
</HTML>
