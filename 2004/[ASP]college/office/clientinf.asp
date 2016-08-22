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
'打开数据库，读出编辑通讯录权限
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where username=" & sqlstr(oabusyusername)
rs.open sql,conn,1
allow_edit_client_addressinf=rs("allow_edit_client_addressinf")
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
<td><b>客户资源列表</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<%
if allow_edit_client_addressinf="yes" then
%>
<form method=post action="addclientinf.asp">
<td><input type=submit value="增加"></td>
</form>
<%
end if
%>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select DISTINCT project from clientinf"
rs.open sql,conn,1
if not rs.eof and not rs.bof then project=rs("project")
if request("project")<>"" then project=request("project")
%>
<form method="post" action="clientinf.asp">
<td>
<select size=1 name="project">
<%
while not rs.eof and not rs.bof
%>
<option value="<%=rs("project")%>"<%=selected(project,rs("project"))%>><%=rs("project")%></option>
<%
rs.movenext
wend
%>
</select>
<input type="submit" value="查询">
</td>
</form>
</tr>
</table>
</center>
<%
call bgmid()
%>
<br><br>
<center>
<table border="1"  cellspacing="0" cellpadding="0" width="95%">
<tr bgcolor="#aaaaaa">
<td height="25" align=center><b>姓名</b></td><td align=center><b>姓别</b></td><td align=center><b>公司名称</b></td><td align=center><b>部门</b></td><td align=center><b>职位</b></td><td align=center><b>业务项目</b></td><td align=center><b>电话</b></td>
</tr>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from clientinf where project=" & sqlstr(project)
rs.open sql,conn,1
while not rs.eof and not rs.bof
%>
<tr>
<td height=20 align=center><a href="showclientinf.asp?project=<%=request("project")%>&id=<%=rs("id")%>"><%=checked3(rs("name"))%></a></td><td align=center><%=checked3(rs("sex"))%></td><td align=center><%=checked3(rs("company"))%></td><td><%=checked3(rs("dept"))%></td><td align=center><%=checked3(rs("position"))%></td><td align=center><%=checked3(rs("project"))%></td><td align=center><%=checked3(rs("tel"))%></td>
</tr>
<%
rs.movenext
wend
%>
</table>
</center>
<%
call bgback()
%>
</body>
</html>










