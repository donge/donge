<!-- #include file="setup.asp" -->
<%
id=int(Request("id"))

forumid=Conn.Execute("Select forumid From forum where id="&id)(0)

if Request.Cookies("username")<>empty then membercode=Conn.Execute("Select membercode From [user] where username='"&Request.Cookies("username")&"'")(0)

sql="select * from bbsconfig where id="&forumid&""
Set Rs=Conn.Execute(sql)
bbsname=rs("bbsname")
moderated=rs("moderated")
logo=rs("logo")
pass=rs("pass")
followid=rs("followid")
password=rs("password")
rs.close


''''''''''��̳�涨��֤'''''''
if pass="0" then
error2("����̳��ʱ�رգ����ٽ��ܷ��ʣ�")
elseif pass="2" then
if Request.Cookies("username")=empty then error2("����δ��¼��̳")
elseif pass="3" then
if Request.Cookies("username")=empty then error2("����δ��¼��̳")
if membercode<2 and instr("|"&moderated&"|","|"&Request.Cookies("username")&"|")<=0 then error2("ֻ�������α����ϵȼ����������̳")
end if
if password<>Request.Cookies("password") and password<>empty then error2("����̳Ϊ������̳")
'''''''''''''''''''''''''''''
sql="select username from online where username<>'' and eremite<>1"
rs.Open sql,Conn
onlinelist="|"
Do While Not RS.EOF
onlinelist=""&onlinelist&""&rs("username")&"|"
rs.movenext
loop
rs.close



if Request("action")="next" then
sql="select top 1 * from forum where id > "&id&" and forumid="&forumid&" and deltopic<>1"
elseif Request("action")="Previous" then
sql="select top 1 * from forum where id < "&id&" and forumid="&forumid&" and deltopic<>1 order by id Desc"
else
sql="select * from forum where ID="&id&" and forumid="&forumid&""
end if
Set Rs=Conn.Execute(sql)

if rs.eof or rs.bof then error2"ϵͳ�����ڸ����ӵ�����"
if rs("deltopic")=1 and membercode<4 then error2"�����ⲻ���ڣ�"
%> <meta http-equiv="Content-Type" content="text/html;charset=gb2312">
<script>
if(top==self)self.location.href="ShowPost.htm"+document.location.search.substring()+"";
var badwords= "<%=badwords%>";
var onlinelist= "<%=onlinelist%>";
var badlist= "<%=badlist%>|<%=Request.Cookies("badlist")%>";
var moderated= "|<%=moderated%>|";
</script>
<script src="inc/ybb.js"></script>
<script src="inc/BBSxp.js"></script>
<script src="inc/birth.js"></script>
<title><%=rs("topic")%></title>
<link href="images/skins/<%=Request.Cookies("skins")%>/bbs.css" rel="stylesheet">
<script src="images/skins/<%=Request.Cookies("skins")%>/bbs.js"></script>
<body topmargin="0"><center>


<table cellspacing="1" cellpadding="1" width="99%" align="center" border="0" class="a2"><tr><td class="a1" width="80%">

<table cellSpacing=0 cellPadding=1 border=0 class=a2 width="100%">
<tr><td width="90%" class="a1">&nbsp;<img src="images/ie.gif" width="17" height="16"> <b>���⣺</b><%=rs("topic")%> - BBSxp Internet Explorer</td><td align="right" width="10%" class="a1"><a href="javascript:img();" title="��С��"><img border="0" src="images/bbs_off.gif"></a><a href="javascript:mid_f()" title="���»�ԭ"><img border="0" src="images/bbs_mid.gif" name="mid"></a><a href="loading.htm" title="�ر�"><img border="0" src="images/bbs_close.gif"></a></td></tr></table>


</td></tr></table>


<script>
function checkclick(msg){if(confirm(msg)){event.returnValue=true;onclick=document.location='loading.htm';}else{event.returnValue=false;}}

function emoticon(theSmilie){document.form.content.value += theSmilie + ' ';document.form.content.focus();}

function copyText(obj) {var rng = document.body.createTextRange();rng.moveToElementText(obj);rng.select();rng.execCommand('Copy');}
var i=0;
function formCheck(){
document.location='loading.htm'
}

function presskey(eventobject){
if(event.ctrlKey && window.event.keyCode==13){
document.location='loading.htm'
document.form.submit1.disabled = true;
this.document.form.submit();
}
}
var topic="<%=rs("topic")%>"
var topicid="<%=Request("ID")%>"
</script>
<br>




<table width="97%" align="center" border="0"><tr><td>
<SCRIPT>if ("<%=logo%>"!=''){document.write("<img border=0 src=<%=logo%> onload='javascript:if(this.height>60)this.height=60;'")}else{document.write("<img border=0 src=images/logo.gif>")}</SCRIPT>
</td>
<td align=right><%=banner%></td>
</tr></table><br>
	<table border="0" width="97%" align="center" cellspacing="1" cellpadding="4" class=a2>
		<tr class=a3>
			<td height="25">&nbsp;<img src=images/Forum_nav.gif>&nbsp; 
			
<script>

if(document.referrer.indexOf('main.asp') == -1 ){
document.write("<a onclick=document.location='loading.htm' target=yuzi_frame href=main.asp>")
}else{
document.write("<a href=loading.htm>")
}

document.write("<%=clubname%></a> �� <%ForumTree(followid)%><%=ForumTreeList%>")

if(document.referrer.indexOf('ShowForum.asp?forumid=<%=forumid%>') == -1 ){
document.write("<a onclick=document.location='loading.htm' target=yuzi_frame href=ShowForum.asp?forumid=<%=forumid%>>")
}else{
document.write("<a href=loading.htm>")
}
</script><%=bbsname%></a>


 �� <%=rs("topic")%></td>
		</tr>
	</table><br>
<table cellspacing="0" cellpadding="0" width="97%" align="center" border="0"><tr>
	<td height="35" valign="bottom"><a onclick="document.location='loading.htm';" target="yuzi_frame" href="newtopic.asp?forumid=<%=rs("forumid")%>"><img alt="����һ��������" src="images/skins/<%=Request.Cookies("skins")%>/post.gif" border="0"></a>��<a onclick="document.location='loading.htm';" target="yuzi_frame" href="retopic.asp?id=<%=rs("id")%>&topic=<%=rs("topic")%>"><img alt="�ظ�����" src="images/skins/<%=Request.Cookies("skins")%>/reply.gif" border="0"></a></td><td align="right" height="35" valign="bottom"><font color="333333">���Ǳ����� <b><%=rs("views")%></b> ���Ķ���</font>����<a href="?action=Previous&id=<%=rs("id")%>"><img height="12" alt="�����һƪ����" src="images/prethread.gif" width="52" border="0"></a>��<a style="text-decoration: none" href="javascript:location.reload()"><img height="12" alt="ˢ�±�����" src="images/refresh.gif" width="40" border="0"></a>��<a href="?action=next&id=<%=rs("id")%>"><img height="12" alt="�����һƪ����" src="images/nextthread.gif" width="52" border="0"></a></font></td></tr></table>

<SCRIPT>valigntop()</SCRIPT>

<table width="97%" border="0" cellspacing="1" class="a2" height="21"><tr class="a1"><td width="87%" height="18">��<b>����</b>��<%=rs("topic")%></td><td width="13%" align="right" height="18"><a href="javascript:window.print()"><img alt="��ʾ�ɴ�ӡ�İ汾" src="images/printpage.gif" border="0"></a>&nbsp; 
	<a target="_blank" href="sendfriend.asp?title=<%=rs("topic")%>"><img alt="����ҳ������������" src="images/sendmail.gif" border="0"></a>&nbsp; <a href="javascript:window.external.AddFavorite(location.href,document.title)"><img alt="�ѱ�������IE�ղؼ�" src="images/fav_add.gif" border="0"></a>&nbsp; </td></tr></table>
<%
if Request("topage")<2 then
content=replace(rs("content"),chr(34),"'")
'''''''ͶƱ''''''''
if rs("polltopic")<>"" then
if rs("multiplicity")=1 then
multiplicity="checkbox"
else
multiplicity="radio"
end if
content=""&content&"<form action=postvote.asp?id="&rs("id")&" method=POST><table><tr><td><table>"
vote=split(rs("polltopic"),"|")
for i = 0 to ubound(vote)
if not vote(i)="" then
content=""&content&"<tr><td height=22 valign=bottom>"&i+1&".<input type="&multiplicity&" value="&i&" name=postvote id=postvote"&i&"><label for=postvote"&i&">"&vote(i)&"</label></td></tr>"
end if
next
content=""&content&"</table></td><td><table>"
allticket=0
vote=split(rs("pollresult"),"|")
for i = 0 to ubound(vote)
if not vote(i)="" then
content=""&content&"<tr><td height=22 valign=bottom>Ʊ����"&vote(i)&"</td></tr>"
allticket=vote(i)+allticket
end if
next
content=""&content&"</table></td><td><table>"
vote=split(rs("pollresult"),"|")
for i = 0 to ubound(vote)
if not vote(i)="" and allticket<>0 then
content=""&content&"<tr><td height=22 valign=bottom><img src=images/bar1.gif width="&vote(i)/allticket*100&" height=10> ["&formatnumber(vote(i)/allticket*100)&"%]</td></tr>"
end if
next
content=""&content&"</table></td></tr><TR><TD align=center><INPUT type=submit value=' Ͷ Ʊ '></TD><td colspan=5 align=center><a href=postvote.asp?menu=look&id="&id&">[�鿴���ղ���ͶƱ���û��б�]</a></td></TR></table></form>"
end if


'''''''����ͶƱ''''''''
sql="select * from [user] where username='"&rs("username")&"'"
Set Rs1=Conn.Execute(sql)
postcount=rs1("posttopic")+rs1("postrevert")
sign=replace(""&rs1("sign")&"",chr(34),"'")
%>
<script>ShowPost("yuzi","<%=rs("username")%>","<%=content%>","<%=rs("posttime")%>","<%=rs1("honor")%>","<%=rs1("userface")%>","<%=rs1("sex")%>","<%=rs1("birthday")%>","<%=rs1("experience")%>","<%=rs1("membercode")%>","<%=rs1("faction")%>","<%=rs1("consort")%>","<%=rs1("money")%>","<%=postcount%>","<%=rs1("regtime")%>","<%=rs1("userlife")%>","<%=rs1("usermail")%>","<%=rs1("userhome")%>","<%=sign%>");</script>
<%
end if
Set Rs1 = Nothing

id=rs("id")
act=rs("topic")
replies=rs("replies")
locktopic=rs("locktopic")
goodtopic=rs("goodtopic")
toptopic=rs("toptopic")
rs.close


if replies > 0 then
pagesetup=15 '�趨ÿҳ����ʾ����
TotalPage=cint(replies/pagesetup)  '��ҳ��
if TotalPage < replies/pagesetup then TotalPage=TotalPage+1
PageCount = cint(Request.QueryString("ToPage"))
if PageCount < 1 then PageCount = 1
if PageCount > TotalPage then PageCount = TotalPage

sql="select * from reforum where topicid="&id&" order by id"
rs.Open sql,Conn,1
rs.pagesize=pagesetup   'ÿҳ��ʾ����
on error resume next 'ָ��ҳ��������ʱ ���Դ���
rs.absolutepage=PageCount '��ת��ָ��ҳ��

i=0
Do While Not RS.EOF and i<pagesetup
i=i+1
if Not Response.IsClientConnected then responseend

sql="select * from [user] where username='"&rs("username")&"'"
Set Rs1=Conn.Execute(sql)
sign=replace(""&rs1("sign")&"",chr(34),"'")
content=replace(rs("content"),chr(34),"'")
postcount=rs1("posttopic")+rs1("postrevert")
%><script>var i=<%=i+(PageCount-1)*pagesetup%>;ShowPost("<%=rs("id")%>","<%=rs("username")%>","<%=content%>","<%=rs("posttime")%>","<%=rs1("honor")%>","<%=rs1("userface")%>","<%=rs1("sex")%>","<%=rs1("birthday")%>","<%=rs1("experience")%>","<%=rs1("membercode")%>","<%=rs1("faction")%>","<%=rs1("consort")%>","<%=rs1("money")%>","<%=postcount%>","<%=rs1("regtime")%>","<%=rs1("userlife")%>","<%=rs1("usermail")%>","<%=rs1("userhome")%>","<%=sign%>");</script>
<%
Set Rs1 = Nothing
RS.MoveNext
loop
RS.Close

if i=0 then
replies=conn.execute("Select count(id)from reforum where topicid="&id&"")(0)
conn.execute("update [forum] set replies="&replies&" where id="&id&"")
end if

end if


if TotalPage=0 then
TotalPage=1
PageCount=1
end if
%>
<SCRIPT>valignbottom()</SCRIPT>

<table cellspacing="4" cellpadding="0" width="97%" border="0" style="border-collapse: collapse" bordercolor="111111"><tr><td width="61%"><b>�����⹲�� <font color="990000"><%=TotalPage%></font> ҳ</b></td><td width="39%" align="right">ҳ��[
<b>
<script>


PageCount=<%=TotalPage%> //��ҳ��
topage=<%=PageCount%>   //��ǰͣ��ҳ

for (var i=1; i <= PageCount; i++) {
if (i <= topage+3 && i >= topage-3 || i==1 || i==PageCount){
if (i > topage+4 || i < topage-2 && i!=1 && i!=2 ){document.write(" ... ");}
if (topage==i){document.write(" "+ i +" ");}
else{
document.write("<a href=?id=<%=id%>&topage="+i+">"+ i +"</a> ");
}
}
}
</script>
</b>

 ] </td></tr></table>
<script>if(document.referrer.indexOf('ShowPost.htm') != -1 ){document.cookie="forumid=<%=forumid%>"}</script>
<%if Request.Cookies("username")<>"" then%> <form name="form" method="post" action="retopic.asp" target="yuzi_frame" onsubmit="return formCheck()"><input type="hidden" value="<%=id%>" name="id">
<input type=hidden name=username value="<%=Request.Cookies("username")%>">
<input type=hidden name=userpass value="<%=Request.Cookies("userpass")%>">
<input type="hidden" value="<%=act%>" name="topic">
<SCRIPT>valigntop()</SCRIPT>


<table cellspacing="1" cellpadding="5" width="97%" border="0" class="a2"><tr><td width="20%" height="20" class="a1"><b>&nbsp;���ٻظ�����</b></td><td class="a1" width="80%"><b><%=act%></b></td></tr><tr><td class="a4" valign="bottom"><b>&nbsp;�û���</b>��<%=Request.Cookies("username")%> [<a onclick="document.location='loading.htm';" target="yuzi_frame" href="login.asp?menu=out"><font color="000000">�˳�</font></a>]<br></td><td valign="top" class="a4" rowspan="2"><textarea name="content" style="width:95%" rows="6" onkeydown="presskey()"></textarea> <br><input tabindex="4" type="submit" value="Ctrl+Enter �ظ�����" name="submit1">����<input name=preview type="submit" value=" Ԥ �� ">����<input type="reset" value=" �� д " name="reset" onclick="{if(confirm('�������Ҫ���ȫ�������ݣ���ȷ��Ҫ�����?')){return true;}return false;}"></td></tr><tr>
			<td class="a4">
			
<TABLE cellSpacing=1 cellPadding=3 border=0>
<TR>
<script>
ii=0
for(i=1;i<=18;i=i+1) {
index = Math.floor(Math.random() * 80+1);
ii=ii+1
document.write("<TD><a href=javascript:emoticon('[em"+index+"]')><img border=0 src=images/Emotions/"+index+".gif></a></TD>")
if (ii==6){document.write("</TR><TR>");ii=0;}
}
</script>
</TR></TABLE>
</td></tr></table>
<SCRIPT>valignbottom()</SCRIPT>

</form><table cellspacing="0" cellpadding="0" width="97%" align="center" border="0"><tr><td align="middle">����ѡ��: <%
response.write "<a onclick=document.location='loading.htm'; target=yuzi_frame href=manage.asp?menu=movenew&id="&id&">��ǰ����</a> | "
if locktopic=1 then
response.write "<a onclick=document.location='loading.htm'; target=yuzi_frame href=manage.asp?menu=dellocktopic&id="&id&">��������</a>"
else
response.write "<a onclick=document.location='loading.htm'; target=yuzi_frame href=manage.asp?menu=locktopic&id="&id&">�ر�����</a>"
end if
response.write " | "
if toptopic=2 then
response.write "<a onclick=document.location='loading.htm'; target=yuzi_frame href=manage.asp?menu=untop&id="&id&">ȡ�����ö�</a>"
else
response.write "<a onclick=document.location='loading.htm'; target=yuzi_frame href=manage.asp?menu=top&id="&id&">�������ö�</a>"
end if
response.write " | "
if toptopic=1 then
response.write "<a onclick=document.location='loading.htm'; target=yuzi_frame href=manage.asp?menu=deltoptopic&id="&id&">ȡ���ö�</a>"
else
response.write "<a onclick=document.location='loading.htm'; target=yuzi_frame href=manage.asp?menu=toptopic&id="&id&">�����ö�</a>"
end if
response.write " | "
if goodtopic=1 then
response.write "<a onclick=document.location='loading.htm'; target=yuzi_frame href=manage.asp?menu=delgoodtopic&id="&id&">�Ƴ�������</a>"
else
response.write "<a onclick=document.location='loading.htm'; target=yuzi_frame href=manage.asp?menu=goodtopic&id="&id&">��ӵ�������</a>"
end if
%>| <a onclick="document.location='loading.htm';" target="yuzi_frame" href="move.asp?id=<%=id%>">�ƶ�����</a> | <a onclick="checkclick('��ȷ��Ҫɾ������?');" target="yuzi_frame" href="manage.asp?menu=deltopic&id=<%=id%>">ɾ������</a> </td></tr></table><%end if%> <script>
document.write("<DIV id=yuzi style='POSITION:absolute;TOP:3px;right:12pt'><a href=loading.htm title='�ر�'><img border=0 src='images/bbs_close.gif'></a></div>");
lastScrollY=0;
window.setInterval("heartBeat()",1);
</script>
<%

if instr(Request.ServerVariables("http_referer"),"ShowPost.asp?id="&id&"") = 0 then
conn.execute("update [forum] set Views=Views+1 where id="&id&"")

acturl="ShowPost.asp?id="&id&""
if Request.Cookies("username")<>""then userface=Conn.Execute("Select userface From [user] where username='"&Request.Cookies("username")&"'")(0)
%><!-- #include file="inc/line.asp" --><%
end if

htmlend



sub ForumTree(selec)
sql="Select * From bbsconfig where ID="&selec&""
Set Rs1=Conn.Execute(sql)
if not Rs1.eof then
ForumTreeList="<a onclick=document.location='loading.htm' target=yuzi_frame href=ShowForum.asp?forumid="&Rs1("id")&">"&Rs1("bbsname")&"</a> �� "&ForumTreeList&""
ForumTree Rs1("followid")
end if
Set Rs1 = Nothing
end sub
%>