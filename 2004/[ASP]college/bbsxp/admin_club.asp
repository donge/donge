<!-- #include file="setup.asp" -->
<%
if adminpassword<>session("pass") then response.redirect "admin.asp?menu=login"

log(""&Request.ServerVariables("script_name")&"<br>"&Request.ServerVariables("Query_String")&"<br>"&Request.form&"")


%>

<head>
<META http-equiv=Content-Type content=text/html;charset=gb2312>
<link href=images/skins/<%=Request.Cookies("skins")%>/bbs.css rel=stylesheet>
<style>
<!--
.tableBorder {
	BORDER-RIGHT: #183789 1px solid; BORDER-TOP: #183789 1px solid; BORDER-LEFT: #183789 1px solid; WIDTH: 98%; BORDER-BOTTOM: #183789 1px solid; BACKGROUND-COLOR: #ffffff
}
TD {
	FONT-SIZE: 12px
}
TD.forumRowHighlight {
	PADDING-RIGHT: 3px; PADDING-LEFT: 3px; BACKGROUND: #E4EDF9; PADDING-BOTTOM: 3px; PADDING-TOP: 3px
}
-->
</style>
</head>

<br><center>
<p></p>

<%

select case Request("menu")

case "affiche"
affiche

case "afficheok"
afficheok

case "message"
message

case "broadcast"
broadcast

case "sendmail"
sendmail

case "sendmailok"
sendmailok



case "messageok"
if request("TimeLimit")="" then error2("您没有选择日期！")
conn.execute("delete from [message] where time<"&SqlNowString&"-"&request("TimeLimit")&"")
error2("已经将"&request("TimeLimit")&"天以前的短讯息删除了！")


case "delmessageuser"
if request("username")="" then error2("您没有输入用户名！")
conn.execute("delete from [message] where author='"&request("username")&"' or incept='"&request("username")&"'")
error2("已经将"&request("username")&"的短讯息全部删除了！")

case "delmessagekey"
if request("key")="" then error2("您没有输入关键词！")
conn.execute("delete from [message] where content like '%"&request("key")&"%'")
error2("已经将内容中包含 "&request("key")&" 的短讯息删除了！")

end select


sub sendmail
%>

<form method="post" action="?menu=sendmailok">
<table cellspacing="1" cellpadding="2" width="70%" border="0" class="a2" align="center">
  <tr height=25>
    <td class=a1 align=middle colspan=2>群发邮件</td>
  </tr>
  <tr height=25>
    <td class=a3 align=left>&nbsp;&nbsp; 主题：<input size="40" name="title"></td>
    <td class=a3 align=middle>接收对象：
<select name=membercode>
<option value="">所有会员</option>
<option value="1">普通会员</option>
<option value="2">特邀嘉宾</option>
<option value="4">管 理 员</option>
<option value="5">社区区长</option>
</select>&nbsp;&nbsp;&nbsp; </td>
  </tr>
   <tr height=25>
    <td class=a3 align=middle colspan=2>
 <textarea name="content" rows="5" cols="70"></textarea>
</td></tr>
   <tr height=25>
    <td class=a3 align=middle colspan=2>
 <input type="submit" value=" 发 送 " name="submit">
<input type="reset" value=" 重 填 " name="Submit2"><br></td></tr></table></form>

<%
end sub


sub sendmailok

if Request("title")="" then
error2("请填写邮件主题")
end if
if Request("content")="" then
error2("请填写邮件内容")
end if

if Request("membercode")<>"" then
sql="select usermail from [user] where membercode="&Request("membercode")&""
else
sql="select usermail from [user]"
end if

rs.Open sql,Conn
do while not rs.eof

mailaddress=""&rs("usermail")&""
mailtopic=request("title")
body=""&request("content")&""&vbCrlf&""&vbCrlf&"该邮件通过 BBSxp 群发系统发送　程序制作：信息学院科技部(http://www.yuzi.net)"
%><!-- #include file="inc/mail.asp" --><%

rs.movenext
loop
rs.close

response.write "邮件发送成功！"

end sub


sub message
%>



数据库共有 <%=conn.execute("Select count(id)from message")(0)%> 条短讯息
<br><br>

<table cellspacing="1" cellpadding="2" width="70%" border="0" class="a2" align="center">
  <tr height=25 class=a1>
		<td align="center">批量删除短消息</td>
	</tr>
	<tr class=a3>
		<td align="center"><form method="post" action="?menu=delmessageuser">批量删除 <input size="13" name="username" value="用户名" onfocus="this.value=''"> 的短讯息
<input type="submit" value="确定">
		</td></form>
	</tr>
	
	<tr class=a3>
		<td align="center"><form method="post" action="?menu=delmessagekey">批量删除内容含有 <input size="20" name="key" value="关键词" onfocus="this.value=''"> 的短讯息
<input type="submit" value="确定">
		</td></form>
	</tr>
	
		<tr class=a3>
		<td align="center"><form method="post" action="?menu=messageok">删除 <select name=TimeLimit>
<option value="7">7</option>
<option value="15" selected>15</option>
<option value="30">30</option>
</select> 天以前的短讯息
<input type="submit" value="确定">

		</td></form>
	</tr>
	
</table>
</form>
<form method="post" action="?menu=broadcast">
<table cellspacing="1" cellpadding="2" width="70%" border="0" class="a2" align="center">
  <tr height=25>
    <td class=a1 align=middle width="50%">系统广播</td>
    <td class=a1 align=middle width="50%">接收对象：
<select name=membercode>
<option value="">在线会员</option>
<option value="1">普通会员</option>
<option value="2">特邀嘉宾</option>
<option value="3">论坛斑竹</option>
<option value="4">管 理 员</option>
<option value="5">社区区长</option>
</select>
</td>
  </tr>
   <tr height=25>
    <td class=a3 align=middle colspan=2>
	<textarea name="content" rows="5" cols="70"></textarea>
</td></tr>
   <tr height=25>
    <td class=a3 align=middle colspan=2>
	<input type="submit" value=" 发 送 " name="submit5">
<input type="reset" value=" 重 填 " name="Submit6"></td></tr></table></form>
<%
end sub

sub broadcast
content=HTMLEncode(Request.Form("content"))

if content="" then
error2("请填写广播内容!")
end if

if Request("membercode")<>"" then
sql="select username from [user] where membercode="&Request("membercode")&""
else
sql="select username from online where username<>''"
end if

rs.Open sql,Conn
do while not rs.eof
Count=Count+1
conn.Execute("insert into message (author,incept,content) values ('"&Request.Cookies("username")&"','"&rs("username")&"','【系统广播】："&content&"')")
conn.execute("update [user] set newmessage=newmessage+1 where username='"&rs("username")&"'")
rs.movenext
loop
rs.close

%>
发布成功
<br><br>
共发送给 <%=Count%> 位在线用户<br><br>
<a href=javascript:history.back()>返 回</a>
<%
end sub


sub affiche
%>
<form method="post" action="?menu=afficheok">

<table cellspacing="1" cellpadding="2" width="70%" border="0" class="a2" align="center">
  <tr height=25>
    <td class=a1 align=middle colspan=2>发布公告</td>
  </tr>
   <tr height=25>
    <td class=a3 align=middle width="16%">
标题：</td>
    <td class=a3 width="82%">
<input type="text" name="affichetitle" size="60" value="<%=affichetitle%>"></td></tr>
   <tr height=25>
    <td class=a3 align=middle width="16%">
内容：</td>
    <td class=a3 width="82%">
<textarea name="affichecontent" cols="60" rows="5"><%=replace(affichecontent,"<br>",vbCrlf)%></textarea></td></tr>
   <tr height=25>
    <td class=a3 align=middle colspan=2>
<input type="submit" value=" 发 送 " name="submit3">
<input type="reset" value=" 重 填 " name="Submit4">
支持HTML代码</td></tr></table></form>
<%
end sub

sub afficheok
rs.Open "clubconfig",Conn,1,3
rs("affichetitle")=Request("affichetitle")
rs("affichecontent")=replace(Request("affichecontent"),vbCrlf,"<br>")
rs("affichetime")=now()
rs("afficheman")=Request.Cookies("username")
rs.update
rs.close
%> 发布成功<br><br><a href=javascript:history.back()>返 回</a>
<%
end sub

htmlend

%>