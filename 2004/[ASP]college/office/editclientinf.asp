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
id=request("id")
name=request("name")
company=request("company")
address=request("address")
project=request("project")
tel=request("tel")
callno=request("callno")
handset=request("handset")
fax=request("fax")
remark=request("remark")
email=request("email")
postcard=request("postcard")
dept=request("dept")
sex=request("sex")
position=request("position")
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
<td><b>�༭�ͻ�����</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<form method="post" action="clientinf.asp">
<td><input type="submit" value="����"><input type="hidden" name="project" value="<%=request("project")%>">
</td>
</form>
</tr>
</table>
</center>
<%
call bgmid()
%>
<%
if request("delit")="ɾ��" then
set conn=opendb("oabusy","conn","accessdsn")
sql = "delete * from clientinf where id=" & id
conn.Execute sql
%>
<br><br>
<center>
<font color=red size=3>
�ɹ�ɾ���ͻ���Ϣ��
</font>
</center>
<%
else
if request("submit")="�޸�" then
set conn=opendb("oabusy","conn","accessdsn")
sql = "update clientinf set "
sql = sql & "name=" & SqlStr(name) & ", "
sql = sql & "company=" & SqlStr(company) & ", "
sql = sql & "address=" & SqlStr(address) & ", "
sql = sql & "project=" & SqlStr(project) & ", "
sql = sql & "tel=" & SqlStr(tel) & ", "
sql = sql & "callno=" & SqlStr(callno) & ", "
sql = sql & "handset=" & SqlStr(handset) & ", "
sql = sql & "fax=" & SqlStr(fax) & ", "
sql = sql & "remark=" & SqlStr(remark) & ", "
sql = sql & "email=" & SqlStr(email) & ", "
sql = sql & "postcard=" & SqlStr(postcard) & ", "
sql = sql & "dept=" & SqlStr(dept) & ", "
sql = sql & "sex=" & SqlStr(sex) & ", "
sql = sql & "position=" & SqlStr(position) & " where id=" & id
conn.Execute sql
%>
<br><br>
<center>
<font color=red size=3>
�ɹ��༭�ͻ���Ϣ��
</font>
</center>
<%
else
%>
<script Language="JavaScript">

 function form_check(){
   var l1=document.form1.name.value.length;
   if(l1==0){window.alert("�ͻ�����������");document.form1.name.focus();return (false);}

   var l2=document.form1.company.value.length;
   if(l2==0){window.alert("�ͻ����ڹ�˾������");document.form1.company.focus();return (false);}

   var l3=document.form1.project.value.length;
   if(l3==0){window.alert("ҵ����Ŀ������");document.form1.project.focus();return (false);}

                    }

</script>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from clientinf where id=" & id
rs.open sql,conn,1
%>
<center>
<form method="post" action="editclientinf.asp" name="form1">
<br>
  <table border="0" cellpadding="0" cellspacing="0" width="95%">
    <tr>
      <td align=center width="15%" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><b>�ͻ�����</b></td>
      <td style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><input type=text name="name" size=23 value="<%=rs("name")%>"><font color=red>*</font></td>
      <td align=center width="15%" style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><b>�ͻ��Ա�</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><select name="sex" size="1">
          <option value="��"<%=selected(rs("sex"),"��")%>>��</option>
          <option value="Ů"<%=selected(rs("sex"),"Ů")%>>Ů</option>
        </select></td>
     </tr>
     <tr>
      <td align=center style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>ְ&nbsp;&nbsp;&nbsp;&nbsp;λ</b></td>
      <td style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><input type=text name="position" size=23 value="<%=rs("position")%>"></td>
      <td align=center style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>ҵ����Ŀ</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><input type=text name="project" size=23 value="<%=rs("project")%>"><font color=red>*</font></td>
    </tr>
    <tr>
      <td align=center style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>���ڹ�˾</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000" colspan="3"><input type=text name="company" size=60 value="<%=rs("company")%>"><font color=red>*</font></td>
    </tr>
    <tr>
      <td align=center style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>��&nbsp;&nbsp;&nbsp;&nbsp;��</b></td>
      <td style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><input type=text name="dept" size=23 value="<%=rs("dept")%>"></td>
      <td align=center style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>��������</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><input type=text name="postcard" size=23 value="<%=rs("postcard")%>"></td>
    </tr>
    <tr>
      <td align=center style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>��˾��ַ</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000" colspan="3"><input type=text name="address" size=60value="<%=rs("address")%>"></td>
    </tr>
    <tr>
      <td align=center style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>�������</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000" colspan="3"><input type=text name="fax" size=60value="<%=rs("fax")%>"></td>
    </tr>
    <tr>
      <td align=center style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>��ϵ�绰</b></td>
      <td style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><input type=text name="tel" size=23 value="<%=rs("tel")%>"></td>
      <td align=center style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>��&nbsp;&nbsp;&nbsp;&nbsp;��</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><input type=text name="handset" size=23 value="<%=rs("handset")%>"></td>
    </tr>
    <tr>
      <td align=center style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>��&nbsp;&nbsp;&nbsp;&nbsp;��</b></td>
      <td style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><input type=text name="callno" size=23 value="<%=rs("callno")%>"></td>
      <td align=center style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>��������</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><input type=text name="email" size=23 value="<%=rs("email")%>"></td>
    </tr>
    <tr>
      <td align=center style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 2 solid #000000"><b>��ע˵��</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 0 solid #000000; border-bottom: 2 solid #000000" colspan="3"><textarea rows="4" cols="59" name="remark"><%=rs("remark")%></textarea></td>
    </tr>
  </table>
<input type="hidden" name="id" value=<%=id%>>
  <font color=red>*</font>������д&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="submit" value="�޸�" onclick="return form_check();">&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="delit" value="ɾ��" onclick="return window.confirm('�˲����������޷��ָ�����ȷʵҪɾ����Ա����Ϣ��');">
</form>
</center>
<%
end if
end if
%>
<%
call bgback()
%>
</body>
</html>









