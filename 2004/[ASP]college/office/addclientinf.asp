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
name=request("name")
company=request("company")
address=request("address")
project=request("project")
tel=request("tel")
callno=request("callno")
handset=request("handset")
fax=request("fax")
remark=request("remark")
email=request("email")
postcard=request("postcard")
dept=request("dept")
sex=request("sex")
position=request("position")
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
<td><b>输入客户资料</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<form method="post" action="clientinf.asp">
<td><input type="submit" value="返回">
</td>
</form>
</tr>
</table>
</center>
<%
call bgmid()
%>
<%
if request("submit")="输入" then
set conn=opendb("oabusy","conn","accessdsn")
sql = "Insert Into clientinf (name,company,address,project,tel,callno,handset,fax,remark,email,postcard,dept,sex,position) Values( "
sql = sql & SqlStr(name) & ", "
sql = sql & SqlStr(company) & ", "
sql = sql & SqlStr(address) & ", "
sql = sql & SqlStr(project) & ", "
sql = sql & SqlStr(tel) & ", "
sql = sql & SqlStr(callno) & ", "
sql = sql & SqlStr(handset) & ", "
sql = sql & SqlStr(fax) & ", "
sql = sql & SqlStr(remark) & ", "
sql = sql & SqlStr(email) & ", "
sql = sql & SqlStr(postcard) & ", "
sql = sql & SqlStr(dept) & ", "
sql = sql & SqlStr(sex) & ", "
sql = sql & SqlStr(position) & ")"
conn.Execute sql
%>
<br><br>
<center>
<font color=red size=3>
成功输入客户信息！
</font>
</center>
<%
else
%>
<script Language="JavaScript">

 function form_check(){
   var l1=document.form1.name.value.length;
   if(l1==0){window.alert("客户姓名必须填");document.form1.name.focus();return (false);}

   var l2=document.form1.company.value.length;
   if(l2==0){window.alert("客户所在公司必须填");document.form1.company.focus();return (false);}

   var l3=document.form1.project.value.length;
   if(l3==0){window.alert("业务项目必须填");document.form1.project.focus();return (false);}

                    }

</script>

<center>
<br>
<form method="post" action="addclientinf.asp" name="form1" onsubmit="return form_check();">
  <table border="0" cellpadding="0" cellspacing="0" width="95%">
    <tr>
      <td width="15%" align=center style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><b>客户姓名</b></td>
      <td style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><input type=text name="name" size=23><font color=red>*</font></td>
      <td width="15%" align=center style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><b>客户性别</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><select name="sex" size="1">
          <option value="男">男</option>
          <option value="女">女</option>
        </select></td>
    </tr>
    <tr>
      <td align=center style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>职&nbsp;&nbsp;&nbsp;&nbsp;位</b></td>
      <td style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><input type=text name="position" size=23></td>
      <td align=center style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>业务项目</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><input type=text name="project" size=23><font color=red>*</font></td>
    </tr>
    <tr>
      <td align=center style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>所在公司</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000" colspan="3"><input type=text name="company" size=60><font color=red>*</font></td>
    </tr>
    <tr>
      <td align=center style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>部&nbsp;&nbsp;&nbsp;&nbsp;门</b></td>
      <td style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><input type=text name="dept" size=23></td>
      <td align=center style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>邮政编码</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><input type=text name="postcard" size=23></td>
    </tr>
    <tr>
      <td align=center style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>公司地址</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000" colspan="3"><input type=text name="address" size=60></td>
    </tr>
    <tr>
      <td align=center style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>传真号码</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000" colspan="3"><input type=text name="fax" size=60></td>
    </tr>
    <tr>
      <td align=center style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>联系电话</b></td>
      <td style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><input type=text name="tel" size=23></td>
      <td align=center style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>手&nbsp;&nbsp;&nbsp;&nbsp;机</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><input type=text name="handset" size=23></td>
    </tr>
    <tr>
      <td align=center style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>呼&nbsp;&nbsp;&nbsp;&nbsp;机</b></td>
      <td style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><input type=text name="callno" size=23></td>
      <td align=center style="border-left: 0 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><b>电子邮箱</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 0 solid #000000; border-bottom: 1 solid #000000"><input type=text name="email" size=23></td>
    </tr>
    <tr>
      <td align=center style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 0 solid #000000; border-bottom: 2 solid #000000"><b>备注说明</b></td>
      <td style="border-left: 0 solid #000000; border-right: 2 solid #000000; border-top: 0 solid #000000; border-bottom: 2 solid #000000" colspan="3"><textarea rows="4" cols="59" name="remark"></textarea></td>
    </tr>
  </table>

  <font color=red>*</font>必须填写&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="submit" value="输入">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="返回" onclick="window.location.href='clientinf.asp';">
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










