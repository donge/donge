

<!--#include file="conn.asp"-->
<%
 dim rs
 dim sql
 bh=request("bh")
 set rs=server.createobject("adodb.recordset")
 sql="select * from xxld where bh='" + bh + "'"
  rs.open sql,conn,3,3
 rs.delete
 rs.close
 set rs=nothing
 conn.close
 set conn=nothing
 response.redirect("glycksj.asp")
%>
<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">