<%@ language=vbscript %>
<!--#include file="conn.asp"-->
<%  

zfwj=request("zfwj")
xq=request("xq")
mf=request("mf")
s= request("s")
mzxs=request("mzxs1")
mc=request("mzxs")

sql="SELECT * from cxb where s='" + s + "' Order by "&mzxs&" desc" 
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,3,3

sqlmax="SELECT max("&mzxs&") from cxb where s like '%"&s&"%'" 
set rsmax=server.createobject("adodb.recordset")
rsmax.Open Sqlmax,conn,1,1

sqlmin="SELECT min("&mzxs&") from cxb where s like '%"&s&"%'" 
set rsmin=server.createobject("adodb.recordset")
rsmin.Open Sqlmin,conn,1,1

sqlavg="SELECT avg("&mzxs&") As pjf from cxb where s like '%"&s&"%'" 
set rsavg=server.createobject("adodb.recordset")
rsavg.Open Sqlavg,conn,1,1

sqljg="SELECT count("&mzxs&") As pjf from cxb where s like '%"&s&"%' and "&mzxs&">="&mf&"*.6" 
set rsjg=server.createobject("adodb.recordset")
rsjg.Open Sqljg,conn,1,1

sqljg140="SELECT count("&mzxs&") As pjf from cxb where s like '%"&s&"%' and "&mzxs&">=140" 
set rsjg140=server.createobject("adodb.recordset")
rsjg140.Open Sqljg140,conn,1,1

sqljg130="SELECT count("&mzxs&") As pjf from cxb where s like '%"&s&"%' and "&mzxs&">=130 and "&mzxs&"<140" 
set rsjg130=server.createobject("adodb.recordset")
rsjg130.Open Sqljg130,conn,1,1

sqljg120="SELECT count("&mzxs&") As pjf from cxb where s like '%"&s&"%' and "&mzxs&">=120 and "&mzxs&"<130" 
set rsjg120=server.createobject("adodb.recordset")
rsjg120.Open Sqljg120,conn,1,1

sqljg110="SELECT count("&mzxs&") As pjf from cxb where s like '%"&s&"%' and "&mzxs&">=110 and "&mzxs&"<120" 
set rsjg110=server.createobject("adodb.recordset")
rsjg110.Open Sqljg110,conn,1,1

sqljg100="SELECT count("&mzxs&") As pjf from cxb where s like '%"&s&"%' and "&mzxs&">=100 and "&mzxs&"<110" 
set rsjg100=server.createobject("adodb.recordset")
rsjg100.Open Sqljg100,conn,1,1

sqljg90="SELECT count("&mzxs&") As pjf from cxb where s like '%"&s&"%' and "&mzxs&">=90 and "&mzxs&"<100" 
set rsjg90=server.createobject("adodb.recordset")
rsjg90.Open Sqljg90,conn,1,1

sqljg80="SELECT count("&mzxs&") As pjf from cxb where s like '%"&s&"%' and "&mzxs&">=80 and "&mzxs&"<90" 
set rsjg80=server.createobject("adodb.recordset")
rsjg80.Open Sqljg80,conn,1,1

sqljg70="SELECT count("&mzxs&") As pjf from cxb where s like '%"&s&"%' and "&mzxs&">=70 and "&mzxs&"<80" 
set rsjg70=server.createobject("adodb.recordset")
rsjg70.Open Sqljg70,conn,1,1

sqljg60="SELECT count("&mzxs&") As pjf from cxb where s like '%"&s&"%' and "&mzxs&">=60 and "&mzxs&"<70" 
set rsjg60=server.createobject("adodb.recordset")
rsjg60.Open Sqljg60,conn,1,1

sqljg50="SELECT count("&mzxs&") As pjf from cxb where s like '%"&s&"%' and "&mzxs&">=50 and "&mzxs&"<60" 
set rsjg50=server.createobject("adodb.recordset")
rsjg50.Open Sqljg50,conn,1,1

sqljg40="SELECT count("&mzxs&") As pjf from cxb where s like '%"&s&"%' and "&mzxs&">=40 and "&mzxs&"<50" 
set rsjg40=server.createobject("adodb.recordset")
rsjg40.Open Sqljg40,conn,1,1

sqljg30="SELECT count("&mzxs&") As pjf from cxb where s like '%"&s&"%' and "&mzxs&">=30 and "&mzxs&"<40" 
set rsjg30=server.createobject("adodb.recordset")
rsjg30.Open Sqljg30,conn,1,1

sqljg20="SELECT count("&mzxs&") As pjf from cxb where s like '%"&s&"%' and "&mzxs&">=20 and "&mzxs&"<30" 
set rsjg20=server.createobject("adodb.recordset")
rsjg20.Open Sqljg20,conn,1,1

sqljg10="SELECT count("&mzxs&") As pjf from cxb where s like '%"&s&"%' and "&mzxs&">=10 and "&mzxs&"<20" 
set rsjg10=server.createobject("adodb.recordset")
rsjg10.Open Sqljg10,conn,1,1

sqljg0="SELECT count("&mzxs&") As pjf from cxb where s like '%"&s&"%' and "&mzxs&"<10" 
set rsjg0=server.createobject("adodb.recordset")
rsjg0.Open Sqljg0,conn,1,1



if rs.eof then	
		response.write"<script language='javascript'>" 
		 response.write"alert('没有符合您要求的记录！');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end
end if
	
total=rs.recordcount

%>
<html>
<head>
<title>科技部</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="config.css" type="text/css">
</head>
<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">







<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
          <div align="center"><b><font color=red><font face="华文行楷" size="6">
            <%=s%></font></font></b></div>      

          <div align="center"><b>第<font color=red><%=xq%></font>学期单科成绩分析</b></div>      

        <div align="center"><b><font color="#0066FF">共有<font color=red><%=total%></font>位学生 
        </font></b></div>
    </td>
  </tr>
</table>



<center>

	<table border=1 cellpadding=1 cellspacing=1>
    <tr bgcolor=black style='color:white'>
    <td align=center>名次</td>
        <td align=center>班级</td>

    <td align=center>学号</td>
       
    <td align=center>姓名</td>
    
 　 <td align=center>性别</td> 
   
    <td align=center><%=mc%>　</td>






<%
do while not rs.eof
i=i+1
xh=rs("xh")
xm=rs("xm")
xb=rs("xb")
zybj=rs("zybj")

%>

  
  
  
<% 
 If sColor = "silver" Then
		sColor = "#cccccc"
	Else
		sColor = "silver"
	End If
   	Response.Write("</tr>")	 
	Response.Write("<tr bgcolor='" & sColor & "'>")	 
%>
<td align=center><font color="red"><%=i%></font>　</td>
    <td align=center><%=zybj%>　</td>

    <td align=center><%=xh%>　</td>
    <td align=center><%=xm%>　</td>
	<td align=center><%=xb%>　</td>
    <td align=center>


  
  
 
    <%
    if mzxs="fs10" then
    if rs("fs10")>=mf*.6 then
     %>
     <font color=green><%=rs("fs10")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs10")%></font>
   <%
end if
  end if
   %>

   <%
    if mzxs="fs11" then
    if rs("fs11")>=mf*.6 then
     %>
     <font color=green><%=rs("fs11")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs11")%></font>
   <%
end if
    
  end if
  %>

 <%
    if mzxs="fs12" then
      if rs("fs12")>=mf*.6 then
     %>
     <font color=green><%=rs("fs12")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs12")%></font>
   <%
end if

  
  end if
  %>

<%
    if mzxs="fs13" then
     if rs("fs13")>=mf*.6 then
     %>
     <font color=green><%=rs("fs13")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs13")%></font>
   <%
end if

  end if
  %>

<%
    if mzxs="fs14" then
    if rs("fs14")>=mf*.6 then
     %>
     <font color=green><%=rs("fs14")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs14")%></font>
   <%
end if
    

  end if
  %>

<%
    if mzxs="fs15" then
     if rs("fs15")>=mf*.6 then
     %>
     <font color=green><%=rs("fs15")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs15")%></font>
   <%
end if
    

  end if
  %>

<%
    if mzxs="fs16" then
   if rs("fs16")>=mf*.6 then
     %>
     <font color=green><%=rs("fs16")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs16")%></font>
   <%
end if
    

  end if
  %>

<%
    if mzxs="fs17" then
    if rs("fs17")>=mf*.6 then
     %>
     <font color=green><%=rs("fs17")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs17")%></font>
   <%
end if

  end if
  %>

<%
    if mzxs="fs18" then
    if rs("fs18")>=mf*.6 then
     %>
     <font color=green><%=rs("fs18")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs18")%></font>
   <%
end if

  end if
  %>

<%
    if mzxs="fs19" then
    if rs("fs19")>=mf*.6 then
     %>
     <font color=green><%=rs("fs19")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs19")%></font>
   <%
end if
    

  end if
  %>



    <%
    if mzxs="fs110" then
    if rs("fs110")>=mf*.6 then
     %>
     <font color=green><%=rs("fs110")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs110")%></font>
   <%
end if
  end if
   %>

   <%
    if mzxs="fs111" then
    if rs("fs111")>=mf*.6 then
     %>
     <font color=green><%=rs("fs111")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs111")%></font>
   <%
end if
    
  end if
  %>

 <%
    if mzxs="fs112" then
      if rs("fs112")>=mf*.6 then
     %>
     <font color=green><%=rs("fs112")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs112")%></font>
   <%
end if

  
  end if
  %>

<%
    if mzxs="fs113" then
     if rs("fs113")>=mf*.6 then
     %>
     <font color=green><%=rs("fs113")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs113")%></font>
   <%
end if

  end if
  %>

<%
    if mzxs="fs114" then
    if rs("fs114")>=mf*.6 then
     %>
     <font color=green><%=rs("fs114")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs114")%></font>
   <%
end if
    

  end if
  %>

<%
    if mzxs="fs115" then
     if rs("fs115")>=mf*.6 then
     %>
     <font color=green><%=rs("fs115")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs115")%></font>
   <%
end if
    

  end if
  %>

<%
    if mzxs="fs116" then
   if rs("fs116")>=mf*.6 then
     %>
     <font color=green><%=rs("fs116")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs116")%></font>
   <%
end if
    

  end if
  %>

<%
    if mzxs="fs117" then
    if rs("fs117")>=mf*.6 then
     %>
     <font color=green><%=rs("fs117")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs117")%></font>
   <%
end if

  end if
  %>

<%
    if mzxs="fs118" then
    if rs("fs118")>=mf*.6 then
     %>
     <font color=green><%=rs("fs118")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs118")%></font>
   <%
end if

  end if
  %>

<%
    if mzxs="fs119" then
    if rs("fs119")>=mf*.6 then
     %>
     <font color=green><%=rs("fs119")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs119")%></font>
   <%
end if
    

  end if
  %>







   
    <%
    if mzxs="fs20" then
   if rs("fs20")>=mf*.6 then
     %>
     <font color=green><%=rs("fs20")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs20")%></font>
   <%
end if



  end if
%>

<%
    if mzxs="fs21" then
  if rs("fs21")>=mf*.6 then
     %>
     <font color=green><%=rs("fs21")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs21")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs22" then
    if rs("fs22")>=mf*.6 then
     %>
     <font color=green><%=rs("fs22")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs22")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs23" then
  if rs("fs23")>=mf*.6 then
     %>
     <font color=green><%=rs("fs23")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs23")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs24" then
    if rs("fs24")>=mf*.6 then
     %>
     <font color=green><%=rs("fs24")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs24")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs25" then
     if rs("fs25")>=mf*.6 then
     %>
     <font color=green><%=rs("fs25")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs25")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs26" then
   if rs("fs26")>=mf*.6 then
     %>
     <font color=green><%=rs("fs26")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs26")%></font>
   <%
end if 

  end if
  %>

<%
    if mzxs="fs27" then
    if rs("fs27")>=mf*.6 then
     %>
     <font color=green><%=rs("fs27")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs27")%></font>
   <%
end if
  end if
  %>

<%
    if mzxs="fs28" then
   if rs("fs28")>=mf*.6 then
     %>
     <font color=green><%=rs("fs28")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs28")%></font>
   <%
end if
  end if
  %>

<%
    if mzxs="fs29" then
   if rs("fs29")>=mf*.6 then
     %>
     <font color=green><%=rs("fs29")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs29")%></font>
   <%
end if    

  end if
  %>


   
    <%
    if mzxs="fs120" then
   if rs("fs120")>=mf*.6 then
     %>
     <font color=green><%=rs("fs120")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs120")%></font>
   <%
end if



  end if
%>

<%
    if mzxs="fs121" then
  if rs("fs121")>=mf*.6 then
     %>
     <font color=green><%=rs("fs121")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs121")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs122" then
    if rs("fs122")>=mf*.6 then
     %>
     <font color=green><%=rs("fs122")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs122")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs123" then
  if rs("fs123")>=mf*.6 then
     %>
     <font color=green><%=rs("fs123")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs123")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs124" then
    if rs("fs124")>=mf*.6 then
     %>
     <font color=green><%=rs("fs124")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs124")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs125" then
     if rs("fs125")>=mf*.6 then
     %>
     <font color=green><%=rs("fs125")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs125")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs126" then
   if rs("fs126")>=mf*.6 then
     %>
     <font color=green><%=rs("fs126")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs126")%></font>
   <%
end if 

  end if
  %>

<%
    if mzxs="fs127" then
    if rs("fs127")>=mf*.6 then
     %>
     <font color=green><%=rs("fs127")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs127")%></font>
   <%
end if
  end if
  %>

<%
    if mzxs="fs128" then
   if rs("fs128")>=mf*.6 then
     %>
     <font color=green><%=rs("fs128")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs128")%></font>
   <%
end if
  end if
  %>

<%
    if mzxs="fs129" then
   if rs("fs129")>=mf*.6 then
     %>
     <font color=green><%=rs("fs129")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs129")%></font>
   <%
end if    

  end if
  %>






   
    <%
    if mzxs="fs30" then
     if rs("fs30")>=mf*.6 then
     %>
     <font color=green><%=rs("fs30")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs30")%></font>
   <%
end if    

  end if
%>

<%
    if mzxs="fs31" then
     if rs("fs31")>=mf*.6 then
     %>
     <font color=green><%=rs("fs31")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs31")%></font>
   <%
end if    

    

  end if
  %>

<%
    if mzxs="fs32" then
    if rs("fs32")>=mf*.6 then
     %>
     <font color=green><%=rs("fs32")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs32")%></font>
   <%
end if    
 

  end if
  %>

<%
    if mzxs="fs33" then
    if rs("fs33")>=mf*.6 then
     %>
     <font color=green><%=rs("fs33")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs33")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs34" then
     if rs("fs34")>=mf*.6 then
     %>
     <font color=green><%=rs("fs34")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs34")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs35" then
      if rs("fs35")>=mf*.6 then
     %>
     <font color=green><%=rs("fs35")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs35")%></font>
   <%
end if    
    

  end if
  %>

<%
    if mzxs="fs36" then
     if rs("fs36")>=mf*.6 then
     %>
     <font color=green><%=rs("fs36")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs36")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs37" then
     if rs("fs37")>=mf*.6 then
     %>
     <font color=green><%=rs("fs37")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs37")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs38" then
      if rs("fs38")>=mf*.6 then
     %>
     <font color=green><%=rs("fs38")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs38")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs39" then
      if rs("fs39")>=mf*.6 then
     %>
     <font color=green><%=rs("fs39")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs39")%></font>
   <%
end if    

  end if
  %>


   
    <%
    if mzxs="fs130" then
     if rs("fs130")>=mf*.6 then
     %>
     <font color=green><%=rs("fs130")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs130")%></font>
   <%
end if    

  end if
%>

<%
    if mzxs="fs131" then
     if rs("fs131")>=mf*.6 then
     %>
     <font color=green><%=rs("fs131")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs131")%></font>
   <%
end if    

    

  end if
  %>

<%
    if mzxs="fs132" then
    if rs("fs132")>=mf*.6 then
     %>
     <font color=green><%=rs("fs132")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs132")%></font>
   <%
end if    
 

  end if
  %>

<%
    if mzxs="fs133" then
    if rs("fs133")>=mf*.6 then
     %>
     <font color=green><%=rs("fs133")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs133")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs134" then
     if rs("fs134")>=mf*.6 then
     %>
     <font color=green><%=rs("fs134")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs134")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs135" then
      if rs("fs135")>=mf*.6 then
     %>
     <font color=green><%=rs("fs135")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs135")%></font>
   <%
end if    
    

  end if
  %>

<%
    if mzxs="fs136" then
     if rs("fs136")>=mf*.6 then
     %>
     <font color=green><%=rs("fs136")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs136")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs137" then
     if rs("fs137")>=mf*.6 then
     %>
     <font color=green><%=rs("fs137")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs137")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs138" then
      if rs("fs138")>=mf*.6 then
     %>
     <font color=green><%=rs("fs138")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs138")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs139" then
      if rs("fs139")>=mf*.6 then
     %>
     <font color=green><%=rs("fs139")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs139")%></font>
   <%
end if    

  end if
  %>





   
    <%
    if mzxs="fs40" then
       if rs("fs40")>=mf*.6 then
     %>
     <font color=green><%=rs("fs40")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs40")%></font>
   <%
end if    
    

  end if
%>

<%
    if mzxs="fs41" then
     if rs("fs41")>=mf*.6 then
     %>
     <font color=green><%=rs("fs41")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs41")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs42" then
       if rs("fs42")>=mf*.6 then
     %>
     <font color=green><%=rs("fs42")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs42")%></font>
   <%
end if
  end if
  %>

<%
    if mzxs="fs43" then
       if rs("fs43")>=mf*.6 then
     %>
     <font color=green><%=rs("fs43")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs43")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs44" then
       if rs("fs44")>=mf*.6 then
     %>
     <font color=green><%=rs("fs44")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs44")%></font>
   <%
end if
  end if
  %>

<%
    if mzxs="fs45" then
        if rs("fs45")>=mf*.6 then
     %>
     <font color=green><%=rs("fs45")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs45")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs46" then
       if rs("fs46")>=mf*.6 then
     %>
     <font color=green><%=rs("fs46")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs46")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs47" then
     if rs("fs47")>=mf*.6 then
     %>
     <font color=green><%=rs("fs47")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs47")%></font>
   <%
end if

  end if
  %>

<%
    if mzxs="fs48" then
       if rs("fs48")>=mf*.6 then
     %>
     <font color=green><%=rs("fs48")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs48")%></font>
   <%
end if
  end if
  %>

<%
    if mzxs="fs49" then
       if rs("fs49")>=mf*.6 then
     %>
     <font color=green><%=rs("fs49")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs49")%></font>
   <%
end if    

  end if
  %>


   
    <%
    if mzxs="fs140" then
       if rs("fs140")>=mf*.6 then
     %>
     <font color=green><%=rs("fs140")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs140")%></font>
   <%
end if    
    

  end if
%>

<%
    if mzxs="fs141" then
     if rs("fs141")>=mf*.6 then
     %>
     <font color=green><%=rs("fs141")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs141")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs142" then
       if rs("fs142")>=mf*.6 then
     %>
     <font color=green><%=rs("fs142")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs142")%></font>
   <%
end if
  end if
  %>

<%
    if mzxs="fs143" then
       if rs("fs143")>=mf*.6 then
     %>
     <font color=green><%=rs("fs143")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs143")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs144" then
       if rs("fs144")>=mf*.6 then
     %>
     <font color=green><%=rs("fs144")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs144")%></font>
   <%
end if
  end if
  %>

<%
    if mzxs="fs145" then
        if rs("fs145")>=mf*.6 then
     %>
     <font color=green><%=rs("fs145")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs145")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs146" then
       if rs("fs146")>=mf*.6 then
     %>
     <font color=green><%=rs("fs146")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs146")%></font>
   <%
end if    

  end if
  %>

<%
    if mzxs="fs147" then
     if rs("fs147")>=mf*.6 then
     %>
     <font color=green><%=rs("fs147")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs147")%></font>
   <%
end if

  end if
  %>

<%
    if mzxs="fs148" then
       if rs("fs148")>=mf*.6 then
     %>
     <font color=green><%=rs("fs148")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs148")%></font>
   <%
end if
  end if
  %>

<%
    if mzxs="fs149" then
       if rs("fs149")>=mf*.6 then
     %>
     <font color=green><%=rs("fs149")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs149")%></font>
   <%
end if    

  end if
  %>




   
    <%
    if mzxs="fs50" then
       if rs("fs50")>=mf*.6 then
     %>
     <font color=green><%=rs("fs50")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs50")%></font>
   <%
end if    

  end if
%>

<%
    if mzxs="fs51" then
      if rs("fs51")>=mf*.6 then
     %>
     <font color=green><%=rs("fs51")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs51")%></font>
   <%
end if 
  end if
  %>

<%
    if mzxs="fs52" then
       if rs("fs52")>=mf*.6 then
     %>
     <font color=green><%=rs("fs52")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs52")%></font>
   <%
end if     

  end if
  %>

<%
    if mzxs="fs53" then
      if rs("fs53")>=mf*.6 then
     %>
     <font color=green><%=rs("fs53")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs53")%></font>
   <%
end if 
    

  end if
  %>

<%
    if mzxs="fs54" then
       if rs("fs54")>=mf*.6 then
     %>
     <font color=green><%=rs("fs54")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs54")%></font>
   <%
end if     

  end if
  %>

<%
    if mzxs="fs55" then
       if rs("fs55")>=mf*.6 then
     %>
     <font color=green><%=rs("fs55")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs55")%></font>
   <%
end if 
  end if
  %>

<%
    if mzxs="fs56" then
        if rs("fs56")>=mf*.6 then
     %>
     <font color=green><%=rs("fs56")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs56")%></font>
   <%
end if     

  end if
  %>

<%
    if mzxs="fs57" then
      if rs("fs57")>=mf*.6 then
     %>
     <font color=green><%=rs("fs57")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs57")%></font>
   <%
end if     

  end if
  %>

<%
    if mzxs="fs58" then
      if rs("fs58")>=mf*.6 then
     %>
     <font color=green><%=rs("fs58")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs58")%></font>
   <%
end if 
  end if
  %>

<%
    if mzxs="fs59" then
       if rs("fs59")>=mf*.6 then
     %>
     <font color=green><%=rs("fs59")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs59")%></font>
   <%
end if     

  end if
  %>


   
    <%
    if mzxs="fs150" then
       if rs("fs150")>=mf*.6 then
     %>
     <font color=green><%=rs("fs150")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs150")%></font>
   <%
end if    

  end if
%>

<%
    if mzxs="fs151" then
      if rs("fs151")>=mf*.6 then
     %>
     <font color=green><%=rs("fs151")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs151")%></font>
   <%
end if 
  end if
  %>

<%
    if mzxs="fs152" then
       if rs("fs152")>=mf*.6 then
     %>
     <font color=green><%=rs("fs152")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs152")%></font>
   <%
end if     

  end if
  %>

<%
    if mzxs="fs153" then
      if rs("fs153")>=mf*.6 then
     %>
     <font color=green><%=rs("fs153")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs153")%></font>
   <%
end if 
    

  end if
  %>

<%
    if mzxs="fs154" then
       if rs("fs154")>=mf*.6 then
     %>
     <font color=green><%=rs("fs154")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs154")%></font>
   <%
end if     

  end if
  %>

<%
    if mzxs="fs155" then
       if rs("fs155")>=mf*.6 then
     %>
     <font color=green><%=rs("fs155")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs155")%></font>
   <%
end if 
  end if
  %>

<%
    if mzxs="fs156" then
        if rs("fs156")>=mf*.6 then
     %>
     <font color=green><%=rs("fs156")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs156")%></font>
   <%
end if     

  end if
  %>

<%
    if mzxs="fs157" then
      if rs("fs157")>=mf*.6 then
     %>
     <font color=green><%=rs("fs157")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs157")%></font>
   <%
end if     

  end if
  %>

<%
    if mzxs="fs158" then
      if rs("fs158")>=mf*.6 then
     %>
     <font color=green><%=rs("fs158")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs158")%></font>
   <%
end if 
  end if
  %>

<%
    if mzxs="fs159" then
       if rs("fs159")>=mf*.6 then
     %>
     <font color=green><%=rs("fs159")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs159")%></font>
   <%
end if     

  end if
  %>




   
    <%
    if mzxs="fs60" then
      if rs("fs60")>=mf*.6 then
     %>
     <font color=green><%=rs("fs60")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs60")%></font>
   <%
end if 
  end if
%>

<%
    if mzxs="fs61" then
      if rs("fs61")>=mf*.6 then
     %>
     <font color=green><%=rs("fs61")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs61")%></font>
   <%
end if 
    

  end if
  %>

<%
    if mzxs="fs62" then
      if rs("fs62")>=mf*.6 then
     %>
     <font color=green><%=rs("fs62")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs62")%></font>
   <%
end if 
    

  end if
  %>

<%
    if mzxs="fs63" then
      if rs("fs63")>=mf*.6 then
     %>
     <font color=green><%=rs("fs63")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs63")%></font>
   <%
end if 

  end if
  %>

<%
    if mzxs="fs64" then
      if rs("fs64")>=mf*.6 then
     %>
     <font color=green><%=rs("fs64")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs64")%></font>
   <%
end if 
    

  end if
  %>

<%
    if mzxs="fs65" then
      if rs("fs65")>=mf*.6 then
     %>
     <font color=green><%=rs("fs65")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs65")%></font>
   <%
end if 

  end if
  %>

<%
    if mzxs="fs66" then
      if rs("fs66")>=mf*.6 then
     %>
     <font color=green><%=rs("fs66")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs66")%></font>
   <%
end if 

  end if
  %>

<%
    if mzxs="fs67" then
       if rs("fs67")>=mf*.6 then
     %>
     <font color=green><%=rs("fs67")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs67")%></font>
   <%
end if 

  end if
  %>

<%
    if mzxs="fs68" then
     if rs("fs68")>=mf*.6 then
     %>
     <font color=green><%=rs("fs68")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs68")%></font>
   <%
end if 

    

  end if
  %>

<%
    if mzxs="fs69" then
     if rs("fs69")>=mf*.6 then
     %>
     <font color=green><%=rs("fs69")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs69")%></font>
   <%
end if 
    

  end if
  %>

 
    <%
    if mzxs="fs160" then
      if rs("fs160")>=mf*.6 then
     %>
     <font color=green><%=rs("fs160")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs160")%></font>
   <%
end if 
  end if
%>

<%
    if mzxs="fs161" then
      if rs("fs161")>=mf*.6 then
     %>
     <font color=green><%=rs("fs161")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs161")%></font>
   <%
end if 
    

  end if
  %>

<%
    if mzxs="fs162" then
      if rs("fs162")>=mf*.6 then
     %>
     <font color=green><%=rs("fs162")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs162")%></font>
   <%
end if 
    

  end if
  %>

<%
    if mzxs="fs163" then
      if rs("fs163")>=mf*.6 then
     %>
     <font color=green><%=rs("fs163")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs163")%></font>
   <%
end if 

  end if
  %>

<%
    if mzxs="fs164" then
      if rs("fs164")>=mf*.6 then
     %>
     <font color=green><%=rs("fs164")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs164")%></font>
   <%
end if 
    

  end if
  %>

<%
    if mzxs="fs165" then
      if rs("fs165")>=mf*.6 then
     %>
     <font color=green><%=rs("fs165")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs165")%></font>
   <%
end if 

  end if
  %>

<%
    if mzxs="fs166" then
      if rs("fs166")>=mf*.6 then
     %>
     <font color=green><%=rs("fs166")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs166")%></font>
   <%
end if 

  end if
  %>

<%
    if mzxs="fs167" then
       if rs("fs167")>=mf*.6 then
     %>
     <font color=green><%=rs("fs167")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs167")%></font>
   <%
end if 

  end if
  %>

<%
    if mzxs="fs168" then
     if rs("fs168")>=mf*.6 then
     %>
     <font color=green><%=rs("fs168")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs168")%></font>
   <%
end if 

    

  end if
  %>

<%
    if mzxs="fs169" then
     if rs("fs169")>=mf*.6 then
     %>
     <font color=green><%=rs("fs169")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs169")%></font>
   <%
end if 
    

  end if
  %>




   
    <%
    if mzxs="fs70" then
      if rs("fs70")>=mf*.6 then
     %>
     <font color=green><%=rs("fs70")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs70")%></font>
   <%
end if 

  end if
%>

<%
    if mzxs="fs71" then
   if rs("fs71")>=mf*.6 then
     %>
     <font color=green><%=rs("fs71")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs71")%></font>
   <%
end if 


  end if
  %>

<%
    if mzxs="fs72" then
    if rs("fs72")>=mf*.6 then
     %>
     <font color=green><%=rs("fs72")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs72")%></font>
   <%
end if 
    

  end if
  %>

<%
    if mzxs="fs73" then
     if rs("fs73")>=mf*.6 then
     %>
     <font color=green><%=rs("fs73")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs73")%></font>
   <%
end if 
    

  end if
  %>

<%
    if mzxs="fs74" then
     if rs("fs74")>=mf*.6 then
     %>
     <font color=green><%=rs("fs74")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs74")%></font>
   <%
end if 

  end if
  %>

<%
    if mzxs="fs75" then
    if rs("fs75")>=mf*.6 then
     %>
     <font color=green><%=rs("fs75")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs75")%></font>
   <%
end if 

  end if
  %>

<%
    if mzxs="fs76" then
     if rs("fs76")>=mf*.6 then
     %>
     <font color=green><%=rs("fs76")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs76")%></font>
   <%
end if 

  end if
  %>

<%
    if mzxs="fs77" then
    if rs("fs77")>=mf*.6 then
     %>
     <font color=green><%=rs("fs77")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs77")%></font>
   <%
end if 

  end if
  %>

<%
    if mzxs="fs78" then
    if rs("fs78")>=mf*.6 then
     %>
     <font color=green><%=rs("fs78")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs78")%></font>
   <%
end if 

  end if
  %>

<%
    if mzxs="fs79" then
     if rs("fs79")>=mf*.6 then
     %>
     <font color=green><%=rs("fs79")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs79")%></font>
   <%
end if 

  end if
  %>


   
    <%
    if mzxs="fs170" then
      if rs("fs170")>=mf*.6 then
     %>
     <font color=green><%=rs("fs170")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs170")%></font>
   <%
end if 

  end if
%>

<%
    if mzxs="fs171" then
   if rs("fs171")>=mf*.6 then
     %>
     <font color=green><%=rs("fs171")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs171")%></font>
   <%
end if 


  end if
  %>

<%
    if mzxs="fs172" then
    if rs("fs172")>=mf*.6 then
     %>
     <font color=green><%=rs("fs172")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs172")%></font>
   <%
end if 
    

  end if
  %>

<%
    if mzxs="fs173" then
     if rs("fs173")>=mf*.6 then
     %>
     <font color=green><%=rs("fs173")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs173")%></font>
   <%
end if 
    

  end if
  %>

<%
    if mzxs="fs174" then
     if rs("fs174")>=mf*.6 then
     %>
     <font color=green><%=rs("fs174")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs174")%></font>
   <%
end if 

  end if
  %>

<%
    if mzxs="fs175" then
    if rs("fs175")>=mf*.6 then
     %>
     <font color=green><%=rs("fs175")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs175")%></font>
   <%
end if 

  end if
  %>

<%
    if mzxs="fs176" then
     if rs("fs176")>=mf*.6 then
     %>
     <font color=green><%=rs("fs176")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs176")%></font>
   <%
end if 

  end if
  %>

<%
    if mzxs="fs177" then
    if rs("fs177")>=mf*.6 then
     %>
     <font color=green><%=rs("fs177")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs177")%></font>
   <%
end if 

  end if
  %>

<%
    if mzxs="fs178" then
    if rs("fs178")>=mf*.6 then
     %>
     <font color=green><%=rs("fs178")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs178")%></font>
   <%
end if 

  end if
  %>

<%
    if mzxs="fs179" then
     if rs("fs179")>=mf*.6 then
     %>
     <font color=green><%=rs("fs179")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs179")%></font>
   <%
end if 

  end if
  %>




   
    <%
    if mzxs="fs80" then
   if rs("fs80")>=mf*.6 then
     %>
     <font color=green><%=rs("fs80")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs80")%></font>
   <%
end if 

  end if
%>

<%
    if mzxs="fs81" then
    if rs("fs81")>=mf*.6 then
     %>
     <font color=green><%=rs("fs81")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs81")%></font>
   <%
end if 
  end if
  %>

<%
    if mzxs="fs82" then
    if rs("fs82")>=mf*.6 then
     %>
     <font color=green><%=rs("fs82")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs82")%></font>
   <%
end if 
  end if
  %>

<%
    if mzxs="fs83" then
  if rs("fs83")>=mf*.6 then
     %>
     <font color=green><%=rs("fs83")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs83")%></font>
   <%
end if 
  end if
  %>

<%
    if mzxs="fs84" then
   if rs("fs84")>=mf*.6 then
     %>
     <font color=green><%=rs("fs84")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs84")%></font>
   <%
end if 
  end if
  %>

<%
    if mzxs="fs85" then
   if rs("fs85")>=mf*.6 then
     %>
     <font color=green><%=rs("fs85")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs85")%></font>
   <%
end if     

  end if
  %>

<%
    if mzxs="fs86" then
    if rs("fs86")>=mf*.6 then
     %>
     <font color=green><%=rs("fs86")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs86")%></font>
   <%
end if 
  end if
  %>

<%
    if mzxs="fs87" then
   if rs("fs87")>=mf*.6 then
     %>
     <font color=green><%=rs("fs87")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs87")%></font>
   <%
end if 
  end if
  %>

<%
    if mzxs="fs88" then
  if rs("fs88")>=mf*.6 then
     %>
     <font color=green><%=rs("fs88")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs88")%></font>
   <%
end if 
  end if
  %>

<%
    if mzxs="fs89" then
   if rs("fs89")>=mf*.6 then
     %>
     <font color=green><%=rs("fs89")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs89")%></font>
   <%
end if     

  end if
  %> 　
  
  
  
    <%
    if mzxs="fs180" then
   if rs("fs180")>=mf*.6 then
     %>
     <font color=green><%=rs("fs180")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs180")%></font>
   <%
end if 

  end if
%>

<%
    if mzxs="fs181" then
    if rs("fs181")>=mf*.6 then
     %>
     <font color=green><%=rs("fs181")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs181")%></font>
   <%
end if 
  end if
  %>

<%
    if mzxs="fs182" then
    if rs("fs182")>=mf*.6 then
     %>
     <font color=green><%=rs("fs182")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs182")%></font>
   <%
end if 
  end if
  %>

<%
    if mzxs="fs183" then
  if rs("fs183")>=mf*.6 then
     %>
     <font color=green><%=rs("fs183")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs183")%></font>
   <%
end if 
  end if
  %>

<%
    if mzxs="fs184" then
   if rs("fs184")>=mf*.6 then
     %>
     <font color=green><%=rs("fs184")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs184")%></font>
   <%
end if 
  end if
  %>

<%
    if mzxs="fs185" then
   if rs("fs185")>=mf*.6 then
     %>
     <font color=green><%=rs("fs185")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs185")%></font>
   <%
end if     

  end if
  %>

<%
    if mzxs="fs186" then
    if rs("fs186")>=mf*.6 then
     %>
     <font color=green><%=rs("fs186")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs186")%></font>
   <%
end if 
  end if
  %>

<%
    if mzxs="fs187" then
   if rs("fs187")>=mf*.6 then
     %>
     <font color=green><%=rs("fs187")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs187")%></font>
   <%
end if 
  end if
  %>

<%
    if mzxs="fs188" then
  if rs("fs188")>=mf*.6 then
     %>
     <font color=green><%=rs("fs188")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs188")%></font>
   <%
end if 
  end if
  %>

<%
    if mzxs="fs189" then
   if rs("fs189")>=mf*.6 then
     %>
     <font color=green><%=rs("fs189")%></font>
   <%
   else
      %>
     <font color=red><%=rs("fs189")%></font>
   <%
end if     

  end if
  %>  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  </td>
    
    </tr>
   

    
    
    
 <%
 
 
 
rs.movenext
loop

Response.Write("</table>") 
Response.Write("</center>")

%>
 
      
  <!--#include file="bjz.asp"-->
     <font color=red size="4">
<center> <b>
  <br><font color=blue><%=zybj%></font><br><font color=green><%=mc%></font><br><font color=black>的满分值是</font><br>
       <font color=red size="5"><%=mf%>分</font><p>

 
  
     <font color=red size="4">

  
  最高分：<font color=green><%=rsmax(0)%></font>
  <font color=black>最低分：</font><font color=blue><%=rsmin(0)%></font>
  平均分：<font color=blue><%=int(rsavg("pjf")*100+.5)/100%></font><br>
  及格：<font color=green><%=rsjg(0)%>人</font>
  <font color=black>不及格：</font><font color=blue><%=total-rsjg(0)%>人</font>
  及格率：<font color=green><%=int((rsjg(0)/total)*100+.5)%>%</font>

</font></b>


    
<table border=1 cellpadding=1 cellspacing=1>
    <tr bgcolor=black style='color:white'>
        <td align=center><b><font size="4">分数段</font></b></td>
    
    <td align=center><b><font size="4">人数</font></b></td>
    <td align=center><b><font size="4">百分比</font></b></td>
    
      <tr>
    
    <td align=center><b><font size="4">140以上　</font></b></td>
    <td align=center><b><font size="4"><%=rsjg140(0)%></font></b>　</td>
    <td align=center><b><font size="4"><%=int((rsjg140(0)/total)*100+.5)%>%</font></b>　</td>

    
      <tr>
    
    <td align=center><b><font size="4">130--139　</font></b></td>
    <td align=center><b><font size="4"><%=rsjg130(0)%></font></b>　</td>
    <td align=center><b><font size="4"><%=int((rsjg130(0)/total)*100+.5)%>%</font></b>　</td>

    
      <tr>
    
    <td align=center><b><font size="4">120--129　</font></b></td>
    <td align=center><b><font size="4"><%=rsjg120(0)%></font></b>　</td>
    <td align=center><b><font size="4"><%=int((rsjg120(0)/total)*100+.5)%>%</font></b>　</td>

    
      <tr>
    
    <td align=center><b><font size="4">110--119　</font></b></td>
    <td align=center><b><font size="4"><%=rsjg110(0)%></font></b>　</td>
    <td align=center><b><font size="4"><%=int((rsjg110(0)/total)*100+.5)%>%</font></b>　</td>

    
      <tr>
    
    <td align=center><b><font size="4">100--109　</font></b></td>
    <td align=center><b><font size="4"><%=rsjg100(0)%></font></b>　</td>
    <td align=center><b><font size="4"><%=int((rsjg100(0)/total)*100+.5)%>%</font></b>　</td>

    
    <tr>
    
    <td align=center><b><font size="4">90--99　</font></b></td>
    <td align=center><b><font size="4"><%=rsjg90(0)%></font></b>　</td>
    <td align=center><b><font size="4"><%=int((rsjg90(0)/total)*100+.5)%>%</font></b>　</td>

    <tr>
    
    <td align=center><b><font size="4">80--89</font></b></td>
    <td align=center><b><font size="4"><%=rsjg80(0)%></font></b>　</td> 
    <td align=center><b><font size="4"><%=int((rsjg80(0)/total)*100+.5)%>%</font></b>　</td>
<tr>
  
    <td align=center><b><font size="4">70--79　</font></b></td>
    <td align=center><b><font size="4"><%=rsjg70(0)%></font></b>　</td>
    <td align=center><b><font size="4"><%=int((rsjg70(0)/total)*100+.5)%>%</font></b>　</td>
<tr>
    
    <td align=center><b><font size="4">60--69</font></b></td>
    <td align=center><b><font size="4"><%=rsjg60(0)%></font></b>　</td>
    <td align=center><b><font size="4"><%=int((rsjg60(0)/total)*100+.5)%>%</font></b>　</td>
    <tr>

    <td align=center><b><font size="4">50--59　</font></b></td>
    <td align=center><b><font size="4"><%=rsjg50(0)%></font></b>　</td>
    <td align=center><b><font size="4"><%=int((rsjg50(0)/total)*100+.5)%>%</font></b>　</td>
    <tr>
    
    <td align=center><b><font size="4">40--49</font></b></td>
    <td align=center><b><font size="4"><%=rsjg40(0)%></font></b>　</td>
    <td align=center><b><font size="4"><%=int((rsjg40(0)/total)*100+.5)%>%</font></b>　</td>
    <tr>
  
    <td align=center><b><font size="4">30--39　</font></b></td>
    <td align=center><b><font size="4"><%=rsjg30(0)%></font></b>　</td>
    <td align=center><b><font size="4"><%=int((rsjg30(0)/total)*100+.5)%>%</font></b>　</td>
    <tr>
    
    <td align=center><b><font size="4">20--29</font></b></td>
    <td align=center><b><font size="4"><%=rsjg20(0)%></font></b>　</td>
    <td align=center><b><font size="4"><%=int((rsjg20(0)/total)*100+.5)%>%</font></b>　</td>
    <tr>
  
    <td align=center><b><font size="4">10--19　</font></b></td>
    <td align=center><b><font size="4"><%=rsjg10(0)%></font></b>　</td>
    <td align=center><b><font size="4"><%=int((rsjg10(0)/total)*100+.5)%>%</font></b>　</td>
    <tr>
    
    <td align=center><b><font size="4">0--9</font></b></td>
    <td align=center><b><font size="4"><%=rsjg0(0)%></font></b>　</td>
    <td align=center><b><font size="4"><%=int((rsjg0(0)/total)*100+.5)%>%</font></b>　</td>
    <tr>







	</table>

  </center>

    </b>

</font>

</body>
</html>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing


%>