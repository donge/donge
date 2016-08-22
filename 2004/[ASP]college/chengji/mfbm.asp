
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
  <title>满分设定</title>
 </head>
<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">
  <p>
<form action=bjmfx.asp?s=<%=s%>&mzxs1=<%=mzxs1%>&mzxs=<%=mzxs%>&xq=<%=xq%> method=post>
 <center>
  请您输入<br><font color=red><%=s%></font><br><font color=green>第<%=xq%>学期<br><%=mzxs%></font><br>的满分值
   
  </center>
      <center><input type=text name="mf" size=4 maxlength=4 value="100"></center><p>
   
       <center><input type=submit value="提交" align=center></center>
  </form>
  </body>
</html>