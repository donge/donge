<%

  if Session.Contents("gws")<>true then
 %>
<!--#include file="gly.asp"-->
<%  
else
%>

<html>
 <head>
  <title>¼�����ϵͳ</title>
  </head>
 <body topmargin=0 leftmargin=0 rightmargin=0 bgcolor="#fef4d9">
    <p>
  <center><font face="�����п�" size="6" color="#FF0000"><b>����ϵ������Ա</b></font></center>
 <form action=sjin.asp method=post>
  <center>
  <table width=551 cellpadding=4 cellspacing=1 bgcolor=#ff0000 align=center height="247">
     <tr bgcolor=#FFcccc>
    <td align=center width=100 height="1">��¼��
    <td height="1" width="432"><input type=text name="bh" size=20 maxlength=20 class=i>&nbsp;&nbsp;<cite><font size="2">*&nbsp;20���ַ����� 
    </font></cite>
  
   
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="2">����
    <td height="2" width="432"><input type=text name="xm" size=10 maxlength=20 class=i>&nbsp;&nbsp;<font size="2">*&nbsp;������5������</font>
   <tr bgcolor=#FFcccc>
       <td align=center width=100 height="1">�Ա�
    <td height="1" width="432"><input type=radio name="xb" value="��" checked>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name="xb" value="Ů">Ů
        
            
     <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">����
            <td height="19" width="432"><input type=text name="bm" size=30 maxlength=30 class=i value=""><font size="2">&nbsp;&nbsp;*&nbsp;������15������</font>
  
    <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">ְ��
    <td height="19" width="432"><input type=text name="zw" size=20 maxlength=20 class=i value=""><font size="2">&nbsp;&nbsp;*&nbsp;������10������</font>
    
         
  <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">����
        <td height="19" width="432"><input type=text name="mm" size=20 maxlength=20 class=i value=""><font size="2">&nbsp;&nbsp;*&nbsp;20���ַ�����</font>
        
        
  <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">�����ʸ�
    <td height="1" width="432"><input type=radio name="gl" value="��">��������Ա&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name="gl" value="��" checked>��ͨ����Ա
  
   
   
   
   
   
   
   
   
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