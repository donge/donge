<!--#include file="conn.asp"-->
<%
 dim rs
 dim sql
 xh=request("xh")
 set rs=server.createobject("adodb.recordset")
 sql="select * from cxb where xh='" + xh + "'"
 rs.open sql,conn,3,3
 rs.delete
 rs.close
 set rs=nothing
 conn.close
 set conn=nothing
 response.redirect("index0.asp")
%>