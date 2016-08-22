<!--#include file="conn.asp"-->
<%
 dim rs
 dim sql
 
  zybj=request("zybj")
 
 set rs=server.createobject("adodb.recordset")
 sql="select * from zybjmc where zybj='" + zybj + "'"
 rs.open sql,conn,3,3

 
 
 
 
 
 
 
 rs.delete
 rs.close
 set rs=nothing
 conn.close
 set conn=nothing
 response.redirect("findbj.asp")
%>