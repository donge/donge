<!-- #include file="setup.asp" -->
<%
top
if Request.Cookies("username")=empty then error("<li>����δ<a href=login.asp>��¼</a>����")

content=HTMLEncode(Request("content"))

sql="select * from [user] where username='"&Request.Cookies("username")&"'"
rs.Open sql,Conn,1,3


select case Request("menu")

case "experience"

if Request("how")<1 then
message=message&"<li>��������С��1"
error(message)
end if

if rs("money")<300*Request("how") then
message=message&"<li>���Ľ�Ҳ�����"
error(message)
end if
Randomize
d1=fix(rnd*300)+1
rs("experience")=rs("experience")+d1*Request("how")
rs("money")=rs("money")-300*Request("how")
rs.update
rs.close
error2("�Ѿ������� "&d1*Request("how")&" �㾭��ֵ��")

case "lookip"
if rs("money")<500 then
error("<li>���Ľ�Ҳ�����")
end if
rs("money")=rs("money")-500
rs.update
rs.close
Response.Cookies("lookip")=1
response.redirect "online.asp"


case "colony"
if content="" then
error2("����дȺ������!")
end if
if rs("money")<1000 then
error("<li>���Ľ�Ҳ�����")
end if
rs("money")=rs("money")-1000
rs.update
rs.close
sql="select username from online where username<>''"
rs.Open sql,Conn
do while not rs.eof
Count=Count+1


conn.Execute("insert into message (author,incept,content) values ('"&Request.Cookies("username")&"','"&rs("username")&"','����Ա�㲥����"&content&"')")

conn.execute("update [user] set newmessage=newmessage+1 where username='"&rs("username")&"'")
rs.movenext
loop
rs.close
error2("���ͳɹ���\n\n�����͸� "&Count&" λ���߻�Ա")



case "thew"
if rs("money")<100 then
message=message&"<li>���Ľ�Ҳ�����"
error(message)
end if
if rs("userlife")=100 then
message=message&"<li>�����������������ӣ�"
error(message)
end if
rs("money")=rs("money")-100
rs("userlife")=100
rs.update
rs.close
error2("���������Ѿ�ȫ����")

case "flowers"


vs=HTMLEncode(Request("vs"))
if vs=Request.Cookies("username") then error("<li>�����Լ����Լ���")
if Application(CacheName&"flowers")=vs then error("<li>�����ͬһ���û����в�����")

If conn.Execute("Select id From [user] where username='"&vs&"'" ).eof Then
error("<li>ϵͳ������"&vs&"������")
end if

if rs("money")<50 then
error("<li>���Ľ�Ҳ�����")
end if

rs("money")=rs("money")-50
rs.update
rs.close

Randomize
d1=fix(rnd*50)+1

conn.execute("update [user] set experience=experience+"&d1&" where username='"&vs&"'")

sql="insert into message(author,incept,content) values ('"&Request.Cookies("username")&"','"&vs&"','��ϵͳ��Ϣ����"&Request.Cookies("username")&"����1���ʻ�����������"&d1&"�㾭��ֵ��')"
conn.Execute(SQL)
conn.execute("update [user] set newmessage=newmessage+1 where username='"&vs&"'")
Application(CacheName&"flowers") = vs

error2(""&vs&"�Ѿ�������"&d1&"�㾭��ֵ��")



case "egg"
vs=HTMLEncode(Request("vs"))
if vs=Request.Cookies("username") then error("<li>�����Լ����Լ���")


if Application(CacheName&"egg")=vs then error("<li>�����ͬһ���û����в�����")

If conn.Execute("Select id From [user] where username='"&vs&"'" ).eof Then
error("<li>ϵͳ������"&vs&"������")
end if
If conn.Execute("Select experience From [user] where username='"&vs&"'" )(0)<50 Then error("<li>�Է�����ֵ����50����������������������������")


if rs("money")<50 then
error("<li>���Ľ�Ҳ�����")
end if

rs("money")=rs("money")-50
rs.update
rs.close

Randomize
d1=fix(rnd*50)+1

conn.execute("update [user] set experience=experience-"&d1&" where username='"&vs&"'")

sql="insert into message(author,incept,content) values ('"&Request.Cookies("username")&"','"&vs&"','��ϵͳ��Ϣ����"&Request.Cookies("username")&"����1����������������"&d1&"�㾭��ֵ��')"
conn.Execute(SQL)
conn.execute("update [user] set newmessage=newmessage+1 where username='"&vs&"'")

Application(CacheName&"egg") = vs
error2(""&vs&"�Ѿ�������"&d1&"�㾭��ֵ��")

end select

%>
<title>�����̳�</title>
<table width=97% align=center border=0>
<tr>
<td width=25%>
<img src=images/logo.gif border=0></td>
<td align=right><%=banner%></td>
</tr>
</table><br>
<table border=0 width=97% align=center cellspacing=1 cellpadding=4 class=a2>
<tr class=a3>
<td height=25>&nbsp;<img src=images/Forum_nav.gif>&nbsp; <a href=main.asp><%=clubname%></a> �� <a href="shop.asp">�����̵�</a></td>
</tr>
</table><br>


<SCRIPT>
function colony(){
var id=prompt("��������ҪȺ����ѶϢ��","");if(id){document.location='?menu=colony&content='+id+'';}
}
</SCRIPT>
<center>



<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="111111" width="90%">
<tr>
<td width="100%">
<div align="center">
<center>
<table border="0" cellpadding="3" cellspacing="1" width="100%" class=a2>
<tr class=a1>
<td width="50%" height="5" align="center" colspan="2"><b>
����ҩ��</b></td>
<td width="50%" height="5" align="center" colspan="2"><b>
����ҩ��</b></td>
</tr>
<tr>
<td width="15%" height="4" align="center" bgcolor="FFFFFF" rowspan="2"><FONT color=cccccc>
<IMG src="images/plus/9.gif" border=1></FONT></td>
<td width="25%" height="2" bgcolor="FFFFFF">���ƣ�����ҩ��<br>
�۸�100 <b>���</b><br>
���ܣ����ٲ�������</td>
<td width="15%" height="4" align="center" bgcolor="FFFFFF" rowspan="2"><FONT color=cccccc>
<IMG src="images/plus/7.gif" border=1></FONT></td>
<td width="25%" height="2" bgcolor="FFFFFF">
  ���ƣ�����ҩ��<br>
  �۸�300 <b>���</b><br>
  ���ܣ���������</td>
</tr>
<tr>
<td width="25%" height="2" bgcolor="FFFFFF"><form method=POST action=?menu=thew>
<input type="submit" value="��Ҫ����" name="Submit"></td></form>
<td width="25%" height="2" bgcolor="FFFFFF"><form method=POST action=?menu=experience>
������<input maxLength="2" size="2" name="how" value="1">
<input type="submit" value="��Ҫ����" name="Submit"></td></form>
</tr>
</table>
</center>
</div><br>
</td>
</tr>


<tr>
<td width="100%" height="97"><div align="center">
<center>
<table border="0" cellpadding="3" cellspacing="1" width="100%" class=a2>
<tr class=a1>
<td width="50%" height="5" align="center" colspan="2"><b>
��</b>��<b>��</b></td>
<td width="50%" height="5" align="center" colspan="2"><b>
��</b>��<b>��</b></td>
</tr>
<tr>
<td width="15%" height="4" align="center" rowspan="2" bgcolor="FFFFFF"><FONT color=cccccc>
<IMG src="images/plus/flowers.gif" border=1></FONT></td>
<td width="25%" height="2" bgcolor="FFFFFF">���ƣ��ʻ�<br>
�۸�50 <b>���</b><br>
���ܣ����ӶԷ��ľ���ֵ</td>
<td width="15%" height="4" align="center" rowspan="2" bgcolor="FFFFFF"><FONT color=cccccc>
<IMG src="images/plus/egg.gif" border=1></FONT></td>
<td width="25%" height="2" bgcolor="FFFFFF">���ƣ�����<br>
�۸�50 <b>���</b><br>
���ܣ����ͶԷ��ľ���ֵ</td>
</tr>
<tr>
<td width="25%" height="2" bgcolor="FFFFFF"><form method=POST action=?menu=flowers>
<input size="9" name="vs" value="�Է��û���" onfocus="this.value = &quot;&quot;;">
<input type="submit" value=" ȷ �� " name="Submit1"></td></form>
<td width="25%" height="2" bgcolor="FFFFFF"><form method=POST action=?menu=egg>
<input size="9" name="vs" value="�Է��û���" onfocus="this.value = &quot;&quot;;">
<input type="submit" value=" ȷ �� " name="Submit2"></td></form>
</tr>
</table>
</center>
</div><br>
</td>
</tr>


<tr>
<td width="100%" height="97"><div align="center">
<center>
<table border="0" cellpadding="3" cellspacing="1" width="100%" class=a2>
<tr class=a1>
<td width="50%" height="5" align="center" colspan="2"><b>
ѶϢȺ����</b></td>
<td width="50%" height="5" align="center" colspan="2"></td>
</tr>
<tr>
<td width="15%" height="4" align="center" rowspan="2" bgcolor="FFFFFF"><FONT color=cccccc>
<IMG src="images/plus/colony.gif" border=1></FONT></td>
<td width="25%" height="2" bgcolor="FFFFFF">���ƣ�ѶϢȺ����<br>
�۸�1000 <b>���</b><br>
���ܣ�Ⱥ��ѶϢ�����߻�Ա</td>
<td width="15%" height="4" align="center" rowspan="2" bgcolor="FFFFFF">��</td>
<td width="25%" height="2" bgcolor="FFFFFF">��</td>
</tr>
<tr>
<td width="25%" height="2" bgcolor="FFFFFF">
<input type="submit" value="��Ҫ����" name="Submit3"  onclick="colony()"></td>
<td width="25%" height="2" bgcolor="FFFFFF">
��</td>
</tr>
</table>
</center>
</div>
</td>
</tr>



</table>




<%
rs.close
htmlend%>