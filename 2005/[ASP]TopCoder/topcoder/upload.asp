<!---#include file="_common.asp"-->
<!---#include file="global.asp"-->
<!---#include file="class/upload.asp"-->
<%
//====== Upload PAGE OUTPUT ==================================
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-05-07 11:26:22
//============================================================

// Main Layout -------------------------------------------------------------
if(theUser.rights["upload"]<1||theCache.settings["enableUpload"]!=1){
  write(lang["no_rights"]);
  Response.End;
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<%=globalEncoding%>" />
<link href="<%=theCache.settings["styleSheet"]%>" rel="stylesheet" type="text/css" />
</head>
<body class="upload-page">
<%
if(input["act"]=="upload"){
  doUpload(theCache.settings["uploadPath"],theCache.settings["uploadSize"]);
}else{
  outputUploadForm();
}
%>
</body>
</html>

<%
// Upload Form ------------------------------------------------------------
function outputUploadForm(){
%>
<form id="fform" enctype="multipart/form-data" method="post" action="?act=upload" style="display: inline">
  <input name="File" type="File" style="font-size:12px;" size="40" class="text upload-file" />&nbsp;
  <input type="Submit" name="Submit" value=" <%=lang["upload"]%> " class="button" />
</form>
<%
}

// Upload Error Message ------------------------------------------------------------
function outputUploadError(strFlag){
%>
<div class="upload-error">
  <%
  if(strFlag=="upload") write(lang["upload_object_fail"]);
  if(strFlag=="size") write(lang["file_size_limit"]+" ("+theCache.settings["uploadSize"]+" bytes)");
  if(strFlag=="type") write(lang["file_type_limit"]+" ("+theCache.settings["uploadTypes"]+")");
  if(strFlag=="write") write(lang["file_write_fail"]);
  %>
  &nbsp;
  <input type="button" value=" <%=lang["back"]%> " onClick="window.history.back()" class="button" />
</div>
<%
}

// Upload Done Message ------------------------------------------------------------
function outputUploadDone(strExt, filePath){
  var strScript='<script type="text/javascript" language="javascript">parent.document.inputform.message.value+="\\n';
  if(strExt=="gif"||strExt=="jpg"||strExt=="bmp"||strExt=="png"||strExt=="tif"){
    strScript+="[img]"+filePath+"[/img]";
  }else if(strExt=="wma"||strExt=="mp3"||strExt=="avi"||strExt=="wmv"||strExt=="asf"){
    strScript+="[wmp]"+filePath+"[/wmp]";
  }else if(strExt=="ra"||strExt=="rm"||strExt=="rmvb"){
    strScript+="[rm]"+filePath+"[/rm]";
  }else if(strExt=="swf"){
    strScript+="[swf]"+filePath+"[/swf]";
  }else if(strExt=="mov"){
    strScript+="[qt]"+filePath+"[/qt]";
  }else{
    strScript+="[file="+filePath+"]"+lang["click_download"]+"[/file]";
  }
  strScript+="\"</script>";
%>
<div class="upload-done">
  <%=strScript%>
  <%=lang["upload_done"]%>
  &nbsp;
  <input type="button" value=" <%=lang["back"]%> " onclick="window.history.back()" class="button" />
</div>
<%
}
%>

<script runat="server" language="vbscript">
'Upload File - I have to use VBScript to call the Upload Class
Function doUpload(uploadPath, uploadSize)
  
  On Error Resume Next

  'Check if sub-folder exists --------------------------------
  Set folder=Server.CreateObject("Scripting.FileSystemObject")
  Dim folderName
  folderName=func.getDateTimeString("YYMM")
  If folder.FolderExists(Server.MapPath(uploadPath))=False Then
    folder.CreateFolder Server.MapPath(uploadPath)
  End If
  If folder.FolderExists(Server.MapPath(uploadPath & folderName))=False Then
    folder.CreateFolder Server.MapPath(uploadPath & folderName)
  End If
  Set folder=Nothing

  If Err<>0 Then
    Err.Clear
    outputUploadError("upload")
    Exit Function
  End If

  'Create Upload Object & get the file we want ----------------
  Set uploader=New FileUploader
  If uploader.GetData()=False Then
    outputUploadError("upload")
  Else
    'Check for File size and File extension Then Save the file
    If uploader.FileSize < 1 Then
      outputUploadError("upload")
    ElseIf uploader.FileSize > uploadSize Then
      outputUploadError("size")
    ElseIf isValidType(uploader.FileExt) = False Then
      outputUploadError("type")
    Else  
      Dim newFilePath
      newFilePath=Left(func.getDateTimeString("DD_hhiiss")+"_"+cleanFileName(uploader.FileName),120)+"."+uploader.FileExt
      newFilePath=uploadPath+folderName+"/"+newFilePath
      If uploader.SaveAs(Server.MapPath(newFilePath)) = False Then
        outputUploadError("write")
      Else
        outputUploadDone uploader.FileExt,newFilePath
      End If
    End If
  End If

  Set theFile=Nothing
  Set uploader=Nothing

End Function
</script>

<script runat="server" language="jscript">
// Check File Type
function isValidType(str){
  var list=theCache.settings["uploadTypes"].toLowerCase().split(",")
  str=str.toLowerCase();
  for(var i=0;i<list.length;i++){
    if(str==list[i]) return true;
  }
  return false;
}

// Clean up File Name
function cleanFileName(str){
  str = str.replace(/[^_\.a-zA-Z\d]/ig,"");
  str = str.replace(/^[\/\.]+/,"");
  return str;
}
</script>