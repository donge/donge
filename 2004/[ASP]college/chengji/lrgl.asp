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
  <center><font face="华文行楷" size="6" color="#FF0000"><b>增加学生记录</b></font></center>
  <form action=in1.asp method=post>
  <center>
  <table width=551 cellpadding=4 cellspacing=1 bgcolor=#ff0000 align=center height="247">
 
     <tr bgcolor=#FFcccc>
    <td align=center width=100 height="1">学号
    <td height="1" width="432"><input type=text name="xh" size=20 maxlength=20 class=i>&nbsp;&nbsp;<cite><font size="2">*&nbsp;20个字符以内 
    </font></cite>
  
      <tr bgcolor=#FFcccc>
    <td align=center width=100 height="2">姓名
    <td height="2" width="432"><input type=text name="xm" size=10 maxlength=20 class=i>&nbsp;&nbsp;<font size="2">*&nbsp;不大于5个汉字</font>
   <tr bgcolor=#FFcccc>
       <td align=center width=100 height="1">性别
    <td height="1" width="432"><input type=radio name="xb" value="男" checked>男生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name="xb" value="女">女生
      
     <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">部门或专业
            <td height="19" width="432"><input type=text name="s" size=20 maxlength=20 class=i value=""><font size="2">*&nbsp;不大于10个汉字</font>
  
    <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">班级名称
    <td height="19" width="432"><input type=text name="zybj" size=30 maxlength=30 class=i value=""><font size="2">*&nbsp;不大于15个汉字</font>
    
         
  <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">出生日期
        <td height="19" width="432"><input type=text name="csrq" size=10 maxlength=10 class=i value=""> <font size="2">格式：93-01-02或1993-01-02</font>
        
        
  <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">家庭住址
    <td height="19" width="432"><input type=text name="jtdz" size=40 maxlength=40 class=i value=""> <font size="2">25个汉字以内</font>
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="8">联系电话
        <td height="8" width="432"><input type=text name="lxdh" size=20 maxlength=20 class=i value=""> <font size="2">最多20个字符</font>
   
    <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">密码
        <td height="19" width="432"><input type=text name="xsmm" size=20 maxlength=20 class=i value=""><font size="2">最多20个字符(缺省为：gws)</font>
  
   
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">入学时间
            <td height="19" width="432"><input type=text name="rxsj" size=10 maxlength=10 class=i value=""><font size="2">格式：99-01-02或1999-01-02</font>
  
        
    
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">政治面貌
        <td height="19" width="432"><input type=text name="zzmm" size=20 maxlength=20 class=i value=""><font size="2">最多10个汉字</font>
 
   
   
    <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">毕业时间
    <td height="19" width="432"><input type=text name="bysj" size=10 maxlength=10 class=i value=""><font size="2">格式：03-01-02或2003-01-02</font>
    
    
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="8">毕业证书号
        <td height="8" width="432"><input type=text name="byzs" size=30 maxlength=30 class=i value=""> <font size="2">最多30个字符</font>
   
   
    <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">籍贯
    <td height="19" width="432"><input type=text name="jg" size=30 maxlength=30 class=i value=""> <font size="2">15个汉字以内</font>
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="8">学位
    <td height="8" width="432"><input type=text name="sw" size=20 maxlength=20 class=i value=""> <font size="2">10个汉字以内</font>
   
   

   
    <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">奖励
    <td height="19" width="432"><input type=text name="jl" size=58 maxlength=255 class=i value=""> <font size="2"><br>110个汉字以内</font>
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="8">处分
    <td height="8" width="432"><input type=text name="cf" size=58 maxlength=255 class=i value=""> <font size="2"><br>110个汉字以内</font>
   
   

   
   
    <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">备注1
    <td height="19" width="432"><input type=text name="bz1" size=30 maxlength=30 class=i value=""> <font size="2">15个汉字以内</font>
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="8">备注2
    <td height="8" width="432"><input type=text name="bz2" size=30 maxlength=30 class=i value=""> <font size="2">15个汉字以内</font>
   
   
   
   
   
   
   
   
   
   
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