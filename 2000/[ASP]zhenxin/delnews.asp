 <%
if request.cookies("manage")="" then
  response.redirect "login.asp"
end if
%>
<!--#include file="newsconn.asp"-->
<%
   dim sql 
   dim rs
   set rs=server.createobject("adodb.recordset")
   sql="delete from news where id="&request("id")
   rs.open sql,conn,1,1
   set rs=nothing  
   conn.close
   set conn=nothing
   response.redirect "managenews.asp"
%>