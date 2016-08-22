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


sendto=request("sendto")
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
<td>
要发送给
</td>
<form action="senddate.asp" method="post" name="form1">
<td>
<select name="userdept" size=1 onChange="document.form1.submit();">
<%
'打开数据库读出部门
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select DISTINCT userdept from userinf"
rs.open sql,conn,1
if not rs.eof and not rs.bof then firstdept=rs("userdept")
if request("userdept")<>"" then firstdept=request("userdept")
while not rs.eof and not rs.bof
%>
<option value="<%=rs("userdept")%>"<%=selected(firstdept,rs("userdept"))%>><%=rs("userdept")%></option>
<%
rs.movenext
wend
%>
</select>
<input type="hidden" name="sendto" value="<%=sendto%>">
</td>
</form>
<td>
的
</td>
<form name="form2">
<td>
<select name="recipient" size=1>
<option value="所有人">所有人</option>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select name,username from userinf where userdept=" & sqlstr(firstdept) & " and userlevel<>'总管' and forbid='no'"
rs.open sql,conn,1
while not rs.eof and not rs.bof
%>
<option value="<%=rs("name")%>(<%=rs("username")%>)"><%=rs("name")%></option>
<%
rs.movenext
wend
%>
</select>
</td>
</form>
<form name="form4">
<td>
<input type="button" value="增加" onClick="document.form1.sendto.value=document.form1.sendto.value+'|'+document.form1.userdept.value+':'+document.form2.recipient.value;document.form3.sendto.value=document.form1.sendto.value;">
</td>
</form>
</tr>
</table>
</center>
<%
call bgmid()
%>
<script Language="JavaScript">
 function form_check(){

   if(document.form3.sendto.value.length<1){window.alert("请选择发送目标");document.form2.recipient.focus();return (false);}


   if(document.form3.title.value.length<1){window.alert("标题不能空");document.form3.title.focus();return (false);}

                    }

</script>

<br>
<center>
  <table border="1" cellpadding="0" cellspacing="0">
    <tr>
<form method="post" ENCTYPE="multipart/form-data" name="form3" action="senddateindb.asp" onsubmit="return form_check();">
<input type="hidden" name="userdept" value="<%=firstdept%>">
<input type="hidden" name="username" value="所有人">
       <td align="center"><b>发给：</b></td><td><input type="text" name="sendto" size=60 value="<%=sendto%>" onfocus="document.form3.title.focus();"><font color=red>*</font></td>
    </tr>
    <tr>
      <td align="center"><b>标题:</b></td>
      <td><input type=text name="title" size=60><font color=red>*</font></td>
    </tr>
    <tr>
      <td align="center"><b>内容:</b></td>
      <td><textarea name="content" rows="9" cols="60"></textarea></td>
    </tr>
    <tr>
      <td align="center"><b>附件:</b></td>
      <td><input type="file" name="file1" size=50></td>
    </tr>
    <tr>
      <td align=center colspan=2>
<input type="submit" name="submit" value="发送">
      </td>
</form>
    </tr>
  </table>
</center>

<%
call bgback()
%>

</body>  
  
</html>  


