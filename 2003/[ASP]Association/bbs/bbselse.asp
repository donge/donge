<!--#include file="conn.asp"-->
<%
set bbs=myconn.execute("select*from bbsinfo")
c1=bbs(1)
c2=bbs(2)
set bbs=nothing
t1="<div align=center><center><table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor=#111111 width=94% ><tr><td width=50% background=pic/5.gif><img border=0 src=pic/9.gif align=absbottom><font color=#FFFFFF><b>"
t2="</b></font></td><td width=50% background=pic/7.gif><img border=0 src=pic/6.gif></td></tr></table></center></div>"
d1="<div align=center><center><table border=1 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor="&c1&" width=94% ><tr><td width= 100% >"
d2="</td></tr></table></center></div>"
comeurl=Replace(Request.Form("comeurl"),"'","''")
if comeurl="" then
comeurl=Request.ServerVariables("HTTP_REFERER")
end if
lgname=Replace(Request.Form("lgname"),"'","''")
lgpwd=Replace(Request.Form("lgpwd"),"'","''")
cook=Replace(Request.Form("cook"),"'","''")
Response.Cookies("lgname")=lgname
Response.Cookies("lgpwd")=lgpwd
if cook="j1" then
Response.Cookies("lgname").Expires=date+1
Response.Cookies("lgpwd").Expires=date+1
elseif cook="j30" then
Response.Cookies("lgname").Expires=date+30
Response.Cookies("lgpwd").Expires=date+30
elseif cook="j365" then
Response.Cookies("lgname").Expires=date+365
Response.Cookies("lgpwd").Expires=date+365
elseif cook="j0" then
Response.Cookies("lgname")=lgname
Response.Cookies("lgpwd")=lgpwd
end if
%>
<%set lg=myconn.execute("select*from user where name='"&lgname&"' and password='"&lgpwd&"'")
if lg.eof and lg.bof then
Response.Cookies("lgname")=""
Response.Cookies("lgpwd")=""
myconn.close
set myconn=nothing
%><!--#include file="up.asp"-->
<%
myconn.close
set myconn=nothing
response.write"<br><br><form>"&t1&"登 陆 失 败"&t2&d1&"<br><P style='MARGIN: 10px'>·你的用户名或密码错误·</p><P style='MARGIN: 10px'>·<a href='javascript:history.go(-1)'>返回重新登陆</a>·</p>"&d2&"</form>"
else
myconn.execute("update [user] set qian=qian+50,meili=meili+8,jingyan=jingyan+8 WHERE name='"&lgname&"'")
myconn.close
set myconn=nothing
%>
<!--#include file="up.asp"-->
<%
myconn.close
set myconn=nothing
response.write"<br><br><form>"&t1&"登 陆 成 功"&t2&d1&"<br><P style='MARGIN: 10px'>·<a href='index.asp'>进入论坛首页</a>·</p><P style='MARGIN:10px'>·<a href='"&kbbs(comeurl)&"'>"&kbbs(comeurl)&"</a>·</p>"&d2&"</form>"
end if%><br><!--#include file="conn.asp"--><!--#include file="down.asp"-->