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
<b>����<%=name%>��ְλ�䶯��Ϣ</b>&nbsp;&nbsp;
</td>
<form method="post" action="jobchanginf.asp" name="form2"><td>
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
if request("submit")="����" then
username=request("username")
oldjob=request("oldjob")
changjob=request("changjob")
changdate=request("changdate")
changfile=request("changfile")
changsort=request("changsort")
changtype=request("changtype")
changreason=request("changreason")
recusername=oabusyname
updateusername=oabusyname
set conn=opendb("oabusy","conn","accessdsn")
sql = "Insert Into changjob (username,oldjob,changjob,changdate,changfile,changsort,changtype,changreason,recusername,updateusername) Values( "
sql = sql & SqlStr(username) & ", "
sql = sql & SqlStr(oldjob) & ", "
sql = sql & SqlStr(changjob) & ", "
sql = sql & SqlStr(changdate) & ", "
sql = sql & SqlStr(changfile) & ", "
sql = sql & SqlStr(changsort) & ", "
sql = sql & SqlStr(changtype) & ", "
sql = sql & SqlStr(changreason) & ", "
sql = sql & SqlStr(recusername) & ", "
sql = sql & SqlStr(updateusername) & ")"
conn.Execute sql
%>
<br><br>
<center><font color=red size=3>�ɹ�����Ա��ְ��䶯��Ϣ��</font></center>
<%
else
%>


<script Language="JavaScript">

 function form_check(){
   var l1=document.form1.oldjob.value;
   if(l1==""){window.alert("ԭְ�������д��");document.form1.oldjob.focus();return (false);}

   var l2=document.form1.changjob.value;
   if(l2==""){window.alert("�䶯ְ�������д��");document.form1.changjob.focus();return (false);}

   var l3=document.form1.changdate.value;
   if(l3==""){window.alert("�䶯ʱ�������д��");document.form1.changdate.focus();return (false);}
                    }



</script>




<br>
<center>
<form method="post" action="addchangjob.asp" name="form1" onsubmit="return form_check();">
  <table border="0" cellpadding="0" cellspacing="0" width="95%">
    <tr>
      <td height="25" width="15%" style="border-left: 2 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000" align="center"><b>Ա������</b></td>
      <td colspan="3" width="85%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><%=name%>
      </td>
    </tr>
    <tr>
      <td width="15%" style="border-left: 2 solid #000000; border-bottom: 1 solid #000000" align="center"><b>ԭ&nbsp;ְ&nbsp;��</b></td>
      <td width="35%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="oldjob" size=10><font color=red>*</font> 
      </td>
      <td width="15%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000" align="center"><b>�䶯ְ��</b></td>
      <td width="35%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="changjob" size=10><font color=red>*</font>  
      </td>
    </tr>
    <tr>
      <td style="border-left: 2 solid #000000; border-bottom: 1 solid #000000" width="15%" align="center"><b>�䶯ʱ��</b></td>
      <td style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="changdate" size=10><font color=red>*</font> 
      </td>
      <td style="border-left: 1 solid #000000; border-bottom: 1 solid #000000" width="15%" align="center"><b>�䶯�ĺ�</b></td>
      <td style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="changfile" size=10> 
      </td>
    </tr>
    <tr>
      <td style="border-left: 2 solid #000000; border-bottom: 1 solid #000000" width="15%" align="center"><b>�䶯����</b></td>
      <td style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="changsort" size=10>
      </td>
      <td style="border-left: 1 solid #000000; border-bottom: 1 solid #000000" width="15%" align="center"><b>�䶯��ʽ</b></td>
      <td style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="changtype" size=10> 
      </td>
    </tr>
    <tr>
      <td width="15%" style="border-left: 2 solid #000000; border-bottom: 2 solid #000000" align="center"><b>�䶯ԭ��<br>
        ��ע˵��</b></td>
      <td colspan="3" width="85%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 2 solid #000000"><textarea rows="3" name="changreason" cols="46"></textarea>
      </td>
    </tr>
  </table>
<br>
<input type="hidden" name="userdept" value="<%=request("userdept")%>">
<input type="hidden" name="username" value="<%=request("username")%>">
<font color=red>*</font>Ϊ������&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="submit" value="����">
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










