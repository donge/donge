<%
if request.cookies("manage")="" then
  response.redirect "login.asp"
end if
%><html>
<head>
<title>������</title>
<meta http-equiv="Content-manage" content="text/html; charset=gb2312">
<link rel="stylesheet" manage="text/css" href="link.css">
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0">
<div align="center"> </div>
<!--#include file="1.htm" --> 
<div align="center"> </div>
<table border="0" width="778" cellspacing="0" cellpadding="0">
  <tr> 
    <td colspan="3" valign="top"> 
      <div align="center"> 
        <p>&nbsp;</p>
        <p>��������վ����</p>
        <table width="80%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td colspan="2"> 
              <div align="center"> 
                <table width="500" border="0" cellspacing="1" cellpadding="2" align="center">
                  <tr align="right"> 
                    <td colspan="2"><%
   dim conn   
   dim connstr

   'on error resume next
   connstr="DBQ="+server.mappath("1Qw@3E.mdb")+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
     set conn=server.createobject("ADODB.CONNECTION")
     conn.open connstr 
%><%
   const MaxPerPage=50
   dim totalPut   
   dim CurrentPage
   dim TotalPages
   dim i,j
   if not isempty(request("page")) then
      currentPage=cint(request("page"))
   else
      currentPage=1
   end if
   dim sql
   dim rs
 
%><%

sql="select * from zhenxin_user where site_name<>'���û��ѱ�ɾ����' order by id"
Set rs= Server.CreateObject("ADODB.Recordset")
rs.open sql,conn,1,1
  if rs.eof and rs.bof then
       response.write "<p align='center'>û �� �� �� �� �� �� վ</p>" 
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
           showpage totalput,MaxPerPage,"managelink.asp" 
            showContent 
            showpage totalput,MaxPerPage,"managelink.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"managelink.asp" 
            showContent 
             showpage totalput,MaxPerPage,"managelink.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"managelink.asp" 
           showContent 
           showpage totalput,MaxPerPage,"managelink.asp" 
	      end if 
	   end if 
   rs.close 
   end if 
	         
   set rs=nothing   
   sub showContent 
       dim i 
	   i=0 
%></td>
                  </tr>
                </table>
              </div>
              <div align="center"> 
                <center>
                  <table border="0" cellspacing="1" width="500" cellpadding="2">
                    <tr bgcolor="eeeeee"> 
                      <td bgcolor="#ffeeee" bordercolordark="#FFFFFF" bordercolorlight="#000000">����</td>
                      <td>���</td>
                      <td>site_name</td>
                      <td>site_type</td>
                      <td>ע������</td>
                      <td>total_view</td>
                      <td>day_visit</td>
                      <td>����</td>
                    </tr>
                    <%do while not rs.eof%> 
                    <tr> 
                      <td bordercolordark="#FFFFFF" bordercolorlight="#000000"> 
                        <p><a
    href="dellink.asp?oid=<%=rs("oid")%>">ɾ��</a> 
                      </td>
                      <td> 
                        <p><%=i+1+(CurrentPage-1)*50%> 
                      </td>
                      <td> 
                        <p><a href="<%=rs("site_url")%>" target="_blank"><%=rs("site_name")%></a> 
                      </td>
                      <td><%select case rs("site_type")
                       case 1:  response.write"�ۺ��Ż�"
                      case 2:  response.write"���ҵ���"
                       case 3:  response.write"��������"
                      case 4:  response.write"��������"
                       case 5:  response.write"��������"
                       case 6:  response.write"���Ÿ���"
                        case 7:  response.write"������Ѷ"
                     case 8:  response.write"�Ļ�����"
                       case 9:  response.write"��ѧ����"
                        case 10:  response.write"��Ϸ����"
                        case 11:  response.write"��������"
                       case 12:  response.write"���̾���"
                        case 13:  response.write"����Ͷ��"
                      case 14:  response.write"����ý��"
                       case 15:  response.write"��н���"
                     case 16:  response.write"Ů�����"
                       case 17:  response.write"��������"
                      case 18:  response.write"�������"
case else:response.write"<font color='#ff0000'>���ϴ���</font>"
end select%></td>
                      <td><%=rs("join_time")%></td>
                      <td><%=rs("total_view")%></td>
                      <td><font color="#FF0000"><%=rs("day_visit")%></font></td>
                      <td> 
                        <p><font color="red"><%=rs("id")%></font> 
                      </td>
                    </tr>
                    <% i=i+1
	      if i>=MaxPerPage then exit do
	      rs.movenext
	   loop
		  %> 
                  </table>
                </center>
              </div>
              <table width="500" border="0" cellspacing="1" cellpadding="2" align="center">
                <tr align="right"> 
                  <td colspan="2"><%
   end sub 

function showpage(totalnumber,maxperpage,filename)
  dim n
  if totalnumber mod maxperpage=0 then
     n= totalnumber \ maxperpage
  else
     n= totalnumber \ maxperpage+1
  end if
response.write "<font color=red>"&(CurrentPage-1)*maxperpage+1&"-"&CurrentPage*maxperpage&"</font>/"&totalnumber&" "
if CurrentPage<2 then
    response.write "��ҳ&nbsp;"
  else
    response.write "<a href=managelink.asp?page="&CurrentPage-1&"&type="&request("type")&">��ҳ</a>&nbsp;"
  end if
  if n-currentpage<1 then
    response.write "��ҳ "
  else
    response.write "<a href=managelink.asp?page="&(CurrentPage+1)&"&type="&request("type")&">"
    response.write "��ҳ</a> "
  end if
    response.write "��ҳ "
    dim k
	   for k=1 to n
	       if k=currentPage then
	          response.write "[<font color=red>"+Cstr(k)+"</font>] "
		   else
		      response.write "["+"<a href='managelink.asp?type="&request("type")&"&page="+cstr(k)+"'>"+Cstr(k)+"</a>] "
		   end if
	next 
end function
%></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </div>
      <p>&nbsp;</p>
    </td>
  </tr>
</table>
<!--#include file="2.htm" --> 
</body>                            
</html>                            
