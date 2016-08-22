<%

  if Session.Contents("gws")<>true then
 %>
<!--#include file="gly.asp"-->
<%  
else
%>



<html>
 <head>
  <title>录入管理系统公告</title>
  </head>
 <body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">
    <p>
  <center><font face="华文行楷" size="6" color="#FF0000">增加公告</font></b></center>
 <form action=in3.asp method=post>
  <center>
  <table width=743 cellpadding=4 cellspacing=1 bgcolor=#ff0000 align=center height="42">
   <tr bgcolor=#FFcccc>
    <td align=center width=39 height="1">编号
    <td height="1" width="691" align="center">
    <p align="center"><input type=text name="bh" size=20 maxlength=20><cite><font size="2">*最多20个字符（各条公告编号不能相同）</font></td></tr>
    

     <tr bgcolor=#FFcccc>
    <td align=center width=39 height="1">标题
    <td height="1" width="791" align="center">
    <p align="center"><input type=text name="bt" size=52 maxlength=50><cite><font size="2">*最多25个汉字</font></td></tr>
    
  <tr bgcolor=#FFcccc>

      <td align=center width=39 height="19">公告<br>内容      
      <td height="19" width="675" align="center">
      <p align="center">
      <font size="2">
      <textarea wrap="off" rows="15" name="nr" cols="100"></textarea>
      <br>*最多30000个汉字</font></center>
  

      </td>
</tr>
  </table>
  
     <center>
  <font face="隶书" color="#FF00FF">有*号的必填</font><br>
  <input type=submit value="提交">&nbsp;&nbsp;&nbsp; <input type=reset value="清除">
  </center>
    </form>
   </body>
</html>


     <%
end if
%>