<%

  if Session.Contents("gws")<>true then
 %>
<!--#include file="gly.asp"-->
<%  
else
%>
<!--#include file="conn.asp"-->
<%
 dim rs
 dim sql
  set rs=server.createobject("adodb.recordset")
 sql="select * from cjgk  where bh=1"
 rs.open sql,conn,3,3

%>
<html>
 <head>
  <title>修改成绩是否公开</title>
 </head>
 <body topmargin=0 leftmargin=0 rightmargin=0 bgcolor="#fef4d9">
    <center>
  <font face="华文行楷" size="6" color="#FF0000"><b>成绩是否公开</b></font></center>
 <form action=cjxg.asp method=post>
 <center>

    <%
   cjgk=rs("cjgk")
       if cjgk="是" then
    %>
       <input type=radio name="cjgk" value="是" checked>公开--任何人都可以查看其他人的成绩<p>
       <input type=radio name="cjgk" value="否"><font color="#FF0000">不</font>公开--要用密码才可查看自己的成绩
           <%   
    else
    %>
       <input type=radio name="cjgk" value="是">公开--任何人都可以查看其他人的成绩<p>
       <input type=radio name="cjgk" value="否" checked><font color="#FF0000">不</font>公开--要用密码才可查看自己的成绩
           <%
    end if
    %>
           
  
   
    <p><input type=submit value="提交">&nbsp;&nbsp;&nbsp; <input type=reset value="还原"></p>
  </form> </center>
  <p>
 </body>
</html>
<%
end if
%>