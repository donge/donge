<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/checked.asp"-->
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then response.redirect "default.asp"
username=request("username")
%>
<%
sub userinf(href)
if request("submit")="����" then
password=request("password")
name=request("name")
dept=request("dept")
userlevel=request("userlevel")
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql = "update userinf set "
sql = sql & "password=" & SqlStr(password) & ", "
sql = sql & "name=" & SqlStr(name) & ",userdept=" & sqlstr(dept) & ",userlevel=" & sqlstr(userlevel) & " where username=" & sqlstr(username)
conn.Execute sql
%>
<br><br>
<font color=red>�û�����ά���ɹ���</font>
<br><br>
<form mothed=post action="usercontrol.asp">
<input type="submit" name="submit" value="����">
</form>
<%
else

%>

<script Language="JavaScript">
 function maxlength(str,minl,maxl) {
    if(str.length <= maxl && str.length >= minl){return true;}else{return false;}
                                    }

 function form_check(){

   var l2=maxlength(document.form2.password.value,1,20);
   if(!l2){window.alert("����ĳ��ȴ���1λС��20λ");document.form2.password.focus();return (false);}

   var a1=document.form2.password.value;
   var a2=document.form2.repassword.value;
   if(a1!=a2){window.alert("�������������Ӧ��ͬ");document.form2.repassword.focus();return (false);}

   var l3=maxlength(document.form2.name.value,1,20);
   if(!l3){window.alert("�����ĳ��ȴ���1λС��20λ");document.form2.name.focus();return (false);}

                    }

</script>


<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where username=" & sqlstr(username)
rs.open sql,conn,1
%>

<form action="<%=href%>" method=post name="form2" onsubmit="return form_check();">
<table border=2>
<tr>
<td>
��&nbsp;��&nbsp;����<%=rs("username")%><input type="hidden" name="username" size=20 value="<%=rs("username")%>">
</td>
</tr>
<tr>
<td>
��&nbsp;&nbsp;&nbsp;&nbsp;�룺<input type="password" name="password" size=20 value="<%=rs("password")%>">
</td>
</tr>
<tr>
<td>
����ȷ�ϣ�<input type="password" name="repassword" size=20 value="<%=rs("password")%>">
</td>
</tr>
<tr>
<td>
��&nbsp;&nbsp;&nbsp;&nbsp;����<input type="text" name="name" size=20 value="<%=rs("name")%>">
</td>
</tr>
<tr>
<td>
��&nbsp;&nbsp;&nbsp;&nbsp;�ţ�
<select name="dept" size=1>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs1=server.createobject("adodb.recordset")
sql="select * from dept"
rs1.open sql,conn,1
while not rs1.eof and not rs1.bof
%>
<option value="<%=rs1("dept")%>"<%=selected(rs("userdept"),rs1("dept"))%>><%=rs1("dept")%></option>
<%
rs1.movenext
wend
%>
</select>
</td>
</tr>
<tr>
<td>
ְ&nbsp;&nbsp;&nbsp;&nbsp;λ��
<select name="userlevel" size=1>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs2=server.createobject("adodb.recordset")
sql="select * from userlevel"
rs2.open sql,conn,1
while not rs2.eof and not rs2.bof
%>
<option value="<%=rs2("userlevel")%>"<%=selected(rs("userlevel"),rs2("userlevel"))%>><%=rs2("userlevel")%></option>
<%
rs2.movenext
wend
%>
</select>
</td>
</tr>
<tr>
<td align=center>
<input type="submit" name="submit" value="����">&nbsp;&nbsp;<input type="button" value="����" onclick="window.location.href='usercontrol.asp'">
</td>
</tr>
</table>
</form>
<%
end if
end sub
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
<td><b>�༭�û�����</b></td>
</tr>
</table>
</center>
<%
call bgmid()
%>
<center>
<br>
<% call userinf("edituserinf.asp") %>
</center>
<%
call bgback()
%>

</body>
</html>