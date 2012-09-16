<!--#include file="up.asp"-->
<%
pagenum=request.querystring("pagenum")
re=request.querystring("re")
riqi=now+timeset/24
name=Replace(Request.Form("name"),"'","''")
password=Replace(Request.Form("password"),"'","''")
body=Replace(Request.Form("body"),"'","''")
face=request.form("face")
if face="" then
face="re"
end if
ls=session("lasttime")
if ls+1/8640>now() then
noyes="发 帖 失 败 ！"
mes="<meta http-equiv=refresh content=4;url=javascript:history.go(-1)><font color="&c1&">&nbsp;<b>对不起！你不能成功地发出帖子！！！</b></font><br>·本论坛为了防止灌水，限制了同一人发帖的时间间隔为 <b>10</b> 秒！<br><br>"
else
select case re
case"no"
gonggao=request.form("gonggao")
zhuti=Replace(Request.Form("zhuti"),"'","''")
set rs=myconn.execute("SELECT*FROM user where name='"&name&"'and password='"&password&"'")
if rs.eof and rs.bof or zhuti="" or body="" then
noyes="发 帖 失 败 ！"
mes="<meta http-equiv=refresh content=4;url=javascript:history.go(-1)><font color="&c1&">&nbsp;<b>对不起！你不能成功地发出帖子！！！可能存在以下问题：</b></font><br>· 你并没有填写主题或主要内容！<br>· 你填写的名字或密码错误！<br>· 如果你还没有注册一个用户，请<a href=zhuce.asp><font color=#000080>立即注册</font></a>！<br><br>"
else
select case gonggao
case"4"
if rs("qian")<1000 or rs("jingyan")<200 or rs("meili")<200 then
mes="<meta http-equiv=refresh content=4;url=javascript:history.go(-1)><font color="&c1&">&nbsp;<b>对不起！你不能成功地发出帖子！</b></font><br>· 你的金钱、魅力、经验中有某一项或多项不足够发广告帖！"
cangg="no"
else
cangg="yes"
if admin<>"yes" then
myconn.execute("update [user] set qian=qian-1000,meili=meili-200,jingyan=jingyan-200 WHERE name='"&name&"'")
end if
end if
case"0"
cangg="yes"
case"1"
if admin="yes" then
cangg="yes"
else
cangg="no"
end if
end select
if cangg="yes" then
myconn.execute("insert into min(zhuti,name,body,riqi,face,bd,orders,gonggao,editriqi)VALUES('"&zhuti&"','"&name&"','"&body&"','"&riqi&"','"&face&"',"&bd&",'"&riqi&"','"&gonggao&"','"&riqi&"')")
myconn.execute("update [user] set qian=qian+200,meili=meili+30,jingyan=jingyan+30 WHERE name='"&name&"'")
set seeme=myconn.execute("select top 1 id from min order by id desc")
fid=seeme("id")
set seeme=nothing
noyes="发 帖 成 功 ！"
mes="<meta http-equiv=refresh content=3;url=list.asp?bd="&bd&"><font color="&c1&"><b>&nbsp;发表成功----如果你不点击下面的连接，将在 3 秒后自动跳转到 "&wz&"！</b></font><br>· <a href=show.asp?id="&fid&"&bd="&bd&">回到你所发的帖的页面！</a><br>· <a href=list.asp?bd="&bd&">"&wz&"</a><br>· <a href=index.asp>"&tl&"</a><br><br>"
end if
end if
set rs=nothing
case"yes"
set rs=myconn.execute("SELECT*FROM user where name='"&name&"'and password='"&password&"'")
if rs.eof or rs.bof or body="" then
noyes="回 复 失 败 ！"
mes="<meta http-equiv=refresh content=4;url=javascript:history.go(-1)><font color="&c1&">&nbsp;<b>对不起！你不能成功地回复帖子！！！可能存在以下问题：</b></font><br>· 你并没有填写主要内容！<br>· 你填写的名字或密码错误！<br>· 如果你还没有注册一个用户，请<a href=zhuce.asp><font color=#000080>立即注册</font></a>！<br><br>"
else
id=request.querystring("id")
myconn.execute("insert into min(name,body,riqi,bd,orders,bid,face,editriqi)VALUES('"&name&"','"&body&"','"&riqi&"',"&bd&",'"&riqi&"',"&id&",'"&face&"','"&riqi&"')")
myconn.execute("update min set orders='"&riqi&"' where id="&id&"")
myconn.execute("update [user] set qian=qian+100,meili=meili+15,jingyan=jingyan+15 WHERE name='"&name&"'")
noyes="回 复 成 功 ！"
mes="<meta http-equiv=refresh content=3;url=list.asp?bd="&bd&"><font color="&c1&"><b>&nbsp;回复成功----如果你不点击下面的连接，将在 3 秒后自动跳转到 "&wz&"！</b></font><br>· <a href=show.asp?id="&id&"&bd="&bd&"&topage="&pagenum&">回到你所回复的帖的页面！</a><br>· <a href=list.asp?bd="&bd&">"&wz&"</a><br>· <a href=index.asp>"&tl&"</a><br><br>"
end if
end select
set ty=myconn.execute("select nyr from bbsinfo")
myconn.execute("update bbsinfo set todaynum=todaynum+1")
session("lasttime")=Now()
end if
%><br><!--#include file="mes.asp"--><br><!--#include file="down.asp"-->