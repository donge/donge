<!--#include file="conn.asp"-->
<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">

<%






mm = request("mm")
 bh=request("bh")
  dim rs,rs1
 dim sql,sql1
  set rs=server.createobject("adodb.recordset")
 sql="select * from xxld where bh='" + bh + "'"
  rs.open sql,conn,3,3

if rs.eof then	
		response.write"<script language='javascript'>" 
		 response.write"alert('没有此管理员！');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end
end if
if mm<>rs("mm") then	
		response.write"<script language='javascript'>" 
		 response.write"alert('密码不对！');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end
end if

 if mm=rs("mm") then
   session("gwsly")=true
 
  else 
   session("gwsly")=false
  

  end if
  session("gws")=true 
gl=rs("gl")
if gl="是" then


%>
<font size="4" color="#FF0099">

<center><a href=glyck.asp>进入管理系统</a></center></font><br>
<%
else
%>
<font size="4" color="#FF0099">

<center><a href=glyck6.asp>进入查看系统</a></center></font><br>



<%

end if
  
%><!--#include file="lyfind0.asp"-->