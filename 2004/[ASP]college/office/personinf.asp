<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/checked.asp"-->
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
allow_edit_person_personinf=rs("allow_edit_person_personinf")
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
<td>
<b><%=oabusyname%>�ĸ��˻�������</b>&nbsp;&nbsp;
</td>
<%
if allow_edit_person_personinf="yes" then
%>
<form method="post" action="editpersoninf.asp"><td>
<input type="submit" value="�༭">
</td>
</form>
<form method="post" action="personinf.asp"><td>
<input type="submit" name="submit" value="ɾ��" onclick="return window.confirm('��ȷ��Ҫɾ����ĸ��˻���������');">
</td>
</form>
<%
end if
%>
</tr>
</table>
</center>
<%
call bgmid()
%>
<%
if request("submit")="ɾ��" then
set conn=opendb("oabusy","conn","accessdsn")
sql="delete from personinf where username=" & sqlstr(oabusyusername)
conn.execute sql
end if
'�����ݿ⣬�������˵���
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from personinf where username=" & sqlstr(oabusyusername)
rs.open sql,conn,1
dim a(33)
if not rs.eof and not rs.bof then
for i=1 to 33
a(i)=rs("a" & i)
next
inputdate=rs("inputdate")
updatedate=rs("updatedate")
havephoto=rs("havephoto")
id=rs("id")
else
for i=1 to 33
a(i)=""
next
inputdate=""
updatedate=""
havephoto="no"
end if
%>
<center>
<br>
<table border="0" cellpadding="0" cellspacing="0" width="95%">        
  <tr>        
    <td width="30%"><b>Ա����ţ�</b><%=a(1)%></td>        
    <td width="35%"><b>¼��ʱ�䣺</b><%=inputdate%></td>        
    <td align="right"><b>�޸�ʱ�䣺</b><%=updatedate%></td>        
  </tr>        
</table>        
    
<table border="0" cellpadding="0" cellspacing="0" width="95%">        
    <tr>        
      <td width="15%" align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><b>��&nbsp;&nbsp;&nbsp;&nbsp;��</b></td>        
      <td width="35%" style="border-right: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><%=oabusyname%></td>        
      <td width="15%" align="center" style="border-right: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><b>��&nbsp;��&nbsp;��</b></td>        
      <td width="100%" style="border-right: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(2))%></td>        
      <td width="80" height="100" rowspan="5" align="center" valign=center style="border-right: 2 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000">
<%
if havephoto="yes" then
%>
<img src="showphoto.asp?id=<%=id%>" width="80" height="100" border="0">
<%
else
%>
<table width=80>
<tr>
<td align=center>
��<br>��<br>Ƭ
</td>
</tr></table>
<%
end if
%>
</td>        
    </tr>        
    <tr>        
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>��&nbsp;&nbsp;&nbsp;&nbsp;��</b></td>        
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(3))%></td>        
      <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>��&nbsp;&nbsp;&nbsp;&nbsp;��</b></td>        
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(4))%></td>        
    </tr>        
    <tr>        
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>��������</b></td>        
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><%=oabusyuserdept%></td>        
      <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>ְ&nbsp;&nbsp;&nbsp;&nbsp;��</b></td>        
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><%=oabusyuserlevel%></td>        
    </tr>        
    <tr>        
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>ְ&nbsp;&nbsp;&nbsp;&nbsp;��</b></td>        
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(5))%></td>        
      <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>��������</b></td>        
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(6))%></td>        
    </tr>        
    <tr>        
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>������ò</b></td>        
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(7))%></td>        
      <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>����״��</b></td>        
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(8))%></td>        
    </tr>        
    <tr>        
      <td align="center" width="15%" height="20" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>��&nbsp;&nbsp;&nbsp;&nbsp;��</b></td>        
      <td width="35%" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(9))%></td>        
      <td width="15%" align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>��&nbsp;&nbsp;&nbsp;&nbsp;��</b></td>        
      <td width="35%" colspan="2" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(10))%></td>        
    </tr>        
    <tr>        
      <td height="20" align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>����֤��</b></td>        
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(11))%></td>        
      <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>��&nbsp;&nbsp;&nbsp;&nbsp;��</b></td>        
      <td colspan="2" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(12))%></td>        
    </tr>        
    <tr>        
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000" height="20"><b>����״��</b></td>        
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(13))%></td>        
      <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>��ҵԺУ</b></td>        
      <td colspan="2" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(14))%></td>        
    </tr>        
    <tr>        
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000" height="20"><b>���˳ɷ�</b></td>        
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(15))%></td>        
      <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>ר&nbsp;&nbsp;&nbsp;&nbsp;ҵ</b></td>        
      <td colspan="2" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(16))%></td>        
    </tr>        
    <tr>        
      <td height="20" align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>��&nbsp;&nbsp;&nbsp;&nbsp;��</b></td>        
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(17))%></td>        
      <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>ѧ&nbsp;&nbsp;&nbsp;&nbsp;��</b></td>        
      <td colspan="2" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(18))%></td>        
    </tr>        
    <tr>        
      <td height="20" align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>��������</b></td>        
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(19))%></td>        
      <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>����ˮƽ</b></td>        
      <td colspan="2" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(20))%></td>        
    </tr>        
    <tr>        
      <td height="20" align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>��ͨ���̶�</b></td>        
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(21))%></td>        
      <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>����̶�</b></td>        
      <td colspan="2" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(22))%></td>        
    </tr>        
    <tr>        
      <td height="20" align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>���������</b></td>        
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(23))%></td>        
      <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>�������ڵ�</b></td>        
      <td colspan="2" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(24))%></td>        
    </tr>        
    <tr>        
      <td height="20" align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>��&nbsp;ס&nbsp;ַ</b></td>        
      <td colspan="4" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(25))%></td>        
    </tr>        
    <tr>        
      <td height="20" align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>������ŵ�</b></td>        
      <td colspan="4" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(26))%></td>        
    </tr>        
    <tr>        
      <td height="20" align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>����ר��<br>        
        �Լ�����</b></td>        
      <td colspan="4" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(a(27))%></td>        
    </tr>        
    <tr>        
      <td height="20" align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>��������<br>�����ֽ�<br>���ʹ���</b></td>        
      <td colspan="4" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=keepformat(checked3(a(28)))%></td>        
    </tr>        
    <tr>        
      <td height="20" align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>��������</b></td>        
      <td colspan="4" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=keepformat(checked3(a(29)))%></td>        
    </tr>        
    <tr>        
      <td height="20" align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>��ͥ���</b></td>        
      <td colspan="4" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=keepformat(checked3(a(30)))%></td>        
    </tr>        
    <tr>        
      <td height="20" align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>��&nbsp;&nbsp;&nbsp;&nbsp;��<br>��ϵ��ʽ</b></td>        
      <td colspan="4" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=keepformat(checked3(a(31)))%></td>        
    </tr>        
    <tr>        
      <td height="20" align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>��������<br>�������<br>֪ͨ����</b></td>        
      <td colspan="4" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=keepformat(checked3(a(32)))%></td>         
    </tr>         
    <tr>         
      <td height="20" align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 2 solid #000000"><b>��&nbsp;&nbsp;&nbsp;&nbsp;ע</b></td>        
      <td colspan="4" style="border-right: 2 solid #000000; border-bottom: 2 solid #000000"><%=keepformat(checked3(a(33)))%></td>        
    </tr>        
</table>        
<table>
<tr>
<td>
<b><%=oabusyname%>�ĸ��˻�������</b>&nbsp;&nbsp;
</td>
<%
if allow_edit_person_personinf="yes" then
%>
<form method="post" action="editpersoninf.asp"><td>
<input type="submit" value="�༭">
</td>
</form>
<form method="post" action="personinf.asp"><td>
<input type="submit" name="submit" value="ɾ��" onclick="return window.confirm('��ȷ��Ҫɾ����ĸ��˻���������');">
</td>
</form>
<%
end if
%>
</tr>
</table>
<br>

</center>
<%
call bgback()
%>
</body>
</html>









