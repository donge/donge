<SCRIPT RUNAT=SERVER LANGUAGE=VBSCRIPT>
'  ���ļ�����������
'  ��л������Щ��ʶ�Ļ���ʶ������,�����ǵİ����������¸Ҽ����ȥ
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
' ������������͵��ֽ���
If Request.TotalBytes<1 then Exit Sub
' ��ŷ��ı�����
Set objForm=Server.CreateObject("Scripting.Dictionary")
' ����ı�����
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
' ȡ��ÿ����Ŀ֮��ķָ���
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
' ȡ�ñ���Ŀ����
	iFormStart = InStrB(iInfoEnd,RequestData,sStart)-1
	iFindStart = InStr(22,sInfo,"name=""",1)+6
	iFindEnd = InStr(iFindStart,sInfo,"""",1)
	sFormName = lcase(Mid (sinfo,iFindStart,iFindEnd-iFindStart))
' ������ļ�
	If InStr (45,sInfo,"filename=""",1) > 0 Then
		Set theFile=new FileInfo
' ȡ���ļ�����
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
' ����Ǳ���Ŀ
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
   
' ȡ���ļ�·��
Private Function GetFilePath(FullPath)
If FullPath <> "" Then
	GetFilePath = left(FullPath,InStrRev(FullPath, "\"))
Else
	GetFilePath = ""
End If
End  Function
 
' ȡ���ļ���
Private Function GetFileName(FullPath)
If FullPath <> "" Then
	GetFileName = mid(FullPath,InStrRev(FullPath, "\")+1)
Else
	GetFileName = ""
End If
End Function
 
' ȡ����չ��
Private Function GetFileExt(FullPath)
If FullPath <> "" Then
	GetFileExt = mid(FullPath,InStrRev(FullPath, ".")+1)
Else
	GetFileExt = ""
End If
End Function

End Class

' �ļ�������
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