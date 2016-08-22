<%@ language=vbscript %>
<!--#include file="conn.asp"-->
<%  



  if Session.Contents("gws")=true or Session.Contents("gws1")=true then

zybj= request("zybj")
mc=request("mc")

  dim rs,rs1,rs2
 dim sql,sql1,sql2
  set rs=server.createobject("adodb.recordset")
  set rs1=server.createobject("adodb.recordset")

if mc="1" then
 sql="select * from cxb where zybj like '%"&zybj&"%' Order by fs10+fs11+fs12+fs13+fs14+fs15+fs16+fs17+fs18+fs19+fs110+fs111+fs112+fs113+fs114+fs115+fs116+fs117+fs118+fs119 desc"
end if
if mc="2" then
 sql="select * from cxb where zybj like '%"&zybj&"%' Order by fs20+fs21+fs22+fs23+fs24+fs25+fs26+fs27+fs28+fs29+fs120+fs121+fs122+fs123+fs124+fs125+fs126+fs127+fs128+fs129 desc"
end if
if mc="3" then
 sql="select * from cxb where zybj like '%"&zybj&"%' Order by fs30+fs31+fs32+fs33+fs34+fs35+fs36+fs37+fs38+fs39+fs130+fs131+fs132+fs133+fs134+fs135+fs136+fs137+fs138+fs139 desc"
end if
if mc="4" then
 sql="select * from cxb where zybj like '%"&zybj&"%' Order by fs40+fs41+fs42+fs43+fs44+fs45+fs46+fs47+fs48+fs49+fs140+fs141+fs142+fs143+fs144+fs145+fs146+fs147+fs148+fs149 desc"
end if
if mc="5" then
 sql="select * from cxb where zybj like '%"&zybj&"%' Order by fs50+fs51+fs52+fs53+fs54+fs55+fs56+fs57+fs58+fs59+fs150+fs151+fs152+fs153+fs154+fs155+fs156+fs157+fs158+fs159 desc"
end if
if mc="6" then
 sql="select * from cxb where zybj like '%"&zybj&"%' Order by fs60+fs61+fs62+fs63+fs64+fs65+fs66+fs67+fs68+fs69+fs160+fs161+fs162+fs163+fs164+fs165+fs166+fs167+fs168+fs169 desc"
end if
if mc="7" then
 sql="select * from cxb where zybj like '%"&zybj&"%' Order by fs70+fs71+fs72+fs73+fs74+fs75+fs76+fs77+fs78+fs79+fs170+fs171+fs172+fs173+fs174+fs175+fs176+fs177+fs178+fs179 desc"
end if
if mc="8" then
 sql="select * from cxb where zybj like '%"&zybj&"%' Order by fs80+fs81+fs82+fs83+fs84+fs85+fs86+fs87+fs88+fs89+fs180+fs181+fs182+fs183+fs184+fs185+fs186+fs187+fs188+fs189 desc"
end if

 
 sql1="select * from zybjmc where zybj='" + zybj + "'"

 rs.open sql,conn,3,3
 rs1.open sql1,conn,3,3


 






if rs.eof then	
		response.write"<script language='javascript'>" 
		 response.write"alert('短嗤憲栽艇勣箔議芝村��');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end
end if
	
total=rs.recordcount

Dim js,zf
js=0
zf=0







%>
<html>
<head>
<title>親室何</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="config.css" type="text/css">
</head>
<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">







<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
          <div align="center"><b><font color=red><font face="鯖猟佩尻" size="6">
            <%=zybj%></font></font></b></div>      

          <div align="center"><b><font color=red>及<font color=black size="4">*<%=mc%>*</font>僥豚蛍裂</font></b></div>      

        <div align="center"><b><font color="#0066FF">慌嗤<font color=red><%=total%></font>了僥伏 
        </font></b></div>
    </td>
  </tr>
</table>



    <center>
	<table border=1 cellpadding=1 cellspacing=1>
	<tr bgcolor=black style='color:white'>
    <td align=center>兆肝</td>
    <td align=center>僥催</td>
    <td align=center>侖兆</td>
    <td align=center>來艶</td> 
 <%
 if mc="1" then
 %>
    <td align=center><%=rs1("fs10")%>　</td>
    <%
    if rs1("fs10")<>"" then
    js=js+1
    end if
    %>
    <td align=center><%=rs1("fs11")%>　</td>
     <%
    if rs1("fs11")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs12")%>　</td>
     <%
    if rs1("fs12")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs13")%>　</td>
     <%
    if rs1("fs13")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs14")%>　</td>
     <%
    if rs1("fs14")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs15")%>　</td>
     <%
    if rs1("fs15")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs16")%>　</td>
     <%
    if rs1("fs16")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs17")%>　</td>
     <%
    if rs1("fs17")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs18")%>　</td>
     <%
    if rs1("fs18")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs19")%>　</td>
    
     <%
    if rs1("fs19")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs110")%>　</td>
    <%
    if rs1("fs110")<>"" then
    js=js+1
    end if
    %>
    <td align=center><%=rs1("fs111")%>　</td>
     <%
    if rs1("fs111")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs112")%>　</td>
     <%
    if rs1("fs112")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs113")%>　</td>
     <%
    if rs1("fs113")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs114")%>　</td>
     <%
    if rs1("fs114")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs115")%>　</td>
     <%
    if rs1("fs115")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs116")%>　</td>
     <%
    if rs1("fs116")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs117")%>　</td>
     <%
    if rs1("fs117")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs118")%>　</td>
     <%
    if rs1("fs118")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs119")%>　</td>
    
     <%
    if rs1("fs119")<>"" then
    js=js+1
    end if
    %>
<%
end if
%>

 <%
 if mc="2" then
 %>
   
    <td align=center><%=rs1("fs20")%>　</td> 
    <%
    if rs1("fs20")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs21")%>　</td>
       <%
    if rs1("fs21")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs22")%>　</td>
       <%
    if rs1("fs22")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs23")%>　</td>
       <%
    if rs1("fs23")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs24")%>　</td>
       <%
    if rs1("fs24")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs25")%>　</td>
       <%
    if rs1("fs25")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs26")%>　</td>
       <%
    if rs1("fs26")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs27")%>　</td>
       <%
    if rs1("fs27")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs28")%>　</td>
       <%
    if rs1("fs28")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs29")%>　</td>
       <%
    if rs1("fs29")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs120")%>　</td> 
    <%
    if rs1("fs120")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs121")%>　</td>
       <%
    if rs1("fs121")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs122")%>　</td>
       <%
    if rs1("fs122")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs123")%>　</td>
       <%
    if rs1("fs123")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs124")%>　</td>
       <%
    if rs1("fs124")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs125")%>　</td>
       <%
    if rs1("fs125")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs126")%>　</td>
       <%
    if rs1("fs126")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs127")%>　</td>
       <%
    if rs1("fs127")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs128")%>　</td>
       <%
    if rs1("fs128")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs129")%>　</td>
       <%
    if rs1("fs129")<>"" then
    js=js+1
    end if
    %>
<%
end if
%>

 <%
 if mc="3" then
 %>
   
    <td align=center><%=rs1("fs30")%>　</td>
       <%
    if rs1("fs30")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs31")%>　</td>
       <%
    if rs1("fs31")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs32")%>　</td>
       <%
    if rs1("fs32")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs33")%>　</td>
       <%
    if rs1("fs33")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs34")%>　</td>
       <%
    if rs1("fs34")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs35")%>　</td>
       <%
    if rs1("fs35")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs36")%>　</td>
       <%
    if rs1("fs36")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs37")%>　</td>
       <%
    if rs1("fs37")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs38")%>　</td>
       <%
    if rs1("fs38")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs39")%>　</td>
       <%
    if rs1("fs39")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs130")%>　</td>
       <%
    if rs1("fs130")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs131")%>　</td>
       <%
    if rs1("fs131")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs132")%>　</td>
       <%
    if rs1("fs132")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs133")%>　</td>
       <%
    if rs1("fs133")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs134")%>　</td>
       <%
    if rs1("fs134")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs135")%>　</td>
       <%
    if rs1("fs135")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs136")%>　</td>
       <%
    if rs1("fs136")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs137")%>　</td>
       <%
    if rs1("fs137")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs138")%>　</td>
       <%
    if rs1("fs138")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs139")%>　</td>
       <%
    if rs1("fs139")<>"" then
    js=js+1
    end if
    %>
<%
end if
%>


 <%
 if mc="4" then
 %>
   
    <td align=center><%=rs1("fs40")%>　</td>
       <%
    if rs1("fs40")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs41")%>　</td>
        <%
    if rs1("fs41")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs42")%>　</td>
         <%
    if rs1("fs42")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs43")%>　</td>
         <%
    if rs1("fs43")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs44")%>　</td>
         <%
    if rs1("fs44")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs45")%>　</td>
         <%
    if rs1("fs45")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs46")%>　</td>
         <%
    if rs1("fs46")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs47")%>　</td>
         <%
    if rs1("fs47")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs48")%>　</td>
         <%
    if rs1("fs48")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs49")%>　</td>
         <%
    if rs1("fs49")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs140")%>　</td>
       <%
    if rs1("fs140")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs141")%>　</td>
        <%
    if rs1("fs141")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs142")%>　</td>
         <%
    if rs1("fs142")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs143")%>　</td>
         <%
    if rs1("fs143")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs144")%>　</td>
         <%
    if rs1("fs144")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs145")%>　</td>
         <%
    if rs1("fs145")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs146")%>　</td>
         <%
    if rs1("fs146")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs147")%>　</td>
         <%
    if rs1("fs147")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs148")%>　</td>
         <%
    if rs1("fs148")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs149")%>　</td>
         <%
    if rs1("fs149")<>"" then
    js=js+1
    end if
    %>
<%
end if
%>

 <%
 if mc="5" then
 %>
   
    <td align=center><%=rs1("fs50")%>　</td>
         <%
    if rs1("fs50")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs51")%>　</td>
          <%
    if rs1("fs51")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs52")%>　</td>
          <%
    if rs1("fs52")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs53")%>　</td>
          <%
    if rs1("fs53")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs54")%>　</td>
          <%
    if rs1("fs54")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs55")%>　</td>
          <%
    if rs1("fs55")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs56")%>　</td>
          <%
    if rs1("fs56")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs57")%>　</td>
          <%
    if rs1("fs57")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs58")%>　</td>
          <%
    if rs1("fs58")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs59")%>　</td>
          <%
    if rs1("fs59")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs150")%>　</td>
         <%
    if rs1("fs150")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs151")%>　</td>
          <%
    if rs1("fs151")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs152")%>　</td>
          <%
    if rs1("fs152")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs153")%>　</td>
          <%
    if rs1("fs153")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs154")%>　</td>
          <%
    if rs1("fs154")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs155")%>　</td>
          <%
    if rs1("fs155")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs156")%>　</td>
          <%
    if rs1("fs156")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs157")%>　</td>
          <%
    if rs1("fs157")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs158")%>　</td>
          <%
    if rs1("fs158")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs159")%>　</td>
          <%
    if rs1("fs159")<>"" then
    js=js+1
    end if
    %>
<%
end if
%>


 <%
 if mc="6" then
 %>
   
    <td align=center><%=rs1("fs60")%>　</td>
          <%
    if rs1("fs60")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs61")%>　</td>
           <%
    if rs1("fs61")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs62")%>　</td>
           <%
    if rs1("fs62")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs63")%>　</td>
           <%
    if rs1("fs63")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs64")%>　</td>
           <%
    if rs1("fs64")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs65")%>　</td>
           <%
    if rs1("fs65")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs66")%>　</td>
           <%
    if rs1("fs66")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs67")%>　</td>
           <%
    if rs1("fs67")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs68")%>　</td>
           <%
    if rs1("fs68")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs69")%>　</td>
           <%
    if rs1("fs69")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs160")%>　</td>
          <%
    if rs1("fs160")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs161")%>　</td>
           <%
    if rs1("fs161")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs162")%>　</td>
           <%
    if rs1("fs162")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs163")%>　</td>
           <%
    if rs1("fs163")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs164")%>　</td>
           <%
    if rs1("fs164")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs165")%>　</td>
           <%
    if rs1("fs165")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs166")%>　</td>
           <%
    if rs1("fs166")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs167")%>　</td>
           <%
    if rs1("fs167")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs168")%>　</td>
           <%
    if rs1("fs168")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs169")%>　</td>
           <%
    if rs1("fs169")<>"" then
    js=js+1
    end if
    %>
<%
end if
%>

 <%
 if mc="7" then
 %>
   
    <td align=center><%=rs1("fs70")%>　</td>
           <%
    if rs1("fs70")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs71")%>　</td>
            <%
    if rs1("fs71")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs72")%>　</td>
            <%
    if rs1("fs72")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs73")%>　</td>
            <%
    if rs1("fs73")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs74")%>　</td>
            <%
    if rs1("fs74")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs75")%>　</td>
            <%
    if rs1("fs75")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs76")%>　</td>
            <%
    if rs1("fs76")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs77")%>　</td>
            <%
    if rs1("fs77")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs78")%>　</td>
            <%
    if rs1("fs78")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs79")%>　</td>
            <%
    if rs1("fs79")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs170")%>　</td>
           <%
    if rs1("fs170")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs171")%>　</td>
            <%
    if rs1("fs171")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs172")%>　</td>
            <%
    if rs1("fs172")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs173")%>　</td>
            <%
    if rs1("fs173")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs174")%>　</td>
            <%
    if rs1("fs174")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs175")%>　</td>
            <%
    if rs1("fs175")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs176")%>　</td>
            <%
    if rs1("fs176")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs177")%>　</td>
            <%
    if rs1("fs177")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs178")%>　</td>
            <%
    if rs1("fs178")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs179")%>　</td>
            <%
    if rs1("fs179")<>"" then
    js=js+1
    end if
    %>
<%
end if
%>


 <%
 if mc="8" then
 %>
   
    <td align=center><%=rs1("fs80")%>　</td>
            <%
    if rs1("fs80")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs81")%>　</td>
             <%
    if rs1("fs81")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs82")%>　</td>
             <%
    if rs1("fs82")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs83")%>　</td>
             <%
    if rs1("fs83")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs84")%>　</td>
             <%
    if rs1("fs84")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs85")%>　</td>
             <%
    if rs1("fs85")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs86")%>　</td>
             <%
    if rs1("fs86")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs87")%>　</td>
             <%
    if rs1("fs87")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs88")%>　</td>
             <%
    if rs1("fs88")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs89")%>　</td>
             <%
    if rs1("fs89")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs180")%>　</td>
            <%
    if rs1("fs180")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs181")%>　</td>
             <%
    if rs1("fs181")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs182")%>　</td>
             <%
    if rs1("fs182")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs183")%>　</td>
             <%
    if rs1("fs183")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs184")%>　</td>
             <%
    if rs1("fs184")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs185")%>　</td>
             <%
    if rs1("fs185")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs186")%>　</td>
             <%
    if rs1("fs186")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs187")%>　</td>
             <%
    if rs1("fs187")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs188")%>　</td>
             <%
    if rs1("fs188")<>"" then
    js=js+1
    end if
    %>

    <td align=center><%=rs1("fs189")%>　</td>
             <%
    if rs1("fs189")<>"" then
    js=js+1
    end if
    %>
   <%
end if
%>
    <td align=center>悳蛍</td>
    <td align=center>峠譲蛍</td>
  
<%
do while not rs.eof
i=i+1
xh=rs("xh")
xm=rs("xm")
xb=rs("xb")


  If sColor = "silver" Then
		sColor = "#cccccc"
	Else
		sColor = "silver"
	End If
	  

	Response.Write("</tr>")	 

	  	Response.Write("<tr bgcolor='"&sColor&"'>")
	  	%>
	  	<td align=center><font color="red"><%=i%></font>　</td>
    <td align=center><%=xh%>　</td>
    <td align=center><%=xm%>　</td>
 <%
    if xb="槻" then
    	 %>
<td align=center><font color="#aa6666"><%=xb%></font>　</td>
	<%
else
	 %>
    	<td align=center><font color="#00ffcc"><%=xb%></font>　</td>
<%
end if
 %>
		<%
 if mc="1" then
 %>
      <%
    if rs("fs10")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs10")%></font>　</td>
     
   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs10")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs11")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs11")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs11")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs12")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs12")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs12")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs13")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs13")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs13")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs14")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs14")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs14")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs15")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs15")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs15")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs16")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs16")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs16")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs17")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs17")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs17")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs18")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs18")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs18")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs19")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs19")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs19")%></font>　</td>

   <%
end if
  %>

    <%
    if rs("fs110")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs110")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs110")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs111")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs111")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs111")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs112")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs112")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs112")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs113")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs113")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs113")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs114")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs114")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs114")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs115")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs115")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs115")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs116")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs116")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs116")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs117")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs117")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs117")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs118")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs118")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs118")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs119")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs119")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs119")%></font>　</td>

   <%
end if
    

  %>
<%
end if
%>

 <%
 if mc="2" then
 %>
   
    
    <%
    if rs("fs20")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs20")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs20")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs21")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs21")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs21")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs22")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs22")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs22")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs23")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs23")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs23")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs24")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs24")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs24")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs25")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs25")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs25")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs26")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs26")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs26")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs27")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs27")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs27")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs28")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs28")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs28")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs29")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs29")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs29")%></font>　</td>

   <%
end if
    

  %>


  <%
    if rs("fs120")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs120")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs120")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs121")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs121")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs121")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs122")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs122")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs122")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs123")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs123")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs123")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs124")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs124")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs124")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs125")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs125")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs125")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs126")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs126")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs126")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs127")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs127")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs127")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs128")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs128")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs128")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs129")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs129")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs129")%></font>　</td>

   <%
end if
    

  %>
<%
end if
%>

 <%
 if mc="3" then
 %>
   
      <%
    if rs("fs30")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs30")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs30")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs31")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs31")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs31")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs32")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs32")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs32")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs33")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs33")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs33")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs34")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs34")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs34")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs35")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs35")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs35")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs36")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs36")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs36")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs37")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs37")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs37")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs38")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs38")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs38")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs39")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs39")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs39")%></font>　</td>

   <%
end if
    

  %>
  
  
    <%
    if rs("fs130")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs130")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs130")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs131")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs131")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs131")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs132")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs132")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs132")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs133")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs133")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs133")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs134")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs134")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs134")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs135")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs135")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs135")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs136")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs136")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs136")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs137")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs137")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs137")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs138")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs138")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs138")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs139")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs139")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs139")%></font>　</td>

   <%
end if
    

  %>
<%
end if
%>


 <%
 if mc="4" then
 %>
   
       <%
    if rs("fs40")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs40")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs40")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs41")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs41")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs41")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs42")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs42")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs42")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs43")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs43")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs43")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs44")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs44")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs44")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs45")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs45")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs45")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs46")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs46")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs46")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs47")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs47")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs47")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs48")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs48")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs48")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs49")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs49")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs49")%></font>　</td>

   <%
end if
    

  %>
  
   
       <%
    if rs("fs140")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs140")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs140")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs141")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs141")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs141")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs142")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs142")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs142")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs143")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs143")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs143")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs144")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs144")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs144")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs145")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs145")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs145")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs146")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs146")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs146")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs147")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs147")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs147")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs148")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs148")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs148")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs149")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs149")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs149")%></font>　</td>

   <%
end if
    
  %>
<%
end if
%>

 <%
 if mc="5" then
 %>
   
     <%
    if rs("fs50")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs50")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs50")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs51")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs51")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs51")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs52")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs52")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs52")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs53")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs53")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs53")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs54")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs54")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs54")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs55")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs55")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs55")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs56")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs56")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs56")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs57")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs57")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs57")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs58")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs58")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs58")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs59")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs59")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs59")%></font>　</td>

   <%
end if
    

  %>
  
    <%
    if rs("fs150")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs150")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs150")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs151")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs151")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs151")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs152")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs152")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs152")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs153")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs153")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs153")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs154")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs154")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs154")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs155")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs155")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs155")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs156")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs156")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs156")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs157")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs157")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs157")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs158")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs158")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs158")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs159")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs159")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs159")%></font>　</td>

   <%
end if
    

  %>
<%
end if
%>


 <%
 if mc="6" then
 %>
   
     <%
    if rs("fs60")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs60")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs60")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs61")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs61")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs61")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs62")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs62")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs62")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs63")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs63")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs63")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs64")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs64")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs64")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs65")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs65")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs65")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs66")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs66")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs66")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs67")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs67")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs67")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs68")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs68")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs68")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs69")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs69")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs69")%></font>　</td>

   <%
end if
    

  %>
  
   <%
    if rs("fs160")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs160")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs160")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs161")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs161")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs161")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs162")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs162")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs162")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs163")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs163")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs163")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs164")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs164")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs164")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs165")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs165")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs165")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs166")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs166")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs166")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs167")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs167")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs167")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs168")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs168")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs168")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs169")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs169")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs169")%></font>　</td>

   <%
end if
    

  %>
<%
end if
%>

 <%
 if mc="7" then
 %>
   
      <%
    if rs("fs70")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs70")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs70")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs71")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs71")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs71")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs72")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs72")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs72")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs73")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs73")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs73")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs74")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs74")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs74")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs75")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs75")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs75")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs76")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs76")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs76")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs77")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs77")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs77")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs78")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs78")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs78")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs79")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs79")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs79")%></font>　</td>

   <%
end if
    

  %>
  
   <%
    if rs("fs170")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs170")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs170")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs171")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs171")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs171")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs172")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs172")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs172")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs173")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs173")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs173")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs174")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs174")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs174")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs175")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs175")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs175")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs176")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs176")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs176")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs177")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs177")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs177")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs178")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs178")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs178")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs179")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs179")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs179")%></font>　</td>

   <%
end if
    

  %>
<%
end if
%>

 <%
 if mc="8" then
 %>
   
      <%
    if rs("fs80")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs80")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs80")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs81")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs81")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs81")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs82")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs82")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs82")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs83")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs83")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs83")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs84")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs84")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs84")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs85")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs85")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs85")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs86")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs86")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs86")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs87")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs87")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs87")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs88")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs88")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs88")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs89")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs89")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs89")%></font>　</td>

   <%
end if
    

  %>
  
      <%
    if rs("fs180")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs180")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs180")%></font>　</td>

   <%
end if
   %>

   <%
    if rs("fs181")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs181")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs181")%></font>　</td>

   <%
end if
    
  %>

 <%
      if rs("fs182")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs182")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs182")%></font>　</td>

   <%
end if

  
  %>

<%
     if rs("fs183")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs183")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs183")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs184")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs184")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs184")%></font>　</td>

   <%
end if
    

  %>

<%
     if rs("fs185")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs185")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs185")%></font>　</td>

   <%
end if
    

  %>

<%
   if rs("fs186")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs186")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs186")%></font>　</td>

   <%
end if
    

  %>

<%
    if rs("fs187")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs187")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs187")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs188")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs188")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs188")%></font>　</td>

   <%
end if

  %>

<%
    if rs("fs189")>=60 then
     %>
     <td align=center><font color=green><%=rs("fs189")%></font>　</td>

   <%
   else
      %>
     <td align=center><font color=red><%=rs("fs189")%></font>　</td>

   <%
end if
    

  %>
<%
end if
%>


<%
if mc="1" then
zf=rs("fs10")+rs("fs11")+rs("fs12")+rs("fs13")+rs("fs14")+rs("fs15")+rs("fs16")+rs("fs17")+rs("fs18")+rs("fs19")+rs("fs110")+rs("fs111")+rs("fs112")+rs("fs113")+rs("fs114")+rs("fs115")+rs("fs116")+rs("fs117")+rs("fs118")+rs("fs119")
%>
    <td align=center><%=zf%>　</td> 
<%
end if
%>
<%
if mc="2" then
zf=rs("fs20")+rs("fs21")+rs("fs22")+rs("fs23")+rs("fs24")+rs("fs25")+rs("fs26")+rs("fs27")+rs("fs28")+rs("fs29")+rs("fs120")+rs("fs121")+rs("fs122")+rs("fs123")+rs("fs124")+rs("fs125")+rs("fs126")+rs("fs127")+rs("fs128")+rs("fs129")

%>
    <td align=center><%=zf%>　</td> 
<%
end if
%>
<%
if mc="3" then
zf=rs("fs30")+rs("fs31")+rs("fs32")+rs("fs33")+rs("fs34")+rs("fs35")+rs("fs36")+rs("fs37")+rs("fs38")+rs("fs39")+rs("fs130")+rs("fs131")+rs("fs132")+rs("fs133")+rs("fs134")+rs("fs135")+rs("fs136")+rs("fs137")+rs("fs138")+rs("fs139")

%>
    <td align=center><%=zf%>　</td> 
<%
end if
%>
<%
if mc="4" then
zf=rs("fs40")+rs("fs41")+rs("fs42")+rs("fs43")+rs("fs44")+rs("fs45")+rs("fs46")+rs("fs47")+rs("fs48")+rs("fs49")+rs("fs140")+rs("fs141")+rs("fs142")+rs("fs143")+rs("fs144")+rs("fs145")+rs("fs146")+rs("fs147")+rs("fs148")+rs("fs149")

%>
    <td align=center><%=zf%>　</td> 
<%
end if
%>
<%
if mc="5" then
zf=rs("fs50")+rs("fs51")+rs("fs52")+rs("fs53")+rs("fs54")+rs("fs55")+rs("fs56")+rs("fs57")+rs("fs58")+rs("fs59")+rs("fs150")+rs("fs151")+rs("fs152")+rs("fs153")+rs("fs154")+rs("fs155")+rs("fs156")+rs("fs157")+rs("fs158")+rs("fs159")

%>
    <td align=center><%=zf%>　</td> 
<%
end if
%>
<%
if mc="6" then
zf=rs("fs60")+rs("fs61")+rs("fs62")+rs("fs63")+rs("fs64")+rs("fs65")+rs("fs66")+rs("fs67")+rs("fs68")+rs("fs69")+rs("fs160")+rs("fs161")+rs("fs162")+rs("fs163")+rs("fs164")+rs("fs165")+rs("fs166")+rs("fs167")+rs("fs168")+rs("fs169")

%>
    <td align=center><%=zf%>　</td> 
<%
end if
%>
<%
if mc="7" then
zf=rs("fs70")+rs("fs71")+rs("fs72")+rs("fs73")+rs("fs74")+rs("fs75")+rs("fs76")+rs("fs77")+rs("fs78")+rs("fs79")+rs("fs170")+rs("fs171")+rs("fs172")+rs("fs173")+rs("fs174")+rs("fs175")+rs("fs176")+rs("fs177")+rs("fs178")+rs("fs179")

%>
    <td align=center><%=zf%>　</td> 
<%
end if
%>
<%
if mc="8" then
zf=rs("fs80")+rs("fs81")+rs("fs82")+rs("fs83")+rs("fs84")+rs("fs85")+rs("fs86")+rs("fs87")+rs("fs88")+rs("fs89")+rs("fs180")+rs("fs181")+rs("fs182")+rs("fs183")+rs("fs184")+rs("fs185")+rs("fs186")+rs("fs187")+rs("fs188")+rs("fs189")

%>
    <td align=center><%=zf%>　</td> 
<%
end if
%>
<%
if js>0 then
if zf/js>=60 then
%>
<td align=center><font color=green><%=int(zf*100/js)/100%></font>　</td>
   <%
   else
   %>
 <td align=center><font color=red><%=int(zf*100/js)/100%></font>　</td>
  <%
  end if
  end if
  %>

 </tr>
   
	

    
    
    
 <%
 
 
 
rs.movenext
loop

Response.Write("</table>") 
Response.Write("</center>")

%>
 
      
        
  <!--#include file="bjz.asp"-->
  
</body>
</html>
<%
rs.close
set rs=nothing
rs1.close
set rs1=nothing
conn.close
set conn=nothing

else

response.write"<script language='javascript'>" 
		 response.write"alert('低短嗤鞠村��');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end

end if

%>