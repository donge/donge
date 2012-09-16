<%@ LANGUAGE="VBSCRIPT" %>
<%
if request.cookies("adminok")="" then
  response.redirect "login.htm"
end if
%>
<html>
<head>
<title>后台管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body  text="#000000">
      <div align="center"><br>
        <p>　</p>
        <p><br>
        <center>
        </p>
    <TABLE cellSpacing=1 cellPadding=4 width=558 bgColor=#416327 height="144">
      <TBODY>
        <TR vAlign=top bgColor=#e1f0ff> 
          <TD class=main1 colSpan=3 width="512" height="10" bgcolor="#006500"></TD>
        </TR>
        <TR vAlign=top bgColor=#e1f0ff> 
          <TD class=main1 colSpan=3 width="512" height="32" bgcolor="#FFFFFF"><font color="#0000FF">系统后台管理</font><font color="#0000FF">----</font></TD>
        </TR>
      <center>
        <tr> 
          <TD class=main1 width=102 bgColor=#398A00 height=75 align="right" rowspan="3"><font color="#FFFFFF">会员管理：</font></TD>
      </center>
        </center>
          <TD class=main1 width=193 height=25 bgcolor="#DAE9D1" align="center">
            <p align="left">&nbsp; 
            </p> 
          </TD> 
          <TD class=main1 width=248 height=25 bgcolor="#DAE9D1" align="center"> 
            <p align="left">　</p>
          </TD>
        </tr>
        <center>
        
      <center>
        <tr> 
      </center>
          <TD class=main1 width=193 height=25 bgcolor="#F6F6F6" align="center">
            <p align="left"><input type="button" value="非正式会员列表" onclick=" window.location='user0info.asp'"  style="font-family: 新细明体, 宋体, Arial; CURSOR: hand; font-size: 9pt; height:20px;background-color:#D4D0C8;" onMouseOver ="this.style.backgroundColor='#FFC864'" onMouseOut ="this.style.backgroundColor='#D4D0C8'"> 
            </p>
          </TD>
          <TD class=main1 width=248 height=25 bgcolor="#F6F6F6" align="center">
            <p align="left"><input type="button" value="普通会员列表" onclick=" window.location='user1info.asp'"  style="font-family: 新细明体, 宋体, Arial; CURSOR: hand; font-size: 9pt; height:20px;background-color:#D4D0C8;" onMouseOver ="this.style.backgroundColor='#FFC864'" onMouseOut ="this.style.backgroundColor='#D4D0C8'"><input type="button" value="VIP会员列表" onclick=" window.location='user2info.asp'"  style="font-family: 新细明体, 宋体, Arial; CURSOR: hand; font-size: 9pt; height:20px;background-color:#D4D0C8;" onMouseOver ="this.style.backgroundColor='#FFC864'" onMouseOut ="this.style.backgroundColor='#D4D0C8'"> 
            </p>
          </TD>
        </tr>
        <center>
        
      <center>
        <tr> 
          <TD class=main1 width=193 height=25 bgcolor="#DAE9D1" align="center"> 
            　 
          </TD>
      </center>
          <TD class=main1 width=248 height=25 bgcolor="#DAE9D1" align="center">
            <p align="left">　 
            </p>
          </TD>
        </tr>
        <center>
        
        <center>

      <center>
        <tr> 
          <TD class=main1 width=543 height=5 align="right" colspan="3"></TD>
        </tr>
      </center>  
        <center>
        
        <center>
        
        <center>
        
        <center>
        
      <center>
      </center>  
        <center>
        
        <center>
        
        <center>
        
        <center>
        
      <center>
<center>  
      <TR bgColor=#e1f0ff>   
        <TD class=main1 colSpan=3 width="512" height="27" bgcolor="#DAE9D1"> 　   
        </TD>  
      </TR>  
      <TR bgColor=#e1f0ff>   
        <TD class=main1 colSpan=3 width="512" height="4" bgcolor="#398A00"></TD>  
      </TR></TBODY>  
    </TABLE>  
  </div>     
      <p align="center">  
 
</center>  
  
      </center>  
  
</body>  
</html>  
  
