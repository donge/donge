<html>
<head>
<title>Computer Association</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style>body,td{FONT-SIZE:9pt}.big{FONT-SIZE:10.5pt}A:link{COLOR: #99CCFF;TEXT-DECORATION: none}A:visited{COLOR: #99CCFF;TEXT-DECORATION: none}A:hover{COLOR: #99FFFF;TEXT-DECORATION: none}</style>
</head>

<body bgcolor="#003366" text="#FFFFFF" leftmargin="20" topmargin="0" marginwidth="20" marginheight="0" link="#FFFF00" vlink="#99FFFF" alink="#99FFFF">
<table width="620" border="0" cellspacing="0" cellpadding="0" align="center" height="27">
  <tr bgcolor="#FFCC33" valign="middle">   
    <td height="27" bgcolor="#336699"> &nbsp;��������ǣ� <%=session("txtLevel")%> </td>   
  </tr>   
</table>
<script language="javascript">
	<!--//
	function checksignup() {
		if ( document.formSignUp.userid.value == '' ) 
		{
			window.alert('�������Ա�ʺ�!!');
			document.formSignUp.userid.focus();
			return false;
		}
		
		if ( document.formSignUp.password.value == '' )
		{
			window.alert('����������!!');
			document.formSignUp.password.focus();
			return false;
		}
		return true;
	}

	//-->
	</script>
	
<table width="620" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="339" width="587" valign="top"> 
      <table width="620" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="5"><img src="../image/transparent.gif" width="15" height="15"></td>
              </tr>
              <tr> 
                <td><img src="../image/ba_service.gif" width="188" height="31"></td>
              </tr>
              <tr> 
                <td><img src="../image/transparent.gif" width="15" height="15"></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td><div align="center"><img src="../image/obj_anime1.gif" width="80" height="50" align="left"> 
              <script language="JavaScript">
var day="";
var month="";
var ampm="";
var ampmhour="";
var myweekday="";
var year="";
mydate=new Date();
myweekday=mydate.getDay();
mymonth=mydate.getMonth();
myday= mydate.getDate();
myyear= mydate.getYear();
myhours=mydate.getHours();
ampmhour=(myhours > 12) ? myhours - 12 : myhours;
if (ampmhour == "0") ampmhour=0;
ampm =(myhours >= 12) ? ' PM' : ' AM';
mytime=mydate.getMinutes();
myminutes =((mytime < 10) ? ':0' : ':') + mytime;
year=(myyear > 200) ? myyear : 1900 + myyear;
if(myweekday == 0)
weekday=" ������ ";
else if(myweekday == 1)
weekday=" ����һ ";
else if(myweekday == 2)
weekday=" ���ڶ� ";
else if(myweekday == 3)
weekday=" ������ ";
else if(myweekday == 4)
weekday=" ������ ";
else if(myweekday == 5)
weekday=" ������ ";
else if(myweekday == 6)
weekday=" ������ ";


</script>
              <font size="3" face="Verdana, Arial, Helvetica, sans-serif"><strong><a href="register_1.asp">Join Now!</a></strong></font></div></td>
        </tr>
      </table>
      <br>
      <img src="../image/line1.gif" width="620" height="10"><br>
       <br>
      <table width="620" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="300"> 
            <table width="300" border="0" cellpadding="2" cellspacing="0">
              <tr> 
                <td colspan="2"> <form ACTION="userlogin.asp" METHOD="POST" NAME="formSignUp">
                    <table width="250" height="150" border="0" align="center" cellspacing="1" bgcolor="#CCFFFF">
                      <tr bgcolor="#003366"> 
                        <td width="39%" height="30"> <div align="center">�û�����</div></td>
                        <td width="61%" height="30"> <div align="center"> 
                            <input type="text" size="15" name="userid">
                          </div></td>
                      </tr>
                      <tr bgcolor="#003366"> 
                        <td width="39%" height="30"> &nbsp;&nbsp; <div align="center">���룺</div></td>
                        <td width="61%" height="30"> <div align="center"> 
                            <input type="Password" size="15" name="password">
                          </div></td>
                      </tr>
                      <tr valign="middle" bgcolor="#003366"> 
                        <td height="30" colspan="2"> <div align="center"> 
                            <input type="submit" name="cmdOk" value="ȷ��" ONCLICK="javascript:return checksignup()">
                            <input type="reset" name="Submit2" value="����">
                          </div></td>
                      </tr>
                    </table>
                  </form></td>
              </tr>
              <tr> 
                <td width="6" height="18"></td>
                <td width="594">&nbsp;</td>
              </tr>
              <tr> 
                <td width="6"><br> <img src="../image/p_1.gif" width="18" height="16"></td>
                <td width="594"><br>
                  <a href="register_1.asp">����ע��</a></td>
              </tr>
              <tr> 
                <td></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td width="6"><img src="../image/p_1.gif" width="18" height="16"></td>
                <td width="594"><a href="modifyinfo.asp">�޸�����</a> <a href="#" onClick="open('lookpwd.asp','��ȡ����','resizable=1,scrollbars=1,status=yes,toolbar=no,location=no,menu=no width=450 height=280')">��������</a></td>
              </tr>
            </table>
          </td>
          <td width="20"><img src="../image/transparent.gif" width="20" height="20"></td>
          <td width="240" valign="top"> 
            <table width="300" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td bgcolor="#CCFFFF"> 
                  <table width="299" border="0" cellspacing="1" cellpadding="3">
                    <tr> 
                      <td width="291" bgcolor="#336699"><b> <table width="100%">
                          
                            <td valign="top"> 
                              <p>&nbsp;</p>
                              <p align="center"><a href="1.ASP">�������κ��˿��Խ���</a></p>
                              <p align="center"><a href="2.ASP">��������ͨ��Ա���Խ���</a></p>
                              <p align="center"><a href="3.ASP">������vip��Ա���Խ���</a></p>
                              <p align="center">&nbsp;</p>
                            </td>
                          </tr>
                        </table>
                        </font>
                        </td>
                    </tr>
                    <tr> 
                      <td bgcolor="#336699"><p>&nbsp;</p>
                        <p align="center">�κ��˿��Կ���Ц���� <img src="images/icon6.gif" width="17" height="17" border="0"></p>
                        <p align="center">��ͨ��Ա���Կ���Ц���� 
                          <%if session("txtLevel")="��ͨ��Ա" then%>
                          <img src="images/icon6.gif" width="17" height="17" border="0"> 
                          <%end if%>
                        </p>
                        <p align="center">VIP��Ա���Կ���Ц���� 
                          <%if session("txtLevel")="vip��Ա" then%>
                          <img src="images/icon6.gif" width="17" height="17" border="0"> 
                          <%end if%>
                        <p>&nbsp;</p></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td width="587" height="2"><img src="../image/transparent.gif" width="467" height="10"></td>
  </tr>
</table>
<table width="620" border="0" cellspacing="0" cellpadding="0" align="center" height="39">
  <tr>   
    <td height="14"></td>   
  </tr>   
  <tr bgcolor="#FFCC33" valign="middle">    
    <td height="25" bgcolor="#336699"> &nbsp;��������ǣ� <%=session("txtLevel")%> </td>   
  </tr>   
</table>
</body>
</html>
