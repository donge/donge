<!-- #include file="setup.asp" -->
<!-- #include file="inc/MD5.asp" -->
<%
if Request.Cookies("username")=empty then error("<li>����δ<a href=login.asp>��¼</a>����")

if Conn.Execute("Select membercode From [user] where username='"&Request.Cookies("username")&"'")(0)<5 then error("<li>�㲻��������������Ȩ��¼��̨����")


if Request("menu")="out" then
session("pass")=""
response.redirect "Default.asp"
end if
%>

<title><%=clubname%>��̨���� - Powered By BBSxp</title>
<META http-equiv=Content-Type content=text/html;charset=gb2312>
<link href=images/skins/<%=Request.Cookies("skins")%>/bbs.css rel=stylesheet>



<%
select case Request("menu")
case ""
index
case "left"
left
case "top"
top2
case "login"
login

case "pass"
pass



end select


sub top2


%><body topmargin=0  rightmargin=0  leftmargin=0><table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" width="100%">
  <tr>
  <td width="100%" class=a1 height="20">
  
 <center>
<B><FONT face=��Բ>����� BBS ϵͳ -- BBSxp</FONT> <FONT color=ffff66>��ȫ</FONT> <FONT 
color=ff0033>����</FONT> <FONT color=33ff33>���� </FONT><FONT color=0000ff>�ɿ� 
</FONT><FONT color=000000>������</FONT></B> 
  </td>
  </tr>
  </table>

<%
end sub




sub pass

session("pass")=md5(""&Request("pass")&"")
if adminpassword<>session("pass") then error2("���������������")


log("��¼��̨����")



conn.execute("delete from [log] where logtime<"&SqlNowString&"-7")


Dim theInstalledObjects(18)
theInstalledObjects(0) = "MSWC.AdRotator"
theInstalledObjects(1) = "MSWC.BrowserType"
theInstalledObjects(2) = "MSWC.NextLink"
theInstalledObjects(3) = "MSWC.Tools"
theInstalledObjects(4) = "MSWC.Status"
theInstalledObjects(5) = "MSWC.Counters"
theInstalledObjects(6) = "IISSample.ContentRotator"
theInstalledObjects(7) = "IISSample.PageCounter"
theInstalledObjects(8) = "MSWC.PermissionChecker"
theInstalledObjects(9) = "Scripting.FileSystemObject"
theInstalledObjects(10) = "adodb.connection"
theInstalledObjects(11) = "SoftArtisans.FileUp"
theInstalledObjects(12) = "SoftArtisans.FileManager"
theInstalledObjects(13) = "JMail.Message"
theInstalledObjects(14) = "CDONTS.NewMail"
theInstalledObjects(15) = "Persits.MailSender"
theInstalledObjects(16) = "LyfUpload.UploadFile"
theInstalledObjects(17) = "Persits.Upload.1"
theInstalledObjects(18) = "w3.upload"




%>
<link href=images/skins/<%=Request.Cookies("skins")%>/bbs.css rel=stylesheet>






<html>
<head>


<title>BBSxp��̳--����ҳ��</title>

<table cellpadding="2" cellspacing="1" border="0" width="95%" align=center class="a2">
<tr>
<td class="a1" colspan=2 height=25 align="center"><b>��̳��Ϣͳ��</b></td>
</tr>
<tr class=a4>
<td height=23 colspan=2>

ϵͳ��Ϣ�������� <B><%=conn.execute("Select count(id)from [forum]")(0)%></B> ������ <B><%=conn.execute("Select count(id)from [reforum]")(0)%></B> �û��� <B><%=conn.execute("Select count(id)from [user]")(0)%></B>

</td></tr>
<tr class=a4>
<td width="50%" height=23>���������ͣ�<%=Request.ServerVariables("OS")%> ( IP:<%=Request.ServerVariables("LOCAL_ADDR")%> )</td>
<td width="50%">�ű��������棺<%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
</tr>
<tr class=a4>
<td width="50%" height=23>���������������ƣ�<%=Request.ServerVariables("SERVER_SOFTWARE")%></td>
<td width="50%">ACCESS ���ݿ�·����<a target="_blank" href="<%=datapath%><%=datafile%>"><%=datapath%><%=datafile%></a></td>
</tr>
<tr class=a4>
<td width="50%" height=23>FSO �ı���д��<%If Not IsObjInstalled(theInstalledObjects(9)) Then%><font color="red"><b>��</b></font><%else%><b>��</b><%end if%></td>
<td width="50%">SA-FileUp �ļ��ϴ���<%If Not IsObjInstalled(theInstalledObjects(11)) Then%><font color="red"><b>��</b></font><%else%><b>��</b><%end if%></td>
</tr>
<tr class=a4>
<td width="50%" height=23>Jmail ���֧�֣�<%If Not IsObjInstalled(theInstalledObjects(13)) Then%><font color="red"><b>��</b></font><%else%><b>��</b><%end if%></td>
<td width="50%">CDONTS ���֧�֣�<%If Not IsObjInstalled(theInstalledObjects(14)) Then%><font color="red"><b>��</b></font><%else%><b>��</b><%end if%></td>
</tr>
</table>
<br><br>
<table cellpadding="2" cellspacing="1" border="0" width="95%" align=center class="a2">
<tr>
<td class="a1" colspan=2 height=25 align="center"><b>������ݷ�ʽ</b></td>
</tr><tr class="a4"><td width="20%"  height=23>���ٲ����û�</td>
<td width="80%" height=23>
<form method="post" action="admin_user.asp?menu=user2">
<input size="13" name="username"> <input type="submit" value="���̲���">
</td></form>
</tr>

<tr class="a4"><td width="20%" height=23>��ݹ�������</td>
<td width="80%" height=23>
<a href="admin_bbs.asp?menu=classs"><font color=000000>������̳����</font></a> | 
<a href="admin_bbs.asp?menu=bbsmanage"><font color=000000>������̳����</font></a> |
<a href="admin_bbs.asp?menu=upclubconfigok"><font color=000000>������̳����</font></a></td>
</tr>
</table>





<p></p>

<p></p>

<script language='javascript'> function jumpto(url) { if (url != '') { window.open(url); } } </script>
<p></p>

<table cellpadding="2" cellspacing="1" border="0" width="95%" align=center class="a2">
<tr class=a4>
<td class="a1" colspan=2 height=25 align="center"><b>BBSxp��̳</b></td>
</tr><tr class=a4><td width="20%">��Ʒ����</td>
<td width="80%">
��ϢѧԺ�Ƽ���</td>
</tr>
<tr class=a4>
<td width="20%"  height=23>��Ʒ����</td>
<td width="80%">
Yuzi����Ƽ���չ���޹�˾</td>
</tr>
<tr class=a4>
<td width="20%" height=23>��ϵ����</td>
<td width="80%">
�绰��0595-2251981 ���粿��0595-2251981-11<br>
���棺0595-2205903 ��������0595-2251981-17<br>
��ַ��http://www.bbsxp.com<br>
��ַ���й� ����ʡ Ȫ���� ������· ��ҵ�� 231 ��</td>
</tr>
<tr class=a4>
<td width="20%" height=23>�������</td>
<td width="80%">
BBSxp�����֯��BBSxp Plus Organization��
</td>
</tr>
</table>





<%
htmlend
end sub




sub login





%>


<br><br><br>


<form action="admin.asp" method="post">
<input type="hidden" value="pass" name="menu">


<table width="333" border="0" cellspacing="1" cellpadding="2" align="center" class=a2>
<tr>
<td width="328" class=a1 height="25"><div align="center">
��¼��������</div>
</td></tr><tr>
<td height="19" width="328" valign="top" class=a3>
<div align="center">�������������:
<input size="15" name="pass" type="password"><br>
<input type="submit" value=" ��¼ " name="Submit1">��<input type="reset" value=" ȡ�� " name="Submit">
</div></td></tr> </table>
</form>
<%
htmlend
end sub

sub left

%>




<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<STYLE type=text/css>BODY {
	BACKGROUND: #799ae1; MARGIN: 0px; FONT: 9pt ����
}
TABLE {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px
}
TD {
	FONT: 12px ����
}
IMG {
	BORDER-RIGHT: 0px; BORDER-TOP: 0px; VERTICAL-ALIGN: bottom; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px
}
A {
	FONT: 12px ����; COLOR: #000000; TEXT-DECORATION: none
}
A:hover {
	COLOR: #428eff; TEXT-DECORATION: underline
}
.sec_menu {
	BORDER-RIGHT: white 1px solid; BACKGROUND: #d6dff7; OVERFLOW: hidden; BORDER-LEFT: white 1px solid; BORDER-BOTTOM: white 1px solid
}
.menu_title {
	
}
.menu_title SPAN {
	FONT-WEIGHT: bold; LEFT: 8px; COLOR: #215dc6; POSITION: relative; TOP: 2px
}
.menu_title2 {
	
}
.menu_title2 SPAN {
	FONT-WEIGHT: bold; LEFT: 8px; COLOR: #428eff; POSITION: relative; TOP: 2px
}
</STYLE>

<SCRIPT>
function aa(Dir)
{tt.doScroll(Dir);Timer=setTimeout('aa("'+Dir+'")',100)}//����100Ϊ�����ٶ�
function StopScroll(){if(Timer!=null)clearTimeout(Timer)}

function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
}
}

function message()
{
window.open('loading.htm','message')
}
</SCRIPT>

</HEAD>
<center>
  <TBODY>
  <TR>
    <TD vAlign=top>
      <TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD vAlign=bottom height=42><IMG height=38 
            src="images/title.gif" width=158> </TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD class=menu_title onmouseover="this.className='menu_title2';" 
          onmouseout="this.className='menu_title';" 
          background=images/title_bg_quit.gif height=25><SPAN><B>
          <font color="215DC6"><%=Request.Cookies("username")%></font></B> | 
          
          
          
<a target=_top href=?menu=out><font color=215DC6><B>�˳�</a>
</font></a></B></SPAN></TD></TR>

<tr>
<td align="center" onMouseOver=aa('up') onMouseOut=StopScroll()><font face="Webdings" color="#FFFFFF">5</font>
</td>
</tr>

</TBODY></TABLE>
          
<script>
var he=document.body.clientHeight-105
document.write("<div id=tt style=height:"+he+";overflow:hidden>")
</script>
<TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <tr>
          <TD class=menu_title id=menuTitle2 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(2) 
          onmouseout="this.className='menu_title';"  style=cursor:hand
          background=images/admin_left_2.gif 
            height=25><SPAN>���ù���</SPAN> </TD>
        	</tr>
			<tr>
          <TD id=submenu2 style="DISPLAY: none">
            <DIV class=sec_menu style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center id="table1">
              <TBODY>
              <TR>
                <TD height=20>
                <a target="main" href="admin_setup.asp?menu=variable"><font color="000000">������������</font></a></TD>
                </TR>
              <TR>
                <TD height=20>
                <a target="main" href="admin_setup.asp?menu=banner"><font color="000000">����������</font></a></TD>
                </TR>
              <TR>
                <TD height=20>
                <a target="main" href="admin_setup.asp?menu=link">
				<font color="000000">�������ӹ���</font></a></TD>
                </TR>
              </TBODY></TABLE></DIV>
            <DIV style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center id="table2">
              <TBODY>
              <TR>
                <TD height=20></TD></TR></TBODY></TABLE></DIV></TD>
        </tr>
        <TR>
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(0) 
          onmouseout="this.className='menu_title';"  style=cursor:hand
          background=images/admin_left_3.gif height=25><SPAN>�û�����
          </SPAN></TD></TR>
        <TR>
          <TD id=submenu0 style="DISPLAY: none">
            <DIV class=sec_menu style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD height=20>
               <a target="main" href="admin_user.asp?menu=showall"><font color="000000">ע���û�����</font></a></TD></TR>
                <TD height=20>
               <a target="main" href="admin_user.asp?menu=Activation"><font color="000000">�����û�����</font></a></TD></TR>                <TD height=20>
               <a target="main" href="admin_user.asp?menu=user"><font color="000000">�û����Ź���</font></a></TD></TR>
              </TBODY></TABLE></DIV>
            <DIV style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>
          
          
          
          

                
                
                
      <TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(3) 
          onmouseout="this.className='menu_title';"  style=cursor:hand
          background=images/admin_left_4.gif height=25><SPAN>��̳���� 
          </SPAN></TD></TR>
        <TR>
          <TD id=submenu3 style="DISPLAY: none">
            <DIV class=sec_menu style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD height=20>
                <a target="main" href="admin_bbs.asp?menu=classs"><font color="000000">
                ������̳����</font></a></TD></TR>
              <TR>
                <TD height=20>
                <a target="main" href="admin_bbs.asp?menu=bbsmanage"><font color="000000">������̳����</font></a></TD></TR>
              <TR>
                <TD height=20>
                <a target="main" href="admin_bbs.asp?menu=applymanage"><font color="000000">����������̳</font></a></TD></TR>
              <TR>
                <TD height=20>
                <a target="main" href="admin_bbs.asp?menu=activation"><font color="000000">������̳����</font></a></TD>
                </TR>
                
              <TR>
                <TD height=20>
                <a target="main" href="admin_bbs.asp?menu=upclubconfig"><font color="000000">������̳����</font></a></TD>
                </TR>
                
              </TBODY></TABLE></DIV>
            <DIV style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(6) 
          onmouseout="this.className='menu_title';"  style=cursor:hand
          background=images/admin_left_5.gif height=25><SPAN>��������</SPAN> 
          </TD></TR>
        <TR>
          <TD id=submenu6 style="DISPLAY: none">
            <DIV class=sec_menu style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              
                
              <TR>
                <TD height=19>
                <a target="main" href="admin_club.asp?menu=sendmail"><font color="000000">Ⱥ���ʼ�</font></a></TD>
                </TR>
                
              <TR>
                <TD height=20>
                <a target="main" href="admin_club.asp?menu=message"><font color="000000">��ѶϢ����</font></a></TD>
                </TR>

              <TR>
                <TD height=19>
                <a target="main" href="admin_club.asp?menu=affiche"><font color="000000">������������</font></a></TD>
                </TR>
              </TBODY></TABLE></DIV>
            <DIV style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(4) 
          onmouseout="this.className='menu_title';"  style=cursor:hand
          background=images/admin_left_7.gif height=25><SPAN>���ݹ��� 
            </SPAN></TD></TR>
        <TR>
          <TD id=submenu4 style="DISPLAY: none">
            <DIV class=sec_menu style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>


              <TR>
                <TD height=20>
                <a target="main" href="admin_fso.asp?menu=css"><font color="000000">�༭CSSģ��</font></a></TD>
                </TR>
              <TR>
                <TD height=20>
                <a target="main" href="admin_fso.asp?menu=statroom"><font color="000000">ͳ��ռ�ÿռ�</font></a></TD>
                </TR>
              <TR>
                <TD height=20>
                <a target="main" href="admin_fso.asp?menu=files"><font color="000000">�ϴ���������</font></a></TD>
                </TR>
              <TR>
                <TD height=20>
                <a target="main" href="admin_fso.asp?menu=bak"><font color="000000">ACCESS���ݿ�</font></a>
                </TD>
                </TR>
                
              </TBODY></TABLE></DIV>
            <DIV style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD height=20></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" onclick=showsubmenu(5) 
          onmouseout="this.className='menu_title';"  style=cursor:hand
          background=images/admin_left_6.gif height=25><SPAN>��������</SPAN> 
          </TD></TR>
        <TR>
          <TD id=submenu5 style="DISPLAY: none">
            <DIV class=sec_menu style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD height=20>
                <a target="main" href="admin_other.asp?menu=circumstance"><font color="000000">������������</font></a></TD>
                </TR>
              <TR>
                <TD height=20>
                <a target="main" href="admin_other.asp?menu=discreteness"><font color="000000">���֧�����</font></a></TD>
                </TR>
              <TR>
                <TD height=20>
                <a target="main" href="admin_other.asp?menu=log"><font color="000000">ϵͳ������¼</font></a></TD>
                </TR>
              </TBODY></TABLE></DIV>
            </TD></TR></TBODY></TABLE>&nbsp; 

      <TABLE cellSpacing=0 cellPadding=0 width=158 align=center>
        <TBODY>
        <TR>
          <TD class=menu_title id=menuTitle1 
          onmouseover="this.className='menu_title2';" 
          onmouseout="this.className='menu_title';" 
          background=images/admin_left_9.gif height=25><SPAN>BBSxp��Ϣ</SPAN> 
          </TD></TR>
        <TR>
          <TD>
            <DIV class=sec_menu style="WIDTH: 158px">
            <TABLE cellSpacing=0 cellPadding=0 width=135 align=center>
              <TBODY>
              <TR>
                <TD height=20><BR>�汾��BBSxp 2004<BR><BR>��Ȩ���У�<BR>����ϢѧԺ�Ƽ���(<a target="_blank" href="http://www.yuzi.net/"><font color="000000">Yuzi<font color="FF0000">.Net</font></font></a><font color="000000">)<BR><BR>
                </font></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE>&nbsp; 
  </TR></TBODY></TABLE>
  
</div>

<table cellspacing="0" cellpadding="0" width="158" align="center">
<tr>
<td align="center" onMouseOver=aa('Down') onMouseOut=StopScroll()><font face="Webdings" color="#FFFFFF">6</font>
</td>
</tr>
</table>

<%
end sub
sub index


%>


<html>
<link REL="SHORTCUT ICON" href="images/ybb.ico">
<meta http-equiv="Content-Type" content="text/html;charset=gb2312">
<style type="text/css">.navPoint {COLOR: white; CURSOR: hand; FONT-FAMILY: Webdings; FONT-SIZE: 9pt}</style>

<script>
function switchSysBar(){
if (switchPoint.innerText==3){
switchPoint.innerText=4
document.all("frmTitle").style.display="none"
}else{
switchPoint.innerText=3
document.all("frmTitle").style.display=""
}}
</script>
<link href="images/skins/<%=Request.Cookies("skins")%>/bbs.css" rel="stylesheet">


<body scroll=no topmargin=0  rightmargin=0  leftmargin=0 onResize=javascript:parent.carnoc.location.reload()>

<table border="0" cellPadding="0" cellSpacing="0" height="100%" width="100%">
  <tr>
    <td align="middle" id="frmTitle" noWrap vAlign="center" name="frmTitle">
    
    
    <iframe frameBorder="0" id="carnoc" name="carnoc" scrolling=no  src="?menu=left" style="HEIGHT: 100%; VISIBILITY: inherit; WIDTH: 170px; Z-INDEX: 2">
    </iframe>
    
    

    </td>
    <td class=a2 style="WIDTH: 9pt">
    <table border="0" cellPadding="0" cellSpacing="0" height="100%">
      <tr>
        <td style="HEIGHT: 100%" onclick="switchSysBar()">
        <font style="FONT-SIZE: 9pt; CURSOR: default; COLOR: #ffffff">
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <span class="navPoint" id="switchPoint" title="�ر�/������">3</span><br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        ��Ļ�л� </font></td>
      </tr>
    </table>
    </td>
    <td style="WIDTH: 100%">
    
    <iframe frameBorder="0" id="main" name="top" scrolling="no" scrolling="yes" src="?menu=top" style="HEIGHT: 20; VISIBILITY: inherit; WIDTH: 100%; Z-INDEX: 1"></iframe>
    
    <iframe frameBorder="0" id="main" name="main" scrolling="yes" src="?menu=login" style="HEIGHT: 100%; VISIBILITY: inherit; WIDTH: 100%; Z-INDEX: 1">
    </iframe></td>
  </tr>
</table>
</html>



<%
end sub

Function IsObjInstalled(strClassString)
On Error Resume Next
IsObjInstalled = False
Err = 0
Dim xTestObj
Set xTestObj = Server.CreateObject(strClassString)
If 0 = Err Then IsObjInstalled = True
Set xTestObj = Nothing
Err = 0
End Function

%>