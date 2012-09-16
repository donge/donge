<!--#include file="Conn.asp"-->
<%
txtid=Request("txtid")
pwdanswer=trim(request("pwdanswer"))

 set recCheckUser=server.CreateObject("ADODB.recordset")
 strSQL="select * from userinfo where txtId='" & txtid & "' "
 recCheckUser.Open  strSQL,conn,1,1

 if recCheckUser("txtAnswer")=pwdanswer then
 
 else
   		recCheckUser.Close 
  		set recCheckUser=nothing
  		set conn=nothing
		Response.Write "<script language=JavaScript>{window.alert('您输入的问题答案错误，请重新输入!');window.history.go(-1);}</script>"
 end if
%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 4.0">

<STYLE TYPE="text/css">
<!--
td.grzmRow
{
	padding:0px 4px 0px 4px;	  
}
td.grzmList
{
	padding:0px 4px 0px 0px;	  
}
body
{
	background-color:#F7EBDE;
}
-->
</style>
<title>个人桌面</title>
</HEAD>
<BODY oncontextmenu=self.event.returnValue=false>
<div id="proc" name="proc">		
</div>	             
<div class="TitleBar">             
</div>             
<div align="center">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" width="300" height="180">
    <tr>
      <td>
        <div align="center">
          <table border="0" cellpadding="0" cellspacing="0" width="298" height="178" >
            <tr>
              <td valign="top">
                <div align="center">
                  <table border="0" cellpadding="0" cellspacing="4" width="100%" height="55">
                    <tr>
                      <td width="100%" height="39" colspan="2">
                        <p align="center"></td>
                    </tr>
  </center>         
                    <tr>         
                      <td width="36%" height="27" align="right" style="font-size: 14px">        
                        您的密码是：</td>         
  <center>        
                      <td width="64%" height="27">  <font color="#FF0000"><%=recCheckUser("txtpass")%></font>      
                      </td>         
                    </tr>         
                    <tr>          
                      <td width="100%" height="51" colspan="2">         
                        <p align="center">         
                        &nbsp;            
                        <INPUT class=button1 name=login2 onclick=" window.location='lookpwd.asp'"  type=button value='返 回'>    
                      </td>             
                    </tr>             
                  </table>             
                </div>             
              </center>             
              </td>             
            </tr>             
          </table>             
        </div>             
      </td>             
    </tr>             
  </table>             
</div>                 
</BODY>                 
