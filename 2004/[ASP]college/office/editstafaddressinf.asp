<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/checked.asp"-->
<!--#include file="asp/maillink.asp"-->
<!--#include file="asp/keepformat.asp"-->
<%
'-----------------------------------------
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then response.redirect "default.asp"
'--------------------------------------
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="css/css.css">
<script language="javascript1.2" src="js/openwin.js"></script>
<title>����칫ϵͳ</title>
</head>
<body bgcolor="#eeeeee" topmargin="5" leftmargin="5">
<% call bghead() %>
<center>
<table>
<tr>
<td><b>�༭<%=request("name")%>ͨѶ¼</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<form method="post" action="stafaddressinf.asp">
<td><input type="submit" name="submit" value="����"></td>
<input type="hidden" name="userdept" value="<%=request("userdept")%>">
</form>
</tr>
</table>
</center>
<%
call bgmid()
%>

<center>

<%
'�������
if request("submit")="����" then
set conn=opendb("oabusy","conn","accessdsn")
sql = "Insert Into stafaddressinf (username,companytel,fax,hometel,homeaddress,postcard,sex,handset,callset,remark,email) Values( "
sql = sql & SqlStr(request("username")) & ", "
sql = sql & SqlStr(request("companytel")) & ", "
sql = sql & SqlStr(request("fax")) & ", "
sql = sql & SqlStr(request("hometel")) & ", "
sql = sql & SqlStr(request("homeaddress")) & ", "
sql = sql & SqlStr(request("postcard")) & ", "
sql = sql & SqlStr(request("sex")) & ", "
sql = sql & SqlStr(request("handset")) & ", "
sql = sql & SqlStr(request("callset")) & ", "
sql = sql & SqlStr(request("remark")) & ", "
sql = sql & SqlStr(request("email")) & ")"
conn.Execute sql
%>
<br><br>
<font color="red" size=3>����ɹ�!</font>

<%
else
if request("submit")="�޸�" then
set conn=opendb("oabusy","conn","accessdsn")
sql = "update stafaddressinf set "
sql = sql & "companytel=" & SqlStr(request("companytel")) & ", "
sql = sql & "fax=" & SqlStr(request("fax")) & ", "
sql = sql & "hometel=" & SqlStr(request("hometel")) & ", "
sql = sql & "homeaddress=" & SqlStr(request("homeaddress")) & ", "
sql = sql & "postcard=" & SqlStr(request("postcard")) & ", "
sql = sql & "sex=" & SqlStr(request("sex")) & ", "
sql = sql & "handset=" & SqlStr(request("handset")) & ", "
sql = sql & "callset=" & SqlStr(request("callset")) & ", "
sql = sql & "remark=" & SqlStr(request("remark")) & ", "
sql = sql & "email=" & SqlStr(request("email")) & " where username=" & sqlstr(request("username"))
conn.Execute sql 
%>
<br><br>
<font color=red size=3>�޸����!</font>
<%
else
if request("submit")="ɾ��" then
set conn=opendb("oabusy","conn","accessdsn")
sql="delete from stafaddressinf where username=" & sqlstr(request("username"))
conn.Execute sql
%>
<br><br>
<font color=red size=3>�ɹ�ɾ��ͨѶ���ϣ�</font>

<%

else

'�����ݿ����ͨѶ��Ϣ
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from stafaddressinf where username=" & sqlstr(request("username"))
rs.open sql,conn,1
if not rs.eof and not rs.bof then
companytel=rs("companytel")
fax=rs("fax")
hometel=rs("hometel")
homeaddress=rs("homeaddress")
postcard=rs("postcard")
sex=rs("sex")
handset=rs("handset")
callset=rs("callset")
remark=rs("remark")
email=rs("email")
submit="�޸�"
else
companytel=""
fax=""
hometel=""
homeaddress=""
postcard=""
sex=""
handset=""
callset=""
remark=""
email=""
submit="����"
end if

%>

<br>
<form method="post" action="editstafaddressinf.asp">
<table border="0" cellpadding="0" cellspacing="0" width="95%">
  <tr>
    <td height=25 align="center" width="15%" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><b>Ա������</b></td>
    <td width="35%" style="border-right: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><%=request("name")%></td>
    <td align="center" width="15%" style="border-right: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><b>�Ա�</b></td>
    <td width="35%" style="border-right: 2 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000">
<select name="sex" size=1>
<option value="��"<%=selected("��",sex)%>>��</option>
<option value="Ů"<%=selected("Ů",sex)%>>Ů</option>
</select>
</td>
  </tr>
  <tr>
    <td height=25 align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>���ڲ���</b></td>
    <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><%=request("userdept")%></td>
    <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>ְ��</b></td>
    <td style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=request("userlevel")%></td>
  </tr>
  <tr>
    <td height=25 align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>�绰��ֻ�</b></td>
    <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="companytel" size=20 value="<%=companytel%>"></td>
    <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>����</b></td>
    <td style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="fax" size=20 value="<%=fax%>"></td>
  </tr>
  <tr>
    <td height=25 align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>�ֻ�����</b></td>
    <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="handset" size=20 value="<%=handset%>"></td>
    <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>����</b></td>
    <td style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="callset" size=20 value="<%=callset%>"></td>
  </tr>
  <tr>
    <td height=25 align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>סլ�绰</b></td>
    <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="hometel" size=20 value="<%=hometel%>"></td>
    <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>Email</b></td>
    <td style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="email" size=20 value="<%=email%>"></td>
  </tr>
  <tr>
    <td height=25 align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>�����ַ</b></td>
    <td colspan="3" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="homeaddress" size=57 value="<%=homeaddress%>"></td>
  </tr>
  <tr>
    <td height=25 align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>�����ʱ�</b></td>
    <td colspan="3" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="postcard" size=57 value="<%=postcard%>"></td>
  </tr>
  <tr>
    <td height=25 align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 2 solid #000000"><b>��ע˵��</b></td>
    <td colspan="3" style="border-right: 2 solid #000000; border-bottom: 2 solid #000000"><textarea rows="2" name="remark" cols="56"><%=remark%></textarea>
</td>
  </tr>
</table>
<input type="submit" name="submit" value="<%=submit%>">&nbsp;&nbsp;<input type="submit" name="submit" value="ɾ��" onclick="return window.confirm('��ȷʵҪɾ�����ͨѶ������')">
<input type="hidden" name="userdept" value="<%=request("userdept")%>">
<input type="hidden" name="username" value="<%=request("username")%>">
<input type="hidden" name="name" value="<%=request("name")%>">
<input type="hidden" name="userlevel" value="<%=request("userlevel")%>">
</form>
<%
end if
end if
end if
%>
</center>
<%
call bgback()
%>

</body>
</html>