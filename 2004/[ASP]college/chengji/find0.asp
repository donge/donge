<%@ language=vbscript %>
<!--#include file="conn.asp"-->
<%

  if Session.Contents("gws")<>true then
 %>
<!--#include file="gly.asp"-->
<%  
else

myjl=request("myjl")

key = request.form("key")
topic=request.form("topic")
if key="" and topic="" then
key = request("key")
topic=request("topic")
end if

if  key="" then
response.write"<script language='javascript'>" 
		 response.write"alert('��û�������ѯ�ؼ��ʣ�');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end
		 gws=0
end if

if topic="0"then
sql="SELECT * from cxb where xh like '%"&key&"%' or sw like '%"&key&"%' or xm like '%"&key&"%' or jtdz like '%"&key&"%' or s like '%"&key&"%' or zybj like '%"&key&"%' or lxdh like '%"&key&"%' or zzmm like '%"&key&"%' or jg like '%"&key&"%' or jl like '%"&key&"%' or cf like '%"&key&"%' or csrq like '%"&key&"%' or rxsj like '%"&key&"%' or bysj like '%"&key&"%' or byzs like '%"&key&"%'" 
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


if topic="6" then
sql="SELECT * from cxb where lxdh like '%"&key&"%'" 
end if
if topic="7" then
sql="SELECT * from cxb where zzmm like '%"&key&"%'" 
end if
if topic="8" then
sql="SELECT * from cxb where jg like '%"&key&"%'" 
end if
if topic="9" then
sql="SELECT * from cxb where jl like '%"&key&"%' " 
end if
if topic="10" then
sql="SELECT * from cxb where cf like '%"&key&"%' "
end if


if topic="11" then
sql="SELECT * from cxb where csrq like '%"&key&"%'" 
end if
if topic="12" then
sql="SELECT * from cxb where rxsj like '%"&key&"%'" 
end if
if topic="13" then
sql="SELECT * from cxb where bysj like '%"&key&"%'" 
end if
if topic="14" then
sql="SELECT * from cxb where byzs like '%"&key&"%' " 
end if
if topic="15" then
sql="SELECT * from cxb where sw like '%"&key&"%' " 
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
<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">
<form name="form1" method="post" action="find0.asp">
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
          <div align="center"><b><font face="�����п�" size="6" color="red">
            ѧ��������</font></b></div>      

          <div align="center"><b><font color=red>ɾ�����޸ļ�¼</font></b></div>      

        <div align="center"><b><font color="#0066FF">���ҵ�<font color=red><%=total%></font>��������Ҫ��ļ�¼ 
        </font></b></div>
    </td>
  </tr>
</table>



<%
Response.Write("<center>")


	Response.Write("<table border=1 cellpadding=1 cellspacing=1>")
	Response.Write("<tr bgcolor=aaaaaa style='color:black;'>")
	Response.Write("<td align=center>���</td>")
	Response.Write("<td align=center><a  href='index0.asp?jlh=1&myjl="&myjl&"'>ѧ��</a></td>")
	Response.Write("<td align=center><a  href='index0.asp?jlh=2&myjl="&myjl&"'>����</a></td>")
	Response.Write("<td align=center>�Ա�</td>")
	Response.Write("<td align=center><a  href='index0.asp?jlh=3&myjl="&myjl&"'>���Ż�רҵ</a></td>")
	Response.Write("<td align=center><a  href='index0.asp?jlh=4&myjl="&myjl&"'>�༶����</a></td>")
	Response.Write("<td align=center><a  href='index0.asp?jlh=5&myjl="&myjl&"'>��������</a></td>")
	Response.Write("<td align=center><a  href='index0.asp?jlh=6'>��ͥסַ</a></td>")

    Response.Write("<td align=center><a  href='index0.asp?jlh=7&myjl="&myjl&"'>��ѧʱ��</a></td>")
    Response.Write("<td align=center><a  href='index0.asp?jlh=8&myjl="&myjl&"'>��ҵ֤���</a></td>")
	Response.Write("<td align=center><a  href='index0.asp?jlh=9&myjl="&myjl&"'>����</a></td>")
	Response.Write("<td align=center><a  href='index0.asp?jlh=10&myjl="&myjl&"'>������ò</a></td>")
	Response.Write("<td align=center><a  href='index0.asp?jlh=11&myjl="&myjl&"'>��ҵʱ��</a></td>")
	
    Response.Write("<td align=center>ɾ��ȷ��</td>")
    Response.Write("<td align=center>�޸�����</td>")
    Response.Write("<td align=center>�鿴����</td></tr>")




    
do while not rs.eof
i=i+1
xh=rs("xh")
xm=rs("xm")
xb=rs("xb")
s=rs("s")
zybj=rs("zybj")
jtdz=rs("jtdz")
csrq=rs("csrq")

rxsj=rs("rxsj")
byzs=rs("byzs")
jg=rs("jg")
zzmm=rs("zzmm")
bysj=rs("bysj")

%>

  
  
  
<% 
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
    <td align=center><%=csrq%>��</td>
    <td align=center><%=jtdz%>��</td>
     <td align=center><%=rxsj%>��</td>
    <td align=center><%=byzs%>��</td>
    <td align=center><%=jg%>��</td>
    <td align=center><%=zzmm%>��</td>
    <td align=center><%=bysj%>��</td>


    <td align=center><a href=sc.asp?xh=<%=xh%>><font color="red">���ɾ��</font></a></td>
    <td align=center><a href=gwsxg.asp?xh=<%=xh%>&zybj=<%=zybj%>&key=<%=key%>&topic=<%=topic%>><font color="green">�鿴�޸�</font></a></td>
        
    	    <td align=center>
    <a href="#" onClick="window.open('gwslygl.asp?xh=<%=xh%>&zybj=<%=zybj%>', 'Sample', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=yes,left=0,top=0')">
    <font color="blue">�鿴����</font></a></td></tr>
   

    
    
    
 <%
rs.movenext
loop

Response.Write("</table>") 
Response.Write("</center>")

%>
  <br>



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
            <option value="6">����ϵ�绰��</option>
            <option value="7">��������ò��</option>
            <option value="8">��������</option>
            <option value="9">��������</option>
            <option value="10">��������</option>
            <option value="11">������������</option>
            <option value="12">����ѧʱ����</option>
            <option value="13">����ҵʱ����</option>
            <option value="14">����ҵ֤�����</option>
            <option value="15">��ѧλ��</option>

            
            

            
            
            
            
            
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
</body>
</html>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
end if
%>

  <form action=index0.asp method=post>
<center><input type=submit value="���ع�����ҳ" align=center></center>

  </form>