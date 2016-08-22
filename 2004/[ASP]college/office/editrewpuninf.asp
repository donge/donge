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
<b>编辑<%=name%>的奖惩信息</b>&nbsp;&nbsp;
</td>
<form method="post" action="rewpuninf.asp" name="form2"><td>
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
rewpunname=request("rewpunname")
rewpundate=request("rewpundate")
rewpunfile=request("rewpunfile")
rewpunsort=request("rewpunsort")
rewpuntype=request("rewpuntype")
remark=request("remark")
updatename=oabusyname
updatedate=now()
id=request("id")
set conn=opendb("oabusy","conn","accessdsn")
sql = "Update rewpuninf set "
sql = sql & "rewpunname=" & SqlStr(rewpunname) & ", "
sql = sql & "rewpundate=" & SqlStr(rewpundate) & ", "
sql = sql & "rewpunfile=" & SqlStr(rewpunfile) & ", "
sql = sql & "rewpunsort=" & SqlStr(rewpunsort) & ", "
sql = sql & "rewpuntype=" & SqlStr(rewpuntype) & ", "
sql = sql & "remark=" & SqlStr(remark) & ", "
sql = sql & "updatename=" & SqlStr(updatename) & ", "
sql = sql & "updatedate=#" & updatedate & "# where id=" & id
conn.Execute sql
%>
<br><br>
<center><font color=red size=3>成功修改员工奖惩信息！</font></center>
<%
else
if request("submit")="删除" then
set conn=opendb("oabusy","conn","accessdsn")
sql="delete from rewpuninf where id=" & request("id")
conn.Execute sql
%>
<br><br>
<center><font color=red size=3>成功删除员工奖惩信息！</font></center>
<%
else
%>
<script Language="JavaScript">

 function form_check(){
   var l1=document.form1.rewpunname.value;
   if(l1==""){window.alert("奖惩名称必须填写！");document.form1.rewpunname.focus();return (false);}

   var l2=document.form1.rewpundate.value;
   if(l2==""){window.alert("奖惩日期必须填写！");document.form1.rewpundate.focus();return (false);}
                    }

</script>

<%
'打开数据库，读出职务变动信息
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from rewpuninf where id=" & request("id")
rs.open sql,conn,1
%>
<br>
<center>
<form method="post" action="editrewpuninf.asp" name="form1" onsubmit="return form_check();">
  <table border="0" cellpadding="0" cellspacing="0" width="95%">
    <tr>
      <td height="25" width="15%" style="border-left: 2 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000" align="center"><b>员工姓名</b></td>
      <td colspan="3" width="85%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><%=name%>
      </td>
    </tr>
    <tr>
      <td width="15%" style="border-left: 2 solid #000000; border-bottom: 1 solid #000000" align="center"><b>奖惩名称</b></td>
      <td colspan="3" width="85%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="rewpunname" size=45 value="<%=rs("rewpunname")%>"> 
      </td>
    </tr>
    <tr>
      <td style="border-left: 2 solid #000000; border-bottom: 1 solid #000000" width="15%" align="center"><b>奖惩日期</b></td>
      <td style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="rewpundate" size=10 value="<%=rs("rewpundate")%>"> 
      </td>
      <td style="border-left: 1 solid #000000; border-bottom: 1 solid #000000" width="15%" align="center"><b>奖惩文号</b></td>
      <td style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="rewpunfile" size=10 value="<%=rs("rewpunfile")%>"> 
      </td>
    </tr>
    <tr>
      <td style="border-left: 2 solid #000000; border-bottom: 1 solid #000000" width="15%" align="center"><b>奖惩类型</b></td>
      <td style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="rewpunsort" size=10 value="<%=rs("rewpunsort")%>">
      </td>
      <td style="border-left: 1 solid #000000; border-bottom: 1 solid #000000" width="15%" align="center"><b>奖惩方式</b></td>
      <td style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type="text" name="rewpuntype" size=10 value="<%=rs("rewpuntype")%>"> 
      </td>
    </tr>
    <tr>
      <td width="15%" style="border-left: 2 solid #000000; border-bottom: 2 solid #000000" align="center"><b>奖惩原因<br>
        备注说明</b></td>
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










