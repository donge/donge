<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/checked.asp"-->
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then response.redirect "default.asp"
if request("myday")<>"" then myday=cint(request("myday"))
'取得当前月
mymonth=month(now())
if request("mymonth")<>"" then mymonth=cint(request("mymonth"))
'取得当前年
myyear=year(now())
if request("myyear")<>"" then myyear=cint(request("myyear"))
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="css/css.css">
<title>网络办公系统</title>
</head>
<body bgcolor="#eeeeee" topmargin="5" leftmargin="5">

<% call bghead() %>
<center>
<table>
<tr>
<td><b>历史通告信息</b>&nbsp;&nbsp;&nbsp;&nbsp;
</td>
<form method=post action="noticelook.asp">
<td><input type="submit" name="submit" value="全部"></td>
</form>
<form method=post action="noticelook.asp">
<td>
<select name="myyear" size=1>
<%
for i=2001 to 2010
%>
<option value=<%=i%><%=selected(i,myyear)%>><%=i%>年</option>
<%
next
%>
</select>
<select name="mymonth" size=1>
<%
for i=1 to 12
%>
<option value=<%=i%><%=selected(i,mymonth)%>><%=i%>月</option>
<%
next
%>
</select>
<input type="hidden" name="lookfor" value="yes">
<input type="submit" value="查询">
</td>
</form>
</tr>
</table>
</center>
<%
call bgmid()
%>
<center>
<br>
<%
if myyear<>"" then
mydate=myyear & "-" & mymonth & "-" & 1
mydate1=dateadd("m",1,mydate)
else
mydate=""
end if

set conn=opendb("oabusy","conn","accessdsn")
Set rs=Server.CreateObject("ADODB.recordset")
sql="select * from newnotice order by id desc"
if request("lookfor")="yes" then sql="select * from newnotice where noticedate between " & "#" & mydate & "# and #" & mydate1 & "# order by id desc"
rs.open sql,conn,1
if not rs.eof and not rs.bof then
rs.pagesize=20
page=clng(request("page"))
if page<1 then page=1
if page>rs.pagecount then page=rs.pagecount
href="noticelook.asp"
rs.absolutepage=page
%>
<table border="1" cellpadding="0" cellspacing="0" width="500">
<tr>
<td align=center><b>通告标题</b></td><td align=center><b>发布日期</b></td>
</tr>
<%
for ipage=1 to rs.pagesize
%>
<tr>
<td><a href="shownotice.asp?id=<%=rs("id")%>" target="_blank"><%=rs("title")%></a></td>
<td align="center" width=200><%=rs("noticedate")%></td>
</tr>
<%
rs.movenext
if rs.eof then exit for
next
%>
</table>
<table border=0 width=550>
<tr><form action=<%=href%> method=get>
<td align="center">
<%
response.write "<a href=" & href & "?page=1&myyear=" & server.urlencode(myyear) & "&mymonth=" &  server.urlencode(mymonth) & "&lookfor=" & server.urlencode(request("lookfor")) & ">第一页</a>"
%>
</td>
<td align="center">
<%
response.write "<a href=" & href & "?page=" & (page-1) & "&myyear=" & server.urlencode(myyear) & "&mymonth=" &  server.urlencode(mymonth) & "&lookfor=" & server.urlencode(request("lookfor")) & ">上一页</a>"
%>
</td>
<td align="center">
<%
response.write "<a href=" & href & "?page=" & (page+1) & "&myyear=" & server.urlencode(myyear) & "&mymonth=" &  server.urlencode(mymonth) & "&lookfor=" & server.urlencode(request("lookfor")) & ">下一页</a>"
%>
</td>
<td align="center">
<%
response.write "<a href=" & href & "?page=" & rs.pagecount & "&myyear=" & server.urlencode(myyear) & "&mymonth=" &  server.urlencode(mymonth) & "&lookfor=" & server.urlencode(request("lookfor")) & ">最后一页</a>"
%>
</td>
<td align="center">
去第<input type=text name=page size=3>页</td>
<input type="hidden" name="myyear" value="<%=myyear%>">
<input type="hidden" name="mymonth" value="<%=mymonth%>">
<input type="hidden" name="lookfor" value="<%=request("lookfor")%>">
<td align="center">第<%=page%>/<%=rs.pagecount%>页</td></form></tr></table><br>



<%
else
%>
<br><br><br>
<table border="0" cellpadding="0" cellspacing="0" width="400">
<tr>
<td width="400" align="center"><font size="4" color="red">对不起,没有相关纪录</font></td></tr></table>
<%
end if
%>
</center>
<%
call bgback()
%>


</body>
</html>