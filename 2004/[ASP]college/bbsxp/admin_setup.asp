<!-- #include file="setup.asp" -->
<%
if adminpassword<>session("pass") then response.redirect "admin.asp?menu=login"
id=int(Request("id"))

log(""&Request.ServerVariables("script_name")&"<br>"&Request.ServerVariables("Query_String")&"<br>"&Request.form&"")


%>

<head>
<META http-equiv=Content-Type content=text/html;charset=gb2312>
<link href=images/skins/<%=Request.Cookies("skins")%>/bbs.css rel=stylesheet>
<style>
<!--
.tableBorder {
	BORDER-RIGHT: #183789 1px solid; BORDER-TOP: #183789 1px solid; BORDER-LEFT: #183789 1px solid; WIDTH: 98%; BORDER-BOTTOM: #183789 1px solid; BACKGROUND-COLOR: #ffffff
}
TD {
	FONT-SIZE: 12px
}
TD.forumRowHighlight {
	PADDING-RIGHT: 3px; PADDING-LEFT: 3px; BACKGROUND: #E4EDF9; PADDING-BOTTOM: 3px; PADDING-TOP: 3px
}
-->
</style>
</head>

<br><center>
<p></p>

<%

select case Request("menu")
case "banner"
showbanner
case "bannerok"
rs.Open "clubconfig",Conn,1,3
rs("banner")=Request("banner")
rs("adcode")=Request("adcode")
rs.update
rs.close
%>
更新成功<br><br><a href=javascript:history.back()>返 回</a>
<%



case "link"
link

case "linkok"
linkok

case "dellink"
conn.execute("delete from [link] where id="&id&"")
link



case "variable"
variable
case "variableok"
variableok
end select


sub link





%>

<FORM action=?menu=linkok method=post>
<table cellspacing="1" cellpadding="5" width="97%" border="0" class="a2" align="center"><tr>
	<td height="7" class="a1" colspan="2">　■<b> </b>友情链接管理</td></tr><tr>
	<td height="6" class="a3">论坛名称：<INPUT size=40 name=name></td>
	<td height="6" class="a3">地址URL：<INPUT size=40 name=url value="http://"></td></tr><tr>
	<td height="6" class="a3">论坛简介：<INPUT size=40 name=intro></td>
	<td height="6" class="a3">图标URL：<INPUT size=40 name=logo value="http://"></td></tr><tr>
	<td height="6" class="a4" colspan="2" align="center"><INPUT type=submit value=" 添 加 " name=Submit>
<input type="reset" value=" 重 填 " name="Submit2">

</td></tr></table>
</FORM>

<table cellspacing="1" cellpadding="5" width="97%" border="0" class="a2" align="center"><tr><td height="25" colspan="2" class="a1">　■<b> </b>友情链接</td></tr><tr>
<td align="center" bgcolor=FFFFFF width="5%"><img src="images/shareforum.gif"></td>
<td class="a4"><%
rs.Open "link",Conn
do while not rs.eof
if rs("logo")="" or rs("logo")="http://" then
link1=link1+"<a title='"&rs("intro")&"' href="&rs("url")&" target=_blank>"&rs("name")&"</a><a href=?menu=dellink&id="&rs("id")&"><font color=red>（删除）</font></a>　　"
else
link2=link2+"<a title='"&rs("name")&""&chr(10)&""&rs("intro")&"' href="&rs("url")&" target=_blank><img src="&rs("logo")&" border=0 width=88 height=31></a><a href=?menu=dellink&id="&rs("id")&"><font color=red>（删除）</font></a>　　"
end if
rs.movenext
loop
rs.close
%>
<%=link1%>
<table cellspacing=0 width=100% align=center class=a2><tr><td></td></tr></table>
<%=link2%>
</td></tr></table>


<%




end sub

sub linkok

if Request("url")="http://" or Request("url")="" then
error2("论坛URL没有填写")
end if
conn.Execute("insert into link(name,logo,url,intro) values ('"&Request("name")&"','"&Request("logo")&"','"&Request("url")&"','"&Request("intro")&"')")
link
end sub




sub variable
if ""&cluburl&""=empty then cluburl="http://"&Request.ServerVariables("server_name")&""&replace(Request.ServerVariables("script_name"),"admin_setup.asp","")&""
%>

<form method="post" action="?menu=variableok">
<table cellspacing="1" cellpadding="2" width="97%" border="0" class="a2" align="center">
  <tr height=25>
    <td class=a1 align=middle colspan=2>基本信息</td>
  </tr>


<tr class=a3>
<td width="50%">社区名称：</td>
<td><input size="30" name="clubname" value="<%=clubname%>"></td>
</tr>
<tr class=a4>
<td>社区URL：<br>例如： <font color="FF0000">http://<%=Request.ServerVariables("server_name")%><%=replace(Request.ServerVariables("script_name"),"admin_setup.asp","")%></font></td>
<td><input size="30" name="cluburl" value="<%=cluburl%>"></td>
</tr>
<tr class=a3>
<td>主页名称：</td>
<td><input size="30" name="homename" value="<%=homename%>"></td>
</tr>
<tr class=a4>
<td>主页地址：</td>
<td><input size="30" value="<%=homeurl%>" name="homeurl"></td>
</tr>

</table>



<br>
<table cellspacing="1" cellpadding="2" width="97%" border="0" class="a2" align="center">
  <tr height=25>
    <td class=a1 align=middle colspan=2>信息设置</td>
  </tr>
  
  <tr class=a4>
<td width="50%">首页显示论坛深度：</td>
<td>
<input size="4" value="<%=floor%>" name="floor"> 级&nbsp; [默认:2]</tr>

	</tr>
  
  <tr class=a3>
<td>用户坐牢时间：（在设定的天数之后会自动释放）</td>
<td><input size="4" value="<%=prison%>" name="prison"> 天&nbsp; [默认:15]</td>
</tr>

  <tr class=a4>
<td>脚本超时时间：</td>
<td><input size="4" value="<%=Timeout%>" name="Timeout"> 秒&nbsp; [默认:60]</td>
</tr>
  
  <tr class=a3>
<td width="50%">统计用户在线时间：</td>
<td><input size="4" value="<%=OnlineTime%>" name="OnlineTime"> 秒&nbsp; [默认:1200]</td>
	</tr>
  
  <tr class=a4>
<td>过滤敏感字（多字请用“|”分隔）：<br>例如： <font color="FF0000">fuck|shit|你妈</font></td>
<td><input size="30" value="<%=badwords%>" name="badwords"></td>
</tr>

  <tr class=a3>
<td>过滤用户帖子（多用户请用“|”分隔）：<br>例如： <font color="FF0000">yuzi|裕裕</font></td>
<td><input size="30" value="<%=badlist%>" name="badlist"></td>
</tr>

<tr class=a4>
<td>禁止IP地址进入论坛（多IP请用“|”分隔）：<br>例如： <font color="FF0000">127.0.0.1|192.168.0.1</font></td>
<td><input size="30" value="<%=badip%>" name="badip"></td>
</tr>
</table>




<br>
<table cellspacing="1" cellpadding="2" width="97%" border="0" class="a2" align="center">
  <tr height=25>
    <td class=a1 align=middle colspan=2>邮件信息</td>
  </tr>
  

<tr class=a3>
<td width="50%"0>发送邮件组件：</td>
<td>
<select name="selectmail">
<option value="">关闭</option>
<option value="JMail" <%if selectmail="JMail" then%>selected<%end if%>>JMail</option>
<option value="CDONTS" <%if selectmail="CDONTS" then%>selected<%end if%>>CDONTS</option>
</select>
</td>
</tr>
<tr class=a4>
<td>SMTP Server地址：</td>
<td><input size="30" value="<%=smtp%>" name="smtp"></td>
</tr>
<tr class=a3>
<td>邮件服务器登录名：</td>
<td><input size="30" value="<%=MailServerusername%>" name="MailServerusername"></td>
</tr>
<tr class=a4>
<td>邮件服务器登录密码：</td>
<td>
<input size="30" value="<%=MailServerPassword%>" name="MailServerPassword" type="password"></td>
</tr>
<tr class=a3>
<td>发件人Email地址：</td>
<td><input size="30" value="<%=smtpmail%>" name="smtpmail"></td>
</tr>  
</table>




<br>
<table cellspacing="1" cellpadding="2" width="97%" border="0" class="a2" align="center">
  <tr height=25>
    <td class=a1 align=middle colspan=2>基本选项</td>
  </tr>

<tr class=a4>
<td width="50%">用户是否需要经过激活才能登陆：</td>
<td>
<input type=radio name="ActivationUser" value="1" <%if ActivationUser=1 then%>checked<%end if%> id=ActivationUser><label for=ActivationUser>否</label>&nbsp;&nbsp;
<input type=radio name="ActivationUser" value="0" <%if ActivationUser=0 then%>checked<%end if%> id=ActivationUser_1><label for=ActivationUser_1>是</label>
</td>
</tr>



<tr class=a4>
<td width="50%">帖子是否需要经过激活才能显示：</td>
<td>
<input type=radio name="ActivationForum" value="0" <%if ActivationForum=0 then%>checked<%end if%> id=ActivationForum><label for=ActivationForum>否</label>&nbsp;&nbsp;
<input type=radio name="ActivationForum" value="1" <%if ActivationForum=1 then%>checked<%end if%> id=ActivationForum_1><label for=ActivationForum_1>是</label>
</td>
</tr>



<tr class=a3>
<td width="50%">开放申请论坛功能：</td>
<td>
<input type=radio name="apply" value="0" <%if apply=0 then%>checked<%end if%> id=apply><label for=apply>关闭</label>
<input type=radio name="apply" value="1" <%if apply=1 then%>checked<%end if%> id=apply_1><label for=apply_1>开放</label>
</td>
</tr>

<tr class=a4>
<td width="50%">注册用户密码通过Email发送：<br><font color="FF0000">服务器必须支持邮件发送功能</font></td>
<td>
<input type=radio name="SendPassword" value="0" <%if SendPassword=0 then%>checked<%end if%> id=SendPassword><label for=SendPassword>关闭</label>
<input type=radio name="SendPassword" value="1" <%if SendPassword=1 then%>checked<%end if%> id=SendPassword_1><label for=SendPassword_1>打开</label>
</td>
</tr>
</table>


  <br>
<table cellspacing="1" cellpadding="2" width="97%" border="0" class="a2" align="center">
  <tr height=25>
    <td class=a1 align=middle colspan=2>搜索选项</td>
  </tr>
<tr class=a4>
<td width="50%">搜索返回最多的结果数</td>
<td>
&nbsp;<input size="4" value="<%=MaxSearch%>" name="MaxSearch">&nbsp; [默认:500]</td>
</tr>
<tr class=a4>
<td width="50%">是否开启帖子内容搜索</td>
<td>
<input type=radio name="searchcontent" value="0" <%if searchcontent=0 then%>checked<%end if%> id=searchcontent><label for=searchcontent>关闭</label>
<input type=radio name="searchcontent" value="1" <%if searchcontent=1 then%>checked<%end if%> id=searchcontent_1><label for=searchcontent_1>打开</label>
</td>
</tr>
  
</table>



<br>
<table cellspacing="1" cellpadding="2" width="97%" border="0" class="a2" align="center">
  <tr height=25>
    <td class=a1 align=middle colspan=2>用户选项</td>
  </tr>
  
<tr class=a3>
<td width="50%">新用户注册：</td>
<td>
<input type=radio name="CloseRegUser" value="1" <%if CloseRegUser=1 then%>checked<%end if%> id=CloseRegUser><label for=CloseRegUser>关闭</label>
<input type=radio name="CloseRegUser" value="0" <%if CloseRegUser=0 then%>checked<%end if%> id=CloseRegUser_1><label for=CloseRegUser_1>开放</label>
</td>
</tr>

<tr class=a4>
<td>注册后是否需要停留10分钟才能发表</td>
<td>
<input type=radio name="Reg10" value="0" <%if Reg10=0 then%>checked<%end if%> id=Reg10><label for=Reg10>关闭</label>
<input type=radio name="Reg10" value="1" <%if Reg10=1 then%>checked<%end if%> id=Reg10_1><label for=Reg10_1>打开</label>
</td>
</tr>

<tr class=a3>
<td>一个Email只能注册一个帐号</td>
<td>
<input type=radio name="RegOnlyMail" value="0" <%if RegOnlyMail=0 then%>checked<%end if%> id=RegOnlyMail><label for=RegOnlyMail>关闭</label>
<input type=radio name="RegOnlyMail" value="1" <%if RegOnlyMail=1 then%>checked<%end if%> id=RegOnlyMail_1><label for=RegOnlyMail_1>打开</label>
</td>
</tr>

  
</table>

<br>
<table cellspacing="1" cellpadding="2" width="97%" border="0" class="a2" align="center">
  <tr height=25>
    <td class=a1 align=middle colspan=2>上传选项</td>
  </tr>
  
<tr class=a3>
<td width="50%">允许头像文件的大小：</td>
<td>


<input size="6" value="<%=MaxFace%>" name="MaxFace"> byte&nbsp; [默认:10240]</td>
</tr>

<tr class=a4>
<td>允许照片文件的大小：</td>
<td>
<input size="6" value="<%=MaxPhoto%>" name="MaxPhoto"> byte&nbsp; [默认:30720]</td>
</tr>
  
 <tr class=a3>
<td>允许附件文件的大小：</td>
<td>
<input size="6" value="<%=MaxFile%>" name="MaxFile"> byte&nbsp; [默认:102400]</td>
</tr>
   
  
  
  
</table>
<input type="submit" value=" 更 新 "></form>
<%
end sub


sub variableok

if Request("clubname")="" then
error2("请输入社区名称")
end if



filtrate=split(Request("badip"),"|")
for i = 0 to ubound(filtrate)
if instr("|"&remoteaddr&"","|"&filtrate(i)&"") > 0 then error2("请检查你输入的IP地址是否正确")
next




rs.Open "clubconfig",Conn,1,3
rs("badwords")=Request("badwords")
rs("clubname")=Request("clubname")
rs("cluburl")=Request("cluburl")
rs("homename")=Request("homename")
rs("homeurl")=Request("homeurl")
rs("selectmail")=Request("selectmail")
rs("smtp")=Request("smtp")
rs("smtpmail")=Request("smtpmail")
rs("MailServerusername")=Request("MailServerusername")
rs("MailServerPassword")=Request("MailServerPassword")
rs("badlist")=Request("badlist")
rs("badip")=Request("badip")


rs("allclass")=""&Request("floor")&","&Request("CloseRegUser")&","&Request("Reg10")&","&Request("RegOnlyMail")&","&Request("SendPassword")&","&Request("apply")&","&Request("prison")&","&Request("Timeout")&","&Request("OnlineTime")&","&Request("MaxFace")&","&Request("MaxPhoto")&","&Request("MaxFile")&","&Request("searchcontent")&","&Request("MaxSearch")&","&Request("ActivationForum")&","&Request("ActivationUser")&""
rs.update

rs.close


on error resume next
if Request("selectmail")="JMail" then
Set JMail=Server.CreateObject("JMail.Message")
If -2147221005 = Err Then response.write "本服务器不支持 JMail.Message 组件！请关闭发送邮件功能！<br><br>"
elseif Request("selectmail")="CDONTS" then
Set MailObject = Server.CreateObject("CDONTS.NewMail")
If -2147221005 = Err Then response.write "本服务器不支持 CDONTS.NewMail 组件！请关闭发送邮件功能！<br><br>"
end if


%>
更新成功<br><br><a href=javascript:history.back()>返 回</a>
<%
end sub



sub showbanner
%><form method="post" action="?menu=bannerok">
<table cellspacing="1" cellpadding="2" width="97%" border="0" class="a2" align="center">
  <tr height=25>
    <td class=a1 align=middle colspan=2>广告代码设置</td>
  </tr>
    <tr>
    <td class=a3 align=middle width="20%">顶部广告代码<br>
	<font color="#FF0000">支持HTML</font>
 </td>
    <td class=a3>
<textarea name="banner" rows="6" style="width:100%"><%=banner%></textarea></td>
  </tr>
      <tr>
    <td class=a3 align=middle width="20%">底部版权信息<br>
	<font color="#FF0000">支持HTML</font>
 </td>
    <td class=a3>
<textarea name="adcode" rows="6" style="width:100%"><%=adcode%></textarea></td>
  </tr>
  
  </table>
<center><input type="submit" value=" 更 新 ">
</form>
<%
end sub

htmlend

%>