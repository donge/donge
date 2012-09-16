<%@ codepage ="936" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 3.0">
<link rel="stylesheet" type="text/css" href="link.css">
<title>真心链</title>
</head>

<body topmargin="0" bgcolor="#FFFFFF" leftmargin="0">
<!--#include file="1.htm" --> 
<table width="778" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><%
user=""
pass=""
user=request.querystring("user")
pass=request.querystring("pass")
Set con=Server.CreateObject("ADODB.Connection")%> <!-- #include file=1Qw@3E.inc --> 
      <%con.Open connstr

Set rs = Server.CreateObject("ADODB.Recordset")
sql="select * from zhenxin_user where user_name='"&user&"'"
rs.open sql,con,1,2

if rs.eof or rs.bof then%> 
      <p>错误：user_name不存在！<a href="edituser.asp">返回</a> <%rs.close
con.close
set rs=nothing
set con=nothing
response.end
end if

if pass<>rs("pass_word") then
response.write("错误：pass_word错误！<a href='edituser.asp'>返回</a>")
rs.close
con.close
set rs=nothing
set con=nothing
response.end
end if
url=rs("site_url")
urlname=rs("site_name")
jiji=rs("site_about")
mail=rs("e_mail")
fenlei=rs("site_type")
pass=rs("pass_word")

if urlname="" then
response.write"<font color='#ff0000'>此用户已被删除！如果你想恢复此用户号，请输入网站名！</font><BR>"
end if

%> </p>
      <table align="center" >
        <p><br>
          <strong>旧的资料</strong> 
        <p> user_name称：<%=user%><br>
          用户pass_word：<%=pass%><br>
          电子e_mail：<%response.write mail%><br>
          site_type：<%select case fenlei
                       case 1:  response.write"综合门户"
                      case 2:  response.write"国家地区"
                       case 3:  response.write"电脑网络"
                      case 4:  response.write"政府机关"
                       case 5:  response.write"休闲娱乐"
                       case 6:  response.write"电信港湾"
                        case 7:  response.write"生活资讯"
                     case 8:  response.write"文化艺术"
                       case 9:  response.write"科学教育"
                        case 10:  response.write"游戏世界"
                        case 11:  response.write"体育健身"
                       case 12:  response.write"工商经济"
                        case 13:  response.write"金融投资"
                      case 14:  response.write"新闻媒体"
                       case 15:  response.write"情感交流"
                     case 16:  response.write"女性天地"
                       case 17:  response.write"卫生保健"
                      case 18:  response.write"其他类别"
case else:response.write"<font color='#ff0000'>资料错误</font>"
end select%><br>
          site_url：<%=url%><br>
          site_name：<%=urlname%><br>
          site_about：<%=jiji%><br>
          <br>
          如果某项不修改可以为空。在相应的框中填入即可完<br>
          成相应项的修改，错误提示或修改结果看下面。 
        <form action="edituser2.asp?user=<%=user%>&pass=<%=pass%>" method="post">
          <div> user_name称：<%=user%> <br>
            电子e_mail： 
            <input name="mail" size="15" class="stedit" maxlength="30">
            <br>
            site_type： 
            <select name="fenlei" size="1" class="stslt">
              <option value="1" selected>综合门户</option>
              <option value="2">国家地区</option>
              <option value="3">电脑网络</option>
              <option value="4">政府机关</option>
              <option value="5">休闲娱乐</option>
              <option value="6">电信港湾</option>
              <option value="7">生活资讯</option>
              <option value="8">文化艺术</option>
              <option value="9">科学教育</option>
              <option value="10">游戏世界</option>
              <option value="11">体育健身</option>
              <option value="12">工商经济</option>
              <option value="13">金融投资</option>
              <option value="14">新闻媒体</option>
              <option value="15">情感交流</option>
              <option value="16">女性天地</option>
              <option value="17">卫生保健</option>
              <option value="18">其他类别</option>
            </select>
            <br>
            新的pass_word： 
            <input
  name="newpassword1" size="10" class="stedit" maxlength="10" type="password">
            <br>
            验证pass_word： 
            <input
  name="newpassword2" size="10" class="stedit" maxlength="10" type="password">
            <br>
            site_url： 
            <input
  name="newurl" size="30" class="stedit" maxlength="50">
            <br>
            site_name： 
            <input
  name="newsitename" size="16" class="stedit" maxlength="8">
            <br>
            site_about： 
            <input
  name="newjiji" size="50" class="stedit" maxlength="50">
            <br>
          </div>
          <input type="submit" value="提交" class="stbtm" name="submit">
          <br>
        </form>
        <%error=0
qmail=request.form("mail")
qfenlei=request.form("fenlei")
newpassword1=request.form("newpassword1")
newpassword2=request.form("newpassword2")
newurl=request.form("newurl")
newsitename=request.form("newsitename")
newshu=request.form("newshu")
newjiji=request.form("newjiji")
okflag=0
if qmail<>"" or qfenlei<>0 or icount<>"" or newurl<>"" or newsitename<>"" or newshu<>"" or newjiji<>"" then okflag=1
if newpassword1<>"" and newpassword2<>"" and newpassword1=newpassword2 then okflag=1
if qgeshang<>0 then
geshang=qgeshang
end if
if qfenlei<>0 then
fenlei=qfenlei
end if

if qmail<>"" then
mail=qmail
end if
if len(user)>10 then
error=1
%> 错误：user_name太长! <%end if

if len(oldpassword)>10 then
error=1
%> 错误：旧pass_word太长! <%end if

if len(newpassword1)>10 or len(newpassword2)>10 then
error=1%> 错误：新pass_word太长! <%end if

if len(newurl)>50  then
error=1%> 错误：site_url太长! <%end if

if len(newsitename)>7  then
error=1%> 错误：网站名太长! <%end if
if len(newjiji)>50  then
error=1%> 错误：site_about太长! <%end if
if len(newshu)>7  then
error=1%> 错误：初始计数值太长! <%end if
if IsNumeric(newshu)=0 and newshu<>"" then 
error=1%> 错误：输入的计数值不是数字！<br>
        <%end if

if newpassword1<>newpassword2 then
error=1%> 错误：两个新pass_word不相同，无法确定哪个为正确pass_word！<br>
        <%end if

if error=0 then

if newpassword1<>"" and newpassword2<>"" and newpassword1=newpassword2 then
password=newpassword1
else
password=pass
end if

if newsitename<>"" then
sitename=newsitename
else 
sitename=urlname
end if


if newurl<>"" then
url=newurl
end if


if newjiji<>"" then
jiji=newjiji
end if

if rs("pass_word")<> password then
rs("pass_word")=password
end if

if rs("e_mail")<>mail then
rs("e_mail")=mail
end if

if rs("site_type")<>fenlei then
rs("site_type")=fenlei
end if

if sitename<>rs("site_name") then
rs("site_name")=sitename
end if

if rs("site_url")<>url then
rs("site_url")=url
end if

if rs("site_about")<>jiji then
rs("site_about")=jiji
end if
rs.Update
rs.close
con.close
set rs=nothing
set con=nothing
if okflag=1 then
%> 资料修成功，现在你的新资料如下<br>
        user_name称：<%=user%><br>
        用户pass_word：<%=password%><br>
        电子e_mail：<%=mail%><br>
        site_type：<%select case fenlei
                       case 1:  response.write"综合门户"
                      case 2:  response.write"国家地区"
                       case 3:  response.write"电脑网络"
                      case 4:  response.write"政府机关"
                       case 5:  response.write"休闲娱乐"
                       case 6:  response.write"电信港湾"
                        case 7:  response.write"生活资讯"
                     case 8:  response.write"文化艺术"
                       case 9:  response.write"科学教育"
                        case 10:  response.write"游戏世界"
                        case 11:  response.write"体育健身"
                       case 12:  response.write"工商经济"
                        case 13:  response.write"金融投资"
                      case 14:  response.write"新闻媒体"
                       case 15:  response.write"情感交流"
                     case 16:  response.write"女性天地"
                       case 17:  response.write"卫生保健"
                      case 18:  response.write"其他类别"
case else:response.write"<font color='#ff0000'>资料错误</font>"
end select%><br>
        site_name：<%=sitename%><br>
        主页地址：<%=url%><br>
        site_about：<%=jiji%><br>
        <%end if
end if%> 
      </table>
    </td>
  </tr>
</table>
<!--#include file="2.htm" --> 

</body>
</html>
