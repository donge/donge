<!--#include file="conn.asp"-->

<%
 xh=request("xh")
 zybj=request("zybj")

  dim rs
 dim sql
 if zybj="0" then
 
  set rs1=server.createobject("adodb.recordset")
 sql1="SELECT * from xxld Order by bh" 

  rs1.open sql1,conn,3,3

 if rs1.eof then	
		response.write"<script language='javascript'>" 
		 response.write"alert('û�з�����Ҫ��ļ�¼��');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end
end if
	
total=rs1.recordcount


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
          <div align="center"><b><font color=red><font face="�����п�" size="5">
            ϵ�����Զ���ȷ��</font></font></b></div>      

      
        <div align="center"><b><font color="#0066FF">���ҵ�<font color=red><%=total%></font>λϵ������Ա 
        </font></b></div>
    </td>
  </tr>
</table>



<center>

	<table border=1 cellpadding=1 cellspacing=1>
    <tr bgcolor=black style='color:white'>
    
    <td align=center>���</td>
   <td align=center>������</td>
<td align=center>����</td>
<td align=center>�Ա�</td>
<td align=center>����</td>
<td align=center>ְ��</td>
<td align=center>����ȷ��</td>

 


<%
do while not rs1.eof
i=i+1
xm=rs1("xm")
xb=rs1("xb")
bm=rs1("bm")
zw=rs1("zw")
bh=rs1("bh")



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
        <td align=center>ϵ����</td>
    <td align=center><%=xm%>��</td>
        <td align=center><%=xb%>��</td>
    <td align=center><%=bm%>��</td>
    <td align=center><%=zw%>��</td>
   <td align=center><a href=lrgg911.asp?sxh=<%=bh%>&xh=<%=xh%>&zw=<%=zw%>&xm=<%=xm%>><font color="blue">д����</font></a></td>

    </tr>
   

    
    
    
 <%
rs1.movenext
loop
Response.Write("</table>") 
Response.Write("</center>")


 %>

 
 
   <!--#include file="nnx.asp"-->

 
 <%

rs1.close
set rs1=nothing
conn.close
set conn=nothing
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 else
  set rs=server.createobject("adodb.recordset")
 sql="select * from zybjmc where zybj='" + zybj + "'"
 rs.open sql,conn,3,3

if rs.eof then	
		response.write"<script language='javascript'>" 
		 response.write"alert('û�д˰༶��');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end
end if

s=rs("s")
sxh=rs("zybj")
xm=rs("byxf")
bm=rs("s")
zybj=rs("zybj")
xb=rs("xb")

  
%>

<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">
<form action=lrgg91.asp method=post>




<input type=hidden name="sxh"value="<%=sxh%>">



       <input type=hidden name="xh"value="<%=xh%>">    

     <center>

    <font size="4" color="#FF0000">���Զ���ȷ��</font><div align="center">
      <center>
      <font size="3" color="#FF00FF"><p>
      <table border="2" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#0000FF" width="66%" id="AutoNumber1" bgcolor="#EFEFEF">
        <tr>
          <td width="17%" align="center"><font color="#FF0000">������</font></td>
          <td width="17%" align="center"><font color="#FF0000">����</font></td>
                    <td width="17%" align="center"><font color="#FF0000">�Ա�</font></td>

          <td width="17%" align="center"><font color="#FF0000">����</font></td>
          <td width="17%" align="center"><font color="#FF0000">�༶</font></td>
<td width="17%" align="center"><font color="#FF0000">ְ��</font></td>
        </tr>
        <tr>
        
        <td width="17%" align="center">�༶����Ա</td>
          <td width="17%" align="center"><%=xm%>��</td>
            <td width="17%" align="center"><%=xb%>��</td>

          <td width="17%" align="center"><%=bm%>��</td>
          <td width="17%" align="center"><%=zybj%>��</td>

          <td width="17%" align="center">������</td>

        </tr>
      </table>
      </center>
    </div>
    
    
     </font>
    
     </center>
<br>
   <input type=hidden name="xm"value="<%=xm%>">   
   <center>
   <input type=submit value="�ǣ�����">
  </center>
    </form>
    
    <%
    end if
%>
    
    <p>
<center><a href="lyfind0.asp?xh=<%=xh%>">���ǣ�����</a></center>

  
    
    
    
    
    
   </body>
</html>