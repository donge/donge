<!--#include file="up.asp"-->
<%
pagenum=request.querystring("pagenum")
re=request.querystring("re")
riqi=now+timeset/24
name=Replace(Request.Form("name"),"'","''")
password=Replace(Request.Form("password"),"'","''")
body=Replace(Request.Form("body"),"'","''")
face=request.form("face")
if face="" then
face="re"
end if
ls=session("lasttime")
if ls+1/8640>now() then
noyes="�� �� ʧ �� ��"
mes="<meta http-equiv=refresh content=4;url=javascript:history.go(-1)><font color="&c1&">&nbsp;<b>�Բ����㲻�ܳɹ��ط������ӣ�����</b></font><br>������̳Ϊ�˷�ֹ��ˮ��������ͬһ�˷�����ʱ����Ϊ <b>10</b> �룡<br><br>"
else
select case re
case"no"
gonggao=request.form("gonggao")
zhuti=Replace(Request.Form("zhuti"),"'","''")
set rs=myconn.execute("SELECT*FROM user where name='"&name&"'and password='"&password&"'")
if rs.eof and rs.bof or zhuti="" or body="" then
noyes="�� �� ʧ �� ��"
mes="<meta http-equiv=refresh content=4;url=javascript:history.go(-1)><font color="&c1&">&nbsp;<b>�Բ����㲻�ܳɹ��ط������ӣ��������ܴ����������⣺</b></font><br>�� �㲢û����д�������Ҫ���ݣ�<br>�� ����д�����ֻ��������<br>�� ����㻹û��ע��һ���û�����<a href=zhuce.asp><font color=#000080>����ע��</font></a>��<br><br>"
else
select case gonggao
case"4"
if rs("qian")<1000 or rs("jingyan")<200 or rs("meili")<200 then
mes="<meta http-equiv=refresh content=4;url=javascript:history.go(-1)><font color="&c1&">&nbsp;<b>�Բ����㲻�ܳɹ��ط������ӣ�</b></font><br>�� ��Ľ�Ǯ����������������ĳһ������㹻���������"
cangg="no"
else
cangg="yes"
if admin<>"yes" then
myconn.execute("update [user] set qian=qian-1000,meili=meili-200,jingyan=jingyan-200 WHERE name='"&name&"'")
end if
end if
case"0"
cangg="yes"
case"1"
if admin="yes" then
cangg="yes"
else
cangg="no"
end if
end select
if cangg="yes" then
myconn.execute("insert into min(zhuti,name,body,riqi,face,bd,orders,gonggao,editriqi)VALUES('"&zhuti&"','"&name&"','"&body&"','"&riqi&"','"&face&"',"&bd&",'"&riqi&"','"&gonggao&"','"&riqi&"')")
myconn.execute("update [user] set qian=qian+200,meili=meili+30,jingyan=jingyan+30 WHERE name='"&name&"'")
set seeme=myconn.execute("select top 1 id from min order by id desc")
fid=seeme("id")
set seeme=nothing
noyes="�� �� �� �� ��"
mes="<meta http-equiv=refresh content=3;url=list.asp?bd="&bd&"><font color="&c1&"><b>&nbsp;����ɹ�----����㲻�����������ӣ����� 3 ����Զ���ת�� "&wz&"��</b></font><br>�� <a href=show.asp?id="&fid&"&bd="&bd&">�ص�������������ҳ�棡</a><br>�� <a href=list.asp?bd="&bd&">"&wz&"</a><br>�� <a href=index.asp>"&tl&"</a><br><br>"
end if
end if
set rs=nothing
case"yes"
set rs=myconn.execute("SELECT*FROM user where name='"&name&"'and password='"&password&"'")
if rs.eof or rs.bof or body="" then
noyes="�� �� ʧ �� ��"
mes="<meta http-equiv=refresh content=4;url=javascript:history.go(-1)><font color="&c1&">&nbsp;<b>�Բ����㲻�ܳɹ��ػظ����ӣ��������ܴ����������⣺</b></font><br>�� �㲢û����д��Ҫ���ݣ�<br>�� ����д�����ֻ��������<br>�� ����㻹û��ע��һ���û�����<a href=zhuce.asp><font color=#000080>����ע��</font></a>��<br><br>"
else
id=request.querystring("id")
myconn.execute("insert into min(name,body,riqi,bd,orders,bid,face,editriqi)VALUES('"&name&"','"&body&"','"&riqi&"',"&bd&",'"&riqi&"',"&id&",'"&face&"','"&riqi&"')")
myconn.execute("update min set orders='"&riqi&"' where id="&id&"")
myconn.execute("update [user] set qian=qian+100,meili=meili+15,jingyan=jingyan+15 WHERE name='"&name&"'")
noyes="�� �� �� �� ��"
mes="<meta http-equiv=refresh content=3;url=list.asp?bd="&bd&"><font color="&c1&"><b>&nbsp;�ظ��ɹ�----����㲻�����������ӣ����� 3 ����Զ���ת�� "&wz&"��</b></font><br>�� <a href=show.asp?id="&id&"&bd="&bd&"&topage="&pagenum&">�ص������ظ�������ҳ�棡</a><br>�� <a href=list.asp?bd="&bd&">"&wz&"</a><br>�� <a href=index.asp>"&tl&"</a><br><br>"
end if
end select
set ty=myconn.execute("select nyr from bbsinfo")
myconn.execute("update bbsinfo set todaynum=todaynum+1")
session("lasttime")=Now()
end if
%><br><!--#include file="mes.asp"--><br><!--#include file="down.asp"-->