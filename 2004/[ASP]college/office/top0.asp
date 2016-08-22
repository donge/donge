<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/opendb.asp"-->
<%
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
'打开数据库，读出此用户是否看过此通告
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where username=" & sqlstr(oabusyusername)
rs.open sql,conn,1
'读出用户建立时间
joindate=rs("joindate")
'如果没看过,就
if rs("seenotice")="no" then
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from newnotice"
rs.open sql,conn,1
if not rs.eof and not rs.bof then
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>New Page 1</title>
</head>
<body>
<SCRIPT language=JavaScript>                   
window.open('popnotice.asp','NewWin1','scrollbars=yes,width=450,height=375');
</script> 
</body>
</html>
<%
response.end
end if
end if
%>

<%
'--------------------------------------------------
'所接收的文件不是回复文件时，如果没回复就弹出窗口
'打开公文数据库，读出接收人是本人的或本部门所有人的并reid为0而且公文发布时间比用户建立时间晚的公文记录
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from senddate where reid=0 and (recipientusername=" & sqlstr(oabusyusername) & " or (recipientusername='所有人' and recipientuserdept=" & sqlstr(oabusyuserdept) & ")) and inputdate>#" & joindate & "#"
rs.open sql,conn,1
while not rs.bof and not rs.eof
'打开公文数据库，读出发送人是本人并reid等于接收公文的id的记录
set conn=opendb("oabusy","conn","accessdsn")
set rs1=server.createobject("adodb.recordset")
sql="select * from senddate where sender=" & sqlstr(oabusyusername) & " and reid=" & rs("id")
rs1.open sql,conn,1
'如果无记录就弹出窗口并终止程序
if rs1.eof or rs1.bof then
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>New Page 1</title>
</head>
<body>
<SCRIPT language=JavaScript>                   
window.open('popdate.asp?id=<%=rs("id")%>','NewWin1','scrollbars=yes,width=700,height=400');       </script> 
</body>
</html>
<%
response.end
end if
'循环
rs.movenext
wend
'-------------------------------------------------
'所接收的文件是回复文件时，如果没看就弹出窗口
'打开公文数据库，读出接收人是本人的或本部门所有人的并reid不为0的公文记录
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from senddate where reid<>0 and (recipientusername=" & sqlstr(oabusyusername) & " or (recipientusername='所有人' and recipientuserdept=" & sqlstr(oabusyuserdept) & "))"
rs.open sql,conn,1
while not rs.bof and not rs.eof
'打开已看公文数据库，读出用户名是本人并senddateid等于接收公文的id,且havesee为“yes”的记录
set conn=opendb("oabusy","conn","accessdsn")
set rs1=server.createobject("adodb.recordset")
sql="select * from seesenddate where havesee='yes' and username=" & sqlstr(oabusyusername) & " and senddateid=" & rs("id")
rs1.open sql,conn,1
'如果无记录就弹出窗口并终止程序
if rs1.eof or rs1.bof then
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>New Page 1</title>
</head>
<body>
<SCRIPT language=JavaScript>

                   
window.open("popredate.asp?id=<%=rs("id")%>",'NewWin1','scrollbars=yes,width=700,height=400');     
</script> 
</body>
</html>
<%
response.end
end if
'循环
rs.movenext
wend

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Refresh" content="10; url=top0.asp">
<title>New Page 1</title>
</head>
<body>
</body>
</html>

  