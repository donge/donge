<!--#include file="conn.asp"-->
<%
  dim rs,rs2
 dim sql,sql2
 
 
  set rs2=server.createobject("adodb.recordset")
 sql2="select * from cjgk  where bh=2"
 rs2.open sql2,conn,3,3
 cjgk=rs2("cjgk")

 
  set rs=server.createobject("adodb.recordset")
 sql="select * from cxb where xh='" + xh + "'"
 rs.open sql,conn,3,3
  if cjgk="否" then
%>
 <body topmargin=0 leftmargin=0 rightmargin=0 bgcolor="#fef4d9">
<p><center>
.................................................
   
<P>
    <div align=center><font align=center class=my4><b>【对不起，学校不准修改密码】</b></font></div>
    <P>
    
  <form action=index.asp method=post>
<center><input type=submit value="返回首页" align=center></center>

  </form>


    
   
    <%   
 rs.close
 set rs=nothing
   rs2.close
 set rs2=nothing
 conn.close
 set conn=nothing
 
   else
   Server.Execute("xgmm.asp")

  end if
%>