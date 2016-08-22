<% 
'=================================================
' XML Class for PJBlog2
' Author: PuterJam
' UpdateDate: 2006-1-19
'=================================================

Class PXML
  Public XmlPath
  Private errorcode
  Private XMLMorntekDocument

  Private Sub Class_Initialize()
   errorcode=-1
  end sub
  
  Private Sub Class_Terminate()

  end sub
  
  '------------------------------------------------ 
  '函数名字：Open() 
  'Open=0，XMLMorntekDocument就是一个成功装载XML文档的对象了。 
  '------------------------------------------------ 
  Public function Open()
  on error resume next
     dim strSourceFile,strError
     Set XMLMorntekDocument = Server.CreateObject(getXMLDOM)
       If Err Then
	    errorcode=-18239123
	    Err.clear
	    exit function
	   end if
     XMLMorntekDocument.async = false  
     strSourceFile = Server.MapPath(XmlPath) 
     XMLMorntekDocument.load(strSourceFile) 
     errorcode=XMLMorntekDocument.parseerror.errorcode
  end function 

  '------------------------------------------------ 
  '函数名字：OpenXML() 
  'Open=0，XMLMorntekDocument就是一个成功装载XML文档的对象了。 
  '------------------------------------------------ 
  Public function OpenXML(xmlStr)
  on error resume next
     dim strSourceFile,strError
     Set XMLMorntekDocument = Server.CreateObject(getXMLDOM)
       If Err Then
	    errorcode=-18239123
	    Err.clear
	    exit function
	   end if
     XMLMorntekDocument.async = false
     XMLMorntekDocument.load(xmlStr)
     errorcode=XMLMorntekDocument.parseerror.errorcode
  end function 

  '------------------------------------------------ 
  '函数名字：getError() 
  '------------------------------------------------ 
  Public function getError()
   getError=errorcode
  end function 
  
  '------------------------------------------------ 
  '函数名字：CloseXml() 
  '------------------------------------------------ 
  Public function CloseXml() 
   if IsObject(XMLMorntekDocument) then 
   set XMLMorntekDocument=nothing 
   end if 
  end function 
  
  
  '------------------------------------------------ 
  'SelectXmlNodeText(elementname) 
  '获得当个 elementname 元素
  '------------------------------------------------ 
  Public function SelectXmlNodeText(elementname)  
      on error resume next
      dim temp
      temp=XMLMorntekDocument.getElementsByTagName(elementname).item(0).text
      selectXmlNodeText= temp
      if err then selectXmlNodeText=0
  end function
  
  '------------------------------------------------ 
  'SelectXmlNode(elementname,itemID) 
  '获得当个 elementname 元素
  '------------------------------------------------ 
  Public function SelectXmlNode(elementname,itemID) 
      dim temp
      set temp=XMLMorntekDocument.getElementsByTagName(elementname).item(itemID)
      set SelectXmlNode= temp
  end function
  
    '------------------------------------------------ 
  'GetXmlNodeLength(elementname) 
  '获得当个 elementname 元素的Length值 
  '------------------------------------------------ 
  Public function GetXmlNodeLength(elementname)  
      on error resume next 
      dim XmlLength
      XmlLength=XMLMorntekDocument.getElementsByTagName(elementname).length
      GetXmlNodeLength= XmlLength
      if err then GetXmlNodeLength=0
  end function
  
  '------------------------------------------------ 
  'GetAttributes(elementname,nodeName,ID) 
  '获得当个 elementname 元素的attributes值 
  '------------------------------------------------ 
  Public function GetAttributes(elementname,nodeName,itemID)  
      dim XmlAttributes,i
      set XmlAttributes=XMLMorntekDocument.getElementsByTagName(elementname).item(itemID).attributes
      for i=0 to XmlAttributes.length-1
       if XmlAttributes(i).name=nodeName then 
        GetAttributes=XmlAttributes(i).value
        exit function
       end if
      next
      GetAttributes = 0
  end function  
  
  '------------------------------------------------ 
  'SelectXmlNodeItemText(elementname,ID) 
  '获得当个某 elementname 元素的Length值 
  '------------------------------------------------ 
  Public function SelectXmlNodeItemText(elementname,ID) 
      on error resume next 
      dim temp
      temp=XMLMorntekDocument.getElementsByTagName(elementname).item(ID).text
      SelectXmlNodeItemText= temp
      if err then SelectXmlNodeItemText=""
  end function

  '------------------------------------------------ 
  'WriteXmlNodeItemText(elementname,ID) 
  '写入当个某 elementname 元素的text值 
  '------------------------------------------------ 
  Public function WriteXmlNodeItemText(elementname,ID,str) 
      on error resume next 
      WriteXmlNodeItemText=0
      dim temp,temp1
      set temp=XMLMorntekDocument.getElementsByTagName(elementname).item(ID)
      temp.childNodes(0).text=str
	  XMLMorntekDocument.save Server.MapPath(XmlPath)
      if err then WriteXmlNodeItemText=err.Description
  end function

  '------------------------------------------------ 
  'IsXmlNode(elementname) 
  '检测是否存在 elementname 元素 
  'True代表存在,False代表不存在 
  '------------------------------------------------ 
  Public function IsXmlNode(elementname)
   dim Temp
   IsXmlNode=true
   on error resume next
   Temp=XMLMorntekDocument.getElementsByTagName(elementname).item(0).text
   if err>0 then
    err.clear
    IsXmlNode=false
   end if
  end function
end Class
%>