


<!--#include file="conn.asp"-->
 <body bgcolor="#fef4d9" text="#000000">

<%
 dim rs
 dim sql
  set rs=server.createobject("adodb.recordset")
 sql="select * from gg Order by rq desc"

rs.open sql,conn,3,3
total=rs.recordcount
    if not rs.eof then   
 bt=rs("bt")
  rq=rs("rq")
 bh=rs("bh")
  nr=rs("nr")
 end if  
  
    
  

 %>




 

<html>
<head>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<STYLE type=text/css>A {
	COLOR: black; FONT-STYLE: normal; TEXT-DECORATION: none
}
A:hover {
	BACKGROUND: red; COLOR: yellow; FONT-STYLE: normal; TEXT-DECORATION: none
}
A:active {
	COLOR: #0080ff; FONT-STYLE: normal; TEXT-DECORATION: none
}
TABLE {
	BORDER-BOTTOM: 0px; BORDER-LEFT: 0px; BORDER-RIGHT: 0px; BORDER-TOP: 0px; FONT-SIZE: 9pt; cellspacing: "0"; cellpadding: "0"
}
.space {
	LINE-HEIGHT: 0.5cm
}
P {
	FONT-SIZE: 9pt; LINE-HEIGHT: 18px; font-famliy: 宋体
}
BIG {
	FONT-SIZE: 10.8pt; LINE-HEIGHT: 18px; font-famliy: 宋体
}
.p10pt {
	FONT-SIZE: 10pt
}
</STYLE>

<title>科技部新闻系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="config.css" type="text/css">
</head>
<body bgcolor="#fef4d9" text="#000000">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
                
        <div align="center"><b><font color="#0066FF">　共有<font color=red><%=total%></font>条公告
        </font></b></div>
    </td>
  </tr>
</table>




	<table>
    <tr>
  


<%
do while not rs.eof
i=i+1
bh=rs("bh")
bt=rs("bt")
nr=rs("nr")
rq=rs("rq")



%>

  
  
  
  
  
    
    <td align=center><font color="red"><%=i%></font>　</td>
        <td align=left><%=rq%>　</td>
       <td align=center>
    <a href="#" onClick="window.open('lys31.asp?bh=<%=bh%>', 'Sample', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=yes,height=340,width=420,left=0,top=0')">
    <font color="green"><%=bt%></font></a>　</td></tr>
   

    
    
    
 <%
rs.movenext
loop
Response.Write("</table>") 
Response.Write("</center>")
 rs.close
set rs=nothing
conn.close
set conn=nothing
 
 

%></head></html>