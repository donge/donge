
<%@ language=vbscript %>
<!--#include file="conn.asp"-->
<%
s= request("s")
mzxs1=request("mzxs1")
mzxs=request("mzxs")
xq=request("mc")

%>

<html>
 <head>
  <title>�����趨</title>
 </head>
<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">
  <p>
<form action=bjmfx.asp?s=<%=s%>&mzxs1=<%=mzxs1%>&mzxs=<%=mzxs%>&xq=<%=xq%> method=post>
 <center>
  ��������<br><font color=red><%=s%></font><br><font color=green>��<%=xq%>ѧ��<br><%=mzxs%></font><br>������ֵ
   
  </center>
      <center><input type=text name="mf" size=4 maxlength=4 value="100"></center><p>
   
       <center><input type=submit value="�ύ" align=center></center>
  </form>
  </body>
</html>