<!--#include file="conn.asp"-->
<%
 dim rs
 dim sql
 bh=request("bh")
  set rs=server.createobject("adodb.recordset")
 sql="select * from ly where bh='" + bh + "'"
 rs.open sql,conn,3,3
 rs.delete
 rs.close
 set rs=nothing
 conn.close
 set conn=nothing
%>
  
<SCRIPT language="JavaScript">
  
function closeclk() {
close();
}
  </script>
  <body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">

  
<center>
�ѳɹ���ɾ�������ԣ�
 <form> 
<INPUT TYPE="BUTTON" NAME="close" value="�ر��������" onClick="closeclk()">
</FORM>
</center>
</body>