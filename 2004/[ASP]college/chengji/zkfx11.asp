<%
 zybj=request("zybj")
%>


<html>
<head>
<title>¿Æ¼¼²¿</title>


</head>

<frameset rows="*" frameborder="NO" border="0" framespacing="0"> 
  <frameset rows="*" frameborder="YES"> 
    <frameset cols="153,*" frameborder="YES"> 
    <frame src="zfx11.asp?zybj=<%=zybj%>" name="left" scrolling="yes" frameborder="NO" bordercolor="#FFFFFF" marginwidth="0" marginheight="0">
    <frame src="bjks.asp?zybj=<%=zybj%>" name="gws" scrolling="YES">
    </frameset>
  </frameset>
<body bgcolor="#3366FF">
</body>
</html>