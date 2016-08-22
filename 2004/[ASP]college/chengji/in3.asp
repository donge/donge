<!--#include file="conn.asp"-->

<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">


<%
 dim rs,bh
 dim sql
 bt=trim(request("bt"))
 nr=trim(request("nr"))
 bh=trim(request("bh"))

 if bt="" then response.redirect("error.asp?word=标题不可以为空")
 if nr="" then response.redirect("error.asp?word=内容不可以为空")
 
  set rs=server.createobject("adodb.recordset")
 sql="select * from gg where bh='" + bh + "'"
 rs.open sql,conn,3,3
 if not rs.eof then
   rs.close
   set rs=nothing
   conn.close
   set conn=nothing
   response.redirect("error.asp?word=该编号已经存在")
else

 
 
 
 
  set rs=server.createobject("adodb.recordset")
 sql="select * from gg where bh is null"
 rs.open sql,conn,3,3
 rs.addnew
 rs("bt")=request("bt")
 rs("nr")=Replace(Request.Form("nr"),"'","''")
 rs("bh")=request("bh")

 rs.update
 rs.close
 set rs=nothing
 conn.close
 set conn=nothing
 
  response.write("<center>增加公告成功！</center>") 

  end if
 
%>


<p>
<center><a href=lrgg.asp>增加下一条公告</a></center>