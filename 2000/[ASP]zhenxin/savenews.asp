<!--#include file="newsconn.asp"-->
<!--#include file="newschar.inc"-->
<%
if request.form("txttitle")="" then 
response.write "������ʾ�����������ű��⣡"
response.end
end if
if request.form("txtnews")="" then 
response.write "������ʾ���������������ݣ�"
response.end
end if
if request.form("txtname")="" then 
response.write "������ʾ��������վ��������"
response.end
end if
if request.form("txtmail")="" then 
response.write "������ʾ��������վ��e_mail��"
response.end
end if
if request.form("txtsite")="" then 
response.write "������ʾ��������site_name��"
response.end
end if
if request.form("txtlink")="" then 
response.write "������ʾ��������site_url��"
response.end
end if
%>
<%
dim title
dim news
dim name
dim site
dim link
dim mail
dim sql
dim rs
dim id
title=htmlencode2(request.form("txttitle"))
name=htmlencode2(request.form("txtname"))
site=htmlencode2(request.form("txtsite"))
link=htmlencode2(request.form("txtlink"))
mail=htmlencode2(request.form("txtmail"))
if request.form("checkbox")="on" then
news=htmlencode(request.form("txtnews"))
else
news=htmlencode2(request.form("txtnews"))
end if
set rs=server.createobject("adodb.recordset")
sql="select * from news where (id is null)" 
rs.open sql,conn,1,3
rs.addnew
rs("title")=title
rs("news")=news
rs("name")=name
rs("link")=link
rs("site")=site
rs("mail")=mail
rs("date")=date()
rs.update
id=rs("id")
rs.close
set rs=nothing
conn.close
set conn=nothing
response.redirect "index.asp"
%>
