<!--#include file="conn.asp"-->
 <body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">

<%
 dim rs
 dim sql
  set rs=server.createobject("adodb.recordset")
 sql="select * from gg Order by rq desc"

rs.open sql,conn,3,3
total=rs.recordcount
    if not rs.eof then   
 bt=rs("bt")
  rq=rs("rq")
 bh=rs("bh")
  nr=rs("nr")
 end if  
  
    
  

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
            公告管理</font></font></b></div>      

      
        <div align="center"><b><font color="#0066FF">共有<font color=red><%=total%></font>条公告 
        </font></b></div>
    </td>
  </tr>
</table>



<center>

	<table border=1 cellpadding=1 cellspacing=1>
    <tr bgcolor=black style='color:white'>
    
    <td align=center>编号</td>
   <td align=center>标识号</td>
<td align=center>标题</td>
<td align=center>日期</td>
<td align=center>删除确认</td>
<td align=center>内容</td>

 


<%
do while not rs.eof
i=i+1
bh=rs("bh")
bt=rs("bt")
nr=rs("nr")
rq=rs("rq")



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
        <td align=center><%=bh%>　</td>
    <td align=center><%=bt%>　</td>
        <td align=center><%=rq%>　</td>
    <td align=center><a href=ggsc.asp?bh=<%=bh%>><font color="red">点击删除</font></a></td>
   <td align=center>
    <a href="#" onClick="window.open('lys31.asp?bh=<%=bh%>', 'Sample', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=yes,height=350,width=420,left=0,top=0')">
    <font color="blue">点击查看</font></a></td></tr>
   

    
    
    
 <%
rs.movenext
loop
Response.Write("</table>") 
Response.Write("</center>")
 rs.close
set rs=nothing
conn.close
set conn=nothing
 
 

%>
<font color="red" size="5">
  <form action=lrgg.asp method=post>
<center><input type=submit value="新增公告" align=center></center>

  </form>



</html>