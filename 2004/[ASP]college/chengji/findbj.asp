<%@ language=vbscript %>
<!--#include file="conn.asp"-->
<%

  if Session.Contents("gws")<>true then
 %>
<!--#include file="gly.asp"-->
<%  
else
key = request.form("key")
if key="" then
 key=request("key")
end if

if  key="" then
sql="SELECT * from zybjmc Order by zybj" 
end if

sql="SELECT * from zybjmc where s like '%"&key&"%' or zybj like '%"&key&"%' Order by zybj" 


set rs=server.createobject("adodb.recordset")
rs.open sql,conn,3,3
if rs.eof then	
		response.write"<script language='javascript'>" 
		 response.write"alert('对不起，没有找到你输入的内容！');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end
end if
	
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
          <div align="center"><b><font color=red><font face="华文行楷" size="7">
            管理员窗口</font></font></b></div>      

          <div align="center"><b><font color=red>删除或修改班级记录成绩管理分析</font></b></div>      

        <div align="center"><b><font color="#0066FF">共找到<font color=red><%=total%></font>条符合您要求的记录 
        </font></b></div>
    </td>
  </tr>
</table>



<center>

	<table border=1 cellpadding=1 cellspacing=1>
    <tr bgcolor=black style='color:white'>
    
    <td align=center>编号</td>
   
    <td align=center>部门或专业</td>

    <td align=center>班级名称</td>
    
    <td align=center>班级资料修改</td>

    <td align=center>全班成绩管理</td>

    <td align=center>成绩分析查询</td>





<%
do while not rs.eof
i=i+1
s=rs("s")
zybj=rs("zybj")
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
        <td align=center><%=s%>　</td>
    <td align=center><%=zybj%>　</td>
    
    <td align=center><a href=gwsbjxg.asp?zybj=<%=zybj%>><font color="green">查看修改</font></a></td>
    <td align=center><a href=zk.asp?zybj=<%=zybj%>><font color="blue">成绩录入修改</font></a></td>
    
   <td align=center><a href=zkfx.asp?zybj=<%=zybj%>><font color="blue">分析查询详情</font></a></td>

    </tr>
   

    
    
    
 <%
rs.movenext
loop

Response.Write("</table>") 
Response.Write("</center>")

%>
  <p>
  <center>
<form name="form2" method="post" action="findbj.asp">
 
          
        请输入所在部门专业或班级的名称 <br>
          <input type="text" name="key" size="30"><p>
          <input type="submit" name="Submit2" value="搜索">
       
</form>
</center>
</body>
</html>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
end if
%>