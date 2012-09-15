<script language="JScript" runAt="server">
// Check if file is called inside LBS
var inLBS;
if(inLBS!=true){
  Response.write("Invalid Call");
  Response.End();
}
</script>
<script language="vbscript" runat="server">
'====== CLASS FileUploader ====================================
'This Class is modified from the Upload_5xSoft Class
'============================================================

'This object is shared by FileUpload and FileItem Class
Class FileUploader

  Dim fileStream, hasGetFile 'Global Variables
  Dim FieldName,FileName,FilePath,FileSize,FileType,FileExt 'File Attributes

  '// Class Initialization ////////////////////////////////
  Private Sub Class_Initialize
    hasGetFile = False
    FileName = ""
    FilePath = ""
    FileSize = 0
    FieldName = ""
    FileType = ""
    FileExt = ""
  End Sub

  '// Class Termination ////////////////////////////////
  Private Sub Class_Terminate 
    'Clear Object
    If hasGetFile Then
      fileStream.Close
      Set fileStream=Nothing
    End If
  End Sub

  '// Get File Data from Post Form ////////////////////////////////
  Public Function GetData()
    Dim dataStream,tStream
    Dim binaryData,sStart,binCrLf,sData,iInfoStart,iFieldEnd,iFormStart,oFileItem
    Dim iFileSize,sFilePath,sFileType,sFormvalue,sFileName, iFileStart
    Dim iPosStart,iPosEnd
    Dim iFieldStart,iFormEnd,sFieldName

    GetData = False
    
    'Exit if there is nothing to get
    If Request.TotalBytes < 1 Then Exit Function

    On Error Resume Next

    Set dataStream = Server.CreateObject("ADODB.Stream") 'Stream used for whole form data
    Set tStream = Server.CreateObject("ADODB.Stream") 'Stream used for retrieve form item data
    
    'Check If Objects are created
    If Err<>0 Then
      Err.Clear
      Exit Function
    End If

    'Read in binary data
    dataStream.Type = 1
    dataStream.Mode = 3
    dataStream.Open 
    dataStream.Write Request.BinaryRead(Request.TotalBytes)
    dataStream.Position=0
  
    'Create a binary string
    binaryData = dataStream.Read 
    
    'Get stream end position
    iFormEnd = dataStream.Size


    'Get field start position
    binCrLf = ChrB(13) & ChrB(10)
    sStart = MidB(binaryData,1,InStrB(1,binaryData,binCrLf)-1)
    iFormStart = LenB(sStart)
    iFieldStart = iFormStart+2

    'Read in fields one by one
    While (iFieldStart + 10) < iFormEnd
      'Get end position of current Field
      iFieldEnd = InStrB(iFieldStart,binaryData,binCrLf&binCrLf)+3
      
      'Retrieve data segment of current field
      tStream.Type = 1
      tStream.Mode = 3
      tStream.Open
      dataStream.Position = iFieldStart
      dataStream.CopyTo tStream,iFieldEnd-iFieldStart
      tStream.Position = 0
      tStream.Type = 2
      tStream.Charset = globalEncoding
      'Get a string version of field data
      sData = tStream.ReadText 
      tStream.Close

      'Get form item name
      iFieldStart = InStrB(iFieldEnd,binaryData,sStart)-1
      iPosStart = InStr(22,sData,"name=""",1)+6
      iPosEnd = InStr(iPosStart,sData,"""",1)
      sFieldName = LCase(Mid(sData,iPosStart,iPosEnd-iPosStart))

      'If it is a File
      If InStr (45,sData,"filename=""",1) > 0 Then
        'Get full file path
        iPosStart = InStr(iPosEnd,sData,"filename=""",1)+10
        iPosEnd = InStr(iPosStart,sData,"""",1)
        sFileName = Mid (sData,iPosStart,iPosEnd-iPosStart)
        FileName = GetFileName(sFileName)
        FilePath = GetFilePath(sFileName)
        FileExt = GetFileExt(sFileName)
        'Get file content-type
        iPosStart = InStr(iPosEnd,sData,"Content-Type: ",1)+14
        iPosEnd = InStr(iPosStart,sData,vbCr)
        FileType = Mid(sData,iPosStart,iPosEnd-iPosStart)
        'Get file size
        iFileStart = iFieldEnd
        FileSize = iFieldStart - iFieldEnd - 2
        'Copy file data stream to fileStream object
        Set fileStream = Server.CreateObject("ADODB.Stream")
        fileStream.Type=1
        fileStream.Mode=3
        fileStream.Open
        dataStream.Position=iFileStart
        dataStream.CopyTo fileStream,FileSize
        'Jump out of the loop immediately
        iFieldStart=iFormEnd
        hasGetFile = True
      End If
      iFieldStart = iFormStart+iFieldStart+1
      'Exit at the end of stream
    Wend 

    dataStream.Close
    binaryData = Nothing
    set tStream = Nothing
    set dataStream = Nothing
    
    GetData = True
  End Function

  'Get File Path
  Private Function GetFilePath(FullPath)
    If FullPath <> "" Then
      GetFilePath = LCase(Left(FullPath,InStrRev(FullPath, "\")))
    Else
      GetFilePath = ""
    End If
  End Function

  'Get File Name
  Private Function GetFileName(FullPath)
    If FullPath <> "" Then
      GetFileName = LCase(Mid(FullPath,InStrRev(FullPath, "\")+1,InStrRev(FullPath, ".")-InStrRev(FullPath, "\")-1))
    Else
      GetFileName = ""
    End If
  End Function

  'Get File Extension
  Private Function GetFileExt(FullPath)
    If FullPath <> "" Then
      GetFileExt = LCase(Mid(FullPath,InStrRev(FullPath, ".")+1))
    Else
      GetFileExt = ""
    End If
  End Function

  '// Save File Method ///////////////////////////////////////////
  Public Function SaveAs(strFullPath)
    SaveAs=False

    If Trim(strFullPath)="" Or FileSize=0 Or Trim(FileName)="" Or Right(strFullPath,1)="/" Then Exit Function

    On Error Resume Next

    fileStream.SaveToFile strFullPath, 2 'Overwrite if file already exists

    SaveAs=True
    If Err<>0 Then
      Err.Clear
      SaveAs=False
    End If

  End Function

  '// Get File Data ///////////////////////////////////////////
  Public Function GetFileData
    fileStream.Position = 0
    GetFileData=fileStream.Read(FileSize)
  End Function

End Class
</script>