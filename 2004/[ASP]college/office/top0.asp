<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/opendb.asp"-->
<%
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
'�����ݿ⣬�������û��Ƿ񿴹���ͨ��
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where username=" & sqlstr(oabusyusername)
rs.open sql,conn,1
'�����û�����ʱ��
joindate=rs("joindate")
'���û����,��
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
'�����յ��ļ����ǻظ��ļ�ʱ�����û�ظ��͵�������
'�򿪹������ݿ⣬�����������Ǳ��˵Ļ򱾲��������˵Ĳ�reidΪ0���ҹ��ķ���ʱ����û�����ʱ����Ĺ��ļ�¼
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from senddate where reid=0 and (recipientusername=" & sqlstr(oabusyusername) & " or (recipientusername='������' and recipientuserdept=" & sqlstr(oabusyuserdept) & ")) and inputdate>#" & joindate & "#"
rs.open sql,conn,1
while not rs.bof and not rs.eof
'�򿪹������ݿ⣬�����������Ǳ��˲�reid���ڽ��չ��ĵ�id�ļ�¼
set conn=opendb("oabusy","conn","accessdsn")
set rs1=server.createobject("adodb.recordset")
sql="select * from senddate where sender=" & sqlstr(oabusyusername) & " and reid=" & rs("id")
rs1.open sql,conn,1
'����޼�¼�͵������ڲ���ֹ����
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
'ѭ��
rs.movenext
wend
'-------------------------------------------------
'�����յ��ļ��ǻظ��ļ�ʱ�����û���͵�������
'�򿪹������ݿ⣬�����������Ǳ��˵Ļ򱾲��������˵Ĳ�reid��Ϊ0�Ĺ��ļ�¼
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from senddate where reid<>0 and (recipientusername=" & sqlstr(oabusyusername) & " or (recipientusername='������' and recipientuserdept=" & sqlstr(oabusyuserdept) & "))"
rs.open sql,conn,1
while not rs.bof and not rs.eof
'���ѿ��������ݿ⣬�����û����Ǳ��˲�senddateid���ڽ��չ��ĵ�id,��haveseeΪ��yes���ļ�¼
set conn=opendb("oabusy","conn","accessdsn")
set rs1=server.createobject("adodb.recordset")
sql="select * from seesenddate where havesee='yes' and username=" & sqlstr(oabusyusername) & " and senddateid=" & rs("id")
rs1.open sql,conn,1
'����޼�¼�͵������ڲ���ֹ����
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
'ѭ��
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

  