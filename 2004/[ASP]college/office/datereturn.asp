<!--#include file="asp/keepformat.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/checked.asp"-->
<!--#include file="asp/bgsub.asp"-->
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then response.redirect "default.asp"
sendto=request("sendto")
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="css/css.css">
<title>����칫ϵͳ</title>
</head>
<body bgcolor="#eeeeee" topmargin="0" leftmargin="5">
<%
call bghead()
%>
<center>
<table>
<tr>
<td><b>���Ļظ���ת��</b>&nbsp;&nbsp;</td>
<form method="post" action="showdate.asp">
<td><input type="submit" value="����"><input type="hidden" name="id" value=<%=request("id")%>></td></form>
</tr>
</table>
</center>
<%
call bgmid()
%>
<%
if request("submit")="ת��" then
'��Ҫת���ļ�¼
set conn=opendb("oabusy","conn","accessdsn")
Set rs=Server.CreateObject("ADODB.recordset")
sql="select * from senddate where id=" & request("id")
rs.open sql,conn,1
titleold=rs("title")
contentold=rs("content")
senderold=rs("sender")
filenameold=rs("filename")
fileContentTypeold=rs("fileContentType")
filevalueold=rs("filevalue")
'����ת����
set conn=opendb("oabusy","conn","accessdsn")
Set rs=Server.CreateObject("ADODB.recordset")
sql="select name from userinf where username=" & sqlstr(oabusyusername)
rs.open sql,conn,1
changename=rs("name")

title=titleold
content=contentold & "<br>---------------------<br>[ת���ˣ�" & changename & "]&nbsp;[ת��ʱ�䣺" & now() & "]<br>" & request("content")
sendto=request("sendto")
dim mysendto
mysendto=split(sendto,"|",-1,1)
for each sendtoinf in mysendto
userdeptpoint=InStr(sendtoinf,":")
if userdeptpoint>0 then
sendtoinflen=len(sendtoinf)
recipientusername=right(sendtoinf,sendtoinflen-userdeptpoint)
if recipientusername="������" then
recipientusername="������"
else
usernamepoint=Instr(recipientusername,"(")
usernamelen=len(recipientusername)
recipientusername=left(recipientusername,usernamelen-1)
recipientusername=right(recipientusername,usernamelen-1-usernamepoint)
end if
recipientuserdept=left(sendtoinf,userdeptpoint-1)

set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("ADODB.recordset") 
sql = "select * from senddate"
rs.Open sql,conn,1,3
rs.addnew 
rs("title")=title
rs("content")=content
rs("sender")=senderold
rs("recipientusername")=recipientusername
rs("recipientuserdept")=recipientuserdept
if filenameold<>"" then
rs("filename")=filenameold
rs("fileContentType")=fileContentTypeold
rs("filevalue").appendchunk filevalueold
end if
rs.update 
rs.close 
set rs=nothing 
set conn=nothing 
end if
next
'��ת����Ϣ�ظ���ԭ������
sender=request("sender")
recipientusername=request("recipientusername")
reid=request("reid")
title=request("title")
content="�˹����Ѿ�ת������" & sendto & "<br>" & request("content")
set conn=opendb("oabusy","conn","accessdsn")
sql="Insert into senddate (title,content,sender,recipientusername,reid) values ("
sql=sql & sqlstr(title) & ","
sql=sql & sqlstr(content) & ","
sql=sql & sqlstr(sender) & ","
sql=sql & sqlstr(recipientusername) & ","
sql=sql & reid & ")"
conn.Execute sql
%>
<br><br><br>
<center><font color=red size=3>ת�����</font></center>
<%
end if
%>





<%
if request("submit")="�ظ�" then
sender=request("sender")
recipientusername=request("recipientusername")
reid=request("reid")
title=request("title")
content=request("content")
set conn=opendb("oabusy","conn","accessdsn")
sql="Insert into senddate (title,content,sender,recipientusername,reid) values ("
sql=sql & sqlstr(title) & ","
sql=sql & sqlstr(content) & ","
sql=sql & sqlstr(sender) & ","
sql=sql & sqlstr(recipientusername) & ","
sql=sql & reid & ")"
conn.Execute sql
%><br><br><br>
<center><font color=red size=3>�ظ����</font></center>
<%
end if
%>

<%
call bgback()
%>

</body>
</html>