<%
key1 = "��"


key = request("s")

sql="SELECT * from cxb where s like '%"&key&"%'  and xb like '%"&key1&"%'"











set rs=server.createobject("adodb.recordset")
rs.open sql,conn,3,3
totaln=rs.recordcount
ns=total-totaln
%>
     <div align="center"><b><font color="#0066FF">��������<font color=red><%=totaln%></font>��<b><font color="#0066FF">Ů��<font color=red><%=ns%></font>��</div> 
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