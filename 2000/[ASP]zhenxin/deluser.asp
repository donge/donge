<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 3.0">
<link rel="stylesheet" type="text/css" href="link.css">
<title>������</title>
</head>
<body topmargin="0" leftmargin="0" bgcolor="#FFFFFF">
<!--#include file="1.htm" -->
<table border="0" width="778" cellspacing="0" cellpadding="0" bgcolor="#eeeeee">
  <tr>
    <td>
      <p>&nbsp;</p>
      <table border="1" width="80%"  align="center" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" bordercolorlight="#000000" bordercolordark="#FFFFFF">
        <tr>
    <td>
            <p>&nbsp;
            <p align="center">��������user_name��pass_word���Ϳ��Խ�����������ɾ���� 
            <form action="deluser.asp" method="post">
              <p align="center">�û��� 
                <input
  name="user" size="10" class="stedit" maxlength="10">
                <br>
                pass_word�� 
                <input
  name="password" size="10" class="stedit" maxlength="10">
              <p align="center"> 
                <input type="submit"
  value="ע�����" class="stbtm">
            </form>
            <%
user=request.form("user")
password=request.form("password")
if user<>"" then

set con = Server.CreateObject("ADODB.Connection")%><!-- #include file=1Qw@3E.inc --><%con.open

sql="select id,user_name,pass_word,site_name from zhenxin_user where user_name='"&user&"'"
Set Rs=con.Execute(sql)

if rs.eof or rs.bof then
response.write("����user_name�����ڣ�")
rs.close
con.close
set rs=nothing
set con=nothing
response.end
end if

pass=rs("pass_word")
if pass<>password then
response.write("����pass_word����")
rs.close
con.close
set rs=nothing
set con=nothing
response.end
end if

if rs("site_name")="���û��ѱ�ɾ����" then
response.write("���󣺴��û��ѱ�ɾ����")
rs.close
con.close
set rs=nothing
set con=nothing
response.end
end if

sql="UPDATE zhenxin_user SET site_name='���û��ѱ�ɾ����',id=999999 WHERE user_name='"&user&"'"
con.Execute sql
rs.close
con.close
set rs=nothing
set con=nothing
response.write "�û�"&user&"�ѳɹ�ɾ������ָ����û������ٵ��޸��û���ȥ������ȷ���û�����pass_word���������ָ����û���"
end if%> 
            <p>&nbsp;</p></td>
</tr>
</table>
<p>&nbsp;</p></td></tr></table><!--#include file="2.htm" -->
<p>&nbsp; 
</body>
</html>