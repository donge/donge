<!--#include file="asp/keepformat.asp"-->
<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/bgsub.asp"-->
<%
oabusyusername=request.cookies("oabusyusername")
if request("submit")="���Ѿ����˴�ͨ��" then
'�����ݿ��б�Ϊ����
set conn=opendb("oabusy","conn","accessdsn")
sql = "update userinf set seenotice='yes' where username=" & sqlstr(oabusyusername)
conn.Execute sql
%>
<SCRIPT language=JavaScript>                   
window.close();
opener.location.reload();
</script> 
<%
end if
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="css/css.css">
<title>����칫ϵͳ</title>
</head>
<bgsound src="progctor.wav" loop="1">
<body bgcolor="#eeeeee" topmargin="5" leftmargin="5" onunload="opener.location.reload();">
<%
call bghead()
%>
<%
set conn=opendb("oabusy","conn","accessdsn")
Set rs=Server.CreateObject("ADODB.recordset")
sql="select * from newnotice order by id desc"
rs.open sql,conn,1
%>
<center>
<b>ͨ����⣺<%=rs("title")%></b>
<br>
[�������ڣ�<%=rs("noticedate")%>]
</center>
<%
call bgmid()
%>
&nbsp;<br>
<%=keepformat(rs("content"))%>
<center>
<form method=post action="popnotice.asp">
<input type="submit" name="submit" value="���Ѿ����˴�ͨ��">
</form>
</center>
<%
call bgback()
%> 
</body>
</html>