<!-- #include file="conn.asp" -->
<%
'=========================================================
' 调用代码
'---------------------------------------------------------
'<span id=yuzi>BBSxp</span>
'<script src=new.asp?id=yuzi&forumid=1&TopicCount=10&TitleCount=15&showtime=1></script>
'---------------------------------------------------------
' id:         定义识别代码[其中“yuzi”可自定义，如一个页面多个调用请各自更改不同的代码，共2处需要修改]
' forumid:    指定论坛的ID
' TopicCount: 显示多少条主题
' TitleCount: 标题长度
' showtime:   1=显示时间 0=不显示时间
'=========================================================
' Copyright (C) 1998-2004 Yuzi.Net. All rights reserved.
' Web: http://www.yuzi.net,http://www.bbsxp.com
' Email: huangzhiyu@yuzi.net
'=========================================================

forumid=int(Request("forumid"))
if Request("TopicCount")=empty then
TopicCount=10
else
TopicCount=int(Request("TopicCount"))
end if

if Request("TitleCount")=empty then
TitleCount=15
else
TitleCount=int(Request("TitleCount"))
end if


Set conn=Server.CreateObject("ADODB.Connection")
conn.open ConnStr
cluburl=Conn.Execute("Select cluburl From clubconfig")(0)

	if forumid = empty then
		sql="select top "&TopicCount&" id,icon,topic,lasttime from forum where deltopic=0 order by id desc"
	else
		sql="select top "&TopicCount&" id,icon,topic,lasttime from forum where forumid="&forumid&" and deltopic=0 order by id desc"
	end if

	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.open sql,conn
	do while Not RS.Eof
	
if Request("showtime")=1 then showtime=" ["&rs("lasttime")&"]"

list=list&" <img src="&cluburl&"/images/brow/"&rs("icon")&".gif> <a href="&cluburl&"/ShowPost.htm?id="&rs("id")&" target=_blank>"&left(rs("Topic"),TitleCount)&"</a>"&showtime&"<br>"
	RS.MoveNext
	Loop
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
%>

<%=Request("id")%>.innerHTML="<%=list%>"

