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
'�����ݿ⣬�����༭ͨѶ¼Ȩ��
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where username=" & sqlstr(oabusyusername)
rs.open sql,conn,1
allow_edit_person_addressinf=rs("allow_edit_person_addressinf")
allow_edit_dept_addressinf=rs("allow_edit_dept_addressinf")
allow_edit_all_addressinf=rs("allow_edit_all_addressinf")
allow_edit_client_addressinf=rs("allow_edit_client_addressinf")
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
<td><b><%=request("name")%>ͨѶ¼</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<%
if (allow_edit_person_addressinf="yes" and request("username")=oabusyusername) or (allow_edit_dept_addressinf="yes" and request("userdept")=oabusyuserdept) or allow_edit_all_addressinf="yes" then
%>
<form method="post" action="editstafaddressinf.asp">
<td><input type="submit" name="submit" value="�༭"></td>
<input type="hidden" name="userdept" value="<%=request("userdept")%>">
<input type="hidden" name="username" value="<%=request("username")%>">
<input type="hidden" name="name" value="<%=request("name")%>">
<input type="hidden" name="userlevel" value="<%=request("userlevel")%>">
</form>
<%
end if
%>
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
<table height=20 border="0" cellpadding="0" cellspacing="0" width="95%">
<tr><td></td></tr></table>
<%
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
end if

%>



<table border="0" cellpadding="0" cellspacing="0" width="95%">
  <tr>
    <td height=25 align="center" width="15%" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><b>Ա������</b></td>
    <td width="35%" style="border-right: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><%=request("name")%></td>
    <td align="center" width="15%" style="border-right: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><b>�Ա�</b></td>
    <td width="35%" style="border-right: 2 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(sex)%></td>
  </tr>
  <tr>
    <td height=25 align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>���ڲ���</b></td>
    <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><%=request("userdept")%></td>
    <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>ְ��</b></td>
    <td style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=request("userlevel")%></td>
  </tr>
  <tr>
    <td height=25 align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>�绰��ֻ�</b></td>
    <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(companytel)%></td>
    <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>����</b></td>
    <td style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(fax)%></td>
  </tr>
  <tr>
    <td height=25 align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>�ֻ�����</b></td>
    <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(handset)%></td>
    <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>����</b></td>
    <td style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(callset)%></td>
  </tr>
  <tr>
    <td height=25 align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>סլ�绰</b></td>
    <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(hometel)%></td>
    <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>Email</b></td>
    <td style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=maillink(email)%></td>
  </tr>
  <tr>
    <td height=25 align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>�����ַ</b></td>
    <td colspan="3" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(homeaddress)%></td>
  </tr>
  <tr>
    <td height=25 align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>�����ʱ�</b></td>
    <td colspan="3" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(postcard)%></td>
  </tr>
  <tr>
    <td height=25 align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 2 solid #000000"><b>��ע˵��</b></td>
    <td colspan="3" style="border-right: 2 solid #000000; border-bottom: 2 solid #000000"><%=checked3(keepformat(remark))%></td>
  </tr>
</table>
</center>
<br>
<%
call bgback()
%>

</body>
</html>