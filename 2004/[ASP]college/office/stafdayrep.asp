<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/monthlycal.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/checked.asp"-->
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then response.redirect "default.asp"
cook_allow_see_all_workrep=request.cookies("cook_allow_see_all_workrep")
cook_allow_see_dept_workrep=request.cookies("cook_allow_see_dept_workrep")

if request("username")<>"" then username=request("username")
'ȡ�õ�ǰ����
mydate=date
'ȡ�õ�ǰ��
mymonth=month(now())
if request("mymonth")<>"" then mymonth=cint(request("mymonth"))
'ȡ�õ�ǰ��
myyear=year(now())
if request("myyear")<>"" then myyear=cint(request("myyear"))
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
<%
if cook_allow_see_all_workrep="yes" then
%>
<table>
<tr>
<form action="stafdayrep.asp" method=get name="form1">
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
<form action="stafdayrep.asp" method=get name="form2">
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
<select name="myyear" size=1>
<option value=2001<%=selected(2001,myyear)%>>2001��</option>
<option value=2002<%=selected(2002,myyear)%>>2002��</option>
<option value=2003<%=selected(2003,myyear)%>>2003��</option>
<option value=2004<%=selected(2004,myyear)%>>2004��</option>
<option value=2005<%=selected(2005,myyear)%>>2005��</option>
<option value=2006<%=selected(2006,myyear)%>>2006��</option>
<option value=2007<%=selected(2007,myyear)%>>2007��</option>
<option value=2008<%=selected(2008,myyear)%>>2008��</option>
<option value=2009<%=selected(2009,myyear)%>>2009��</option>
</select>
<select name="mymonth" size=1>
<option value=1<%=selected(1,mymonth)%>>1��</option>
<option value=2<%=selected(2,mymonth)%>>2��</option>
<option value=3<%=selected(3,mymonth)%>>3��</option>
<option value=4<%=selected(4,mymonth)%>>4��</option>
<option value=5<%=selected(5,mymonth)%>>5��</option>
<option value=6<%=selected(6,mymonth)%>>6��</option>
<option value=7<%=selected(7,mymonth)%>>7��</option>
<option value=8<%=selected(8,mymonth)%>>8��</option>
<option value=9<%=selected(9,mymonth)%>>9��</option>
<option value=10<%=selected(10,mymonth)%>>10��</option>
<option value=11<%=selected(11,mymonth)%>>11��</option>
<option value=12<%=selected(12,mymonth)%>>12��&nbsp;&nbsp;</option>
</select>
<input type="submit" name="submit" value="��ѯ">
</td>
</form>
</tr>
</table>
<%
else
%>

<table>
<tr>
<form action="stafdayrep.asp" method=get name="form1">
<td>
<select name="username" size=1>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where userdept=" & sqlstr(oabusyuserdept) & " and userlevel<>'�ܹ�' and forbid='no'"
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
<select name="myyear" size=1>
<option value=2001<%=selected(2001,myyear)%>>2001��</option>
<option value=2002<%=selected(2002,myyear)%>>2002��</option>
<option value=2003<%=selected(2003,myyear)%>>2003��</option>
<option value=2004<%=selected(2004,myyear)%>>2004��</option>
<option value=2005<%=selected(2005,myyear)%>>2005��</option>
<option value=2006<%=selected(2006,myyear)%>>2006��</option>
<option value=2007<%=selected(2007,myyear)%>>2007��</option>
<option value=2008<%=selected(2008,myyear)%>>2008��</option>
<option value=2009<%=selected(2009,myyear)%>>2009��</option>
</select>
<select name="mymonth" size=1>
<option value=1<%=selected(1,mymonth)%>>1��</option>
<option value=2<%=selected(2,mymonth)%>>2��</option>
<option value=3<%=selected(3,mymonth)%>>3��</option>
<option value=4<%=selected(4,mymonth)%>>4��</option>
<option value=5<%=selected(5,mymonth)%>>5��</option>
<option value=6<%=selected(6,mymonth)%>>6��</option>
<option value=7<%=selected(7,mymonth)%>>7��</option>
<option value=8<%=selected(8,mymonth)%>>8��</option>
<option value=9<%=selected(9,mymonth)%>>9��</option>
<option value=10<%=selected(10,mymonth)%>>10��</option>
<option value=11<%=selected(11,mymonth)%>>11��</option>
<option value=12<%=selected(12,mymonth)%>>12��&nbsp;&nbsp;</option>
</select>
<input type="submit" name="submit" value="��ѯ">
</td>
</form>
</tr>
</table>
<%
end if
%>
<%
'��������
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where username=" & sqlstr(username)
rs.open sql,conn,1
if not rs.eof and not rs.bof then
name=rs("name")
else
%>
</center>
<%
call bgmid()
%>
<br><br><center><font color=red size=3>
����������Ա����������
</font></center>
<%
call bgback()
%>
<%
response.end
end if
%>
<%=name%>��<%=myyear%>��<%=mymonth%>�¹����ƻ�
</center>
<%
call bgmid()
%>
<br>
<center>����Ϊ��ɫ��ʾ�˹�������һ����û��ɣ�����Ϊ<font color=blue>��ɫ</font>��ʾ�˹�������һ���������<br>����Ϊ<font color=red>��ɫ</font>��ʾ�˹���������Ҫ��û��ɣ�����Ϊ<font color=#770000>��ɫ</font>��ʾ�˹���������Ҫ�������</center>
<br>
<% call monthlycal(username,oabusyusername) %>
<%
call bgback()
%>



</body>
</html>