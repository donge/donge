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
'�����ݿ�����༭���ʵ�Ȩ��
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select allow_edit_all_wageinf,allow_edit_dept_wageinf from userinf where username=" & sqlstr(oabusyusername)
rs.open sql,conn,1
cook_allow_edit_all_wageinf=rs("allow_edit_all_wageinf")
cook_allow_edit_dept_wageinf=rs("allow_edit_dept_wageinf")
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
<b>Ա�����ʵ���</b>&nbsp;&nbsp;
</td>
<%
if cook_allow_edit_all_wageinf="yes" then
%>
<form action="wageinf.asp" method=get name="form1">
<td>
<select name="userdept" size=1 onChange="document.form1.submit();">
<%
'�����ݿ��������
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select DISTINCT userdept from userinf"
rs.open sql,conn,1
if not rs.eof and not rs.bof then firstdept=rs("userdept")
if request("userdept")<>"" then firstdept=request("userdept")
while not rs.eof and not rs.bof
%>
<option value="<%=rs("userdept")%>"<%=selected(firstdept,rs("userdept"))%>><%=rs("userdept")%></option>
<%
rs.movenext
wend
%>
</select>
</td>
</form>
<%
else
firstdept=oabusyuserdept
end if
%>
<%
if cook_allow_edit_all_wageinf="yes" or cook_allow_edit_dept_wageinf="yes" then
%>
<form action="wageinf.asp" method=get name="form2">
<td>
<input type="hidden" name="userdept" value="<%=firstdept%>">
<select name="username" size=1>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select name,username from userinf where userdept=" & sqlstr(firstdept) & " and userlevel<>'�ܹ�' and forbid='no'"
rs.open sql,conn,1
if not rs.eof and not rs.bof then username=rs("username")
if request("username")<>"" then username=request("username")
while not rs.eof and not rs.bof
%>
<option value="<%=rs("username")%>"<%=selected(username,rs("username"))%>><%=rs("name")%></option>
<%
rs.movenext
wend
%>
</select>
<td>
<input type="submit" name="submit" value="��ѯ">
</td>
</form>
<form method="post" action="addwageinf.asp">
<td>
<input type="hidden" name="userdept" value="<%=firstdept%>">
<input type="hidden" name="username" value="<%=username%>">
<input type="submit" value="���ӵ���">
</td>
</form>
<%
else
username=oabusyusername
end if
%>
</tr>
</table>
</center>
<%
call bgmid()
%>
<%
'�����ݿ����Ա������
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select name from userinf where username=" & sqlstr(username)
rs.open sql,conn,1
name=rs("name")
%>
<br>
<center><b><%=name%>�Ĺ��ʵ���</b></center>
<br>
<%
'�����ݿ⣬����Ա���������ݿ�
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from wageinf where username=" & sqlstr(username)
rs.open sql,conn,1
while not rs.eof and not rs.bof
wagelevel=rs("wagelevel")
basewage=rs("basewage")
stafjob=rs("stafjob")
jobwage=rs("jobwage")
workyear=rs("workyear")
workyearwage=rs("workyearwage")
rentwage=rs("rentwage")
carwage=rs("carwage")
prize=rs("prize")
insurance=rs("insurance")
tax=rs("tax")
affairday=rs("affairday")
affairfund=rs("affairfund")
sickday=rs("sickday")
sickfund=rs("sickfund")
mustwage=rs("mustwage")
actwage=rs("actwage")
changreason=rs("changreason")
actdate=rs("actdate")
remark=rs("remark")
recname=rs("recname")
recdate=rs("recdate")
updatename=rs("updatename")
updatedate=rs("updatedate")
id=rs("id")
%>
<center>
<b>ְԱ����:</b><%=name%>
  <table border="0" cellpadding="0" cellspacing="0" width="95%">
    <tr>
      <td height="25" align="center" width="15%" style="border-left: 2 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><b>���ʼ���</b></td>
      <td height="25" width="18%" style="border-left: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(wagelevel)%></td>
      <td height="25" align="center" width="15%" style="border-left: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><b>��������</b></td>
      <td height="25" width="18%" style="border-left: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(basewage)%></td>
      <td height="25" align="center" width="15%" style="border-left: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><b>Ա��ְ��</b></td>
      <td height="25" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(stafjob)%></td>
    </tr>
    <tr>
      <td height="25" align="center" width="15%" style="border-left: 2 solid #000000; border-bottom: 1 solid #000000"><b>ְ����</b></td>
      <td height="25" width="18%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(jobwage)%></td>
      <td height="25" align="center" width="15%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><b>Ա������</b></td>
      <td height="25" width="18%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(workyear)%></td>
      <td height="25" align="center" width="15%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><b>���乤��</b></td>
      <td height="25" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(workyearwage)%></td>
    </tr>
    <tr>
      <td height="25" align="center" width="15%" style="border-left: 2 solid #000000; border-bottom: 1 solid #000000"><b>������</b></td>
      <td height="25" width="18%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(prize)%></td>
      <td height="25" align="center" width="15%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><b>���ⲹ��</b></td>
      <td height="25" width="18%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(rentwage)%></td>
      <td height="25" align="center" width="15%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><b>���Ѳ���</b></td>
      <td height="25" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(carwage)%>
      </td>
    </tr>
    <tr>
      <td height="25" align="center" width="15%" style="border-left: 2 solid #000000; border-bottom: 1 solid #000000"><b>�¼�����</b></td>
      <td height="25" width="18%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(affairday)%></td>
      <td height="25" align="center" width="15%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><b>���¼ٿ�</b></td>
      <td height="25" width="18%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(affairfund)%></td>
      <td height="25" align="center" width="15%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><b>��������</b></td>
      <td height="25" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(sickday)%></td>
    </tr>
    <tr>
      <td height="25" align="center" width="15%" style="border-left: 2 solid #000000; border-bottom: 1 solid #000000"><b>�۲��ٿ�</b></td>
      <td height="25" width="18%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(sickfund)%></td>
      <td height="25" align="center" width="15%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><b>������˰</b></td>
      <td height="25" width="18%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(tax)%></td>
      <td height="25" align="center" width="15%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><b>�����շ�</b></td>
      <td height="25" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(insurance)%></td>
    </tr>
    <tr>
      <td height="25" align="center" width="15%" style="border-left: 2 solid #000000; border-bottom: 1 solid #000000"><b>Ӧ�����</b></td>
      <td height="25" width="18%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(mustwage)%></td>
      <td height="25" align="center" width="15%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><b>ʵ�����</b></td>
      <td height="25" width="18%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(actwage)%></td>
      <td height="25" align="center" width="15%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><b>ִ��ʱ��</b></td>
      <td height="25" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(actdate)%></td>
    </tr>
    <tr>
      <td height="25" align="center" width="15%" style="border-left: 2 solid #000000; border-bottom: 1 solid #000000"><b>�䶯ԭ��</b></td>
      <td colspan="5" height="25" width="85%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(changreason)%></td>
    </tr>
    <tr>
      <td height="25" align="center" width="15%" style="border-left: 2 solid #000000; border-bottom: 1 solid #000000"><b>��ע˵��</b></td>
      <td colspan="5" height="25" width="85%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(remark)%></td>
    </tr>
  </table>
  <table width="95%" cellspacing="0" cellpadding="0">
    <tr>
      <td height="25" width="15%" align="center" style="border-left: 2 solid #000000; border-bottom: 1 solid #000000"><b>��&nbsp;¼&nbsp;��</b></td>
      <td height="25" width="35%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(recname)%></td>
      <td height="25" width="15%" align="center" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><b>��¼ʱ��</b></td>
      <td height="25" width="35%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(recdate)%></td>
    </tr>
    <tr>
      <td height="25" width="15%" align="center" style="border-left: 2 solid #000000; border-bottom: 2 solid #000000"><b>��&nbsp;��&nbsp;��</b></td>
      <td height="25" width="35%" style="border-left: 1 solid #000000; border-bottom: 2 solid #000000"><%=checked3(updatename)%></td>
      <td height="25" width="15%" align="center" style="border-left: 1 solid #000000; border-bottom: 2 solid #000000"><b>����ʱ��</b></td>
      <td height="25" width="35%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 2 solid #000000"><%=checked3(updatedate)%></td>
    </tr>
  </table>
<%
if cook_allow_edit_all_wageinf="yes" or cook_allow_edit_dept_wageinf="yes" then
%>
  <table border="0" cellpadding="0" cellspacing="0" width="95%">
    <tr><form method="post" action="editwageinf.asp">
      <td align=right><input type="submit" value="�༭">
<input type="hidden" name="userdept" value="<%=firstdept%>">
<input type="hidden" name="username" value="<%=username%>">
<input type="hidden" name="id" value=<%=id%>>
</td>
        </form>
    </tr>
  </table>
<%
end if
%>
<hr size=1 color=red width="95%">
<br>
</center>
<%
rs.movenext
wend 
%>

<%
call bgback()
%>
</body>
</html>










