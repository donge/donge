<!-- #include file="setup.asp" -->
<!--#include FILE="inc/upfile.asp"-->

<%
top
if Request.Cookies("username")=empty then error("<li>您还未<a href=login.asp>登录</a>社区")

if Request("menu")="up" then

id=Conn.Execute("Select id From [user] where username='"&Request.Cookies("username")&"'")(0)


On Error Resume Next
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Set upl = Server.CreateObject("SoftArtisans.FileUp")
If 0 = Err Then
if upl.TotalBytes > int(MaxPhoto) then error("<li>图片大小不得超过 "&int(MaxPhoto/1024)&" KB<br>当前的图片大小为 "&int(upl.TotalBytes/1024)&" KB")
if upl.ContentType<>"image/gif" and upl.ContentType<>"image/pjpeg" then error("<li>您上传的照片不是GIF、JPG格式的文件")
upl.SaveAs Server.mappath("images/upphoto/"&id&".jpg")
set upl=nothing
else
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

set FileUP=new Upload_file 
FileUP.GetDate(-1)
set file=FileUP.file("file")

if file.filesize > int(MaxPhoto) then error("<li>文件大小不得超过 "&int(MaxPhoto/1024)&" KB<li>当前的文件大小为 "&int(file.filesize/1024)&" KB")
if LCase(file.FileExt) <> "gif" and LCase(file.FileExt) <> "jpg" then error("<li>对不起，本服务器只支持GIF、JPG格式的文件<li>不支持 "&file.FileExt&" 格式的文件")
file.SaveToFile Server.mappath("images/upphoto/"&id&".jpg")
set FileUP=nothing

end if

conn.execute("update [user] set userphoto='images/upphoto/"&id&".jpg' where username='"&Request.Cookies("username")&"'")
message=message&"<li>照片上传成功<li><a href=upphoto.asp>返回上传照片</a><li><a href=main.asp>返回论坛首页</a>"
succeed(""&message&"<meta http-equiv=refresh content=3;url=upphoto.asp>")
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

elseif Request("menu")="custom" then

userphoto=HTMLEncode(Request("userphoto"))
if userphoto="" then error("<li>照片URL不能没有填写")
conn.execute("update [user] set userphoto='"&userphoto&"' where username='"&Request.Cookies("username")&"'")

End If



%>
<title>上传照片</title>

<table width=97% align=center border=0>
<tr>
<td width=25%>
<img src=images/logo.gif border=0></td>
<td align=right><%=banner%></td>
</tr>
</table><br>
<table border=0 width=97% align=center cellspacing=1 cellpadding=4 class=a2>
<tr class=a3>
<td height=25>&nbsp;<img src=images/Forum_nav.gif>&nbsp; <a href=main.asp><%=clubname%></a> → <a href="upphoto.asp">上传照片</a></td>
</tr>
</table><br>

<form enctype=multipart/form-data method=post action=upphoto.asp?menu=up>
<SCRIPT>valigntop()</SCRIPT>
<table width=97% border=0 cellpadding="0" cellspacing="1" class=a2 height="218" align="center"><tr>
	<td class=a1 height="25" width="544"><p align=center>请点取下面的“浏览”按键选择您要上传的图片</p>
	</td><td class=a1><div align=center>您目前的照片</span></div></td>
</tr><tr><td class=a3 width="544"><center>
<input type=file name="file" size=33><br><br><input name="Submit" type=submit value=" 确 认 "></form></td>
		<td rowspan=3 class=a3 align="center"><img src="<%=Conn.Execute("Select userphoto From [user] where username='"&Request.Cookies("username")&"'")(0)%>" onload='javascript:if(this.width>200)this.width=200'></td>
</tr><tr><td class=a1 height="25" width="544"><center>自定义照片</td><tr>
<td class=a3 width="544"><form method=post action=upphoto.asp?menu=custom><center>
	照片URL：<input size="35" value="<%=Conn.Execute("Select userphoto From [user] where username='"&Request.Cookies("username")&"'")(0)%>" name="userphoto">
<br><br><input name="Submit0" type=submit value=" 更 新 "></form></td></table>
<SCRIPT>valignbottom()</SCRIPT>



<%
htmlend
%>