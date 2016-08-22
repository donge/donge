
<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/checked.asp"-->
<!--#include file="asp/keepformat.asp"-->
<!--#include file="js/html.inc"-->


<html>
<head>
<title>发送短消息</title>
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
          <p><b><font size="4">发送手机短消息<br>
            <font size="3">(<font color="#FF0000">试用版不提供此项功能！！</font>) </font></font></b></p>
        </div>
          
        <p align="left" class="unnamed1"><font color="#FF0000">*</font><font color="#666666">接手者手机为多个手机号码时请用“，”隔开，最多可同时发送255个手机号码；<br>
          </font><font color="#FF0000">*</font><font color="#666666">短消息内容最多不超过70个中文字；</font></p>
        
      </td>
    </tr>
    <tr> 
      <td width="22%" bgcolor="#F5F5F5" height="30">接收者手机：</td>
      <td width="78%" bgcolor="#FFFFFF" height="30"> 
        <input type="text" name="r-mobile" size="50">
      </td>
    </tr>
    <tr> 
      <td width="22%" bgcolor="#F5F5F5" height="30">接收者手机： </td>
      <td width="78%" bgcolor="#FFFFFF" height="30"> 
        <input type="text" name="s-mobile">
      </td>
    </tr>
    <tr> 
      <td width="22%" bgcolor="#F5F5F5" valign="top">短消息内容:</td>
      <td width="78%" bgcolor="#FFFFFF" height="30"> 
        <textarea name="smstext" cols="50" rows="6"></textarea>
      </td>
    </tr>
    <tr bgcolor="#EEEEEE"> 
      <td colspan="2"> 
        <div align="center"> 
          <input type="submit" name="Submit" value=" 发 送 ">
          <font color="#EEEEEE">-- </font> 
          <input type="reset" name="Submit2" value=" 重 来 ">
        </div>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</form>
</body>
</html>


