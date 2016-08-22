<html>
<head>
<title>e-office---基于国际互联网的公办自动化系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="9pp.css" type="text/css">

</head>

<body bgcolor="3F6090" text="#000000" topmargin="5">
<div align="center"><img src="image/logo2.gif" width="485" height="68"> </div>
<table width="80%" border="0" cellspacing="1" cellpadding="0" align="center">
  <tr> 
        <td bgcolor="#FFFFFF"> 
          
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="unnamed1" align="center">
        <tr bgcolor="#666666"> 
          <td class="unnamed1" colspan="2" height="5">&nbsp;</td>
        </tr>
        <tr valign="top"> 
          <td height="20"> 
            <p> 
              <%dim radiobutton,text,name,email,tel,contact
fouunderr=false
dim errmsg
YyEmailAddress="webmaster@beibang.com"

title="我对贵网站的"+trim(Request.form("radiobutton"))+"的问题?"
content="<li>"+Request.Form("text")+"<br>姓名:"+Request.Form ("name")+"<br>邮箱:"+Request.Form ("email")+"<br>电话:"+Request.Form ("tel")+"<br>"+Request.Form ("contact")

if Request.Form ("cname")="" then
   errmsg="<li>公司名不能为空</li>"
   founderr=true
end if

if Request.Form ("name")="" then
   errmsg="<li>您的大名不能为空</li>"
   founderr=true
end if

if IsValidEmail(Request.Form ("email"))=false then
   errmsg=errmsg+"<li>您的email有错误，否则没办法回复您的Email</li>"
   founderr=true
end if



if founderr=false then

cname = "公司：" + request("cname")&chr(13)
name = "姓名：" + Request.Form ("name")&"("&request.form("lx")&")"&chr(13)
tel = "电话：" + Request.Form ("tel")&chr(13)
yemail = Request.Form ("email")
email = "email：" + Request.Form ("email")&chr(13)
add = "地址:"+ request("add")&chr(13)
text = chr(13)&request.form("radiobutton")&"："&chr(13)&chr(13)&request.form("text")

Set JMail = Server.CreateObject ("JMail.SMTPMail")  
   JMail.serveraddress ="mail.beibang.com" 
   JMail.Sender=yemail  
   JMail.Subject="用户试用:" + Request.Form ("name")
   JMail.Body="****************用户资料*************"&chr(13)&chr(13)&cname+name + tel + add + email + text
   JMail.AddRecipient YyEmailAddress
   JMail.Priority = 1 
   JMail.Execute  
%>
          
         
            <div align="center"> <font size="4" color="#FF0000"><br>
              <b>恭喜你成功了！！！</b></font> <br>
              <br>
              <table width="70%" border="0" cellspacing="1" class="unnamed1">
                <tr>
                  <td>以下是供测试使用的帐号与密码：</td>
                </tr>
                <tr>
                  <td bgcolor="#000000">
                    <table class=unnamed1 cellspacing=1 cellpadding=0 width="100%" 
            border=0>
                      <tbody> 
                      <tr bgcolor=#FFCC00> 
                        <td align=middle height=20><font color=#000000>部 门</font></td>
                        <td align=middle height=20><font color=#000000>职 位</font></td>
                        <td align=middle height=20><font color=#000000>用户名</font></td>
                        <td align=middle height=20><font color=#000000>密 码</font></td>
                      </tr>
                      <tr bgcolor=#ffffff> 
                        <td align=middle>技术部</td>
                        <td align=middle>部门经理</td>
                        <td align=middle>wushaowu</td>
                        <td align=middle>123456</td>
                      </tr>
                      <tr bgcolor=#ffffff> 
                        <td align=middle>技术部</td>
                        <td align=middle>员工</td>
                        <td align=middle>wangyang</td>
                        <td align=middle>123456</td>
                      </tr>
                      <tr bgcolor=#ffffff> 
                        <td align=middle>市场部</td>
                        <td align=middle>部门经理</td>
                        <td align=middle>zhengmingjun</td>
                        <td align=middle>123456</td>
                      </tr>
                      <tr bgcolor=#ffffff> 
                        <td align=middle>技术部</td>
                        <td align=middle>员工</td>
                        <td align=middle>111</td>
                        <td align=middle>111</td>
                      </tr>
                      <tr bgcolor=#ffffff> 
                        <td align=middle>人事部</td>
                        <td align=middle>员工</td>
                        <td align=middle>222</td>
                        <td align=middle>222</td>
                      </tr>
                      <tr bgcolor=#ffffff> 
                        <td align=middle>行政部</td>
                        <td align=middle>员工</td>
                        <td align=middle>444</td>
                        <td align=middle>444</td>
                      </tr>
                      <tr bgcolor=#ffffff> 
                        <td align=middle>财务部</td>
                        <td align=middle>员工</td>
                        <td align=middle>555</td>
                        <td align=middle>555</td>
                      </tr>
                      <tr bgcolor=#ffffff> 
                        <td align=middle>市场部</td>
                        <td align=middle>员工</td>
                        <td align=middle>666</td>
                        <td align=middle>666</td>
                      </tr>
                      <tr bgcolor=#ffffff> 
                        <td align=middle>总经办</td>
                        <td align=middle>总经理</td>
                        <td align=middle>888</td>
                        <td 
      align=middle>888</td>
                      </tr>
                      </tbody> 
                    </table>
                  </td>
                </tr>
              </table>
              <font size="4"><b><a href="http://www.beibang.com/eoffice"><br>
              &gt;&gt;&gt;点击这里登录</a></b></font><br>
              <br>
            </div>
            <%else%>
        <tr valign="top"> 
          <td height="20"> 
            <div align="center"><font size="4"><b>出错了！！！</b></font></div>
            <div align="center"><font color="#FF0000"><br>
              Sorry， 请再仔细检查以下的项目是否正确：</font><BR><font color="#FF0000">
              <%response.write errmsg%>
              <BR>
            </div>
            <li id="list3"> 
              <div align="center">单击<a href="javascript:history.back(1)">后退</a> 
              </div>
            </li>
            <div align="center"><ul> </font></p> </div>
        </tr>
      </table>
    </td>
  </tr>
  <tr bgcolor="#000000"> 
    <td height="20">
      <div align="center"><font color="#FFFFFF">Copyright &copy; 2000. All Backbone 
        Studio Digital All Rights Reserved</font></div>
    </td>
  </tr>
</table>
</body>
</html>
<%end if
function IsValidEmail(email)

dim names, name, i, c

'Check for valid syntax in an email address.

IsValidEmail = true
names = Split(email, "@")
if UBound(names) <> 1 then
   IsValidEmail = false
   exit function
end if
for each name in names
   if Len(name) <= 0 then
     IsValidEmail = false
     exit function
   end if
   for i = 1 to Len(name)
     c = Lcase(Mid(name, i, 1))
     if InStr("abcdefghijklmnopqrstuvwxyz_-.", c) <= 0 and not IsNumeric(c) then
       IsValidEmail = false
       exit function
     end if
   next
   if Left(name, 1) = "." or Right(name, 1) = "." then
      IsValidEmail = false
      exit function
   end if
next
if InStr(names(1), ".") <= 0 then
   IsValidEmail = false
   exit function
end if
i = Len(names(1)) - InStrRev(names(1), ".")
if i <> 2 and i <> 3 then
   IsValidEmail = false
   exit function
end if
if InStr(email, "..") > 0 then
   IsValidEmail = false
end if

end function%>
              </td>
            </tr>
            <tr bgcolor="#666666"> 
              <td colspan="2" height="5">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <p>&nbsp;</p>
  </div>
</form>
</body>
</html>
