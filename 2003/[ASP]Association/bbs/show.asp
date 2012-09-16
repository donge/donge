<!--#include file="up.asp"--><!--#include file="ubbcode.asp"-->
<%zai=request.querystring("topage")
if zai="" then
zai=1
end if
response.write"<script language='javascript'>function Check(){var Name=document.form.topage.value;document.location='?bd="&bd&"&id="&id&"&topage='+Name+'';}</script>"
if isnull(pass) or pass="" then
userin=ok
else
user=split(pass,",")
for i = 0 to ubound(user)
if lgname=trim(user(i)) and lgname<>"" then
userin="ok"
exit for
else
userin="no"
end if
next
end if
if userin="no" then
width="75%"
noyes="进 入 失 败 ！"
mes="<font color="&c1&"><b>你不能成功的进入该版面，可能存在以下问题：</b></font><br>● 该版面为认证论坛，你还没有得版主的认证！<br> ● 你还没有<a href=login.asp>登陆</a>！<br><br>"
response.write"<br>"%><!--#include file="mes.asp"--><%response.end
else
myconn.execute("update min set hits=hits+1 WHERE id="&id&"")
count=myconn.execute("select count(riqi) from min where bid=" &id& "")(0)
pagesetup=10
renum=count+1
If renum/pagesetup > (renum\pagesetup) then
yenum=(renum\pagesetup)+1
else yenum=(renum\pagesetup)
End If
response.write"<div align='center'><center><table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='#111111' width='94%' height='42'><tr><td width='70%'><a target='_self' href='say.asp?bd="&bd&"&re=no'><img border=0 src=pic/fabiao.gif align='absmiddle'></a> <a href='say.asp?bd="&bd&"&id="&id&"&re=yes&pagenum="&yenum&"'><img border='0' src='pic/back.gif' align='absmiddle'></a></td><td width='30%' align='right' valign='bottom'><img border='0' src='pic/tl.gif'> 你是本帖的第 <b>"&whits+1&"</b> 位阅读者</td></tr></table></center></div>"
set huati=myconn.execute("select*from user where name='"&wname&"'")
response.write"<div align='center'><center><table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse; ' width='94%'><tr><td width='100%' background='pic/8.gif' height='26'><font color='#FFFFFF'>&nbsp;<b>『 帖子主题 』："&LeftTrue(wzhuti,50)&"</b></font></td></tr></table></center></div>"&_
"<div align='center'><center><table border='1' cellpadding='0' cellspacing='0' style='WORD-BREAK: break-all; border-collapse:collapse' bordercolor='"&c1&"' width='94%' height='140'><tr><td width='20%' valign='top'><div align='center'><center><table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='#111111'><tr><td width='100%'>"&_
"<div align='center'><center><br><table width=$1 style='filter:glow(color="&c1&", strength=1); border-collapse:collapse' bordercolor='#111111' cellpadding='0' cellspacing='0'><font color=black>"&kbbs(wname)&"</font></table><br><img border='0' src="&huati("toupic")&" width="&huati("ku")&" height="&huati("ch")&"></center></div><br>金钱："
q1=huati("qian")
response.write""&q1&"<br>经验："
j1=huati("jingyan")
response.write""&j1&"<br>魅力："
m1=huati("meili")
response.write""&m1&"<br>帖数："&myconn.execute("select count(name)from min where name='"&wname&"'")(0)&"<br>"
myname=wname
sqltype="my"
response.write"等级："%><!--#include file="upji.asp"-->
<%
response.write"<b>"&dj&"</b><br>『 "&dd&" 』<br></td></tr></table></center></div></td><td width='80%' valign='top'> "
kw=kbbs(wname)
response.write"<table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='#111111' width='97%' height='25'><tr><td width='81%' valign='bottom'>&nbsp;<a href='userinfo.asp?name="&kw&"' title='查看"&kw&"的资料'><img src='pic/info.gif' border='0'> 信 息</a>&nbsp; <a title='"&kw&"的OICQ号码："&huati("qq")&"'><SPAN style='CURSOR: hand' ><img border='0' src='pic/oicq.gif'> OICQ</span></a>&nbsp; <a href='mailto:"&huati("email")&"' title='发邮件给"&kw&"'><img border='0' src='pic/mail.gif'> 邮 箱</a>&nbsp; <a href='"&kbbs(huati("home"))&"' title='访问"&kw&"的主页'><img border='0' src='pic/home.gif'> 主 页</a>&nbsp; <a href=edit.asp?id="&id&"&ed=1&reid="&id&"&bd="&bd&"><img border='0' src='pic/bmp.gif'> 编 辑</a> &nbsp;<a href=say.asp?bd="&bd&"&id="&id&"&re=yes&quoteid="&id&"><img src='pic/xie.gif' border='0'> 引 用</a></td>"
gxqm=huati("gxqm")
set huati=nothing
response.write"<td width='19%' valign='bottom' align='right'>楼 &nbsp; 顶</td></tr></table><hr color='"&c1&"' width='98%' size='1'><blockquote><p style='line-height:15pt'><img src='face/"&wface&".gif'> <b>"&wzhuti&"</b><br>"&ubb(wbody)&"<p></p>"
if gxqm<>"" then
response.write"<br><div align=right>————————————————————<br>"&ubb(gxqm)&"</div>"
end if
response.write"</blockquote></td></tr><tr><td height='26' align='center'>状态："
set onoff=myconn.execute("select name from online where name='"&wname&"'")
if onoff.eof then
ooo="offline"
else
ooo="online"
end if
set onoff=nothing
response.write"<img border=0 align=absmiddle src=pic/"&ooo&".gif></td><td><div align='center'><center><table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='#111111' width='98%'><tr><td width='50%'><img border='0' src='pic/xie.gif'> "&wriqi&"</td><td width='50%' align='right'>"
if wface<>"top" then
ti="置顶该帖子"
ac="top"
gi="top"
else
ti="取消置顶"
ac="nottop"
gi="nottop" 
end if
response.write"<a href='bbsgl.asp?bd="&bd&"&id="&id&"&action="&ac&"' title="&ti&"><img border='0' src='face/"&gi&".gif'></a> "
if wface<>"jing" then
 ti="设该帖为精华帖子"
ac="jh"
gi="jing"
else
ti="取消精华"
ac="notjh"
gi="notjing" 
end if
response.write"<a href='bbsgl.asp?bd="&bd&"&id="&id&"&action="&ac&"' title="&ti&"><img border='0' src='face/"&gi&".gif'></a> <a href='bbsgl.asp?bd="&bd&"&id="&id&"&action=del&re=no' title=删除该帖><img border='0' src='pic/del.gif'></a> <a href='bbsgl.asp?bd="&bd&"&id="&id&"&action=move' title='移动该帖子到别的版面'><img border='0' src='pic/go.gif'></a></td></tr></table></center></div></td></tr></table></center></div>"
set huati=nothing
dim rs
dim sql
set rs = server.createobject("adodb.recordset")
sql = "select*from min where bid=" &id& " order by id"
on error resume next
rs.Open sql,myConn,1
If Count/pagesetup > (Count\pagesetup) then
TotalPage=(Count\pagesetup)+1
else TotalPage=(Count\pagesetup)
End If
PageCount= 0
RS.MoveFirst
if Request.QueryString("ToPage")<>"" then PageCount = cint(Request.QueryString("ToPage"))
if PageCount <=0 then PageCount = 1
if PageCount > TotalPage then PageCount = TotalPage
RS.Move (PageCount-1) * pagesetup
ai=1
do while not rs.eof
rnn=rs("name")
set back=myconn.execute("select*from user where name='"&rnn&"'")
lou=pagesetup-ai
if lou/2>lou\2 then
bgcl=""&c2&""
else
bgcl="white"
end if
response.write"<div align='center'><center><table  width='94%' bordercolor='#111111' style='border-collapse: collapse; border-width: 0' cellpadding='0' cellspacing='0'><tr><td width=100% height='2'></td></tr></table></center></div>"&_
"<div align='center'><center><table border='1' cellpadding='0' cellspacing='0' style='WORD-BREAK: break-all; border-collapse:collapse' bordercolor='"&c1&"' width='94%' height='150' bgcolor='"&bgcl&"'><tr><td width='20%' valign='top'><div align='center'><center><table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='#111111'><tr><td>"
response.write"<div align='center'><center><br><table width=$1 style='filter:glow(color="&c1&", strength=1); border-collapse:collapse' bordercolor='#111111' cellpadding='0' cellspacing='0'><font color=black>"&kbbs(rnn)&"</font></table><br><img border='0' src="&back("toupic")&" width="&back("ku")&" height="&back("ch")&"></center></div><br>金钱："
q1=back("qian")
response.write""&q1&"<br>经验："
j1=back("jingyan")
response.write""&j1&"<br>魅力："
m1=back("meili")
response.write""&m1&"<br>帖数："&myconn.execute("select count(name)from min where name='"&rnn&"'")(0)&"<br>"
myname=rnn
sqltype="my"
response.write"等级："
%><!--#include file="upji.asp"-->
<%
response.write"<b>"&dj&"</b><br>『 "&dd&" 』<br></td></tr></table></center></div>"&_
"</td><td width='80%' valign='top'><table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='#111111' width='97%' height='25'><tr><td width='81%' valign='bottom'>&nbsp;<a href='userinfo.asp?name="&rnn&"' title='查看"&rnn&"的资料'><img src='pic/info.gif' border='0'> 信 息</a>&nbsp; <a title='"&rnn&"的OICQ号码："&kbbs(back("qq"))&"'><SPAN style='CURSOR: hand' ><img border='0' src='pic/oicq.gif'> OICQ</span></a>&nbsp; <a href='mailto:"&back("email")&"' title='发邮件给"&rnn&"'><img border='0' src='pic/mail.gif'> 邮 箱</a>&nbsp; <a href='"&kbbs(back("home"))&"' title='访问"&rnn&"的主页'><img border='0' src='pic/home.gif'> 主 页</a>&nbsp; <a href='edit.asp?id="&rs("id")&"&ed=2&reid="&id&"&bd="&bd&"'><img border='0' src='pic/bmp.gif'> 编 辑</a> &nbsp;<a href=say.asp?bd="&bd&"&id="&id&"&re=yes&quoteid="&rs("id")&"><img src='pic/xie.gif' border='0'> 引 用</a></td>"
gxqm=back("gxqm")
set back=nothing
response.write"</td><td width='19%' valign='bottom' align='right'>"
if lou>0 then
response.write"<font color='"&c1&"'>"&CHR(64+zai)&"</font> 栋<font color='"&c1&"'> "&lou&"</font> 楼"
else
response.write"<font color='"&c1&"'>"&CHR(64+zai)&"</font> 栋 楼 下"
end if
response.write"</td></tr></table><hr color='"&c1&"' width='98%' size='1'><blockquote><p style='line-height:15pt'><img src='face/"&rs("face")&".gif'>&nbsp;<br>"&ubb(rs("body"))&"<p></p>"
if gxqm<>"" then
response.write"<br><div align=right>————————————————————<br>"&ubb(gxqm)&"</div>"
end if
response.write"</blockquote></td></tr><tr><td height='26' align='center'>状态："
set onoff=myconn.execute("select name from online where name='"&rnn&"'")
if onoff.eof then
ooo="offline"
else
ooo="online"
end if
set onoff=nothing
response.write"<img border=0 align=absmiddle src=pic/"&ooo&".gif></td><td><div align='center'><center><table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='#111111' width='98%'><tr><td width='50%'><img border='0' src='pic/xie.gif'> "&rs("riqi")&"</td><td width='50%' align='right'>"&_
"<a href='bbsgl.asp?bd="&bd&"&id="&rs("id")&"&action=del&re=yes'><img border='0' src='pic/del.gif'></a></td></tr></table></center></div></td></tr></table></center></div>"
ai=ai+1
if ai>pagesetup then exit do
rs.movenext
loop
rs.Close
response.write"<div align='center'><center><TABLE borderColor="&c1&" cellSpacing=0 cellPadding=0 width='94%' border=1 style='border-collapse: collapse; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px'><TBODY><TR height=25><TD height=2><TABLE cellSpacing=0 cellPadding=3 width='100%' border=0 background='pic/8.gif' style='border-collapse: collapse; border-left-width:0; border-top-width:0; border-bottom-width:0'><TBODY><TR><TD><b><font color='#FFFFFF'><img border='0' src='pic/fl.gif'> 共有</font><font color='#00FFFF'> "&TotalPage&" </font><font color='#FFFFFF'>页,<font color='#00FFFF'> "&count&" </font><font color='#FFFFFF'>张回复帖,每页有<font color='#00FFFF'> "&pagesetup&" </font> 张贴子 >> ["
ii=PageCount-5
iii=PageCount+5
if ii < 1 then
ii=1
end if
if iii > TotalPage then
iii=TotalPage
end if
if PageCount > 6 then
Response.Write "<a href=?topage=1&bd="&bd&"&id="&id&"><font color=yellow>1</font></a> ... "
end if

for i=ii to iii
If i<>PageCount then
Response.Write " <a href=?topage="& i &"&bd="&bd&"&id="&id&"><font color=yellow>" & i & "</font></a> "
else
Response.Write " <font color=red><b>"&i&"</b></font> "
end if
next
if TotalPage > PageCount+5 then
Response.Write " ... <a href=?topage="&TotalPage&"&bd="&bd&"&id="&id&"><font color=yellow>"&TotalPage&"</font></a>"
end if
response.write" ]</font></b></TD><form name=form method='POST' action=javascript:Check()><TD height=2 align='right'><font color='#FFFFFF'>页码：<input style=FONT-SIZE:9pt maxLength='6' size='6' name='topage' value='"&PageCount&"'><input style=FONT-SIZE:9pt value='GO!' type='submit'></font></TD></form></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></center></div>"
response.write"<div align=center><center><table border=0 cellspacing=1 style='border-collapse: collapse' bordercolor=#111111 width=94% ><tr><td width=100% align=right valign=bottom height=30><select onchange=if(this.options[this.selectedIndex].value!=''){location=this.options[this.selectedIndex].value;} style='font-size: 9pt'><option selected>跳转论坛至...</option>"
set shsh=myconn.execute("select bdname,bn from bdinfo where key='0'")
do while not shsh.eof
response.write"<option>+"&shsh("bdname")&"</option>"
set fen=myconn.execute("select bdname,bn from bdinfo where key='"&shsh("bn")&"'")
do while not fen.eof
response.write"<option value='list.asp?bd="&fen("bn")&"'>-"&fen("bdname")&"</option>"
fen.movenext
loop
set fen=nothing
shsh.movenext
loop
set shsh=nothing
response.write"</select></td></tr></table></center></div><SCRIPT>var i=0;function presskey(eventobject){if(event.ctrlKey && window.event.keyCode==13){i++;if (i>1) {alert('帖子正在发出，请耐心等待！');return false;}this.document.re.submit();}}</SCRIPT>"
noyes="快 速 回 复"
mes="<form method='POST' name=re action='save.asp?bd="&bd&"&id="&id&"&re=yes&pagenum="&yenum&"'><table border=0 cellpadding=0 cellspacing=0' style='border-collapse: collapse' bordercolor='#111111' width='98%'><tr><td width='20%' height=26 bgcolor="&c2&"><b>&nbsp;用户信息：</b></td><td valign='top' bgcolor="&c2&">用户名：<input type='text' name='name' size='19' value='"&lgname&"'> <a href=zhuce.asp>没有注册？</a> 密&nbsp; 码：<input type='password' name='password' size='20' value='"&request.cookies("lgpwd")&"'> <a href=getpwd.asp>忘记密码？</a></td></tr><tr><td width='20%' valign=top><p style='margin-top: 6; margin-left:7'><b>帖子内容：</b><BR><LI><p style='margin-left: 5; '>HTML标签： 不可用 <LI><p style='margin-left: 5; line-height:150%'>UBB标签： 可用 <LI><p style='margin-left: 5; line-height:150%'>贴图标签： 可用 <LI><p style='margin-left: 5; line-height:150%'>Flash标签：不可用 <LI><p style='margin-left: 5; line-height:150%'>表情字符转换：不可用 <LI><p style='margin-left: 5; line-height:150%'>最多15KB<br></td><td valign='top'><textarea onkeydown=presskey(); rows=6 name='body' cols='92' Title='按 Ctrl+Enter 直接发送'></textarea></p><p><input type='submit' value='OK_好了！回复帖子' name='submit1' tabindex='4'>&nbsp;&nbsp;&nbsp; <input type='reset' value='NO_不行！我要重写' name='B2'> [按 Ctrl+Enter 直接发送]</td></tr></table></form>"
%><!--#include file="mes.asp"-->
<%response.write"<br>"%>
<!--#include file="down.asp"--><%end if%>