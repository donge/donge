<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 3.0">
<link rel="stylesheet" type="text/css" href="link.css">
<title>������</title>
</head>
<body topmargin="0" leftmargin="0" bgcolor="#FFFFFF">
<!--#include file="1.htm" --> 
<table border="0" width="778" cellspacing="0" cellpadding="0" bgcolor="#F0F0F0">
  <tr>  
    <td width="100%"> 
      <p>&nbsp;</p><table width="80%" border="1" cellspacing="0" cellpadding="0" align="center" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="#FFFFFF">
        <tr>
          <td>
            <p></p>
            <table border="0" cellspacing="0" cellpadding="0" align="center">
              <tr> 
                <td> 
                  <p><%Set ts = Server.CreateObject("ADODB.Recordset")
user=request.form("user")
olduser=user
user=replace(user,"'","''")
mail=request.form("mail")
password1=request.form("pass1")
password2=request.form("pass2")
sitename=request.form("sitename")
url=request.form("url")
jiji=request.form("jiji")
bc=REQUEST.FORM("bc")
st=request.form("r1")
fenlei=REQUEST.FORM("fenlei")
if bc="" then
bc="no"
end if
if IsNumeric(shu)=0 then shu=0

if user="" or len(olduser)>10 then
response.write"���������������밴����������ϵͳ�Ĳ������������롣 "
response.write"<a href='http://www.zhiyuanit.com/link/apply.asp'>������������ҳ����</a>"
response.end
end if

set con = Server.CreateObject("ADODB.Connection")%> <!-- #include file=1Qw@3E.inc --> 
                    <%con.open
sql="select count(*) from zhenxin_user"
Set nm=con.Execute(sql)
num=nm(0)
nm.close
sql="SELECT * FROM zhenxin_user WHERE user_name='"&user&"'"
Set Rs=con.Execute(sql)
If not(Rs.Bof OR Rs.Eof) then
Response.Write "���������������밴����������ϵͳ�Ĳ������������롣 "
response.write"<a href='http://www.zhiyuanit.com/link/apply.asp'>������������ҳ����</a>"
rs.close
con.close
set rs=nothing
set con=nothing
response.end
end if
rs.close
set rs=nothing
f=1
if len(password1)>20 then
f=0%></p>
                  <p>&nbsp;</p>
                  <p align="center">���������pass_word������<br>
                    <%end if%> <% if len(password2)>10 then

f=0%> �����������֤pass_word������<br>
                    <%end if%> <% if len(sitename)>8 then
f=0%> �����������վ��̫����<br>
                    <% if InStr(username,"��")<>0 or InStr(username,"��")<>0 or InStr(username,"�")<>0 or InStr(username,"��")<>0 or InStr(username,"��")<>0 and InStr(username,"��")<>0 or InStr(username,"��")<>0 or InStr(username,"ɫ")<>0 and InStr(username,"��")<>0 or InStr(sitename,"ɫ")<>0 and InStr(sitename,"��")<>0 or InStr(sitename,"��")<>0 and InStr(sitename,"��")<>0 or InStr(sitename,"��")<>0 and InStr(sitename,"��")<>0 or InStr(sitename,"��")<>0 and InStr(sitename,"��")<>0 or InStr(sitename,"��")<>0 and InStr(sitename,"��")<>0 or InStr(sitename,"��")<>0 and InStr(sitename,"��")<>0 or InStr(sitename,"��")<>0 or InStr(sitename,"��")<>0 or InStr(username,"��")<>0 and InStr(username,"��")<>0 then f=0%> 
                    �����������վ�����в��ŵ����ۣ�<br>
                    <%end if%> <%if len(url)>50 then
f=0
%> ������ҳ��ַ̫���˰ɣ�<br>
                    <% end if%> <%if len(jiji)>50 then
f=0%> ����site_about̫���� <br>
                    <%end if
if f=0 or password1<>password2 or password1="" or password2=""  or sitename="" or url="" then
%> <%if password1<>password2 then
f=0
%> �������1��pass_word���벻��ͬ<br>
                    <%end if

if password1="" then
f=0%> �������2���û�pass_wordû������<br>
                    <%end if

if password2="" then
f=0%> �������3����֤pass_wordû������<br>
                    <%end if

if sitename="" then
f=0%> �������4��site_nameû������<br>
                    <%end if

if url="" then
f=0%> �������5����ҳ��ַû������
                  <p align="center"><%end if%> <%end if%>
                  <p align="center"> <%
if f=1 then
if Lcase(Left(url,7))<>"http://" Then
url="http://"&url
End if

sql="SELECT * FROM zhenxin_user WHERE site_name=''"
ts.open sql,con,2,2
If not(ts.Bof OR ts.Eof) then
flag=0
ts("user_name")=olduser
ts("pass_word")=password1
ts("site_name")=sitename
ts("site_about")=jiji
ts("join_time")=date
ts("site_url")=url
ts("total_view")=0
ts("site_type")=fenlei
ts("e_mail")=mail
ts.Update
ts.close
con.close
set rs=nothing
set con=nothing
flag=0
else 
if jiji="" then jiji="��"
shu=1
ts.addnew
ts("OID")=num+1
ts("ID")=999999
ts("user_name")=olduser
ts("pass_word")=password1
ts("site_name")=sitename
ts("site_about")=jiji
ts("join_time")=date
ts("site_url")=url
ts("total_view")=0
ts("site_type")=fenlei
ts("e_mail")=mail
ts("day_visit")=0
ts("today_view")=0
ts("click_you")=0
ts("you_click")=0
ts("you_view")=0
ts("view_you")=0
ts.Update
oid=ts("oid")
response.write "�û�id��"&oid
ts.close
set ts=nothing
con.close
set con=nothing
end if%> ����������ɹ���<br>
                    Ҫ����������ʾ�����վ�����������һ�δ�����������ҳ(�޻���)�� <br>
                  <form method="POST" action="applaycheck.asp">
                    <p></p>
                    <p align="center"> 
                      <textarea name="S1" cols="80" class="stedit" rows="3">
&lt;script language=&quot;JavaScript1.1&quot; src=&quot;http://www.zhiyuanit.com/link/textlink.asp?oid=<%=oid%>&amp;bc=<%=bc%>&amp;st=<%=st%>&quot;&gt;&lt;/script&gt;
</textarea>
                    <p>�����������ʽ�� 
                    <p align="center"> 
                      <script language="JavaScript1.1" src="textlink.asp?oid=<%=oid%>&amp;bc=<%=bc%>&amp;st=<%=st%>"></script>
                      <%end if%> 
                  </form>
                </td>
              </tr>
            </table>
          <p></p></td>
        </tr>
      </table>
      <p></p></td>
      </tr>
    </table>
<!--#include file="2.htm" --> 
</body>
</html>