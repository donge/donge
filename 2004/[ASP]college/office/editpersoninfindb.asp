<!--#INCLUDE FILE="asp/fupload.inc"-->
<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/opendb.asp"-->
<%
'-----------------------------------------
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then response.redirect "default.asp"
'--------------------------------------
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="css/css.css">
<script language="javascript1.2" src="js/openwin.js"></script>
<title>����칫ϵͳ</title>
</head>
<body bgcolor="#eeeeee" topmargin="5" leftmargin="5">
<% call bghead() %>
<center>
<table>
<tr>
<td>
<b>�༭<%=oabusyname%>�ĸ��˻�������</b>&nbsp;&nbsp;
</td><form method="post" action="personinf.asp"><td>
<input type="submit" value="����">
</td>
</tr>
</table>
</center>
<%
call bgmid()
%>
<%
dim a(33)
if Request.ServerVariables("REQUEST_METHOD") = "POST" Then
'---------------------------
'ȡ�÷��͵�����
'---------------------------
Dim Fields
UploadSizeLimit=100000
Set Fields = GetUpload()
dim Field
For Each Field In Fields.Items
select case Field.name
case "a1" a(1)=BinaryToString(Field.value)
case "a2" a(2)=BinaryToString(Field.value)
case "a3" a(3)=BinaryToString(Field.value)
case "a4" a(4)=BinaryToString(Field.value)
case "a5" a(5)=BinaryToString(Field.value)
case "a6" a(6)=BinaryToString(Field.value)
case "a7" a(7)=BinaryToString(Field.value)
case "a8" a(8)=BinaryToString(Field.value)
case "a9" a(9)=BinaryToString(Field.value)
case "a10" a(10)=BinaryToString(Field.value)
case "a11" a(11)=BinaryToString(Field.value)
case "a12" a(12)=BinaryToString(Field.value)
case "a13" a(13)=BinaryToString(Field.value)
case "a14" a(14)=BinaryToString(Field.value)
case "a15" a(15)=BinaryToString(Field.value)
case "a16" a(16)=BinaryToString(Field.value)
case "a17" a(17)=BinaryToString(Field.value)
case "a18" a(18)=BinaryToString(Field.value)
case "a19" a(19)=BinaryToString(Field.value)
case "a20" a(20)=BinaryToString(Field.value)
case "a21" a(21)=BinaryToString(Field.value)
case "a22" a(22)=BinaryToString(Field.value)
case "a23" a(23)=BinaryToString(Field.value)
case "a24" a(24)=BinaryToString(Field.value)
case "a25" a(25)=BinaryToString(Field.value)
case "a26" a(26)=BinaryToString(Field.value)
case "a27" a(27)=BinaryToString(Field.value)
case "a28" a(28)=BinaryToString(Field.value)
case "a29" a(29)=BinaryToString(Field.value)
case "a30" a(30)=BinaryToString(Field.value)
case "a31" a(31)=BinaryToString(Field.value)
case "a32" a(32)=BinaryToString(Field.value)
case "a33" a(33)=BinaryToString(Field.value)
case "submit" submit=BinaryToString(Field.value)
case "file1"
filename=field.FileName
fileContentType=field.ContentType
filevalue=field.value
end select
next
'-------------------
'�ж������뻹���޸�
'------------------
if submit="����" then
'---------------
'�ж��Ƿ�����Ƭ
'---------------
if filename<>"" and fileContentType<>"image/gif" and fileContentType<>"image/pjpeg" then
%>
<center>
<br><br>
<font color=red size=3>�ϴ�����ƬӦ��ΪGIF��JPG�ļ���</font><br><br>
<input type="button" value="����" onclick="history.go( -1 );return true;">
</center>
<%
else
'------------
'��ʼ����
'-----------
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("ADODB.recordset") 
sql = "select * from personinf"
rs.Open sql,conn,1,3
rs.addnew
rs("username")=oabusyusername
for i=1 to 33
rs("a" & i)=a(i)
next
if filename<>"" then
rs("havephoto")="yes"
rs("photo").appendchunk filevalue
end if
rs.update 
rs.close 
set rs=nothing 
set conn=nothing 
%>
<br><br>
<center><font color=red size=3>�ɹ�������˻���������</font><br><br><form method="post" action="personinf.asp"><input type="submit" value="����"></form>
</center>
<%
end if
else
'---------------
'�ж��Ƿ�����Ƭ
'---------------
if filename<>"" and fileContentType<>"image/gif" and fileContentType<>"image/pjpeg" then
%>
<center>
<br><br>
<font color=red size=3>�ϴ�����ƬӦ��ΪGIF��JPG�ļ���</font><br><br>
<input type="button" value="����" onclick="history.go( -1 );return true;">
</center>
<%
else
'------------
'��ʼ�޸�
'-----------
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("ADODB.recordset") 
sql = "select * from personinf where username=" & sqlstr(oabusyusername)
rs.Open sql,conn,1,3
for i=1 to 33
rs("a" & i)=a(i)
next
if filename<>"" then
rs("havephoto")="yes"
rs("photo").appendchunk filevalue
end if
rs("updatedate")=now()
rs.update 
rs.close 
set rs=nothing 
set conn=nothing 
%>
<br><br>
<center><font color=red size=3>�ɹ��޸ĸ��˻���������</font><br><form method="post" action="personinf.asp"><input type="submit" value="����"></form>
</center>
<%
end if
end if
end if
%>
<%
call bgback()
%>
</body>
</html>










