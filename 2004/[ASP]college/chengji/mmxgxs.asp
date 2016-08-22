<!--#include file="conn.asp"-->
<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">

<%
xsmm = request("xsmm")
xxsmm1 = request("xxsmm1")
xxsmm2 = request("xxsmm2")
 xh=request("xh")
 dim rs
 dim sql
  set rs=server.createobject("adodb.recordset")
 sql="select * from cxb where xh='" + xh + "'"
 rs.open sql,conn,3,3
 xsmm1 = request("xsmm")

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
if xxsmm1<>xxsmm2 then	
		response.write"<script language='javascript'>" 
		 response.write"alert('两次输入的密码不一样！');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end
end if

 conn.execute("update [cxb] set xsmm='"&xxsmm1&"' WHERE xh='"&xh&"'")
  
%>
 
<center>修改成功！<br><a href=index.asp>返回查询页面</a></center>