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
<title>网络办公系统</title>
</head>
<body bgcolor="#eeeeee" topmargin="5" leftmargin="5">
<% call bghead() %>
<%
'打开数据库读出用户名
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
<b>编辑<%=name%>的考核信息</b>&nbsp;&nbsp;
</td>
<form method="post" action="checkinf.asp" name="form2"><td>
<input type="hidden" name="userdept" value="<%=request("userdept")%>">
<input type="hidden" name="username" value="<%=request("username")%>">
<input type="submit" value="返回">
</td>
</form>
</tr>
</table>
</center>
<%
call bgmid()
%>
<%
if request("submit")="修改" then
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
<center><font color=red size=3>成功修改员工考核信息！</font></center>
<%
else
if request("submit")="删除" then
set conn=opendb("oabusy","conn","accessdsn")
sql="delete from checkinf where id=" & request("id")
conn.Execute sql
%>
<br><br>
<center><font color=red size=3>成功删除员工考核信息！</font></center>
<%
else
%>
<script Language="JavaScript">

 function form_check(){
   var l1=document.form1.checkname.value;
   if(l1==""){window.alert("考核名称必须填写！");document.form1.checkname.focus();return (false);}

   var l2=document.form1.checkdate.value;
   if(l2==""){window.alert("考核时间必须填写！");document.form1.checkdate.focus();return (false);}
                    }



</script>
<%
'打开数据库，读出职务变动信息
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
      <td height="25" width="15%" style="border-left: 2 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000" align="center"><b>员工姓名</b></td>
      <td colspan="3" width="85%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><%=name%>
      </td>
    </tr>
    <tr>
      <td width="15%" style="border-left: 2 solid #000000; border-bottom: 1 solid #000000" align="center"><b>考核名称</b></td>
      <td width="35%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="checkname" size=10 value="<%=rs("checkname")%>"><font color=red>*</font> 
      </td>
      <td width="15%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000" align="center"><b>考核时间</b></td>
      <td width="35%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="checkdate" size=10 value="<%=rs("checkdate")%>"><font color=red>*</font>  
      </td>
    </tr>
    <tr>
      <td style="border-left: 2 solid #000000; border-bottom: 1 solid #000000" width="15%" align="center"><b>考核类型</b></td>
      <td style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="checksort" size=10 value="<%=rs("checksort")%>">
      </td>
      <td style="border-left: 1 solid #000000; border-bottom: 1 solid #000000" width="15%" align="center"><b>考核方式</b></td>
      <td style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="checktype" size=10 value="<%=rs("checktype")%>"> 
      </td>
    </tr>
    <tr>
      <td style="border-left: 2 solid #000000; border-bottom: 1 solid #000000" width="15%" align="center"><b>考核评语</b></td>
      <td width="85%" colspan="3" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><textarea rows="3" name="checkcommment" cols="46"><%=rs("checkcommment")%></textarea>
      </td>
    </tr>
    </tr>
      <td style="border-left: 2 solid #000000; border-bottom: 1 solid #000000" width="15%" align="center"><b>考核结果</b></td>
      <td width="85%" colspan="3" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><textarea rows="3" name="checkresult" cols="46"><%=rs("checkresult")%></textarea>
      </td>
    </tr>
    <tr>
      <td width="15%" style="border-left: 2 solid #000000; border-bottom: 2 solid #000000" align="center"><b>备注说明</b></td>
      <td colspan="3" width="85%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 2 solid #000000"><textarea rows="3" name="remark" cols="46"><%=rs("remark")%></textarea>
      </td>
    </tr>
  </table>
<br>
<input type="hidden" name="userdept" value="<%=request("userdept")%>">
<input type="hidden" name="username" value="<%=request("username")%>">
<input type="hidden" name="id" value=<%=request("id")%>>
<input type="submit" name="submit" value="修改">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="submit" value="删除" onclick="return window.confirm('你确定要删除这条变动记录吗？')">
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










