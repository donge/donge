<!--#include file="conn.asp"-->

<%
 xh=request("xh")
 
  
%>

<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">



  


     <center>

    <font size="4" color="#FF0000">������Ҫ����ͬѧ��ѧ��</font>��</p>
    <p>
    <div align="center">
      </center>



<form action=gsly.asp method=post>


       <input type=hidden name="xh"value="<%=xh%>">    

  <table width=406 cellpadding=4 cellspacing=1 bgcolor=#ff0000 align=center height="20">
     <tr bgcolor=#FFcccc>
    <td align=center width=100 height="1">ѧ��
    <td height="1" width="287"><input type=text name="sxh" size=20 maxlength=20 class=i>&nbsp;&nbsp;<font size="2">*&nbsp;20���ַ����� 
    </font>
   </table>
   <br>
   <center>
   <input type=submit value="�ύ">&nbsp;&nbsp;&nbsp; <input type=reset value="���">
  </center>
    </form>
    <center>
<br>
      <a href="lyfind0.asp?xh=<%=xh%>"><font face="����" size="4" color="#FF0000">���ز鿴����</font></a></center>

     </center>

    
    
    
    
   </body>
</html>