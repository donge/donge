
<%




  if Session.Contents("gwsly")<>true then
 %>
<!--#include file="index.asp"-->
<%  
else

%>






<!--#include file="conn.asp"-->

<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">


<%
 dim rs,bh
 dim sql
 
 nr=trim(request("nr"))
 bh=trim(request("bh"))
 xh=trim(request("xh"))
 sxh=trim(request("sxh"))


  set rs=server.createobject("adodb.recordset")
 sql="select * from ly where bh='" + bh + "'"
 rs.open sql,conn,3,3
 if not rs.eof then
   rs.close
   set rs=nothing
   conn.close
   set conn=nothing
   response.redirect("error.asp?word=该编号已经存在")
else

 
 
 
 
  set rs=server.createobject("adodb.recordset")
 sql="select * from ly where bh is null"
 rs.open sql,conn,3,3
 rs.addnew

 rs("nr")=Replace(Request.Form("nr"),"'","''")
 rs("bh")=request("bh")
 rs("fxh")=request("xh")
 rs("sxh")=request("sxh")

 rs.update
 rs.close
 set rs=nothing
 conn.close
 set conn=nothing
 
  response.write("<center>留言成功发送！</center>") 

  end if
 
%>


<p>
<center><a href=lyfind0.asp?xh=<%=xh%>>返回</a></center>


<%
end if
%>