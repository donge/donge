<SCRIPT RUNAT=SERVER LANGUAGE=VBSCRIPT>
'  本文件引用自网络
'  感谢网上那些认识的或不认识的朋友,是你们的帮助让我能勇敢坚持下去
Dim Uupfilestream
Class upload_file
Dim objForm,objFile

Public Function Form(strForm)
strForm=lcase(strForm)
If Not objForm.Exists(strForm) then
	Form=""
Else
	Form=objForm(strForm)
End if
End Function

Public Function File(strFile)
strFile=lcase(strFile)
If not objFile.exists(strFile) then
	Set File=new FileInfo
Else
	Set File=objFile(strFile)
End if
End Function


Private Sub Class_Initialize 
Dim RequestData,sStart,vbCrlf,sInfo,iInfoStart,iInfoEnd,tStream,iStart,theFile
Dim iFileSize,sFilePath,sFileType,sFormValue,sFileName
Dim iFindStart,iFindEnd
Dim iFormStart,iFormEnd,sFormName
' 返回浏览器发送的字节数
If Request.TotalBytes<1 then Exit Sub
' 存放非文本数据
Set objForm=Server.CreateObject("Scripting.Dictionary")
' 存放文本数据
Set objFile=Server.CreateObject("Scripting.Dictionary")
Set tStream = Server.CreateObject("adodb.stream")
Set Uupfilestream = Server.CreateObject("adodb.stream")
Uupfilestream.Type = 1
Uupfilestream.Mode =3
Uupfilestream.Open
Uupfilestream.Write  Request.BinaryRead(Request.TotalBytes)
Uupfilestream.Position=0
RequestData =Uupfilestream.Read 
iFormEnd = Uupfilestream.Size
vbCrlf = chrB(13) & chrB(10)
' 取得每个项目之间的分隔符
sStart = MidB(RequestData,1, InStrB(1,RequestData,vbCrLf)-1)
iStart = LenB (sStart)
iFormStart=iStart+2
Do
	iInfoEnd = InStrB(iFormStart,RequestData,vbCrlf & vbCrlf)+3
	tStream.Type = 1
	tStream.Mode =3
	tStream.Open
	Uupfilestream.Position = iFormStart
	Uupfilestream.CopyTo tStream,iInfoEnd-iFormStart
	tStream.Position = 0
	tStream.Type = 2
	tStream.Charset ="gb2312"
	sInfo = tStream.ReadText
' 取得表单项目名称
	iFormStart = InStrB(iInfoEnd,RequestData,sStart)-1
	iFindStart = InStr(22,sInfo,"name=""",1)+6
	iFindEnd = InStr(iFindStart,sInfo,"""",1)
	sFormName = lcase(Mid (sinfo,iFindStart,iFindEnd-iFindStart))
' 如果是文件
	If InStr (45,sInfo,"filename=""",1) > 0 Then
		Set theFile=new FileInfo
' 取得文件属性
		iFindStart = InStr(iFindEnd,sInfo,"filename=""",1)+10
		iFindEnd = InStr(iFindStart,sInfo,"""",1)
		sFileName = Mid (sinfo,iFindStart,iFindEnd-iFindStart)
		theFile.FileName=getFileName(sFileName)
		theFile.FilePath=getFilePath(sFileName)
		theFile.FileExt=getFileExt(sFileName)
		iFindStart = InStr(iFindEnd,sInfo,"Content-Type: ",1)+14
		iFindEnd = InStr(iFindStart,sInfo,vbCr)
		theFile.FileType =Mid (sinfo,iFindStart,iFindEnd-iFindStart)
		theFile.FileStart =iInfoEnd
		theFile.FileSize = iFormStart -iInfoEnd -2
		theFile.FormName=sFormName
		If Not objFile.Exists(sFormName) Then objFile.add sFormName,theFile
	Else
' 如果是表单项目
	tStream.Close
		tStream.Type =1
		tStream.Mode =3
		tStream.Open
		Uupfilestream.Position = iInfoEnd 
		Uupfilestream.CopyTo tStream,iFormStart-iInfoEnd-2
		tStream.Position = 0
		tStream.Type = 2
		tStream.Charset ="gb2312"
	        	sFormValue = tStream.ReadText 
		If objForm.Exists(sFormName) Then
			objForm(sFormName)=objForm(sFormName)&", "&sFormValue		  
		Else
			objForm.Add sFormName,sFormValue
		End if
		
	End if
	tStream.Close
	iFormStart = iFormStart+iStart+2
loop until (iFormStart+2) = iFormEnd 
RequestData=""
Set tStream =Nothing
End Sub

Private Sub Class_Terminate  
if Err < 0 then
	objForm.RemoveAll
	objFile.RemoveAll
	set objForm=nothing
	set objFile=nothing
	Uupfilestream.Close
	set Uupfilestream =nothing
 end if
End Sub
   
' 取得文件路径
Private Function GetFilePath(FullPath)
If FullPath <> "" Then
	GetFilePath = left(FullPath,InStrRev(FullPath, "\"))
Else
	GetFilePath = ""
End If
End  Function
 
' 取得文件名
Private Function GetFileName(FullPath)
If FullPath <> "" Then
	GetFileName = mid(FullPath,InStrRev(FullPath, "\")+1)
Else
	GetFileName = ""
End If
End Function
 
' 取得扩展名
Private Function GetFileExt(FullPath)
If FullPath <> "" Then
	GetFileExt = mid(FullPath,InStrRev(FullPath, ".")+1)
Else
	GetFileExt = ""
End If
End Function

End Class

' 文件属性类
Class FileInfo
Dim FormName,FileName,FilePath,FileSize,FileType,FileStart,FileExt
Private Sub Class_Initialize 
FileName = ""
FilePath = ""
FileSize = 0
FileStart= 0
FormName = ""
FileType = ""
FileExt = ""
End Sub
  
Public Function SaveAs(FullPath)
Dim dr,ErrorChar,i
SaveAs=true
If trim(fullpath)="" or FileStart=0 or FileName="" or right(fullpath,1)="/" then exit Function
Set dr=CreateObject("Adodb.Stream")
dr.Mode=3
dr.Type=1
dr.Open
Uupfilestream.position=FileStart
Uupfilestream.copyto dr,FileSize
dr.SaveToFile FullPath,2
dr.Close
Set dr=nothing 
SaveAs=false
End Function
End Class
</SCRIPT>