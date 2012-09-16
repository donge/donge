<%
if request.cookies("manage")="" then
  response.redirect "login.asp"
end if
%><html>
<head>
<title>真心链</title>
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
        <p>真心链网站管理</p>
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

sql="select * from zhenxin_user where site_name<>'此用户已被删除！' order by id"
Set rs= Server.CreateObject("ADODB.Recordset")
rs.open sql,conn,1,1
  if rs.eof and rs.bof then
       response.write "<p align='center'>没 有 找 到 任 何 网 站</p>" 
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
                      <td bgcolor="#ffeeee" bordercolordark="#FFFFFF" bordercolorlight="#000000">操作</td>
                      <td>序号</td>
                      <td>site_name</td>
                      <td>site_type</td>
                      <td>注册日期</td>
                      <td>total_view</td>
                      <td>day_visit</td>
                      <td>排名</td>
                    </tr>
                    <%do while not rs.eof%> 
                    <tr> 
                      <td bordercolordark="#FFFFFF" bordercolorlight="#000000"> 
                        <p><a
    href="dellink.asp?oid=<%=rs("oid")%>">删除</a> 
                      </td>
                      <td> 
                        <p><%=i+1+(CurrentPage-1)*50%> 
                      </td>
                      <td> 
                        <p><a href="<%=rs("site_url")%>" target="_blank"><%=rs("site_name")%></a> 
                      </td>
                      <td><%select case rs("site_type")
                       case 1:  response.write"综合门户"
                      case 2:  response.write"国家地区"
                       case 3:  response.write"电脑网络"
                      case 4:  response.write"政府机关"
                       case 5:  response.write"休闲娱乐"
                       case 6:  response.write"电信港湾"
                        case 7:  response.write"生活资讯"
                     case 8:  response.write"文化艺术"
                       case 9:  response.write"科学教育"
                        case 10:  response.write"游戏世界"
                        case 11:  response.write"体育健身"
                       case 12:  response.write"工商经济"
                        case 13:  response.write"金融投资"
                      case 14:  response.write"新闻媒体"
                       case 15:  response.write"情感交流"
                     case 16:  response.write"女性天地"
                       case 17:  response.write"卫生保健"
                      case 18:  response.write"其他类别"
case else:response.write"<font color='#ff0000'>资料错误</font>"
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
    response.write "上页&nbsp;"
  else
    response.write "<a href=managelink.asp?page="&CurrentPage-1&"&type="&request("type")&">上页</a>&nbsp;"
  end if
  if n-currentpage<1 then
    response.write "下页 "
  else
    response.write "<a href=managelink.asp?page="&(CurrentPage+1)&"&type="&request("type")&">"
    response.write "下页</a> "
  end if
    response.write "分页 "
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
