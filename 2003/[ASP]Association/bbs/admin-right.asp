<!--#include file="conn.asp"--><!--#include file="fun.asp"-->
<link rel="stylesheet" type="text/css" href="css.css">
<%set bbs=myconn.execute("select*from bbsinfo")
c1=bbs(1)
c2=bbs(2)
set bbs=nothing
lgname=Request.Cookies("lgname")
lgpwd=request.cookies("lgpwd")
set cjbz=myconn.execute("select name from admin where name='"&lgname&"' and password='"&lgpwd&"' and bd='70767766'")
if cjbz.eof then
noyes="登 陆 失 败 ！"
mes="你不能进入后台管理。<br>·你现在登陆论坛的用户名 "&lgname&" 不是管理员。·"%>
<!--#include file="mes.asp"-->
<%response.end
else
t1="<div align=center><center><table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor=#111111 width=94% ><tr><td width=50% background=pic/5.gif><img border=0 src=pic/9.gif align=absbottom><font color=#FFFFFF><b>"
t2="</b></font></td><td width=50% background=pic/7.gif><img border=0 src=pic/6.gif></td></tr></table></center></div>"
d1="<div align=center><center><table border=1 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor="&c1&" width=94% ><tr><td width= 100% >"
d2="</td></tr></table></center></div>"
function bdlist(sename,n)
response.write"<select size=1 name="&sename&" style='font-size: 9pt; '>"
if n=1 then
response.write"<option value=all selected>所有论坛</option>"
end if
set bf=myconn.execute("select*from bdinfo where key<>'0'")
do while not bf.eof
response.write"<option value="&bf("bn")&">"&bf("bdname")&"</option>"
bf.movenext
loop
bf.close
set bf=nothing
response.write"</select>"
end function

%>
<body topmargin="0" leftmargin="0"><style>TABLE {BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 1px; }TD {BORDER-RIGHT: 0px; BORDER-TOP: 0px;}</style>

<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="100%">
  <tr>
    <td width="100%" height="28" background="pic/8.gif" align="center">
    <b><font color="#FFFFFF">论坛后台管理系统</font></b></td>
  </tr>
  </table><br>
<%action=request.querystring("action")
select case action%>
<%case"addfl"
noyes="添 加 分 类"
mes="<P style='MARGIN: 5px'>分类序号：<input type=text name=bn size=20><font color=#FF0000>·</font>只能填 <b>0</b> 除外的数字</p><P style='MARGIN: 5px'>分类名称：<input type=text name=bdname size=20><font color=#FF0000>·</font>分类的名称，无限制</p><P style='MARGIN: 5px'><input type=submit value=' 提 交 ' name=B1> <input type=reset value=' 重 置 ' name=B2></p>"
%>
<%
bn=request.form("bn")
bdname=Replace(Request.Form("bdname"),"'","''")
if bn="" or bn="0" or bdname="" or not isnumeric(bn) then
%>
<%else
set flyn=myconn.execute("select bn,bdname from bdinfo where bn='"&bn&"' and key='0'")
if not flyn.eof then
mes="<br>·分类序号 <b>"&bn&"</b> 已经存在！·请选择别的分类序号<br><br>"
else
myconn.execute("insert into bdinfo(bn,bdname,key)values('"&bn&"','"&bdname&"','0')")
mes="<br>·添加论坛分类成功！<br><br>"
end if
set flyn=nothing
end if
%><form method=POST>
<!--#include file="mes.asp"--></form>
<%case"bzgl"
bz=request.querystring("bz")
if bz="add" then
bt="添加新版主"
go="add"
put="&nbsp;添&nbsp;加&nbsp;"
elseif bz="del" then
bt="删除版主"
go="del"
put="&nbsp;删&nbsp;除&nbsp; "
end if
%>
<form action="admin-gl.asp?menu=bzgl&go=<%=go%>" method="POST">
<%=t1&bt&t2&d1%>
<P style='MARGIN: 5px'>版主名称：<input type="text" name="name" size="20"></p><P style='MARGIN: 5px'>管理论坛：<%=bdlist("bd",0)%>
</p><P style='MARGIN: 5px'><input type="submit" value=<%=put%> name="B1">&nbsp;
<input type="reset" value=" 重 置 " name="B2"></p>

<%=d2%>
</form>
<%case"chadmin"%><%=t1%>现有管理员<%=t2&d1%><P style="MARGIN: 5px">现有管理员名称：<br><%
set sho=myconn.execute("select name from admin where bd='70767766'")
do while not sho.eof
%><%=sho("name")%>&nbsp;&nbsp;&nbsp;<%sho.movenext
loop
set sho=nothing%><%=d2%>
<form action="admin-gl.asp?menu=addadmin" method="POST">
<%=t1%>添加管理员<%=t2&d1%><P style="MARGIN: 5px">添加管理员名称：( 该名称必须已经在论坛中注册 ) <input type="text" name="adminname" size="20"> 
<input type="submit" value=" 添 加 " name="B1">
<input type="reset" value=" 重 置 " name="B2"></p><%=d2%>
</form>
<form action="admin-gl.asp?menu=deladmin" method="POST">
<%=t1%>删除管理员<%=t2&d1%><P style="MARGIN: 5px">删除管理员名称：<input type="text" name="adminname" size="20"> 
<input type="submit" value=" 删 除 " name="B1">
<input type="reset" value=" 重 置 " name="B2"></p><%=d2%>
</form>
<%case"deluser"%>
<form action="admin-gl.asp?menu=deluser" method="POST">
<%=t1%>删除用户<%=t2&d1%><P style="MARGIN: 5px">用户名：<input type="text" name="delname" size="20"> 
<input type="submit" value=" 删 除 " name="B1">
<input type="reset" value=" 重 置 " name="B2"></p><%=d2%>
</form>
<%case"lookuser"%><br>
<%=t1%>查 看 注 册 用 户<%=t2%>
<div align="center">
  <center>
  <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-left-width:1px; border-right-width:1px; border-top-width:1px" bordercolor="<%=c1%>" width="94%">
    <tr>
<%
i=1
set rs=myconn.execute("select name from user")
do while not rs.eof
%>
<td width="12.5%" height="26">&nbsp;<a target="_blank" href="userinfo.asp?name=<%=rs("name")%>"><%=rs("name")%></a></td>
<%
i=i+1
if i=9 then
response.write"</tr>"
i=1
end if
rs.movenext
Loop
rs.Close
set rs=nothing%></tr>
  </table>
  </center>
</div>
<%case"addpassuser"
bn=request.querystring("bn")
set showps=myconn.execute("select pass from bdinfo where bn='"&bn&"' and key<>'0'")
%>
<form method="POST" action="admin-gl.asp?menu=addpassuser&bn=<%=bn%>">
<%=t1%>修改论坛认证用户<%=t2&d1%>
<P style="MARGIN: 5px">下面是已经通过认证的用户，要添加请继续填写，各用户之间用“,”隔开。</p><P style="MARGIN: 5px"><b>
<font color="#FF0000">注意：</font></b>填写过程中一定不能使用回车</p><P style="MARGIN: 5px">
<textarea name="user" cols=90 rows="15"><%=showps("pass")%></textarea></p><P style="MARGIN: 5px"><input type="submit" value=" 提 交 " name="b1"> <input type="reset" value=" 重 置 " name="b2">
</p><%set showps=nothing%>
</form>
<%case"bbs"
set bbs=myconn.execute("select*from bbsinfo")
%>
<form method="POST" action="admin-gl.asp?menu=bbs">
<%=t1%>修改论坛名称及其他<%=t2&d1%>
<P style="MARGIN: 5px">论坛名称:<input type="text" name="tl" size="37" value="<%=bbs("tl")%>"><font color="#FF0000">·</font>(你的论坛的名称)</p>
<P style="MARGIN: 5px">边框颜色:<input type="text" name="c1" size="20" value="<%=bbs("c1")%>"><font color="#FF0000">·</font>(表格边框的颜色)</p>
<P style="MARGIN: 5px">论坛底色:<input type="text" name="c2" size="20" value="<%=bbs("c2")%>"><font color="#FF0000">·</font>(一些表格的底色)</p>
<P style="MARGIN: 5px"><input type="submit" value=" 提 交 " name="B1"> <input type="reset" value=" 重 置 " name="B2"></p>
<%=d2%>
</form>
<%set bbs=nothing%>
<%case"chbbsinfo"
bn=request.querystring("bn")
set bbsinfo=myconn.execute("select*from bdinfo where bn='"&bn&"' and key<>'0'")
%><form action="admin-gl.asp?menu=updatebbs&bn=<%=bn%>" method="POST">
<%=t1%>修改论坛信息<%=t2&d1%>
<P style='MARGIN: 5px'>论坛序号：<b><%=bn%></b><P style='MARGIN: 5px'>论坛名称：<input type="text" name="bdname" size="25" value="<%=bbsinfo("bdname")%>"><font color="#FF0000">·</font>无限制</p>
<P style='MARGIN: 5px'>标志图片：<input type="text" name="picurl" size="49" value="<%=bbsinfo("picurl")%>">·将显示在论坛的右边，可以不填。</p>
<P style='MARGIN: 5px'>论坛介绍：<br><textarea rows="4" name="bdinfo" cols="58"><%=bbsinfo("bdinfo")%><%shuyu=bbsinfo("key")
paa=bbsinfo("pass")
set bbsinfo=nothing%></textarea><font color="#FF0000">·</font></p>
<P style='MARGIN: 5px'>属于分类：<select size="1" name="key" style="font-size: 9pt">
<%set bf=myconn.execute("select*from bdinfo where key='0' order by bn")
do while not bf.eof%><%if shuyu=bf("bn") then%><option value="<%=bf("bn")%>" selected><%=bf("bdname")%></option><%else%>
<option value="<%=bf("bn")%>"><%=bf("bdname")%></option><%end if%>
<%
bf.movenext
Loop
bf.Close
set bf=nothing
%>
</select><font color="#FF0000">·</font>请选择该论坛属于哪一种分类</p><br><P style='MARGIN: 4px'>
论坛类型：(请从下面的两项选择一个)<font color="#FF0000">·</font></p><P style='MARGIN: 4px'><input type="radio" value="nopwd" name="bbstype" <%if isnull(paa) or paa="" then%>checked<%end if%>>普通论坛
（注册用户可以自由的进入该类型论坛，·推荐·）<P style='MARGIN: 4px'><input type="radio" value="pwdpass" name="bbstype" <%if paa<>"" then%>checked<%end if%>>认证论坛
（只有版主认证的注册用户才能进入该类型论坛）</p><br>
<P style='MARGIN: 4px'><input type="submit" value=" 提 交 " name="B1"> <input type="reset" value=" 重 置 " name="B2"></p><br><%=d2%>
</form>
<%case"delall"
bn=request.querystring("bn")
myconn.execute("delete*from min where bd="&bn&"")
%><%=t1%>删 除 成 功<%=t2&d1%><P style="MARGIN: 5px"><br>·已经成功的删除了该版面的所有帖子·</p><br><%=d2%>

<%case"updateuser"%>
<form action="admin-gl.asp?menu=updateuser" method="POST">
<%=t1%>更改用户资料<%=t2&d1%>
<P style="MARGIN: 5px">用户名：<input type="text" name="chname" size="19"></p>
<P style="MARGIN: 5px">金&nbsp; 钱：<input type="text" name="chqian" size="10"> 
  魅&nbsp; 力：<input type="text" name="chmeili" size="10">
  经&nbsp; 验：<input type="text" name="chjingyan" size="10"></p><P style="MARGIN: 5px"><input type="submit" value=" 提 交 " name="B1">&nbsp; 
<input type="reset" value=" 重 置 " name="B2">&nbsp;<%=d2%></form>
<%case"seepwd"%>
<form action="admin-gl.asp?menu=seepwd" method="POST">
<%=t1%>查看用户密码<%=t2&d1%><P style="MARGIN: 5px">用户名：<input type="text" name="chaname" size="20"> 
<input type="submit" value=" 提 交 " name="B1">
        <input type="reset" value=" 重 置 " name="B2"></p><%=d2%> 
</form>
<%case"delany"%>
<center><font color="#FF0000">注意：使用此功能将删除指定的帖子以及公告，删除后不能恢复！请慎重使用！！</font></center>
<form action="admin-gl.asp?menu=delany" method="POST">
<%=t1%>删除指定日期内的帖子<%=t2&d1%>
<P style="MARGIN: 5px">删除多少天前的帖子：( 填数字 ) 
<input type="text" name="daynum" size="19"></p>
<P style="MARGIN: 5px">删除帖子所在的论坛：( 请选择 ) <%=bdlist("bd",1)%></p><P style="MARGIN: 5px"><input type="submit" value=" 提 交 " name="B1">&nbsp; 
<input type="reset" value=" 重 置 " name="B2">&nbsp;<%=d2%></form>
<form action="admin-gl.asp?menu=delnore" method="POST">
<%=t1%>删除指定日期内没有回复的主题<%=t2&d1%>
<P style="MARGIN: 5px">删除多少天前的帖子：( 填数字 ) 
<input type="text" name="daynum" size="19"></p>
<P style="MARGIN: 5px">删除帖子所在的论坛：( 请选择 ) <%=bdlist("bd",1)%></p><P style="MARGIN: 5px"><input type="submit" value=" 提 交 " name="B1">&nbsp; 
<input type="reset" value=" 重 置 " name="B2">&nbsp;<%=d2%></form><form action="admin-gl.asp?menu=delwhose" method="POST">
<%=t1%>删除指定用户的所有帖子<%=t2&d1%>
<P style="MARGIN: 5px">删除指定用户的帖子：( 用户名 ) 
<input type="text" name="ddname" size="19"></p>
<P style="MARGIN: 5px">删除帖子所在的论坛：( 请选择 ) <%=bdlist("bd",1)%></p><P style="MARGIN: 5px"><input type="submit" value=" 提 交 " name="B1">&nbsp; 
<input type="reset" value=" 重 置 " name="B2">&nbsp;<%=d2%></form>
<%case"bbsmail"%>
<center><font color="#FF0000">注意：使用此功能将删除指定的邮件，删除后不能恢复！请慎重使用！！</font></center>
<form action="admin-gl.asp?menu=delanymail" method="POST">
<%=t1%>删除指定日期内的留言<%=t2&d1%>
<P style="MARGIN: 5px">删除多少天前的留言：( 填数字 ) 
<input type="text" name="daynum" size="19"></p>
<P style="MARGIN: 5px"><input type="submit" value=" 提 交 " name="B1">&nbsp; 
<input type="reset" value=" 重 置 " name="B2">&nbsp;<%=d2%></form>
<form action="admin-gl.asp?menu=delwhosemail" method="POST">
<%=t1%>删除指定用户的所有留言<%=t2&d1%>
<P style="MARGIN: 5px">删除指定用户的留言：( 用户名 ) 
<input type="text" name="ddname" size="19"></p>
<P style="MARGIN: 5px"><input type="submit" value=" 提 交 " name="B1">&nbsp; 
<input type="reset" value=" 重 置 " name="B2">&nbsp;<%=d2%></form>

<%case"seepwd"%>
<form action="admin.gl.asp?menu=lookpwd" method="POST">
<%=t1%>查看用户密码<%=t2&d1%><P style="MARGIN: 5px">用户名：<input type="text" name="chaname" size="20"> 
<input type="submit" value=" 提 交 " name="B1">
        <input type="reset" value=" 重 置 " name="B2"></p><%=d2%> 
</form>
<%case"moveany"%>
<form action="admin-gl.asp?menu=moveday" method="POST">
<%=t1%>按指定天数移动帖子<%=t2&d1%>
<P style="MARGIN: 5px">移动多少天前的帖子：( 填数字 ) 
<input type="text" name="daynum" size="19"></p>
<P style="MARGIN: 5px">帖子原来所在的论坛：( 请选择 ) 
<%=bdlist("frombd",0)%></p>
<P style="MARGIN: 5px">帖子要移动到的论坛：( 请选择 ) 
<%=bdlist("tobd",0)%></p><P style="MARGIN: 5px"><input type="submit" value=" 提 交 " name="B1">&nbsp; 
<input type="reset" value=" 重 置 " name="B2">&nbsp;<%=d2%></form>
<form action="admin-gl.asp?menu=movename" method="POST">
<%=t1%>按指定用户移动帖子<%=t2&d1%>
<P style="MARGIN: 5px">移动指定用户的帖子：( 用户名 ) 
<input type="text" name="movename" size="19"></p>
<P style="MARGIN: 5px">帖子原来所在的论坛：( 请选择 ) 
<%=bdlist("frombd",0)%></p>
<P style="MARGIN: 5px">帖子要移动到的论坛：( 请选择 ) 
<%=bdlist("tobd",0)%></p><P style="MARGIN: 5px"><input type="submit" value=" 提 交 " name="B1">&nbsp; 
<input type="reset" value=" 重 置 " name="B2">&nbsp;<%=d2%></form>
<%case"lm"%>
<form action="admin-gl.asp?menu=addlm" method="POST">
<%=t1%>添加论坛联盟<%=t2&d1%><P style="MARGIN: 5px">论坛名称：<input type="text" name="name" size="20"></p>
<P style="MARGIN: 5px">论坛地址：<input type="text" name="url" size="38"></p>
<P style="MARGIN: 5px">论坛图片：<input type="text" name="picurl" size="38"></p> 
<P style="MARGIN: 5px"><input type="submit" value=" 添 加 " name="B1"> <input type="reset" value=" 重 置 " name="B2"></p><%=d2%>
</form>
<%=t1%>现有论坛联盟<%=t2&d1%><P style="MARGIN: 5px">
<%set slm=myconn.execute("select*from lmbbs")
do while not slm.eof
ha=slm("name")
response.write"<table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' width=100% height=18><tr><td width=33% >"&kbbs(ha)&"</td>"
response.write"<td width='33%'><a href='admin-gl.asp?menu=dellm&name="&kbbs(ha)&"'>删除</a></td><td width='34%'><a href='?action=editlm&name="&kbbs(ha)&"'>编辑</a></td></tr></table>"
slm.movenext
loop
set slm=nothing
%></p><%=d2%>
<%case"editlm"
name=Replace(Request.querystring("name"),"'","''")
set elm=myconn.execute("select*from lmbbs where name='"&name&"'")
%>
<form action="admin-gl.asp?menu=editlm&name=<%=kbbs(elm("name"))%>" method="POST">
<%=t1%>编辑论坛联盟<%=t2&d1%><P style="MARGIN: 5px">论坛名称：<%=kbbs(elm("name"))%></p>
<P style="MARGIN: 5px">论坛地址：<input type="text" name="url" size="38" value="<%=elm("url")%>"></p>
<P style="MARGIN: 5px">论坛图片：<input type="text" name="picurl" size="38" value="<%=elm("picurl")%>"></p> 
<P style="MARGIN: 5px"><input type="submit" value=" 修 改 " name="B1"> <input type="reset" value=" 重 置 " name="B2"></p><%=d2%>
</form>
<%set elm=nothing%>
<%end select
end if%>