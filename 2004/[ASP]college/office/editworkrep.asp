<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/bgsub.asp"-->
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
%>
<%
username=request("username")
superior=request("superior")
recdate=request("recdate")
id=request("id")
'打开数据库读出用户姓名
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select name from userinf where username=" & sqlstr(username)
rs.open sql,conn,1
if not rs.eof and not rs.bof then stafname=rs("name")
%>
<center>
<table border="0"  cellspacing="0" cellpadding="0">
<tr>
<td><b>编辑<%=stafname%>的工作计划（<%=recdate%>）</b></td>
<form action="displayworkrec.asp" method=post name="form1">
<td><input type="submit" name="addworkrep" value="返回"></td>
<input type="hidden" name="username" value="<%=username%>">
<input type="hidden" name="superior" value="<%=superior%>">
<input type="hidden" name="recdate" value="<%=recdate%>">
</form>
</tr>
</table>
</center>
<%
call bgmid()
%>
<%
if request("submit")="修改" then
title=request("title")
remark=request("remark")
finished=request("finished")
imp1=request("imp")
set conn=opendb("oabusy","conn","accessdsn")
sql = "update workrep set finished=" & sqlstr(finished) & ",imp=" & sqlstr(imp1) & ",title=" & sqlstr(title) & ",remark=" & sqlstr(remark) & " where id=" & id
conn.Execute sql
%>
<center>
<br><br><br>
<font color=red size=3>编辑成功！</font>
</center>
<%
else
if request("submit")="删除" then
set conn=opendb("oabusy","conn","accessdsn")
sql = "delete from workrep where id=" & id
conn.Execute sql
%>
<center>
<br><br><br>
<font color=red size=3>删除成功！</font>
</center>
<%
else
%>
&nbsp;
<%
'打开数据库读出id=id的记录
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from workrep where id=" & id
rs.open sql,conn,1
%>
<center>
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
<form action="editworkrep.asp" method=post name="form2" onsubmit="return form_check();">
<table border="1"  cellspacing="0" cellpadding="0" width=430>
<tr>
<td width=80>简要标题</td><td width=350>
<%
if (username=oabusyusername and rs("superior")="") or (rs("superior")=oabusyusername) then
%>
<input type="text" name="title" size=50 value="<%=rs("title")%>"><font color=red>*</font>
<%
else
%>
<input type="hidden" name="title" value="<%=rs("title")%>"><%=rs("title")%>
<%
end if
%>
</td>
</tr>
<tr>
<td>详细说明</td><td>
<%
if (username=oabusyusername and rs("superior")="") or (rs("superior")=oabusyusername) then
%>
<textarea rows="10" name="remark" cols="50"><%=rs("remark")%></textarea>
<%
else
%>
<input type="hidden" name="remark" value="<%=rs("remark")%>"><%=checked3(keepformat(rs("remark")))%>
<%
end if
%>
</td>
</tr>
<tr>
<td colspan=2>完成情况:
<%
if username=oabusyusername and superior="" then
%> 
<input type="radio" name="finished" value="yes"<%=checked("yes",rs("finished"))%>>已完成&nbsp;&nbsp;<input type="radio" name="finished" value="no"<%=checked("no",rs("finished"))%>>未完成<br>
<%
else
%>
<input type="hidden" name="finished" value="<%=rs("finished")%>">
<%=checked1("yes",rs("finished"))%>已完成&nbsp;&nbsp;<%=checked1("no",rs("finished"))%>未完成<br>
<%
end if
%>
重要程度:
<%
if (username=oabusyusername and rs("superior")="") or (rs("superior")=oabusyusername) then
%> 
<input type="radio" name="imp" value="yes"<%=checked("yes",rs("imp"))%>>重要&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="imp" value="no"<%=checked("no",rs("imp"))%>>一般
<%
else
%>
<%=checked1("yes",rs("imp"))%>重要&nbsp;&nbsp;&nbsp;&nbsp;<%=checked1("no",rs("imp"))%>一般
<input type="hidden" name="imp" value="<%=rs("imp")%>">
<%
end if
%>
</td>
</tr>
</table>
<input type="submit" name="submit" value="修改" >
<%
if (username=oabusyusername and rs("superior")="") or (rs("superior")=oabusyusername) then
%>
&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="submit" value="删除" onclick="return window.confirm('你确实要删除这条计划吗？');">
<%
end if
%>
<input type="hidden" name="username" value="<%=username%>">
<input type="hidden" name="superior" value="<%=superior%>">
<input type="hidden" name="recdate" value="<%=recdate%>">
<input type="hidden" name="id" value="<%=id%>">
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