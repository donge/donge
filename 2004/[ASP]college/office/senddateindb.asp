<!--#INCLUDE FILE="asp/fupload.inc"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/checked.asp"-->
<!--#include file="asp/bgsub.asp"-->
<%
'On Error Resume Next
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then response.redirect "default.asp"
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="css/css.css">
<title>企业管理系统</title>
</head>
<body bgcolor="#eeeeee" topmargin="5" leftmargin="5">
<%
call bghead()
%>
<center>
<table>
<tr>
<td>
<b>公文发送</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</td>
<form action="senddate.asp" method="post" name="form1">
<td>
<input type="submit" value="返回">
</td>
</form>
</tr>
</table>
</center>
<%
call bgmid()
%>

<%
if Request.ServerVariables("REQUEST_METHOD") = "POST" Then
'---------------------------
'response.write "开始发送<br>"
'---------------------------
Dim Fields
UploadSizeLimit=100000
Set Fields = GetUpload()
dim Field
For Each Field In Fields.Items
if Field.name="title" then title=BinaryToString(Field.value)
if Field.name="content" then content=BinaryToString(Field.value)
if Field.name="sendto" then sendto=BinaryToString(Field.value)
if Field.name="file1" then
filename=field.FileName
fileContentType=field.ContentType
filevalue=field.value
end if
next
'--------------------------------------
'response.write "title=" & title & "<br>"
'response.write "content=" & content & "<br>"
'response.write "sendto=" & sendto & "<br>"
'response.write "filedname=" & filename & "<br>"
'response.write "fileContentType=" & fileContentType & "<br>"
'----------------------------------------
dim mysendto
mysendto=split(sendto,"|",-1,1)
for each sendtoinf in mysendto
userdeptpoint=InStr(sendtoinf,":")
if userdeptpoint>0 then
sendtoinflen=len(sendtoinf)
recipientusername=right(sendtoinf,sendtoinflen-userdeptpoint)
if recipientusername="所有人" then
recipientusername="所有人"
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
rs("sender")=oabusyusername
rs("recipientusername")=recipientusername
rs("recipientuserdept")=recipientuserdept
if filename<>"" then
rs("filename")=filename
rs("fileContentType")=fileContentType
rs("filevalue").appendchunk filevalue
end if
rs.update 
rs.close 
set rs=nothing 
set conn=nothing 

end if

next

%>
<br><br>
<center>发送完成</center>
<%
end if
%>
<%
call bgback()
%>

</body>  
  
</html>  


