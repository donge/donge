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
 sql="select * from cjgk  where bh=3"
 rs.open sql,conn,3,3

%>
<html>
 <head>
  <title>�޸�����Ȩ��</title>
 </head>
 <body topmargin=0 leftmargin=0 rightmargin=0 bgcolor="#fef4d9">
    <center>
  <font face="�����п�" size="6" color="#FF0000"><b>׼��׼ѧ�����Լ��鿴����</b></font></center>
 <form action=cjxg2.asp method=post>
 <center>

    <%
   cjgk=rs("cjgk")
       if cjgk="��" then
    %>
       <input type=radio name="cjgk" value="��" checked>׼ѧ�����Լ��鿴����<p>
       <input type=radio name="cjgk" value="��"><font color="#FF0000">��</font>׼ѧ�����ԣ��ɲ鿴���ԣ�
                  <%   
    else
    %>
       <input type=radio name="cjgk" value="��">׼ѧ�����Լ��鿴����<p>
       <input type=radio name="cjgk" value="��" checked><font color="#FF0000">��</font>׼ѧ�����ԣ��ɲ鿴���ԣ�
         <%
    end if
    %>
           
  
   
    <p><input type=submit value="�ύ">&nbsp;&nbsp;&nbsp; <input type=reset value="��ԭ"></p>
  </form> </center>
  <p>
 </body>
</html>
<%
end if
%>