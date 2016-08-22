<!--#include file="conn.asp"-->

<%
 bh=request("bh")
 
 dim rs
 dim sql
  
 set rs=server.createobject("adodb.recordset")
 sql="select * from gg where bh='" + bh + "'"

rs.open sql,conn,3,3
nr=rs("nr")
function DvbbsHtmlAn(fweing)
if not isnull(fweing) then
	fweing = replace(fweing, ">", "&gt;")
	fweing = replace(fweing, "<", "&lt;")
	fweing = Replace(fweing, CHR(32), " ")
	fweing = Replace(fweing, CHR(9), "&nbsp;")
	fweing = Replace(fweing, CHR(34), "&quot;")
	fweing = Replace(fweing, CHR(39), "&#39;")
	fweing = Replace(fweing, CHR(13), "")
	fweing = Replace(fweing, CHR(10), "<BR> ")

	fweing=ChkBadWords(fweing)
	DvbbsHtmlAn = fweing
end if
end function

function ChkBadWords(fweing)
    dim bwords
    if not(isnull(BadWords) or isnull(fweing)) then
    bwords = split(BadWords, "|")
    for i = 0 to ubound(bwords)
        fweing = Replace(fweing, bwords(i), weing(len(bwords(i)),"*")) 
    next
    ChkBadWords = fweing
    end if
end function
nr=DvbbsHtmlAn(nr)
rq=rs("rq")
bt=rs("bt")

%>



<html>
 <head>
  <title>查看公告【科技部设计】</title>
  
  
     
<SCRIPT language="JavaScript">
  
function closeclk() {
close();
}
  </script>

  
  
  
 </head>
 <body topmargin=0 leftmargin=0 rightmargin=0 bgcolor="#fef4d9">
    <center>
   <font face="华文行楷" size="5" color="#FF00FF">查看公告</font><div align="center">
     <center>
     <table border="4" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#008000" width="100%" id="AutoNumber1" height="80%">
       <tr>
         <td width="100%" valign="top">　
          <center>
<font face="宋体" size="4" color="#af2244"> <%=bt%></font><p>
           </center>
  

     
        
     <font face="宋体" size="3" color="#ff55aa"><%=nr%> </font><P>
           <center>
           <%=rq%><br>
           </center>
  
  
        </center>
  
 
 
 
   </font>
</td>
       </tr>
     </table>
     </center>
   </div>
   <p>
    
  <center>

 <form> 
<INPUT TYPE="BUTTON" NAME="close" value="关闭这个窗口" onClick="closeclk()">
</FORM>
</center>


 
 
 </body>
</html>