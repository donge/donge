<!--#include file="conn.asp"-->

<%
 bh=request("bh")
zybj=request("zybj")
xm=request("xm")
xb=request("xb")
sj=request("sj")
 dim rs
 dim sql
  set rs=server.createobject("adodb.recordset")
 sql="SELECT * from ly where bh='" + bh + "'" 
rs.open sql,conn,3,3


if rs.eof then	
		
%>
     
<SCRIPT language="JavaScript">
  
function closeclk() {
close();
}
  </script>
  
  
   <body topmargin=0 leftmargin=0 rightmargin=0 bgcolor="#fef4d9">

  
  

  
<center>

(^-^)<p>


�������Ըղ��ѱ���ɾ����
 <form> 
<INPUT TYPE="BUTTON" NAME="close" value="�ر��������" onClick="closeclk()">
</FORM>
</center>

 
 


<%




else







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





%>



<html>
 <head>
  <title>������ѯ����ϵͳ�鿴���ԡ��Ƽ�����ơ�</title>
  
  
     
<SCRIPT language="JavaScript">
  
function closeclk() {
close();
}
  </script>

  
  
  
 </head>
 <body topmargin=0 leftmargin=0 rightmargin=0 bgcolor="#fef4d9">
  
   <div align=center><font face="�����п�" size="5" color="#FF00FF">�鿴����</font></div> 
     <font face="����" size="2">

     <center>

    
       <td align=center><a href=sc5.asp?bh=<%=bh%>><font color="red">���ɾ��</font></a></td><br>

    
  
       <font color="#008080">�༶��ְ��</font><%=zybj%>����<font color="#008080">������</font><%=xm%>����<font color="#008080">�Ա�</font><%=xb%>
    </font>

     </center>
    
      <div align="center">
        <center>
    
      <table border="4" cellpadding="0" cellspacing="0" bordercolor="#FF9900" width="390" id="AutoNumber1" bgcolor="#FEF4D9" height="100" style="border-collapse: collapse">
        <tr>
          <td width="100%">��
        
     <font face="����" size="3" color="#ff55aa">
   
     <%=nr%>
     
     
     
     
           <br>
           <center>
           
           <%=sj%><br>
            

 </center>
</font>
 </table>
 
  
  
        </center>
   </div>
 
  
  
<center>

 <form> 
<INPUT TYPE="BUTTON" NAME="close" value="�ر��������" onClick="closeclk()">
</FORM>
</center>

 
 
 </body>
</html>

<%

end if
%>