<!-- #include file="conn.asp" -->
<%
Set conn=Server.CreateObject("ADODB.Connection")
conn.open ConnStr
Set Rs=Conn.Execute("clubconfig")
clubname=rs("clubname")
cluburl=rs("cluburl")
adminpassword=rs("adminpassword")
homeurl=rs("homeurl")
homename=rs("homename")
affichetitle=rs("affichetitle")
affichecontent=rs("affichecontent")
affichetime=rs("affichetime")
afficheman=rs("afficheman")
badwords=rs("badwords")
badip=rs("badip")
selectmail=rs("selectmail")
smtp=rs("smtp")
smtpmail=rs("smtpmail")
MailServerusername=rs("MailServerusername")
MailServerPassword=rs("MailServerPassword")
banner=rs("banner")
adcode=rs("adcode")
badlist=rs("badlist")
nowdate=rs("nowdate")
today=rs("today")
oldday=rs("oldday")
bbsxp_setup=split(rs("allclass"),",")
floor=bbsxp_setup(0)
CloseRegUser=bbsxp_setup(1)
Reg10=bbsxp_setup(2)
RegOnlyMail=bbsxp_setup(3)
SendPassword=bbsxp_setup(4)
apply=bbsxp_setup(5)
prison=bbsxp_setup(6)
Timeout=bbsxp_setup(7)
OnlineTime=bbsxp_setup(8)
MaxFace=bbsxp_setup(9)
MaxPhoto=bbsxp_setup(10)
MaxFile=bbsxp_setup(11)
searchcontent=bbsxp_setup(12)
MaxSearch=bbsxp_setup(13)
ActivationForum=bbsxp_setup(14)
ActivationUser=bbsxp_setup(15)
set rs=nothing

if Request.ServerVariables("HTTP_X_FORWARDED_FOR")=empty then
remoteaddr=Request.ServerVariables("REMOTE_ADDR")
else
remoteaddr=Request.ServerVariables("HTTP_X_FORWARDED_FOR")
end if

if badip<>empty then
filtrate=split(badip,"|")
for i = 0 to ubound(filtrate)
if instr("|"&remoteaddr&"","|"&filtrate(i)&"") > 0 then response.redirect "badip.htm"
next
end if



Set rs = Server.CreateObject("ADODB.Recordset")
Server.ScriptTimeout=Timeout  '���ӳ�ʱ���ʱ��
dim userface,membercode,newmessage,tophtml,ForumTreeList
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
function HTMLEncode(fString)
fString=server.htmlencode(fString)
fString=replace(fString,"\","&#92;")
fString=replace(fString,"'","&#39;")
fString=replace(fString,vbCrlf,"<br>")
HTMLEncode=fString
end function
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
sub top
if Request.Cookies("username")<>empty then
sql="select * from [user] where username='"&Request.Cookies("username")&"'"
rs.Open sql,Conn,1,3
on error resume next '�Ҳ�������ʱ ���Դ���
if Request.Cookies("userpass")<>rs("userpass") then Response.Cookies("username")=""
userface=""&rs("userface")&""
membercode=rs("membercode")
newmessage=rs("newmessage")
''''''''''''''''''��һ����'''''''''''''''''''''''''''''
if Request.Cookies("onlinetime")=empty then
rs("degree")=rs("degree")+1
rs("landtime")=now()
rs.update
Response.Cookies("onlinetime")=now()
Response.Cookies("addmin")=0
''''''''���ͣ��10���ӣ�����ֵ: +1 ����ֵ��+10''''''''''''''''''''
elseif DateDiff("s",Request.Cookies("onlinetime"),Now())>600 then
rs("experience")=rs("experience")+1
rs("landtime")=now()
if rs("userlife")>90 then
rs("userlife")=100
else
rs("userlife")=rs("userlife")+10
end if
rs.update
Response.Cookies("onlinetime")=now()
Response.Cookies("addmin")=Request.Cookies("addmin")+10
end if
set rs=nothing
Set rs = Server.CreateObject("ADODB.Recordset")
''''''''''''''''''''''''''''
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
<meta name="keywords" content="BBSxp,Board,yuzi,ASP,Access,MSSQL,FORUM">
<meta name="description" content="<%=clubname%> - Powered by BBSxp">
</head>
<link href="images/skins/<%=Request.Cookies("skins")%>/bbs.css" rel="stylesheet">
<link href="images/ybb.ico" rel="SHORTCUT ICON">
<body topmargin="0">
<script src="inc/ybb.js"></script>
<script src="inc/BBSxp.js"></script>
<script src="images/skins/<%=Request.Cookies("skins")%>/bbs.js"></script>
<table cellspacing="1" cellpadding="1" width="97%" align="center" border="0" class="a2"><tr><td class="a1" width="80%"><table cellspacing="0" cellpadding="4" width="100%" border="0"><tr class="a1"><td width="80%" id=TableTitleLink>&gt;&gt;��ӭ���� <%
if Request.Cookies("username")=empty then
%>  <a href="login.asp">���ȵ�¼</a> |  <a href="register.asp">
	ע��</a> |  <a href="modification.asp">
	��������</a> |  <a href="online.asp">
	�������</a> | <a href="search.asp?forumid=<%=Request("forumid")%>">
	����</a> | <a href="help.asp">
	����</a> </td></tr></table></td></tr></table><br>
<%else%>
<%=Request.Cookies("username")%> <a href="login.asp">
	�����û�</a> <%
if Request.Cookies("eremite")=1 then
response.write " | <A title=�ı䵱ǰ״̬ href=cookies.asp?menu=online>����</A>"
else
response.write " | <A title=�ı䵱ǰ״̬ href=cookies.asp?menu=eremite>����</A>"
end if
%> |  <a title="�༭���ĸ�������" href="usercp.asp">
	�������</a> |  <a title="�鿴���߻�Ա����" href="online.asp">
	�������</a> | <a href="search.asp?forumid=<%=Request("forumid")%>">
	����</a> | <a href="help.asp">
	����</a> <%
select case membercode
case "5"
response.write " | <A href=admin.asp target=_top>����</A> | <A href=recycle.asp>����վ</A>"
case "4"
response.write " | <A href=recycle.asp>����վ</A>"
end select
%> | <A href=login.asp?menu=out>�˳�</A></td><td align="right">�Ѿ�ͣ�� <b><%=DateDiff("n",Request.Cookies("onlinetime"),Now())+Request.Cookies("addmin")%></b> ����&nbsp; </td></tr></table></td></tr></table><%
'''''����ж�ѶϢ''''''''''''''''''''''
if newmessage>0 then
%> <bgsound src="images/msg.wav"><table width="97%" align="center"><tr><td width="100%" align="right"><a style="text-decoration: none" href="message.asp"><img src="images/newmail.gif" border="0"> <font color="990000">����<%=newmessage%>����ѶϢ����ע�����</font></a> </td></tr></table><script>
if (getCookie('newmessage')=='1'){
if (confirm("�����µĶ���Ϣ���Ƿ���ռ���鿴��"))open('friend.asp?menu=look','','width=320,height=170');
}
</script>
<%
else
response.write "<br>"
end if
'''''''''''''
end if
tophtml=1
end sub
''''''''''''''''''''''''''''''''
sub succeed(message)
if tophtml=empty then top
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
<td height=25>&nbsp;<img src=images/Forum_nav.gif>&nbsp; <a href=main.asp><%=clubname%></a> �� ������Ϣ</td>
</tr>
</table><br><SCRIPT>valigntop()</SCRIPT>
<table cellspacing="0" cellpadding="0" width="97%" align="center" border="0" class="a2"><tr><td height="106">
<table cellspacing="1" cellpadding="6" width="100%" border="0"><tr><td width="100%" height="20" align="middle" class="a1">
<span style="FONT-WEIGHT: bold">������ʾ��Ϣ</span></td></tr><tr bgcolor="ffffff"><td valign="top" align="left" height="122"><b>&nbsp;</b><table cellspacing="0" cellpadding="5" width="100%" border="0"><tr><td width="83%" valign="top"><b><span id="yu">3</span><a href="javascript:countDown"></a>���Ӻ�ϵͳ���Զ�����...</b><ul><%=message%></ul></td><td width="17%"><img height="97" src="images/succ.gif" width="95"></td></tr></table></td></tr></table></td></tr></table>
<SCRIPT>valignbottom()</SCRIPT>
</font><script>function countDown(secs){yu.innerText=secs;if(--secs>0)setTimeout("countDown("+secs+")",1000);}countDown(3);</script>
<%
htmlend
end sub
''''''''''''''''''''''''''''''
sub error(message)
if tophtml=empty then top
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
<td height=25>&nbsp;<img src=images/Forum_nav.gif>&nbsp; <a href=main.asp><%=clubname%></a> �� ������Ϣ</td>
</tr>
</table><br><SCRIPT>valigntop()</SCRIPT>
<table cellspacing="0" cellpadding="0" width="97%" align="center" border="0" class="a2"><tr><td height="106"><table cellspacing="1" cellpadding="6" width="100%" border="0"><tr><td width="100%" height="20" colspan="2" align="middle" class="a1">
<font face="����"><span id="lbTitle" style="FONT-WEIGHT: bold">������ʾ��Ϣ</span></font></td></tr><tr bgcolor="ffffff"><td valign="top" align="left" colspan="2" height="122"><b>&nbsp;</b><table cellspacing="0" cellpadding="5" width="100%" border="0"><tr><td width="83%" valign="top"><b>�������ɹ��Ŀ���ԭ��</b><ul><%=message%></ul></td><td width="17%"><img height="97" src="images/err.gif" width="95"></td></tr></table></td></tr><tr align="middle" bgcolor="ffffff"><td valign="center" colspan="2" height="2"><input onclick="history.back(-1)" type="submit" value=" &lt;&lt; �� �� �� һ ҳ " name="Submit"> </td></tr></table></td></tr></table>
<SCRIPT>valignbottom()</SCRIPT>
<%
htmlend
end sub
sub error2(message)
%><meta http-equiv="Content-Type" content="text/html;charset=gb2312"><p><script>alert('<%=message%>');history.back();</script>
<script>window.close();</script>
<%
responseend
end sub
''''''''''''''''''''''''''''''
sub htmlend
%><p>
<table cellspacing=0 cellpadding=0 width=97% align=center><tr><td align=middle>
<%=adcode%><br>Powered by <font color=ffffff> <a target=_blank href=http://www.bbsxp.com/download.asp><font color=000000>BBSxp <%=ver%></font></a></font>/<a  href=Licence.asp><font color=000000>Licence</font></a>&nbsp;&copy; 1998-2004<br>
Script Execution Time:<%=(timer()-startime)*1000%>ms
</td></tr></table></body></html><%
responseend
end sub

sub log(message)
conn.Execute("insert into log (username,ip,windows,remark) values ('"&Request.Cookies("username")&"','"&remoteaddr&"','"&Request.Servervariables("HTTP_USER_AGENT")&"','"&message&"')")
end sub

sub responseend
set rs=nothing
set rs1=nothing
set conn=nothing
Response.End
end sub

sub ForumTree(selec)
sql="Select * From bbsconfig where ID="&selec&""
Set Rs1=Conn.Execute(sql)
if not Rs1.eof then
ForumTreeList="<a href=ShowForum.asp?forumid="&Rs1("id")&">"&Rs1("bbsname")&"</a> �� "&ForumTreeList&""
ForumTree Rs1("followid")
end if
Set Rs1 = Nothing
end sub

sub BBSList(selec)
sql="Select * From bbsconfig where followid="&selec&" and hide=0 order by SortNum"
Set Rs1=Conn.Execute(sql)
do while not rs1.eof
Response.write "<option value="&rs1("ID")&">"&string(ii,"��")&""&rs1("bbsname")&"</option>"
ii=ii+1
BBSList rs1("id")
ii=ii-1
rs1.movenext
loop
Set Rs1 = Nothing
end sub

ii=0

startime=timer()
%>