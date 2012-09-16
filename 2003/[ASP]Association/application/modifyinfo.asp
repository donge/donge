
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
	<script language="javascript">
	<!--//
	function checksignup() {
		if ( document.formSignUp.userid.value == '' ) 
		{
			window.alert('请输入会员帐号!!');
			document.formSignUp.userid.focus();
			return false;
		}
		
		if ( document.formSignUp.password.value == '' )
		{
			window.alert('请输入密码!!');
			document.formSignUp.password.focus();
			return false;
		}

		return true;
	}

	//-->
	</script>
<title></title>
</HEAD>
<BODY oncontextmenu=self.event.returnValue=false>
<form ACTION="modifyinfo2.asp" METHOD="POST" NAME="formSignUp"> 
<div id="proc" name="proc">		
</div>	             
<div align="center">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" width="300" height="200">
    <tr>
      <td>
        <div align="center">
          <table border="0" cellpadding="0" cellspacing="0" width="298" height="198" >
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
                      会员账号：          
                      </td>         
                      <td width="64%" height="27">          
                      <input class="editbox1" name="userid" size="16" style="width: 124; height: 20">          
                      </td>         
                    </tr>         
                    <tr>         
                      <td width="36%" height="27" align="right">        
                        <p align="right" style="font-size: 14px">密码：</td>         
                      <td width="64%" height="27">        
                        <input class="editbox1" name="password" size="16" style="width: 124; height: 20" type="password"></td>         
                    </tr>         
  <center>        
                    <tr>          
                      <td width="100%" height="51" colspan="2">         
                        <p align="center">         
                        <INPUT class=button1 name=login2  ONCLICK="javascript:return checksignup()"  type=submit value='进 入'> 
                        <INPUT class=button1 name=login   type=reset value='重写'></td>          
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
