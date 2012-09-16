<%@ codepage ="936" %>
<%user=request.form("user")
password=request.form("password")
if user<>"" then
Set con=Server.CreateObject("ADODB.Connection")%>
<!-- #include file=1Qw@3E.inc -->
<%con.Open connstr
sql="select user_name,pass_word,site_name from zhenxin_user where user_name='"&user&"'"
Set Rs=con.Execute(sql)
if rs.eof or rs.bof then
response.write("错误：user_name不存在！ <a href='edituser.asp'>返回</a>")
rs.close
con.close
set rs=nothing
set con=nothing
response.end
end if
pass=rs("pass_word")
if pass<>password then
response.write("错误：pass_word错误！ <a href='edituser.asp'>返回</a>")
rs.close
con.close
set rs=nothing
set con=nothing
response.end
end if
response.redirect"edituser2.asp?user="&user&"&pass="&pass
end if%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 3.0">

<link rel="stylesheet" type="text/css" href="link.css">
<title>真心链</title>
</head>

<body topmargin="0" leftmargin="0" bgcolor="#FFFFFF">
<!--#include file="1.htm" -->
<table border="0" width="778" cellspacing="0" cellpadding="0" bgcolor="#eeeeee"
bordercolorlight="#000000" bordercolordark="#FFFFFF">
      <tr>
    <td width="100%">

<p>&nbsp;</p>
      <table align="center" width="80%" cellpadding="0" cellspacing="0" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="#FFFFFF">
        <tr>
          <td> 
            <p>&nbsp;</p>
            <p align="center"> 要修改用户资料，请先输入你正确的用户名和pass_word</p>

<form action="edituser.asp" method="post">
              <div align="center">
                <p>用户： 
                  <input
  name="user" size="10" class="stedit" maxlength="10">
                  <br>
                  pass_word： 
                  <input
  name="password" size="10" class="stedit" type="password" maxlength="10">
                </p>
                <p> 
                  <input type="submit" value="登陆" class="stbtm">
                </p>
              </div>
            </form>
<p>&nbsp;</p></td></tr></table>

<p>&nbsp;</p></td>
</tr>
</table>
 <!--#include file="2.htm" --> 
</body>
</html>