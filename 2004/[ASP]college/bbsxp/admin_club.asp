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
if request("TimeLimit")="" then error2("��û��ѡ�����ڣ�")
conn.execute("delete from [message] where time<"&SqlNowString&"-"&request("TimeLimit")&"")
error2("�Ѿ���"&request("TimeLimit")&"����ǰ�Ķ�ѶϢɾ���ˣ�")


case "delmessageuser"
if request("username")="" then error2("��û�������û�����")
conn.execute("delete from [message] where author='"&request("username")&"' or incept='"&request("username")&"'")
error2("�Ѿ���"&request("username")&"�Ķ�ѶϢȫ��ɾ���ˣ�")

case "delmessagekey"
if request("key")="" then error2("��û������ؼ��ʣ�")
conn.execute("delete from [message] where content like '%"&request("key")&"%'")
error2("�Ѿ��������а��� "&request("key")&" �Ķ�ѶϢɾ���ˣ�")

end select


sub sendmail
%>

<form method="post" action="?menu=sendmailok">
<table cellspacing="1" cellpadding="2" width="70%" border="0" class="a2" align="center">
  <tr height=25>
    <td class=a1 align=middle colspan=2>Ⱥ���ʼ�</td>
  </tr>
  <tr height=25>
    <td class=a3 align=left>&nbsp;&nbsp; ���⣺<input size="40" name="title"></td>
    <td class=a3 align=middle>���ն���
<select name=membercode>
<option value="">���л�Ա</option>
<option value="1">��ͨ��Ա</option>
<option value="2">�����α�</option>
<option value="4">�� �� Ա</option>
<option value="5">��������</option>
</select>&nbsp;&nbsp;&nbsp; </td>
  </tr>
   <tr height=25>
    <td class=a3 align=middle colspan=2>
 <textarea name="content" rows="5" cols="70"></textarea>
</td></tr>
   <tr height=25>
    <td class=a3 align=middle colspan=2>
 <input type="submit" value=" �� �� " name="submit">
<input type="reset" value=" �� �� " name="Submit2"><br></td></tr></table></form>

<%
end sub


sub sendmailok

if Request("title")="" then
error2("����д�ʼ�����")
end if
if Request("content")="" then
error2("����д�ʼ�����")
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
body=""&request("content")&""&vbCrlf&""&vbCrlf&"���ʼ�ͨ�� BBSxp Ⱥ��ϵͳ���͡�������������ϢѧԺ�Ƽ���(http://www.yuzi.net)"
%><!-- #include file="inc/mail.asp" --><%

rs.movenext
loop
rs.close

response.write "�ʼ����ͳɹ���"

end sub


sub message
%>



���ݿ⹲�� <%=conn.execute("Select count(id)from message")(0)%> ����ѶϢ
<br><br>

<table cellspacing="1" cellpadding="2" width="70%" border="0" class="a2" align="center">
  <tr height=25 class=a1>
		<td align="center">����ɾ������Ϣ</td>
	</tr>
	<tr class=a3>
		<td align="center"><form method="post" action="?menu=delmessageuser">����ɾ�� <input size="13" name="username" value="�û���" onfocus="this.value=''"> �Ķ�ѶϢ
<input type="submit" value="ȷ��">
		</td></form>
	</tr>
	
	<tr class=a3>
		<td align="center"><form method="post" action="?menu=delmessagekey">����ɾ�����ݺ��� <input size="20" name="key" value="�ؼ���" onfocus="this.value=''"> �Ķ�ѶϢ
<input type="submit" value="ȷ��">
		</td></form>
	</tr>
	
		<tr class=a3>
		<td align="center"><form method="post" action="?menu=messageok">ɾ�� <select name=TimeLimit>
<option value="7">7</option>
<option value="15" selected>15</option>
<option value="30">30</option>
</select> ����ǰ�Ķ�ѶϢ
<input type="submit" value="ȷ��">

		</td></form>
	</tr>
	
</table>
</form>
<form method="post" action="?menu=broadcast">
<table cellspacing="1" cellpadding="2" width="70%" border="0" class="a2" align="center">
  <tr height=25>
    <td class=a1 align=middle width="50%">ϵͳ�㲥</td>
    <td class=a1 align=middle width="50%">���ն���
<select name=membercode>
<option value="">���߻�Ա</option>
<option value="1">��ͨ��Ա</option>
<option value="2">�����α�</option>
<option value="3">��̳����</option>
<option value="4">�� �� Ա</option>
<option value="5">��������</option>
</select>
</td>
  </tr>
   <tr height=25>
    <td class=a3 align=middle colspan=2>
	<textarea name="content" rows="5" cols="70"></textarea>
</td></tr>
   <tr height=25>
    <td class=a3 align=middle colspan=2>
	<input type="submit" value=" �� �� " name="submit5">
<input type="reset" value=" �� �� " name="Submit6"></td></tr></table></form>
<%
end sub

sub broadcast
content=HTMLEncode(Request.Form("content"))

if content="" then
error2("����д�㲥����!")
end if

if Request("membercode")<>"" then
sql="select username from [user] where membercode="&Request("membercode")&""
else
sql="select username from online where username<>''"
end if

rs.Open sql,Conn
do while not rs.eof
Count=Count+1
conn.Execute("insert into message (author,incept,content) values ('"&Request.Cookies("username")&"','"&rs("username")&"','��ϵͳ�㲥����"&content&"')")
conn.execute("update [user] set newmessage=newmessage+1 where username='"&rs("username")&"'")
rs.movenext
loop
rs.close

%>
�����ɹ�
<br><br>
�����͸� <%=Count%> λ�����û�<br><br>
<a href=javascript:history.back()>�� ��</a>
<%
end sub


sub affiche
%>
<form method="post" action="?menu=afficheok">

<table cellspacing="1" cellpadding="2" width="70%" border="0" class="a2" align="center">
  <tr height=25>
    <td class=a1 align=middle colspan=2>��������</td>
  </tr>
   <tr height=25>
    <td class=a3 align=middle width="16%">
���⣺</td>
    <td class=a3 width="82%">
<input type="text" name="affichetitle" size="60" value="<%=affichetitle%>"></td></tr>
   <tr height=25>
    <td class=a3 align=middle width="16%">
���ݣ�</td>
    <td class=a3 width="82%">
<textarea name="affichecontent" cols="60" rows="5"><%=replace(affichecontent,"<br>",vbCrlf)%></textarea></td></tr>
   <tr height=25>
    <td class=a3 align=middle colspan=2>
<input type="submit" value=" �� �� " name="submit3">
<input type="reset" value=" �� �� " name="Submit4">
֧��HTML����</td></tr></table></form>
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
%> �����ɹ�<br><br><a href=javascript:history.back()>�� ��</a>
<%
end sub

htmlend

%>