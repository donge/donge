<!--#include file="conn.asp"-->
<!--#include file="inc/normalclass.asp"-->
<!--#include File="inc/uploadclass.asp"-->
<%
Set Templates=New Template
Call Templates.NoThisPost
Call Templates.HeadHTML
Response.Write "<body style='background-image:none'>"
' 除上传课件以外
' 其它操作只有管理员才能进行
' 此处对管理员的身份不进行正确性验证
' 只对Cookies和Session进行检测
Call UploadNow
Sub UploadNow()
DIm Upload,File,Uploadtext,FormPath
Set Upload=New Upload_File
Set File=upload.File("files")
' 不能为空
if File.FileSize=0 then  
	Response.write "错误:请选择要上传的文件! "&Templates.GetBack
	Response.end
End If
if Session("filename")<>"" Then
	Response.write "错误:每次只能上传1个课件 "&Templates.GetBack
	Response.end
End If
If File.Filesize>Cint(Templates.Normal(7))*1024  Then 
	response.write "错误:上传的文件大小不能超过"&Templates.Normal(7)&" KB! "&Templates.GetBack
	Response.end
End If

' 上传格式
Dim Filetype,ErrorType
Filetype = lcase(File.FileExt)
IF upload.form("type")="上传图片" Then
Uploadtext = array("gif","jpg","png","jpeg")
	For i=0 to Ubound(Uploadtext)
		If Filetype=lcase(Uploadtext(i)) Then 
			ErrorType=False
			Exit For
		Else
			ErrorType=True
		End If
	Next
Else
Uploadtext = split(Templates.Normal(6), "|")
	For i=0 to Ubound(Uploadtext)
		If Filetype=lcase(Uploadtext(i)) Then 
			ErrorType=False
			Exit For
		Else
			ErrorType=True
		End If
	Next
End If
If Filetype="asp" Or  Filetype="asa" Or  Filetype="aspx" Then ErrorType=True

If ErrorType=True Then
	Response.write "错误:上传的文件格式不对! "&Templates.GetBack
Response.End  
End If  
'保存
Dim SystemName,FileURL, Filetotalsize
Filetotalsize=File.FileSize
SystemName="ljyong_"&year(now())&month(now())&day(now())&hour(now())&minute(now())&second(now())&"."&Filetype
IF upload.form("type")="上传图片" Then
	FormPath="upimg"
	Response.write File.FileName&" ("&Filetotalsize&"Byte) 上传成功! <a href='javascript:history.go(-1)'>返回继续上传</a>"
	Response.Write "<script> parent.TaleForm.str2.value+='[upimg]"&SystemName&"[/upimg]' </script>"
Else
	FormPath=Templates.Normal(9)
	Response.write File.FileName&" ("&Filetotalsize&"Byte) 上传成功!"
	Session("filename")=SystemName
	Response.Write "<script> parent.TaleForm.str2.value='"&SystemName&"' </script>"
	Response.Write "<script> parent.TaleForm.str1.value='"&Cint(Filetotalsize/1024)&"' </script>"
End IF
File.SaveAs Server.mappath(formPath&"/"&SystemName)
Set File=nothing
Set upload=nothing  
End Sub
%>
