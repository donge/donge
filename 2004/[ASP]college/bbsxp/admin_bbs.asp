<!-- #include file="setup.asp" -->
<%
if adminpassword<>session("pass") then response.redirect "admin.asp?menu=login"
id=HTMLEncode(Request("id"))


log(""&Request.ServerVariables("script_name")&"<br>"&Request.ServerVariables("Query_String")&"<br>"&Request.form&"")


%>
<META http-equiv=Content-Type content=text/html;charset=gb2312>
<link href=images/skins/<%=Request.Cookies("skins")%>/bbs.css rel=stylesheet>
<br><center>
<p></p>

<%


select case Request("menu")
case "applymanage"
applymanage

case "activation"
activation

case "bbsmanage"
bbsmanage

case "bbsmanagexiu"
bbsmanagexiu


case "bbsmanagexiuok"
bbsmanagexiuok

case "bbsadd"
bbsadd

case "bbsaddok"
bbsaddok

case "classs"
classs

case "classxiu"
classxiu

case "upclubconfig"
upclubconfig

case "upclubconfigok"
upclubconfigok


case "classdel"
conn.execute("delete from [class] where id="&id&"")
classs

case "classxiuok"
conn.execute("update [class] set classname='"&Request("classname")&"',id="&id&" where id="&Request("oldid")&"")
classs

case "bbsmanagedel"
conn.execute("delete from [bbsconfig] where id="&id&"")
error2("已经将该论坛的所有数据删除了！")

case "delforumok"

if request("jh")="1" then
jh=" and goodtopic<>1"
end if

if request("bbsid")<>"" then
bbsid="and forumid="&request("bbsid")&""
end if
conn.execute("delete from [forum] where lasttime<"&SqlNowString&"-"&request("TimeLimit")&" "&jh&" "&bbsid&"")
error2("已经将"&request("TimeLimit")&"天没有用户回复的主题删除了！")

case "delretopicok"
conn.execute("delete from [reforum] where posttime<"&SqlNowString&"-"&request("TimeLimit")&"")
error2("已经将"&request("TimeLimit")&"天的回帖删除了！")


case "delbbsconfigok"
conn.execute("delete from [bbsconfig] where hide=1 and lasttime<"&SqlNowString&"-"&request("TimeLimit")&"")
error2("已经将"&request("TimeLimit")&"天没有新帖子的论坛删除了！")



case "deltopicok"
if request("topic")="" then
error2("您没有输入字符！")
end if
conn.execute("delete from [forum] where topic like '%"&request("topic")&"%' ")
error2("已经将标题里包含有 "&request("topic")&" 的帖子全部删除了！")


case "uniteok"
if Request("hbbs") = Request("ybbs") then
error2("不能选择相同论坛！")
end if
conn.execute("update [forum] set forumid="&Request("hbbs")&" where forumid="&Request("ybbs")&"")
error2("已经成功将2个论坛的资料合并了！")

case "activationok"
for each ho in request.form("id")
conn.execute("update [forum] set deltopic=0 where id="&ho&"")
next
error2("已经将激活所选帖子！")

end select

sub applymanage
%>
<script>function checkclick(msg){if(confirm(msg)){event.returnValue=true;}else{event.returnValue=false;}}</script>

<table cellspacing="1" cellpadding="2" width="97%" border="0" class="a2" align="center">



  <tr class=a1 id=TableTitleLink>
<td align="center" height="25"><a href="?menu=applymanage&fashion=id">
ID</a></td>
<td width="20%" align="center" height="25">
<a href="?menu=applymanage&fashion=bbsname">论坛</a></td>
<td align=center height="25">版主</td>
<td align=center height="25"><a href="?menu=applymanage&fashion=toltopic">
主题</a></td>
<td align=center height="25"><a href="?menu=applymanage&fashion=tolrestore">
帖子</a></td>

<td align="center" height="25">操作</td>
    
  </tr>


<%

if Request("fashion")=empty then
fashion="tolrestore"
else
fashion=Request("fashion")
end if


sql="select * from bbsconfig order by "&fashion&" Desc"
rs.Open sql,Conn,1

pagesetup=20 '设定每页的显示数量
rs.pagesize=pagesetup
TotalPage=rs.pagecount  '总页数
PageCount = cint(Request.QueryString("ToPage"))
if PageCount <1 then PageCount = 1
if PageCount > TotalPage then PageCount = TotalPage
if TotalPage>0 then rs.absolutepage=PageCount '跳转到指定页数
i=0
Do While Not RS.EOF and i<pagesetup
i=i+1

%>
  <tr class=a3>
<td align="center" height="25"><%=rs("id")%></td>
<td><a target=_blank href=ShowForum.htm?forumid=<%=rs("id")%>><%=rs("bbsname")%></a></td>
<td align=center><%=rs("moderated")%></td>
<td align=center><b><font color=red><%=rs("toltopic")%></font></b></td>
<td align=center><b><font color=red><%=rs("tolrestore")%></font></b></td>

<td align="center"><a href=?menu=bbsmanagexiu&id=<%=rs("id")%>>编辑论坛</a> | <a onclick=checkclick('您确定要删除该论坛的所有资料?') href=?menu=bbsmanagedel&id=<%=rs("id")%>>删除论坛</a>
　</td>
    
  </tr>
<%
RS.MoveNext
loop
RS.Close

%>
</table>

[<b>
<script>
PageCount=<%=TotalPage%> //总页数
topage=<%=PageCount%>   //当前停留页
for (var i=1; i <= PageCount; i++) {
if (i <= topage+3 && i >= topage-3 || i==1 || i==PageCount){
if (i > topage+4 || i < topage-2 && i!=1 && i!=2 ){document.write(" ... ");}
if (topage==i){document.write(" "+ i +" ");}
else{
document.write("<a href=?menu=applymanage&fashion=<%=Request("fashion")%>&topage="+i+">"+ i +"</a> ");
}
}
}
</script>

</b>]
<%

end sub


sub classs
%>
<script>function checkclick(msg){if(confirm(msg)){event.returnValue=true;}else{event.returnValue=false;}}</script>
<table border="0" width="80%">
	<tr>
		<td align="center">
<form name="form" method="post" action="?menu=bbsaddok"><input type=hidden name=classid value=0>
类别名称：（例如：电脑网络）<input name="bbsname"><input type="submit" value="建立"></form>
</td>
		<td align="center"><form method="post" action="?menu=bbsmanagexiu">
查找论坛：<INPUT size=2 name=id value="ID" onfocus="this.value = ''" >
<input type=submit value="确定"></form></td>
	</tr>
</table>







<table cellspacing=1 cellpadding="2" width="80%" border="0" class="a2" align="center">


		<%
		sort(0)

		%>
		

</table>







<%


end sub

sub bbsadd

%>


<table cellspacing="1" cellpadding="2" width="80%" border="0" class="a2" align="center">
  <tr height=25>
    <td class=a1 align=middle colspan="2">建立论坛资料</td>
  </tr>
   <tr height=25>
    <td class=a3 align=middle>

<form name="form" method="post" action="?menu=bbsaddok">
<input type=hidden name=classid value=<%=id%>>

论坛名称</td>
    <td class=a3>

<input size="20" name="bbsname"></td></tr>
   <tr height=25>
    <td class=a3 align=middle>

论坛版主</td>
    <td class=a3>

<input size="30" name=moderated> 多版主添加请用|分隔，如：yuzi|裕裕
</td></tr>
   <tr height=25>
    <td class=a3 align=middle>

论坛介绍</td>
    <td class=a3>

<textarea rows="5" name="intro" cols="50"></textarea></td></tr>
   <tr height=25>
    <td class=a3 align=middle>

论坛状态</td>
    <td class=a3>

<select size="1" name="pass">
<option value=0>关闭论坛</option>
<option value=1 selected>正规论坛</option>
<option value=2>会员论坛</option>
<option value=3>嘉宾论坛</option>
</select>
</td></tr>
   <tr height=25>
    <td class=a3 align=middle>

小图标URL</td>
    <td class=a3>

<input size="30" name="icon"> 显示在社区首页论坛介绍右边
</td></tr>
   <tr height=25>
    <td class=a3 align=middle>

大图标URL</td>
    <td class=a3>

<input size="30" name="logo"> 显示在论坛左上角
</td></tr>
   <tr height=25>
    <td class=a3 align=middle>

论坛密码</td>
    <td class=a3>

<input size="30" name="password"> 如果是公开论坛，此处请留空</td></tr>
   <tr height=25>
    <td class=a3 align=middle>

是否显示在论坛列表　　　　　　　　　　　　</td>
    <td class=a3>

<input type="radio" CHECKED value="0" name="hide" id=hide1><label for=hide1>显示</label>
 
<input type="radio" value="1" name="hide" id=hide2><label for=hide2>隐藏</label> 　</td></tr>
   <tr height=25>
    <td class=a3 align=middle colspan="2">

　 <input type="submit" value=" 建 立 " name="Submit"><br></td></tr></table>
</form>
<center><br><a href=javascript:history.back()>< 返 回 ></a>


<%
end sub
sub bbsaddok
if Request("bbsname")="" then error2("请输入论坛名称")



master=split(Request("moderated"),"|")
for i = 0 to ubound(master)
If conn.Execute("Select id From [user] where username='"&HTMLEncode(master(i))&"'" ).eof and master(i)<>"" Then error2(""&master(i)&"的用户资料还未注册")
next



rs.Open "bbsconfig",Conn,1,3
rs.addnew
rs("followid")=Request("classid")
rs("bbsname")=HTMLEncode(Request("bbsname"))
rs("moderated")=Request("moderated")
rs("pass")=Request("pass")
rs("password")=Request("password")
rs("intro")=HTMLEncode(Request("intro"))
rs("icon")=HTMLEncode(Request("icon"))
rs("logo")=HTMLEncode(Request("logo"))
rs.update
id=rs("id")

rs.close

classs

end sub




sub bbsmanagexiuok

if Request("bbsname")="" then error2("请输入论坛名称")



master=split(Request("moderated"),"|")
for i = 0 to ubound(master)
If conn.Execute("Select id From [user] where username='"&HTMLEncode(master(i))&"'" ).eof and master(i)<>"" Then error2(""&master(i)&"的用户资料还未注册")
next


sql="select * from bbsconfig where id="&id&""
rs.Open sql,Conn,1,3


rs("followid")=Request("classid")
rs("SortNum")=int(Request("SortNum"))
rs("bbsname")=HTMLEncode(Request("bbsname"))
rs("moderated")=Request("moderated")
rs("pass")=Request("pass")
rs("password")=Request("password")
rs("intro")=HTMLEncode(Request("intro"))
rs("icon")=HTMLEncode(Request("icon"))
rs("logo")=HTMLEncode(Request("logo"))
rs("hide")=Request("hide")
rs.update

rs.close
%>
编辑成功<br><br><a href=javascript:history.back()>返 回</a>
<%
end sub


sub bbsmanagexiu

sql="select * from bbsconfig where id="&id&""
rs.Open sql,Conn
%>


<form method="post" action="?menu=bbsmanagexiuok" name=form><input type=hidden name=id value=<%=rs("id")%>>
<table cellspacing="1" cellpadding="2" width="80%" border="0" class="a2" align="center">
  <tr height=25>
    <td class=a1 align=middle colspan="2">编辑论坛资料</td>
  </tr>
   <tr height=25>
    <td class=a3 align=middle>

论坛名称</td>
    <td class=a3>


<input size="15" name="bbsname" value="<%=rs("bbsname")%>"> &nbsp; 排序 <input size="2" name="SortNum" value="<%=rs("SortNum")%>">
从小到大排序</td></tr>
   <tr height=25>
    <td class=a3 align=middle>

论坛类别</td>
    <td class=a3>


<select name="classid">
<option value="<%=rs("followid")%>">默认</option>
<option value="0">一级分类</option>
<%BBSList(0)%>
</select> 一级分类将当作类别名称</td></tr>
   <tr height=25>
    <td class=a3 align=middle>


论坛版主</td>
    <td class=a3>


<input size="30" name=moderated value="<%=rs("moderated")%>"> 多版主添加请用“|”分隔，如：yuzi|裕裕
</td></tr>
   <tr height=25>
    <td class=a3 align=middle>


论坛介绍</td>
    <td class=a3>


<textarea rows="5" name="intro" cols="50"><%=rs("intro")%></textarea></td></tr>
   <tr height=25>
    <td class=a3 align=middle>


论坛状态</td>
    <td class=a3>


<select size="1" name="pass">
<option value=0 <%if rs("pass")=0 then%>selected<%end if%>>关闭论坛</option>
<option value=1 <%if rs("pass")=1 or ""&rs("pass")&""="" then%>selected<%end if%>>正规论坛</option>
<option value=2 <%if rs("pass")=2 then%>selected<%end if%>>会员论坛</option>
<option value=3 <%if rs("pass")=3 then%>selected<%end if%>>嘉宾论坛</option>
</select>
</td></tr>
   <tr height=25>
    <td class=a3 align=middle>


小图标URL</td>
    <td class=a3>


<input size="30" name="icon" value="<%=rs("icon")%>"> 显示在社区首页论坛介绍右边
</td></tr>
   <tr height=25>
    <td class=a3 align=middle>


大图标URL</td>
    <td class=a3>


<input size="30" name="logo" value="<%=rs("logo")%>"> 显示在论坛左上角</td></tr>



   <tr height=25>
    <td class=a3 align=middle>

论坛密码</td>
    <td class=a3>

<input size="30" name="password" value="<%=rs("password")%>"> 如果是公开论坛，此处请留空</td></tr>

   <tr height=25>
    <td class=a3 align=middle>


是否显示在论坛列表</td>
    <td class=a3>


<input type="radio" <%if rs("hide")=0 then%>CHECKED <%end if%>value="0" name="hide" value="0" id=hide1><label for=hide1>显示</label> 
<input type="radio" <%if rs("hide")=1 then%>CHECKED <%end if%>value="1" name="hide" value="1" id=hide2><label for=hide2>隐藏</label> </td></tr>
   <tr height=25>
    <td class=a3 align=middle colspan="2">


<input type="submit" value=" 编 辑 " name="Submit1"></td></tr></table><br></form>
<center><br><a href=javascript:history.back()>< 返 回 ></a>
<Script>
document.form.intro.value = unybbcode(document.form.intro.value);
function unybbcode(temp) {
temp = temp.replace(/<br>/ig,"\n");
return (temp);
}
</Script>
<%
end sub



sub bbsmanage

%>

论坛数：<b><font color=red><%=conn.execute("Select count(id)from bbsconfig")(0)%></font></b>　　主题数：<b><font color=red><%=conn.execute("Select count(id)from forum")(0)%></font></b>　　回帖数：<b><font color=red><%=conn.execute("Select count(id)from reforum")(0)%></font></b><br>

<form method="post" action="?menu=delforumok">

<table cellspacing="1" cellpadding="2" width="70%" border="0" class="a2" align="center">
  <tr height=25>
    <td class=a1 align=middle>批量删除主题</td>
  </tr>
   <tr height=25>
    <td class=a3 align=middle>
    
删除 <select name=TimeLimit>
<option value="90">90</option>
<option value="180" selected>180</option>
<option value="360">360</option>
</select> 天没有用户回复的主题　<input type="checkbox" value="1" name="jh" id=jh checked><label for="jh">精华帖子除外</label>
<br>
<select name="bbsid">
<option value="">所有论坛</option>

<%
BBSList(0)
%>

</select>
 <input type="submit" value=" 确 定 ">
 


</td></form></tr>
   <tr height=25>
    <td class=a4 align=middle>
    <form method="post" action="?menu=deltopicok">
删除标题里包含有 <input size="20" name="topic"> 的所有帖子 <input type="submit" value="确定">

　</td></tr></table></form>



<form method="post" action="?menu=delretopicok">
<table cellspacing="1" cellpadding="2" width="70%" border="0" class="a2" align="center">
  <tr height=25>
    <td class=a1 align=middle colspan=2>批量删除回帖</td>
  </tr>
   <tr height=25>
    <td class=a3 align=middle colspan=2>


删除 <select name=TimeLimit>
<option value="90">90</option>
<option value="180" selected>180</option>
<option value="360">360</option>
</select> 天以前的回帖  <input type="submit" value=" 确 定 ">
</td></tr></table></form>


<form method="post" action="?menu=delbbsconfigok">
<table cellspacing="1" cellpadding="2" width="70%" border="0" class="a2" align="center">
  <tr height=25>
    <td class=a1 align=middle colspan=2>批量删除论坛</td>
  </tr>
   <tr height=25>
    <td class=a3 align=middle colspan=2>
删除 <select name=TimeLimit>
<option value="30">30</option>
<option value="60" selected>60</option>
<option value="90">90</option>
</select> 天没有新帖子的论坛<br><input type="submit" value=" 确 定 ">
</td></tr></table></form>



<form method="post" action="?menu=uniteok">
<table cellspacing="1" cellpadding="2" width="70%" border="0" class="a2" align="center">
  <tr height=25>
    <td class=a1 align=middle colspan=2>合并论坛帖子</td>
  </tr>
   <tr height=25>
    <td class=a3 align=middle colspan=2>

将 <select name="ybbs">
<%
BBSList(0)
%></select> 合并到 <select name="hbbs">
<%
BBSList(0)
%></select>
<br>
<INPUT type=submit value=" 确 定 " name=submit>
</td></tr></table></form>






<%
end sub

sub upclubconfig
%>

<table cellspacing="1" cellpadding="2" width="70%" border="0" class="a2" align="center">
  <tr height=25>
    <td class=a1 align=middle colspan=2>社区资料更新</td>
  </tr>
   <tr height=25>
    <td class=a3 align=middle colspan=2>
    
此操作将更新论坛资料，修复论坛统计的信息<br>
<a href="?menu=upclubconfigok">点击这里更新论坛统计数据</a><br>
</td></tr></table><br>

<%
end sub

sub upclubconfigok

Application(CacheName&"CountForum")=conn.execute("Select count(id)from [forum]")(0)
Application(CacheName&"CountReforum")=conn.execute("Select count(id)from [Reforum]")(0)
Application(CacheName&"CountUser")=conn.execute("Select count(id)from [user]")(0)

rs.Open "bbsconfig",Conn
do while not rs.eof

allarticle=conn.execute("Select count(forumid) from forum where forumid="&rs("id")&"")(0)
if allarticle>0 then
allrearticle=conn.execute("Select sum(replies) from forum where forumid="&rs("id")&"")(0)
else
allrearticle=0
end if

conn.execute("update [bbsconfig] set toltopic="&allarticle&",tolrestore="&allarticle+allrearticle&" where ID="&rs("id")&"")


rs.movenext
loop
rs.close

%>
操作成功！<br>
<br>
已经更新社区所有论坛的统计数据<br>

<%
end sub

htmlend

sub activation
%>
<script>
function CheckAll(form){for (var i=0;i<form.elements.length;i++){var e = form.elements[i];if (e.name != 'chkall')e.checked = form.chkall.checked;}}
</script>
  <form method="POST" action=?menu=activationok>

<TABLE cellSpacing=1 cellPadding=1 width=97% align=center border=0 class=a2>
<TR height=25 class=a1>
		<td align="center">激活</td>
		<td align="center">主题</td>
		<td align="center">作者</td>
		<td align="center">发表时间</td></tr>
<%
sql="select * from forum where deltopic=1 order by id Desc"
rs.Open sql,Conn,1

pagesetup=20 '设定每页的显示数量
rs.pagesize=pagesetup
TotalPage=rs.pagecount  '总页数
PageCount = cint(Request.QueryString("ToPage"))
if PageCount <1 then PageCount = 1
if PageCount > TotalPage then PageCount = TotalPage
if TotalPage>0 then rs.absolutepage=PageCount '跳转到指定页数
i=0
Do While Not RS.EOF and i<pagesetup
i=i+1

%>
<TR height=25>

      <TD align=middle width="6%" class=a3>
<INPUT type=checkbox value=<%=rs("id")%> name=id></TD>
      <TD width="60%" align=left class=a4>&nbsp;<img border=0 src=images/brow/<%=rs("icon")%>.gif> <a target=_blank href=ShowPost.htm?id=<%=rs("id")%>><%=rs("topic")%></a></TD>
      <TD align=middle width=9% class=a3><a href=Profile.asp?username=<%=rs("username")%>><%=rs("username")%>　</TD>

      <TD align=center width=30% class=a4>&nbsp;<%=rs("posttime")%></TD>
    </TR>

<%

RS.MoveNext
loop
RS.Close


%>


<TR height=25>

      <TD width="6%" class=a3 align="center"><input type=checkbox name=chkall onclick=CheckAll(this.form) value="ON"></TD>

      <TD width="60%" class=a3>		
<b>&nbsp;共有
<font color="990000"><%=TotalPage%></font> 页 [
<script>
PageCount=<%=TotalPage%> //总页数
topage=<%=PageCount%>   //当前停留页
for (var i=1; i <= PageCount; i++) {
if (i <= topage+3 && i >= topage-3 || i==1 || i==PageCount){
if (i > topage+4 || i < topage-2 && i!=1 && i!=2 ){document.write(" ... ");}
if (topage==i){document.write(" "+ i +" ");}
else{
document.write("<a href=?menu=activation&topage="+i+">"+ i +"</a> ");
}
}
}
</script>]</b>
		
</TD>

      <TD width="48%" class=a3 colspan="2" align="center">
		
		
<input type=submit onclick="{if(confirm('您确定要激活所选的主题?')){return true;}return false;}" value=" 激 活 "></TD>
    </TR>
    


</table><%
end sub

dim ii
ii=0
sub sort(selec)
	sql="Select * From bbsconfig where followid="&selec&" and hide=0 order by SortNum"
	Set Rs1=Conn.Execute(sql)


	do while not rs1.eof

if selec=0 then
%>
  <tr class=a1 id=TableTitleLink height=25>
<td>　<a target=_blank href=ShowForum.htm?forumid=<%=rs1("id")%>><%=rs1("bbsname")%></a></td>

<td align="right" width="190">
<a href=?menu=bbsadd&id=<%=rs1("id")%>>建立论坛</a> | <a href=?menu=bbsmanagexiu&id=<%=rs1("id")%>>编辑论坛</a> | 
<a onclick=checkclick('您确定要删除该论坛的所有资料?') href=?menu=bbsmanagedel&id=<%=rs1("id")%>>删除论坛</a>

　</td>
    
  </tr>

<%
else
%>


  <tr class=a3 height=25>
<td>　<%=string(ii*2,"　")%><a target=_blank href=ShowForum.htm?forumid=<%=rs1("id")%>><%=rs1("bbsname")%></a></td>

<td align="right">
<a href=?menu=bbsadd&id=<%=rs1("id")%>>建立论坛</a> | <a href=?menu=bbsmanagexiu&id=<%=rs1("id")%>>编辑论坛</a> | 
<a onclick=checkclick('您确定要删除该论坛的所有资料?') href=?menu=bbsmanagedel&id=<%=rs1("id")%>>删除论坛</a>

　</td>
    
  </tr>
  	
</p>

  	
<%
end if
ii=ii+1
	sort rs1("id")
ii=ii-1
	rs1.movenext
	loop
	Set Rs1 = Nothing
end sub


%>