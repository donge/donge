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
  <center><font face="�����п�" size="6" color="#FF0000"><b>����ѧ����¼</b></font></center>
  <form action=in1.asp method=post>
  <center>
  <table width=551 cellpadding=4 cellspacing=1 bgcolor=#ff0000 align=center height="247">
 
     <tr bgcolor=#FFcccc>
    <td align=center width=100 height="1">ѧ��
    <td height="1" width="432"><input type=text name="xh" size=20 maxlength=20 class=i>&nbsp;&nbsp;<cite><font size="2">*&nbsp;20���ַ����� 
    </font></cite>
  
      <tr bgcolor=#FFcccc>
    <td align=center width=100 height="2">����
    <td height="2" width="432"><input type=text name="xm" size=10 maxlength=20 class=i>&nbsp;&nbsp;<font size="2">*&nbsp;������5������</font>
   <tr bgcolor=#FFcccc>
       <td align=center width=100 height="1">�Ա�
    <td height="1" width="432"><input type=radio name="xb" value="��" checked>����&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name="xb" value="Ů">Ů��
      
     <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">���Ż�רҵ
            <td height="19" width="432"><input type=text name="s" size=20 maxlength=20 class=i value=""><font size="2">*&nbsp;������10������</font>
  
    <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">�༶����
    <td height="19" width="432"><input type=text name="zybj" size=30 maxlength=30 class=i value=""><font size="2">*&nbsp;������15������</font>
    
         
  <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">��������
        <td height="19" width="432"><input type=text name="csrq" size=10 maxlength=10 class=i value=""> <font size="2">��ʽ��93-01-02��1993-01-02</font>
        
        
  <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">��ͥסַ
    <td height="19" width="432"><input type=text name="jtdz" size=40 maxlength=40 class=i value=""> <font size="2">25����������</font>
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="8">��ϵ�绰
        <td height="8" width="432"><input type=text name="lxdh" size=20 maxlength=20 class=i value=""> <font size="2">���20���ַ�</font>
   
    <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">����
        <td height="19" width="432"><input type=text name="xsmm" size=20 maxlength=20 class=i value=""><font size="2">���20���ַ�(ȱʡΪ��gws)</font>
  
   
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">��ѧʱ��
            <td height="19" width="432"><input type=text name="rxsj" size=10 maxlength=10 class=i value=""><font size="2">��ʽ��99-01-02��1999-01-02</font>
  
        
    
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">������ò
        <td height="19" width="432"><input type=text name="zzmm" size=20 maxlength=20 class=i value=""><font size="2">���10������</font>
 
   
   
    <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">��ҵʱ��
    <td height="19" width="432"><input type=text name="bysj" size=10 maxlength=10 class=i value=""><font size="2">��ʽ��03-01-02��2003-01-02</font>
    
    
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="8">��ҵ֤���
        <td height="8" width="432"><input type=text name="byzs" size=30 maxlength=30 class=i value=""> <font size="2">���30���ַ�</font>
   
   
    <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">����
    <td height="19" width="432"><input type=text name="jg" size=30 maxlength=30 class=i value=""> <font size="2">15����������</font>
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="8">ѧλ
    <td height="8" width="432"><input type=text name="sw" size=20 maxlength=20 class=i value=""> <font size="2">10����������</font>
   
   

   
    <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">����
    <td height="19" width="432"><input type=text name="jl" size=58 maxlength=255 class=i value=""> <font size="2"><br>110����������</font>
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="8">����
    <td height="8" width="432"><input type=text name="cf" size=58 maxlength=255 class=i value=""> <font size="2"><br>110����������</font>
   
   

   
   
    <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">��ע1
    <td height="19" width="432"><input type=text name="bz1" size=30 maxlength=30 class=i value=""> <font size="2">15����������</font>
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="8">��ע2
    <td height="8" width="432"><input type=text name="bz2" size=30 maxlength=30 class=i value=""> <font size="2">15����������</font>
   
   
   
   
   
   
   
   
   
   
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