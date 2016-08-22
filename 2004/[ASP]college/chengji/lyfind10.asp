<!--#include file="conn.asp"-->
<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">

<%






xsmm = request("xsmm")
 xh=request("xh")
  dim rs,rs1
 dim sql,sql1
 
  set rs=server.createobject("adodb.recordset")
 sql="select * from cxb where xh='" + xh + "'"
 rs.open sql,conn,3,3

if rs.eof then	
		response.write"<script language='javascript'>" 
		 response.write"alert('没有此学号！');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end
end if
if xsmm<>rs("xsmm") then	
		response.write"<script language='javascript'>" 
		 response.write"alert('密码不对！');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end
end if

 if xsmm=rs("xsmm") then
   session("gwsly")=true
  else 
   session("gwsly")=false
  end if


  



  if Session.Contents("gwsly")<>true then
 %>
<!--#include file="index.asp"-->
<%  
else








 xh=request("xh")

  sxh=xh

  
  set rs=server.createobject("adodb.recordset")
 
  sql="SELECT * from ly where sxh='" + sxh + "'" 

 rs.open sql,conn,3,3


total=rs.recordcount


%>
<html>
<head>
<title>找到<%=total%>条记录</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="config.css" type="text/css">
</head>
<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
          <div align="center"><b><font color=red><font face="华文行楷" size="5">
            留言管理窗口</font></font></b></div>  <p> 
         
     <div align="center"><b><font><font color=green size="3">
            现在学校不准留言！</font></font></b></div>  <p> 
         

               
<p>
          
          
          
          
          
          
        <div align="center"><b><font color="#0066FF">共有<font color=red><%=total%></font>条留言 
        </font></b></div>
    </td>
  </tr>
</table>



<center>

	<table border=1 cellpadding=1 cellspacing=1>
    <tr bgcolor=black style='color:white'>
    <td align=center>编号</td>
    
    <td align=center>学号</td>
       
    <td align=center>姓名</td>
    
 　 <td align=center>性别</td> 
   
    <td align=center>部门或专业</td>

    <td align=center>班级或职务</td>
    
    <td align=center>家庭住址</td>

    <td align=center>留言时间</td>

    <td align=center>查看留言</td>






<%
do while not rs.eof
i=i+1
sxh=rs("sxh")
fxh=rs("fxh")
nr=rs("nr")
sj=rs("sj")
bh=rs("bh")
xh=rs("fxh")



 set rs1=server.createobject("adodb.recordset")
 sql1="select * from cxb where xh='" + xh + "'"
 rs1.open sql1,conn,3,3
if rs1.eof then	
set rs2=server.createobject("adodb.recordset")
 sql2="select * from zybjmc where zybj='" + xh + "'"
 rs2.open sql2,conn,3,3
 
 
 if rs2.eof then	
	
set rs3=server.createobject("adodb.recordset")
 sql3="select * from xxld where bh='" + xh + "'"
  rs3.open sql3,conn,3,3
  if NOT rs3.eof then	

jtdz="本校"
xm=rs3("xm")
xb=rs3("xb")
s=rs3("bm")
zybj=rs3("zw")
end if		
			
else
 
  if NOT rs2.eof then	
 
xm=rs2("byxf")
xb=rs2("xb")
s=rs2("s")
zybj=rs2("zybj")+"班主任"
jtdz="本校"
end if
end if
else
xm=rs1("xm")
xb=rs1("xb")
s=rs1("s")
zybj=rs1("zybj")
jtdz=rs1("jtdz")

 end if	
		
%>

  
  
  
<% 
 If sColor = "silver" Then
		sColor = "#cccccc"
	Else
		sColor = "silver"
	End If
   
	Response.Write("<tr bgcolor='" & sColor & "'>")	 
%> 
	 

  
  
  
  
  
  
  
    
    <td align=center><font color="red"><%=i%></font>　</td>
    <td align=center><%=xh%>　</td>
    <td align=center><%=xm%>　</td>
	<td align=center><%=xb%>　</td>
    <td align=center><%=s%>　</td>
    <td align=center><%=zybj%>　</td>
    <td align=center><%=jtdz%>　</td>
    <td align=center><%=sj%>　</td>
       	    <td align=center>
    <a href="#" onClick="window.open('lys1.asp?bh=<%=bh%>&zybj=<%=zybj%>&xm=<%=xm%>&xb=<%=xb%>&sj=<%=sj%>', 'Sample', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=yes,height=250,width=430,left=0,top=0')">
    <font color="blue">点击查看</font></a></td></tr>
   

    
    
    
 <%
rs.movenext
loop

Response.Write("</table>") 
Response.Write("</center>")

%>
  <br>



 


</form>
</body>
</html>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
  
 

<p>
   
    <center>
   
  
   
   
   <a href="index.asp"><font face="隶书" size="4" color="#FF0000">返回首页</font></a></center>
   
   
    </center>
   

   
   
        <%
       
end if
%>