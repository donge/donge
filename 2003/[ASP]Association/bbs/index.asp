<!--#include file="up.asp"--><!--#include file="line.asp"--><%ggnum=5%>
<%response.write"<style>TABLE {BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 1px; }TD {BORDER-RIGHT: 0px; BORDER-TOP: 0px;}</style><div align='center'><center><table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor="&c1&" width='94%'><tr><td width='100%' style='border-left-style: solid; border-left-width: 1; border-right-style: solid; border-right-width: 1; border-top-style: solid; border-top-width: 1��border-BOTTOM-style: solid; border-bottom-width: 1'>"&_
"<table border=0 cellpadding=0 cellspacing=0 style='border-collapse: collapse' bordercolor=#111111 width=94% ><tr><form method=POST action=bbselse.asp name=login><td width=100% height=30><p style='margin-left: 3; margin-top: 3; margin-bottom: 3'>"
if lgname="" then
response.write"<img border='0' src='pic/guest.gif' align='absmiddle'> �ο����á����ȵ�½<img border='0' src='pic/go.gif' align='absmiddle'>�û�����<input size='10' name='lgname'>&nbsp;��&nbsp; �룺<input type='password' size='10' value name='lgpwd'> Cookies��<select style='FONT-SIZE: 9pt' size='1' name='cook'><option value='j0' selected>������</option><option value='j1'>����һ��</option><option value='j30'>����һ��</option><option value='j365'>����һ��</option></select> <input type='submit' value='�� ½' name='B1'> <input type='reset' value='�� ��' name='b2'>"
else
set pic=myconn.execute("select toupic,qian,meili,jingyan from user where name='"&lgname&"'")
q1=pic(1)
m1=pic(2)
j1=pic(3)
sqltype="lg"
response.write"<img src="&pic(0)&" align='absmiddle' width='32' height='32' border='0'> ��ӭ�㣺<b><a href='userinfo.asp?name="&kbbs(lgname)&"'>"&kbbs(lgname)&"</a></b>,��Ľ�Ǯ��<b>"&q1&"</b> ������<b>"&m1&"</b> ���飺<b>"&j1&"</b> �ȼ���"%><!--#include file="upji.asp"--><%response.write"<b>"&dj&"</b>�� "&dd&" �� ��<a href='elselist.asp?action=mytop'>���������</a>��<a href='elselist.asp?action=withmetop'>���������</a>��"
end if
set pic=nothing
response.write"</td></form></tr></table><table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='"&c1&"' width='100%'><tr><td width='33%' height='23' background='pic/5.gif'><img border='0' src='pic/9.gif' align='absbottom'><font color='#FFFFFF'><b>�� ̳ �� Ϣ</b></font></td><td width='33%' background='pic/5.gif'><img border='0' src='pic/9.gif' align='absbottom'><font color='#FFFFFF'><b>�� �� �� ��</b></font></td><td width='34%' background='pic/5.gif'><img border='0' src='pic/9.gif' align='absbottom'><font color='#FFFFFF'><b>ϵ ͳ �� ��</b></font></td></tr></table>"&_
"<table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='"&c1&"' width='100%'><tr><td width='33%' valign='top'><table borderColor='#FFFFFF' cellSpacing='0' cellPadding='0' width='100%' bgColor="&c2&" border='1' style='border-collapse: collapse' height='62'><tr><td>&nbsp;ע���Ա��"
regno=myconn.execute("select count(name)from user")(0)
response.write"<b>"&regno&"</b>"
set regno=nothing
response.write"</td><td>&nbsp;��������"
tieno=myconn.execute("select count(*)from min where gonggao<>1 and bid=0")(0)
response.write"<b>"&tieno&"</b>"
set tieno=nothing
response.write"</td></tr><tr><td>&nbsp;����������<b>"&todaynum&"</b></td><td>&nbsp;��������"
tienoa=myconn.execute("select count(*)from min where gonggao<>1")(0)
response.write"<b>"&tienoa&"</b>"
set tienoa=nothing
mailnewno=myconn.execute("select count(tname) from hand where tname='"&lgname&"' and isnew='0'")(0)
response.write"</td></tr><tr><td>&nbsp;����ʱ�䣺<b>"&FormatDateTime(now+timeset/24,4)&"</b></td><td>��</td></tr></table></td><td width='33%' valign='top'><table borderColor='#FFFFFF' cellSpacing='0' cellPadding='0' width='100%' bgColor='"&c2&"' border='1' style='border-collapse: collapse' height='62'><tr><td>�� <a href='login.asp'>�� ½</a> �� <a href='userlist.asp'>�û��б�</a> �� <a href='elselist.asp?action=new'>�鿴����</a> ��</td>"&_
"</tr><tr><td>�� <a href='zhuce.asp'>ע ��</a> �� <a href='myinfo.asp'>��������</a> �� <a href='bbsmail.asp?id=0'>������ <b><font color="&c1&">"&mailnewno&"</font></b></a> ��"
if mailnewno>0 then
response.write"<marquee width=18 direction=up height=10 scrolldelay=1 scrollamount=2><img border=0 src=pic/newmail.gif></marquee>"
end if
response.write"</td></tr><tr><td colSpan='2'>�� ���IP��"&request.servervariables("remote_addr")&" ��</td></tr></table></td><td width='34%' valign='top'><table borderColor='#ffffff' cellSpacing='0' cellPadding='0' width='100%' bgColor='"&c2&"' border='1' style='border-collapse: collapse' height='62'><tr><td><img src='pic/gonggao.gif' align='absmiddle'>��ӭ���ǵ��»�Ա��"
set mailnewno=nothing
set newuser=myconn.execute("select top 1 name from user order by userid desc")
response.write"<a href='userinfo.asp?name="&kbbs(newuser("name"))&"'><font color="&c1&"><b>"&kbbs(newuser("name"))&"</b></font></a>"
set newuser=nothing
response.write"</td></tr><tr><td>"
igg=1
set gg=myconn.execute("select zhuti,id,face,bd from min where gonggao=1 order by id desc")
response.write"<marquee onmouseover='this.stop()' onmouseout='this.start()' scrollAmount='1' direction='up' width='100%' height='36'>"
do while not gg.eof 
response.write"<img src='face/"&gg("face")&".gif' > <a href=show.asp?bd="&gg("bd")&"&id="&gg("id")&">"&kbbs(gg("zhuti"))&"</a><br>"
igg=igg+1
if igg>ggnum then exit do
gg.movenext
loop
response.write"</marquee>"
set gg=nothing
response.write"</td></tr></table></td></tr></table></td></tr></table></center></div><div align='center'><center><table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='#111111' width='94%'><tr><td width='180' background='pic/5.gif'><font color='#FFFFFF'><b><img border='0' src='pic/9.gif' align='absbottom'>�� ̳ �� ��</b></font></td><td background='pic/7.gif'><img border='0' src='pic/6.gif'></td></tr></table></center></div>"
set bf=myconn.execute("select*from bdinfo where key='0' order by bn")
do while not bf.eof
bbnn=bf("bn")
response.write"<div align='center'><center><table border='1' cellpadding='0' cellspacing='0' bordercolor='"&c1&"' width='94%'><tr><td width='100%' height='26' background='pic/0.gif'>&nbsp;<img src='pic/fl.gif'> <font color='"&c1&"'><b>"&bf("bdname")&"</b></font></td></tr></table></center></div>"
set asd=myconn.execute("select*from bdinfo where key<>'0' and key='"&bbnn&"'order by bn")
do while not asd.eof
set hane=myconn.execute("select riqi from min where gonggao<>1 and riqi>now-1/2 and bd="&asd("bn")&"")
if hane.eof then
gif="on"
else
gif="new"
end if
if asd("pass")<>"" then
gif="rz"
end if
set hane=nothing
response.write"<div align='center'><center><TABLE class=tableBorder1 cellSpacing=0 cellPadding=0 border='1' bordercolor='"&c1&"' width='94%' style='border-collapse: collapse'><TBODY><TR><TD class=tablebody1 align=middle width=48><img src='pic/"&gif&".gif'></TD><TD class=tablebody1 vAlign=top width=*><TABLE cellSpacing=0 cellPadding=2 width='100%' border=0 style='border-collapse: collapse' bordercolor='#111111'><TBODY><TR><TD class=tablebody1 width=*><p style='margin-left: 3; margin-top: 5'><a href=list.asp?bd="&asd("bn")&">"&asd("bdname")&"</a></TD><TD class=tablebody1 align=middle width=40 rowSpan=2><TABLE align=left><TBODY><TR><TD>"
if asd("picurl")<>"" then
response.write"<a href=list.asp?bd="&asd("bn")&"><img border=0 src="&asd("picurl")&"></a>"
end if
response.write"</TD><TD width=20>&nbsp;&nbsp;&nbsp;</TD></TR></TBODY></TABLE></TD><TD class=tablebody1 width='30%' rowSpan=2>"
set u1=myconn.execute("select top 1 * from min where bd="&asd("bn")&" and gonggao<>1 and gonggao<>4 order by id desc")
if u1.eof and u1.bof then
response.write"�����滹û�����ӣ�"
else
if u1("bid")=0 then
ub=u1("zhuti")
lb=kbbs(ub)
showid=u1("id")
else
ub=u1("body")
lb=kbbs(ub)
showid=u1("bid")
end if
response.write"���ߣ�<a href='userinfo.asp?name="&kbbs(u1("name"))&"'>"&kbbs(u1("name"))&"</a> <br>ʱ�䣺"&u1("orders")&"<br>���⣺<img align=absmiddle src=face/"&u1("face")&".gif> <a href=show.asp?id="&showid&"&bd="&asd("bn")&">"&LeftTrue(lb,30)&"</a>"
end if
set u1=nothing
response.write"</TD></TR><TR><TD width=*><p style='margin-left: 3;margin-top:3; margin-bottom:4'><img src='pic/tl.gif'> <font color=#808080>"&asd("bdinfo")&"</font></TD></TR><TR><TD class=tablebody2 width=* height=24 bgcolor="&c2&">&nbsp;"
cc=1
set cb=myconn.execute("select*from admin where bd='"&asd("bn")&"'")
if cb.eof or cb.bof then
response.write"�ð��滹û�а���"
else
response.write"�������"
do while not cb.eof
response.write"<a href='userinfo.asp?name="&kbbs(cb("name"))&"'>"&kbbs(cb("name"))&"</a> | "
cc=cc+1
if cc>4 then exit do
cb.movenext
loop
end if
cb.Close
set cb=nothing
response.write"</TD><TD class=tablebody2 width=40 height=20 bgcolor='"&c2&"'></TD><TD class=tablebody2 vAlign=center width=200 bgcolor='"&c2&"'>"
tie=myconn.execute("select count(*)from min where gonggao<>1 and bd="&asd("bn")&"")(0)
response.write"��������"&tie&""
set tie=nothing
response.write"</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></center></div>"
asd.movenext
Loop
asd.Close
set asd=nothing
bf.movenext
Loop
bf.Close
set bf=nothing
response.write"<div align='center'><center><table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='"&c1&"' width='94%'><tr><td width='100%' style='border-style: solid; border-width: 1' bordercolor='"&c1&"'><table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='#111111' width='100%'><tr><td width='180' background='pic/5.gif'><img border='0' src='pic/9.gif' align='absbottom'><font color='#FFFFFF'><b>�� �� ͳ ��</b></font></td><td background='pic/7.gif'><img border='0' src='pic/6.gif'></td></tr></table>"&_
"<table border='1' cellspacing='1' style='border-collapse: collapse' bordercolor='#FFFFFF' width='100%' bgcolor='"&c2&"'><tr><td width='5%' height='50' rowspan='2' align='center'><img border='0' src='pic/tj.gif'></td><td height='26'>&nbsp;Ŀǰ��̳�ܹ��� <b>"&lineno&"</b> ������ �������� <b>"&usno&"</b> λ��Ա�� <b>"&nusno&"</b> λ�ο͡���������ʾ���߻�Ա��.</td></tr><tr><td height='26'><table width=100% ><tr>"
ni=1
ha=1
set useol=myconn.execute("select*from online where name<>''")
do while not useol.eof
olna=useol("name")
set fa=myconn.execute("select*from user where name='"&olna&"'")
response.write"<td width='18%'><a href='userinfo.asp?name="&kbbs(olna)&"'><img align=middle border=0 src="&fa("toupic")&" width='16' height='16'> "&kbbs(olna)&"</a></td>"
set fa=nothing
ha=ha+1
ni=ni+1
if ha>4 then
ha=1
response.write"</tr>"
end if
if ni>usno then exit do
useol.movenext
Loop
useol.Close
set useol=nothing
set usno=nothing
set lineno=nothing
response.write"</table></td></tr></table><table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' bordercolor='#FFFFFF' width='100%'><tr><td width='180' background='pic/5.gif'><img border='0' src='pic/9.gif' align='absbottom'><font color='#FFFFFF'><b>�� ̳ �� ��</b></font></td><td background='pic/7.gif'><img border='0' src='pic/6.gif'></td> <td width='180' background='pic/5.gif'><img border='0' src='pic/9.gif' align='absbottom'><b><font color='#FFFFFF'>�� ̳ ͼ ��</font></b></td><td background='pic/7.gif'><img border='0' src='pic/6.gif'></td></tr></table>"&_
"<table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse' width='100%' height='40'><tr><td width='50%'><marquee onmouseover=this.stop() onmouseout=this.start() scrollAmount=2  width='100%'>"
set lmbbs=myconn.execute("select*from lmbbs")
do while not lmbbs.eof
response.write"<a target='_blank' href='"&lmbbs("url")&"' title='"&lmbbs("name")&"'><img src="&lmbbs("picurl")&" border=0></a> "
lmbbs.movenext
loop
lmbbs.close
set lmbbs=nothing
response.write"</marquee></td><td width='50%'><img border='0' src='pic/on.gif' align='absmiddle'>������û���� <img src='pic/new.gif' border='0' align='absmiddle'>������������ <img src='pic/rz.gif' align='absmiddle'>��֤��̳</td></tr></table></td></tr></table></center></div><br>"
%><!--#include file="down.asp"-->