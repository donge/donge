<!--#include file="conn.asp"-->
<%
  'dim rs,rs2
 'dim sql,sql2
 
 
  set rs2=server.createobject("adodb.recordset")
 sql2="select * from cjgk  where bh=3"
 rs2.open sql2,conn,3,3
 cjgk=rs2("cjgk")

 
  set rs=server.createobject("adodb.recordset")
 sql="select * from cxb where xh='" + xh + "'"
 rs.open sql,conn,3,3
  if cjgk="·ñ" then
%>
 <!--#include file="xgmm11.asp"-->
     <%   
 rs.close
 set rs=nothing
   rs2.close
 set rs2=nothing
 conn.close
 set conn=nothing
 
   else
   Server.Execute("xgmm1.asp")

  end if
%>