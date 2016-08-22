<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/opendb.asp"-->
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
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from helpinf where id=" & request("id")
rs.open sql,conn,1
%>
<table>
<tr>
<td><b>编辑<%=rs("helptitle")%>帮助信息</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<%
if request("submit")="删除" then
%>
<form method="post" action="helpinf.asp">
<%
else
%>
<form method="post" action="showhelpinf.asp">
<%
end if
%>
<td><input type="submit" value="返回"><input type="hidden" name="id" value=<%=rs("id")%>><input type="hidden" name="helpsort" value="<%=rs("helpsort")%>"></td></form></td>
</tr>
</table>
</center>
<%
call bgmid()
%>

<center>
<%
if request("submit")="修改" then
set conn=opendb("oabusy","conn","accessdsn")
sql = "update helpinf set helpsort=" & sqlstr(request("helpsort")) & ",helptitle=" & sqlstr(request("helptitle")) & ",helpcontent=" & sqlstr(request("helpcontent")) & " where id=" & request("id")
conn.Execute sql
%>
<br><br><font color=red size=3>成功修改帮助信息！</font>
<%
else
if request("submit")="删除" then
set conn=opendb("oabusy","conn","accessdsn")
sql = "delete from helpinf where id=" & request("id")
conn.Execute sql
%>
<br><br><font color=red size=3>成功删除帮助信息！</font>
<%
else
%>
<br>
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
<form method="post" action="edithelpinf.asp" name="form1" onsubmit="return form_check();">
<table border="1"  cellspacing="0" cellpadding="0">
<tr>
<td><b>帮助标题</b></td><td><input type="text" name="helptitle" size=50 value="<%=rs("helptitle")%>"><font color=red>*</font></td>
</tr>
<tr>
<td><b>帮助类别</b></td><td>
<select name="helpsort" size=1>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs1=server.createobject("adodb.recordset")
sql="select * from helpsort"
rs1.open sql,conn,1
while not rs1.eof and not rs1.bof
%>
<option value="<%=rs1("helpsort")%>"<%=selected(rs1("helpsort"),rs("helpsort"))%>><%=rs1("helpsort")%></option>
<%
rs1.movenext
wend
%>
</select><font color=red>*</font>&nbsp;&nbsp;&nbsp;&nbsp;(如果要增加或修改帮助类别，请<a href="edithelpsort.asp">由此进入</a>)
</td>
</tr>
<tr>
<td><b>帮助内容</b></td><td><textarea rows="9" name="helpcontent" cols="49"><%=rs("helpcontent")%></textarea><font color=red>*</font></td>
</tr>
</table>
<font color=red>*</font>项必须填写&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="submit" value="修改">&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="submit" value="删除" onclick="return window.confirm('你确定要删除此条帮助信息吗？')";>
<input type="hidden" name="id" value=<%=rs("id")%>>
</form>
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










