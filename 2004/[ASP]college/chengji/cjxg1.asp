<!--#include file="conn.asp"-->
<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">

<%

 dim rs
 dim sql
  set rs=server.createobject("adodb.recordset")
 sql="select * from cjgk  where bh=2"
 rs.open sql,conn,3,3
 cjgk=request("cjgk")

 conn.execute("update [cjgk] set cjgk='"&cjgk&"' WHERE bh=2")
 rs.close
 set rs=nothing
 conn.close
 set conn=nothing

%>
<center>ÐÞ¸Ä³É¹¦£¡<br></center>