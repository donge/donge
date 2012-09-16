<%@ codepage ="936" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 3.0">
<link rel="stylesheet" type="text/css" href="link.css">
<title>真心链</title>
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
response.write"错误：user_name不符合规则。 "
response.write"<a href='http://www.zhiyuanit.com/link/apply.asp'>重新申请</a>"
response.end
end if
set con = Server.CreateObject("ADODB.Connection")%><!-- #include file=1Qw@3E.inc --><%con.open
sql="SELECT * FROM zhenxin_user WHERE user_name='"&user&"'"
Set Rs=con.Execute(sql)
If not(Rs.Bof OR Rs.Eof) then
Response.Write "错误：user_name已存在。 "
response.write"<a href='http://www.zhiyuanit.com/link/apply.asp'>重新申请</a>"
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
alert("必须输入您的pass_word！\n")
ValidationPassed = false
return
}
if(obj.pass2.value=="")
{
alert("必须输入验证pass_word！\n")
ValidationPassed = false
return
}
if(obj.pass2.value!=obj.pass1.value)
{
alert("你的第一次pass_word输入与验证pass_word必须相同！\n")
ValidationPassed = false
return
}
if(obj.sitename.value=="")
{
alert("必须输入site_name！\n")
ValidationPassed = false
return
}
if(obj.url.value=="")
{
alert("必须输入主页地址！\n")
ValidationPassed = false
return
}
if(obj.url.value=="")
{
alert("必须输入site_url！\n")
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
                    <p><span class="stedit">user_name是：<font color="#FF0000"> <%=server.htmlencode(olduser)%></font></span><br>
                      <span class="stedit">电子e_mail： 
                      <input name="mail" size="15" class="stedit" maxlength="30">
                      </span>（最多30个字符）<span class="stedit"></span><br>
                      <span class="stedit"> site_type： 
                      <select name="fenlei" size="1" class="stslt">
                        <option value="1" selected>综合门户</option>
                        <option value="2">国家地区</option>
                        <option value="3">电脑网络</option>
                        <option value="4">政府机关</option>
                        <option value="5">休闲娱乐</option>
                        <option value="6">电信港湾</option>
                        <option value="7">生活资讯</option>
                        <option value="8">文化艺术</option>
                        <option value="9">科学教育</option>
                        <option value="10">游戏世界</option>
                        <option value="11">体育健身</option>
                        <option value="12">工商经济</option>
                        <option value="13">金融投资</option>
                        <option value="14">新闻媒体</option>
                        <option value="15">情感交流</option>
                        <option value="16">女性天地</option>
                        <option value="17">卫生保健</option>
                        <option value="18">其他类别</option>
                      </select>
                      </span> <br>
                      <span class="stedit">你的pass_word： 
                      <input name="pass1" size="10" class="stedit" type="password" maxlength="10">
                      </span> （最多10个字符）<span class="stedit"><br>
                      </span><span class="stedit">效验pass_word： 
                      <input name="pass2" type="password" size="10" class="stedit" maxlength="10">
                      </span> （最多10个字符）<br>
                      <span class="stedit">site_name： 
                      <input 
name="sitename" size="16" class="stedit" maxlength="8">
                      </span> （最多8个汉字）<br>
                      <span class="stedit">主页地址： 
                      <input name="url" size="30" class="stedit" maxlength="50">
                      </span> （最多50个字符）<br>
                      <span class="stedit">site_about： 
                      <input type="text" name="jiji" size="50" class="stedit" value="" maxlength="50">
                      </span>（最多50个汉字）<br>
                      <span class="stedit">背景颜色： 
                      <select name='bc' class="stslt">
                        <option style="background-color:ffffff" value="no" selected> 
                        透明 </option>
                        <option style="background-color:ffffff" value="ffffff">白色</option>
                        <option style="background-color:ffdddd" value="ffdddd">浅红</option>
                        <option style="background-color:ffffdd" value="ffffdd">浅黄</option>
                        <option style="background-color:ddffdd" value="ddffdd">浅绿</option>
                        <option style="background-color:ddffff" value="ddffff">浅蓝</option>
                        <option style="background-color:ddddff" value="ddddff">浅紫</option>
                        <option style="background-color:ffddff" value="ffddff">浅粉</option>
                      </select>
                      </span></p>
                    <p><span class="stedit">选择真心链形式：</span></p>
                    <table width="100" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td colspan="2"> 
                          <p>
                            <input type="radio" value="1" name="R1" checked>
                            <span class="stedit">样式1</span></p>
                          <table width="500" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td> 
                                <table width='30%' border='0' cellpadding='0' cellspacing='0' bordercolordark='#FFFFFF'>
                                  <tr> 
                                    <td width='15' height='15' bgcolor='#000000'><a href='http://www.zhiyuanit.com/link' target='_blank'><img src='images/xin.gif' width='15' height='15' border='0'></a></td>
                                    <td valign='bottom' bgcolor='#000000'><font  style='font-size: 9pt'>&nbsp;<a href='http://www.zhiyuanit.com/link' style='color: rgb(255,255,255); text-decoration: none'><font color="#FFFFFF">真心链</font></a><font color="#FFFFFF"> 
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
                                      <div align="center"><b><font color="#FF0000">收费广告位</font></b></div>
                                    </td>
                                    <td> 
                                      <div align="center"><b><font color="#FF0000">收费广告位</font></b></div>
                                    </td>
                                    <td colspan="3">
                                      <div align="center"><b><font color="#FF0000">收费广告位</font></b></div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td width="20%"> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                    <td width="20%"> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                    <td width="20%"> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                    <td width="20%"> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                    <td width="20%"> 
                                      <div align="center">交换广告位</div>
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
    color="#000000">样式2</font></span></p>
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
                                      <div align="center"><b><font color="#FF0000">收费广告位</font></b></div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center"><b><font color="#FF0000">收费广告位</font></b></div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">交换广告位</div>
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
    color="#000000">样式3</font></span></p>
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
                                      <div align="center"><b><font color="#FF0000">收费广告位</font></b></div>
                                    </td>
                                    <td> 
                                      <div align="center"><b><font color="#FF0000">收费广告位</font></b></div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                    <td> 
                                      <div align="center">交换广告位</div>
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
                            样式4</p>
                          <table border='0' width='600' bordercolorlight='#000000' cellpadding='0' cellspacing='0'>
                            <tr> 
                              <td> 
                                <table width='25%' border='0' cellpadding='0' cellspacing='0' bordercolordark='#FFFFFF'>
                                  <tr> 
                                    <td width='15' height='15' bgcolor='#000000'><a href='http://www.zhiyuanit.com/link' target='_blank'><img src='images/xin.gif' width='15' height='15' border='0'></a></td>
                                    <td valign='bottom' bgcolor='#000000'><font style="font-size: 9pt" color="#FFFFFF">&nbsp;<a href='http://www.zhiyuanit.com/link/' style='color: rgb(255,255,255); text-decoration: none'>真心链</a> 
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
                                      <div align="center"><b><font color="#FF0000">收费广告位</font></b></div>
                                    </td>
                                    <td width="15%"> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                    <td width="15%"> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                    <td width="15%"> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                    <td width="15%"> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                    <td width="15%"> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                  </tr>
                                  <tr> 
                                    <td> 
                                      <div align="center"><b><font color="#FF0000">收费广告位</font></b></div>
                                    </td>
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                    <td> 
                                      <div align="center">交换广告位</div>
                                    </td>
                                    <td> 
                                      <div align="center">交换广告位</div>
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
                      <input type="submit" value="申请完成" class="stbtm" onClick="form_onsubmit(this.form)" name="submit">
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




