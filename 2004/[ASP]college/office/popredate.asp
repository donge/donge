<!--#include file="asp/keepformat.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/bgsub.asp"-->
<%
oabusyusername=request.cookies("oabusyusername")
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
if request("submit")="���Ѿ�����" then
id=request("id")
set conn=opendb("oabusy","conn","accessdsn")
sql="Insert into seesenddate (senddateid,username,havesee) values ("
sql=sql & id & ","
sql=sql & sqlstr(oabusyusername) & ","
sql=sql & sqlstr("yes") & ")"
conn.Execute sql
%>
<SCRIPT language=JavaScript>                   
window.close();
opener.location.reload();
</script> 
</body>
</html>
<%
response.end
end if

%>
<%
call bghead()
%>
<%
set conn=opendb("oabusy","conn","accessdsn")
Set rs=Server.CreateObject("ADODB.recordset")
sql="select * from senddate where id=" & request("id")
rs.open sql,conn,1
%>
<center>
<b><%=rs("title")%></b>
<br>[�ظ�ʱ�䣺<%=rs("inputdate")%>]
[�ظ������ڲ��ţ�
<%
set conn=opendb("oabusy","conn","accessdsn")
Set rs1=Server.CreateObject("ADODB.recordset")
sql="select userdept,name from userinf where username=" & sqlstr(rs("sender"))
rs1.open sql,conn,1
%>
<%=rs1("userdept")%>
][�ظ��ߣ�<%=rs1("name")%>]
</center>
<%
call bgmid()
%>
&nbsp;<br>
<%=keepformat(rs("content"))%>
<hr color=blue size=1>
<center>
<form method="post" name="form1" action="popredate.asp">
<input type="hidden" name="id" value="<%=rs("id")%>">
<input type="submit" name="submit" value="���Ѿ�����">
</form>
</center>
<hr color=blue size=1>
<%
'�����ݿ⣬��ʾid=rs("reid")�ļ�¼
set conn=opendb("oabusy","conn","accessdsn")
Set rs2=Server.CreateObject("ADODB.recordset")
sql="select * from senddate where id=" & rs("reid")
rs2.open sql,conn,1
if not rs2.eof and not rs2.bof then
%>
<%=rs2("title")%>
<%
if rs2("filename")<>"" then
%>
--------������<a href="listsendfile.asp?id=<%=rs2("id")%>" target="_blank"><img src="images/attach.gif" width=30 height=30 border=0></a>
<%
end if
%>
<br>
<%=keepformat(rs2("content"))%>
<%
end if
call bgback()
%>
</body>
</html>










