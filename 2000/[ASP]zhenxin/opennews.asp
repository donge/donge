<%@ LANGUAGE="VBSCRIPT" %>
<!--#include file="newsconn.asp"-->
<%response.buffer=false
dim sql
dim rs
dim listname
dim id
id=request("id")
set rs=server.createobject("adodb.recordset")
sql="update news set hits=hits+1 where id="&id
rs.open sql,conn,1,1
response.redirect "list.asp?id="&id
rs.close
conn.close
%>