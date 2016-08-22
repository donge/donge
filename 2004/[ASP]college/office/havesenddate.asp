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
'取得当前日
myday=day(now())
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
<td><b>已发公文</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
<form method=post action="havesenddate.asp">
<td><input type="submit" name="submit" value="全部"></td>
</form>
<form method=post action="havesenddate.asp">
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
<select name="myday" size=1>
<%
for i=1 to 31
%>
<option value=<%=i%><%=selected(i,myday)%>><%=i%>日</option>
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

myday1=myday+1
if myyear<>"" then
mydate=myyear & "-" & mymonth & "-" & myday
mydate1=dateadd("d",cdate(mydate),1) 'myyear & "-" & mymonth & "-" & myday1
else
mydate=""
end if


set conn=opendb("oabusy","conn","accessdsn")
Set rs=Server.CreateObject("ADODB.recordset")
sql="select * from senddate where sender=" & sqlstr(oabusyusername) & " and reid=0 order by id desc"
if request("lookfor")="yes" then sql="select * from senddate where sender=" & sqlstr(oabusyusername) & " and reid=0 and inputdate between " & "#" & mydate & "# and #" & mydate1 & "# order by id desc"
rs.open sql,conn,1
'response.write sql
if not rs.eof and not rs.bof then
rs.pagesize=20
page=clng(request("page"))
if page<1 then page=1
if page>rs.pagecount then page=rs.pagecount
href="havesenddate.asp"
rs.absolutepage=page
%>
<table border="1" cellpadding="0" cellspacing="0" width="95%">
<tr>
<td align=center><b>公文标题</b></td><td align=center width=30><b>附件</b></td><td align=center width=100><b>接收者所在部门</b></td><td align=center width=60><b>接收者</b></td><td align=center width=150><b>发布日期</b></td>
</tr>
<%
for ipage=1 to rs.pagesize
%>
<tr>
<td><a href="showsenddate.asp?id=<%=rs("id")%>" target="_blank"><%=rs("title")%></a></td><td align="center">
<%
if rs("filename")<>"" then
%>
<a href="listsendfile.asp?id=<%=rs("id")%>" target="_blank"><img src="images/attach.gif" width=30 height=30 border=0 alt="文件名：<%=rs("filename")%>"></a>
<%
else
%>
&nbsp;
<%
end if
%>
</td><td align="center"><%=rs("recipientuserdept")%></td><td align="center">
<%
if rs("recipientusername")<>"所有人" then
set conn=opendb("oabusy","conn","accessdsn")
Set rs1=Server.CreateObject("ADODB.recordset")
sql="select name from userinf where username=" & sqlstr(rs("recipientusername"))
rs1.open sql,conn,1
%>
<%
if not rs1.eof and not rs1.bof then
%>
<%=rs1("name")%>
<%
end if
%>
<%
else
%>
<%=rs("recipientusername")%>
<%
end if
%>
</td>
<td align="center"><%=rs("inputdate")%></td>
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
response.write "<a href=" & href & "?page=1&myyear=" & server.urlencode(myyear) & "&mymonth=" &  server.urlencode(mymonth) & "&myday=" & server.urlencode(myday) & "&lookfor=" & server.urlencode(request("lookfor")) & ">第一页</a>"
%>
</td>
<td align="center">
<%
response.write "<a href=" & href & "?page=" & (page-1) & "&myyear=" & server.urlencode(myyear) & "&mymonth=" &  server.urlencode(mymonth) & "&myday=" & server.urlencode(myday) & "&lookfor=" & server.urlencode(request("lookfor")) & ">上一页</a>"
%>
</td>
<td align="center">
<%
response.write "<a href=" & href & "?page=" & (page+1) & "&myyear=" & server.urlencode(myyear) & "&mymonth=" &  server.urlencode(mymonth) & "&myday=" & server.urlencode(myday) & "&lookfor=" & server.urlencode(request("lookfor")) & ">下一页</a>"
%>
</td>
<td align="center">
<%
response.write "<a href=" & href & "?page=" & rs.pagecount & "&myyear=" & server.urlencode(myyear) & "&mymonth=" &  server.urlencode(mymonth) & "&myday=" & server.urlencode(myday) & "&lookfor=" & server.urlencode(request("lookfor")) & ">最后一页</a>"
%>
</td>
<td align="center">
去第<input type=text name=page size=3>页</td>
<input type="hidden" name="myyear" value="<%=myyear%>">
<input type="hidden" name="mymonth" value="<%=mymonth%>">
<input type="hidden" name="myday" value="<%=myday%>">
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