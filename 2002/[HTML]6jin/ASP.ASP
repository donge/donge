<%@ Language="VBScript" %>
<% Option Explicit %>
<%
'####################################
'#                                  #
'#         ����ASP̽�� V1.4         #
'#                                  #
'#  �����غ� http://www.ajiang.net  #
'#     �����ʼ� info@ajiang.net     #
'#                                  #
'#    ת�ر�����ʱ�뱣����Щ��Ϣ    #
'#                                  #
'####################################

Dim theInstalledObjects(24)
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
theInstalledObjects(13) = "LyfUpload.UploadFile"
theInstalledObjects(14) = "Persits.Upload.1"
theInstalledObjects(15) = "w3.upload"

theInstalledObjects(16) = "JMail.SmtpMail"
theInstalledObjects(17) = "CDONTS.NewMail"
theInstalledObjects(18) = "Persits.MailSender"
theInstalledObjects(19) = "SMTPsvg.Mailer"
theInstalledObjects(20) = "DkQmail.Qmail"
theInstalledObjects(21) = "Geocel.Mailer"
theInstalledObjects(22) = "IISmail.Iismail.1"
theInstalledObjects(23) = "SmtpMail.SmtpMail.1"



'�������Ƿ�֧��
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

'�������汾
Function getver(Classstr)
On Error Resume Next
getver=""
Err = 0
Dim xTestObj
Set xTestObj = Server.CreateObject(Classstr)
If 0 = Err Then getver=xtestobj.version
Set xTestObj = Nothing
Err = 0
End Function
%>
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<TITLE>ASP̽��V1.4������http://www.ajiang.net</TITLE>
<style>
<!--
A       { COLOR: #000000;    FONT-FAMILY: ����;    TEXT-DECORATION: none}
A:hover { COLOR: green;    FONT-FAMILY: ����;    TEXT-DECORATION: underline}
.A2       { COLOR: green;    FONT-FAMILY: ����;    TEXT-DECORATION: none}
.A2:hover { COLOR: #000000;    FONT-FAMILY: ����;    TEXT-DECORATION: underline}
body    { font-family: ����; font-size: 9pt}
td      { font-family: ����; font-size: 9pt}
.input  { BACKGROUND-COLOR: #ffffff;BORDER:#3F8805 1px solid;FONT-SIZE: 9pt}
.backc  { BACKGROUND-COLOR: #3F8805;BORDER:#3F8805 1px solid;FONT-SIZE: 9pt;color:white}
-->
</STYLE>
</HEAD>
<BODY>
<a href="mailto:zjyfc@263.net">����</a>��д��ASP̽��-<font color=green>V1.4</font><br><br>
<font color=green>�Ƿ�֧��ASP</font>
<br>���������������ʾ���Ŀռ䲻֧��ASP��
<br>1�����ʱ��ļ�ʱ��ʾ���ء�
<br>2�����ʱ��ļ�ʱ�������ơ�&lt;%@ Language="VBScript" %&gt;�������֡�
<br><br>

<font color=green>���������йز���</font>
<table border=0 width=450 cellspacing=0 cellpadding=0 bgcolor="#3F8805">
<tr><td>

<table border=0 width=450 cellspacing=1 cellpadding=0>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;��������</td><td>&nbsp;<%=Request.ServerVariables("SERVER_NAME")%></td>
</tr>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;������IP</td><td>&nbsp;<%=Request.ServerVariables("LOCAL_ADDR")%></td>
</tr>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;�������˿�</td><td>&nbsp;<%=Request.ServerVariables("SERVER_PORT")%></td>
</tr>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;������ʱ��</td><td>&nbsp;<%=now%></td>
</tr>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;IIS�汾</td><td>&nbsp;<%=Request.ServerVariables("SERVER_SOFTWARE")%></td>
</tr>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;�ű���ʱʱ��</td><td>&nbsp;<%=Server.ScriptTimeout%> ��</td>
</tr>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;���ļ�·��</td><td>&nbsp;<%=server.mappath(Request.ServerVariables("SCRIPT_NAME"))%></td>
</tr>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;������CPU����</td><td>&nbsp;<%=Request.ServerVariables("NUMBER_OF_PROCESSORS")%> ��</td>
</tr>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;��������������</td><td>&nbsp;<%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
</tr>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;����������ϵͳ</td><td>&nbsp;<%=Request.ServerVariables("OS")%></td>
</tr>
</table>

</td></tr>
</table>
<br>
<font color=green>���֧�����</font>
<%
Dim strClass
strClass = Trim(Request.Form("classname"))
If "" <> strClass then
Response.Write "<br>��ָ��������ļ������"
If Not IsObjInstalled(strClass) then
Response.Write "<br><font color=red>���ź����÷�������֧��" & strclass & "�����</font>"
Else
Response.Write "<br><font color=green>��ϲ���÷�����֧��" & strclass & "�����������汾�ǣ�" & getver(strclass) & "</font>"
End If
Response.Write "<br>"
end if
%>
<br>�� IIS�Դ���ASP���
<table border=0 width=450 cellspacing=0 cellpadding=0 bgcolor="#3F8805">
<tr><td>

<table border=0 width=450 cellspacing=1 cellpadding=0>
<tr height=18 style="color:#ffffff" align=center>
<td width=350>�� �� �� ��</td><td width=100>֧�ּ��汾</td>
</tr>

<%
dim i
For i=0 to 10
Response.Write "<TR bgcolor=#EEFEE0 align=center height=18><TD align=left>&nbsp;" & theInstalledObjects(i) & "<font color=#888888>&nbsp;"
select case i
case 9
Response.Write "(FSO �ı��ļ���д)"
case 10
Response.Write "(ACCESS ���ݿ�)"
end select
Response.Write "</font></td>"
If Not IsObjInstalled(theInstalledObjects(i)) Then
Response.Write "<td align=left>&nbsp;<font color=red><b>��</b></font></td>"
Else
Response.Write "<td align=left>&nbsp;<font color=green><b>��</b></font> " & getver(theInstalledObjects(i)) & "</td>"
End If
Response.Write "</TR>" & vbCrLf
Next
%>
</table>

</td></tr>
</table>


<br>�� �������ļ��ϴ��͹������
<table border=0 width=450 cellspacing=0 cellpadding=0 bgcolor="#3F8805">
<tr><td>

<table border=0 width=450 cellspacing=1 cellpadding=0>
<tr height=18 style="color:#ffffff" align=center>
<td width=350>�� �� �� ��</td><td width=100>֧�ּ��汾</td>
</tr>

<%

For i=11 to 15
Response.Write "<TR bgcolor=#EEFEE0 align=center height=18><TD align=left>&nbsp;" & theInstalledObjects(i) & "<font color=#888888>&nbsp;"
select case i
case 11
Response.Write "(SA-FileUp �ļ��ϴ�)"
case 12
Response.Write "(SA-FM �ļ�����)"
case 13
Response.Write "(LyfUpload �ļ��ϴ�)"
case 14
Response.Write "(ASPUpload �ļ��ϴ�)"
case 15
Response.Write "(w3 upload �ļ��ϴ�)"

end select
Response.Write "</font></td>"
If Not IsObjInstalled(theInstalledObjects(i)) Then
Response.Write "<td align=left>&nbsp;<font color=red><b>��</b></font></td>"
Else
Response.Write "<td align=left>&nbsp;<font color=green><b>��</b></font> " & getver(theInstalledObjects(i)) & "</td>"
End If

Response.Write "</TR>" & vbCrLf
Next
%>
</table>

</td></tr>
</table>
<br>�� �������շ��ʼ����
<table border=0 width=450 cellspacing=0 cellpadding=0 bgcolor="#3F8805">
<tr><td>

<table border=0 width=450 cellspacing=1 cellpadding=0>
<tr height=18 style="color:#ffffff" align=center>
<td width=350>�� �� �� ��</td><td width=100>֧�ּ��汾</td>
</tr>

<%
theInstalledObjects(16) = "JMail.SMTPMail"
theInstalledObjects(17) = "CDONTS.NewMail"
theInstalledObjects(18) = "Persits.MailSender"
theInstalledObjects(19) = "SMTPsvg.Mailer"
theInstalledObjects(20) = "dkQmail.Qmail"
theInstalledObjects(21) = "Geocel.Mailer"
theInstalledObjects(22) = "iismail.iismail.1"
theInstalledObjects(23) = "SmtpMail.SmtpMail.1"

For i=16 to 23
Response.Write "<TR bgcolor=#EEFEE0 align=center height=18><TD align=left>&nbsp;" & theInstalledObjects(i) & "<font color=#888888>&nbsp;"
select case i
case 16
Response.Write "(w3 Jmail �շ���)"
case 17
Response.Write "(WIN����SMTP ����)"
case 18
Response.Write "(ASPemail ����)"
case 19
Response.Write "(ASPmail ����)"
case 20
Response.Write "(dkQmail ����)"
case 21
Response.Write "(Geocel ����)"
case 22
Response.Write "(IISemail ����)"
case 23
Response.Write "(SMTPmail ����)"

end select
Response.Write "</font></td>"
If Not IsObjInstalled(theInstalledObjects(i)) Then
Response.Write "<td align=left>&nbsp;<font color=red><b>��</b></font></td>"
Else
Response.Write "<td align=left>&nbsp;<font color=green><b>��</b></font> " & getver(theInstalledObjects(i)) & "</td>"
End If

Response.Write "</TR>" & vbCrLf
Next
%>
</table>

</td></tr>
</table>
<br>
<font color=green>�������֧��������</font><br>
��������������������Ҫ���������ProgId��ClassId��
<table border=0 width=450 cellspacing=0 cellpadding=0 bgcolor="#3F8805">
<tr><td>

<table border=0 width=450 cellspacing=1 cellpadding=0>
<FORM action=<%=Request.ServerVariables("SCRIPT_NAME")%> method=post id=form1 name=form1>
<tr bgcolor="#EEFEE0" height=18>
<td align=center height=30><input class=input type=text value="" name="classname" size=40>
<INPUT type=submit value="ȷ��" class=backc id=submit1 name=submit1>
<INPUT type=reset value="����" class=backc id=reset1 name=reset1>
</td>
</tr>
</FORM>
</table>

</td></tr>
</table>
<br>
<font color=green>ASP�ű����ͺ������ٶȲ���</font><br>
�����÷�����ִ��500��Ρ�1��1���ļ��㣬��¼����ʹ�õ�ʱ�䡣
<table border=0 width=450 cellspacing=0 cellpadding=0 bgcolor="#3F8805">
<tr><td>

<table border=0 width=450 cellspacing=1 cellpadding=0>
<tr style="color:#ffffff" height=18>
<td align=center>��&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;��</td><td align=center>���ʱ��</td>
</tr>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;�����ĵ��ԣ�256M����900��</td><td>&nbsp;3 ��</td>
</tr>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;�й�Ƶ����������www82��10��20��15:10��</td><td>&nbsp;6 ��</td>
</tr>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;��ԭ��Ʒ����ѿռ䣨04��02��15:20��</td><td>&nbsp;7 ��</td>
</tr>
<form action="<%=Request.ServerVariables("SCRIPT_NAME")%>" method=post>
<%
if Request.Form("test") <> "" then

dim t1,t2,lsabc,thetime
t1=now
for i=1 to 5000000
lsabc= 1 + 1
next
t2=now

thetime=cstr(int(cdbl((t2-t1)*24*60*60)+0.5))
%>
<tr bgcolor="#EEFEE0" height=25>
<td align=left>&nbsp;<font color=red>������ʹ�õ���̨������</font>&nbsp;<INPUT type="submit" value="���²���" class=backc id=submit2 name=test></td><td>&nbsp;<font color=red><%=thetime%> ��</font></td>
</tr>
<%else%>
<tr bgcolor="#EEFEE0" height=25>
<td align=left>&nbsp;<font color=red>������ʹ�õ���̨������</font></td><td>&nbsp;<INPUT type="submit" value="�� ��" class=backc id=submit2 name=test></td>
</tr>
<%end if%>
</form>
</table>

</td></tr>
</table>

<br>
<table border=0 width=450 cellspacing=0 cellpadding=0>
<tr><td align=center>
��ӭ���� �������غ� <a href="http://www.ajiang.net">http://www.ajiang.net</a>
<br>�������ɰ���(<a href="mailto:info@ajiang.net">info@ajiang.net</a>)��д��ת��ʱ�뱣����Щ��Ϣ
</td></tr>
</table>
</BODY>
</HTML>
