<!--#include file="asp/opendb.asp"-->
<% 
set conn=opendb("oabusy","conn","accessdsn")
Set rs=Server.CreateObject("ADODB.recordset")
sql="select photo from personinf where id=" & trim(request("id")) 
rs.open sql,conn,1,1 
Response.ContentType = "image/*" 
Response.BinaryWrite rs("photo").getChunk(7500000) 
'rs.close 
'set rs=nothing 
'set conn=nothing 
%> 