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
 if bh="" then response.redirect("error.asp?word=��¼�Ų�����Ϊ��")
 if xm="" then response.redirect("error.asp?word=���ֲ�����Ϊ��")
 if bm="" then response.redirect("error.asp?word=���Ų�����Ϊ��")
 if zw="" then response.redirect("error.asp?word=ְ�񲻿���Ϊ��")
 if mm="" then response.redirect("error.asp?word=���벻����Ϊ��")
 set rs=server.createobject("adodb.recordset")
 sql="select * from xxld where bh='" + bh + "'"
 rs.open sql,conn,3,3
 if not rs.eof then
    rs.close
    set rs=nothing
    conn.close
    set conn=nothing
    response.redirect("error.asp?word=�õ�¼���Ѿ�����")
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
 
  response.write("<center>ϵ������Ա���ӳɹ���</center>") 

 end if
 

 
%>


<p>
<center><a href=sjlrgl.asp>������һλϵ������Ա</a></center>