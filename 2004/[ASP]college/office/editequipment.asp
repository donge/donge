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
<center><b>�༭��Դ</b></center>
<%
call bgmid()
%>
<center>
<%
equipment=request("equipment")
controller=request("controller")
remark=request("remark")
id=request("id")
oldequipment=request("oldequipment")

if request("submit")="�޸�" then
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from equipment where equipment=" & sqlstr(equipment) & " and id<>" & id
rs.open sql,conn,1
if not rs.eof and not rs.bof then
%>
<br><br>�µ���Դ����ԭ����Դ��¼��ͻ��<br><br>
<input type="button" value="����" onclick="window.location.href='editequipment.asp';">
<%
else
set conn=opendb("oabusy","conn","accessdsn")
sql = "update equipment set equipment=" & sqlstr(equipment) & ",controller=" & sqlstr(controller) & ",remark=" & sqlstr(remark) & " where id=" & id
conn.Execute sql
sql="update booking set equipment=" & sqlstr(equipment) & " where equipment=" & sqlstr(oldequipment)
conn.Execute sql
%>
<br><br>��Դ�޸ĳɹ���<br><br>
<form method="post" action="booking.asp"><input type="submit" value="����"></form>
<%
end if


else
if request("submit")="ɾ��" then
set conn=opendb("oabusy","conn","accessdsn")
sql="delete * from equipment where id=" & id
conn.Execute sql
sql="delete * from booking where equipment=" & sqlstr(oldequipment)
conn.Execute sql
%>
<br><br>�ɹ�ɾ����Դ��<br><br>
<form method="post" action="booking.asp"><input type="submit" value="����"></form>
<%
else
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from equipment where id=" & id
rs.open sql,conn,1
%>
<br>
<form method="post" name="form1" action="editequipment.asp">
  <table border="1" cellpadding="0" cellspacing="0">
    <tr>
      <td>���޸ĵ���Դ���ƣ�<input type=text size="20" name="equipment" value="<%=rs("equipment")%>"><font color=red>*</font></td>
    </tr>
    <tr>
      <td>��Դά�������Ա��<input type=text size="20" name="controller" value="<%=rs("controller")%>"></td>
    </tr>
    <tr>
      <td align="center">˵��</td>
    </tr>
    <tr>
      <td align="center"><textarea rows="5" cols="35" name="remark"><%=rs("remark")%></textarea><br><font color=red>*</font>�����&nbsp;&nbsp;<input type="button" value="����" onclick="window.location.href='booking.asp'">
&nbsp;&nbsp;<input type="submit" name="submit" value="�޸�" onclick="return check_form();">&nbsp;&nbsp;<input type="submit" name="submit" value="ɾ��" onclick="return window.confirm('��ɾ�����������ָܻ��������Ҫɾ����');"><input type="hidden" name="id" value=<%=id%>><input type="hidden" name="oldequipment" value="<%=rs("equipment")%>"></td>
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
end if
%>
</center>
<%
call bgback()
%>
</body>
</html>












