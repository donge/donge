















<%@ language=vbscript %>
<!--#include file="conn.asp"-->
<%
zybj= request("zybj")
mc=request("mc")
sj=request("sj")
%>

<html>
 <head>
  <title>�����趨</title>
 </head>
<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">
  <p>
<form action=bjfx.asp?zybj=<%=zybj%>&mc=<%=mc%>&sj=<%=sj%> method=post>
 <center>
  ��������<br><font color=red><%=zybj%></font><br><font color=green><%=mc%></font><br>������ֵ
   
  </center>
      <center><input type=text name="mf" size=4 maxlength=4 value="100"></center><p>
   
       <center><input type=submit value="�ύ" align=center></center>
  </form>
  </body>
</html>