<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/opendb.asp"-->
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
<%
'�����ݿ�����û���
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select name from userinf where username=" & sqlstr(request("username"))
rs.open sql,conn,1
name=rs("name")
%>
<center>
<table>
<tr>
<td>
<b>�༭<%=name%>�Ŀ�����Ϣ</b>&nbsp;&nbsp;
</td>
<form method="post" action="checkinf.asp" name="form2"><td>
<input type="hidden" name="userdept" value="<%=request("userdept")%>">
<input type="hidden" name="username" value="<%=request("username")%>">
<input type="submit" value="����">
</td>
</form>
</tr>
</table>
</center>
<%
call bgmid()
%>
<%
if request("submit")="�޸�" then
username=request("username")
checkname=request("checkname")
checkdate=request("checkdate")
checkcommment=request("checkcommment")
checksort=request("checksort")
checktype=request("checktype")
checkresult=request("checkresult")
remark=request("remark")
updatename=oabusyname
updatedate=now()
id=request("id")
set conn=opendb("oabusy","conn","accessdsn")
sql = "Update checkinf set "
sql = sql & "checkname=" & SqlStr(checkname) & ", "
sql = sql & "checkdate=" & SqlStr(checkdate) & ", "
sql = sql & "checkcommment=" & SqlStr(checkcommment) & ", "
sql = sql & "checksort=" & SqlStr(checksort) & ", "
sql = sql & "checktype=" & SqlStr(checktype) & ", "
sql = sql & "checkresult=" & SqlStr(checkresult) & ", "
sql = sql & "remark=" & SqlStr(remark) & ", "
sql = sql & "updatename=" & SqlStr(updatename) & ", "
sql = sql & "updatedate=#" & updatedate & "# where id=" & id
conn.Execute sql
%>
<br><br>
<center><font color=red size=3>�ɹ��޸�Ա��������Ϣ��</font></center>
<%
else
if request("submit")="ɾ��" then
set conn=opendb("oabusy","conn","accessdsn")
sql="delete from checkinf where id=" & request("id")
conn.Execute sql
%>
<br><br>
<center><font color=red size=3>�ɹ�ɾ��Ա��������Ϣ��</font></center>
<%
else
%>
<script Language="JavaScript">

 function form_check(){
   var l1=document.form1.checkname.value;
   if(l1==""){window.alert("�������Ʊ�����д��");document.form1.checkname.focus();return (false);}

   var l2=document.form1.checkdate.value;
   if(l2==""){window.alert("����ʱ�������д��");document.form1.checkdate.focus();return (false);}
                    }



</script>
<%
'�����ݿ⣬����ְ��䶯��Ϣ
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from checkinf where id=" & request("id")
rs.open sql,conn,1
%>
<br>
<center>
<form method="post" action="editcheckinf.asp" name="form1" onsubmit="return form_check();">
  <table border="0" cellpadding="0" cellspacing="0" width="95%">
    <tr>
      <td height="25" width="15%" style="border-left: 2 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000" align="center"><b>Ա������</b></td>
      <td colspan="3" width="85%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><%=name%>
      </td>
    </tr>
    <tr>
      <td width="15%" style="border-left: 2 solid #000000; border-bottom: 1 solid #000000" align="center"><b>��������</b></td>
      <td width="35%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="checkname" size=10 value="<%=rs("checkname")%>"><font color=red>*</font> 
      </td>
      <td width="15%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000" align="center"><b>����ʱ��</b></td>
      <td width="35%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="checkdate" size=10 value="<%=rs("checkdate")%>"><font color=red>*</font>  
      </td>
    </tr>
    <tr>
      <td style="border-left: 2 solid #000000; border-bottom: 1 solid #000000" width="15%" align="center"><b>��������</b></td>
      <td style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="checksort" size=10 value="<%=rs("checksort")%>">
      </td>
      <td style="border-left: 1 solid #000000; border-bottom: 1 solid #000000" width="15%" align="center"><b>���˷�ʽ</b></td>
      <td style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="checktype" size=10 value="<%=rs("checktype")%>"> 
      </td>
    </tr>
    <tr>
      <td style="border-left: 2 solid #000000; border-bottom: 1 solid #000000" width="15%" align="center"><b>��������</b></td>
      <td width="85%" colspan="3" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><textarea rows="3" name="checkcommment" cols="46"><%=rs("checkcommment")%></textarea>
      </td>
    </tr>
    </tr>
      <td style="border-left: 2 solid #000000; border-bottom: 1 solid #000000" width="15%" align="center"><b>���˽��</b></td>
      <td width="85%" colspan="3" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><textarea rows="3" name="checkresult" cols="46"><%=rs("checkresult")%></textarea>
      </td>
    </tr>
    <tr>
      <td width="15%" style="border-left: 2 solid #000000; border-bottom: 2 solid #000000" align="center"><b>��ע˵��</b></td>
      <td colspan="3" width="85%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 2 solid #000000"><textarea rows="3" name="remark" cols="46"><%=rs("remark")%></textarea>
      </td>
    </tr>
  </table>
<br>
<input type="hidden" name="userdept" value="<%=request("userdept")%>">
<input type="hidden" name="username" value="<%=request("username")%>">
<input type="hidden" name="id" value=<%=request("id")%>>
<input type="submit" name="submit" value="�޸�">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="submit" value="ɾ��" onclick="return window.confirm('��ȷ��Ҫɾ�������䶯��¼��')">
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










