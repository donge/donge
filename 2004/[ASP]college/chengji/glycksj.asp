<!--#include file="conn.asp"-->
<%

  if Session.Contents("gws")<>true then
 %>
<!--#include file="gly.asp"-->
<%  
else
sql="SELECT * from xxld Order by bh" 

set rs=server.createobject("adodb.recordset")
rs.open sql,conn,3,3
	
total=rs.recordcount


%>
<html>
<head>
<title>�ҵ�<%=total%>����¼</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="config.css" type="text/css">
</head>
<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
          <div align="center"><b><font color=red><font face="�����п�" size="6">
            ����ϵ����Ա����</font></font></b></div><br>     
<center><p><font color="#444444" size="5"><a href=sjlrgl.asp>
<font color="#008000">������Ա</font></a></font></center><br>
         
        <div align="center"><b><font color="#0066FF">���ҵ�<font color=red><%=total%></font>λϵ��������Ա 
        </font></b></div>
    </td>
  </tr>
</table>



<center>

	<table border=1 cellpadding=1 cellspacing=1>
    <tr bgcolor=black style='color:white'>
    
    <td align=center>���</td>
    
    <td align=center>��¼��</td>

    <td align=center>����</td>

    <td align=center>�Ա�</td>
    
    <td align=center>����</td>

    <td align=center>ְ��</td>

    <td align=center>����</td>

    <td align=center>��������</td>

    <td align=center>ɾ������</td>

    <td align=center>�޸�</td>



<%
do while not rs.eof
i=i+1
xm=rs("xm")
xb=rs("xb")
zw=rs("zw")
mm=rs("mm")
gl=rs("gl")
bh=rs("bh")
bm=rs("bm")



%>

  
  
  
<% 
 If sColor = "silver" Then
		sColor = "#cccccc"
	Else
		sColor = "silver"
	End If
   
	Response.Write("<tr bgcolor='" & sColor & "'>")	 
%> 
	 

  
  
  
  
  
  
  
    
    <td align=center><font color="red"><%=i%></font>��</td>
    <td align=center><%=bh%>��</td>
        <td align=center><%=xm%>��</td>
    <td align=center><%=xb%>��</td>
    <td align=center><%=bm%>��</td>

        <td align=center><%=zw%>��</td>
    <td align=center><%=mm%>��</td>
    <td align=center><%=gl%>��</td>

   <td align=center><a href=sjggsc.asp?bh=<%=bh%>><font color="red">���ɾ��</font></a></td>
    <td align=center><a href=gwsxjxg.asp?bh=<%=bh%>><font color="green">����޸�</font></a></td>

    </tr>
   

    
    
    
 <%
rs.movenext
loop

Response.Write("</table>") 
Response.Write("</center>")

%>
 <!--#include file="nnx.asp"-->

</body>
</html>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
end if
%>