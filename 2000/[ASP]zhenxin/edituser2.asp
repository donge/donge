<%@ codepage ="936" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 3.0">
<link rel="stylesheet" type="text/css" href="link.css">
<title>������</title>
</head>

<body topmargin="0" bgcolor="#FFFFFF" leftmargin="0">
<!--#include file="1.htm" --> 
<table width="778" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><%
user=""
pass=""
user=request.querystring("user")
pass=request.querystring("pass")
Set con=Server.CreateObject("ADODB.Connection")%> <!-- #include file=1Qw@3E.inc --> 
      <%con.Open connstr

Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from zhenxin_user where user_name='"&user&"'"
rs.open sql,con,1,2

if rs.eof or rs.bof then%> 
      <p>����user_name�����ڣ�<a href="edituser.asp">����</a> <%rs.close
con.close
set rs=nothing
set con=nothing
response.end
end if

if pass<>rs("pass_word") then
response.write("����pass_word����<a href='edituser.asp'>����</a>")
rs.close
con.close
set rs=nothing
set con=nothing
response.end
end if
url=rs("site_url")
urlname=rs("site_name")
jiji=rs("site_about")
mail=rs("e_mail")
fenlei=rs("site_type")
pass=rs("pass_word")

if urlname="" then
response.write"<font color='#ff0000'>���û��ѱ�ɾ�����������ָ����û��ţ���������վ����</font><BR>"
end if

%> </p>
      <table align="center" >
        <p><br>
          <strong>�ɵ�����</strong> 
        <p> user_name�ƣ�<%=user%><br>
          �û�pass_word��<%=pass%><br>
          ����e_mail��<%response.write mail%><br>
          site_type��<%select case fenlei
                       case 1:  response.write"�ۺ��Ż�"
                      case 2:  response.write"���ҵ���"
                       case 3:  response.write"��������"
                      case 4:  response.write"��������"
                       case 5:  response.write"��������"
                       case 6:  response.write"���Ÿ���"
                        case 7:  response.write"������Ѷ"
                     case 8:  response.write"�Ļ�����"
                       case 9:  response.write"��ѧ����"
                        case 10:  response.write"��Ϸ����"
                        case 11:  response.write"��������"
                       case 12:  response.write"���̾���"
                        case 13:  response.write"����Ͷ��"
                      case 14:  response.write"����ý��"
                       case 15:  response.write"��н���"
                     case 16:  response.write"Ů�����"
                       case 17:  response.write"��������"
                      case 18:  response.write"�������"
case else:response.write"<font color='#ff0000'>���ϴ���</font>"
end select%><br>
          site_url��<%=url%><br>
          site_name��<%=urlname%><br>
          site_about��<%=jiji%><br>
          <br>
          ���ĳ��޸Ŀ���Ϊ�ա�����Ӧ�Ŀ������뼴����<br>
          ����Ӧ����޸ģ�������ʾ���޸Ľ�������档 
        <form action="edituser2.asp?user=<%=user%>&pass=<%=pass%>" method="post">
          <div> user_name�ƣ�<%=user%> <br>
            ����e_mail�� 
            <input name="mail" size="15" class="stedit" maxlength="30">
            <br>
            site_type�� 
            <select name="fenlei" size="1" class="stslt">
              <option value="1" selected>�ۺ��Ż�</option>
              <option value="2">���ҵ���</option>
              <option value="3">��������</option>
              <option value="4">��������</option>
              <option value="5">��������</option>
              <option value="6">���Ÿ���</option>
              <option value="7">������Ѷ</option>
              <option value="8">�Ļ�����</option>
              <option value="9">��ѧ����</option>
              <option value="10">��Ϸ����</option>
              <option value="11">��������</option>
              <option value="12">���̾���</option>
              <option value="13">����Ͷ��</option>
              <option value="14">����ý��</option>
              <option value="15">��н���</option>
              <option value="16">Ů�����</option>
              <option value="17">��������</option>
              <option value="18">�������</option>
            </select>
            <br>
            �µ�pass_word�� 
            <input
  name="newpassword1" size="10" class="stedit" maxlength="10" type="password">
            <br>
            ��֤pass_word�� 
            <input
  name="newpassword2" size="10" class="stedit" maxlength="10" type="password">
            <br>
            site_url�� 
            <input
  name="newurl" size="30" class="stedit" maxlength="50">
            <br>
            site_name�� 
            <input
  name="newsitename" size="16" class="stedit" maxlength="8">
            <br>
            site_about�� 
            <input
  name="newjiji" size="50" class="stedit" maxlength="50">
            <br>
          </div>
          <input type="submit" value="�ύ" class="stbtm" name="submit">
          <br>
        </form>
        <%error=0
qmail=request.form("mail")
qfenlei=request.form("fenlei")
newpassword1=request.form("newpassword1")
newpassword2=request.form("newpassword2")
newurl=request.form("newurl")
newsitename=request.form("newsitename")
newshu=request.form("newshu")
newjiji=request.form("newjiji")
okflag=0
if qmail<>"" or qfenlei<>0 or icount<>"" or newurl<>"" or newsitename<>"" or newshu<>"" or newjiji<>"" then okflag=1
if newpassword1<>"" and newpassword2<>"" and newpassword1=newpassword2 then okflag=1
if qgeshang<>0 then
geshang=qgeshang
end if
if qfenlei<>0 then
fenlei=qfenlei
end if

if qmail<>"" then
mail=qmail
end if
if len(user)>10 then
error=1
%> ����user_name̫��! <%end if

if len(oldpassword)>10 then
error=1
%> ���󣺾�pass_word̫��! <%end if

if len(newpassword1)>10 or len(newpassword2)>10 then
error=1%> ������pass_word̫��! <%end if

if len(newurl)>50  then
error=1%> ����site_url̫��! <%end if

if len(newsitename)>7  then
error=1%> ������վ��̫��! <%end if
if len(newjiji)>50  then
error=1%> ����site_about̫��! <%end if
if len(newshu)>7  then
error=1%> ���󣺳�ʼ����ֵ̫��! <%end if
if IsNumeric(newshu)=0 and newshu<>"" then 
error=1%> ��������ļ���ֵ�������֣�<br>
        <%end if

if newpassword1<>newpassword2 then
error=1%> ����������pass_word����ͬ���޷�ȷ���ĸ�Ϊ��ȷpass_word��<br>
        <%end if

if error=0 then

if newpassword1<>"" and newpassword2<>"" and newpassword1=newpassword2 then
password=newpassword1
else
password=pass
end if

if newsitename<>"" then
sitename=newsitename
else 
sitename=urlname
end if


if newurl<>"" then
url=newurl
end if


if newjiji<>"" then
jiji=newjiji
end if

if rs("pass_word")<> password then
rs("pass_word")=password
end if

if rs("e_mail")<>mail then
rs("e_mail")=mail
end if

if rs("site_type")<>fenlei then
rs("site_type")=fenlei
end if

if sitename<>rs("site_name") then
rs("site_name")=sitename
end if

if rs("site_url")<>url then
rs("site_url")=url
end if

if rs("site_about")<>jiji then
rs("site_about")=jiji
end if
rs.Update
rs.close
con.close
set rs=nothing
set con=nothing
if okflag=1 then
%> �����޳ɹ��������������������<br>
        user_name�ƣ�<%=user%><br>
        �û�pass_word��<%=password%><br>
        ����e_mail��<%=mail%><br>
        site_type��<%select case fenlei
                       case 1:  response.write"�ۺ��Ż�"
                      case 2:  response.write"���ҵ���"
                       case 3:  response.write"��������"
                      case 4:  response.write"��������"
                       case 5:  response.write"��������"
                       case 6:  response.write"���Ÿ���"
                        case 7:  response.write"������Ѷ"
                     case 8:  response.write"�Ļ�����"
                       case 9:  response.write"��ѧ����"
                        case 10:  response.write"��Ϸ����"
                        case 11:  response.write"��������"
                       case 12:  response.write"���̾���"
                        case 13:  response.write"����Ͷ��"
                      case 14:  response.write"����ý��"
                       case 15:  response.write"��н���"
                     case 16:  response.write"Ů�����"
                       case 17:  response.write"��������"
                      case 18:  response.write"�������"
case else:response.write"<font color='#ff0000'>���ϴ���</font>"
end select%><br>
        site_name��<%=sitename%><br>
        ��ҳ��ַ��<%=url%><br>
        site_about��<%=jiji%><br>
        <%end if
end if%> 
      </table>
    </td>
  </tr>
</table>
<!--#include file="2.htm" --> 

</body>
</html>
