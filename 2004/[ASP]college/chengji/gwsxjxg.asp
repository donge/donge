<!--#include file="conn.asp"-->
<%
 

  if Session.Contents("gws")<>true then
 %>
<!--#include file="gly.asp"-->
<%  
else

 bh=request("bh")
 
   dim rs
 dim sql
  set rs=server.createobject("adodb.recordset")

 sql="select * from xxld where bh='" + bh + "'"

 rs.open sql,conn,3,3
 


%>

<html>
 <head>
  <title>ϵ������Ա�޸�</title>
  </head>
 <body topmargin=0 leftmargin=0 rightmargin=0 bgcolor="#fef4d9">
    <p>
  <center><font face="�����п�" size="6" color="#FF0000"><b>�޸�ϵ������Ա</b></font></center>
 <form action=xjxgxs.asp method=post>
  <center>
  <table width=551 cellpadding=4 cellspacing=1 bgcolor=#ff0000 align=center height="247">
      <tr bgcolor=#FFcccc>
       <td align=center width=100 height="1">��¼��
       <td height="1" width="432">
       <input type=text name="bh" size=20 maxlength=20 class=i value="<%=rs("bh")%>"><font size="2" color="green">��Ҫ���ģ�</font><font size="2"><font color=#009933>��������޸���Ч</font>��<font color="#009933">�޸�������¼</font></font>
     <tr bgcolor=#FFcccc>
    <td align=center width=100 height="2">����
    <td height="2" width="432">
    
    
    
   <input type=text name="xm" size=10 maxlength=10 class=i value="<%=rs("xm")%>">*&nbsp;<font size="2">5���������� 
     </font>
        <tr bgcolor=#FFcccc>
       <td align=center width=100 height="19">�Ա�
      <%
    xb=rs("xb")
    if xb="��" then
    %>
        <td height="11" width="433"><input type=radio name="xb" value="��" checked>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name="xb" value="Ů">Ů
    <%   
    else
    %>
        <td height="11" width="433"><input type=radio name="xb" value="��">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name="xb" value="Ů" checked>Ů
    <%
    end if
    %>
          <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">����
            <td height="19" width="432">
            
             <input type=text name="bm" size=30 maxlength=30 class=i value="<%=rs("bm")%>"><font size="2">*&nbsp;���15������</font>

    <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">ְ��
    <td height="19" width="432">
   
    <input type=text name="zw" size=20 maxlength=20 class=i value="<%=rs("zw")%>"><font size="2">*&nbsp;���10������</font>
         
  <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">����
        <td height="19" width="432">
               <input type=text name="mm" size=20 maxlength=20 class=i value="<%=rs("mm")%>"><font size="2">*&nbsp;20���ַ�����</font>
        
  <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">�����ʸ�
  
    <%
    gl=rs("gl")
    if gl="��" then
    %>
        <td height="11" width="433"><input type=radio name="gl" value="��" checked>��������Ա&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name="gl" value="��">��ͨ����Ա
    <%   
    else
    %>
        <td height="11" width="433"><input type=radio name="gl" value="��">��������Ա&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name="gl" value="��" checked>��ͨ����Ա
    <%
    end if
    %>

      
  </table>
    <center>
  <font face="����" color="#FF00FF">��*�ŵı���</font><p>
  <input type=submit value="�ύ">&nbsp;&nbsp;&nbsp; <input type=reset value="���">
  </center>
    </form>
   </body>
</html>


     <%
end if
%>