<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/checked.asp"-->
<%
On Error Resume Next
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then response.redirect "default.asp"

'ȡ�õ�ǰ��
myday=day(now())
if request("myday")<>"" then myday=cint(request("myday"))
'ȡ�õ�ǰ��
mymonth=month(now())
if request("mymonth")<>"" then mymonth=cint(request("mymonth"))
'ȡ�õ�ǰ��
myyear=year(now())
if request("myyear")<>"" then myyear=cint(request("myyear"))

if request("detel")="ɾ��" and request("delid")<>"" then
count=0
condition=""
condition1=""
condition2=""
for each idno in request("delid")
count=count+1
condition=condition+"id=" & idno
condition1=condition1+"reid=" & idno
if count<request("delid").count then
condition=condition+" or "
condition1=condition1+" or "
end if
next
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from senddate where " & condition1
rs.open sql,conn,1
while not rs.bof and not rs.eof
condition2=condition2+"senddateid=" & rs("id")
rs.movenext
if not rs.bof and not rs.eof then condition2=condition2+" or "
wend
'ɾ�����ݿ��еļ�¼
set conn=opendb("oabusy","conn","accessdsn")
sql = "delete * from senddate where " & condition
conn.Execute sql
sql = "delete * from senddate where " & condition1
conn.Execute sql
sql = "delete * from seesenddate where " & condition2
conn.Execute sql
end if


%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="css/css.css">
<title>����칫ϵͳ</title>
</head>
<body bgcolor="#eeeeee" topmargin="5" leftmargin="5">
<% call bghead() %>
<center>
<table>
<tr>
<form method=post action="senddatecontrol.asp">
<td><b>���Ĺ���</B>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="submit" value="ȫ��"></td>
</form>
<form method=post action="senddatecontrol.asp">
<td>
<select name="myyear" size=1>
<%
for i=2001 to 2010
%>
<option value=<%=i%><%=selected(i,myyear)%>><%=i%>��</option>
<%
next
%>
</select>
<select name="mymonth" size=1>
<%
for i=1 to 12
%>
<option value=<%=i%><%=selected(i,mymonth)%>><%=i%>��</option>
<%
next
%>
</select>
<select name="myday" size=1>
<%
for i=1 to 31
%>
<option value=<%=i%><%=selected(i,myday)%>><%=i%>��</option>
<%
next
%>
</select>
<input type="hidden" name="lookfor" value="yes">
<input type="submit" value="��ѯ">
</td>
</form>
</tr>
</table>
</center>
<%
call bgmid()
%>
<br>
<center>
<%
myday1=myday+1
if myyear<>"" then
mydate=myyear & "-" & mymonth & "-" & myday
mydate1=dateadd("d",cdate(mydate),1)  'myyear & "-" & mymonth & "-" & myday1
else
mydate=""
end if


set conn=opendb("oabusy","conn","accessdsn")
Set rs=Server.CreateObject("ADODB.recordset")
sql="select * from senddate where reid=0 order by id desc"
if request("lookfor")="yes" then sql="select * from senddate where reid=0 and inputdate between " & "#" & mydate & "# and #" & mydate1 & "# order by id desc"
rs.open sql,conn,1
'response.write sql
if not rs.eof and not rs.bof then
rs.pagesize=20
page=clng(request("page"))
if page<1 then page=1
if page>rs.pagecount then page=rs.pagecount
href="senddatecontrol.asp"
rs.absolutepage=page
%>
<form method="post" action="<%=href%>?page=<%=page%>">
<table border="1" cellpadding="0" cellspacing="0" width="95%">
<tr>
<td width="30" align="center"><input type="submit" value="ɾ��" name="detel"></td><td align=center><b>���ı���</b></td><td align=center width=30><b>����</b></td><td align=center width=50><b>������</b></td><td align=center width=100><b>���������ڲ���</b></td><td align=center width=50><b>������</b></td><td align=center width=150><b>��������</b></td>
</tr>
<%
for ipage=1 to rs.pagesize
%>
<tr>
<td align="center"><input type="checkbox" name="delid" value=<%=rs("id")%>></td><td><a href="showsenddate.asp?id=<%=rs("id")%>" target="_blank"><%=rs("title")%></a></td>
<td width=30>
<%
if rs("filename")<>"" then
%>
<a href="listsendfile.asp?id=<%=rs("id")%>" target="_blank"><img src="images/attach.gif" width=30 height=30 border=0 alt="�ļ�����<%=rs("filename")%>"></a>
<%
else
%>
&nbsp;
<%
end if
%>
</td>
<td align="center">
<%
set conn=opendb("oabusy","conn","accessdsn")
Set rs2=Server.CreateObject("ADODB.recordset")
sql="select name from userinf where username=" & sqlstr(rs("sender"))
rs2.open sql,conn,1
if not rs12.eof and not rs2.bof then
%>
<%=rs2("name")%>
<%
end if
%>
</td>
<td align="center"><%=rs("recipientuserdept")%></td><td align="center">
<%
if rs("recipientusername")<>"������" then
set conn=opendb("oabusy","conn","accessdsn")
Set rs1=Server.CreateObject("ADODB.recordset")
sql="select name from userinf where username=" & sqlstr(rs("recipientusername"))
rs1.open sql,conn,1
if not rs1.eof and not rs1.bof then
%>
<%=rs1("name")%>
<%
end if
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
<input type="hidden" name="myyear" value="<%=myyear%>">
<input type="hidden" name="mymonth" value="<%=mymonth%>">
<input type="hidden" name="myday" value="<%=myday%>">
<input type="hidden" name="lookfor" value="<%=request("lookfor")%>">
<input type="hidden" name="page" value="<%=page%>">
</form>
<table border=0 width=550>
<tr><form action=<%=href%> method=get>
<td align="center">
<%
response.write "<a href=" & href & "?page=1&myyear=" & server.urlencode(myyear) & "&mymonth=" &  server.urlencode(mymonth) & "&myday=" & server.urlencode(myday) & "&lookfor=" & server.urlencode(request("lookfor")) & ">��һҳ</a>"
%>
</td>
<td align="center">
<%
response.write "<a href=" & href & "?page=" & (page-1) & "&myyear=" & server.urlencode(myyear) & "&mymonth=" &  server.urlencode(mymonth) & "&myday=" & server.urlencode(myday) & "&lookfor=" & server.urlencode(request("lookfor")) & ">��һҳ</a>"
%>
</td>
<td align="center">
<%
response.write "<a href=" & href & "?page=" & (page+1) & "&myyear=" & server.urlencode(myyear) & "&mymonth=" &  server.urlencode(mymonth) & "&myday=" & server.urlencode(myday) & "&lookfor=" & server.urlencode(request("lookfor")) & ">��һҳ</a>"
%>
</td>
<td align="center">
<%
response.write "<a href=" & href & "?page=" & rs.pagecount & "&myyear=" & server.urlencode(myyear) & "&mymonth=" &  server.urlencode(mymonth) & "&myday=" & server.urlencode(myday) & "&lookfor=" & server.urlencode(request("lookfor")) & ">���һҳ</a>"
%>
</td>
<td align="center">
ȥ��<input type=text name=page size=3>ҳ</td>
<input type="hidden" name="myyear" value="<%=myyear%>">
<input type="hidden" name="mymonth" value="<%=mymonth%>">
<input type="hidden" name="myday" value="<%=myday%>">
<input type="hidden" name="lookfor" value="<%=request("lookfor")%>">
<td align="center">��<%=page%>/<%=rs.pagecount%>ҳ</td></form></tr></table><br>



<%
else
%>
<br><br><br>
<table border="0" cellpadding="0" cellspacing="0" width="400">
<tr>
<td width="400" align="center"><font size="4" color="red">�Բ���,û����ؼ�¼</font></td></tr></table>
<%
end if
%>


</center>
<%
call bgback()
%>
</body>
</html>