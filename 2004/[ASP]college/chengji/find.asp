<%@ language=vbscript %>
<!--#include file="conn.asp"-->
<%
response.buffer=true
%>
<%


myjl=request("myjl")

key = request.form("key")
topic=request.form("topic")
if  key="" then
response.write"<script language='javascript'>" 
		 response.write"alert('��û�������ѯ�ؼ��ʣ�');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end
end if

if topic="0"then
sql="SELECT * from cxb where xh like '%"&key&"%' or xm like '%"&key&"%' or jtdz like '%"&key&"%'or s like '%"&key&"%'or zybj like '%"&key&"%'" 
end if
if topic="1" then
sql="SELECT * from cxb where xh like '%"&key&"%'" 
end if
if topic="2" then
sql="SELECT * from cxb where xm like '%"&key&"%'" 
end if
if topic="3" then
sql="SELECT * from cxb where jtdz like '%"&key&"%'" 
end if
if topic="4" then
sql="SELECT * from cxb where s like '%"&key&"%' " 
end if
if topic="5" then
sql="SELECT * from cxb where zybj like '%"&key&"%' "
end if

set rs=server.createobject("adodb.recordset")
rs.open sql,conn,3,3
if rs.eof then	
		response.write"<script language='javascript'>" 
		 response.write"alert('�Բ���û���ҵ�����������ݣ�');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end
end if
	
total=rs.recordcount

%>
<html>
<head>
<title>�ҵ�<%=total%>����¼</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="config.css" type="text/css">
</head>
<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif" topmargin="0">
  <center>
  <!--#include file="gwst.asp"-->
  
<form name="form1" method="post" action="find.asp">
<font face="�����п�" size="6" color="#FF0000">�����ѯ����</font><p>
        <font color="#0066FF"><b>���ҵ�<font color=red><%=total%></font>��������Ҫ��ļ�¼</b> 
        </font>
</center>


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













do while not rs.eof
i=i+1
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
<td align=center><font color="red"><%=i%></font>��</td>
    <td align=center><%=xh%>��</td>
    <td align=center><%=xm%>��</td>
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

    <td align=center><%=s%>��</td>
    <td align=center><%=zybj%>��</td>
    <td align=center><%=jtdz%>��</td>
    	    <td align=center>
    <a href="#" onClick="window.open('gwslyckxs.asp?xh=<%=xh%>&zybj=<%=zybj%>', 'Sample', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=yes,height=650,left=0,top=0')">
    <font color="blue">�鿴����</font></a></td></tr>
   

    
    
 
<%
rs.movenext
loop
Response.Write("</table><br>") 
Response.Write("</center>")
%>


  <!--#include file="nnz.asp"-->







<table width="100%" border="0" align="center">
    <tr>
      <td> 
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