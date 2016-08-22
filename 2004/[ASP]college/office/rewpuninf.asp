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
'打开数据库，读出权限
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select allow_edit_all_rewpuninf from userinf where username=" & sqlstr(oabusyusername)
rs.open sql,conn,1
cook_allow_edit_all_rewpuninf=rs("allow_edit_all_rewpuninf")
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
<td>
<b>员工奖惩档案</b>&nbsp;&nbsp;
</td>
<%
if cook_allow_edit_all_rewpuninf="yes" then
%>
<form action="rewpuninf.asp" method=get name="form1">
<td>
<select name="userdept" size=1 onChange="document.form1.submit();">
<%
'打开数据库读出部门
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select DISTINCT userdept from userinf"
rs.open sql,conn,1
if not rs.eof and not rs.bof then firstdept=rs("userdept")
if request("userdept")<>"" then firstdept=request("userdept")
while not rs.eof and not rs.bof
%>
<option value="<%=rs("userdept")%>"<%=selected(firstdept,rs("userdept"))%>><%=rs("userdept")%></option>
<%
rs.movenext
wend
%>
</select>
</td>
</form>
<%
else
firstdept=oabusyuserdept
end if
%>
<form action="rewpuninf.asp" method=get name="form2">
<td>
<input type="hidden" name="userdept" value="<%=firstdept%>">
<select name="username" size=1>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select name,username from userinf where userdept=" & sqlstr(firstdept) & " and userlevel<>'总管' and forbid='no'"
rs.open sql,conn,1
if not rs.eof and not rs.bof then username=rs("username")
if request("username")<>"" then username=request("username")
while not rs.eof and not rs.bof
%>
<option value="<%=rs("username")%>"<%=selected(username,rs("username"))%>><%=rs("name")%></option>
<%
rs.movenext
wend
%>
</select>
<td>
<input type="submit" name="submit" value="查询">
</td>
</form>
<form method="post" action="addrewpuninf.asp">
<td>
<input type="hidden" name="userdept" value="<%=firstdept%>">
<input type="hidden" name="username" value="<%=username%>">
<input type="submit" value="增加档案">
</td>
</form>
</tr>
</table>
</center>
<%
call bgmid()
%>
<%
'打开数据库读出员工姓名
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select name from userinf where username=" & sqlstr(username)
rs.open sql,conn,1
name=rs("name")
%>
<br>
<center><b><%=name%>的奖惩档案</b></center>
<br>
<%
'打开数据库，读出员工职位变动数据库
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from rewpuninf where username=" & sqlstr(username)
rs.open sql,conn,1
while not rs.eof and not rs.bof
rewpunname=rs("rewpunname")
rewpundate=rs("rewpundate")
rewpunfile=rs("rewpunfile")
rewpunsort=rs("rewpunsort")
rewpuntype=rs("rewpuntype")
remark=rs("remark")
recname=rs("recname")
recdate=rs("recdate")
updatename=rs("updatename")
updatedate=rs("updatedate")
id=rs("id")
%>
<center>
  <table border="0" cellpadding="0" cellspacing="0" width="95%">
    <tr>
      <td width="15%" style="border-left: 2 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000" align="center"><b>员工姓名</b></td>
      <td colspan="3" width="85%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><%=name%> 
      </td>
    </tr>
    <tr>
      <td width="15%" style="border-left: 2 solid #000000; border-bottom: 1 solid #000000" align="center"><b>奖惩名称</b></td>
      <td colspan="3" width="35%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=rewpunname%> 
      </td>
    </tr>
    <tr>
      <td style="border-left: 2 solid #000000; border-bottom: 1 solid #000000" width="15%" align="center"><b>奖惩时间</b></td>
      <td style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><%=rewpundate%>
      </td>
      <td style="border-left: 1 solid #000000; border-bottom: 1 solid #000000" width="15%" align="center"><b>奖惩文号</b></td>
      <td style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(rewpunfile)%> 
      </td>
    </tr>
    <tr>
      <td style="border-left: 2 solid #000000; border-bottom: 1 solid #000000" width="15%" align="center"><b>奖惩类型</b></td>
      <td style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(rewpunsort)%> 
      </td>
      <td style="border-left: 1 solid #000000; border-bottom: 1 solid #000000" width="15%" align="center"><b>奖惩方式</b></td>
      <td style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(rewpuntype)%> 
      </td>
    </tr>
    <tr>
      <td width="15%" style="border-left: 2 solid #000000; border-bottom: 1 solid #000000" align="center"><b>奖惩原因<br>
        备注说明</b></td>
      <td colspan="3" width="85%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=keepformat(checked3(remark))%> 
      </td>
    </tr>
    <tr>
      <td width="15%" style="border-left: 2 solid #000000; border-bottom: 1 solid #000000" align="center"><b>记 
        录 人</b></td>
      <td width="35%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><%=checked3(recname)%>  
      </td>
      <td width="15%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000" align="center"><b>记录时间</b></td>
      <td width="35%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=recdate%>  
      </td>
    </tr>
    <tr>
      <td style="border-left: 2 solid #000000; border-bottom: 2 solid #000000" width="15%" align="center"><b>更 
        改 人</b></td>
      <td style="border-left: 1 solid #000000; border-bottom: 2 solid #000000"><%=updatename%> 
      </td>
      <td style="border-left: 1 solid #000000; border-bottom: 2 solid #000000" width="15%" align="center"><b>更改时间</b></td>
      <td style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 2 solid #000000"><%=updatedate%>
      </td>
    </tr>
  </table>
  <table border="0" cellpadding="0" cellspacing="0" width="95%">
    <tr><form method="post" action="editrewpuninf.asp">
      <td align=right><input type="submit" value="编辑">
<input type="hidden" name="userdept" value="<%=firstdept%>">
<input type="hidden" name="username" value="<%=username%>">
<input type="hidden" name="id" value=<%=id%>>
</td>
        </form>
    </tr>
  </table>
<hr size=1 color=red width="95%">
<br>
</center>
<%
rs.movenext
wend 
%>

<%
call bgback()
%>
</body>
</html>










