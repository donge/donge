<!--#include file="conn.asp"-->
<!--#include file="inc/normalclass.asp"-->
<!--#include File="inc/uploadclass.asp"-->
<%
Set Templates=New Template
Call Templates.NoThisPost
Call Templates.HeadHTML
Response.Write "<body style='background-image:none'>"
' ���ϴ��μ�����
' ��������ֻ�й���Ա���ܽ���
' �˴��Թ���Ա����ݲ�������ȷ����֤
' ֻ��Cookies��Session���м��
Call UploadNow
Sub UploadNow()
DIm Upload,File,Uploadtext,FormPath
Set Upload=New Upload_File
Set File=upload.File("files")
' ����Ϊ��
if File.FileSize=0 then  
	Response.write "����:��ѡ��Ҫ�ϴ����ļ�! "&Templates.GetBack
	Response.end
End If
if Session("filename")<>"" Then
	Response.write "����:ÿ��ֻ���ϴ�1���μ� "&Templates.GetBack
	Response.end
End If
If File.Filesize>Cint(Templates.Normal(7))*1024  Then 
	response.write "����:�ϴ����ļ���С���ܳ���"&Templates.Normal(7)&" KB! "&Templates.GetBack
	Response.end
End If

' �ϴ���ʽ
Dim Filetype,ErrorType
Filetype = lcase(File.FileExt)
IF upload.form("type")="�ϴ�ͼƬ" Then
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
	Response.write "����:�ϴ����ļ���ʽ����! "&Templates.GetBack
Response.End  
End If  
'����
Dim SystemName,FileURL, Filetotalsize
Filetotalsize=File.FileSize
SystemName="ljyong_"&year(now())&month(now())&day(now())&hour(now())&minute(now())&second(now())&"."&Filetype
IF upload.form("type")="�ϴ�ͼƬ" Then
	FormPath="upimg"
	Response.write File.FileName&" ("&Filetotalsize&"Byte) �ϴ��ɹ�! <a href='javascript:history.go(-1)'>���ؼ����ϴ�</a>"
	Response.Write "<script> parent.TaleForm.str2.value+='[upimg]"&SystemName&"[/upimg]' </script>"
Else
	FormPath=Templates.Normal(9)
	Response.write File.FileName&" ("&Filetotalsize&"Byte) �ϴ��ɹ�!"
	Session("filename")=SystemName
	Response.Write "<script> parent.TaleForm.str2.value='"&SystemName&"' </script>"
	Response.Write "<script> parent.TaleForm.str1.value='"&Cint(Filetotalsize/1024)&"' </script>"
End IF
File.SaveAs Server.mappath(formPath&"/"&SystemName)
Set File=nothing
Set upload=nothing  
End Sub
%>
