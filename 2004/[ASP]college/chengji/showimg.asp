
<% 

set connGraph=server.CreateObject("ADODB.connection") 

connGraph.ConnectionString="driver={Microsoft Access Driver (*.mdb)};DBQ=" & server.MapPath("gws.mdb") & ";uid=;PWD=gws;" 

connGraph.Open 

set rec=server.createobject("ADODB.recordset") 
xh=request("xh")

strsql="select img from cxb where xh='" + xh + "'"
rec.open strsql,connGraph,1,1 
Response.ContentType = "image/*" 

Response.BinaryWrite rec("img").getChunk(7500000) 

rec.close 

set rec=nothing 

set connGraph=nothing 

%>