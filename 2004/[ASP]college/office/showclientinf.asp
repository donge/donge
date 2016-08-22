<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/checked.asp"-->
<!--#include file="asp/keepformat.asp"-->
<!--#include file="asp/maillink.asp"-->
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

id=request("id")
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
<td><b>客户详细资料</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<%
if allow_edit_client_addressinf="yes" then
%>
<form method="post" action="editclientinf.asp">
<td><input type="submit" value="编辑"><input type="hidden" name="project" value="<%=request("project")%>">
<input type="hidden" name="id" value="<%=request("id")%>">
</td>
</form>
<%
end if
%>
<form method="post" action="clientinf.asp">
<td><input type="submit" value="返回"><input type="hidden" name="project" value="<%=request("project")%>">
</td>
</form>
</tr>
</table>
</center>
<%
call bgmid()
%>

<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from clientinf where id=" & id
rs.open sql,conn,1
%>
<br><br>
<center>
  <table border="1" cellpadding="0" cellspacing="0" width="95%">
    <tr>
      <td align=center height=25 style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><b>客户姓名</b></td>
      <td style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(rs("name"))%></td>
      <td align=center style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><b>客户性别</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><%=checked3(rs("sex"))%></td>
     </tr>
     <tr>
      <td align=center height=25 style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>职&nbsp;&nbsp;&nbsp;&nbsp;位</b></td>
      <td style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><%=checked3(rs("position"))%></td>
      <td align=center style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>业务项目</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><%=checked3(rs("project"))%></td>
    </tr>
    <tr>
      <td align=center height=25 style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>所在公司</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000" colspan="3"><%=checked3(rs("company"))%></td>
    </tr>
    <tr>
      <td align=center height=25 style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>部&nbsp;&nbsp;&nbsp;&nbsp;门</b></td>
      <td style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><%=checked3(rs("dept"))%></td>
      <td align=center style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>邮政编码</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><%=checked3(rs("postcard"))%></td>
    </tr>
    <tr>
      <td align=center height=25 style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>公司地址</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000" colspan="3"><%=checked3(rs("address"))%></td>
    </tr>
    <tr>
      <td align=center height=25 style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>传真号码</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000" colspan="3"><%=checked3(rs("fax"))%></td>
    </tr>
    <tr>
      <td align=center height=25 style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>联系电话</b></td>
      <td style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><%=checked3(rs("tel"))%></td>
      <td align=center style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>手&nbsp;&nbsp;&nbsp;&nbsp;机</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><%=checked3(rs("handset"))%></td>
    </tr>
    <tr>
      <td align=center height=25 style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>呼&nbsp;&nbsp;&nbsp;&nbsp;机</b></td>
      <td style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><%=checked3(rs("callno"))%></td>
      <td align=center style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>电子邮箱</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><%=maillink(rs("email"))%></td>
    </tr>
    <tr>
      <td align=center height=25 style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 2 solid #000000"><b>备注说明</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 0 solid #000000; border-bottom: 2 solid #000000" colspan="3"><%=keepformat(checked3(rs("remark")))%></td>
    </tr>
  </table>

</center>

<%
call bgback()
%>
</body>
</html>










