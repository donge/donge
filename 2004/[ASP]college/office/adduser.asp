<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/bgsub.asp"-->
<%
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
<script language="javascript1.2" src="js/openwin.js"></script>
<title>网络办公系统</title>
</head>
<body bgcolor="#eeeeee" topmargin="5" leftmargin="5">
<%
call bghead()
%>
<center>
<table>
<tr>
<td><b>增加用户</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<form method="post" action="deptcontrol.asp">
<td>
<input type="submit" name="submit" value="部门名称管理">
</td>
</form>
<form method="post" action="userlevelcontrol.asp">
<td>
<input type="submit" name="submit" value="职位名称管理">
</td>
</form>
</tr>
</table>
</center>
<%
call bgmid()
%>
<%
oabusyuserdept=request.cookies("oabusyuserdept")
if request("submit")="增加" then
username=request("username")
password=request("password")
name=request("name")
userdept=request("userdept")
userlevel=request("userlevel")
'判断是否有与申请的用户名相同的
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where username=" & sqlstr(username) & " and password=" & sqlstr(password)
rs.open sql,conn,1
if not rs.eof and not rs.bof then
%>
<center>
<br><br>
<font color=red>用户名为<%=username%>的用户已经存在，请选择其他用户名</font><br>
<a href="javascript:void(null)" onclick="history.go( -1 );return true;"><font color="blue">返回</font></a>
</center>
<%
else
sql = "Insert Into userinf (username,password,name,userdept,userlevel) Values( "
sql = sql & SqlStr(username) & ", "
sql = sql & SqlStr(password) & ", "
sql = sql & SqlStr(name) & ", "
sql = sql & SqlStr(userdept) & ", "
sql = sql & SqlStr(userlevel) & ")"
conn.Execute sql
%>
<br><br>
<center>
<font color=red>用户名为<%=username%>的用户注册成功！</font>
</center>
<%
end if
else
%>
<br>
<center>
<script Language="JavaScript">
 function maxlength(str,minl,maxl) {
    if(str.length <= maxl && str.length >= minl){return true;}else{return false;}
                                    }

 function form_check(){
   var l1=maxlength(document.form2.username.value,1,20);
   if(!l1){window.alert("用户名的长度大于1位小于20位");document.form2.username.focus();return (false);}

   var l2=maxlength(document.form2.password.value,1,20);
   if(!l2){window.alert("密码的长度大于1位小于20位");document.form2.password.focus();return (false);}

   var a1=document.form2.password.value;
   var a2=document.form2.repassword.value;
   if(a1!=a2){window.alert("两次输入的密码应相同");document.form2.repassword.focus();return (false);}

   var l3=maxlength(document.form2.name.value,1,20);
   if(!l3){window.alert("姓名的长度大于1位小于20位");document.form2.name.focus();return (false);}

                    }

</script>


<form action="adduser.asp" method=post name="form2" onsubmit="return form_check();">
<table border=2>
<tr>
<td>
用户名：</td><td><input type=text name="username" size=20><font color=red>*</font>
</td>
</tr>
<tr>
<td>
密码：</td><td><input type="password" name="password" size=20><font color=red>*</font>
</td>
</tr>
<tr>
<td>
密码确认：</td><td><input type="password" name="repassword" size=20><font color=red>*</font>
</td>
</tr>
<tr>
<td>
姓名：</td><td><input type="text" name="name" size=20><font color=red>*</font>
</td>
</tr>
<tr>
<td>
部门：</td><td>
<select size=1 name="userdept">
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from dept"
rs.open sql,conn,1
while not rs.eof and not rs.bof
%>
<option value="<%=rs("dept")%>"><%=rs("dept")%></option>
<%
rs.movenext
wend
%>
</select><font color=red>*</font>
</td>
</tr>
<tr>
<td>
职位:</td><td><select name="userlevel" size=1>
<option value="总管">总管</option>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userlevel"
rs.open sql,conn,1
while not rs.eof and not rs.bof
%>
<option value="<%=rs("userlevel")%>"><%=rs("userlevel")%></option>
<%
rs.movenext
wend
%>
</select><font color=red>*</font>
</td>
</tr>
<tr>
<td colspan="2" align=center>
<font color=red>*</font>必须填&nbsp;&nbsp;<input type="submit" name="submit" value="增加">
</td>
</tr>
</table>
</form>
</center>
<%
end if
%>
<%
call bgback()
%>

</body>
</html>