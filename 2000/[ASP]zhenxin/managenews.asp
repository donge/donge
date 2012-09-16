<%
if request.cookies("manage")="" then
  response.redirect "login.asp"
end if
%><html>
<head>
<title>真心链</title>
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
        <p>真心链新闻管理</p>
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
       response.write "<p align='center'>没 有 找 到 任 何 新 闻</p>" 
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
                <p>人气：<font color="#FF0000"><%=rs("hits")%></font>
              </td>
              <td width="50"><a href="delnews.asp?id=<%=rs("id")%>">删除</a></td>
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
    response.write "首页 上页&nbsp;"
  else
    response.write "<a href=managenews.asp?page=1&txtitle="&keyword&">首页</a>&nbsp;"
    response.write "<a href=managenews.asp?page="&CurrentPage-1&"&txtitle="&keyword&">上页</a>&nbsp;"
  end if
  if n-currentpage<1 then
    response.write "下页 尾页"
  else
    response.write "<a href=managenews.asp?page="&(CurrentPage+1)&"&txtitle="&keyword&">"
    response.write "下页</a> <a href=managenews.asp?page="&n&"&txtitle="&keyword&">尾页</a>"
  end if
   response.write "&nbsp;页次：<font color=red>"&CurrentPage&"</font>/"&n&"页"
    response.write "&nbsp;共<font color=red>"&totalnumber&"</font>条新闻 "&maxperpage&"条新闻/页 "
   response.write " 转到：<input type='text' name='page' size=3 maxlength=5 class=stedit  value="&currentpage&"> "

   response.write "<input class=stbtm type='submit' value='跳 页'  name='cndok'></span></p></form>"     
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
