<%@ LANGUAGE="VBSCRIPT" %>
<%
if request.cookies("adminok")="" then
  response.redirect "login.htm"
end if
%>
<html>
<head>
<title>��ͨ��Ա�б�</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="style.css" type="text/css"></head>
<body  text="#000000">
<br>
      <div align="center">
        <center>
<!--#include file="conn.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sqltext="select * from userinfo where txtLevel='��ͨ��Ա' and flag=1 order by id desc" 
rs.open sqltext,conn,1,1

dim MaxPerPage
MaxPerPage=20

'����û������ʱ
If rs.eof and rs.bof then 
   call showpages
   response.write "<p align='center'><font color='#ff0000'>��û��ͨ��Ա��Ϣ</font></p>"
   response.end
End if

'ȡ��ҳ��,���ж��û�������Ƿ��������͵����ݣ��粻�ǽ��Ե�һҳ��ʾ
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

'��ʾ���ӵ��ӳ���
Sub list()%><form method='POST' action='../admin/news1_Search.asp'>
            <TABLE cellSpacing=1 cellPadding=4 width=756 bgColor=#416327 height="136">
              <TBODY>
              <TR vAlign=top bgColor=#e1f0ff>
                <TD class=main2  height="10" bgcolor="#398A00" background="../admin/images/bg.gif" width="742"></TD></TR>
              <TR vAlign=top bgColor=#e1f0ff>
                <TD class=main2  height="18" width="734" bgcolor="#DEEBD6">��ͨ��Ա�б�--&nbsp;       
                  <input type="button" value="������ҳ" onclick=" window.location='manage.asp'"  style="font-family: ��ϸ����, ����, Arial; font-size: 9pt; height:20px;background-color:#D4D0C8;" onMouseOver ="this.style.backgroundColor='#FFC864'" onMouseOut ="this.style.backgroundColor='#D4D0C8'">&nbsp;                        
                                  
 </TD>                
        </center>                
              </TR>                   
        <center>                
              <TR vAlign=top bgColor=#e1f0ff>                
                <TD class=main2  height="15" width="742" bgcolor="#DEEBD6">                
                  <table border="1" cellpadding="0" cellspacing="0" width="100%" bordercolorlight="#416327" bordercolordark="#DEEBD6" height="38">
          <tr> 
            <td width="11%" bgcolor="#398A00" align="center" height="19" class=main2 ><font color="#FFFFFF">��Ա�˺�</font></td>
            <td height="19" align="center" bgcolor="#398A00" class=main2 ><font color="#FFFFFF">�Ա�</font></td>
            <td height="19" align="center" bgcolor="#398A00" class=main2 ><font color="#FFFFFF">����</font></td>
            <td height="19" align="center" bgcolor="#398A00" class=main2 ><font color="#FFFFFF">�绰</font></td>
            <td width="9%" bgcolor="#398A00" align="center" height="19" class=main2><font color="#FFFFFF">����</font></td>
            <td width="9%" bgcolor="#398A00" align="center" height="19" class=main2><font color="#FFFFFF">ע������</font></td>
            <td width="14%" bgcolor="#398A00" align="center" height="19" class=main2><font color="#FFFFFF">����</font></td>
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
            <td width="14%" align="center" height="1"> <input type="button" value="����" onclick=" window.location='userdetail.asp?id=<%=rs("id")%>'"  style="font-family: ��ϸ����, ����, Arial; font-size: 9pt; height:20px;background-color:#D4D0C8;" onMouseOver ="this.style.backgroundColor='#FFC864'" onMouseOut ="this.style.backgroundColor='#D4D0C8'"> 
              <input type="button" value="ɾ��" onclick="if (confirm('ȷʵҪ������¼��')) window.location='userinfodel.asp?id=<%=rs("id")%>'" style="font-family: ��ϸ����, ����, Arial; font-size: 9pt; height:20px;background-color:#D4D0C8;" onMouseOver="this.style.backgroundColor='#FFC864'" onMouseOut="this.style.backgroundColor='#D4D0C8'"></td>
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
  <center> </form>��                                                                                                                             
<%                     
'��ʾ��ҳ���ӳ���                     
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
   Response.write "<font color='#000000'>��ҳ-</font>"                        
   If currentpage > 1 Then                     
      response.write "<a href='user1info.asp?&page="+cstr(1)+"'><font color='#000000'>��ҳ</font></a><font color='#ffffff'><b>-</b></font>"                       
      Response.write "<a href='user1info.asp?page="+Cstr(currentpage-1)+"'><font color='#000000'>ǰҳ</font></a><font color='#ffffff'><b>-</b></font>"                     
   Else                     
      Response.write "<font color='#000000'>��ҳ-</font>"                     
      Response.write "<font color='#000000'>ǰҳ-</font>"                           
   End if                     
                        
   If currentpage < Rs.PageCount Then                     
      Response.write "<a href='user1info.asp?page="+Cstr(currentPage+1)+"'><font color='#000000'>��ҳ</font></a><font color='#ffffff'><b>-</b></font>"                     
      Response.write "<a href='user1info.asp?page="+Cstr(Rs.PageCount)+"'><font color='#000000'>βҳ</font></a>&nbsp;&nbsp;"                     
   Else                     
      Response.write "<font color='#000000'>��ҳ-</font>"                     
      Response.write "<font color='#000000'>βҳ</font>&nbsp;&nbsp;"                            
   End if                     
   Response.write "<font color='#000000'>ҳ��:</font>" & "<font color=#FF0000>" & Cstr(CurrentPage) &  "</font>" & "<font color='#000000'>/" & Cstr(rs.pagecount) & "</font>&nbsp;"                     
   Response.write "<font color=#ff0000>" & Cstr(MaxPerPage) & "</font>" & "<font color='#000000'>����¼/ҳ&nbsp" & "��</font>" & "<font color=#FF0000>" & Cstr(Rs.RecordCount) & "</font>" & "<font color='#000000'>����¼</font>&nbsp;&nbsp;"                     
                     
response.write "</td><td align='right'>"                     
response.write "<font color='#ffffff' class=main2>ת����</font><input type='text' name='page' size=4 maxlength=4 class=smallInput value="&Currentpage&">&nbsp;"                     
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
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
          
          
