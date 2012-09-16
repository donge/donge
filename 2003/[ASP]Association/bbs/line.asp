<%myconn.execute("delete*from online where ltime<now-0.005")
lgname=Request.Cookies("lgname")
ip=request.servervariables("remote_addr")
if lgname="" then
set jilu=myconn.execute("select ip from online where ip='"&ip&"'")
if jilu.eof then
set jilu=nothing
myconn.execute("insert into online (ip,ltime)VALUES('"&ip&"','"&now&"')")
else
myconn.execute("update online set ltime='"&now&"' where ip='"&ip&"'")
end if
end if
if lgname<>"" then
set ujilu=myconn.execute("select name from online where name='"&lgname&"'")
if ujilu.eof then
set ujilu=nothing
myconn.execute("insert into online (name,ltime)VALUES('"&lgname&"','"&now&"')")
else
myconn.execute("update online set ltime='"&now&"' where name='"&name&"'")
end if
end if
set aaa1=myconn.execute("Select count(ltime)from online where name<>''")
usno=aaa1(0)
set aaa1=nothing
set aaa2=myconn.execute("Select count(ltime)from online")
lineno=aaa2(0)
nusno=lineno-usno
%>