<!-- #include file="setup.asp" -->
<!-- #include file="inc/MD5.asp" -->
<%
top
forumid=int(Request("forumid"))

select case Request("menu")

case "password"


sql="select * from bbsconfig where id="&forumid&""
Set Rs=Conn.Execute(sql)
bbsname=rs("bbsname")
logo=rs("logo")
followid=rs("followid")
rs.close
%>
<title>��¼����</title>

<table width=97% align=center border=0>
<tr>
<td width=25%>
<SCRIPT>if ("<%=logo%>"!=''){document.write("<img border=0 src=<%=logo%> onload='javascript:if(this.height>60)this.height=60;'")}else{document.write("<img border=0 src=images/logo.gif>")}</SCRIPT>
</td>
<td align=right><%=banner%></td>
</tr>
</table><br>
<table border=0 width=97% align=center cellspacing=1 cellpadding=4 class=a2>
<tr class=a3>
<td height=25>&nbsp;<img src=images/Forum_nav.gif>&nbsp; <a href=main.asp><%=clubname%></a> �� <%ForumTree(followid)%><%=ForumTreeList%> <a href=ShowForum.asp?forumid=<%=forumid%>><%=bbsname%></a> 
�� ��¼��̳</td>
</tr>
</table>
<br>
<table width="333" border="0" cellspacing="1" cellpadding="2" align="center" class=a2>

<form action="login.asp" method="post">
<input type="hidden" value="passwordok" name="menu">
<input type="hidden" value="<%=Request("forumid")%>" name="forumid">
<tr>
<td width="328" height="25" align="center" class=a1>
��¼��̳
</td></tr><tr>
<td height="19" width="328" valign="top" align="center" class=a3>
ͨ������: <input type="password" size="15" name="password"><br>

<input type="submit" value=" ��¼ " name="Submit1">��<input type="reset" value=" ȡ�� " name="Submit">
</td></tr> </form></table>

<br>
<center>
<a href=javascript:history.back()>BACK </a><br>


<%
htmlend
case "passwordok"
Response.Cookies("password")=Request("password")
response.redirect "ShowForum.asp?forumid="&forumid&""


case "add"


url=Request("url")
username=HTMLEncode(Trim(Request("username")))
userpass=md5(Trim(Request("userpass")))
if username=empty then error("<li>�û���û������")

sql="select * from [user] where username='"&username&"'"
Set Rs1=Conn.Execute(SQL)
if rs1.eof then  error("<li>���û�����δ<a href=register.asp?username="&username&">ע��</a>")
if userpass<>rs1("userpass") then  error("<li>��������������")
if rs1("membercode")=0 then error("<li>�����ʺ���δ����")
Response.Cookies("username")=username
Response.Cookies("userpass")=userpass
Response.Cookies("eremite")="0"

if Request("eremite")="1" then Response.Cookies("eremite")="1"

if Request("xuansave")=1 then
Response.Cookies("eremite").Expires=date+365
Response.Cookies("username").Expires=date+365
Response.Cookies("userpass").Expires=date+365
end if

if url<>empty and instr(url,"login.asp")=0 and instr(url,"ShowPost.asp")=0 and instr(url,"left.htm")=0 then
response.redirect url
else
response.write "<SCRIPT>top.location='Default.asp';</SCRIPT>"
end if

case "out"
conn.execute("delete from [online] where username='"&Request.Cookies("username")&"' and ip='"&remoteaddr&"'")
Response.Cookies("username")=""
Response.Cookies("userpass")=""
succtitle="�Ѿ��ɹ��˳�"
message=message&"<li><a href=main.asp>������ҳ</a>"
succeed(""&message&"<meta http-equiv=refresh content=3;url=main.asp>")

end select
%>

<title>��¼����</title>

<table width=97% align=center border=0>
<tr>
<td width=25%>
<img src=images/logo.gif border=0></td>
<td align=right><%=banner%></td>
</tr>
</table><br>
<table border=0 width=97% align=center cellspacing=1 cellpadding=4 class=a2>
<tr class=a3>
<td height=25>&nbsp;<img src=images/Forum_nav.gif>&nbsp; <a href=main.asp><%=clubname%></a> ��  ��½����</td>
</tr>
</table><br>
<table width="333" border="0" cellspacing="1" cellpadding="2" align="center" class=a2>

<form action="login.asp" method="post">
<input type="hidden" value="add" name="menu">
<input type="hidden" value="<%=Request.ServerVariables("HTTP_REFERER")%>" name="url">
<tr>
<td width="328" height="25" align="center" class=a1>
��¼����
</td></tr><tr>
<td height="19" width="328" valign="top" align="center" class=a3>
�û�����:
<input size="15" name="username" value="<%=Request.Cookies("username")%>">&nbsp; <a href="register.asp">û��ע��?</a><br>
�û�����: <input type="password" size="15" value name="userpass">&nbsp;
<a href="modification.asp">��������?</a><br>

<input type="checkbox" value="1" name="xuansave" id="xuansave"><label for="xuansave">��ס����</label>

<input type="checkbox" value="1" name="eremite" id="eremite"><label for="eremite">�����¼</label><br>
<input type="submit" value=" ��¼ " name="Submit1">��<input type="reset" value=" ȡ�� " name="Submit">
</td></tr> </form></table>

<br>
<center>
<a href=javascript:history.back()>BACK </a><br>


<%htmlend%>