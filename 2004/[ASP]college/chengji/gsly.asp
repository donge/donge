<!--#include file="conn.asp"-->

<%
 xh=request("xh")
 sxh=request("sxh")

  dim rs
 dim sql
 
  set rs=server.createobject("adodb.recordset")
 sql="select * from cxb where xh='" + sxh + "'"
 rs.open sql,conn,3,3

if rs.eof then	
		response.write"<script language='javascript'>" 
		 response.write"alert('û�д�ѧ�ţ�');" 
		 response.write"history.go(-1);"
		 response.write"</script>" 
		 response.end
end if
s=rs("s")
zybj=rs("zybj")
jtdz=rs("jtdz")
xb=rs("xb")
xm=rs("xm")
  
%>

<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">
<form action=lrgg9.asp method=post>




<input type=hidden name="sxh"value="<%=sxh%>">



       <input type=hidden name="xh"value="<%=xh%>">    

     <center>

    <font size="4" color="#FF0000">���Զ���ȷ��</font><div align="center">
      <center>
      <font size="3" color="#FF00FF"><p>
      <table border="2" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#0000FF" width="66%" id="AutoNumber1" bgcolor="#FFFF00">
        <tr>
          <td width="17%" align="center"><font color="#FF0000">ѧ������</font></td>
          <td width="17%" align="center"><font color="#FF0000">��������</font></td>
          <td width="17%" align="center"><font color="#FF0000">�ࡡ����</font></td>
          <td width="17%" align="center"><font color="#FF0000">�ա�����</font></td>
          <td width="17%" align="center"><font color="#FF0000">�ԡ�����</font></td>
          <td width="17%" align="center"><font color="#FF0000">��ͥסַ</font></td>


        </tr>
        <tr>
        
        <td width="17%" align="center"><%=sxh%>��</td>
          <td width="17%" align="center"><%=s%>��</td>
           <td width="17%" align="center"><%=zybj%>��</td>

          <td width="17%" align="center"><%=xm%>��</td>
           <td width="17%" align="center"><%=xb%>��</td>
 <td width="17%" align="center"><%=jtdz%>��</td>

        </tr>
      </table>
      </center>
    </div>
    
    
     </font>
    
     </center>
<br>
   <input type=hidden name="xm"value="<%=xm%>">   
   <center>
   <input type=submit value="�ǣ�����">
  </center>
    </form>
   </body>
</html>
<p>
<center><a href=gsly1.asp?xh=<%=xh%>>���ǣ�����</a></center>