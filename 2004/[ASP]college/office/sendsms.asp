
<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/checked.asp"-->
<!--#include file="asp/keepformat.asp"-->
<!--#include file="js/html.inc"-->


<html>
<head>
<title>���Ͷ���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="9pp.css" type="text/css">
</head>

<body bgcolor="#EBEBEB" text="#000000" leftmargin="0" topmargin="0">
<table width="100%" border="0" cellspacing="0">
  <tr>
    <td bgcolor="3F6090"> <font color="3F6090">-</font></td>
  </tr>
</table>
<form name="form1" method="post" action="sendsms.asp">
  <table width="520" border="0" cellspacing="1" align="center" cellpadding="5">
    <tr> 
      <td colspan="2" bgcolor="#EEEEEE" height="40"> 
        <div align="center"> 
          <p><b><font size="4">�����ֻ�����Ϣ<br>
            <font size="3">(<font color="#FF0000">���ð治�ṩ����ܣ���</font>) </font></font></b></p>
        </div>
          
        <p align="left" class="unnamed1"><font color="#FF0000">*</font><font color="#666666">�������ֻ�Ϊ����ֻ�����ʱ���á���������������ͬʱ����255���ֻ����룻<br>
          </font><font color="#FF0000">*</font><font color="#666666">����Ϣ������಻����70�������֣�</font></p>
        
      </td>
    </tr>
    <tr> 
      <td width="22%" bgcolor="#F5F5F5" height="30">�������ֻ���</td>
      <td width="78%" bgcolor="#FFFFFF" height="30"> 
        <input type="text" name="r-mobile" size="50">
      </td>
    </tr>
    <tr> 
      <td width="22%" bgcolor="#F5F5F5" height="30">�������ֻ��� </td>
      <td width="78%" bgcolor="#FFFFFF" height="30"> 
        <input type="text" name="s-mobile">
      </td>
    </tr>
    <tr> 
      <td width="22%" bgcolor="#F5F5F5" valign="top">����Ϣ����:</td>
      <td width="78%" bgcolor="#FFFFFF" height="30"> 
        <textarea name="smstext" cols="50" rows="6"></textarea>
      </td>
    </tr>
    <tr bgcolor="#EEEEEE"> 
      <td colspan="2"> 
        <div align="center"> 
          <input type="submit" name="Submit" value=" �� �� ">
          <font color="#EEEEEE">-- </font> 
          <input type="reset" name="Submit2" value=" �� �� ">
        </div>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</form>
</body>
</html>


