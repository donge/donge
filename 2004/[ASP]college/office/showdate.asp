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
<title>网络办公系统</title>
</head>
<body bgcolor="#eeeeee" topmargin="0" leftmargin="5">
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
 <table border="1" cellpadding="0" cellspacing="0">
  <tr>
   <td>要转发给</td><td>
     <table border="0" cellpadding="0" cellspacing="0">
      <tr>
        <form action="showdate.asp" method="post" name="form1">
        <td>
         <select name="userdept" size=1 onChange="document.form1.submit();">
<%
'打开数据库读出部门
set conn=opendb("oabusy","conn","accessdsn")
set rs3=server.createobject("adodb.recordset")
sql="select DISTINCT userdept from userinf"
rs3.open sql,conn,1
if not rs3.eof and not rs3.bof then firstdept=rs3("userdept")
if request("userdept")<>"" then firstdept=request("userdept")
while not rs3.eof and not rs3.bof
%>
<option value="<%=rs3("userdept")%>"<%=selected(firstdept,rs3("userdept"))%>><%=rs3("userdept")%></option>
<%
rs3.movenext
wend
%>
</select>
<input type="hidden" name="id" value=<%=request("id")%>>
<input type="hidden" name="sendto" value="<%=sendto%>">
       </td>
</form>
       <td>的</td>
<form name="form2">
       <td>
<select name="recipient" size=1>
<option value="所有人">所有人</option>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs3=server.createobject("adodb.recordset")
sql="select name,username from userinf where userdept=" & sqlstr(firstdept) & " and userlevel<>'总管' and forbid='no'"
rs3.open sql,conn,1
while not rs3.eof and not rs3.bof
%>
<option value="<%=rs3("name")%>(<%=rs3("username")%>)"><%=rs3("name")%></option>
<%
rs3.movenext
wend
%>
</select>
     </td>
</form>
     <form name="form3">
     <td>
<input type="button" value="增加" onClick="document.form1.sendto.value=document.form1.sendto.value+'|'+document.form1.userdept.value+':'+document.form2.recipient.value;document.form4.sendto.value=document.form1.sendto.value;">
     </td>
</form>
    </tr>
  </table>
</td>
</tr>
<tr>
<form method="post" name="form4" action="datereturn.asp">
<input type="hidden" name="title" value="Re:<%=rs("title")%>">
<input type="hidden" name="sender" value="<%=oabusyusername%>">
<input type="hidden" name="recipientusername" value="<%=rs("sender")%>">
<input type="hidden" name="reid" value="<%=rs("id")%>">
<input type="hidden" name="id" value="<%=rs("id")%>">
<td>转发给：</td><td><input type="text" name="sendto" size=50 value="<%=sendto%>" onfocus="document.form4.content.focus();"></td>
</tr>
<tr>
<td>回复或转<br>发意见：</td>
<td>
<%
'打开数据库读出最后回复
set conn=opendb("oabusy","conn","accessdsn")
Set rs2=Server.CreateObject("ADODB.recordset")
sql="select * from senddate where sender=" & sqlstr(oabusyusername) & " and reid=" & request("id") & " order by id desc"
rs2.open sql,conn,1
if not rs2.eof and not rs.bof then rs2content=rs2("content")
%>
<textarea name="content" rows="10" cols="50"><%=rs2content%></textarea>
</td>
</tr>
<tr>
<td colspan=2 align=center>
<input type="submit" name="submit" value="回复">&nbsp;&nbsp;<input type="submit" name="submit" value="转发" onclick="return form_check()">
</td>
</form>
</tr>
</table>
</center>

<script Language="JavaScript">
 function form_check(){
   if(document.form4.sendto.value.length<1){window.alert("请选择发送目标");document.form2.recipient.focus();return (false);}
                    }
</script>


<%
call bgback()
%>
</body>
</html>