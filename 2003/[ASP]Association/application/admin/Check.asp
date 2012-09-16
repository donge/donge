<%@ language="vbscript"%>
<%response.Expires = 0%>
<!--#include file="conn.asp"-->
<%
dim uid ,upwd
uid=trim(Request.Form("uid"))
upwd=trim(Request.Form("pwd"))

set rs=server.createobject("adodb.recordset")
sqltext="select * from admin where uid='" & uid & "' and pwd='" & upwd & "'"
rs.open sqltext,conn,1,1


'查找数据库，检查用户名是否存在
if rs.recordcount >= 1 then 
      response.cookies("adminok")=true
      Response.Redirect "manage.asp"   
 	  response.end
      rs.close
	else
	response.write "<script language=JavaScript>{window.alert('输入的账户或密码错误，请重新输入!');window.location.href='login.htm';}</script>"
	 response.end
     rs.close
end if

%>