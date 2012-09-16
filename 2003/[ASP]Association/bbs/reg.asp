<%width=40
height=40%>
<!--#include file="up.asp"-->
<style>TABLE {BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 1px; }TD {BORDER-RIGHT: 0px; BORDER-TOP: 0px;}</style>
<%noyes="注 册 失 败 ！"
name=Replace(Request.Form("name"),"'","''")
password=Replace(Request.Form("password"),"'","''")
repassword=Replace(Request.Form("repassword"),"'","''")
anhao=Replace(Request.Form("anhao"),"'","''")
email=Replace(Request.Form("email"),"'","''")
set rs=myconn.execute("SELECT*FROM user where name='"&name&"'")
if not rs.eof and not rs.bof then
mes="<br>对不起！"&kbbs(name)&" 已被人注册了！！！ <a href='javascript:history.go(-1)'><img border=0 src=pic/re.gif>返 回</a><br><br>"
%><%else
if name="" or password="" or repassword="" or anhao="" or email="" then
mes="<br>对不起！你不能成功地注册用户！！！请填写完整必填的项目 <a href='javascript:history.go(-1)'><img border=0 src=pic/re.gif>返 回</a><br><br>"
%><%
function IsValidEmail(email)

 dim names, name, i, c


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

end function
email=request.form("email")
email=server.HTMLEncode(email)
elseif not IsValidEmail(email) then
mes="<br>对不起！你不能成功地注册用户！！！请检查你的E-mail是否出错！！<a href='javascript:history.go(-1)'><img border=0 src=pic/re.gif>返 回</a><br><br>"
%><%
else
if repassword<>password then
mes="<br>你的重复密码与原密码不相同！！<a href='javascript:history.go(-1)'><img border=0 src=pic/re.gif>返 回</a><br><br>"
%><%
else
%>
<%
name=Replace(Request.Form("name"),"'","''")
password=Replace(Request.Form("password"),"'","''")
repassword=Replace(Request.Form("repassword"),"'","''")
anhao=Replace(Request.Form("anhao"),"'","''")
mypic=Replace(Request.Form("mypic"),"'","''")
toupic=Replace(Request.Form("headpic"),"'","''")
email=Replace(Request.Form("email"),"'","''")
home=Replace(Request.Form("home"),"'","''")
sex=Replace(Request.Form("sex"),"'","''")
burn=Replace(Request.Form("burn"),"'","''")
qq=Replace(Request.Form("qq"),"'","''")
gxqm=Replace(Request.Form("gxqm"),"'","''")
ch=Replace(Request.Form("ch"),"'","''")
ku=Replace(Request.Form("ku"),"'","''")
mytp=mypic
if mypic="" then
mytp="headpic/"&toupic&".gif"
ch=height
ku=width
end if
if not isnumeric(ch) or not isnumeric(ku) then
mes="<br>你的图像大小设置错误！！<a href='javascript:history.go(-1)'><img border=0 src=pic/re.gif>返 回</a><br><br>"
%>
<%else%>
<%if ch>120 or ku>120 then
ch=height
ku=width
end if%>

<%abc="insert into user(name,password,anhao,email,home,sex,burn,qq,toupic,ch,ku,gxqm)VALUES('"&name&"','"&password&"','"&anhao&"','"&email&"','"&home&"','"&sex&"','"&burn&"','"&qq&"','"&mytp&"','"&ch&"','"&ku&"','"&gxqm&"')"
myconn.Execute(abc)
noyes="注 册 成 功！"
mes="<br><form method=POST action=bbselse.asp name=login>恭喜你！ <b>"&kbbs(name)&"</b> 成功注册！<input type=hidden name=lgname size=20 value="&name&"><input type=hidden name=lgpwd size=20 value="&password&"><a href='javascript:document.login.submit()'><img border=0 src=pic/go.gif align=absmiddle> 进入论坛</a></form>"
%>    
<%end if
end if
end if
end if
%><!--#include file="mes.asp"--><br><!--#include file="down.asp"-->