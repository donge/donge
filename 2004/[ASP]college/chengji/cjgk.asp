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
  <title>�޸ĳɼ��Ƿ񹫿�</title>
 </head>
 <body topmargin=0 leftmargin=0 rightmargin=0 bgcolor="#fef4d9">
    <center>
  <font face="�����п�" size="6" color="#FF0000"><b>�ɼ��Ƿ񹫿�</b></font></center>
 <form action=cjxg.asp method=post>
 <center>

    <%
   cjgk=rs("cjgk")
       if cjgk="��" then
    %>
       <input type=radio name="cjgk" value="��" checked>����--�κ��˶����Բ鿴�����˵ĳɼ�<p>
       <input type=radio name="cjgk" value="��"><font color="#FF0000">��</font>����--Ҫ������ſɲ鿴�Լ��ĳɼ�
           <%   
    else
    %>
       <input type=radio name="cjgk" value="��">����--�κ��˶����Բ鿴�����˵ĳɼ�<p>
       <input type=radio name="cjgk" value="��" checked><font color="#FF0000">��</font>����--Ҫ������ſɲ鿴�Լ��ĳɼ�
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