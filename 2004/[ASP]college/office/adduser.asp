<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/bgsub.asp"-->
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then response.redirect "default.asp"
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
<%
call bghead()
%>
<center>
<table>
<tr>
<td><b>�����û�</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<form method="post" action="deptcontrol.asp">
<td>
<input type="submit" name="submit" value="�������ƹ���">
</td>
</form>
<form method="post" action="userlevelcontrol.asp">
<td>
<input type="submit" name="submit" value="ְλ���ƹ���">
</td>
</form>
</tr>
</table>
</center>
<%
call bgmid()
%>
<%
oabusyuserdept=request.cookies("oabusyuserdept")
if request("submit")="����" then
username=request("username")
password=request("password")
name=request("name")
userdept=request("userdept")
userlevel=request("userlevel")
'�ж��Ƿ�����������û�����ͬ��
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where username=" & sqlstr(username) & " and password=" & sqlstr(password)
rs.open sql,conn,1
if not rs.eof and not rs.bof then
%>
<center>
<br><br>
<font color=red>�û���Ϊ<%=username%>���û��Ѿ����ڣ���ѡ�������û���</font><br>
<a href="javascript:void(null)" onclick="history.go( -1 );return true;"><font color="blue">����</font></a>
</center>
<%
else
sql = "Insert Into userinf (username,password,name,userdept,userlevel) Values( "
sql = sql & SqlStr(username) & ", "
sql = sql & SqlStr(password) & ", "
sql = sql & SqlStr(name) & ", "
sql = sql & SqlStr(userdept) & ", "
sql = sql & SqlStr(userlevel) & ")"
conn.Execute sql
%>
<br><br>
<center>
<font color=red>�û���Ϊ<%=username%>���û�ע��ɹ���</font>
</center>
<%
end if
else
%>
<br>
<center>
<script Language="JavaScript">
 function maxlength(str,minl,maxl) {
    if(str.length <= maxl && str.length >= minl){return true;}else{return false;}
                                    }

 function form_check(){
   var l1=maxlength(document.form2.username.value,1,20);
   if(!l1){window.alert("�û����ĳ��ȴ���1λС��20λ");document.form2.username.focus();return (false);}

   var l2=maxlength(document.form2.password.value,1,20);
   if(!l2){window.alert("����ĳ��ȴ���1λС��20λ");document.form2.password.focus();return (false);}

   var a1=document.form2.password.value;
   var a2=document.form2.repassword.value;
   if(a1!=a2){window.alert("�������������Ӧ��ͬ");document.form2.repassword.focus();return (false);}

   var l3=maxlength(document.form2.name.value,1,20);
   if(!l3){window.alert("�����ĳ��ȴ���1λС��20λ");document.form2.name.focus();return (false);}

                    }

</script>


<form action="adduser.asp" method=post name="form2" onsubmit="return form_check();">
<table border=2>
<tr>
<td>
�û�����</td><td><input type=text name="username" size=20><font color=red>*</font>
</td>
</tr>
<tr>
<td>
���룺</td><td><input type="password" name="password" size=20><font color=red>*</font>
</td>
</tr>
<tr>
<td>
����ȷ�ϣ�</td><td><input type="password" name="repassword" size=20><font color=red>*</font>
</td>
</tr>
<tr>
<td>
������</td><td><input type="text" name="name" size=20><font color=red>*</font>
</td>
</tr>
<tr>
<td>
���ţ�</td><td>
<select size=1 name="userdept">
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from dept"
rs.open sql,conn,1
while not rs.eof and not rs.bof
%>
<option value="<%=rs("dept")%>"><%=rs("dept")%></option>
<%
rs.movenext
wend
%>
</select><font color=red>*</font>
</td>
</tr>
<tr>
<td>
ְλ:</td><td><select name="userlevel" size=1>
<option value="�ܹ�">�ܹ�</option>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userlevel"
rs.open sql,conn,1
while not rs.eof and not rs.bof
%>
<option value="<%=rs("userlevel")%>"><%=rs("userlevel")%></option>
<%
rs.movenext
wend
%>
</select><font color=red>*</font>
</td>
</tr>
<tr>
<td colspan="2" align=center>
<font color=red>*</font>������&nbsp;&nbsp;<input type="submit" name="submit" value="����">
</td>
</tr>
</table>
</form>
</center>
<%
end if
%>
<%
call bgback()
%>

</body>
</html>