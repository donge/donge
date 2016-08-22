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
<title>网络办公系统</title>
</head>
<bgsound src="progctor.wav" loop="1">
<body bgcolor="#eeeeee" topmargin="5" leftmargin="5" onunload="opener.location.reload();">
<%
if request("submit")="回复" then
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
%>
<SCRIPT language=JavaScript>                   
window.close();
opener.location.reload();
</script> 
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
<table>
<tr>
<td align=center>
<b><%=rs("title")%></b>
</td>
<td rowspan="2">
<%
if rs("filename")<>"" then
%>
<a href="listsendfile.asp?id=<%=rs("id")%>" target="_blank"><img src="images/attach.gif" width=30 height=30 border=0></a>
<%
end if
%>
</td>
<tr>
<td>[发布日期：<%=rs("inputdate")%>][发送人所在部门：
<%
set conn=opendb("oabusy","conn","accessdsn")
Set rs1=Server.CreateObject("ADODB.recordset")
sql="select userdept,name from userinf where username=" & sqlstr(rs("sender"))
rs1.open sql,conn,1
%>
<%=rs1("userdept")%>
]
[发送者：<%=rs1("name")%>]
</td>
</tr>
</table>
</center>
<%
call bgmid()
%>
&nbsp;<br>
<%=keepformat(rs("content"))%>
<hr color=blue size=1>
<center>
<form method="post" name="form1" action="popdate.asp">
<input type="hidden" name="title" value="Re:<%=rs("title")%>">
<input type="hidden" name="sender" value="<%=oabusyusername%>">
<input type="hidden" name="recipientusername" value="<%=rs("sender")%>">
<input type="hidden" name="reid" value="<%=rs("id")%>">
<textarea name="content" rows="15" cols="50"></textarea><br>
<input type="submit" name="submit" value="回复">
</form>
</center>
<%
call bgback()
%>
</body>
</html>