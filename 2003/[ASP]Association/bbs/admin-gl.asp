<!--#include file="conn.asp"-->
<link rel="stylesheet" type="text/css" href="css.css">
<%set bbs=myconn.execute("select*from bbsinfo")
c1=bbs(1)
c2=bbs(2)
set bbs=nothing
lgname=Request.Cookies("lgname")
lgpwd=request.cookies("lgpwd")
set cjbz=myconn.execute("select name from admin where name='"&lgname&"' and password='"&lgpwd&"' and bd='70767766'")
if cjbz.eof then
noyes="�� ½ ʧ �� ��"
mes="�㲻�ܽ����̨����<br>�������ڵ�½��̳���û��� "&lgname&" ���ǹ���Ա����"%>
<!--#include file="mes.asp"-->
<%response.end
else
t1="<div align=center><center><table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor=#111111 width=94% ><tr><td width=50% background=pic/5.gif><img border=0 src=pic/9.gif align=absbottom><font color=#FFFFFF><b>"
t2="</b></font></td><td width=50% background=pic/7.gif><img border=0 src=pic/6.gif></td></tr></table></center></div>"
d1="<div align=center><center><table border=1 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor="&c1&" width=94% ><tr><td width= 100% ><P style='MARGIN: 15px'>"
d2="</p></td></tr></table></center></div>"
menu=request.querystring("menu")%>
<body topmargin="0" leftmargin="0"><style>TABLE {BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 1px; }TD {BORDER-RIGHT: 0px; BORDER-TOP: 0px;}</style>
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="100%" bordercolor=<%=c1%>>
  <tr>
    <td width="100%" height="28" background="pic/8.gif" align="center">
    <b><font color="#FFFFFF">��̳��̨����ϵͳ</font></b></td>
  </tr>
  </table><br>
<%select case menu%>
<%case"bzgl"
go=request.querystring("go")
name=Replace(Request.form("name"),"'","''")
bd=Request.Form("bd")
set add=myconn.execute("SELECT*FROM user where name='"&name&"'")
if add.eof and add.bof then%>
<%=t1%>�� �� �� Ϣ<%=t2&d1%>��û������û���<%=d2%>
<%
else
if go="add" then
pwd=add("password")
myconn.execute("insert into admin(name,password,bd)VALUES('"&name&"','"&pwd&"','"&bd&"')")
%>
<%=t1%>�� �� �� ��<%=t2&d1%>��������ӳɹ���<%=d2%><%
response.end
end if
if go="del" then
myconn.execute("delete*from admin where name='"&name&"' and bd='"&bd&"'")%>
<%=t1%>ɾ �� �� ��<%=t2&d1%>������ɾ���ɹ���<%=d2%><%
response.end
end if
end if
set add=nothing
%>
<%case"addbbs"%>
<%bbsbn=request.querystring("bbsbn")
set bf=myconn.execute("select*from bdinfo where key='0' order by bn")
if bf.eof then
noyes="�� �� �� Ϣ ��"
mes="<br>��û�з��಻�������̳������<a href=admin-right.asp?action=addfl>>>��ӷ���</a><br><br>"%>
<!--#include file="mes.asp"-->
<%
response.end
set bf=nothing
end if
%>
<%
bn=request.form("bn")
bdname=Replace(Request.Form("bdname"),"'","''")
bdinfo=Replace(Request.Form("bdinfo"),"'","''")
picurl=request.form("picurl")
key=request.form("key")
bbstype=request.form("bbstype")
if bn="" or bn="0" or bdname="" or bdinfo="" or key="" or key=0 or not isnumeric(bn) then
%>
<form method="POST">
<%response.write""&t1&"�� ̳ �� ��"&t2&""
%>
<%=d1%><P style='MARGIN: 5px'>��̳��ţ�<input type="text" name="bn" size="25"><font color=#FF0000>��</font>ֻ���� <b>0</b> ���������
</p><P style='MARGIN: 5px'>��̳���ƣ�<input type="text" name="bdname" size="25"><font color="#FF0000">��</font>������</p>
<P style='MARGIN: 5px'>��־ͼƬ��<input type="text" name="picurl" size="49">������ʾ����̳���ұߣ����Բ��</p>
<P style='MARGIN: 5px'>��̳���ܣ�<br><textarea rows="4" name="bdinfo" cols="58"></textarea><font color="#FF0000">��</font></p>
<P style='MARGIN: 5px'>���ڷ��ࣺ<select size="1" name="key" style="font-size: 9pt">
<%do while not bf.eof%><%if bf("bn")=bbsbn then%><option value="<%=bf("bn")%>" selected><%=bf("bdname")%></option><%else%>
<option value="<%=bf("bn")%>"><%=bf("bdname")%></option><%end if%>
<%
bf.movenext
Loop
bf.Close
set bf=nothing
%>
</select><font color="#FF0000">��</font>��ѡ�����̳������һ�ַ���</p><br><P style='MARGIN: 4px'>
��̳���ͣ�(������������ѡ��һ��)</p><P style='MARGIN: 4px'><input type="radio" value="nopwd" name="bbstype" checked>��ͨ��̳
��ע���û��������ɵĽ����������̳�����Ƽ�����<P style='MARGIN: 4px'><input type="radio" value="pwdpass" name="bbstype">��֤��̳
��ֻ�а�����֤��ע���û����ܽ����������̳��</p><br>
<P style='MARGIN: 4px'><input type="submit" value=" �� �� " name="B1"> <input type="reset" value=" �� �� " name="B2"></p><br><%=d2%>
</form>
<%
else
set bbsyn=myconn.execute("select bn from bdinfo where bn='"&bn&"' and key<>'0'")
if not bbsyn.eof then
noyes="�� �� �� Ϣ ��"
mes="<br>����̳��� <b>"&bn&"</b> �Ѿ����ڣ�����ѡ������̳���<br><br>"%>
<!--#include file="mes.asp"--><%
response.end
end if
set bbsyn=nothing
if bbstype="nopwd" then
myconn.execute("insert into bdinfo(bn,bdname,bdinfo,picurl,key)values('"&bn&"','"&bdname&"','"&bdinfo&"','"&picurl&"','"&key&"')")
noyes="�� �� �� �� ��"
mes="<br>�������̳�ɹ���<br><br>"
elseif bbstype="pwdpass" then
myconn.execute("insert into bdinfo(bn,bdname,bdinfo,picurl,key,pass)values('"&bn&"','"&bdname&"','"&bdinfo&"','"&picurl&"','"&key&"','"&lgname&"')")
noyes="�� �� �� �� ��"
mes="<br>�������̳�ɹ�,����̳Ϊ��֤��̳����ʱֻ�й���Ա�ܹ����롣<br>�������ͨ�� <a href=admin-gl.asp?menu=bbsgl>����</a> ��Ŀ����ӿ��Խ������̳���û�<br><br>"
end if
%><!--#include file="mes.asp"-->
<%end if%>
<%case"addadmin"
adminname=Replace(Request.Form("adminname"),"'","''")
set isadd=myconn.execute("select*from admin where name='"&adminname&"' and bd='70767766'")
if not isadd.eof then
iadd="yes"
end if
set isadd=nothing
set yon=myconn.execute("select*from user where name='"&adminname&"'")
if yon.eof or iadd="yes" then
%><%=t1%>�� �� �� Ϣ<%=t2&d1%>�����û����Ѿ��ǹ���Ա���߻�û��<a target="_blank" href="zhuce.asp">ע��</a>��<%=d2%>
<%else
pwd=yon("password")
myconn.execute("insert into admin(name,password,bd)values('"&adminname&"','"&pwd&"','70767766')")
%><%=t1%>�� �� �� ��<%=t2&d1%>���Ѿ��ɹ�����ӹ���Ա <%=adminname%> ��<br><%=d2%><%end if
set yon=nothing%>
<%case"deladmin"
adminname=Replace(Request.Form("adminname"),"'","''")
yon=myconn.execute("select count(name) from admin where bd='70767766'")(0)
if yon<=1 then
%><%=t1%>�� �� �� Ϣ<%=t2&d1%>����̳����Ҫ��һ������Ա��<%=d2%>
<%else
myconn.execute("delete*from admin where name='"&adminname&"' and bd='70767766'")
%><%=t1%>ɾ �� �� ��<%=t2&d1%>���Ѿ��ɹ���ɾ������Ա <%=adminname%> ��<br><%=d2%><%end if%>
<%case"updatebbs"
bn=request.querystring("bn")
bdname=Replace(Request.Form("bdname"),"'","''")
bdinfo=Replace(Request.Form("bdinfo"),"'","''")
picurl=request.form("picurl")
key=request.form("key")
bbstype=request.form("bbstype")
if bdname="" or bdinfo="" then
%><%=t1%>�� �� �� Ϣ<%=t2&d1%>������д��������<font color="#FF0000">��</font>����Ŀ��<%=d2%><%else
if bbstype="nopwd" then
myconn.execute("update [bdinfo] set bdname='"&bdname&"',bdinfo='"&bdinfo&"',picurl='"&picurl&"',key='"&key&"',pass='' where bn='"&bn&"' and key<>'0'")
elseif bbstype="pwdpass" then
set dfdf=myconn.execute("select pass from bdinfo where bn='"&bn&"' and key<>'0'")
if dfdf("pass")<>"" then
myconn.execute("update [bdinfo] set bdname='"&bdname&"',bdinfo='"&bdinfo&"',picurl='"&picurl&"',key='"&key&"' where bn='"&bn&"' and key<>'0'")
else
myconn.execute("update [bdinfo] set bdname='"&bdname&"',bdinfo='"&bdinfo&"',picurl='"&picurl&"',key='"&key&"',pass='"&lgname&"' where bn='"&bn&"' and key<>'0'")
end if
end if
%><%=t1%>�� �� �� ��<%=t2&d1%>���Ѿ��ɹ����޸��˸ð������Ϣ��<%=d2%>
<%end if%>
<%case"addpassuser"
user=Replace(Request.Form("user"),"'","''")
bn=request.querystring("bn")
myconn.execute("update bdinfo set pass='"&user&"' where bn='"&bn&"' and key<>'0'")
%><%=t1%>�� �� �� ��<%=t2&d1%>���Ѿ��ɹ����������֤�û���<%=d2%>

<%case"deluser"%>
<%
delname=Replace(Request.form("delname"),"'","''")
set add=myconn.execute("SELECT name FROM user where name='"&delname&"'")
set isadmin=myconn.execute("select name from admin where name='"&delname&"'")
if add.eof or not isadmin.eof then
%>
<%=t1%>�� �� �� Ϣ<%=t2&d1%>����ɾ�������ܴ����������⣺<br><br>��û������û���<br>�����û��ǹ���Ա(����Ա����ɾ�������ȷʵҪ�Ѹ��û�ɾ�������ȸ��Ĺ���Ա���ٰѸ��û�ɾ��)��<%=d2%>
<%
else
myconn.execute("delete*from user where name='"&delname&"'")
myconn.execute("delete*from min where name='"&delname&"'")
myconn.execute("delete*from admin where name='"&delname&"'")
myconn.execute("delete*from hand where tname='"&delname&"'")
%>
<%=t1%>ɾ �� �� ��<%=t2&d1%>���Ѿ��ɹ���ɾ�����û��Լ�����û������Ӻ����ԡ�<%=d2%><%end if
set isadmin=nothing
set add=nothing%>
<%case"bbsgl"%><br>
<%response.write""&t1&"�� ̳ �� ��"&t2&""%>
<%=d1%>
<%
set bf=myconn.execute("select*from bdinfo where key='0' order by bn")
do while not bf.eof
%>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td width="29%" height="25"><font color=<%=c1%>><b><%=bf("bdname")%></font></b><%bbnn=bf("bn")%>��</td>
    <td width="59%"><a href="admin-gl.asp?menu=bdcon&dw=delfl&bn=<%=bbnn%>">ɾ���˷���</a> |
    <a href="admin-gl.asp?menu=addbbs&bbsbn=<%=bbnn%>">������̳</a> |</td>
    <td width="12%">������ţ�<b><font color=<%=c1%>><%=bbnn%></font></b></td>
  </tr>
  <%
set asd=myconn.execute("select*from bdinfo where key<>'0' and key='"&bbnn&"'order by bn")
do while not asd.eof
%><tr>
    <td width="29%" height="24">
��<%=asd("bdname")%></td>
    <td width="59%"><a href=admin-right.asp?action=chbbsinfo&bn=<%=asd("bn")%>>�޸�</a> | <a href="admin-gl.asp?menu=bdcon&dw=delbbs&bn=<%=asd("bn")%>">ɾ��</a> | 
    <a href="admin-right.asp?action=delall&bn=<%=asd("bn")%>">�������</a><%if asd("pass")<>"" then%> | 
    <a href="admin-right.asp?action=addpassuser&bn=<%=asd("bn")%>">�����֤�û�</a><%end if%></td>
    <td width="12%">��̳��ţ�<b><%=asd("bn")%></b></td>
  </tr><%
asd.movenext
Loop
asd.Close
set asd=nothing
%>
</table>
<br><%
bf.movenext
Loop
bf.Close
set bf=nothing
%><br><br><%=d2%>
<%=d1%>˵����<br>һ��������԰���һ��������̳��<br>���������֮�����Ų�����ͬ����̳����̳֮�����Ų�����ͬ��<br>����ɾ������ʱ�������е���̳Ҳ�ᱻɾ����<br>
�������Լ�����̳�����������ʾ����������Ҫ������ǰ��ķ������̳�����Ӧ��ǰһ��<br><br><%=d2%>
<%case"bdcon"
dw=request.querystring("dw")
bn=request.querystring("bn")
if dw="delfl" then
myconn.execute("delete*from bdinfo where bn='"&bn&"' and key='0'")
myconn.execute("delete*from bdinfo where key='"&bn&"'")
%><%=t1%>ɾ �� �� ��<%=t2&d1%>��ɾ����̳����ɹ���<%=d2%>
<%response.end
end if
if dw="delbbs" then
myconn.execute("delete*from bdinfo where bn='"&bn&"' and key<>'0'")
%><%=t1%>ɾ �� �� ��<%=t2&d1%>��ɾ����̳�ɹ���<%=d2%>
<%end if%>
<%case"addlm"%>
<%
name=Replace(Request.Form("name"),"'","''")
url=Replace(Request.Form("url"),"'","''")
picurl=Replace(Request.Form("picurl"),"'","''")
if name="" or url="" or picurl="" then
%>
<%=t1%>�� �� �� Ϣ<%=t2&d1%>����Ϣû����д������<%=d2%>
<%else%>
<%myconn.execute("insert into lmbbs(url,picurl,name)values('"&url&"','"&picurl&"','"&name&"')")%>
<%=t1%>�� �� �� ��<%=t2&d1%>�������̳���˳ɹ���<%=d2%><%end if%>
<%case"editlm"%>
<%name=Replace(Request.querystring("name"),"'","''")
url=Replace(Request.Form("url"),"'","''")
picurl=Replace(Request.Form("picurl"),"'","''")
if url="" or picurl="" then
%>
<%=t1%>�� �� �� Ϣ<%=t2&d1%>����Ϣû����д������<%=d2%>
<%else%>
<%myconn.execute("update [lmbbs] set url='"&url&"',picurl='"&picurl&"' where name='"&name&"'")%>
<%=t1%>�� �� �� ��<%=t2&d1%>���޸���̳���˳ɹ���<%=d2%><%end if%>
<%case"dellm"
name=Replace(Request.querystring("name"),"'","''")
if name="" then
%><%=t1%>�� �� �� Ϣ<%=t2&d1%>����ѡ��Ҫɾ�����������ơ�<%=d2%><%else
myconn.execute("delete*from lmbbs where name='"&name&"'")%>
<%=t1%>ɾ �� �� ��<%=t2&d1%>��ɾ�����˳ɹ���<%=d2%><%end if%><%case"updateuser"%>
<%
chname=Replace(Request.form("chname"),"'","''")
chqian=Replace(Request.form("chqian"),"'","''")
chmeili=Replace(Request.form("chmeili"),"'","''")
chjingyan=Replace(Request.form("chjingyan"),"'","''")
set add=myconn.execute("SELECT name FROM user where name='"&chname&"'")
if add.eof and add.bof then%>
<%=t1%>�� �� �� Ϣ<%=t2&d1%>��û������û�����<%=d2%>
<%else%>
<%
if not isnumeric(chqian) or not isnumeric(chmeili) or not isnumeric(chjingyan) then%>
<%=t1%>�� �� �� Ϣ<%=t2&d1%>����Ǯ���������������Ϊ����0�����֡�<%=d2%>
<%else
myconn.execute("update [user] set qian='"&chqian&"',meili='"&chmeili&"',jingyan='"&chjingyan&"' where name='"&chname&"'")
%>
<%=t1%>�� �� �� ��<%=t2&d1%>���Ѿ��ɹ����޸����û�����Ϣ��<%=d2%><%end if
end if
set add=nothing
%><%case"seepwd"%>
<%
chaname=Replace(Request.form("chaname"),"'","''")
set add=myconn.execute("SELECT*FROM user where name='"&chaname&"'")
if add.eof and add.bof then%>
<%=t1%>�� �� �� Ϣ<%=t2&d1%>��û������û�����<%=d2%>
<%else%>
<%=t1%>�� �� �� ��<%=t2&d1%><b><%=add("name")%>  ������Ϊ��</b><%=add("password")%><%=d2%><%end if
set add=nothing%>
<%case"delanymail"
daynum=request.form("daynum")
if not isnumeric(daynum) then
%><%=t1%>�� �� �� Ϣ<%=t2&d1%>������������д����Ϊ���֡�<%=d2%><%else
myconn.execute("delete*from hand where riqi<now-"&daynum&"")
%><%=t1%>ɾ �� �� ��<%=t2&d1%>������ɾ�����Գɹ���<%=d2%><%end if%>
<%case"delwhosemail"
ddname=Replace(Request.form("ddname"),"'","''")
if ddname="" then
%>
<%=t1%>�� �� �� Ϣ<%=t2&d1%>���������û�����<%=d2%><%else
myconn.execute("delete*from hand where tname='"&ddname&"'")
%><%=t1%>ɾ �� �� ��<%=t2&d1%>������ɾ�����Գɹ���<%=d2%><%end if%>

<%case"delany"
daynum=request.form("daynum")
bd=request.form("bd")
if not isnumeric(daynum) then
%><%=t1%>�� �� �� Ϣ<%=t2&d1%>������������д����Ϊ���֡�<%=d2%><%else
if bd="all" then
myconn.execute("delete*from min where riqi<now-"&daynum&"")
else
myconn.execute("delete*from min where bd="&bd&" and riqi<now-"&daynum&"")
end if
%>
<%=t1%>ɾ �� �� ��<%=t2&d1%>������ɾ�����ӳɹ���<%=d2%><%end if%><%case"delnore"%>
<%daynum=request.form("daynum")
bd=request.form("bd")
if not isnumeric(daynum) then
%><%=t1%>�� �� �� Ϣ<%=t2&d1%>������������д����Ϊ���֡�<%=d2%><%else
if bd="all" then
myconn.execute("delete*from min where orders<now-"&daynum&"")
else
myconn.execute("delete*from min where bd="&bd&" and orders<now-"&daynum&"")
end if
%>
<%=t1%>ɾ �� �� ��<%=t2&d1%>������ɾ�����ӳɹ���<%=d2%><%end if%><%case"delwhose"
ddname=Replace(Request.form("ddname"),"'","''")
bd=request.form("bd")
if ddname="" then
%>
<%=t1%>�� �� �� Ϣ<%=t2&d1%>���������û�����<%=d2%><%else
if bd="all" then
myconn.execute("delete*from min where name='"&ddname&"'")
else
myconn.execute("delete*from min where bd="&bd&" and name='"&ddname&"'")
end if
%><%=t1%>ɾ �� �� ��<%=t2&d1%>������ɾ�����ӳɹ���<%=d2%><%end if%><%case"moveday"
daynum=request.form("daynum")
frombd=request.form("frombd")
tobd=request.form("tobd")
if not isnumeric(daynum) then
%><%=t1%>�� �� �� Ϣ<%=t2&d1%>������������д����Ϊ���֡�<%=d2%><%else
myconn.execute("update min set bd="&tobd&" where bd="&frombd&" and riqi<now-"&daynum&"")
%>
<%=t1%>�� �� �� ��<%=t2&d1%>�������ƶ����ӳɹ���<%=d2%><%end if%><%case"movename"
movename=Replace(Request.form("movename"),"'","''")
frombd=request.form("frombd")
tobd=request.form("tobd")
if movename="" then%>
<%=t1%>�� �� �� Ϣ<%=t2&d1%>���������û�����<%=d2%><%else
myconn.execute("update min set bd="&tobd&" where bd="&frombd&" and name='"&movename&"'")
%><%=t1%>�� �� �� ��<%=t2&d1%>�������ƶ����ӳɹ���<%=d2%><%end if%><%case"bbs"
tl=Replace(Request.form("tl"),"'","''")
c1=Replace(Request.form("c1"),"'","''")
c2=Replace(Request.form("c2"),"'","''")
if tl="" or c1="" or c2="" then
%><%=t1%>�� �� �� Ϣ<%=t2&d1%>������д��������Ŀ��<%=d2%>
<%else
myconn.execute("update [bbsinfo] set tl='"&tl&"',c1='"&c1&"',c2='"&c2&"'")%>
<%=t1%>�� �� �� ��<%=t2&d1%>����̳�����Լ����������޸ĳɹ���<%=d2%><%end if%><%end select
end if%>