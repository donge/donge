<%@ language=vbscript %>
<!--#include file="conn.asp"-->
<%  



  if Session.Contents("gws")=true or Session.Contents("gws1")=true then

zybj= request("zybj")
mc=request("mc")
sj=request("sj")
sql="SELECT * from cxb where zybj like '%"&zybj&"%' Order by xh" 

set rs=server.createobject("adodb.recordset")
rs.open sql,conn,3,3
if rs.eof then	
		response.write"<script language='javascript'>" 
		 response.write"alert('没有符合您要求的记录！');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end
end if
	
total=rs.recordcount
Dim i
ReDim fsjl(total)
i=0

%>
<html>
<head>
<title>科技部</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="config.css" type="text/css">
</head>
<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">



 <form action=bjcjxg.asp?sj=<%=sj%>&xhcs=<%=total%> method=post>




<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
          <div align="center"><b><font color=red><font face="华文行楷" size="6">
            <%=zybj%></font></font></b></div>      

          <div align="center"><b><font color=red>成绩录入或修改</font></b></div>      

        <div align="center"><b><font color="#0066FF">共有<font color=red><%=total%></font>位学生 
        </font></b></div>
    </td>
  </tr>
</table>



<center>

	<table border=1 cellpadding=1 cellspacing=1>
    <tr bgcolor=black style='color:white'>
    <td align=center>编号</td>
    
    <td align=center>学号</td>
       
    <td align=center>姓名</td>
    
 　 <td align=center>性别</td> 
    
    <td align=center>个人详情</td> 

    <td align=center><%=mc%>　</td>






<%
do while not rs.eof
i=i+1
xh=rs("xh")
xm=rs("xm")
xb=rs("xb")
%>

  
  
  
<% 
 If sColor = "silver" Then
		sColor = "#cccccc"
	Else
		sColor = "silver"
	End If
   
	Response.Write("<tr bgcolor='" & sColor & "'>")	 
%> 
	 

  
  
  
  
  
  
  
    
    <td align=center><font color="red"><%=i%></font>　</td>
    <td align=center><%=xh%>　</td>
    <td align=center><%=xm%>　</td>
 <%
    if xb="男" then
    	 %>
<td align=center><font color="red"><%=xb%></font>　</td>
	<%
else
	 %>
    	<td align=center><font color="green"><%=xb%></font>　</td>
<%
end if
 %>
    <td align=center>
    <a href="#" onClick="window.open('gwslyck.asp?xh=<%=xh%>&zybj=<%=zybj%>', 'Sample', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=yes,height=640,left=0,top=0')">
    <font color="blue">查看详情</font></a></td>
   

    <td align=center>


  
    <%
    if sj="fs10" then
     %>
     <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs10")%>">  </font></td>
   <%
      fsjl(i)=rs("xh")
  end if
   %>

   <%
    if sj="fs11" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs11")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")
  end if
  %>

 <%
    if sj="fs12" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs12")%>">  </font></td>
  <% 
  fsjl(i)=rs("xh")
  end if
  %>

<%
    if sj="fs13" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs13")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs14" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs14")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs15" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs15")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs16" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs16")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs17" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs17")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs18" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs18")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs19" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs19")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>



    <%
    if sj="fs110" then
     %>
     <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs110")%>">  </font></td>
   <%
      fsjl(i)=rs("xh")
  end if
   %>

   <%
    if sj="fs111" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs111")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")
  end if
  %>

 <%
    if sj="fs112" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs112")%>">  </font></td>
  <% 
  fsjl(i)=rs("xh")
  end if
  %>

<%
    if sj="fs113" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs113")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs114" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs114")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs115" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs115")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs116" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs116")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs117" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs117")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs118" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs118")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs119" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs119")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>







   
    <%
    if sj="fs20" then
     %>
     <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs20")%>">  </font></td>
   <%
    fsjl(i)=rs("xh")

  end if
%>

<%
    if sj="fs21" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs21")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs22" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs22")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs23" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs23")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs24" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs24")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs25" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs25")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs26" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs26")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs27" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs27")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs28" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs28")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs29" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs29")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>



   
    <%
    if sj="fs120" then
     %>
     <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs120")%>">  </font></td>
   <%
    fsjl(i)=rs("xh")

  end if
%>

<%
    if sj="fs121" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs121")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs122" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs122")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs123" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs123")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs124" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs124")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs125" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs125")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs126" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs126")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs127" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs127")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs128" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs128")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs129" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs129")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>









   
    <%
    if sj="fs30" then
     %>
     <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs30")%>">  </font></td>
   <%
    fsjl(i)=rs("xh")

  end if
%>

<%
    if sj="fs31" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs31")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs32" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs32")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs33" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs33")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs34" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs34")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs35" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs35")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs36" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs36")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs37" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs37")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs38" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs38")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs39" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs39")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>


   
    <%
    if sj="fs130" then
     %>
     <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs130")%>">  </font></td>
   <%
    fsjl(i)=rs("xh")

  end if
%>

<%
    if sj="fs131" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs131")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs132" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs132")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs133" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs133")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs134" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs134")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs135" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs135")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs136" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs136")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs137" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs137")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs138" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs138")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs139" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs139")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>







   
    <%
    if sj="fs40" then
     %>
     <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs40")%>">  </font></td>
   <%
    fsjl(i)=rs("xh")

  end if
%>

<%
    if sj="fs41" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs41")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs42" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs42")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs43" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs43")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs44" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs44")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs45" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs45")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs46" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs46")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs47" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs47")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs48" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs48")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs49" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs49")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>





   
    <%
    if sj="fs140" then
     %>
     <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs140")%>">  </font></td>
   <%
    fsjl(i)=rs("xh")

  end if
%>

<%
    if sj="fs141" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs141")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs142" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs142")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs143" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs143")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs144" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs144")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs145" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs145")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs146" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs146")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs147" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs147")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs148" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs148")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs149" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs149")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>






   
    <%
    if sj="fs50" then
     %>
     <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs50")%>">  </font></td>
   <%
    fsjl(i)=rs("xh")

  end if
%>

<%
    if sj="fs51" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs51")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs52" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs52")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs53" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs53")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs54" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs54")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs55" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs55")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs56" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs56")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs57" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs57")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs58" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs58")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs59" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs59")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>



    <%
    if sj="fs150" then
     %>
     <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs150")%>">  </font></td>
   <%
    fsjl(i)=rs("xh")

  end if
%>

<%
    if sj="fs151" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs151")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs152" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs152")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs153" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs153")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs154" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs154")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs155" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs155")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs156" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs156")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs157" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs157")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs158" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs158")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs159" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs159")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>









   
    <%
    if sj="fs60" then
     %>
     <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs60")%>">  </font></td>
   <%
    fsjl(i)=rs("xh")

  end if
%>

<%
    if sj="fs61" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs61")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs62" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs62")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs63" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs63")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs64" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs64")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs65" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs65")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs66" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs66")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs67" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs67")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs68" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs68")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs69" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs69")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>



    <%
    if sj="fs160" then
     %>
     <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs160")%>">  </font></td>
   <%
    fsjl(i)=rs("xh")

  end if
%>

<%
    if sj="fs161" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs161")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs162" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs162")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs163" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs163")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs164" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs164")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs165" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs165")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs166" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs166")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs167" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs167")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs168" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs168")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs169" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs169")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>






   
    <%
    if sj="fs70" then
     %>
     <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs70")%>">  </font></td>
   <%
    fsjl(i)=rs("xh")

  end if
%>

<%
    if sj="fs71" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs71")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs72" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs72")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs73" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs73")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs74" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs74")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs75" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs75")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs76" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs76")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs77" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs77")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs78" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs78")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs79" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs79")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>




    <%
    if sj="fs170" then
     %>
     <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs170")%>">  </font></td>
   <%
    fsjl(i)=rs("xh")

  end if
%>

<%
    if sj="fs171" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs171")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs172" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs172")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs173" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs173")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs174" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs174")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs175" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs175")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs176" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs176")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs177" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs177")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs178" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs178")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs179" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs179")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>










   
    <%
    if sj="fs80" then
     %>
     <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs80")%>">  </font></td>
   <%
    fsjl(i)=rs("xh")

  end if
%>

<%
    if sj="fs81" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs81")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs82" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs82")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs83" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs83")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs84" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs84")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs85" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs85")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs86" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs86")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs87" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs87")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs88" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs88")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs89" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs89")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>






   
    <%
    if sj="fs180" then
     %>
     <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs180")%>">  </font></td>
   <%
    fsjl(i)=rs("xh")

  end if
%>

<%
    if sj="fs181" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs181")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs182" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs182")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs183" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs183")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs184" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs184")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs185" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs185")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs186" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs186")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs187" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs187")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs188" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs188")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

  end if
  %>

<%
    if sj="fs189" then
    %>
    <input type=text name="<%=i%>" size=4 maxlength=4 class=i value="<%=rs("fs189")%>">  </font></td>
  <%
    fsjl(i)=rs("xh")

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
   <center>
    <br><input type=submit value="提交">&nbsp;&nbsp;&nbsp; <input type=reset value="还原"><p>

</body>
</html>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing

Application.Lock
Application("gwssz")=fsjl
Application.Unlock
else

response.write"<script language='javascript'>" 
		 response.write"alert('你没有登录！');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end

end if

%>