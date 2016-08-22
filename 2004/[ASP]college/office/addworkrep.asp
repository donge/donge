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
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="css/css.css">
<title>网络办公系统</title>
</head>
<body bgcolor="#eeeeee" topmargin="5" leftmargin="5">
<%
call bghead()
username=request("username")
superior=request("superior")
recdate=request("recdate")
'打开数据库读出用户姓名
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select name from userinf where username=" & sqlstr(username)
rs.open sql,conn,1
if not rs.eof and not rs.bof then stafname=rs("name")
%>
<table border="0"  cellspacing="0" cellpadding="0">
<tr><td>
<b>增加<%=stafname%>的工作计划</b>(<font color=red>*</font>项必须填写)
</td>
<form action="displayworkrec.asp" method=post name="form1">
<td><input type="submit" name="addworkrep" value="返回"></td>
<input type="hidden" name="username" value="<%=username%>">
<input type="hidden" name="superior" value="<%=superior%>">
<input type="hidden" name="recdate" value="<%=recdate%>">
</form>
</tr>
</table>
<%
call bgmid()
%>
<center>
<%
if request("addworkrep")="增加这项工作" then
title=request("title")
remark=request("remark")
set conn=opendb("oabusy","conn","accessdsn")
sql = "Insert Into workrep (username,recdate,title,remark,superior) Values( "
sql = sql & SqlStr(username) & ", "
sql = sql & "#" & recdate & "#" & ", "
sql = sql & SqlStr(title) & ", "
sql = sql & SqlStr(remark) & ", "
sql = sql & SqlStr(superior) & ")"
conn.Execute sql
%>
<br><br>
<font color=red size=3>成功增加工作计划！</font><br><br><br>
<%
else
%>
<script Language="JavaScript">
 function maxlength(str,minl,maxl) {
    if(str.length <= maxl && str.length >= minl){return true;}else{return false;}
                                    }

 function form_check(){
   var l1=maxlength(document.form2.title.value,1,50);
   if(!l1){window.alert("标题的长度大于1位小于50位");document.form2.title.focus();return (false);}

                    }

</script>
<br>
<form action="addworkrep.asp" method=post name="form2" onsubmit="return form_check();">
<table border="1"  cellspacing="0" cellpadding="0">
<tr>
<td>简要标题</td><td><input type="text" name="title" size=50><font color=red>*</font></td>
</tr>
<tr>
<td>详细说明</td><td><textarea rows="10" name="remark" cols="50"><%=content1%></textarea></td>
</tr>
</table>
<input type="submit" name="addworkrep" value="增加这项工作" >
<input type="hidden" name="username" value="<%=username%>">
<input type="hidden" name="superior" value="<%=superior%>">
<input type="hidden" name="recdate" value="<%=recdate%>">
</form>
<%
end if
%>
</center>
<%
call bgback()
%>