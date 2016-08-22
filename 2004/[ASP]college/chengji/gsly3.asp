<!--#include file="conn.asp"-->

<%
 xh=request("xh")
 
  
%>

<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">



  


     <center>

    <font size="4" color="#FF0000">输入管理员代码</font>　</p>
    <p>
    <div align="center">
      </center>



<form action=gsly6.asp method=post>


       <input type=hidden name="xh"value="<%=xh%>">    

  <table width=406 cellpadding=4 cellspacing=1 bgcolor=#ff0000 align=center height="20">
     <tr bgcolor=#FFcccc>
    <td align=center width=100 height="1">管理员代码
    <td height="1" width="287"><input type=text name="zybj" size=20 maxlength=20 class=i>&nbsp;&nbsp;<font size="2">*&nbsp;20个字符以内 
    </font>
   </table>
   <br>
   <center>
   
   管理员代码：管理员分系级和班级<br>系级管理员代码请输：0　数字零<br>班级管理员代码请输班级的名称<br>
   <input type=submit value="提交">&nbsp;&nbsp;&nbsp; <input type=reset value="清除">
  </center>
    </form>
    <center>
<br>
      <a href="lyfind0.asp?xh=<%=xh%>"><font face="隶书" size="4" color="#FF0000">返回查看留言</font></a></center>

     </center>

    
    
    
    
   </body>
</html>