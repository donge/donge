<!-- #include file="setup.asp" -->
<!-- #include file="inc/MD5.asp" -->


<%
top

username=HTMLEncode(Request("username"))
userpass=Trim(Request("userpass"))
if Request("username")="" then error("<li>用户名称没有填写")

sql="select * from [user] where username='"&HTMLEncode(username)&"'"
rs.Open sql,Conn,1,3
if rs.eof then error2(""&username&"的用户资料不存在")
if ""&rs("birthday")&""="" then error2("您注册的时候没有填写出生日期，所以无法通过此功能找回密码")
if Request("birthday")<>rs("birthday") then error2("出生日期填写错误")

if Request("menu")=2 then

if ""&rs("answer")&""="" or ""&rs("question")&""="" then error2("您注册的时候没有填写密码提示问题或者密码提示答案，所以无法通过此功能找回密码")
if md5(Request("answer"))<>rs("answer") then error2("答案错误")
if Request("userpass")="" then error2("请输入新的密码")
if Request("userpass")<>Request("userpass2") then error2("您2次输入的密码不同")

rs("userpass")=md5(userpass)
rs.update
rs.close


message=message&"<li>更改密码成功<li><a href=main.asp>返回论坛首页</a>"
succeed(""&message&"<meta http-equiv=refresh content=3;url=main.asp>")


end if

%>




<table width=97% align=center border=0>
<tr>
<td width=25%>
<img src=images/logo.gif border=0></td>
<td align=right><%=banner%></td>
</tr>
</table><br>
<table border=0 width=97% align=center cellspacing=1 cellpadding=4 class=a2>
<tr class=a3>
<td height=25>&nbsp;<img src=images/Forum_nav.gif>&nbsp; <a href=main.asp><%=clubname%></a> → 更改密码</td>
</tr>
</table><br>










<table width="333" border="0" cellspacing="1" cellpadding="2" align="center" class=a2>
<form method="POST" action=RecoverPasswd.asp>
<input type=hidden name=username value=<%=Request("username")%>>
<input type=hidden name=birthyear value=<%=Request("birthyear")%>>
<input type=hidden name=birthmonth value=<%=Request("birthmonth")%>>
<input type=hidden name=birthday value=<%=Request("birthday")%>>
<input type=hidden name=menu value=2>
<tr>
<td width="100%" align="center" height="20" class=a1 colspan="2">更改密码</td>
</tr>
<tr class=a3>
<td width="50%" align="right" height="20">请回答问题：</td>
<td width="50%" height="20"><%=rs("question")%></td>
</tr>
<tr class=a4>
<td width="50%" align="right" height="20">答案：</td>
<td width="50%" height="20"><input size="15" value name="answer"></td>
</tr>
<tr class=a3>
<td width="50%" align="right" height="20">请输入新的密码：</td>
<td width="50%" height="20"><input type="password" size="15" name="userpass"></td>
</tr>
<tr class=a4>
<td width="50%" align="right" height="20">请再次输入密码：</td>
<td width="50%" height="20"><input type="password" size="15" name="userpass2"></td>
</tr>

<tr>
<td width="100%" align="center" height="20" colspan="2" bgcolor="FFFFFF"><input type="submit" value=" 确定 " name="Submit1">　<input type="reset" value=" 取消 " name="Submit"></td>
</tr>
</form>

</table>



<br>
<center>
<a href=javascript:history.back()>BACK </a><br>

<%
htmlend
%>