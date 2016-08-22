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


  
%><!--#include file="lyfind0.asp"-->