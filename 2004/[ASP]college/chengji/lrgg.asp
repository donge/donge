<%

  if Session.Contents("gws")<>true then
 %>
<!--#include file="gly.asp"-->
<%  
else
%>



<html>
 <head>
  <title>¼�����ϵͳ����</title>
  </head>
 <body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">
    <p>
  <center><font face="�����п�" size="6" color="#FF0000">���ӹ���</font></b></center>
 <form action=in3.asp method=post>
  <center>
  <table width=743 cellpadding=4 cellspacing=1 bgcolor=#ff0000 align=center height="42">
   <tr bgcolor=#FFcccc>
    <td align=center width=39 height="1">���
    <td height="1" width="691" align="center">
    <p align="center"><input type=text name="bh" size=20 maxlength=20><cite><font size="2">*���20���ַ������������Ų�����ͬ��</font></td></tr>
    

     <tr bgcolor=#FFcccc>
    <td align=center width=39 height="1">����
    <td height="1" width="791" align="center">
    <p align="center"><input type=text name="bt" size=52 maxlength=50><cite><font size="2">*���25������</font></td></tr>
    
  <tr bgcolor=#FFcccc>

      <td align=center width=39 height="19">����<br>����      
      <td height="19" width="675" align="center">
      <p align="center">
      <font size="2">
      <textarea wrap="off" rows="15" name="nr" cols="100"></textarea>
      <br>*���30000������</font></center>
  

      </td>
</tr>
  </table>
  
     <center>
  <font face="����" color="#FF00FF">��*�ŵı���</font><br>
  <input type=submit value="�ύ">&nbsp;&nbsp;&nbsp; <input type=reset value="���">
  </center>
    </form>
   </body>
</html>


     <%
end if
%>