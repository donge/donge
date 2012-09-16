<!--#include file="newsconn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>真心链</title>
<link rel="stylesheet" type="text/css" href="link.css">
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0">
<!--#include file="1.htm" -->
<table width="778" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td> 
      <form method="POST" action="savenews.asp">
        <div align="center"> 
          <center>
            <p>&nbsp;</p>
            <p>真心链站长新闻发布</p>
            <table border="1" cellspacing="0" width="500" cellpadding="3" bgcolor="#FFFFFF" bordercolorlight="#000000" bordercolordark="#FFFFFF">
              <tr> 
                <td width="60" bgcolor="eeeeee">新闻标题：</td>
                <td colspan="3"> 
                  <input type="text" name="txttitle" size="50"
          class="stedit" maxlength="25">
                </td>
              </tr>
              <tr> 
                <td width="60" bgcolor="eeeeee">站长姓名：</td>
                <td width="100"> 
                  <input type="text" name="txtname" size="15"
          class="stedit" maxlength="15">
                </td>
                <td width="60" bgcolor="eeeeee">站长e_mail：</td>
                <td width="200"> 
                  <input type="text" name="txtmail" size="20"
          class="stedit" maxlength="30">
                </td>
              </tr>
              <tr> 
                <td width="60" bgcolor="eeeeee">site_name：</td>
                <td width="100"> 
                  <input type="text" name="txtsite" size="15"
          class="stedit" maxlength="15">
                </td>
                <td width="60" bgcolor="eeeeee">site_url：</td>
                <td width="200"> 
                  <input type="text" name="txtlink" size="20"
          class="stedit" maxlength="50">
                </td>
              </tr>
              <tr> 
                <td valign="top" width="60" bgcolor="eeeeee">新闻内容：</td>
                <td colspan="3"> 
                  <p> 
                    <textarea rows="10" name="txtnews" cols="50" class="stedit"></textarea>
                    <br>
                    <font color="#FF0000">支持HTML</font> 
                    <input type="checkbox" name="checkbox" value="on">
                  </p>
                  </td>
              </tr>
              <tr> 
                <td align="right" valign="top" width="60" bgcolor="eeeeee"></td>
                <td colspan="3"></td>
              </tr>
            </table>
          </center>
        </div>
        <div align="center"> 
          <center>
            <p> 
              <input type="submit" value=" 添 加 "
  name="cmdok" class="stbtm">
              &nbsp; 
              <input type="reset" value=" 清 除 "
  name="cmdcancel" class="stbtm">
            </p>
          </center>
        </div>
      </form>
    </td>
  </tr>
</table>
<!--#include file="2.htm" --> 
</body>
</html>
