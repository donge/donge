<!--#include file="conn.asp"--><!--#include file="fun.asp"-->
<%
timeset="0"
set bbs=myconn.execute("select*from bbsinfo")
tl=bbs(0)
response.write"<title>"&tl&"</title>"
c1=bbs(1)
c2=bbs(2)
c3=bbs(3)
todaynum=bbs(4)
td=FormatDateTime(now+timeset/24,2)
if td<>bbs(5) then
myconn.execute("update bbsinfo set nyr='"&td&"'")
myconn.execute("update bbsinfo set todaynum='0'")
end if
set bbs=nothing
bd=request.querystring("bd")
id=request.querystring("id")
lgname=Request.Cookies("lgname")
lgpwd=request.cookies("lgpwd")
if lgname="" then
lgn="游客"
loy="登陆"
zhuzhu="注册"
else
enen=" <a href=http://gdca.zhiyuanit.com target=_blank><font color='#FFFFFF'>协会网站</font></a> |"
set cjbz=myconn.execute("select name from admin where name='"&lgname&"' and password='"&lgpwd&"' and bd='70767766'")
if not cjbz.eof then
admin="yes"
gl=" <a href=admin-index.asp><font color=#FFFFFF>论坛管理</font></a> |"
else
end if
set cjbz=nothing
lgn=lgname
loy="重新登陆"
zhuzhu="注册会员"
out="<a href=login.asp?action=exit><font color=#FFFFFF>退出论坛</font></a> |"
end if
response.write"<div align='center'><center><table border='1' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='"&c1&"' width='94%'><tr><td width='100%'><link rel='stylesheet' type='text/css' href='css.css'><body topmargin='0'><table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' width='100%'><tr><td background='pic/1.gif' width='60%'> <font color='#FFFFFF'>&nbsp;<b>欢迎你，"&kbbs(lgn)&""&_
"</b> | <a href='login.asp'><font color='#FFFFFF'>"&loy&"</font></a> | <a href='zhuce.asp'><font color='#FFFFFF'>"&zhuzhu&"</font></a> | "&out&""&gl&""&enen&" </font></td><td width=* background='pic/3.gif'><img border='0' src='pic/2.gif'></td></tr><tr><td width='100%' colspan='2' height='76'>&nbsp;<a href='index.asp'><img border='0' src='pic/logo.gif' style='border-style:solid; border-color:#2C3D8B; '></a></td>"&_
"</tr></table><div align='center'><center><table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='"&c1&"' width='100%'><tr><td width='100%' background='pic/4.gif' height='24'>&nbsp;<b><img src='pic/fl.gif'> 你的位置：</b><a href=index.asp>"&tl&"</a>"
if bd<>"" then
set wei=myconn.execute("select bdname,pass from bdinfo where bn='"&bd&"' and key<>'0'")
pass=wei("pass")
response.write"→ <a href=list.asp?bd="&bd&">"
wz=wei("bdname")
response.write""&wz&"</a>"
end if
set wei=nothing
if instr(Request("url"),"bbsmail.asp")>0 or instr(Request("url"),"mailcon.asp")>0 then
response.write"→ <a href='bbsmail.asp?id=0'>个人留言板</a>"
else
if id<>"" then
set w1=myconn.execute("select*from min where id="&id&"")
wzhuti=kbbs(w1("zhuti"))
wbody=w1("body")
wname=w1("name")
wriqi=w1("riqi")
wface=w1("face")
whits=w1("hits")
response.write"→ 浏览帖子："&LeftTrue(wzhuti,44)&""
end if
end if
set w1=nothing
response.write"</td></tr></table></center></div></td></tr></table></center></div>"
%>