<%
if request.cookies("manage")="" then
  response.redirect "login.asp"
end if
%><html>
<head>
<title>������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="link.css">
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0">
<!--#include file="1.htm" --> 
<div align="center"> </div>
<table border="0" width="778" cellspacing="0" cellpadding="0">
  <tr> 
    <td colspan="3" valign="top"> 
      <div align="center">
        <p>&nbsp;</p>
        <p>���������Ź���</p>
        <!--#include file="newsconn.asp"--> 
        <script language="JavaScript">
function popwin2(id,path)
{		window.open("opennews.asp?id="+id+"&ppath="+path,"","height=400,width=600,resizable=yes,scrollbars=yes,status=no,toolbar=no,menubar=yes,location=no");
}
</script>
        <%
   const MaxPerPage=25
   dim totalPut   
   dim CurrentPage
   dim TotalPages
   dim i,j
   dim keyword
   keyword=request("txtitle")
   if not isempty(request("page")) then
      currentPage=cint(request("page"))
   else
      currentPage=1
   end if
   dim sql
   dim rs
 
%><% 
sql="select * from news where title like '%"&keyword&"%' order by id desc" 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn,1,1 
  if rs.eof and rs.bof then 
       response.write "<p align='center'>û �� �� �� �� �� �� ��</p>" 
   else 
	  totalPut=rs.recordcount 
      totalPut=rs.recordcount 
      if currentpage<1 then 
          currentpage=1 
      end if 
      if (currentpage-1)*MaxPerPage>totalput then 
	   if (totalPut mod MaxPerPage)=0 then 
	     currentpage= totalPut \ MaxPerPage 
	   else 
	      currentpage= totalPut \ MaxPerPage + 1 
	   end if 
 
      end if 
       if currentPage=1 then 
           showpage totalput,MaxPerPage,"managenews.asp" 
            showContent 
            showpage totalput,MaxPerPage,"managenews.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"managenews.asp" 
            showContent 
             showpage totalput,MaxPerPage,"managenews.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"managenews.asp" 
           showContent 
           showpage totalput,MaxPerPage,"managenews.asp" 
	      end if 
	   end if 
   rs.close 
   end if 
	         
   set rs=nothing   
   sub showContent 
       dim i 
	   i=0 
%> </div>
      <div align="center"> 
        <center>
          <table border="0" cellspacing="1" width="600" cellpadding="2">
            <%do while not rs.eof%> 
            <tr> 
              <td width="60"> 
                <p><font color="red"><%=rs("date")%></font>
              </td>
              <td> <a href="javascript:popwin2(<%=rs("id")%>)"><%=rs("title")%></a> 
              </td>
              <td width="50"> 
                <p>������<font color="#FF0000"><%=rs("hits")%></font>
              </td>
              <td width="50"><a href="delnews.asp?id=<%=rs("id")%>">ɾ��</a></td>
            </tr>
            <% i=i+1
	      if i>=MaxPerPage then exit do
	      rs.movenext
	   loop
		  %> 
          </table>
          <%
   end sub 

function showpage(totalnumber,maxperpage,filename)
  dim n
  if totalnumber mod maxperpage=0 then
     n= totalnumber \ maxperpage
  else
     n= totalnumber \ maxperpage+1
  end if
  response.write "<form method=Post action=managenews.asp>"
  if CurrentPage<2 then
    response.write "��ҳ ��ҳ&nbsp;"
  else
    response.write "<a href=managenews.asp?page=1&txtitle="&keyword&">��ҳ</a>&nbsp;"
    response.write "<a href=managenews.asp?page="&CurrentPage-1&"&txtitle="&keyword&">��ҳ</a>&nbsp;"
  end if
  if n-currentpage<1 then
    response.write "��ҳ βҳ"
  else
    response.write "<a href=managenews.asp?page="&(CurrentPage+1)&"&txtitle="&keyword&">"
    response.write "��ҳ</a> <a href=managenews.asp?page="&n&"&txtitle="&keyword&">βҳ</a>"
  end if
   response.write "&nbsp;ҳ�Σ�<font color=red>"&CurrentPage&"</font>/"&n&"ҳ"
    response.write "&nbsp;��<font color=red>"&totalnumber&"</font>������ "&maxperpage&"������/ҳ "
   response.write " ת����<input type='text' name='page' size=3 maxlength=5 class=stedit  value="&currentpage&"> "

   response.write "<input class=stbtm type='submit' value='�� ҳ'  name='cndok'></span></p></form>"     
end function
%> 
        </center>
      </div>
      </td>
  </tr>
</table>
<!--#include file="2.htm" --> 
</body>                            
</html>                            
