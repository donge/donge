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
<center>
<table>
<tr>
<td><b>输入帮助信息</b></td>
</tr>
</table>
</center>
<%
call bgmid()
%>
<%
if request("submit")="输入" then
set conn=opendb("oabusy","conn","accessdsn")
sql = "Insert Into helpinf (helpsort,helptitle,helpcontent) Values( "
sql = sql & SqlStr(request("helpsort")) & ", "
sql = sql & SqlStr(request("helptitle")) & ", "
sql = sql & SqlStr(request("helpcontent")) & ")"
conn.Execute sql
%>
<center><br><font color=red>成功输入帮助信息！</font>
<%
end if
%>
<script Language="JavaScript">
 function form_check(){
   var l1=document.form1.helptitle.value.length;
   if(l1<1){window.alert("标题必须填写");document.form1.helptitle.focus();return (false);}

   var l2=document.form1.helpcontent.value.length;
   if(l2<1){window.alert("内容必须填写");document.form1.helpcontent.focus();return (false);}
                    }
</script>
<center>
<br>
<form method="post" action="inputhelpinf.asp" name="form1" onsubmit="return form_check();">
<table border="1"  cellspacing="0" cellpadding="0">
<tr>
<td><b>帮助标题</b></td><td><input type="text" name="helptitle" size=50><font color=red>*</font></td>
</tr>
<tr>
<td><b>帮助类别</b></td><td>
<select name="helpsort" size=1>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from helpsort"
rs.open sql,conn,1
while not rs.eof and not rs.bof
%>
<option value="<%=rs("helpsort")%>"><%=rs("helpsort")%></option>
<%
rs.movenext
wend
%>
</select><font color=red>*</font>&nbsp;&nbsp;&nbsp;&nbsp;(如果要增加或修改帮助类别，请<a href="edithelpsort.asp">由此进入</a>)
</td>
</tr>
<tr>
<td><b>帮助内容</b></td><td><textarea rows="9" name="helpcontent" cols="49"></textarea><font color=red>*</font></td>
</tr>
</table>
<font color=red>*</font>项必须填写&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="submit" value="输入">
</form>
</center>
<%
call bgback()
%>
</body>
</html>










