<%
if request.cookies("adminok")="" then
  response.redirect "login.htm"
end if
%>
<!--#include file="conn.asp"-->
<%
   dim SQL, Rs, contentID,CurrentPage
   contentID=request("ID")

   set rs=server.createobject("adodb.recordset")
   sqltext="delete * from userinfo where id="& contentID
   rs.open sqltext,conn,3,3
   set rs=nothing
   response.redirect "manage.asp"
%>