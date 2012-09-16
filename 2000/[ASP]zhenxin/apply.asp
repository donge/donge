<%@ codepage ="936" %>
<%user=request.form("user")
if user<>"" then
olduser=user
user=replace(user,"'","''")
set con = Server.CreateObject("ADODB.Connection")%>
<!-- #include file=1Qw@3E.inc -->
<%con.open
sql="SELECT * FROM zhenxin_user WHERE user_name='"&user&"'"
Set Rs=con.Execute(sql)
flag=0
If (Rs.Bof OR Rs.Eof) and len(user)<11 Then
response.redirect"apply2.asp?user="&olduser
else
flag=1
end if
rs.close
con.close
set rs=nothing
set con=nothing
end if%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 3.0">
<link rel="stylesheet" type="text/css" href="link.css">
<title>真心链</title>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0">
<div align="center"><center>
  </center></div>
<!--#include file="1.htm" -->
<table border="0" width="778" cellspacing="0" cellpadding="0" bgcolor="#eeeeee">
  <tr> 
    <td width="100%"> 
      <form name="apply" action="apply2.asp" method="POST">
        <div align="center"> 
          <p>&nbsp;</p><table width="80%" border="1" cellspacing="0" cellpadding="0" align="center" bordercolorlight="#000000" bordercolordark="#FFFFFF">
            <tr bgcolor="#FFFFFF"> 
              <td> 
                <p>&nbsp;</p>
                <table width="500" border="0" cellspacing="0" cellpadding="0" align="center">
                  <tr>
                    <td>
                      <p><span >请输入一个user_name：</span></p>
                      <p align="center"><span >user_name： 
                        <input name="user" size="10" class="stedit" maxlength="10">
                        （最多10个字符）</span></p>
                      <p align="center"><span > 
                        <input type="submit" value="下一步" class="stbtm" name="submit">
                        </span></p>
                      </td>
                  </tr>
                </table>
                <p align="center">&nbsp;</p>
                </td>
            </tr>
          </table>
        <p>&nbsp;</p></div>
      </form>
    </td>
  </tr>
</table>
<!--#include file="2.htm" --> 
</body>
</html>