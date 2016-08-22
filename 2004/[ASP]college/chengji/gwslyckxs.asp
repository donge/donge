<!--#include file="conn.asp"-->
<%
 xsm=request("xsm")
 xh=request("xh")
 zybj=request("zybj")
  dim rs,rs1,rs2
 dim sql,sql1,sql2
 
 
  set rs2=server.createobject("adodb.recordset")
 sql2="select * from cjgk  where bh=1"
 rs2.open sql2,conn,3,3
 cjgk=rs2("cjgk")

 
  set rs=server.createobject("adodb.recordset")
  set rs1=server.createobject("adodb.recordset")

 sql="select * from cxb where xh='" + xh + "'"
 sql1="select * from zybjmc where zybj='" + zybj + "'"

 rs.open sql,conn,3,3
 rs1.open sql1,conn,3,3

  if cjgk="╖ё" then
  if xsm<>rs("xsmm") then

   rs.close
 set rs=nothing
   rs1.close
 set rs1=nothing
  rs2.close
 set rs2=nothing
 conn.close
 set conn=nothing
 
  %>
   <body topmargin=0 leftmargin=0 rightmargin=0 bgcolor="#fef4d9">
  <p>
<form action=gwslyckxs.asp?xh=<%=xh%>&zybj=<%=zybj%> method=post>
  <div align=center><font align=center class=my4><b>б╛╟ы╩ф╚ы├▄┬ыб┐</b></font></div><p>

  <table width=243 border=0 bgcolor=#8800cc align=center cellspacing=1 cellpadding=4>
      <tr bgcolor=#FFcccc>
    <td width="81"> 
    <p align="center">├▄  бб┬ы
    <td width=114>
      <center><input type=password name="xsm" value="" size=16></center>
  </table>
    <p>
       <center><input type=submit value="╠с╜╗" align=center></center>
  </form>
  <%
  else
   Server.Execute("gwslyck.asp")

  end if

else
   Server.Execute("gwslyck.asp")

 
 
end if
%>