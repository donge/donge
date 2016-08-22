<!--#include file="conn.asp"-->

<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">


<%
 dim rs
 dim sql
 bh=trim(request("bh"))
 xm=trim(request("xm"))
 bm=trim(request("bm"))
 zw=trim(request("zw"))
 mm=trim(request("mm"))
 if bh="" then response.redirect("error.asp?word=登录号不可以为空")
 if xm="" then response.redirect("error.asp?word=名字不可以为空")
 if bm="" then response.redirect("error.asp?word=部门不可以为空")
 if zw="" then response.redirect("error.asp?word=职务不可以为空")
 if mm="" then response.redirect("error.asp?word=密码不可以为空")
 set rs=server.createobject("adodb.recordset")
 sql="select * from xxld where bh='" + bh + "'"
 rs.open sql,conn,3,3
 if not rs.eof then
    rs.close
    set rs=nothing
    conn.close
    set conn=nothing
    response.redirect("error.asp?word=该登录号已经存在")
 else

 set rs=server.createobject("adodb.recordset")
 sql="select * from xxld where bh is null"
 rs.open sql,conn,3,3
 rs.addnew

 rs("bh")=request("bh")
 rs("xm")=request("xm")
 rs("xb")=request("xb")
 rs("bm")=request("bm")
 rs("zw")=request("zw")
 rs("mm")=request("mm")
 rs("gl")=request("gl")

 rs.update
 rs.close
 set rs=nothing
 conn.close
 set conn=nothing
 
  response.write("<center>系级管理员增加成功！</center>") 

 end if
 

 
%>


<p>
<center><a href=sjlrgl.asp>增加下一位系级管理员</a></center>