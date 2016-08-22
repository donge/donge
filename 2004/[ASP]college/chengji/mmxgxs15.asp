<!--#include file="conn.asp"-->
<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">
<%






xsmm = request("xsmm")
 xh=request("xh")
  dim rs,rs1
 dim sql,sql1
 
  set rs=server.createobject("adodb.recordset")
 sql="select * from zybjmc where zybj='" + xh + "'"
 rs.open sql,conn,3,3

if rs.eof then	
		response.write"<script language='javascript'>" 
		 response.write"alert('没有此班级！');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end
end if
if xsmm<>rs("glymm") then	
		response.write"<script language='javascript'>" 
		 response.write"alert('密码不对！');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end
end if

 if xsmm=rs("glymm") then
   session("gwsly")=true
  else 
   session("gwsly")=false
  end if


  
%>
 <p align="center"><font face="华文行楷" size="6" color="#FF3333">

 <center>
 <a href=zkbj.asp?zybj=<%=xh%>&glymm=<%=xsmm%> style="text-decoration: none">进入班级管理</a></center>

</font></p>

<!--#include file="lyfind0.asp"-->