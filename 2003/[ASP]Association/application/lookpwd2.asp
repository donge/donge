<!--#include file="Conn.asp"-->
<%
userid=trim(Request("userid"))
'判断接受的帐号是否符合要求
if userid="" then 
  Response.Write "<script language=JavaScript>{window.alert('登录帐号不得为空!');window.history.go(-1);}</script>"
end if
if instr(1,userid,",")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('登录帐号不得包含逗号!');window.history.go(-1);}</script>"
end if
if instr(1,userid,"'")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('登录帐号不得包含单引号!');window.history.go(-1);}</script>"
end if


'判断帐号及密码是否正确 
 set recCheckUser=server.CreateObject("ADODB.recordset")
 uid=trim(Request("userid"))
 strSQL="select * from userinfo where txtId='" & uid & "' "
 recCheckUser.Open  strSQL,conn,1,1
 
  if not recCheckUser.EOF then
 	'如果用户帐号及密码正确
   	else
		'用户帐号及密码不正确
  		recCheckUser.Close 
  		set recCheckUser=nothing
  		set conn=nothing
		Response.Write "<script language=JavaScript>{window.alert('您输入的帐号错误，请重新输入!');window.history.go(-1);}</script>"

	end if%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 4.0">
<link rel="stylesheet" href="../css/putong_1t">
<script language="javascript" src="../share/fun_script.js"></script>
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
	<script language="javascript">
	<!--//
	function checksignup() {
		if ( document.formSignUp.pwdanswer.value == '' ) 
		{
			window.alert('请输入问题答案!!');
			document.formSignUp.pwdanswer.focus();
			return false;
		}
		return true;
	}

	//-->
	</script>
<title></title>
</HEAD>
<BODY >
<form ACTION="lookpwdok.asp" METHOD="POST" NAME="formSignUp"> 
<input type=hidden name=txtid value=<%=recCheckUser("txtid")%>>
<div id="proc" name="proc">		
</div>	             
<div align="center">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" width="300"  height="180">
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
                      <td width="36%" height="27" style="font-size: 14px" align="right">          
                      提问问题：          
                      </td>         
                      <td width="64%" height="27"><font color="#FF0000"><%=recCheckUser("txtQuestion") %></font>        
                      </td>         
                    </tr>         
                    <tr>         
                      <td width="36%" height="27" align="right" style="font-size: 14px">        
                        问题答案：</td>         
  <center>        
                      <td width="64%" height="27">        
                      <input class="editbox1" name="pwdanswer" size="16" style="width: 124; height: 20">          
                      </td>         
                    </tr>         
                    <tr>          
                      <td width="100%" height="51" colspan="2">         
                        <p align="center">         
                        <INPUT class=button1 name=login2  ONCLICK="javascript:return checksignup()"   type=submit value='提 交'> 
                        <INPUT class=button1 name=login  type=reset value='重写'></td>          
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
</form>      
</BODY>              
