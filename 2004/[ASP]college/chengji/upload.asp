<%
xh=request("xh")
response.buffer=true 

formsize=request.totalbytes 
formdata=request.binaryread(formsize) 

bncrlf=chrB(13) & chrB(10) 

divider=leftB(formdata,clng(instrb(formdata,bncrlf))-1) 

datastart=instrb(formdata,bncrlf & bncrlf)+4 

dataend=instrb(datastart+1,formdata,divider)-datastart 

mydata=midb(formdata,datastart,dataend)
set connGraph=server.CreateObject("ADODB.connection") 

set objRst = server.createobject("adodb.recordset")


connGraph.ConnectionString="driver={Microsoft Access Driver (*.mdb)};DBQ=" & server.MapPath("gws.mdb") & ";uid=;PWD=gws;" 

connGraph.Open 


set rec=server.createobject("ADODB.recordset") 
rec.Open "SELECT * FROM [cxb] where xh='" + xh + "'",connGraph,1,3
rec("img").appendchunk mydata
rec("xh")=xh
rec.update
rec.close 

set rec=nothing 

set connGraph=nothing 

%>
<p>
<center><a href=lrgl.asp>录入下一条记录</a></center>