<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/keepformat.asp"-->
<!--#include file="asp/checked.asp"-->
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
<% call bghead() %>
<center>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from helpinf where id=" & request("id")
rs.open sql,conn,1
%>
<table>
<tr>
<td><b>�༭<%=rs("helptitle")%>������Ϣ</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<%
if request("submit")="ɾ��" then
%>
<form method="post" action="helpinf.asp">
<%
else
%>
<form method="post" action="showhelpinf.asp">
<%
end if
%>
<td><input type="submit" value="����"><input type="hidden" name="id" value=<%=rs("id")%>><input type="hidden" name="helpsort" value="<%=rs("helpsort")%>"></td></form></td>
</tr>
</table>
</center>
<%
call bgmid()
%>

<center>
<%
if request("submit")="�޸�" then
set conn=opendb("oabusy","conn","accessdsn")
sql = "update helpinf set helpsort=" & sqlstr(request("helpsort")) & ",helptitle=" & sqlstr(request("helptitle")) & ",helpcontent=" & sqlstr(request("helpcontent")) & " where id=" & request("id")
conn.Execute sql
%>
<br><br><font color=red size=3>�ɹ��޸İ�����Ϣ��</font>
<%
else
if request("submit")="ɾ��" then
set conn=opendb("oabusy","conn","accessdsn")
sql = "delete from helpinf where id=" & request("id")
conn.Execute sql
%>
<br><br><font color=red size=3>�ɹ�ɾ��������Ϣ��</font>
<%
else
%>
<br>
<script Language="JavaScript">
 function form_check(){
   var l1=document.form1.helptitle.value.length;
   if(l1<1){window.alert("���������д");document.form1.helptitle.focus();return (false);}

   var l2=document.form1.helpcontent.value.length;
   if(l2<1){window.alert("���ݱ�����д");document.form1.helpcontent.focus();return (false);}
                    }
</script>
<center>
<br>
<form method="post" action="edithelpinf.asp" name="form1" onsubmit="return form_check();">
<table border="1"  cellspacing="0" cellpadding="0">
<tr>
<td><b>��������</b></td><td><input type="text" name="helptitle" size=50 value="<%=rs("helptitle")%>"><font color=red>*</font></td>
</tr>
<tr>
<td><b>�������</b></td><td>
<select name="helpsort" size=1>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs1=server.createobject("adodb.recordset")
sql="select * from helpsort"
rs1.open sql,conn,1
while not rs1.eof and not rs1.bof
%>
<option value="<%=rs1("helpsort")%>"<%=selected(rs1("helpsort"),rs("helpsort"))%>><%=rs1("helpsort")%></option>
<%
rs1.movenext
wend
%>
</select><font color=red>*</font>&nbsp;&nbsp;&nbsp;&nbsp;(���Ҫ���ӻ��޸İ��������<a href="edithelpsort.asp">�ɴ˽���</a>)
</td>
</tr>
<tr>
<td><b>��������</b></td><td><textarea rows="9" name="helpcontent" cols="49"><%=rs("helpcontent")%></textarea><font color=red>*</font></td>
</tr>
</table>
<font color=red>*</font>�������д&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="submit" value="�޸�">&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="submit" value="ɾ��" onclick="return window.confirm('��ȷ��Ҫɾ������������Ϣ��')";>
<input type="hidden" name="id" value=<%=rs("id")%>>
</form>
<%
end if
end if
%>
</center>
<%
call bgback()
%>
</body>
</html>










