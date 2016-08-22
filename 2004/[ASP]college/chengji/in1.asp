<!--#include file="conn.asp"-->

<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">


<%
 dim rs
 dim sql
 xh=trim(request("xh"))
 xm=trim(request("xm"))
 xb=trim(request("xb"))
 s=trim(request("s"))
 zybj=trim(request("zybj"))
 if xh="" then response.redirect("error.asp?word=学号不可以为空")
 if xm="" then response.redirect("error.asp?word=名字不可以为空")
 if s="" then response.redirect("error.asp?word=系名不可以为空")
 if zybj="" then response.redirect("error.asp?word=专业班级不可以为空")
 set rs=server.createobject("adodb.recordset")
 sql="select * from cxb where xh='" + xh + "'"
 rs.open sql,conn,3,3
 if not rs.eof then
    rs.close
    set rs=nothing
    conn.close
    set conn=nothing
    response.redirect("error.asp?word=该学号已经存在")
 else

 set rs=server.createobject("adodb.recordset")
 sql="select * from cxb where xh is null"
 rs.open sql,conn,3,3
 rs.addnew

 rs("xh")=request("xh")
 rs("xm")=request("xm")
 rs("xb")=request("xb")
 rs("s")=request("s")
 rs("zybj")=request("zybj")
 rs("bz1")=request("bz1")
 rs("bz2")=request("bz2")
 rs("xsmm")=request("xsmm")
 
 if rs("xsmm")="" then
  rs("xsmm")="gws"'缺省时的密码
  end if
  
 rs("jtdz")=request("jtdz")
 rs("lxdh")=request("lxdh")

 rs("rxsj")=request("rxsj")
 rs("bysj")=request("bysj")
 rs("zzmm")=request("zzmm")
 rs("csrq")=request("csrq")
 rs("byzs")=request("byzs")
 
 rs("jg")=request("jg")
 rs("sw")=request("sw")
 rs("jl")=request("jl")
 rs("cf")=request("cf")


 rs.update
 rs.close
 set rs=nothing
 conn.close
 set conn=nothing
 
  response.write("<center>学生记录增加成功！</center>") 

 end if
 

 
%>
<center> 

　　 <form name="mainForm" enctype="multipart/form-data" 

action="upload.asp?xh=<%=xh%>" method=post>
请选择将要上传的相片（最好使用jpg格式160*140象素）<p>
<input type=file name=mefile size="50"><p> 

　　 <input type=submit name=ok value="上传或不录入相片继续..."> 

　　 </form> 

</center>