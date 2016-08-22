
<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/opendb.asp"-->
<%
'登录
username=request("username")
password=request("password")
if username<>"" and password<>"" then
'打开数据库查找是否有此用户
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where username=" & sqlstr(username) & " and password=" & sqlstr(password) & " and forbid='no'"
rs.open sql,conn,1
'如果有此用户就进入系统
if not rs.eof and not rs.bof then

'if month(now())<>"10" then
'response.redirect "gq.htm"
'end if

response.cookies("oabusyname")=rs("name")
response.cookies("oabusyusername")=rs("username")
response.cookies("oabusyuserdept")=rs("userdept")
response.cookies("oabusyuserlevel")=rs("userlevel")

response.cookies("cook_allow_see_all_workrep")=rs("allow_see_all_workrep")
response.cookies("cook_allow_see_dept_workrep")=rs("allow_see_dept_workrep")

response.cookies("cook_allow_control_dept_user")=rs("allow_control_dept_user")
response.cookies("cook_allow_control_all_user")=rs("allow_control_all_user")

response.cookies("cook_allow_send_note")=rs("allow_send_note")
response.cookies("cook_allow_control_note")=rs("allow_control_note")

response.cookies("cook_allow_control_file")=rs("allow_control_file")

response.cookies("cook_allow_control_level")=rs("allow_control_level")

'response.cookies("cook_allow_see_all_personinf")=rs("allow_see_all_personinf")
'response.cookies("cook_allow_see_dept_personinf")=rs("allow_see_dept_personinf")
'response.cookies("cook_allow_edit_all_jobchanginf")=rs("allow_edit_all_jobchanginf")
'response.cookies("cook_allow_edit_dept_jobchanginf")=rs("allow_edit_dept_jobchanginf")
'response.cookies("cook_allow_edit_all_rewpuninf")=rs("allow_edit_all_rewpuninf")
'response.cookies("cook_allow_edit_dept_rewpuninf")=rs("allow_edit_dept_rewpuninf")
'response.cookies("cook_allow_edit_all_checkinf")=rs("allow_edit_all_checkinf")
'response.cookies("cook_allow_edit_dept_checkin")=rs("allow_edit_dept_checkinf")


response.redirect "gensystem.asp"
end if
end if
%>
<html>
<head>
<title>e-office---基于国际互联网的公办自动化系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="9pp.css" type="text/css">
<script language="JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
// -->
</script>
</head>

<body bgcolor="3F6090" link="#FFFFFF" topmargin="5" vlink="#FFFFFF" alink="#FFFFFF">
<form method=post action="default.asp">
  <div align="center"><br>
    <img src="image/logo2.gif" width="485" height="68"> 
    <div id="Layer1" style="position:absolute; left:405px; top:186px; width:230px; height:117px; z-index:1; visibility: visible"> 
      <table border=0 cellpadding="0" cellspacing="0" align="center">
    <tr> 
      <td height="35">用户名： 
        <input type=text name=username size=10>
      </td>
    </tr>
    <tr> 
      <td height="35">密<font color="#FFFFFF">　</font>码： 
        <input type=password name=password size=10>
      </td>
    </tr>
  </table>
  <div align="center">
        <p> 
          <input type=submit name=submit value="登录">
          <input type=reset name=submit2 value="取消">
        </p>
        <p><font color="#FFFFFF">测试帐号：admin 密码:admin<br>
          E-mail:donge@online.ln.cn </font></p>
      </div>
</div>
    <p><font color="3F6090">－ </font><img src="image/main.gif" width="421" height="278"> 
    </p>
  </div>
</form>
</body>
</html>
