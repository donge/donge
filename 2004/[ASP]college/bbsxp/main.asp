<!-- #include file="setup.asp" -->
<%
id=int(Request("id"))
if ""&adminpassword&""=empty then response.redirect "install.asp"
top
if Application(CacheName&"CountForum")=empty then Application(CacheName&"CountForum")=conn.execute("Select count(id)from [forum]")(0)
if Application(CacheName&"CountReforum")=empty then Application(CacheName&"CountReforum")=conn.execute("Select count(id)from [Reforum]")(0)
if Application(CacheName&"CountUser")=empty then Application(CacheName&"CountUser")=conn.execute("Select count(id)from [user]")(0)
if ""&nowdate&""<>""&date()&"" then
today=conn.execute("Select SUM(today)from bbsconfig")(0)
if ""&today&""="" then today=0
conn.execute("update [clubconfig] set today=0,oldday="&today&",Nowdate='"&date()&"'")
conn.execute("update [bbsconfig] set today=0")
end if
%><title><%=clubname%> - Powered By BBSxp</title>
<SCRIPT>if(top==self)document.location='main.htm';</SCRIPT>


<table width=97% align=center border=0>
<tr>
<td width=25%>
<img src=images/logo.gif border=0></td>
<td align=right><%=banner%></td>
</tr>
</table><br>
<SCRIPT>valigntop()</SCRIPT>
<table cellspacing="1" cellpadding="2" width="97%" align="center" border="0" class="a2" id="table1"><tr class="a1" height=25>
	<td width="94%" colspan="4">&nbsp;<img src=images/announce.gif align="absbottom"> <marquee onmouseover="this.stop()" onmouseout="this.start()" width="80%" scrollamount="3"><a style=cursor:hand onclick="javascript:open('affiche.asp','','width=400,height=180,resizable,scrollbars')"><%=affichetitle%></a>����<%=affichetime%>��</marquee></td><tr class=a3>
	

			<td height="25" align="center" width="10%" rowspan="2">
			
<SCRIPT>
if ("<%=userface%>"==""){
index = Math.floor(Math.random() * 84+1);
document.write("<img src=images/face/" + index + ".gif>");
}else{
document.write("<img src=<%=userface%> onload='javascript:if(this.height>100)this.height=100'>");
}
</SCRIPT></td>
	

			<td align="center"> 

<%
if Request.Cookies("username") = empty then
%>
<form action="login.asp" method="post">
<input type="hidden" value="add" name="menu">
<input type="hidden" value="main.asp" name="url">
<table border="0" width="100%">
	<tr>
		<td align="center">�û�����:
<input size="15" name="username" value="<%=Request.Cookies("username")%>"></td>
		<td>

<input type="checkbox" value="1" name="eremite" id="eremite"><label for="eremite">�����¼</label> 
		</td>
		<td align="center">

<input type="submit" value=" ��¼ " name="Submit1"></td>
	</tr>
	<tr>
		<td align="center">

�û�����: <input type="password" size="15" value name="userpass"></td>
		<td> 

<input type="checkbox" value="1" name="xuansave" id="xuansave"><label for="xuansave">��ס����</label>��
</td>
		<td align="center"> <input type="reset" value=" ȡ�� " name="Submit"></td>
	</tr></form>
</table>
<%
else%>

<div align="center">

<table border="0" width="100%">
	<tr>
		<td>&nbsp;::
		<a href="friend.asp">�ҵĺ���</a></td>
		<td>&nbsp;::
		<a onclick="javascript:open('message.asp?menu=post','','width=320,height=170')" href="#">���Ͷ���</a></td>
		<td>&nbsp;::
		<a href="upface.asp">�ϴ�ͷ��</a></td>
	</tr>
	<tr>
		<td>&nbsp;::
		<a href="ShowBBS.asp?menu=5">�ҵ�����</a></td>
		<td>&nbsp;::
		<a href="favorites.asp">�ҵ��ղ�</a></td>
		<td>&nbsp;::
		<a href="upphoto.asp">�ϴ���Ƭ</a></td>
	</tr>
	<tr>
		<td>&nbsp;::
		<span style="text-decoration: none"><a href="calendar.asp">�ҵ��ռ�</a></span></td>
		<td>&nbsp;::
		<a href="popedom.asp">�ҵ�Ȩ��</a></td>
		<td>&nbsp;::
		<a href="login.asp">�����û�</a></td>
	</tr>
</table>

</div>

<%
end if
%>
			</td>
	

			<td> 
<div align="center">

<table border="0" width="100%" id="table2">
	<tr>
		<td>ע���Ա:<b><%=Application(CacheName&"CountUser")%></b></td>
		<td><%
if Application(CacheName&"NewUserName")<>empty then response.write "�½���Ա:<b><a href=Profile.asp?username="&Application(CacheName&"NewUserName")&">"&Application(CacheName&"NewUserName")&"</a></b>"
%></td>
	</tr>
	<tr>
		<td>��������:<b><%=Application(CacheName&"CountForum")%></b></td>
		<td>��������:<b><%=Application(CacheName&"CountReforum")%></b></td>
	</tr>
	<tr>
		<td>��������:<b><font color=red><%=today%></font></b></td>
		<td>��������:<b><%=oldday%></b></td>
	</tr>
	</table>

</div>
</td>
	

			<td height="25" align="center" width="10%" rowspan="2"> 
<embed src=images/Clock.swf width=100 height=80 wmode=transparent></td>
		</tr>
	<tr class=a3><td height="12" align="center" width="78%" colspan="2"> 
<font face=Wingdings>v</font> <a href="ShowBBS.asp?menu=2">������������</a> 
<font face=Wingdings>v</font> <a href="ShowBBS.asp?menu=1">������������</a>
<font face=Wingdings>v</font> <a href="ShowBBS.asp">��������</a>  
<font face=Wingdings>v</font> <a href="ShowBBS.asp?menu=3">��������</a>  
<font face=Wingdings>v</font> <a href="ShowBBS.asp?menu=4">ͶƱ����</a> 
<font face=Wingdings>v</font></td>
	

		</tr>
	</table>
	
	
<SCRIPT>valignbottom()</SCRIPT>

	<br>


<SCRIPT>valigntop()</SCRIPT>

<table width="97%" align="center" border="0" class="a2" cellspacing=1 cellpadding=0><%
if Request.Cookies("forumid")<>empty then
sql="select * from bbsconfig where id="&Request.Cookies("forumid")&" and hide=1"
Set Rs=Conn.Execute(sql)
if not Rs.eof then
if ""&Rs("password")&""="" then:password=0:else:password=1:end if
%><script>ShowList("<%=Rs("pass")%>","<%=Rs("id")%>","<%=Rs("bbsname")%>","<%=Rs("icon")%>","<%=Rs("intro")%>","<%=Rs("moderated")%>","<%=Rs("today")%>","<%=Rs("toltopic")%>","<%=Rs("tolrestore")%>","<%=Rs("lasttime")%>","<%=Rs("lastname")%>","<%=Rs("lasttopic")%>","<%=password%>");</script>
<%
end if
Rs.close
end if
ForumList(0)
%> </table>

<SCRIPT>valignbottom()</SCRIPT>
<br>
<SCRIPT>valigntop()</SCRIPT>
<table cellspacing="1" cellpadding="1" width="97%" align="center" border="0" class="a2"><tr><td height="25" class="a1" colspan="2">����<b> </b>���ĸ���״̬</td></tr><tr>
		<td align="middle" width="5%" bgcolor=FFFFFF><img src="images/mystate.gif"></td><td class="a4"><table cellspacing="0" cellpadding="3" width="100%" border="0" style="border-left: 0px none; border-top: 0px none; border-bottom: 1px none"><tr><td><table border="0" cellpadding="0" cellspacing="0" width="100%"><%
if Request.Cookies("username") <> "" then

sql="select * from [user] where username='"&Request.Cookies("username")&"'"
rs.Open sql,Conn


%> <tr><td width="25%"><%=rs("username")%> - �� <font face="Georgia, Times New Roman, Times, serif"><%=rs("newmessage")%> ��������</font></td><td width="20%">��ң�<font face="Georgia, Times New Roman, Times, serif"><%=rs("money")%></font></td><td width="20%">������<font face="Georgia, Times New Roman, Times, serif"><%=rs("userlife")%></font></td><td width="17%">�������£�<font face="Georgia, Times New Roman, Times, serif"><%=rs("posttopic")%></font></td><td width="18%">��ɾ���£�<font face="Georgia, Times New Roman, Times, serif"><%=rs("deltopic")%></font></td></tr><tr><td>�ȼ����ƣ�<Script>document.write(level(<%=rs("experience")%>,<%=rs("membercode")%>,'','')+levelname);</Script></td><td>��<font face="Georgia, Times New Roman, Times, serif"><%=rs("savemoney")%></font></td><td>���飺<font face="Georgia, Times New Roman, Times, serif"><%=rs("experience")%></font></td><td>�ظ����£�<font face="Georgia, Times New Roman, Times, serif"><%=rs("postrevert")%></font></td><td>�������£�<font face="Georgia, Times New Roman, Times, serif"><%=rs("goodtopic")%> </font></td></tr><%
rs.close
end if
acturl="main.asp"
bbsname=clubname
forumid=0

%> <!-- #include file="inc/line.asp" --><tr><td>
<script>
temp=navigator.appVersion
temp=temp.replace(")","");
temp=temp.replace("MSIE","Internet Explorer");
temp=temp.replace("NT 5.0","2000");
temp=temp.replace("NT 5.1","XP");
temp=temp.replace("NT 5.2","2003");
var appVersion= temp.split ('; '); 
</script>
���ģɣУ�<font face="Georgia, Times New Roman, Times, serif"><%=remoteaddr%></font></td><td>�˿ڣ�<font face="Georgia, Times New Roman, Times, serif"><%=Request.ServerVariables("REMOTE_PORT")%></font></td><td>����ϵͳ��<script>document.write(appVersion[2])</script></td><td colspan="2">�������<script>document.write(appVersion[1])</script></td></tr></table></td></tr></table></td></tr></table><%
regonline=conn.execute("Select count(sessionid)from online where username<>''")(0)

if Application(CacheName&"BestOnline")<onlinemany then
Application(CacheName&"BestOnline")=onlinemany
Application(CacheName&"BestOnlineTime")=now()
end if
%><SCRIPT>valignbottom()</SCRIPT>
<br>
<SCRIPT>valigntop()</SCRIPT><table cellspacing="1" cellpadding="0" width="97%" align="center" border="0" class="a2"><tr><td height="25" class="a1" colspan="2">��<b>�� </b>����ͳ��</td></tr><tr><td align="middle" width="5%" bgcolor=FFFFFF><img src="images/online.gif"></td><td valign="top" class="a4"><table cellspacing="0" cellpadding="3" width="100%"><tr><td height="15">&nbsp;<img loaded="no" src="images/plus.gif" id="followImg0" style="cursor:hand;" onclick="loadThreadFollow(0,<%=forumid%>)"> Ŀǰ��̳�ܹ��� <b><%=onlinemany%></b> �����ߡ�����ע���û� <b><%=regonline%></b> �ˣ��ÿ� <b><%=onlinemany-regonline%></b> 
	�ˡ������������ <font color=red><b><%=Application(CacheName&"BestOnline")%></b></font> �ˣ������� <b><%=Application(CacheName&"BestOnlineTime")%></b> </td></tr><tr height="25" style="display:none" id="follow0"><td id="followTd0" align="left" class="a4" width="94%" colspan="5"><div onclick="loadThreadFollow(0,<%=forumid%>)"><table width="100%" cellpadding="10"><tr><td width="100%">Loading...</td></tr></table></div></td></tr></table></td></tr></table>

<SCRIPT>valignbottom()</SCRIPT>
<br>
<SCRIPT>valigntop()</SCRIPT>
<table cellspacing="1" cellpadding="5" width="97%" border="0" class="a2" align="center"><tr><td height="25" colspan="2" class="a1">����<b> </b>��������</td></tr><tr>
<td align="center" bgcolor=FFFFFF width="5%" rowspan="2"><img src="images/shareforum.gif"></td>
<td class="a4"><%
rs.Open "link",Conn
do while not rs.eof
if rs("logo")="" or rs("logo")="http://" then
link1=link1+"<a title='"&rs("intro")&"' href="&rs("url")&" target=_blank>"&rs("name")&"</a> "
else
link2=link2+"<a title='"&rs("name")&""&chr(10)&""&rs("intro")&"' href="&rs("url")&" target=_blank><img src="&rs("logo")&" border=0 width=88 height=31></a> "
end if
rs.movenext
loop
rs.close
%>
<%=link1%>
</td></tr><tr>
<td class="a4"><%=link2%></td></tr></table>
<SCRIPT>valignbottom()</SCRIPT>
<br>
<center>&nbsp;<img src="images/pass0.gif" alt="��ֹ�������">&nbsp;�ر���̳&nbsp;&nbsp;<img src="images/pass1.gif" alt="�����������">&nbsp;������̳&nbsp;&nbsp;<img src="images/pass4.gif" alt="��Ҫ����������">&nbsp;������̳&nbsp;&nbsp;<img src="images/pass2.gif" alt="ֻ�е�½�û������������">&nbsp;��Ա��̳&nbsp;&nbsp;<img src="images/pass3.gif" alt="�α����ϵĵȼ������������">&nbsp;�α���̳
<br>

<%
htmlend


sub ForumList(selec)
sql="Select * From bbsconfig where followid="&selec&" and hide=0 order by SortNum"
Set Rs1=Conn.Execute(sql)
do while not Rs1.eof
if ii=0 then
%>
<tr <%if floor<2 then%>bgcolor=ffffff<%else%>class=a1 id=TableTitleLink<%end if%>><td colspan=7 height=25><b>��<img src=images/1.gif> <a href=ShowForum.asp?forumid=<%=Rs1("id")%>><%=Rs1("bbsname")%></a></b></td></tr></a>
<%
else
if ""&Rs1("password")&""="" then:password=0:else:password=1:end if
%><script>ShowList("<%=Rs1("pass")%>","<%=Rs1("id")%>","<%=Rs1("bbsname")%>","<%=Rs1("icon")%>","<%=Rs1("intro")%>","<%=Rs1("moderated")%>","<%=Rs1("today")%>","<%=Rs1("toltopic")%>","<%=Rs1("tolrestore")%>","<%=Rs1("lasttime")%>","<%=Rs1("lastname")%>","<%=Rs1("lasttopic")%>","<%=password%>");</script>
<%
end if

ii=ii+1
if ii < int(floor) then ForumList Rs1("id")
ii=ii-1

Rs1.movenext
loop
Set Rs1 = Nothing
end sub


%>