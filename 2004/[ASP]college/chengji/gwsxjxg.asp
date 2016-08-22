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
  <title>系级管理员修改</title>
  </head>
 <body topmargin=0 leftmargin=0 rightmargin=0 bgcolor="#fef4d9">
    <p>
  <center><font face="华文行楷" size="6" color="#FF0000"><b>修改系级管理员</b></font></center>
 <form action=xjxgxs.asp method=post>
  <center>
  <table width=551 cellpadding=4 cellspacing=1 bgcolor=#ff0000 align=center height="247">
      <tr bgcolor=#FFcccc>
       <td align=center width=100 height="1">登录号
       <td height="1" width="432">
       <input type=text name="bh" size=20 maxlength=20 class=i value="<%=rs("bh")%>"><font size="2" color="green">不要更改，</font><font size="2"><font color=#009933>否则可能修改无效</font>或<font color="#009933">修改其它记录</font></font>
     <tr bgcolor=#FFcccc>
    <td align=center width=100 height="2">姓名
    <td height="2" width="432">
    
    
    
   <input type=text name="xm" size=10 maxlength=10 class=i value="<%=rs("xm")%>">*&nbsp;<font size="2">5个汉字以内 
     </font>
        <tr bgcolor=#FFcccc>
       <td align=center width=100 height="19">性别
      <%
    xb=rs("xb")
    if xb="男" then
    %>
        <td height="11" width="433"><input type=radio name="xb" value="男" checked>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name="xb" value="女">女
    <%   
    else
    %>
        <td height="11" width="433"><input type=radio name="xb" value="男">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name="xb" value="女" checked>女
    <%
    end if
    %>
          <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">部门
            <td height="19" width="432">
            
             <input type=text name="bm" size=30 maxlength=30 class=i value="<%=rs("bm")%>"><font size="2">*&nbsp;最多15个汉字</font>

    <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">职务
    <td height="19" width="432">
   
    <input type=text name="zw" size=20 maxlength=20 class=i value="<%=rs("zw")%>"><font size="2">*&nbsp;最多10个汉字</font>
         
  <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">密码
        <td height="19" width="432">
               <input type=text name="mm" size=20 maxlength=20 class=i value="<%=rs("mm")%>"><font size="2">*&nbsp;20个字符以内</font>
        
  <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">管理资格
  
    <%
    gl=rs("gl")
    if gl="是" then
    %>
        <td height="11" width="433"><input type=radio name="gl" value="是" checked>超级管理员&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name="gl" value="否">普通管理员
    <%   
    else
    %>
        <td height="11" width="433"><input type=radio name="gl" value="是">超级管理员&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name="gl" value="否" checked>普通管理员
    <%
    end if
    %>

      
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