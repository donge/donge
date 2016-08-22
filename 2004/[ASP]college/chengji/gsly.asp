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
		 response.write"alert('没有此学号！');" 
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

    <font size="4" color="#FF0000">留言对象确认</font><div align="center">
      <center>
      <font size="3" color="#FF00FF"><p>
      <table border="2" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#0000FF" width="66%" id="AutoNumber1" bgcolor="#FFFF00">
        <tr>
          <td width="17%" align="center"><font color="#FF0000">学　　号</font></td>
          <td width="17%" align="center"><font color="#FF0000">部　　门</font></td>
          <td width="17%" align="center"><font color="#FF0000">班　　级</font></td>
          <td width="17%" align="center"><font color="#FF0000">姓　　名</font></td>
          <td width="17%" align="center"><font color="#FF0000">性　　别</font></td>
          <td width="17%" align="center"><font color="#FF0000">家庭住址</font></td>


        </tr>
        <tr>
        
        <td width="17%" align="center"><%=sxh%>　</td>
          <td width="17%" align="center"><%=s%>　</td>
           <td width="17%" align="center"><%=zybj%>　</td>

          <td width="17%" align="center"><%=xm%>　</td>
           <td width="17%" align="center"><%=xb%>　</td>
 <td width="17%" align="center"><%=jtdz%>　</td>

        </tr>
      </table>
      </center>
    </div>
    
    
     </font>
    
     </center>
<br>
   <input type=hidden name="xm"value="<%=xm%>">   
   <center>
   <input type=submit value="是，继续">
  </center>
    </form>
   </body>
</html>
<p>
<center><a href=gsly1.asp?xh=<%=xh%>>不是，返回</a></center>