<!-- #include file="setup.asp" -->
<%
if Request.Cookies("username")=empty then error("<li>����δ<a href=login.asp>��¼</a>����")


if Request.Cookies("userpass") <> Conn.Execute("Select userpass From [user] where username='"&Request.Cookies("username")&"'")(0) then
error("<li>�����������")
end if

membercode=Conn.Execute("Select membercode From [user] where username='"&Request.Cookies("username")&"'")(0)



if Request("menu")="ok" then

if membercode < 4 then
error("<li>����Ȩ�޲������޷�ץ��������")
end if

If conn.Execute("Select username From [user] where username='"&Request("username")&"'" ).eof Then error("<li>"&Request("username")&"�����ϲ�����")

if Request("username")="" then
error("<li>���˵�����û����д")
end if
if Request("causation")="" then
error("<li>��û����������ԭ��")
end if



rs.Open "prison",Conn,1,3
rs.addnew
rs("username")=""&Trim(Request("username"))&""
rs("causation")=HTMLEncode(Request("causation"))
rs("constable")=""&Request.Cookies("username")&""
rs.update
rs.close


end if

if Request("menu")="release" then

if membercode < 4 then
error("<li>����Ȩ�޲������޷��ͷŷ��ˣ�")
end if

conn.execute("update [user] set membercode=1 where username='"&HTMLEncode(Request("username"))&"' and membercode=0")
conn.execute("delete from [prison] where username='"&HTMLEncode(Request("username"))&"'")

log("�� "&Request("username")&" �ͷų�������")

error2("�Ѿ��� "&Request("username")&" �ͷų�������")
end if


if Request("menu")="look" then
sql="select * from prison where username='"&HTMLEncode(Request("username"))&"'"
rs.Open sql,Conn


%>
<HTML><HEAD><meta http-equiv=Content-Type content=text/html; charset=gb2312><link href=images/skins/<%=Request.Cookies("skins")%>/bbs.css rel=stylesheet>
</HEAD>
<TITLE>̽ ��</TITLE>

<BODY background="images/plus/qiu.gif" topMargin=0>
<br><b><%=rs("username")%></b>
<SCRIPT>
tips = new Array;
tips[0] = "б���۾����һ�ۿ���,�����:����ĵ��̫��!";
tips[1] = "����������˵:�����Ҳ���!�Բ�������!";
tips[2] = "����¶�������Ц��:�ٺ�!Ҫ��Ҫ��������!";
tips[3] = "�п���ֵ�:һʧ��,��ǧ�ź�!��һ����������!";
tips[4] = "�����ص��ͷ:��!��ʮ���,����Ҫ��������!";
tips[5] = "���Ų�����������˿���ĸ�ǽ,ҡͷ̾Ϣ��!";
index = Math.floor(Math.random() * tips.length);
document.write("" + tips[index] + "");
  </SCRIPT><br><br>
����ԭ��<%=rs("causation")%><br><br>
����ʱ�䣺<%=rs("cometime")%><br><br>
����ʱ�䣺<%=rs("cometime")+prison%><br><br>

ִ�о��٣�<%=rs("constable")%>

<%
rs.close
responseend

end if

top

conn.execute("delete from [prison] where cometime<"&SqlNowString&"-"&prison&"")


%>
<TITLE>������ʱ������</TITLE>

<table width=97% align=center border=0>
<tr>
<td width=25%>
<img src=images/logo.gif border=0></td>
<td align=right><%=banner%></td>
</tr>
</table><br>
<table border=0 width=97% align=center cellspacing=1 cellpadding=4 class=a2>
<tr class=a3>
<td height=25>&nbsp;<img src=images/Forum_nav.gif>&nbsp; <a href=main.asp><%=clubname%></a> �� 
<a href="prison.asp">��������</a></td>
</tr>
</table><br>

<SCRIPT>valigntop()</SCRIPT>
<CENTER><TABLE cellSpacing=1 cellPadding=0 border=0 class=a2 width=97%><TBODY>
<TR><TD valign=middle>
<TABLE cellSpacing=0 cellPadding=3 border=0 width=100%><TBODY><TR class=a1 height="25">
	<TD align=center><b>����</b></TD>
<TD align=center><b>����ʱ��</b></TD>
<TD align=center><b>ִ�о���</b></TD>
<TD align=center><b>����</b></TD>
</TR>

<%
rs.Open "prison order by cometime Desc",Conn,1
pagesetup=20 '�趨ÿҳ����ʾ����
rs.pagesize=pagesetup
TotalPage=rs.pagecount  '��ҳ��
PageCount = cint(Request.QueryString("ToPage"))
if PageCount <1 then PageCount = 1
if PageCount > TotalPage then PageCount = TotalPage
if TotalPage>0 then rs.absolutepage=PageCount '��ת��ָ��ҳ��
i=0
Do While Not RS.EOF and i<pagesetup
i=i+1


response.write "<tr class=a4><TD align=center><a href=Profile.asp?username="&rs("username")&">"&rs("username")&"</a></TD><TD align=center>"&rs("cometime")&"</TD><TD align=center><a href=Profile.asp?username="&rs("constable")&">"&rs("constable")&"</a></TD><TD align=center><a href=?menu=release&username="&rs("username")&">�� ��</a> | <a href=# onClick=javascript:open('prison.asp?menu=look&username="&rs("username")&"','','resizable,scrollbars,width=220,height=160')>̽ ��</a></TD></tr>"


RS.MoveNext
loop
RS.Close

%>

<form METHOD=POST><input type=hidden name=menu value=ok><tr>
  <TD align=center colspan="4" class=a3>��
<input name="username" size="13"> ץ�����<br>
����ԭ��<input name="causation" size="20"> <input type="submit" value="ȷ��"></TD>
  			</tr></form>
</TBODY></TABLE>
</TD></TR></TBODY></TABLE>
<SCRIPT>valignbottom()</SCRIPT>
[<b>
<script>
PageCount=<%=TotalPage%> //��ҳ��
topage=<%=PageCount%>   //��ǰͣ��ҳ
for (var i=1; i <= PageCount; i++) {
if (i <= topage+3 && i >= topage-3 || i==1 || i==PageCount){
if (i > topage+4 || i < topage-2 && i!=1 && i!=2 ){document.write(" ... ");}
if (topage==i){document.write(" "+ i +" ");}
else{
document.write("<a href=?topage="+i+">"+ i +"</a> ");
}
}
}
</script>

</b>]

<%
htmlend
%>