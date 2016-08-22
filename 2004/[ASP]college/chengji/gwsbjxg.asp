<!--#include file="conn.asp"-->
<%
 zybj=request("zybj")
 
 dim rs
 dim sql
  set rs=server.createobject("adodb.recordset")
 sql="select * from zybjmc where zybj='" + zybj + "'"
 rs.open sql,conn,3,3
%>
<html>
 <head>
  <title>修改班级信息</title>
 </head>
 <body topmargin=0 leftmargin=0 rightmargin=0 bgcolor="#fef4d9">
    <center>
  <font face="华文行楷" size="6" color="#FF0000"><b>修改班级信息</b></font></center>
 <form action=xg.asp method=post>
   <table width=552 cellpadding=4 cellspacing=1 bgcolor=#ff0000 align=center height="1">
             
     <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">部门或专业
        <td height="19" width="432"><input type=text name="s" size=20 maxlength=20 class=i value="<%=rs("s")%>"><font size="2">最多10个汉字&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font><a href=scbj.asp?zybj=<%=zybj%> title="请三思而后行"><font color="red"><kbd>点击删除</kbd></font></a><kbd>此记录</kbd>

    <tr bgcolor=#FFcccc>
    <td align=center width=100 height="1">班级名称
        <td height="1" width="432"><input type=text name="zybj" size=30 maxlength=30 class=i value="<%=rs("zybj")%>"><br>
    <font size="2" color="green">不要更改，</font><font size="2"><font color=#009933>否则可能修改无效</font>或<font color="#009933">修改其它记录</font></font>
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">管理员密码
        <td height="19" width="433"><input type=text name="glymm" size=20 maxlength=20 class=i value="<%=rs("glymm")%>"><font size="2">20个字符以内</font>
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="1">班主任
        <td height="1" width="433"><input type=text name="byxf" size=10 maxlength=10 class=i value="<%=rs("byxf")%>"><font size="2">5个汉字以内    </font>
      
     <tr bgcolor=#FFcccc>
    <td align=center width=100 height="11">班主任性别
    <%
    xb=rs("xb")
    if xb="男" then
    %>
        <td height="11" width="433"><input type=radio name="xb" value="男" checked>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name="xb" value="女">女
    <%   
    else
    %>
        <td height="11" width="433"><input type=radio name="xb" value="男">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name="xb" value="女" checked>女
    <%
    end if
    %>

           
  </table>
  
     <center>
        
  <table width="100%" cellspacing=0 bgcolor=#FFCCbb height="2" style="border-collapse: collapse" bordercolor="#000000" bordercolorlight="blue" bordercolordark="blue" border="1">

            <tr>
        <td width="5%" height="16" align="center"><font size="2">序号</font></td>
        <td width="5%" height="16" align="center"><font size="2">一学期课程名称</font></td>
        <td width="5%" height="16" align="center"><font size="2">二学期课程名称</font></td>
        <td width="5%" height="16" align="center"><font size="2">三学期课程名称</font></td>
        <td width="5%" height="16" align="center"><font size="2">四学期课程名称</font></td>
        <td width="5%" height="16" align="center"><font size="2">五学期课程名称</font></td>
        <td width="5%" height="16" align="center"><font size="2">六学期课程名称</font></td>
        <td width="5%" height="16" align="center"><font size="2">七学期课程名称</font></td>
        <td width="5%" height="16" align="center"><font size="2">八学期课程名称</font></td>
      </tr>
    
            <tr>
        <td width="5%" height="16" align="center"><font size="2">0</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs10" size=14 maxlength=20 class=i value="<%=rs("fs10")%>">  </font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs20" size=14 maxlength=20 class=i value="<%=rs("fs20")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs30" size=14 maxlength=20 class=i value="<%=rs("fs30")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs40" size=14 maxlength=20 class=i value="<%=rs("fs40")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs50" size=14 maxlength=20 class=i value="<%=rs("fs50")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs60" size=14 maxlength=20 class=i value="<%=rs("fs60")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs70" size=14 maxlength=20 class=i value="<%=rs("fs70")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs80" size=14 maxlength=20 class=i value="<%=rs("fs80")%>">　</font></td>
      </tr>
    
      <tr>
        <td width="5%" height="16" align="center"><font size="2">1</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs11" size=14 maxlength=20 class=i value="<%=rs("fs11")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs21" size=14 maxlength=20 class=i value="<%=rs("fs21")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs31" size=14 maxlength=20 class=i value="<%=rs("fs31")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs41" size=14 maxlength=20 class=i value="<%=rs("fs41")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs51" size=14 maxlength=20 class=i value="<%=rs("fs51")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs61" size=14 maxlength=20 class=i value="<%=rs("fs61")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs71" size=14 maxlength=20 class=i value="<%=rs("fs71")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs81" size=14 maxlength=20 class=i value="<%=rs("fs81")%>">  </font></td>

      </tr>
 
      <tr>
        <td width="5%" height="16" align="center"><font size="2">2</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs12" size=14 maxlength=20 class=i value="<%=rs("fs12")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs22" size=14 maxlength=20 class=i value="<%=rs("fs22")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs32" size=14 maxlength=20 class=i value="<%=rs("fs32")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs42" size=14 maxlength=20 class=i value="<%=rs("fs42")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs52" size=14 maxlength=20 class=i value="<%=rs("fs52")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs62" size=14 maxlength=20 class=i value="<%=rs("fs62")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs72" size=14 maxlength=20 class=i value="<%=rs("fs72")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs82" size=14 maxlength=20 class=i value="<%=rs("fs82")%>"> </font>  </td>

        </tr>
   
      <tr>
        <td width="5%" height="16" align="center"><font size="2">3</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs13" size=14 maxlength=20 class=i value="<%=rs("fs13")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs23" size=14 maxlength=20 class=i value="<%=rs("fs23")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs33" size=14 maxlength=20 class=i value="<%=rs("fs33")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs43" size=14 maxlength=20 class=i value="<%=rs("fs43")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs53" size=14 maxlength=20 class=i value="<%=rs("fs53")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs63" size=14 maxlength=20 class=i value="<%=rs("fs63")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs73" size=14 maxlength=20 class=i value="<%=rs("fs73")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs83" size=14 maxlength=20 class=i value="<%=rs("fs83")%>">  </font></td>

      </tr>
 
      <tr>
        <td width="5%" height="1" align="center"><font size="2">4</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs14" size=14 maxlength=20 class=i value="<%=rs("fs14")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs24" size=14 maxlength=20 class=i value="<%=rs("fs24")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs34" size=14 maxlength=20 class=i value="<%=rs("fs34")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs44" size=14 maxlength=20 class=i value="<%=rs("fs44")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs54" size=14 maxlength=20 class=i value="<%=rs("fs54")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs64" size=14 maxlength=20 class=i value="<%=rs("fs64")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs74" size=14 maxlength=20 class=i value="<%=rs("fs74")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs84" size=14 maxlength=20 class=i value="<%=rs("fs84")%>"> </font>  </td>

      </tr>
      <tr>
        <td width="5%" height="16" align="center"><font size="2">5</font></td> 
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs15" size=14 maxlength=20 class=i value="<%=rs("fs15")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs25" size=14 maxlength=20 class=i value="<%=rs("fs25")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs35" size=14 maxlength=20 class=i value="<%=rs("fs35")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs45" size=14 maxlength=20 class=i value="<%=rs("fs45")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs55" size=14 maxlength=20 class=i value="<%=rs("fs55")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs65" size=14 maxlength=20 class=i value="<%=rs("fs65")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs75" size=14 maxlength=20 class=i value="<%=rs("fs75")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs85" size=14 maxlength=20 class=i value="<%=rs("fs85")%>">  </font></td>
</tr>
    
      <tr>
        <td width="5%" height="16" align="center"><font size="2">6</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs16" size=14 maxlength=20 class=i value="<%=rs("fs16")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs26" size=14 maxlength=20 class=i value="<%=rs("fs26")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs36" size=14 maxlength=20 class=i value="<%=rs("fs36")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs46" size=14 maxlength=20 class=i value="<%=rs("fs46")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs56" size=14 maxlength=20 class=i value="<%=rs("fs56")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs66" size=14 maxlength=20 class=i value="<%=rs("fs66")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs76" size=14 maxlength=20 class=i value="<%=rs("fs76")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs86" size=14 maxlength=20 class=i value="<%=rs("fs86")%>"> </font>  </td>

      </tr>
   
      <tr>
        <td width="5%" height="16" align="center"><font size="2">7</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs17" size=14 maxlength=20 class=i value="<%=rs("fs17")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs27" size=14 maxlength=20 class=i value="<%=rs("fs27")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs37" size=14 maxlength=20 class=i value="<%=rs("fs37")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs47" size=14 maxlength=20 class=i value="<%=rs("fs47")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs57" size=14 maxlength=20 class=i value="<%=rs("fs57")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs67" size=14 maxlength=20 class=i value="<%=rs("fs67")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs77" size=14 maxlength=20 class=i value="<%=rs("fs77")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs87" size=14 maxlength=20 class=i value="<%=rs("fs87")%>"> </font>  </td>
</tr>
     
     
     
      <tr>
        <td width="5%" height="16" align="center"><font size="2">8</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs18" size=14 maxlength=20 class=i value="<%=rs("fs18")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs28" size=14 maxlength=20 class=i value="<%=rs("fs28")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs38" size=14 maxlength=20 class=i value="<%=rs("fs38")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs48" size=14 maxlength=20 class=i value="<%=rs("fs48")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs58" size=14 maxlength=20 class=i value="<%=rs("fs58")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs68" size=14 maxlength=20 class=i value="<%=rs("fs68")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs78" size=14 maxlength=20 class=i value="<%=rs("fs78")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs88" size=14 maxlength=20 class=i value="<%=rs("fs88")%>"> </font>  </td>

      </tr>
   
      <tr>
        <td width="5%" height="16" align="center"><font size="2">9</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs19" size=14 maxlength=20 class=i value="<%=rs("fs19")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs29" size=14 maxlength=20 class=i value="<%=rs("fs29")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs39" size=14 maxlength=20 class=i value="<%=rs("fs39")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs49" size=14 maxlength=20 class=i value="<%=rs("fs49")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs59" size=14 maxlength=20 class=i value="<%=rs("fs59")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs69" size=14 maxlength=20 class=i value="<%=rs("fs69")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs79" size=14 maxlength=20 class=i value="<%=rs("fs79")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs89" size=14 maxlength=20 class=i value="<%=rs("fs89")%>"> </font>  </td>
</tr>
     
     
           <tr>
        <td width="5%" height="16" align="center"><font size="2">10</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs110" size=14 maxlength=20 class=i value="<%=rs("fs110")%>">  </font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs120" size=14 maxlength=20 class=i value="<%=rs("fs120")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs130" size=14 maxlength=20 class=i value="<%=rs("fs130")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs140" size=14 maxlength=20 class=i value="<%=rs("fs140")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs150" size=14 maxlength=20 class=i value="<%=rs("fs150")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs160" size=14 maxlength=20 class=i value="<%=rs("fs160")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs170" size=14 maxlength=20 class=i value="<%=rs("fs170")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs180" size=14 maxlength=20 class=i value="<%=rs("fs180")%>">　</font></td>
      </tr>
    
      <tr>
        <td width="5%" height="16" align="center"><font size="2">11</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs111" size=14 maxlength=20 class=i value="<%=rs("fs111")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs121" size=14 maxlength=20 class=i value="<%=rs("fs121")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs131" size=14 maxlength=20 class=i value="<%=rs("fs131")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs141" size=14 maxlength=20 class=i value="<%=rs("fs141")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs151" size=14 maxlength=20 class=i value="<%=rs("fs151")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs161" size=14 maxlength=20 class=i value="<%=rs("fs161")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs171" size=14 maxlength=20 class=i value="<%=rs("fs171")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs181" size=14 maxlength=20 class=i value="<%=rs("fs181")%>">  </font></td>

      </tr>
 
      <tr>
        <td width="5%" height="16" align="center"><font size="2">12</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs112" size=14 maxlength=20 class=i value="<%=rs("fs112")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs122" size=14 maxlength=20 class=i value="<%=rs("fs122")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs132" size=14 maxlength=20 class=i value="<%=rs("fs132")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs142" size=14 maxlength=20 class=i value="<%=rs("fs142")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs152" size=14 maxlength=20 class=i value="<%=rs("fs152")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs162" size=14 maxlength=20 class=i value="<%=rs("fs162")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs172" size=14 maxlength=20 class=i value="<%=rs("fs172")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs182" size=14 maxlength=20 class=i value="<%=rs("fs182")%>"> </font>  </td>

        </tr>
   
      <tr>
        <td width="5%" height="16" align="center"><font size="2">13</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs113" size=14 maxlength=20 class=i value="<%=rs("fs113")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs123" size=14 maxlength=20 class=i value="<%=rs("fs123")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs133" size=14 maxlength=20 class=i value="<%=rs("fs133")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs143" size=14 maxlength=20 class=i value="<%=rs("fs143")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs153" size=14 maxlength=20 class=i value="<%=rs("fs153")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs163" size=14 maxlength=20 class=i value="<%=rs("fs163")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs173" size=14 maxlength=20 class=i value="<%=rs("fs173")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs183" size=14 maxlength=20 class=i value="<%=rs("fs183")%>">  </font></td>

      </tr>
 
      <tr>
        <td width="5%" height="1" align="center"><font size="2">14</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs114" size=14 maxlength=20 class=i value="<%=rs("fs114")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs124" size=14 maxlength=20 class=i value="<%=rs("fs124")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs134" size=14 maxlength=20 class=i value="<%=rs("fs134")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs144" size=14 maxlength=20 class=i value="<%=rs("fs144")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs154" size=14 maxlength=20 class=i value="<%=rs("fs154")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs164" size=14 maxlength=20 class=i value="<%=rs("fs164")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs174" size=14 maxlength=20 class=i value="<%=rs("fs174")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs184" size=14 maxlength=20 class=i value="<%=rs("fs184")%>"> </font>  </td>

      </tr>
      <tr>
        <td width="5%" height="16" align="center"><font size="2">15</font></td> 
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs115" size=14 maxlength=20 class=i value="<%=rs("fs115")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs125" size=14 maxlength=20 class=i value="<%=rs("fs125")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs135" size=14 maxlength=20 class=i value="<%=rs("fs135")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs145" size=14 maxlength=20 class=i value="<%=rs("fs145")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs155" size=14 maxlength=20 class=i value="<%=rs("fs155")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs165" size=14 maxlength=20 class=i value="<%=rs("fs165")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs175" size=14 maxlength=20 class=i value="<%=rs("fs175")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs185" size=14 maxlength=20 class=i value="<%=rs("fs185")%>">  </font></td>
</tr>
    
      <tr>
        <td width="5%" height="16" align="center"><font size="2">16</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs116" size=14 maxlength=20 class=i value="<%=rs("fs116")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs126" size=14 maxlength=20 class=i value="<%=rs("fs126")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs136" size=14 maxlength=20 class=i value="<%=rs("fs136")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs146" size=14 maxlength=20 class=i value="<%=rs("fs146")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs156" size=14 maxlength=20 class=i value="<%=rs("fs156")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs166" size=14 maxlength=20 class=i value="<%=rs("fs166")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs176" size=14 maxlength=20 class=i value="<%=rs("fs176")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs186" size=14 maxlength=20 class=i value="<%=rs("fs186")%>"> </font>  </td>

      </tr>
   
      <tr>
        <td width="5%" height="16" align="center"><font size="2">17</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs117" size=14 maxlength=20 class=i value="<%=rs("fs117")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs127" size=14 maxlength=20 class=i value="<%=rs("fs127")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs137" size=14 maxlength=20 class=i value="<%=rs("fs137")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs147" size=14 maxlength=20 class=i value="<%=rs("fs147")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs157" size=14 maxlength=20 class=i value="<%=rs("fs157")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs167" size=14 maxlength=20 class=i value="<%=rs("fs167")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs177" size=14 maxlength=20 class=i value="<%=rs("fs177")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs187" size=14 maxlength=20 class=i value="<%=rs("fs187")%>"> </font>  </td>
</tr>
     
     
     
      <tr>
        <td width="5%" height="16" align="center"><font size="2">18</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs118" size=14 maxlength=20 class=i value="<%=rs("fs118")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs128" size=14 maxlength=20 class=i value="<%=rs("fs128")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs138" size=14 maxlength=20 class=i value="<%=rs("fs138")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs148" size=14 maxlength=20 class=i value="<%=rs("fs148")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs158" size=14 maxlength=20 class=i value="<%=rs("fs158")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs168" size=14 maxlength=20 class=i value="<%=rs("fs168")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs178" size=14 maxlength=20 class=i value="<%=rs("fs178")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs188" size=14 maxlength=20 class=i value="<%=rs("fs188")%>"> </font>  </td>

      </tr>
   
      <tr>
        <td width="5%" height="16" align="center"><font size="2">19</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs119" size=14 maxlength=20 class=i value="<%=rs("fs119")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs129" size=14 maxlength=20 class=i value="<%=rs("fs129")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs139" size=14 maxlength=20 class=i value="<%=rs("fs139")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs149" size=14 maxlength=20 class=i value="<%=rs("fs149")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs159" size=14 maxlength=20 class=i value="<%=rs("fs159")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs169" size=14 maxlength=20 class=i value="<%=rs("fs169")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs179" size=14 maxlength=20 class=i value="<%=rs("fs179")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs189" size=14 maxlength=20 class=i value="<%=rs("fs189")%>"> </font>  </td>
</tr>
     

      
      </table>

   
 
  
    <center>
    <p><input type=submit value="提交">&nbsp;&nbsp;&nbsp; <input type=reset value="还原"></p>
  </form>
  <p>
 </body>
</html>