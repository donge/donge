<%@ codepage ="936" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 3.0">
<link rel="stylesheet" type="text/css" href="link.css">
<title>������</title>
</head>
<body leftmargin="0" topmargin="0" bgcolor="#FFFFFF">
<!--#include file="1.htm" -->
<table width="778" border="0" cellspacing="0" cellpadding="0" bgcolor="eeeeee">
  <tr>
    <td>
      <p>&nbsp;</p>
      <table border="1" width="80%" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF"
bordercolorlight="#000000" bordercolordark="#FFFFFF" align="center">
        <tr> 
          <td width="100%"> <%
user=request.form("user")
olduser=user
user=replace(user,"'","''")
if user="" or len("olduser")>10 then
response.write"����user_name�����Ϲ��� "
response.write"<a href='http://www.zhiyuanit.com/link/apply.asp'>��������</a>"
response.end
end if
set con = Server.CreateObject("ADODB.Connection")%><!-- #include file=1Qw@3E.inc --><%con.open
sql="SELECT * FROM zhenxin_user WHERE user_name='"&user&"'"
Set Rs=con.Execute(sql)
If not(Rs.Bof OR Rs.Eof) then
Response.Write "����user_name�Ѵ��ڡ� "
response.write"<a href='http://www.zhiyuanit.com/link/apply.asp'>��������</a>"
rs.close
con.close
set rs=nothing
set con=nothing
response.end
end if

rs.close
con.close
set rs=nothing
set con=nothing
%> 
            <p>
              <script>
function form_onsubmit(obj)
{
ValidationPassed = true
if(obj.pass1.value=="")
{
alert("������������pass_word��\n")
ValidationPassed = false
return
}
if(obj.pass2.value=="")
{
alert("����������֤pass_word��\n")
ValidationPassed = false
return
}
if(obj.pass2.value!=obj.pass1.value)
{
alert("��ĵ�һ��pass_word��������֤pass_word������ͬ��\n")
ValidationPassed = false
return
}
if(obj.sitename.value=="")
{
alert("��������site_name��\n")
ValidationPassed = false
return
}
if(obj.url.value=="")
{
alert("����������ҳ��ַ��\n")
ValidationPassed = false
return
}
if(obj.url.value=="")
{
alert("��������site_url��\n")
ValidationPassed = false
return
}
return ValidationPassed
}
</script>
            </p>
            <p>&nbsp; </p>
            <table align="center" cellspacing="0" cellpadding="0" border="0">
              <tr> 
                <td></td>
              </tr>
              <tr> 
                <td> 
                  <form name="apply" action="applaycheck.asp" method="POST" onSubmit="return ValidationPassed">
                    <p><span class="stedit">user_name�ǣ�<font color="#FF0000"> <%=server.htmlencode(olduser)%></font></span><br>
                      <span class="stedit">����e_mail�� 
                      <input name="mail" size="15" class="stedit" maxlength="30">
                      </span>�����30���ַ���<span class="stedit"></span><br>
                      <span class="stedit"> site_type�� 
                      <select name="fenlei" size="1" class="stslt">
                        <option value="1" selected>�ۺ��Ż�</option>
                        <option value="2">���ҵ���</option>
                        <option value="3">��������</option>
                        <option value="4">��������</option>
                        <option value="5">��������</option>
                        <option value="6">���Ÿ���</option>
                        <option value="7">������Ѷ</option>
                        <option value="8">�Ļ�����</option>
                        <option value="9">��ѧ����</option>
                        <option value="10">��Ϸ����</option>
                        <option value="11">��������</option>
                        <option value="12">���̾���</option>
                        <option value="13">����Ͷ��</option>
                        <option value="14">����ý��</option>
                        <option value="15">��н���</option>
                        <option value="16">Ů�����</option>
                        <option value="17">��������</option>
                        <option value="18">�������</option>
                      </select>
                      </span> <br>
                      <span class="stedit">���pass_word�� 
                      <input name="pass1" size="10" class="stedit" type="password" maxlength="10">
                      </span> �����10���ַ���<span class="stedit"><br>
                      </span><span class="stedit">Ч��pass_word�� 
                      <input name="pass2" type="password" size="10" class="stedit" maxlength="10">
                      </span> �����10���ַ���<br>
                      <span class="stedit">site_name�� 
                      <input 
name="sitename" size="16" class="stedit" maxlength="8">
                      </span> �����8�����֣�<br>
                      <span class="stedit">��ҳ��ַ�� 
                      <input name="url" size="30" class="stedit" maxlength="50">
                      </span> �����50���ַ���<br>
                      <span class="stedit">site_about�� 
                      <input type="text" name="jiji" size="50" class="stedit" value="" maxlength="50">
                      </span>�����50�����֣�<br>
                      <span class="stedit">������ɫ�� 
                      <select name='bc' class="stslt">
                        <option style="background-color:ffffff" value="no" selected> 
                        ͸�� </option>
                        <option style="background-color:ffffff" value="ffffff">��ɫ</option>
                        <option style="background-color:ffdddd" value="ffdddd">ǳ��</option>
                        <option style="background-color:ffffdd" value="ffffdd">ǳ��</option>
                        <option style="background-color:ddffdd" value="ddffdd">ǳ��</option>
                        <option style="background-color:ddffff" value="ddffff">ǳ��</option>
                        <option style="background-color:ddddff" value="ddddff">ǳ��</option>
                        <option style="background-color:ffddff" value="ffddff">ǳ��</option>
                      </select>
                      </span></p>
                    <p><span class="stedit">ѡ����������ʽ��</span></p>
                    <table width="100" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td colspan="2"> 
                          <p>
                            <input type="radio" value="1" name="R1" checked>
                            <span class="stedit">��ʽ1</span></p>
                          <table width="500" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td> 
                                <table width='30%' border='0' cellpadding='0' cellspacing='0' bordercolordark='#FFFFFF'>
                                  <tr> 
                                    <td width='15' height='15' bgcolor='#000000'><a href='http://www.zhiyuanit.com/link' target='_blank'><img src='images/xin.gif' width='15' height='15' border='0'></a></td>
                                    <td valign='bottom' bgcolor='#000000'><font  style='font-size: 9pt'>&nbsp;<a href='http://www.zhiyuanit.com/link' style='color: rgb(255,255,255); text-decoration: none'><font color="#FFFFFF">������</font></a><font color="#FFFFFF"> 
                                      - 1234567890</font></font></td>
                                    <td width='15' height='15'><img src='images/blank.gif' width='15' height='15'></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolorlight="#000000" bordercolordark="#FFFFFF">
                                  <tr> 
                                    <td> 
                                      <div align="center"><b><font color="#FF0000">�շѹ��λ</font></b></div>
                                    </td>
                                    <td> 
                                      <div align="center"><b><font color="#FF0000">�շѹ��λ</font></b></div>
                                    </td>
                                    <td colspan="3">
                                      <div align="center"><b><font color="#FF0000">�շѹ��λ</font></b></div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td width="20%"> 
                                      <div align="center">�������λ</div>
                                    </td>
                                    <td width="20%"> 
                                      <div align="center">�������λ</div>
                                    </td>
                                    <td width="20%"> 
                                      <div align="center">�������λ</div>
                                    </td>
                                    <td width="20%"> 
                                      <div align="center">�������λ</div>
                                    </td>
                                    <td width="20%"> 
                                      <div align="center">�������λ</div>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr> 
                        <td> 
                          <p><span class="stedit">
                            <input type="radio" value="2" name="R1" >
                            <font
    color="#000000">��ʽ2</font></span></p>
                          <table border='0' cellspacing='0' cellpadding='0' width='100'>
                            <tr> 
                              <td> 
                                <table border='0' cellspacing='0' cellpadding='0' width='100%'>
                                  <tr> 
                                    <td bgcolor=000000 width='15' height='15'> 
                                      <p><a href='http://www.zhiyuanit.com/link' target='_blank'><img src='images/xin.gif' width='15' height='15' border='0'></a></p>
                                    </td>
                                    <td bgcolor=000000 valign='bottom'><font  style='font-size: 9pt' color='#ffffff'>&nbsp;1234567890</font></td>
                                    <td width='15' height='15'><img src='images/blank.gif' width='15' height='15'></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <table width="100" border="1" cellspacing="0" cellpadding="0" bordercolorlight="#000000" bordercolordark="#FFFFFF">
                                  <tr> 
                                    <td> 
                                      <div align="center"><b><font color="#FF0000">�շѹ��λ</font></b></div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center"><b><font color="#FF0000">�շѹ��λ</font></b></div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                        </td>
                        <td> 
                          <p><span class="stedit">
                            <input type="radio" value="3" name="R1">
                            <font
    color="#000000">��ʽ3</font></span></p>
                          <table border='0' cellspacing='0' cellpadding='0' width='200'>
                            <tr> 
                              <td> 
                                <table border='0' cellspacing='0' cellpadding='0' width='50%'>
                                  <tr> 
                                    <td bgcolor=000000 width='15' height='15'> 
                                      <p><a href='http://www.zhiyuanit.com/link' target='_blank'><img src='images/xin.gif' width='15' height='15' border='0'></a></p>
                                    </td>
                                    <td bgcolor=000000 valign='bottom'><font  style='font-size: 9pt' color='#ffffff'>&nbsp;1234567890</font></td>
                                    <td width='15' height='15'><img src='images/blank.gif' width='15' height='15'></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolorlight="#000000" bordercolordark="#FFFFFF">
                                  <tr> 
                                    <td> 
                                      <div align="center"><b><font color="#FF0000">�շѹ��λ</font></b></div>
                                    </td>
                                    <td> 
                                      <div align="center"><b><font color="#FF0000">�շѹ��λ</font></b></div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                      <tr> 
                        <td colspan="2">
                          <p>
                            <input type="radio" value="4" name="R1" >
                            ��ʽ4</p>
                          <table border='0' width='600' bordercolorlight='#000000' cellpadding='0' cellspacing='0'>
                            <tr> 
                              <td> 
                                <table width='25%' border='0' cellpadding='0' cellspacing='0' bordercolordark='#FFFFFF'>
                                  <tr> 
                                    <td width='15' height='15' bgcolor='#000000'><a href='http://www.zhiyuanit.com/link' target='_blank'><img src='images/xin.gif' width='15' height='15' border='0'></a></td>
                                    <td valign='bottom' bgcolor='#000000'><font style="font-size: 9pt" color="#FFFFFF">&nbsp;<a href='http://www.zhiyuanit.com/link/' style='color: rgb(255,255,255); text-decoration: none'>������</a> 
                                      - 1234567890</font></td>
                                    <td width='15' height='15'><img src='images/blank.gif' width='15' height='15'></td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                            <tr> 
                              <td> 
                                <table width="100%" border="1" cellspacing="0" cellpadding="0" bordercolorlight="#000000" bordercolordark="#FFFFFF">
                                  <tr> 
                                    <td width="15%"> 
                                      <div align="center"><b><font color="#FF0000">�շѹ��λ</font></b></div>
                                    </td>
                                    <td width="15%"> 
                                      <div align="center">�������λ</div>
                                    </td>
                                    <td width="15%"> 
                                      <div align="center">�������λ</div>
                                    </td>
                                    <td width="15%"> 
                                      <div align="center">�������λ</div>
                                    </td>
                                    <td width="15%"> 
                                      <div align="center">�������λ</div>
                                    </td>
                                    <td width="15%"> 
                                      <div align="center">�������λ</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center"><b><font color="#FF0000">�շѹ��λ</font></b></div>
                                    </td>
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                    <td> 
                                      <div align="center">�������λ</div>
                                    </td>
                                  </tr>
                                </table>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                    <p align="center"> 
                      <input type="submit" value="�������" class="stbtm" onClick="form_onsubmit(this.form)" name="submit">
                      <input type=hidden name=user value="<%=server.htmlencode(olduser)%>">
                    </p>
                    </form>
                </td>
              </tr>
              <tr> 
                <td></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      
    <p>&nbsp;</p></td>
  </tr>
</table>
<!--#include file="2.htm" --> 
<p><br>
</body>
</html>




