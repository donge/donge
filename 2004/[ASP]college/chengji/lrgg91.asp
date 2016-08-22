<%
 xh=request("xh")
 sxh=request("sxh")

thistime=Timer

%>





<html>
 <head>
  <title>留言</title>
  </head>
 <body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">
    <p>
    
 
  <center><font face="华文行楷" size="5" color="#FF0000">给<font face="华文行楷" size="5" color="#FF00ff"><%=sxh%></font>班主任留言</font></b></center>
  


  
  
  
  
  
  
  
 <form action=in9.asp method=post>
  <center>
  <table width=443 cellpadding=4 cellspacing=1 bgcolor=#ff0000 align=center height="42">
   
   
   
  <input type=hidden name="bh"value="<%=thistime%>">    

    <input type=hidden name="xh"value="<%=xh%>">    

      <input type=hidden name="sxh"value="<%=sxh%>">    

  <tr bgcolor=#FFcccc>

      <td align=center width=39 height="19">留言<br>内容
      <td height="19" width="375" align="center">
      <p align="center">
      <font size="2">
      <textarea wrap="off" rows="6" name="nr" cols="50"></textarea>
      <br>*最多120个汉字</font></center>
  

      </td>
</tr>
  </table>
  
     <center>
    <input type=submit value="提交">&nbsp;&nbsp;&nbsp; <input type=reset value="清除">
  </center>
    </form>
    
    
    <center>

      <a href="lyfind0.asp?xh=<%=xh%>"><font face="隶书" size="4" color="#FF0000">返回查看留言</font></a></center>

     </center>

 
    
    
    
    
    
   </body>
</html>