<!--#include file="conn.asp"-->
<%
response.buffer=true
%>



<%






Dim sColor






set rs=server.createobject("adodb.recordset")

j=request("j")
jsd=request("jsd")
myjl=request("myjl")

jlh=request("jlh")
if jlh="" then
 jlh=0
 end if
if jlh=1 then
sql="select * from cxb Order by xh"
elseif jlh=2 then
sql="select * from cxb Order by xm"
elseif jlh=3 then
sql="select * from cxb Order by s"
elseif jlh=4 then
sql="select * from cxb Order by zybj"
elseif jlh=5 then
sql="select * from cxb Order by jtdz"




else
sql="select * from cxb Order by s"
end if


rs.open sql,conn,3,3
total=rs.recordcount
if not isnumeric(request("page")) or isempty(request("page")) then
page=1
else
page=int(abs(request("page")))
end if
if myjl=0 then
myjl=10
end if
rs.pagesize=myjl
mypagesize=rs.pagesize
if total<>0 then
rs.absolutepage=page
end if
%>








<html>
<head>
<title>�ɼ���ѯ</title>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="config.css" type="text/css">


</head>



<body text="#000000" background="bg01.gif" topmargin="0">







  <center>
  
  <!--#include file="gwst.asp"-->

     
        
        
        
        
        

  
  </center>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
      <p align="center"><font face="�����п�" size="6" color="#FF0000">�����ѯ����</font></br>
      
      
        ÿҳ��ʾ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <a href='index.asp?myjl=<%=10%>'>10��</a> &nbsp;&nbsp;&nbsp;&nbsp;

        <a href='index.asp?myjl=<%=20%>'>20��</a> &nbsp;&nbsp;&nbsp;&nbsp;
        
        <a href='index.asp?myjl=<%=50%>'>50��</a> &nbsp;&nbsp;&nbsp;&nbsp;

        <a href='index.asp?myjl=<%=100%>'>100��</a> &nbsp;&nbsp;&nbsp;&nbsp;
        
        <a href='index.asp?myjl=<%=total%>'>ȫ��</a>

      <p>
      <div align="center"><b><font color="#0066FF">(Ŀǰ���м�¼<font color=red><%=total%></font>��,��ӭ���ѯ) 
      </font></b></div>
 </td>
  </tr>
</table>



<%
Response.Write("<center>")


	Response.Write("<table border=1 cellpadding=1 cellspacing=1>")
	Response.Write("<tr bgcolor=aaaaaa style='color:black;'>")
	Response.Write("<td align=center>���</td>")
	Response.Write("<td align=center><a  href='index.asp?jlh=1&myjl="&myjl&"'>ѧ��</a></td>")
	Response.Write("<td align=center><a  href='index.asp?jlh=2&myjl="&myjl&"'>����</a></td>")
	Response.Write("<td align=center>�Ա�</td>")
	Response.Write("<td align=center><a  href='index.asp?jlh=3&myjl="&myjl&"'>���Ż�רҵ</a></td>")
	Response.Write("<td align=center><a  href='index.asp?jlh=4&myjl="&myjl&"'>�༶����</a></td>")
	Response.Write("<td align=center><a  href='index.asp?jlh=5&myjl="&myjl&"'>��ͥסַ</a></td>")
    Response.Write("<td align=center>�鿴����</td></tr>")




dim i 
i=1
do while not rs.eof and mypagesize>0 '----------�����mypagesize>0���ܶ�����������ѭ�����ж�����
xh=rs("xh")
xm=rs("xm")
xb=rs("xb")
s=rs("s")
zybj=rs("zybj")
jtdz=rs("jtdz")
 
  
  
  

 If sColor = "silver" Then
		sColor = "#cccccc"
	Else
		sColor = "silver"
	End If
   
		Response.Write("<tr bgcolor='" & sColor & "'>")
 
   %>
	
 
	<td align=center><font color="red"><%=i+(page-1)*rs.pagesize%></font></td>
	<td align=center><%=xh%></td>
    <td align=center><%=xm%></td>
    <%
    if xb="��" then
    	 %>
<td align=center><font color="red"><%=xb%></font></td>
	<%
else
	 %>
    	<td align=center><font color="green"><%=xb%></font></td>
<%
end if
 %>

    <td align=center><%=s%></td>
    <td align=center><%=zybj%></td>
    <td align=center><%=jtdz%></td>
    <td align=center>
  <a href="#" onClick="window.open('gwslyckxs.asp?xh=<%=xh%>&zybj=<%=zybj%>', 'Sample', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=yes,height=650,left=0,top=0')">
     <font color="blue">�鿴����</font></a></td></tr>
 
   
   
  
   
   
   
   
   
   
   
   
<%


mypagesize=mypagesize-1  '-------------�趨Ϊ10 ����ֻ��ѭ��10 �� ��Ϊ0ʱ����ѭ��
i=i+1
rs.movenext
loop
'-------------------��ʾ��¼���˽���

	Response.Write("</table><br><br>") 
	 
Response.Write("</center>")

%>
<table width="100%" border="0" align="center">
  <tr>
    <td>
      <div align="center">ҳ����&nbsp; 
      
              <%
if page>2 then  '-------------------������ڵ�2ҳ�Ժ��� ��ʾ��ҳ
%>
        <a href=index.asp?page=<%=1%>&jlh=<%=jlh%>&myjl=<%=myjl%>>��ҳ</a> 
        <%
end if
%>


             <%
if page>10 then  '-------------------������ڵ�11ҳ�Ժ��� ��ʾ��10ҳ
%>
        <a href=index.asp?page=<%=page-10%>&jlh=<%=jlh%>&myjl=<%=myjl%>>ǰ10ҳ</a> 
        <%
end if
%>



      
      
      
      
        <%
if page>1 then  '-------------------������ڵ�һҳ�Ժ��� ��ʾ��һҳ
%>
        <a href=index.asp?page=<%=page-1%>&jlh=<%=jlh%>&myjl=<%=myjl%>>��һҳ</a> 
        <%
end if
%>

 



        <%
if rs.pagecount<=10 then '---------------����ܹ���ҳ�����ڻ����10ҳ ��ֻ��12345678910��ʾ
for j=1 to rs.pagecount 
response.write "[<a href=index.asp?page="&j&"&jlh="&jlh&"&myjl="&myjl&">"&j&"</a>]"
next
else '----------------�������10ҳ ��ǰ10ҳ��12345678910���


jsj=page
if jsj>rs.pagecount-10 then
jsd=rs.pagecount
else
jsd=jsj+10
end if

for j=jsj to jsd
response.write "[<a href='index.asp?page="&j&"&jlh="&jlh&"&myjl="&myjl&"'>"&j&"</a>]&nbsp;"
next
if page<rs.pagecount-10 then
response.write  "[<a href='index.asp?page="&rs.pagecount&"&jlh="&jlh&"&myjl="&myjl&"' title='���һҳ'>βҳ</a>]"
end if
end if
'-------------���һҳ
%>

<%
if page<rs.pagecount   then%>
        <a href='index.asp?page=<%=page+1%>&jlh=<%=jlh%>&myjl=<%=myjl%>'>��һҳ</a> 
        
        
        
        
        
        
        
        
 
        <%
end if

      


%>
</div></td></tr></table>
 <!--#include file="nn.asp"-->  
<form name="form2" method="post" action="find.asp?myjl=<%=myjl%>">
 
  <table width="100%" border="0" align="center" height="37">
    <tr>
      <td height="42"> 
        <div align="center">
          <select name="topic">
            <option value="1">��ѧ����</option>
            <option value="2">��������</option>
            <option value="3">����ͥסַ��</option>
            <option value="4">�����Ż�רҵ��</option>
            <option value="5">���༶������</option>
            <option value="0" selected>��������</option>
                      </select>
          �ؼ��ʣ� 
          <input type="text" name="key" size="20">
          <input type="submit" name="Submit2" value="����">
        </div>
      </td>
    </tr>
  </table>
   </form>
  </form>
  </table>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
%>
  <center>
  
  <!--#include file="gwst.asp"-->

  
  
  </center>



  </body>
</html>