 <%

  if Session.Contents("gws")<>true then
 %>
<!--#include file="gly.asp"-->
<%  
else
%>
  
<html>
<head>
<title>数据库备份</title>

</head>
<body text="#000000" background="bg01.gif">

<p align="center"><b><font size="5" color="#FF00FF">数据库备份</font></b></p>

<p><font size="4"><b>&nbsp;&nbsp;&nbsp; 为了预防服务器上数据库出现意外，请<font color="#FF00FF">定期</font>下载备份数据库。上传时覆盖服务器里的数据库就行。</b></font></p>
   <p align="center"> 
     <a href=gws.mdb><font color="#FF0000">下载数据库备份</font></a></p>
     <%
end if
%>