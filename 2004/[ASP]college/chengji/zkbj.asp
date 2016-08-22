
<!--#include file="conn.asp"-->

<%
zybj=request("zybj")
 glymm=request("glymm")
 

 
 dim rs
 dim sql

 set rs=server.createobject("adodb.recordset")
 sql="select * from zybjmc where zybj='" + zybj + "'"
 rs.open sql,conn,3,3
if rs.eof then	
		response.write"<script language='javascript'>" 
		 response.write"alert('没找到您输入的班级！');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end
end if


 if glymm<>rs("glymm") then
 response.write"<script language='javascript'>" 
		 response.write"alert('您输入密码错误！');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end
		 else

session("gws1")=true


%>





<html>
<head>
<title>科技部</title>


</head>

<frameset rows="*" frameborder="NO" border="0" framespacing="0"> 
  <frameset rows="*" frameborder="YES"> 
    <frameset cols="153,*" frameborder="YES"> 
    <frame src="z.asp?zybj=<%=zybj%>" name="left" scrolling="yes" frameborder="NO" bordercolor="#FFFFFF" marginwidth="0" marginheight="0">
    <frame src="bjks.asp?zybj=<%=zybj%>" name="gws" scrolling="YES">
    </frameset>
  </frameset>
<body bgcolor="#3366FF">
</body>
</html>
<%
end if
%>