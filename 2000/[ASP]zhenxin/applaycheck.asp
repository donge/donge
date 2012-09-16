<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 3.0">
<link rel="stylesheet" type="text/css" href="link.css">
<title>真心链</title>
</head>
<body topmargin="0" leftmargin="0" bgcolor="#FFFFFF">
<!--#include file="1.htm" --> 
<table border="0" width="778" cellspacing="0" cellpadding="0" bgcolor="#F0F0F0">
  <tr>  
    <td width="100%"> 
      <p>&nbsp;</p><table width="80%" border="1" cellspacing="0" cellpadding="0" align="center" bordercolorlight="#000000" bordercolordark="#FFFFFF" bgcolor="#FFFFFF">
        <tr>
          <td>
            <p></p>
            <table border="0" cellspacing="0" cellpadding="0" align="center">
              <tr> 
                <td> 
                  <p><%Set ts = Server.CreateObject("ADODB.Recordset")
user=request.form("user")
olduser=user
user=replace(user,"'","''")
mail=request.form("mail")
password1=request.form("pass1")
password2=request.form("pass2")
sitename=request.form("sitename")
url=request.form("url")
jiji=request.form("jiji")
bc=REQUEST.FORM("bc")
st=request.form("r1")
fenlei=REQUEST.FORM("fenlei")
if bc="" then
bc="no"
end if
if IsNumeric(shu)=0 then shu=0

if user="" or len(olduser)>10 then
response.write"申请真心链错误！请按真心链申请系统的步骤进行申请加入。 "
response.write"<a href='http://www.zhiyuanit.com/link/apply.asp'>进入真心链主页申请</a>"
response.end
end if

set con = Server.CreateObject("ADODB.Connection")%> <!-- #include file=1Qw@3E.inc --> 
                    <%con.open
sql="select count(*) from zhenxin_user"
Set nm=con.Execute(sql)
num=nm(0)
nm.close
sql="SELECT * FROM zhenxin_user WHERE user_name='"&user&"'"
Set Rs=con.Execute(sql)
If not(Rs.Bof OR Rs.Eof) then
Response.Write "申请真心链错误！请按真心链申请系统的步骤进行申请加入。 "
response.write"<a href='http://www.zhiyuanit.com/link/apply.asp'>进入真心链主页申请</a>"
rs.close
con.close
set rs=nothing
set con=nothing
response.end
end if
rs.close
set rs=nothing
f=1
if len(password1)>20 then
f=0%></p>
                  <p>&nbsp;</p>
                  <p align="center">错误：输入的pass_word过长！<br>
                    <%end if%> <% if len(password2)>10 then

f=0%> 错误：输入的验证pass_word过长！<br>
                    <%end if%> <% if len(sitename)>8 then
f=0%> 错误：输入的网站名太长！<br>
                    <% if InStr(username,"奸")<>0 or InStr(username,"淫")<>0 or InStr(username,"娼")<>0 or InStr(username,"嫖")<>0 or InStr(username,"性")<>0 and InStr(username,"交")<>0 or InStr(username,"妓")<>0 or InStr(username,"色")<>0 and InStr(username,"黄")<>0 or InStr(sitename,"色")<>0 and InStr(sitename,"情")<>0 or InStr(sitename,"日")<>0 and InStr(sitename,"妈")<>0 or InStr(sitename,"日")<>0 and InStr(sitename,"妹")<>0 or InStr(sitename,"日")<>0 and InStr(sitename,"姐")<>0 or InStr(sitename,"日")<>0 and InStr(sitename,"娘")<>0 or InStr(sitename,"日")<>0 and InStr(sitename,"奶")<>0 or InStr(sitename,"乳")<>0 or InStr(sitename,"阴")<>0 or InStr(username,"操")<>0 and InStr(username,"妈")<>0 then f=0%> 
                    错误：输入的网站名含有不雅的字眼！<br>
                    <%end if%> <%if len(url)>50 then
f=0
%> 错误：主页地址太长了吧！<br>
                    <% end if%> <%if len(jiji)>50 then
f=0%> 错误：site_about太长！ <br>
                    <%end if
if f=0 or password1<>password2 or password1="" or password2=""  or sitename="" or url="" then
%> <%if password1<>password2 then
f=0
%> 申请错误1：pass_word输入不相同<br>
                    <%end if

if password1="" then
f=0%> 申请错误2：用户pass_word没有输入<br>
                    <%end if

if password2="" then
f=0%> 申请错误3：验证pass_word没有输入<br>
                    <%end if

if sitename="" then
f=0%> 申请错误4：site_name没有输入<br>
                    <%end if

if url="" then
f=0%> 申请错误5：主页地址没有输入
                  <p align="center"><%end if%> <%end if%>
                  <p align="center"> <%
if f=1 then
if Lcase(Left(url,7))<>"http://" Then
url="http://"&url
End if

sql="SELECT * FROM zhenxin_user WHERE site_name=''"
ts.open sql,con,2,2
If not(ts.Bof OR ts.Eof) then
flag=0
ts("user_name")=olduser
ts("pass_word")=password1
ts("site_name")=sitename
ts("site_about")=jiji
ts("join_time")=date
ts("site_url")=url
ts("total_view")=0
ts("site_type")=fenlei
ts("e_mail")=mail
ts.Update
ts.close
con.close
set rs=nothing
set con=nothing
flag=0
else 
if jiji="" then jiji="无"
shu=1
ts.addnew
ts("OID")=num+1
ts("ID")=999999
ts("user_name")=olduser
ts("pass_word")=password1
ts("site_name")=sitename
ts("site_about")=jiji
ts("join_time")=date
ts("site_url")=url
ts("total_view")=0
ts("site_type")=fenlei
ts("e_mail")=mail
ts("day_visit")=0
ts("today_view")=0
ts("click_you")=0
ts("you_click")=0
ts("you_view")=0
ts("view_you")=0
ts.Update
oid=ts("oid")
response.write "用户id："&oid
ts.close
set ts=nothing
con.close
set con=nothing
end if%> 真心链申请成功！<br>
                    要在真心链显示你的网站，必须把下面一段代码加入你的网页(无换行)： <br>
                  <form method="POST" action="applaycheck.asp">
                    <p></p>
                    <p align="center"> 
                      <textarea name="S1" cols="80" class="stedit" rows="3">
&lt;script language=&quot;JavaScript1.1&quot; src=&quot;http://www.zhiyuanit.com/link/textlink.asp?oid=<%=oid%>&amp;bc=<%=bc%>&amp;st=<%=st%>&quot;&gt;&lt;/script&gt;
</textarea>
                    <p>你的真心链样式： 
                    <p align="center"> 
                      <script language="JavaScript1.1" src="textlink.asp?oid=<%=oid%>&amp;bc=<%=bc%>&amp;st=<%=st%>"></script>
                      <%end if%> 
                  </form>
                </td>
              </tr>
            </table>
          <p></p></td>
        </tr>
      </table>
      <p></p></td>
      </tr>
    </table>
<!--#include file="2.htm" --> 
</body>
</html>