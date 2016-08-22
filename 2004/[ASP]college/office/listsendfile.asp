<!--#include file="asp/opendb.asp"-->
<% 
set conn=opendb("oabusy","conn","accessdsn")
Set rs=Server.CreateObject("ADODB.recordset")
sql="select filevalue,fileContentType from senddate where id=" & trim(request("id")) 
rs.open sql,conn,1,1 
Response.ContentType = rs("fileContentType")
Response.BinaryWrite rs("filevalue").getChunk(7500000) 
rs.close 
set rs=nothing 
set conn=nothing 

%> 