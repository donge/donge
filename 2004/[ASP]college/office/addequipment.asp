<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/checked.asp"-->
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
<center><b>�����µ���Դ</b></center>
<%
call bgmid()
%>
<center>
<%
if request("submit")="����" then
equipment=request("equipment")
controller=request("controller")
remark=request("remark")
'�����ݿ��ж��豸�����Ƿ��ظ�
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from equipment where equipment=" & sqlstr(equipment)
rs.open sql,conn,1
if not rs.eof and not rs.bof then
%>
<br><br>�������Դ������ԭ����¼�ظ������������룡<br><br>
<input type="button" value="����" onclick="window.location.href='addequipment.asp'">
<%
else
set conn=opendb("oabusy","conn","accessdsn")
sql = "Insert Into equipment (equipment,remark,controller) Values( "
sql = sql & SqlStr(equipment) & ", "
sql = sql & SqlStr(remark) & ", "
sql = sql & SqlStr(controller) & ")"
conn.Execute sql
%>
<br><br>�ɹ�������Դ��<br><br>
<form method="post" action="booking.asp">
<input type="submit" value="����">
</form>
<%
end if
else
%>
<br>
<form method="post" name="form1" action="addequipment.asp">
  <table border="1" cellpadding="0" cellspacing="0">
    <tr>
      <td>�����ӵ���Դ���ƣ�<input type=text size="20" name="equipment"><font color=red>*</font></td>
    </tr>
    <tr>
      <td>��Դά�������Ա��<input type=text size="20" name="controller"></td>
    </tr>
    <tr>
      <td align="center">˵��</td>
    </tr>
    <tr>
      <td align="center"><textarea rows="5" cols="35" name="remark"></textarea><br><input type="button" value="����" onclick="window.location.href='booking.asp'">
&nbsp;&nbsp;<font color=red>*</font>�����&nbsp;&nbsp;<input type="submit" name="submit" value="����" onclick="return check_form();"></td>
    </tr>
  </table>
</form>
<script Language="JavaScript">

 function check_form(){
   var equipment=document.form1.equipment.value;
   if(equipment.length==0){window.alert("��Դ���Ʊ�����");document.form1.equipment.focus();return (false);}
                    }

</script>

<%
end if
%>
</center>
<%
call bgback()
%>
</body>
</html>








