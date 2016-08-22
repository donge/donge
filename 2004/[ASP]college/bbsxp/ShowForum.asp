<!-- #include file="setup.asp" -->
<%

forumid=int(Request("forumid"))
sql="select * from bbsconfig where id="&forumid&""
Set Rs=Conn.Execute(sql)
bbsname=rs("bbsname")
moderated=rs("moderated")
logo=rs("logo")
pass=rs("pass")
followid=rs("followid")
password=rs("password")
hide=rs("hide")
rs.close

top
''''''''''论坛规定验证'''''''
if pass="0" then
error("<li>本论坛暂时关闭，不再接受访问！")
elseif pass="2" then
if Request.Cookies("username")=empty then error("<li>只有<a href=login.asp>登录</a>后才能浏览论坛")
elseif pass="3" then
if Request.Cookies("username")=empty then error("<li>只有<a href=login.asp>登录</a>后才能浏览论坛")
if membercode<2 and instr("|"&moderated&"|","|"&Request.Cookies("username")&"|")<=0 then error("<li>只有特邀嘉宾以上等级才能浏览论坛")
end if
if password<>Request.Cookies("password") and password<>empty then response.redirect "login.asp?menu=password&forumid="&forumid&""
'''''''''''''''''''''''''''''
acturl="ShowForum.asp?forumid="&forumid&""
%>

<head>
<meta http-equiv=refresh content=300>
<script>
if(top==self)document.location="ShowForum.htm"+document.location.search.substring()+"";
var key_word="<%=Request.Cookies("key_word")%>"
var cookieusername="<%=Request.Cookies("username")%>"
</script>

<title><%=bbsname%></title>


<table width="97%" align="center" border="0"><tr><td>
<SCRIPT>if ("<%=logo%>"!=''){document.write("<img border=0 src=<%=logo%> onload='javascript:if(this.height>60)this.height=60;'")}else{document.write("<img border=0 src=images/logo.gif>")}</SCRIPT>
</td>
<td align=right><%=banner%></td>
</tr></table>
	<br>
	<table border="0" width="97%" align="center" cellspacing="1" cellpadding="4" class=a2>
		<tr class=a3>
			<td><table border="0" width="100%" cellspacing="0" cellpadding="0">
				<tr>
					<td>&nbsp;<img src=images/Forum_nav.gif>&nbsp; <a href=main.asp><%=clubname%></a> → <%ForumTree(followid)%><%=ForumTreeList%> <a href=ShowForum.asp?forumid=<%=forumid%>><%=bbsname%></a></td>
					<td align="right"><img src="images/jt.gif"> <a href="apply.asp">申请论坛</a>
	<img src="images/jt.gif"> <a href="supervise.asp?forumid=<%=forumid%>">论坛管理</a>　</td>
				</tr>
			</table>
			</td>
		</tr>
	</table><br>
	

<%
sql="Select * From bbsconfig where followid="&forumid&" and hide=0 order by SortNum"
Set Rs1=Conn.Execute(sql)
if not Rs1.eof then
Response.write "<SCRIPT>valigntop()</SCRIPT><table cellspacing=1 cellpadding=4 width=97% align=center border=0 class=a2>"
do while not rs1.eof
if ""&Rs1("password")&""="" then:password=0:else:password=1:end if
%><script>ShowList("<%=Rs1("pass")%>","<%=Rs1("id")%>","<%=Rs1("bbsname")%>","<%=Rs1("icon")%>","<%=Rs1("intro")%>","<%=Rs1("moderated")%>","<%=Rs1("today")%>","<%=Rs1("toltopic")%>","<%=Rs1("tolrestore")%>","<%=Rs1("lasttime")%>","<%=Rs1("lastname")%>","<%=Rs1("lasttopic")%>","<%=password%>");</script>
<%
rs1.movenext
loop
Response.write "</table><SCRIPT>valignbottom()</SCRIPT><br>"
Set Rs1 = Nothing


else
%>
<!-- #include file="inc/line.asp" -->
<%
forumidonline=conn.execute("Select count(sessionid)from online where forumid="&forumid&"")(0)
regforumidonline=conn.execute("Select count(sessionid)from online where forumid="&forumid&" and username<>''")(0)
%><table cellspacing="1" cellpadding="0" width="97%" align="center" border="0" class="a2"><tr><td width="93%" height="25" class="a1">　<img loaded="no" src="images/plus.gif" id="followImg0" style="cursor:hand;" onclick="loadThreadFollow(0,<%=forumid%>)"> 目前论坛总在线 <b><%=onlinemany%></b> 人，本分论坛共有 <b><%=forumidonline%></b> 人在线。其中注册用户 <b><%=regforumidonline%></b> 人，访客 <b><%=forumidonline-regforumidonline%></b> 人。</td><td align="middle" width="7%" height="25" class="a1"><a href="javascript:this.location.reload()"><img src="images/refresh.gif" border="0"></a></td></tr><tr height="25" style="display:none" id="follow0"><td id="followTd0" align="left" class="a4" width="94%" colspan="5"><div onclick="loadThreadFollow(0,<%=forumid%>)"><table width="100%" cellpadding="10"><tr><td width="100%">Loading...</td></tr></table></div></td></tr></tr></table></td></tr></table>
<br>
<%

if request("order")<>"" then
order=HTMLEncode(Request("order"))
else
order="lasttime"
end if


if request("TimeLimit")<>"" then TimeLimit="and lasttime>"&SqlNowString&"-"&int(request("TimeLimit"))&""



if Request("search")="goodtopic" then search="and goodtopic=1 "



if Request.Cookies("pagesetup")=empty then
pagesetup=20   '设定每页的显示数量
else
pagesetup=int(Request.Cookies("pagesetup"))
if pagesetup > 30 then pagesetup=20
end if


topsql="where deltopic<>1 and forumid="&forumid&" "&search&" "&TimeLimit&" or toptopic=2"

count=conn.execute("Select count(id) from [forum] "&topsql&"")(0)
TotalPage=cint(count/pagesetup)  '总页数
if TotalPage < count/pagesetup then TotalPage=TotalPage+1
PageCount = cint(Request.QueryString("ToPage"))
if PageCount < 1 then PageCount = 1
if PageCount > TotalPage then PageCount = TotalPage

sql="select * from [forum] "&topsql&" order by toptopic Desc,"&order&" Desc"
rs.Open sql,Conn,1
rs.pagesize=pagesetup   '每页显示条数
if TotalPage>0 then rs.absolutepage=PageCount '跳转到指定页数
%>






<table height="30" cellspacing="0" cellpadding="0" width="97%" align="center" border="0"><tr><td align="left" width="20%"><a href="newtopic.asp?forumid=<%=forumid%>"><img src="images/skins/<%=Request.Cookies("skins")%>/post.gif" border="0" alt="发表文章"></a></td><td align="right" width="80%"><img src="images/jt.gif"> 论题数:<%=Count%>　<img src="images/jt.gif"> <a href="ShowForum.asp?forumid=<%=forumid%>&search=goodtopic">论坛精华</a>　<img src="images/team.gif"> 
<select onchange="if(this.options[this.selectedIndex].value!=''){location=this.options[this.selectedIndex].value;}"><option>论坛版主</option><option>-------</option>
<SCRIPT>
var moderated="<%=moderated%>"
var list= moderated.split ('|'); 
for(i=0;i<list.length;i=i+1) {
if (list[i] !=""){document.write("<option value=profile.asp?username="+list[i]+">"+list[i]+"</option>")}
}
</SCRIPT>
</select>
</td></tr></table><table height="28" cellspacing="1" cellpadding="1" width="97%" align="center" border="0"><tr><td align="middle" width="3%"><img height="18" src="images/announce.gif" width="18" align="middle" alt="社区公告"></td><td width="75%"><marquee onmouseover="this.stop()" onmouseout="this.start()" width="80%" scrollamount="3"><a style=cursor:hand onclick="javascript:open('affiche.asp','','width=400,height=180,resizable,scrollbars')"><%=affichetitle%></a>　［<%=affichetime%>］</marquee></td><td width="22%" align="right"><select onchange="if(this.options[this.selectedIndex].value!=''){location=this.options[this.selectedIndex].value;}"><option value="?forumid=<%=forumid%>">
查看所有的主题</option><option value="?forumid=<%=forumid%>&TimeLimit=1">
查看一天内的主题</option><option value="?forumid=<%=forumid%>&TimeLimit=2">
查看两天内的主题</option><option value="?forumid=<%=forumid%>&TimeLimit=7">
查看一星期内的主题</option><option value="?forumid=<%=forumid%>&TimeLimit=15">
查看半个月内的主题</option><option value="?forumid=<%=forumid%>&TimeLimit=30">
查看一个月内的主题</option><option value="?forumid=<%=forumid%>&TimeLimit=60">
查看两个月内的主题</option><option value="?forumid=<%=forumid%>&TimeLimit=180">
查看半年内的主题</option></select></td></tr></table>


<SCRIPT>valigntop()</SCRIPT>
<table cellspacing="1" cellpadding="0" width="97%" align="center" border="0" class="a2"><tr height="25" id=TableTitleLink><td width="3%" class="a1">　</td><td width="3%" class="a1">　</td><td align="middle" height="24" class="a1" width="45%"><a href="ShowForum.asp?forumid=<%=forumid%>&order=topic&search=<%=Request("search")%>&TimeLimit=<%=Request("TimeLimit")%>">主题</a></td><td align="middle" width="9%" height="24" class="a1"><a href="ShowForum.asp?forumid=<%=forumid%>&order=username&search=<%=Request("search")%>&TimeLimit=<%=Request("TimeLimit")%>">作者</a></font></td><td align="middle" width="6%" height="24" class="a1"><a href="ShowForum.asp?forumid=<%=forumid%>&order=replies&search=<%=Request("search")%>&TimeLimit=<%=Request("TimeLimit")%>">回复</a></td><td align="middle" width="7%" height="24" class="a1"><a href="ShowForum.asp?forumid=<%=forumid%>&order=Views&search=<%=Request("search")%>&TimeLimit=<%=Request("TimeLimit")%>">点击</a></td><td width="27%" height="24" class="a1" align="center"><a href="ShowForum.asp?forumid=<%=forumid%>&search=<%=Request("search")%>&TimeLimit=<%=Request("TimeLimit")%>">最后更新</a></td></tr>
<%
i=0
Do While Not RS.EOF and i<pagesetup
i=i+1
if Not Response.IsClientConnected then responseend

newtopic=""
if rs("posttime")+1>now() then newtopic="<img src=images/new.gif>"

%><script>ShowForum("<%=rs("ID")%>","<%=rs("topic")%>","<%=newtopic%>","<%=rs("username")%>","<%=rs("Views")%>","<%=rs("icon")%>","<%=rs("toptopic")%>","<%=rs("locktopic")%>","<%=rs("pollresult")%>","<%=rs("goodtopic")%>","<%=rs("replies")%>","<%=rs("lastname")%>","<%=rs("lasttime")%>");</script>
<%
RS.MoveNext
loop
RS.Close
%></table>
<SCRIPT>valignbottom()</SCRIPT>
<table cellspacing="1" cellpadding="1" width="97%" align="center" border="0"><tr height="25"><td width="100%" height="2"><table cellspacing="0" cellpadding="3" width="100%" border="0"><tr><td height="2">
		<b>本论坛共有 <font color=990000><%=TotalPage%></font> 页 [ 


<b>
<script>
PageCount=<%=TotalPage%>
topage=<%=PageCount%>
for (var i=1; i <= PageCount; i++) {
if (i <= topage+3 && i >= topage-3 || i==1 || i==PageCount){
if (i > topage+4 || i < topage-2 && i!=1 && i!=2 ){document.write(" ... ");}
if (topage==i){document.write(" "+ i +" ");}
else{
document.write("<a href=?topage="+i+"&forumid=<%=forumid%>&order=<%=Request("order")%>&search=<%=Request("search")%>&TimeLimit=<%=Request("TimeLimit")%>>"+ i +"</a> ");
}
}
}
</script>

</b>]

</b></td><form name="form" action="searchok.asp?forumid=<%=forumid%>&search=key&searchxm2=topic" method="post"><td height="2" align="right">快速搜索：<input name="content" value="输入关键字" onfocus="this.value = &quot;&quot;;" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px" size="20"> <input type="submit" value="搜索" name="submit" style="font-family: Tahoma,Verdana,宋体; font-size: 12px; line-height: 15px"> </td></form></tr></table></td></tr></table><br><center><table cellspacing="4" cellpadding="0" width="80%" border="0"><tr><td nowrap width="200"><img alt="" src="images/f_new.gif" border="0"> 打开主题 (有回复的主题)</td><td nowrap width="100"><img alt="" src="images/f_hot.gif" border="0"> 热门主题 </td><td nowrap width="100"><img alt="" src="images/f_locked.gif" border="0"> 关闭主题</td><td nowrap width="150"><img src="images/topicgood.gif"> 精华主题</td></tr><tr><td nowrap width="200"><img alt="" src="images/f_norm.gif" border="0"> 打开主题 (没有回复的主题)</td><td nowrap width="100"><img alt="" src="images/f_poll.gif" border="0"> 投票主题</td><td nowrap width="100"><img alt="" src="images/f_top.gif" border="0"> 置顶主题</td><td nowrap width="150"><img src="images/my.gif"> 自己发表的主题</td></tr></table></center></div></td></tr></table>

<%
end if

htmlend

%>