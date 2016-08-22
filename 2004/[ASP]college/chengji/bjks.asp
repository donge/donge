





<%@ language=vbscript %>
<!--#include file="conn.asp"-->
<%  



zybj= request("zybj")
mc=request("mc")
sj=request("sj")
sql="SELECT * from cxb where zybj like '%"&zybj&"%' Order by xh" 

set rs=server.createobject("adodb.recordset")
rs.open sql,conn,3,3
if rs.eof then	
		response.write"<script language='javascript'>" 
		 response.write"alert('没有符合您要求的记录！');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end
end if
	
total=rs.recordcount
Dim i
ReDim fsjl(total)
i=0

%>
<html>
<head>
<title>科技部</title>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="config.css" type="text/css">
</head>
<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">







<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
          <div align="center"><b><font color=red><font face="华文行楷" size="6">
            <%=zybj%></font></font></b></div>      

<!--#include file="gws.html"-->

        <div align="center"><b><font color="#0066FF">共有<font color=red><%=total%></font>位学生 
        </font></b></div>
    </td>
  </tr>
</table>
  <!--#include file="bjz.asp"-->

<%
rs.close
set rs=nothing
conn.close
set conn=nothing

%>