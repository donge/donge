<%

  if Session.Contents("gws")<>true then
 %>
<!--#include file="gly.asp"-->
<%  
else
%>

<html>
 <head>
  <title>录入管理系统</title>
  </head>
 <body topmargin=0 leftmargin=0 rightmargin=0 bgcolor="#fef4d9">
    <p>
  <center><font face="华文行楷" size="6" color="#FF0000"><b>增加系级管理员</b></font></center>
 <form action=sjin.asp method=post>
  <center>
  <table width=551 cellpadding=4 cellspacing=1 bgcolor=#ff0000 align=center height="247">
     <tr bgcolor=#FFcccc>
    <td align=center width=100 height="1">登录号
    <td height="1" width="432"><input type=text name="bh" size=20 maxlength=20 class=i>&nbsp;&nbsp;<cite><font size="2">*&nbsp;20个字符以内 
    </font></cite>
  
   
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="2">姓名
    <td height="2" width="432"><input type=text name="xm" size=10 maxlength=20 class=i>&nbsp;&nbsp;<font size="2">*&nbsp;不大于5个汉字</font>
   <tr bgcolor=#FFcccc>
       <td align=center width=100 height="1">性别
    <td height="1" width="432"><input type=radio name="xb" value="男" checked>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name="xb" value="女">女
        
            
     <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">部门
            <td height="19" width="432"><input type=text name="bm" size=30 maxlength=30 class=i value=""><font size="2">&nbsp;&nbsp;*&nbsp;不大于15个汉字</font>
  
    <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">职务
    <td height="19" width="432"><input type=text name="zw" size=20 maxlength=20 class=i value=""><font size="2">&nbsp;&nbsp;*&nbsp;不大于10个汉字</font>
    
         
  <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">密码
        <td height="19" width="432"><input type=text name="mm" size=20 maxlength=20 class=i value=""><font size="2">&nbsp;&nbsp;*&nbsp;20个字符以内</font>
        
        
  <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">管理资格
    <td height="1" width="432"><input type=radio name="gl" value="是">超级管理员&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name="gl" value="否" checked>普通管理员
  
   
   
   
   
   
   
   
   
  </table>
    <center>
  <font face="隶书" color="#FF00FF">有*号的必填</font><p>
  <input type=submit value="提交">&nbsp;&nbsp;&nbsp; <input type=reset value="清除">
  </center>
    </form>
   </body>
</html>

     <%
end if
%>