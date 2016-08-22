<%
key1 = "男"


key = request.form("key")
topic=request.form("topic")
if key="" and topic="" then
key = request("key")
topic=request("topic")
end if

if topic="0"then
sql="SELECT * from cxb where (xh like '%"&key&"%' or sw like '%"&key&"%' or byzs like '%"&key&"%' or bysj like '%"&key&"%' or rxsj like '%"&key&"%' or csrq like '%"&key&"%' or cf like '%"&key&"%' or jl like '%"&key&"%' or jg like '%"&key&"%' or zzmm like '%"&key&"%' or lxdh like '%"&key&"%' or xm like '%"&key&"%' or jtdz like '%"&key&"%'or s like '%"&key&"%'or zybj like '%"&key&"%') and xb like '%"&key1&"%'" 
end if
if topic="1" then
sql="SELECT * from cxb where xh like '%"&key&"%' and xb like '%"&key1&"%'" 
end if
if topic="2" then
sql="SELECT * from cxb where xm like '%"&key&"%' and xb like '%"&key1&"%'" 
end if
if topic="3" then
sql="SELECT * from cxb where jtdz like '%"&key&"%' and xb like '%"&key1&"%'" 
end if
if topic="4" then
sql="SELECT * from cxb where s like '%"&key&"%' and xb like '%"&key1&"%'" 
end if
if topic="5" then
sql="SELECT * from cxb where zybj like '%"&key&"%' and xb like '%"&key1&"%'"
end if


if topic="6" then
sql="SELECT * from cxb where lxdh like '%"&key&"%' and xb like '%"&key1&"%'" 
end if
if topic="7" then
sql="SELECT * from cxb where zzmm like '%"&key&"%' and xb like '%"&key1&"%'" 
end if
if topic="8" then
sql="SELECT * from cxb where jg like '%"&key&"%' and xb like '%"&key1&"%'" 
end if
if topic="9" then
sql="SELECT * from cxb where jl like '%"&key&"%' and xb like '%"&key1&"%'" 
end if
if topic="10" then
sql="SELECT * from cxb where cf like '%"&key&"%' and xb like '%"&key1&"%'"
end if


if topic="11" then
sql="SELECT * from cxb where csrq like '%"&key&"%' and xb like '%"&key1&"%'" 
end if
if topic="12" then
sql="SELECT * from cxb where rxsj like '%"&key&"%' and xb like '%"&key1&"%'" 
end if
if topic="13" then
sql="SELECT * from cxb where bysj like '%"&key&"%' and xb like '%"&key1&"%'" 
end if
if topic="14" then
sql="SELECT * from cxb where byzs like '%"&key&"%' and xb like '%"&key1&"%'" 
end if
if topic="15" then
sql="SELECT * from cxb where sw like '%"&key&"%' and xb like '%"&key1&"%'" 
end if












set rs=server.createobject("adodb.recordset")
rs.open sql,conn,3,3
totaln=rs.recordcount
ns=total-totaln
%>
     <div align="center"><b><font color="#0066FF">其中男生<font color=red><%=totaln%></font>人<b><font color="#0066FF">女生<font color=red><%=ns%></font>人</div> 
</font></font> 
</b></b> 
<%
do while not rs.eof
i=i+1
xb=rs("xb")
rs.movenext
loop
Response.Write("</table>") 
Response.Write("</center>")
%>