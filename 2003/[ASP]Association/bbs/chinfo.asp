<%width=40
height=40
%>
<style>TABLE {BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 1px; }TD {BORDER-RIGHT: 0px; BORDER-TOP: 0px;}</style>
<!--#include file="up.asp"--><!--#include file="fun.asp"-->
<br><br><%sty="<P style='MARGIN: 8px'>"
t1="<div align=center><center><table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor=#111111 width=94% ><tr><td width=50% background=pic/5.gif><img border=0 src=pic/9.gif align=absbottom><font color=#FFFFFF><b>"
t2="</b></font></td><td width=50% background=pic/7.gif><img border=0 src=pic/6.gif></td></tr></table></center></div>"
d1="<div align=center><center><table border=1 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor="&c1&" width=94% ><tr><td width= 100% ><P style='MARGIN: 15px'>"
d2="</p></td></tr></table></center></div>"
lgname=Request.Cookies("lgname")
lgpwd=Request.Cookies("lgpwd")
newpwd=Replace(Request.Form("newpwd"),"'","''")
repwd=Replace(Request.Form("repwd"),"'","''")
email=Replace(Request.Form("email"),"'","''")
anhao=Replace(Request.Form("anhao"),"'","''")
sex=Replace(Request.Form("sex"),"'","''")
burn=Replace(Request.Form("burn"),"'","''")
home=Replace(Request.Form("home"),"'","''")
qq=Replace(Request.Form("qq"),"'","''")
toupic=Replace(Request.Form("toupic"),"'","''")
mypic=Replace(Request.Form("mypic"),"'","''")
ch=Replace(Request.Form("ch"),"'","''")
ku=Replace(Request.Form("ku"),"'","''")
gxqm=Replace(Request.Form("gxqm"),"'","''")
set canl=myconn.execute("select*from user where name='"&lgname&"' and password='"&lgpwd&"'")
if canl.eof or canl.bof then
%>
<%=t1%>错 误 信 息<%=t2&d1%>·你还没有登陆或者你登陆的用户名或密码错误！·<%=d2%><%
response.end
end if
if newpwd="" or repwd="" or anhao="" or email="" then
%>
<%=t1%>错 误 信 息<%=t2&d1%>·对不起！请填写完整必填的项目· <a href='javascript:history.go(-1)'><img border=0 src=pic/re.gif>返 回</a><%=d2%>
<%response.end
end if%>
<%if repwd<>newpwd then%>
<%=t1%>错 误 信 息<%=t2&d1%>·你的重复密码与你的新密码不匹配· <a href='javascript:history.go(-1)'><img border=0 src=pic/re.gif>返 回</a><%=d2%>
<%response.end
end if%>
<%
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
if not IsValidEmail(email) then
%><%=t1%>错 误 信 息<%=t2&d1%>·请检查你的 <b>E-mail</b> 是否填写准确· <a href='javascript:history.go(-1)'><img border=0 src=pic/re.gif>返 回</a><%=d2%>
<%response.end
end if%>
<%mytp=mypic
if mypic="" then
mytp="headpic/"&toupic&".gif"
ch=height
ku=width
end if
if not isnumeric(ch) or not isnumeric(ku) then
%><%=t1%>错 误 信 息<%=t2&d1%>·你的图像大小设置错误· <a href='javascript:history.go(-1)'><img border=0 src=pic/re.gif>返 回</a><%=d2%>
<%response.end
end if%>
<%
if ch>120 or ku>120 then
ch=height
ku=width
end if%>
<%
myconn.execute("update [user] set password='"&newpwd&"',burn='"&burn&"' ,anhao='"&anhao&"',ch='"&ch&"',ku='"&ku&"',email='"&email&"',qq='"&qq&"',sex='"&sex&"',toupic='"&mytp&"',home='"&home&"',gxqm='"&gxqm&"' WHERE name='"&lgname&"'")
myconn.execute("update admin set password='"&newpwd&"' where name='"&lgname&"'")
%>
<%=t1%>修 改 成 功<%=t2&d1%>·你已经成功的修改了你的用户信息！如果你有修改密码，请 <a href="login.asp">重新登陆</a>·<%=d2%>
<br><!--#include file="down.asp"-->