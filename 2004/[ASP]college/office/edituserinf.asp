<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/checked.asp"-->
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then response.redirect "default.asp"
username=request("username")
%>
<%
sub userinf(href)
if request("submit")="更改" then
password=request("password")
name=request("name")
dept=request("dept")
userlevel=request("userlevel")
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql = "update userinf set "
sql = sql & "password=" & SqlStr(password) & ", "
sql = sql & "name=" & SqlStr(name) & ",userdept=" & sqlstr(dept) & ",userlevel=" & sqlstr(userlevel) & " where username=" & sqlstr(username)
conn.Execute sql
%>
<br><br>
<font color=red>用户资料维护成功！</font>
<br><br>
<form mothed=post action="usercontrol.asp">
<input type="submit" name="submit" value="返回">
</form>
<%
else

%>

<script Language="JavaScript">
 function maxlength(str,minl,maxl) {
    if(str.length <= maxl && str.length >= minl){return true;}else{return false;}
                                    }

 function form_check(){

   var l2=maxlength(document.form2.password.value,1,20);
   if(!l2){window.alert("密码的长度大于1位小于20位");document.form2.password.focus();return (false);}

   var a1=document.form2.password.value;
   var a2=document.form2.repassword.value;
   if(a1!=a2){window.alert("两次输入的密码应相同");document.form2.repassword.focus();return (false);}

   var l3=maxlength(document.form2.name.value,1,20);
   if(!l3){window.alert("姓名的长度大于1位小于20位");document.form2.name.focus();return (false);}

                    }

</script>


<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where username=" & sqlstr(username)
rs.open sql,conn,1
%>

<form action="<%=href%>" method=post name="form2" onsubmit="return form_check();">
<table border=2>
<tr>
<td>
用&nbsp;户&nbsp;名：<%=rs("username")%><input type="hidden" name="username" size=20 value="<%=rs("username")%>">
</td>
</tr>
<tr>
<td>
密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" name="password" size=20 value="<%=rs("password")%>">
</td>
</tr>
<tr>
<td>
密码确认：<input type="password" name="repassword" size=20 value="<%=rs("password")%>">
</td>
</tr>
<tr>
<td>
姓&nbsp;&nbsp;&nbsp;&nbsp;名：<input type="text" name="name" size=20 value="<%=rs("name")%>">
</td>
</tr>
<tr>
<td>
部&nbsp;&nbsp;&nbsp;&nbsp;门：
<select name="dept" size=1>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs1=server.createobject("adodb.recordset")
sql="select * from dept"
rs1.open sql,conn,1
while not rs1.eof and not rs1.bof
%>
<option value="<%=rs1("dept")%>"<%=selected(rs("userdept"),rs1("dept"))%>><%=rs1("dept")%></option>
<%
rs1.movenext
wend
%>
</select>
</td>
</tr>
<tr>
<td>
职&nbsp;&nbsp;&nbsp;&nbsp;位：
<select name="userlevel" size=1>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs2=server.createobject("adodb.recordset")
sql="select * from userlevel"
rs2.open sql,conn,1
while not rs2.eof and not rs2.bof
%>
<option value="<%=rs2("userlevel")%>"<%=selected(rs("userlevel"),rs2("userlevel"))%>><%=rs2("userlevel")%></option>
<%
rs2.movenext
wend
%>
</select>
</td>
</tr>
<tr>
<td align=center>
<input type="submit" name="submit" value="更改">&nbsp;&nbsp;<input type="button" value="返回" onclick="window.location.href='usercontrol.asp'">
</td>
</tr>
</table>
</form>
<%
end if
end sub
%>



<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="css/css.css">
<script language="javascript1.2" src="js/openwin.js"></script>
<title>网络办公系统</title>
</head>
<body bgcolor="#eeeeee" topmargin="5" leftmargin="5">
<% call bghead() %>
<center>
<table>
<tr>
<td><b>编辑用户资料</b></td>
</tr>
</table>
</center>
<%
call bgmid()
%>
<center>
<br>
<% call userinf("edituserinf.asp") %>
</center>
<%
call bgback()
%>

</body>
</html>