<!-- #include file="setup.asp" -->
<%
if Request.Cookies("username")=empty then error("<li>����δ<a href=login.asp>��¼</a>����")

order=HTMLEncode(Request("order"))

top
%>


<title>��Ա���а�</title>

<table width=97% align=center border=0>
<tr>
<td width=25%>
<img src=images/logo.gif border=0></td>
<td align=right><%=banner%></td>
</tr>
</table><br>
<table border=0 width=97% align=center cellspacing=1 cellpadding=4 class=a2>
<tr class=a3>
<td height=25>&nbsp;<img src=images/Forum_nav.gif>&nbsp; <a href=main.asp><%=clubname%></a> �� ��Ա�б�</td>
</tr>
</table><br>

<center>


<SCRIPT>valigntop()</SCRIPT>
<TABLE cellSpacing=1 cellPadding=0 width=97% border=0 class=a2>
<TR align=middle id=TableTitleLink class=a1>
<TD height="25">�û���</TD>
<TD>��ҳ</TD>
<TD>QQ</TD>
<TD>ICQ</TD>
<TD>��ѶϢ</TD>
<TD><a href="?order=regtime">ע��ʱ��</a></TD>
<TD><a href="?order=posttopic">��������</a></TD>
<TD><a href="?order=postrevert">�ظ�����</a></TD>
<TD><a href="?order=money">�������</a></TD>
<TD><a href="?order=experience">����ֵ</a></TD>
<TD><a href="?order=landtime">����¼ʱ��</a></TD>
</TR>
<%



if order="" then order="experience"

pagesetup=20 '�趨ÿҳ����ʾ����

count=conn.execute("Select count(id) from [user]")(0)
TotalPage=cint(count/pagesetup)  '��ҳ��
if TotalPage < count/pagesetup then TotalPage=TotalPage+1
PageCount = cint(Request.QueryString("ToPage"))
if PageCount < 1 then PageCount = 1
if PageCount > TotalPage then PageCount = TotalPage


sql="select * from [user] order by "&order&" Desc "
rs.Open sql,Conn,1
rs.pagesize=pagesetup   'ÿҳ��ʾ����
if TotalPage>0 then rs.absolutepage=PageCount '��ת��ָ��ҳ��


i=0
Do While Not RS.EOF and i<pagesetup
i=i+1





if rs("userhome")<>"http://" then
userhome="<a href="&rs("userhome")&" target=_blank><img border=0 src=images/home.gif></a>"
else
userhome=""
end if

if rs("icq")<>"" then
icq="<a style=cursor:hand onclick=javascript:open('icq.asp?icq="&rs("icq")&"','','width=320,height=170')><img border=0 src=http://web.icq.com/whitepages/online?img=5&icq="&rs("icq")&" alt=ICQ:"&rs("icq")&" width=18 height=18></a>"
else
icq=""
end if

if rs("userqq")<>"" then
qq="<img border=0 src=images/qq.gif alt=QQ:"&rs("userqq")&">"
else
qq=""
end if



%>

<TBODY><TR align=middle height="25">
<TD class=a4><a href=Profile.asp?username=<%=rs("username")%>><%=rs("username")%></a></TD>
<TD class=a3><%=userhome%></TD>
<TD class=a4><%=qq%></TD>
<TD class=a4><%=icq%></TD>
<TD class=a3><a style=cursor:hand onclick="javascript:open('friend.asp?menu=post&incept=<%=rs("username")%>','','width=320,height=170')">
<img border="0" src="images/message1.gif"></a></TD>
<TD class=a4><%=rs("regtime")%></TD>
<TD class=a3><%=rs("posttopic")%></TD>
<TD class=a4><%=rs("postrevert")%></TD>
<TD class=a3><%=rs("money")%></TD>
<TD class=a4><%=rs("experience")%></TD>
<TD class=a3><%=rs("landtime")%></TD></TR>
<%


RS.MoveNext
loop
RS.Close

%>
</TABLE>
<SCRIPT>valignbottom()</SCRIPT>
<center><br>
<b>[
<script>
PageCount=<%=TotalPage%>
topage=<%=PageCount%>
for (var i=1; i <= PageCount; i++) {
if (i <= topage+3 && i >= topage-3 || i==1 || i==PageCount){
if (i > topage+4 || i < topage-2 && i!=1 && i!=2 ){document.write(" ... ");}
if (topage==i){document.write(" "+ i +" ");}
else{
document.write("<a href=?topage="+i+"&order=<%=Request("order")%>>"+ i +"</a> ");
}
}
}
</script>
]</b>

<br>
<%
htmlend
%>