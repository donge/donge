<html>
<head>
<title>e-office---���ڹ��ʻ������Ĺ����Զ���ϵͳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="9pp.css" type="text/css">

</head>

<body bgcolor="3F6090" text="#000000" topmargin="5">
<div align="center"><img src="image/logo2.gif" width="485" height="68"> </div>
<table width="80%" border="0" cellspacing="1" cellpadding="0" align="center">
  <tr> 
        <td bgcolor="#FFFFFF"> 
          
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="unnamed1" align="center">
        <tr bgcolor="#666666"> 
          <td class="unnamed1" colspan="2" height="5">&nbsp;</td>
        </tr>
        <tr valign="top"> 
          <td height="20"> 
            <p> 
              <%dim radiobutton,text,name,email,tel,contact
fouunderr=false
dim errmsg
YyEmailAddress="webmaster@beibang.com"

title="�ҶԹ���վ��"+trim(Request.form("radiobutton"))+"������?"
content="<li>"+Request.Form("text")+"<br>����:"+Request.Form ("name")+"<br>����:"+Request.Form ("email")+"<br>�绰:"+Request.Form ("tel")+"<br>"+Request.Form ("contact")

if Request.Form ("cname")="" then
   errmsg="<li>��˾������Ϊ��</li>"
   founderr=true
end if

if Request.Form ("name")="" then
   errmsg="<li>���Ĵ�������Ϊ��</li>"
   founderr=true
end if

if IsValidEmail(Request.Form ("email"))=false then
   errmsg=errmsg+"<li>����email�д��󣬷���û�취�ظ�����Email</li>"
   founderr=true
end if



if founderr=false then

cname = "��˾��" + request("cname")&chr(13)
name = "������" + Request.Form ("name")&"("&request.form("lx")&")"&chr(13)
tel = "�绰��" + Request.Form ("tel")&chr(13)
yemail = Request.Form ("email")
email = "email��" + Request.Form ("email")&chr(13)
add = "��ַ:"+ request("add")&chr(13)
text = chr(13)&request.form("radiobutton")&"��"&chr(13)&chr(13)&request.form("text")

Set JMail = Server.CreateObject ("JMail.SMTPMail")  
   JMail.serveraddress ="mail.beibang.com" 
   JMail.Sender=yemail  
   JMail.Subject="�û�����:" + Request.Form ("name")
   JMail.Body="****************�û�����*************"&chr(13)&chr(13)&cname+name + tel + add + email + text
   JMail.AddRecipient YyEmailAddress
   JMail.Priority = 1 
   JMail.Execute  
%>
          
         
            <div align="center"> <font size="4" color="#FF0000"><br>
              <b>��ϲ��ɹ��ˣ�����</b></font> <br>
              <br>
              <table width="70%" border="0" cellspacing="1" class="unnamed1">
                <tr>
                  <td>�����ǹ�����ʹ�õ��ʺ������룺</td>
                </tr>
                <tr>
                  <td bgcolor="#000000">
                    <table class=unnamed1 cellspacing=1 cellpadding=0 width="100%" 
            border=0>
                      <tbody> 
                      <tr bgcolor=#FFCC00> 
                        <td align=middle height=20><font color=#000000>�� ��</font></td>
                        <td align=middle height=20><font color=#000000>ְ λ</font></td>
                        <td align=middle height=20><font color=#000000>�û���</font></td>
                        <td align=middle height=20><font color=#000000>�� ��</font></td>
                      </tr>
                      <tr bgcolor=#ffffff> 
                        <td align=middle>������</td>
                        <td align=middle>���ž���</td>
                        <td align=middle>wushaowu</td>
                        <td align=middle>123456</td>
                      </tr>
                      <tr bgcolor=#ffffff> 
                        <td align=middle>������</td>
                        <td align=middle>Ա��</td>
                        <td align=middle>wangyang</td>
                        <td align=middle>123456</td>
                      </tr>
                      <tr bgcolor=#ffffff> 
                        <td align=middle>�г���</td>
                        <td align=middle>���ž���</td>
                        <td align=middle>zhengmingjun</td>
                        <td align=middle>123456</td>
                      </tr>
                      <tr bgcolor=#ffffff> 
                        <td align=middle>������</td>
                        <td align=middle>Ա��</td>
                        <td align=middle>111</td>
                        <td align=middle>111</td>
                      </tr>
                      <tr bgcolor=#ffffff> 
                        <td align=middle>���²�</td>
                        <td align=middle>Ա��</td>
                        <td align=middle>222</td>
                        <td align=middle>222</td>
                      </tr>
                      <tr bgcolor=#ffffff> 
                        <td align=middle>������</td>
                        <td align=middle>Ա��</td>
                        <td align=middle>444</td>
                        <td align=middle>444</td>
                      </tr>
                      <tr bgcolor=#ffffff> 
                        <td align=middle>����</td>
                        <td align=middle>Ա��</td>
                        <td align=middle>555</td>
                        <td align=middle>555</td>
                      </tr>
                      <tr bgcolor=#ffffff> 
                        <td align=middle>�г���</td>
                        <td align=middle>Ա��</td>
                        <td align=middle>666</td>
                        <td align=middle>666</td>
                      </tr>
                      <tr bgcolor=#ffffff> 
                        <td align=middle>�ܾ���</td>
                        <td align=middle>�ܾ���</td>
                        <td align=middle>888</td>
                        <td 
      align=middle>888</td>
                      </tr>
                      </tbody> 
                    </table>
                  </td>
                </tr>
              </table>
              <font size="4"><b><a href="http://www.beibang.com/eoffice"><br>
              &gt;&gt;&gt;��������¼</a></b></font><br>
              <br>
            </div>
            <%else%>
        <tr valign="top"> 
          <td height="20"> 
            <div align="center"><font size="4"><b>�����ˣ�����</b></font></div>
            <div align="center"><font color="#FF0000"><br>
              Sorry�� ������ϸ������µ���Ŀ�Ƿ���ȷ��</font><BR><font color="#FF0000">
              <%response.write errmsg%>
              <BR>
            </div>
            <li id="list3"> 
              <div align="center">����<a href="javascript:history.back(1)">����</a> 
              </div>
            </li>
            <div align="center"><ul> </font></p> </div>
        </tr>
      </table>
    </td>
  </tr>
  <tr bgcolor="#000000"> 
    <td height="20">
      <div align="center"><font color="#FFFFFF">Copyright &copy; 2000. All Backbone 
        Studio Digital All Rights Reserved</font></div>
    </td>
  </tr>
</table>
</body>
</html>
<%end if
function IsValidEmail(email)

dim names, name, i, c

'Check for valid syntax in an email address.

IsValidEmail = true
names = Split(email, "@")
if UBound(names) <> 1 then
   IsValidEmail = false
   exit function
end if
for each name in names
   if Len(name) <= 0 then
     IsValidEmail = false
     exit function
   end if
   for i = 1 to Len(name)
     c = Lcase(Mid(name, i, 1))
     if InStr("abcdefghijklmnopqrstuvwxyz_-.", c) <= 0 and not IsNumeric(c) then
       IsValidEmail = false
       exit function
     end if
   next
   if Left(name, 1) = "." or Right(name, 1) = "." then
      IsValidEmail = false
      exit function
   end if
next
if InStr(names(1), ".") <= 0 then
   IsValidEmail = false
   exit function
end if
i = Len(names(1)) - InStrRev(names(1), ".")
if i <> 2 and i <> 3 then
   IsValidEmail = false
   exit function
end if
if InStr(email, "..") > 0 then
   IsValidEmail = false
end if

end function%>
              </td>
            </tr>
            <tr bgcolor="#666666"> 
              <td colspan="2" height="5">&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
    </table>
    <p>&nbsp;</p>
  </div>
</form>
</body>
</html>
