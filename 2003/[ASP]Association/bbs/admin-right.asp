<!--#include file="conn.asp"--><!--#include file="fun.asp"-->
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
d1="<div align=center><center><table border=1 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor="&c1&" width=94% ><tr><td width= 100% >"
d2="</td></tr></table></center></div>"
function bdlist(sename,n)
response.write"<select size=1 name="&sename&" style='font-size: 9pt; '>"
if n=1 then
response.write"<option value=all selected>������̳</option>"
end if
set bf=myconn.execute("select*from bdinfo where key<>'0'")
do while not bf.eof
response.write"<option value="&bf("bn")&">"&bf("bdname")&"</option>"
bf.movenext
loop
bf.close
set bf=nothing
response.write"</select>"
end function

%>
<body topmargin="0" leftmargin="0"><style>TABLE {BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 1px; }TD {BORDER-RIGHT: 0px; BORDER-TOP: 0px;}</style>

<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="100%">
  <tr>
    <td width="100%" height="28" background="pic/8.gif" align="center">
    <b><font color="#FFFFFF">��̳��̨����ϵͳ</font></b></td>
  </tr>
  </table><br>
<%action=request.querystring("action")
select case action%>
<%case"addfl"
noyes="�� �� �� ��"
mes="<P style='MARGIN: 5px'>������ţ�<input type=text name=bn size=20><font color=#FF0000>��</font>ֻ���� <b>0</b> ���������</p><P style='MARGIN: 5px'>�������ƣ�<input type=text name=bdname size=20><font color=#FF0000>��</font>��������ƣ�������</p><P style='MARGIN: 5px'><input type=submit value=' �� �� ' name=B1> <input type=reset value=' �� �� ' name=B2></p>"
%>
<%
bn=request.form("bn")
bdname=Replace(Request.Form("bdname"),"'","''")
if bn="" or bn="0" or bdname="" or not isnumeric(bn) then
%>
<%else
set flyn=myconn.execute("select bn,bdname from bdinfo where bn='"&bn&"' and key='0'")
if not flyn.eof then
mes="<br>��������� <b>"&bn&"</b> �Ѿ����ڣ�����ѡ���ķ������<br><br>"
else
myconn.execute("insert into bdinfo(bn,bdname,key)values('"&bn&"','"&bdname&"','0')")
mes="<br>�������̳����ɹ���<br><br>"
end if
set flyn=nothing
end if
%><form method=POST>
<!--#include file="mes.asp"--></form>
<%case"bzgl"
bz=request.querystring("bz")
if bz="add" then
bt="����°���"
go="add"
put="&nbsp;��&nbsp;��&nbsp;"
elseif bz="del" then
bt="ɾ������"
go="del"
put="&nbsp;ɾ&nbsp;��&nbsp; "
end if
%>
<form action="admin-gl.asp?menu=bzgl&go=<%=go%>" method="POST">
<%=t1&bt&t2&d1%>
<P style='MARGIN: 5px'>�������ƣ�<input type="text" name="name" size="20"></p><P style='MARGIN: 5px'>������̳��<%=bdlist("bd",0)%>
</p><P style='MARGIN: 5px'><input type="submit" value=<%=put%> name="B1">&nbsp;
<input type="reset" value=" �� �� " name="B2"></p>

<%=d2%>
</form>
<%case"chadmin"%><%=t1%>���й���Ա<%=t2&d1%><P style="MARGIN: 5px">���й���Ա���ƣ�<br><%
set sho=myconn.execute("select name from admin where bd='70767766'")
do while not sho.eof
%><%=sho("name")%>&nbsp;&nbsp;&nbsp;<%sho.movenext
loop
set sho=nothing%><%=d2%>
<form action="admin-gl.asp?menu=addadmin" method="POST">
<%=t1%>��ӹ���Ա<%=t2&d1%><P style="MARGIN: 5px">��ӹ���Ա���ƣ�( �����Ʊ����Ѿ�����̳��ע�� ) <input type="text" name="adminname" size="20"> 
<input type="submit" value=" �� �� " name="B1">
<input type="reset" value=" �� �� " name="B2"></p><%=d2%>
</form>
<form action="admin-gl.asp?menu=deladmin" method="POST">
<%=t1%>ɾ������Ա<%=t2&d1%><P style="MARGIN: 5px">ɾ������Ա���ƣ�<input type="text" name="adminname" size="20"> 
<input type="submit" value=" ɾ �� " name="B1">
<input type="reset" value=" �� �� " name="B2"></p><%=d2%>
</form>
<%case"deluser"%>
<form action="admin-gl.asp?menu=deluser" method="POST">
<%=t1%>ɾ���û�<%=t2&d1%><P style="MARGIN: 5px">�û�����<input type="text" name="delname" size="20"> 
<input type="submit" value=" ɾ �� " name="B1">
<input type="reset" value=" �� �� " name="B2"></p><%=d2%>
</form>
<%case"lookuser"%><br>
<%=t1%>�� �� ע �� �� ��<%=t2%>
<div align="center">
  <center>
  <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-left-width:1px; border-right-width:1px; border-top-width:1px" bordercolor="<%=c1%>" width="94%">
    <tr>
<%
i=1
set rs=myconn.execute("select name from user")
do while not rs.eof
%>
<td width="12.5%" height="26">&nbsp;<a target="_blank" href="userinfo.asp?name=<%=rs("name")%>"><%=rs("name")%></a></td>
<%
i=i+1
if i=9 then
response.write"</tr>"
i=1
end if
rs.movenext
Loop
rs.Close
set rs=nothing%></tr>
  </table>
  </center>
</div>
<%case"addpassuser"
bn=request.querystring("bn")
set showps=myconn.execute("select pass from bdinfo where bn='"&bn&"' and key<>'0'")
%>
<form method="POST" action="admin-gl.asp?menu=addpassuser&bn=<%=bn%>">
<%=t1%>�޸���̳��֤�û�<%=t2&d1%>
<P style="MARGIN: 5px">�������Ѿ�ͨ����֤���û���Ҫ����������д�����û�֮���á�,��������</p><P style="MARGIN: 5px"><b>
<font color="#FF0000">ע�⣺</font></b>��д������һ������ʹ�ûس�</p><P style="MARGIN: 5px">
<textarea name="user" cols=90 rows="15"><%=showps("pass")%></textarea></p><P style="MARGIN: 5px"><input type="submit" value=" �� �� " name="b1"> <input type="reset" value=" �� �� " name="b2">
</p><%set showps=nothing%>
</form>
<%case"bbs"
set bbs=myconn.execute("select*from bbsinfo")
%>
<form method="POST" action="admin-gl.asp?menu=bbs">
<%=t1%>�޸���̳���Ƽ�����<%=t2&d1%>
<P style="MARGIN: 5px">��̳����:<input type="text" name="tl" size="37" value="<%=bbs("tl")%>"><font color="#FF0000">��</font>(�����̳������)</p>
<P style="MARGIN: 5px">�߿���ɫ:<input type="text" name="c1" size="20" value="<%=bbs("c1")%>"><font color="#FF0000">��</font>(���߿����ɫ)</p>
<P style="MARGIN: 5px">��̳��ɫ:<input type="text" name="c2" size="20" value="<%=bbs("c2")%>"><font color="#FF0000">��</font>(һЩ���ĵ�ɫ)</p>
<P style="MARGIN: 5px"><input type="submit" value=" �� �� " name="B1"> <input type="reset" value=" �� �� " name="B2"></p>
<%=d2%>
</form>
<%set bbs=nothing%>
<%case"chbbsinfo"
bn=request.querystring("bn")
set bbsinfo=myconn.execute("select*from bdinfo where bn='"&bn&"' and key<>'0'")
%><form action="admin-gl.asp?menu=updatebbs&bn=<%=bn%>" method="POST">
<%=t1%>�޸���̳��Ϣ<%=t2&d1%>
<P style='MARGIN: 5px'>��̳��ţ�<b><%=bn%></b><P style='MARGIN: 5px'>��̳���ƣ�<input type="text" name="bdname" size="25" value="<%=bbsinfo("bdname")%>"><font color="#FF0000">��</font>������</p>
<P style='MARGIN: 5px'>��־ͼƬ��<input type="text" name="picurl" size="49" value="<%=bbsinfo("picurl")%>">������ʾ����̳���ұߣ����Բ��</p>
<P style='MARGIN: 5px'>��̳���ܣ�<br><textarea rows="4" name="bdinfo" cols="58"><%=bbsinfo("bdinfo")%><%shuyu=bbsinfo("key")
paa=bbsinfo("pass")
set bbsinfo=nothing%></textarea><font color="#FF0000">��</font></p>
<P style='MARGIN: 5px'>���ڷ��ࣺ<select size="1" name="key" style="font-size: 9pt">
<%set bf=myconn.execute("select*from bdinfo where key='0' order by bn")
do while not bf.eof%><%if shuyu=bf("bn") then%><option value="<%=bf("bn")%>" selected><%=bf("bdname")%></option><%else%>
<option value="<%=bf("bn")%>"><%=bf("bdname")%></option><%end if%>
<%
bf.movenext
Loop
bf.Close
set bf=nothing
%>
</select><font color="#FF0000">��</font>��ѡ�����̳������һ�ַ���</p><br><P style='MARGIN: 4px'>
��̳���ͣ�(������������ѡ��һ��)<font color="#FF0000">��</font></p><P style='MARGIN: 4px'><input type="radio" value="nopwd" name="bbstype" <%if isnull(paa) or paa="" then%>checked<%end if%>>��ͨ��̳
��ע���û��������ɵĽ����������̳�����Ƽ�����<P style='MARGIN: 4px'><input type="radio" value="pwdpass" name="bbstype" <%if paa<>"" then%>checked<%end if%>>��֤��̳
��ֻ�а�����֤��ע���û����ܽ����������̳��</p><br>
<P style='MARGIN: 4px'><input type="submit" value=" �� �� " name="B1"> <input type="reset" value=" �� �� " name="B2"></p><br><%=d2%>
</form>
<%case"delall"
bn=request.querystring("bn")
myconn.execute("delete*from min where bd="&bn&"")
%><%=t1%>ɾ �� �� ��<%=t2&d1%><P style="MARGIN: 5px"><br>���Ѿ��ɹ���ɾ���˸ð�����������ӡ�</p><br><%=d2%>

<%case"updateuser"%>
<form action="admin-gl.asp?menu=updateuser" method="POST">
<%=t1%>�����û�����<%=t2&d1%>
<P style="MARGIN: 5px">�û�����<input type="text" name="chname" size="19"></p>
<P style="MARGIN: 5px">��&nbsp; Ǯ��<input type="text" name="chqian" size="10"> 
  ��&nbsp; ����<input type="text" name="chmeili" size="10">
  ��&nbsp; �飺<input type="text" name="chjingyan" size="10"></p><P style="MARGIN: 5px"><input type="submit" value=" �� �� " name="B1">&nbsp; 
<input type="reset" value=" �� �� " name="B2">&nbsp;<%=d2%></form>
<%case"seepwd"%>
<form action="admin-gl.asp?menu=seepwd" method="POST">
<%=t1%>�鿴�û�����<%=t2&d1%><P style="MARGIN: 5px">�û�����<input type="text" name="chaname" size="20"> 
<input type="submit" value=" �� �� " name="B1">
        <input type="reset" value=" �� �� " name="B2"></p><%=d2%> 
</form>
<%case"delany"%>
<center><font color="#FF0000">ע�⣺ʹ�ô˹��ܽ�ɾ��ָ���������Լ����棬ɾ�����ָܻ���������ʹ�ã���</font></center>
<form action="admin-gl.asp?menu=delany" method="POST">
<%=t1%>ɾ��ָ�������ڵ�����<%=t2&d1%>
<P style="MARGIN: 5px">ɾ��������ǰ�����ӣ�( ������ ) 
<input type="text" name="daynum" size="19"></p>
<P style="MARGIN: 5px">ɾ���������ڵ���̳��( ��ѡ�� ) <%=bdlist("bd",1)%></p><P style="MARGIN: 5px"><input type="submit" value=" �� �� " name="B1">&nbsp; 
<input type="reset" value=" �� �� " name="B2">&nbsp;<%=d2%></form>
<form action="admin-gl.asp?menu=delnore" method="POST">
<%=t1%>ɾ��ָ��������û�лظ�������<%=t2&d1%>
<P style="MARGIN: 5px">ɾ��������ǰ�����ӣ�( ������ ) 
<input type="text" name="daynum" size="19"></p>
<P style="MARGIN: 5px">ɾ���������ڵ���̳��( ��ѡ�� ) <%=bdlist("bd",1)%></p><P style="MARGIN: 5px"><input type="submit" value=" �� �� " name="B1">&nbsp; 
<input type="reset" value=" �� �� " name="B2">&nbsp;<%=d2%></form><form action="admin-gl.asp?menu=delwhose" method="POST">
<%=t1%>ɾ��ָ���û�����������<%=t2&d1%>
<P style="MARGIN: 5px">ɾ��ָ���û������ӣ�( �û��� ) 
<input type="text" name="ddname" size="19"></p>
<P style="MARGIN: 5px">ɾ���������ڵ���̳��( ��ѡ�� ) <%=bdlist("bd",1)%></p><P style="MARGIN: 5px"><input type="submit" value=" �� �� " name="B1">&nbsp; 
<input type="reset" value=" �� �� " name="B2">&nbsp;<%=d2%></form>
<%case"bbsmail"%>
<center><font color="#FF0000">ע�⣺ʹ�ô˹��ܽ�ɾ��ָ�����ʼ���ɾ�����ָܻ���������ʹ�ã���</font></center>
<form action="admin-gl.asp?menu=delanymail" method="POST">
<%=t1%>ɾ��ָ�������ڵ�����<%=t2&d1%>
<P style="MARGIN: 5px">ɾ��������ǰ�����ԣ�( ������ ) 
<input type="text" name="daynum" size="19"></p>
<P style="MARGIN: 5px"><input type="submit" value=" �� �� " name="B1">&nbsp; 
<input type="reset" value=" �� �� " name="B2">&nbsp;<%=d2%></form>
<form action="admin-gl.asp?menu=delwhosemail" method="POST">
<%=t1%>ɾ��ָ���û�����������<%=t2&d1%>
<P style="MARGIN: 5px">ɾ��ָ���û������ԣ�( �û��� ) 
<input type="text" name="ddname" size="19"></p>
<P style="MARGIN: 5px"><input type="submit" value=" �� �� " name="B1">&nbsp; 
<input type="reset" value=" �� �� " name="B2">&nbsp;<%=d2%></form>

<%case"seepwd"%>
<form action="admin.gl.asp?menu=lookpwd" method="POST">
<%=t1%>�鿴�û�����<%=t2&d1%><P style="MARGIN: 5px">�û�����<input type="text" name="chaname" size="20"> 
<input type="submit" value=" �� �� " name="B1">
        <input type="reset" value=" �� �� " name="B2"></p><%=d2%> 
</form>
<%case"moveany"%>
<form action="admin-gl.asp?menu=moveday" method="POST">
<%=t1%>��ָ�������ƶ�����<%=t2&d1%>
<P style="MARGIN: 5px">�ƶ�������ǰ�����ӣ�( ������ ) 
<input type="text" name="daynum" size="19"></p>
<P style="MARGIN: 5px">����ԭ�����ڵ���̳��( ��ѡ�� ) 
<%=bdlist("frombd",0)%></p>
<P style="MARGIN: 5px">����Ҫ�ƶ�������̳��( ��ѡ�� ) 
<%=bdlist("tobd",0)%></p><P style="MARGIN: 5px"><input type="submit" value=" �� �� " name="B1">&nbsp; 
<input type="reset" value=" �� �� " name="B2">&nbsp;<%=d2%></form>
<form action="admin-gl.asp?menu=movename" method="POST">
<%=t1%>��ָ���û��ƶ�����<%=t2&d1%>
<P style="MARGIN: 5px">�ƶ�ָ���û������ӣ�( �û��� ) 
<input type="text" name="movename" size="19"></p>
<P style="MARGIN: 5px">����ԭ�����ڵ���̳��( ��ѡ�� ) 
<%=bdlist("frombd",0)%></p>
<P style="MARGIN: 5px">����Ҫ�ƶ�������̳��( ��ѡ�� ) 
<%=bdlist("tobd",0)%></p><P style="MARGIN: 5px"><input type="submit" value=" �� �� " name="B1">&nbsp; 
<input type="reset" value=" �� �� " name="B2">&nbsp;<%=d2%></form>
<%case"lm"%>
<form action="admin-gl.asp?menu=addlm" method="POST">
<%=t1%>�����̳����<%=t2&d1%><P style="MARGIN: 5px">��̳���ƣ�<input type="text" name="name" size="20"></p>
<P style="MARGIN: 5px">��̳��ַ��<input type="text" name="url" size="38"></p>
<P style="MARGIN: 5px">��̳ͼƬ��<input type="text" name="picurl" size="38"></p> 
<P style="MARGIN: 5px"><input type="submit" value=" �� �� " name="B1"> <input type="reset" value=" �� �� " name="B2"></p><%=d2%>
</form>
<%=t1%>������̳����<%=t2&d1%><P style="MARGIN: 5px">
<%set slm=myconn.execute("select*from lmbbs")
do while not slm.eof
ha=slm("name")
response.write"<table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' width=100% height=18><tr><td width=33% >"&kbbs(ha)&"</td>"
response.write"<td width='33%'><a href='admin-gl.asp?menu=dellm&name="&kbbs(ha)&"'>ɾ��</a></td><td width='34%'><a href='?action=editlm&name="&kbbs(ha)&"'>�༭</a></td></tr></table>"
slm.movenext
loop
set slm=nothing
%></p><%=d2%>
<%case"editlm"
name=Replace(Request.querystring("name"),"'","''")
set elm=myconn.execute("select*from lmbbs where name='"&name&"'")
%>
<form action="admin-gl.asp?menu=editlm&name=<%=kbbs(elm("name"))%>" method="POST">
<%=t1%>�༭��̳����<%=t2&d1%><P style="MARGIN: 5px">��̳���ƣ�<%=kbbs(elm("name"))%></p>
<P style="MARGIN: 5px">��̳��ַ��<input type="text" name="url" size="38" value="<%=elm("url")%>"></p>
<P style="MARGIN: 5px">��̳ͼƬ��<input type="text" name="picurl" size="38" value="<%=elm("picurl")%>"></p> 
<P style="MARGIN: 5px"><input type="submit" value=" �� �� " name="B1"> <input type="reset" value=" �� �� " name="B2"></p><%=d2%>
</form>
<%set elm=nothing%>
<%end select
end if%>