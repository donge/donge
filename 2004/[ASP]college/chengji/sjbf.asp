 <%

  if Session.Contents("gws")<>true then
 %>
<!--#include file="gly.asp"-->
<%  
else
%>
  
<html>
<head>
<title>���ݿⱸ��</title>

</head>
<body text="#000000" background="bg01.gif">

<p align="center"><b><font size="5" color="#FF00FF">���ݿⱸ��</font></b></p>

<p><font size="4"><b>&nbsp;&nbsp;&nbsp; Ϊ��Ԥ�������������ݿ�������⣬��<font color="#FF00FF">����</font>���ر������ݿ⡣�ϴ�ʱ���Ƿ�����������ݿ���С�</b></font></p>
   <p align="center"> 
     <a href=gws.mdb><font color="#FF0000">�������ݿⱸ��</font></a></p>
     <%
end if
%>