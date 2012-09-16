<%@ LANGUAGE="VBSCRIPT" %>
<%
if request.cookies("adminok")="" then
  response.redirect "login.htm"
end if
%>
<html>
<head>
<title>普通会员列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="style.css" type="text/css"></head>
<body  text="#000000">
<br>
      <div align="center">
        <center>
<!--#include file="conn.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sqltext="select * from userinfo where txtLevel='普通会员' and flag=1 order by id desc" 
rs.open sqltext,conn,1,1

dim MaxPerPage
MaxPerPage=20

'假如没有数据时
If rs.eof and rs.bof then 
   call showpages
   response.write "<p align='center'><font color='#ff0000'>还没普通会员信息</font></p>"
   response.end
End if

'取得页数,并判断用户输入的是否数字类型的数据，如不是将以第一页显示
dim text,checkpage
text="0123456789"
 Rs.PageSize=MaxPerPage
for i=1 to len(request("page"))
   checkpage=instr(1,text,mid(request("page"),i,1))
   if checkpage=0 then
      exit for 
   end if
next

If checkpage<>0 then
      If NOT IsEmpty(request("page")) Then
        CurrentPage=Cint(request("page"))
        If CurrentPage < 1 Then CurrentPage = 1
        If CurrentPage > Rs.PageCount Then CurrentPage = Rs.PageCount
      Else
        CurrentPage= 1
      End If
      If not Rs.eof Then Rs.AbsolutePage = CurrentPage end if
Else
   CurrentPage=1
End if

call showpages
call list

If Rs.recordcount > MaxPerPage then
   call showpages
end if

'显示帖子的子程序
Sub list()%><form method='POST' action='../admin/news1_Search.asp'>
            <TABLE cellSpacing=1 cellPadding=4 width=756 bgColor=#416327 height="136">
              <TBODY>
              <TR vAlign=top bgColor=#e1f0ff>
                <TD class=main2  height="10" bgcolor="#398A00" background="../admin/images/bg.gif" width="742"></TD></TR>
              <TR vAlign=top bgColor=#e1f0ff>
                <TD class=main2  height="18" width="734" bgcolor="#DEEBD6">普通会员列表--&nbsp;       
                  <input type="button" value="管理首页" onclick=" window.location='manage.asp'"  style="font-family: 新细明体, 宋体, Arial; font-size: 9pt; height:20px;background-color:#D4D0C8;" onMouseOver ="this.style.backgroundColor='#FFC864'" onMouseOut ="this.style.backgroundColor='#D4D0C8'">&nbsp;                        
                                  
 </TD>                
        </center>                
              </TR>                   
        <center>                
              <TR vAlign=top bgColor=#e1f0ff>                
                <TD class=main2  height="15" width="742" bgcolor="#DEEBD6">                
                  <table border="1" cellpadding="0" cellspacing="0" width="100%" bordercolorlight="#416327" bordercolordark="#DEEBD6" height="38">
          <tr> 
            <td width="11%" bgcolor="#398A00" align="center" height="19" class=main2 ><font color="#FFFFFF">会员账号</font></td>
            <td height="19" align="center" bgcolor="#398A00" class=main2 ><font color="#FFFFFF">性别</font></td>
            <td height="19" align="center" bgcolor="#398A00" class=main2 ><font color="#FFFFFF">姓名</font></td>
            <td height="19" align="center" bgcolor="#398A00" class=main2 ><font color="#FFFFFF">电话</font></td>
            <td width="9%" bgcolor="#398A00" align="center" height="19" class=main2><font color="#FFFFFF">部门</font></td>
            <td width="9%" bgcolor="#398A00" align="center" height="19" class=main2><font color="#FFFFFF">注册日期</font></td>
            <td width="14%" bgcolor="#398A00" align="center" height="19" class=main2><font color="#FFFFFF">操作</font></td>
            <%              
if not rs.eof then              
  i=0              
  do while not rs.eof               
%></center>
          <tr class=main2> 
            <center>
              <td width="11%" align="left" height="1"> <p align="center"><%=rs("txtId")%></td>
              <td height="1" align="left"><%=rs("txtSex")%></td>
              <td height="1" align="left"><%=rs("txtName")%></td>
              <td height="1" align="left"><%=rs("txtTel")%></td>
            </center>
            <td width="9%" align="left" height="1"> <p align="left"><%=rs("txtType")%></td>
            <td width="9%" align="left" height="1"> <p align="center"><%=rs("dateandtime")%></p></td><center>
            <td width="14%" align="center" height="1"> <input type="button" value="详情" onclick=" window.location='userdetail.asp?id=<%=rs("id")%>'"  style="font-family: 新细明体, 宋体, Arial; font-size: 9pt; height:20px;background-color:#D4D0C8;" onMouseOver ="this.style.backgroundColor='#FFC864'" onMouseOut ="this.style.backgroundColor='#D4D0C8'"> 
              <input type="button" value="删除" onclick="if (confirm('确实要此条记录吗？')) window.location='userinfodel.asp?id=<%=rs("id")%>'" style="font-family: 新细明体, 宋体, Arial; font-size: 9pt; height:20px;background-color:#D4D0C8;" onMouseOver="this.style.backgroundColor='#FFC864'" onMouseOut="this.style.backgroundColor='#D4D0C8'"></td>
          </tr>
          <%             
   i=i+1             
   if i >= MaxPerpage then exit do             
   rs.movenext             
   loop             
end if             
%>
        </table>             
                </center>             
                </TD></TR>             
              <TR bgColor=#e1f0ff>             
                <TD class=main2 width="742" height="27" bgcolor="#DEEBD6">             
                  <p align="center">&nbsp;                            
                </TD></TR>             
              <TR bgColor=#e1f0ff>             
                <TD class=main2 width="742" height="4" bgcolor="#398A00" background="../admin/images/bg.gif"></TD></TR></TBODY></TABLE><br>             
<%             
End sub             
rs.close             
conn.close             
%>                     
      </div>             
<div align="center">             
  <center> </form>　                                                                                                                             
<%                     
'显示翻页的子程序                     
sub showpages()%>                     
<table bgColor="#f8e8a0" border="0" cellPadding="0" cellSpacing="0" width="100%" >                       
<tr><td >                     
<%                     
response.write "<form method=Post action='user1info.asp'>"                     
%>                      
                     
<table bgColor="#1f60a0" border="0" cellPadding="0" cellSpacing="0" width="100%" height="30">                       
   <tr>                     
    <td  bgcolor="#DEEBD6" class=main2>                        
<font color="#000000">                        
<p align="left">                        
<%                     
   Response.write "<font color='#000000'>分页-</font>"                        
   If currentpage > 1 Then                     
      response.write "<a href='user1info.asp?&page="+cstr(1)+"'><font color='#000000'>首页</font></a><font color='#ffffff'><b>-</b></font>"                       
      Response.write "<a href='user1info.asp?page="+Cstr(currentpage-1)+"'><font color='#000000'>前页</font></a><font color='#ffffff'><b>-</b></font>"                     
   Else                     
      Response.write "<font color='#000000'>首页-</font>"                     
      Response.write "<font color='#000000'>前页-</font>"                           
   End if                     
                        
   If currentpage < Rs.PageCount Then                     
      Response.write "<a href='user1info.asp?page="+Cstr(currentPage+1)+"'><font color='#000000'>后页</font></a><font color='#ffffff'><b>-</b></font>"                     
      Response.write "<a href='user1info.asp?page="+Cstr(Rs.PageCount)+"'><font color='#000000'>尾页</font></a>&nbsp;&nbsp;"                     
   Else                     
      Response.write "<font color='#000000'>后页-</font>"                     
      Response.write "<font color='#000000'>尾页</font>&nbsp;&nbsp;"                            
   End if                     
   Response.write "<font color='#000000'>页次:</font>" & "<font color=#FF0000>" & Cstr(CurrentPage) &  "</font>" & "<font color='#000000'>/" & Cstr(rs.pagecount) & "</font>&nbsp;"                     
   Response.write "<font color=#ff0000>" & Cstr(MaxPerPage) & "</font>" & "<font color='#000000'>条记录/页&nbsp" & "共</font>" & "<font color=#FF0000>" & Cstr(Rs.RecordCount) & "</font>" & "<font color='#000000'>条记录</font>&nbsp;&nbsp;"                     
                     
response.write "</td><td align='right'>"                     
response.write "<font color='#ffffff' class=main2>转到：</font><input type='text' name='page' size=4 maxlength=4 class=smallInput value="&Currentpage&">&nbsp;"                     
   response.write "<input class=buttonface type='submit'  value='Go'  name='cndok' style='background-color: #e1f0ff'></span>&nbsp;&nbsp;"                        
%>                         
</font>                         
    </td>                       
   </tr>                     
  </table>                     
  </center>                     
</td></tr>                     
</table>                     
</form>                     
<%end sub%>                     
                     
                     
</body>                     
</html>                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
          
          
