<%@ Language="VBScript" %>
<% Option Explicit %>
<%
'####################################
'#                                  #
'#         阿江ASP探针 V1.4         #
'#                                  #
'#  阿江守候 http://www.ajiang.net  #
'#     电子邮件 info@ajiang.net     #
'#                                  #
'#    转载本程序时请保留这些信息    #
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



'检查组件是否被支持
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

'检查组件版本
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
<TITLE>ASP探针V1.4－阿江http://www.ajiang.net</TITLE>
<style>
<!--
A       { COLOR: #000000;    FONT-FAMILY: 宋体;    TEXT-DECORATION: none}
A:hover { COLOR: green;    FONT-FAMILY: 宋体;    TEXT-DECORATION: underline}
.A2       { COLOR: green;    FONT-FAMILY: 宋体;    TEXT-DECORATION: none}
.A2:hover { COLOR: #000000;    FONT-FAMILY: 宋体;    TEXT-DECORATION: underline}
body    { font-family: 宋体; font-size: 9pt}
td      { font-family: 宋体; font-size: 9pt}
.input  { BACKGROUND-COLOR: #ffffff;BORDER:#3F8805 1px solid;FONT-SIZE: 9pt}
.backc  { BACKGROUND-COLOR: #3F8805;BORDER:#3F8805 1px solid;FONT-SIZE: 9pt;color:white}
-->
</STYLE>
</HEAD>
<BODY>
<a href="mailto:zjyfc@263.net">阿江</a>改写的ASP探针-<font color=green>V1.4</font><br><br>
<font color=green>是否支持ASP</font>
<br>出现以下情况即表示您的空间不支持ASP：
<br>1、访问本文件时提示下载。
<br>2、访问本文件时看到类似“&lt;%@ Language="VBScript" %&gt;”的文字。
<br><br>

<font color=green>服务器的有关参数</font>
<table border=0 width=450 cellspacing=0 cellpadding=0 bgcolor="#3F8805">
<tr><td>

<table border=0 width=450 cellspacing=1 cellpadding=0>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;服务器名</td><td>&nbsp;<%=Request.ServerVariables("SERVER_NAME")%></td>
</tr>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;服务器IP</td><td>&nbsp;<%=Request.ServerVariables("LOCAL_ADDR")%></td>
</tr>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;服务器端口</td><td>&nbsp;<%=Request.ServerVariables("SERVER_PORT")%></td>
</tr>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;服务器时间</td><td>&nbsp;<%=now%></td>
</tr>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;IIS版本</td><td>&nbsp;<%=Request.ServerVariables("SERVER_SOFTWARE")%></td>
</tr>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;脚本超时时间</td><td>&nbsp;<%=Server.ScriptTimeout%> 秒</td>
</tr>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;本文件路径</td><td>&nbsp;<%=server.mappath(Request.ServerVariables("SCRIPT_NAME"))%></td>
</tr>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;服务器CPU数量</td><td>&nbsp;<%=Request.ServerVariables("NUMBER_OF_PROCESSORS")%> 个</td>
</tr>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;服务器解译引擎</td><td>&nbsp;<%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
</tr>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;服务器操作系统</td><td>&nbsp;<%=Request.ServerVariables("OS")%></td>
</tr>
</table>

</td></tr>
</table>
<br>
<font color=green>组件支持情况</font>
<%
Dim strClass
strClass = Trim(Request.Form("classname"))
If "" <> strClass then
Response.Write "<br>您指定的组件的检查结果："
If Not IsObjInstalled(strClass) then
Response.Write "<br><font color=red>很遗憾，该服务器不支持" & strclass & "组件！</font>"
Else
Response.Write "<br><font color=green>恭喜！该服务器支持" & strclass & "组件。该组件版本是：" & getver(strclass) & "</font>"
End If
Response.Write "<br>"
end if
%>
<br>■ IIS自带的ASP组件
<table border=0 width=450 cellspacing=0 cellpadding=0 bgcolor="#3F8805">
<tr><td>

<table border=0 width=450 cellspacing=1 cellpadding=0>
<tr height=18 style="color:#ffffff" align=center>
<td width=350>组 件 名 称</td><td width=100>支持及版本</td>
</tr>

<%
dim i
For i=0 to 10
Response.Write "<TR bgcolor=#EEFEE0 align=center height=18><TD align=left>&nbsp;" & theInstalledObjects(i) & "<font color=#888888>&nbsp;"
select case i
case 9
Response.Write "(FSO 文本文件读写)"
case 10
Response.Write "(ACCESS 数据库)"
end select
Response.Write "</font></td>"
If Not IsObjInstalled(theInstalledObjects(i)) Then
Response.Write "<td align=left>&nbsp;<font color=red><b>×</b></font></td>"
Else
Response.Write "<td align=left>&nbsp;<font color=green><b>√</b></font> " & getver(theInstalledObjects(i)) & "</td>"
End If
Response.Write "</TR>" & vbCrLf
Next
%>
</table>

</td></tr>
</table>


<br>■ 常见的文件上传和管理组件
<table border=0 width=450 cellspacing=0 cellpadding=0 bgcolor="#3F8805">
<tr><td>

<table border=0 width=450 cellspacing=1 cellpadding=0>
<tr height=18 style="color:#ffffff" align=center>
<td width=350>组 件 名 称</td><td width=100>支持及版本</td>
</tr>

<%

For i=11 to 15
Response.Write "<TR bgcolor=#EEFEE0 align=center height=18><TD align=left>&nbsp;" & theInstalledObjects(i) & "<font color=#888888>&nbsp;"
select case i
case 11
Response.Write "(SA-FileUp 文件上传)"
case 12
Response.Write "(SA-FM 文件管理)"
case 13
Response.Write "(LyfUpload 文件上传)"
case 14
Response.Write "(ASPUpload 文件上传)"
case 15
Response.Write "(w3 upload 文件上传)"

end select
Response.Write "</font></td>"
If Not IsObjInstalled(theInstalledObjects(i)) Then
Response.Write "<td align=left>&nbsp;<font color=red><b>×</b></font></td>"
Else
Response.Write "<td align=left>&nbsp;<font color=green><b>√</b></font> " & getver(theInstalledObjects(i)) & "</td>"
End If

Response.Write "</TR>" & vbCrLf
Next
%>
</table>

</td></tr>
</table>
<br>■ 常见的收发邮件组件
<table border=0 width=450 cellspacing=0 cellpadding=0 bgcolor="#3F8805">
<tr><td>

<table border=0 width=450 cellspacing=1 cellpadding=0>
<tr height=18 style="color:#ffffff" align=center>
<td width=350>组 件 名 称</td><td width=100>支持及版本</td>
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
Response.Write "(w3 Jmail 收发信)"
case 17
Response.Write "(WIN虚拟SMTP 发信)"
case 18
Response.Write "(ASPemail 发信)"
case 19
Response.Write "(ASPmail 发信)"
case 20
Response.Write "(dkQmail 发信)"
case 21
Response.Write "(Geocel 发信)"
case 22
Response.Write "(IISemail 发信)"
case 23
Response.Write "(SMTPmail 发信)"

end select
Response.Write "</font></td>"
If Not IsObjInstalled(theInstalledObjects(i)) Then
Response.Write "<td align=left>&nbsp;<font color=red><b>×</b></font></td>"
Else
Response.Write "<td align=left>&nbsp;<font color=green><b>√</b></font> " & getver(theInstalledObjects(i)) & "</td>"
End If

Response.Write "</TR>" & vbCrLf
Next
%>
</table>

</td></tr>
</table>
<br>
<font color=green>其他组件支持情况检测</font><br>
在下面的输入框中输入你要检测的组件的ProgId或ClassId。
<table border=0 width=450 cellspacing=0 cellpadding=0 bgcolor="#3F8805">
<tr><td>

<table border=0 width=450 cellspacing=1 cellpadding=0>
<FORM action=<%=Request.ServerVariables("SCRIPT_NAME")%> method=post id=form1 name=form1>
<tr bgcolor="#EEFEE0" height=18>
<td align=center height=30><input class=input type=text value="" name="classname" size=40>
<INPUT type=submit value="确定" class=backc id=submit1 name=submit1>
<INPUT type=reset value="重填" class=backc id=reset1 name=reset1>
</td>
</tr>
</FORM>
</table>

</td></tr>
</table>
<br>
<font color=green>ASP脚本解释和运算速度测试</font><br>
我们让服务器执行500万次“1＋1”的计算，记录其所使用的时间。
<table border=0 width=450 cellspacing=0 cellpadding=0 bgcolor="#3F8805">
<tr><td>

<table border=0 width=450 cellspacing=1 cellpadding=0>
<tr style="color:#ffffff" height=18>
<td align=center>服&nbsp;&nbsp;&nbsp;务&nbsp;&nbsp;&nbsp;器</td><td align=center>完成时间</td>
</tr>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;阿江的电脑（256M雷鸟900）</td><td>&nbsp;3 秒</td>
</tr>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;中国频道虚拟主机www82（10月20日15:10）</td><td>&nbsp;6 秒</td>
</tr>
<tr bgcolor="#EEFEE0" height=18>
<td align=left>&nbsp;中原精品网免费空间（04月02日15:20）</td><td>&nbsp;7 秒</td>
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
<td align=left>&nbsp;<font color=red>您正在使用的这台服务器</font>&nbsp;<INPUT type="submit" value="重新测试" class=backc id=submit2 name=test></td><td>&nbsp;<font color=red><%=thetime%> 秒</font></td>
</tr>
<%else%>
<tr bgcolor="#EEFEE0" height=25>
<td align=left>&nbsp;<font color=red>您正在使用的这台服务器</font></td><td>&nbsp;<INPUT type="submit" value="测 试" class=backc id=submit2 name=test></td>
</tr>
<%end if%>
</form>
</table>

</td></tr>
</table>

<br>
<table border=0 width=450 cellspacing=0 cellpadding=0>
<tr><td align=center>
欢迎访问 【阿江守候】 <a href="http://www.ajiang.net">http://www.ajiang.net</a>
<br>本程序由阿江(<a href="mailto:info@ajiang.net">info@ajiang.net</a>)编写，转载时请保留这些信息
</td></tr>
</table>
</BODY>
</HTML>
