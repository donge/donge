<!--#include file="conn.asp"-->
<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">

<%
 bh=request("bh")
 
   dim rs
 dim sql
  set rs=server.createobject("adodb.recordset")

 sql="select * from xxld where bh='" + bh + "'"

 rs.open sql,conn,3,3
 
 xb=request("xb")
 xm=request("xm")
bm=request("bm")
 zw=request("zw")
 mm=request("mm")
 gl=request("gl")
 

 conn.execute("update [xxld] set xb='"&xb&"',xm='"&xm&"',bm='"&bm&"',zw='"&zw&"',mm='"&mm&"',gl='"&gl&"' WHERE bh='"&bh&"'")
 


 
 
%>
 
<center>修改成功！<br><a href=glycksj.asp>返回系级管理页面</a></center>