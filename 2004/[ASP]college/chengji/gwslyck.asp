<!--#include file="conn.asp"-->
<%
 xh=request("xh")
 zybj=request("zybj")
  dim rs,rs1
 dim sql,sql1
  set rs=server.createobject("adodb.recordset")
  set rs1=server.createobject("adodb.recordset")

 sql="select * from cxb where xh='" + xh + "'"
 sql1="select * from zybjmc where zybj='" + zybj + "'"

 rs.open sql,conn,3,3
 rs1.open sql1,conn,3,3
 
 fs10=rs("fs10")
 fs11=rs("fs11")
 fs12=rs("fs12")
 fs13=rs("fs13")
 fs14=rs("fs14")
 fs15=rs("fs15")
 fs16=rs("fs16")
 fs17=rs("fs17")
 fs18=rs("fs18")
 fs19=rs("fs19")


 fsm10=rs1("fs10")
 fsm11=rs1("fs11")
 fsm12=rs1("fs12")
 fsm13=rs1("fs13")
 fsm14=rs1("fs14")
 fsm15=rs1("fs15")
 fsm16=rs1("fs16")
 fsm17=rs1("fs17")
 fsm18=rs1("fs18")
 fsm19=rs1("fs19")
 

 fs20=rs("fs20")
 fs21=rs("fs21")
 fs22=rs("fs22")
 fs23=rs("fs23")
 fs24=rs("fs24")
 fs25=rs("fs25")
 fs26=rs("fs26")
 fs27=rs("fs27")
 fs28=rs("fs28")
 fs29=rs("fs29")

 
 fsm20=rs1("fs20")
 fsm21=rs1("fs21")
 fsm22=rs1("fs22")
 fsm23=rs1("fs23")
 fsm24=rs1("fs24")
 fsm25=rs1("fs25")
 fsm26=rs1("fs26")
 fsm27=rs1("fs27")
 fsm28=rs1("fs28")
 fsm29=rs1("fs29")

 
  
 fs30=rs("fs30")
 fs31=rs("fs31")
 fs32=rs("fs32")
 fs33=rs("fs33")
 fs34=rs("fs34")
 fs35=rs("fs35")
 fs36=rs("fs36")
 fs37=rs("fs37")
 fs38=rs("fs38")
 fs39=rs("fs39")

 fsm30=rs1("fs30")
 fsm31=rs1("fs31")
 fsm32=rs1("fs32")
 fsm33=rs1("fs33")
 fsm34=rs1("fs34")
 fsm35=rs1("fs35")
 fsm36=rs1("fs36")
 fsm37=rs1("fs37")
 fsm38=rs1("fs38")
 fsm39=rs1("fs39")

 
 
 fs40=rs("fs40")
 fs41=rs("fs41")
 fs42=rs("fs42")
 fs43=rs("fs43")
 fs44=rs("fs44")
 fs45=rs("fs45")
 fs46=rs("fs46")
 fs47=rs("fs47")
 fs48=rs("fs48")
 fs49=rs("fs49")

 fsm40=rs1("fs40")
 fsm41=rs1("fs41")
 fsm42=rs1("fs42")
 fsm43=rs1("fs43")
 fsm44=rs1("fs44")
 fsm45=rs1("fs45")
 fsm46=rs1("fs46")
 fsm47=rs1("fs47")
 fsm48=rs1("fs48")
 fsm49=rs1("fs49")
 
 fs50=rs("fs50")
 fs51=rs("fs51")
 fs52=rs("fs52")
 fs53=rs("fs53")
 fs54=rs("fs54")
 fs55=rs("fs55")
 fs56=rs("fs56")
 fs57=rs("fs57")
 fs58=rs("fs58")
 fs59=rs("fs59")

 
 fsm50=rs1("fs50")
 fsm51=rs1("fs51")
 fsm52=rs1("fs52")
 fsm53=rs1("fs53")
 fsm54=rs1("fs54")
 fsm55=rs1("fs55")
 fsm56=rs1("fs56")
 fsm57=rs1("fs57")
 fsm58=rs1("fs58")
 fsm59=rs1("fs59")
 
 fs60=rs("fs60")
 fs61=rs("fs61")
 fs62=rs("fs62")
 fs63=rs("fs63")
 fs64=rs("fs64")
 fs65=rs("fs65")
 fs66=rs("fs66")
 fs67=rs("fs67")
 fs68=rs("fs68")
 fs69=rs("fs69")

 fsm60=rs1("fs60")
 fsm61=rs1("fs61")
 fsm62=rs1("fs62")
 fsm63=rs1("fs63")
 fsm64=rs1("fs64")
 fsm65=rs1("fs65")
 fsm66=rs1("fs66")
 fsm67=rs1("fs67")
 fsm68=rs1("fs68")
 fsm69=rs1("fs69")
 
 
 fs70=rs("fs70")
 fs71=rs("fs71")
 fs72=rs("fs72")
 fs73=rs("fs73")
 fs74=rs("fs74")
 fs75=rs("fs75")
 fs76=rs("fs76")
 fs77=rs("fs77")
 fs78=rs("fs78")
 fs79=rs("fs79")

 
 fsm70=rs1("fs70")
 fsm71=rs1("fs71")
 fsm72=rs1("fs72")
 fsm73=rs1("fs73")
 fsm74=rs1("fs74")
 fsm75=rs1("fs75")
 fsm76=rs1("fs76")
 fsm77=rs1("fs77")
 fsm78=rs1("fs78")
 fsm79=rs1("fs79")
 
 fs80=rs("fs80")
 fs81=rs("fs81")
 fs82=rs("fs82")
 fs83=rs("fs83")
 fs84=rs("fs84")
 fs85=rs("fs85")
 fs86=rs("fs86")
 fs87=rs("fs87")
 fs88=rs("fs88")
 fs89=rs("fs89")

 fsm80=rs1("fs80")
 fsm81=rs1("fs81")
 fsm82=rs1("fs82")
 fsm83=rs1("fs83")
 fsm84=rs1("fs84")
 fsm85=rs1("fs85")
 fsm86=rs1("fs86")
 fsm87=rs1("fs87")
 fsm88=rs1("fs88")
 fsm89=rs1("fs89")

 fs110=rs("fs110")
 fs111=rs("fs111")
 fs112=rs("fs112")
 fs113=rs("fs113")
 fs114=rs("fs114")
 fs115=rs("fs115")
 fs116=rs("fs116")
 fs117=rs("fs117")
 fs118=rs("fs118")
 fs119=rs("fs119")


 fsm110=rs1("fs110")
 fsm111=rs1("fs111")
 fsm112=rs1("fs112")
 fsm113=rs1("fs113")
 fsm114=rs1("fs114")
 fsm115=rs1("fs115")
 fsm116=rs1("fs116")
 fsm117=rs1("fs117")
 fsm118=rs1("fs118")
 fsm119=rs1("fs119")
 

 fs120=rs("fs120")
 fs121=rs("fs121")
 fs122=rs("fs122")
 fs123=rs("fs123")
 fs124=rs("fs124")
 fs125=rs("fs125")
 fs126=rs("fs126")
 fs127=rs("fs127")
 fs128=rs("fs128")
 fs129=rs("fs129")

 
 fsm120=rs1("fs120")
 fsm121=rs1("fs121")
 fsm122=rs1("fs122")
 fsm123=rs1("fs123")
 fsm124=rs1("fs124")
 fsm125=rs1("fs125")
 fsm126=rs1("fs126")
 fsm127=rs1("fs127")
 fsm128=rs1("fs128")
 fsm129=rs1("fs129")

 
  
 fs130=rs("fs130")
 fs131=rs("fs131")
 fs132=rs("fs132")
 fs133=rs("fs133")
 fs134=rs("fs134")
 fs135=rs("fs135")
 fs136=rs("fs136")
 fs137=rs("fs137")
 fs138=rs("fs138")
 fs139=rs("fs139")

 fsm130=rs1("fs130")
 fsm131=rs1("fs131")
 fsm132=rs1("fs132")
 fsm133=rs1("fs133")
 fsm134=rs1("fs134")
 fsm135=rs1("fs135")
 fsm136=rs1("fs136")
 fsm137=rs1("fs137")
 fsm138=rs1("fs138")
 fsm139=rs1("fs139")

 
 
 fs140=rs("fs140")
 fs141=rs("fs141")
 fs142=rs("fs142")
 fs143=rs("fs143")
 fs144=rs("fs144")
 fs145=rs("fs145")
 fs146=rs("fs146")
 fs147=rs("fs147")
 fs148=rs("fs148")
 fs149=rs("fs149")

 fsm140=rs1("fs140")
 fsm141=rs1("fs141")
 fsm142=rs1("fs142")
 fsm143=rs1("fs143")
 fsm144=rs1("fs144")
 fsm145=rs1("fs145")
 fsm146=rs1("fs146")
 fsm147=rs1("fs147")
 fsm148=rs1("fs148")
 fsm149=rs1("fs149")
 
 fs150=rs("fs150")
 fs151=rs("fs151")
 fs152=rs("fs152")
 fs153=rs("fs153")
 fs154=rs("fs154")
 fs155=rs("fs155")
 fs156=rs("fs156")
 fs157=rs("fs157")
 fs158=rs("fs158")
 fs159=rs("fs159")

 
 fsm150=rs1("fs150")
 fsm151=rs1("fs151")
 fsm152=rs1("fs152")
 fsm153=rs1("fs153")
 fsm154=rs1("fs154")
 fsm155=rs1("fs155")
 fsm156=rs1("fs156")
 fsm157=rs1("fs157")
 fsm158=rs1("fs158")
 fsm159=rs1("fs159")
 
 fs160=rs("fs160")
 fs161=rs("fs161")
 fs162=rs("fs162")
 fs163=rs("fs163")
 fs164=rs("fs164")
 fs165=rs("fs165")
 fs166=rs("fs166")
 fs167=rs("fs167")
 fs168=rs("fs168")
 fs169=rs("fs169")

 fsm160=rs1("fs160")
 fsm161=rs1("fs161")
 fsm162=rs1("fs162")
 fsm163=rs1("fs163")
 fsm164=rs1("fs164")
 fsm165=rs1("fs165")
 fsm166=rs1("fs166")
 fsm167=rs1("fs167")
 fsm168=rs1("fs168")
 fsm169=rs1("fs169")
 
 
 fs170=rs("fs170")
 fs171=rs("fs171")
 fs172=rs("fs172")
 fs173=rs("fs173")
 fs174=rs("fs174")
 fs175=rs("fs175")
 fs176=rs("fs176")
 fs177=rs("fs177")
 fs178=rs("fs178")
 fs179=rs("fs179")

 
 fsm170=rs1("fs170")
 fsm171=rs1("fs171")
 fsm172=rs1("fs172")
 fsm173=rs1("fs173")
 fsm174=rs1("fs174")
 fsm175=rs1("fs175")
 fsm176=rs1("fs176")
 fsm177=rs1("fs177")
 fsm178=rs1("fs178")
 fsm179=rs1("fs179")
 
 fs180=rs("fs180")
 fs181=rs("fs181")
 fs182=rs("fs182")
 fs183=rs("fs183")
 fs184=rs("fs184")
 fs185=rs("fs185")
 fs186=rs("fs186")
 fs187=rs("fs187")
 fs188=rs("fs188")
 fs189=rs("fs189")

 fsm180=rs1("fs180")
 fsm181=rs1("fs181")
 fsm182=rs1("fs182")
 fsm183=rs1("fs183")
 fsm184=rs1("fs184")
 fsm185=rs1("fs185")
 fsm186=rs1("fs186")
 fsm187=rs1("fs187")
 fsm188=rs1("fs188")
 fsm189=rs1("fs189")

 %>
<html>
 <head>
  <title>详情查看</title>
  
  
  
<SCRIPT language="JavaScript">
  
function closeclk() {
close();
}
  </script>
  
  
  
  
  
  
  
  
  
 </head>
 <body topmargin=0 leftmargin=0 rightmargin=0 bgcolor="#fef4d9">
  <center>
  <font face="华文行楷" size="6" color="#FF0000"><b>学生成绩详情查看</b></font>
   <div align="center">
     <center>
   
     
  <table width="100%" cellpadding=4 cellspacing=0 bgcolor=#FFCCCC height="1" style="border-collapse: collapse" bordercolor="#FF0000" bordercolorlight="#FF0000" bordercolordark="#FF0000" border="1">
     
       <tr>
         <td width="145" height="1" align="center">
         <p align="center"><font size="2">学号 </font> </td>
         <td width="334" height="1" align="center">
          <p align="center">
          <font size="2">
          <input type=hidden name="xh" value="<%=rs("xh")%>"></font><font size="2" color="green"><%=rs("xh")%></font><font size="2">
          </font>
        </td>
         <td width="149" height="1" align="center">
         <p align="center"><font size="2">姓名</font></td>
         <td width="186" height="1" align="center">
         <p align="center"><font size="2"><%=rs("xm")%></font></td>
         <td width="82" height="1" align="center">
         <p align="center"><font size="2">性别 </font> </td>
         <td width="54" height="1" align="center">
         <p align="center">
             <font size="2">
             <%
    xb=rs("xb")
    if xb="男" then
    %>
      男
    <%   
    else
    %>
    女
    <%
    end if
    %> 
    
    </font>
</td>
       </tr>
       <tr>
         <td width="145" height="13" align="center">
         <p align="center"><font size="2">部门或专业</font></td>
         <td width="334" height="13" align="center">
         <p align="center"><font size="2"><%=rs("s")%></font></td>
         <td width="149" height="13" align="center">
         <p align="center"><font size="2">班级名称</font> </td></td>
         <td width="340" height="13" colspan="3" align="center">
         <p align="center"><font size="2"><%=rs("zybj")%> </font>

       </tr>
        <tr>
         <td width="145" height="1" align="center">
         <p align="center"><font size="2">家庭住址</font> </td>
         <td width="334" height="1" align="center">
         <p align="center"><font size="2"><%=rs("jtdz")%> </font>
</td>
         <td width="149" height="1" align="center">
         <p align="center"><font size="2">联系电话</font> </td>
         <td width="340" height="1" colspan="3" align="center">
         <p align="center"><font size="2"><%=rs("lxdh")%> </font>
</td>
       </tr>

       <tr>
         <td width="145" height="1" align="center">
         <p align="center"><font size="2">备注1 </font> </td>
         <td width="334" height="1" align="center">
         <p align="center"><font size="2"><%=rs("bz1")%> </font>
</td>
         <td width="149" height="1" align="center">
         <p align="center"><font size="2">备注2 </font> </td>
         <td width="340" height="1" colspan="3" align="center">
         <p align="center"><font size="2"><%=rs("bz2")%> </font>
</td>
       </tr>
     </table>
     </center>
  </div>
     </center>
     
 <div align="center">
    <center>
        
  <table cellspacing=0 bgcolor=#FFCCbb height="2" style="border-collapse: collapse" bordercolor="#000000" bordercolorlight="#0000FF" bordercolordark="#0000FF" border="1">

            <tr>
        <td width="40" height="16" align="center"><font size="2">第一学期</font></td>
        <td width="40" height="16" align="center"><font size="2"><%=fsm10%></font></td>
        <td width="40" height="16" align="center"><font size="2"><%=fsm11%></font>　</td>
        <td width="40" height="16" align="center"><font size="2"><%=fsm12%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm13%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm14%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm15%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm16%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm17%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm18%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm19%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm110%></font></td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm111%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm112%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm113%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm114%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm115%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm116%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm117%></font>　</td>
        <td width="46" height="16" align="center"><font size="2"><%=fsm118%></font>　</td>
        <td width="46" height="16" align="center"><font size="2"><%=fsm119%></font>　</td>

        <td width="14" height="16" align="center"><font size="2">总分</font></td>
      </tr>
      <tr>
        <td width="40" height="1" align="center"><font size="2">成绩</font></td>
        <td width="40" height="1" align="center">
                   <%
    if fs10>=60 then
    %>
      <font color="green"><%=fs10%></font>
    <%   
    else
    %>
     <font color="red"><%=fs10%></font>
    <%
    end if
    %> </font> 
        </td>
        <td width="40" height="1" align="center">
                         <%
    if fs11>=60 then
    %>
      <font color="green"><%=fs11%></font>
    <%   
    else
    %>
     <font color="red"><%=fs11%></font>
    <%
    end if
    %> 
    　</td>
        <td width="40" height="1" align="center">
                         <%
    if fs12>=60 then
    %>
      <font color="green"><%=fs12%></font>
    <%   
    else
    %>
     <font color="red"><%=fs12%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs13>=60 then
    %>
      <font color="green"><%=fs13%></font>
    <%   
    else
    %>
     <font color="red"><%=fs13%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs14>=60 then
    %>
      <font color="green"><%=fs14%></font>
    <%   
    else
    %>
     <font color="red"><%=fs14%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs15>=60 then
    %>
      <font color="green"><%=fs15%></font>
    <%   
    else
    %>
     <font color="red"><%=fs15%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs16>=60 then
    %>
      <font color="green"><%=fs16%></font>
    <%   
    else
    %>
     <font color="red"><%=fs16%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs17>=60 then
    %>
      <font color="green"><%=fs17%></font>
    <%   
    else
    %>
     <font color="red"><%=fs17%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                        <%
    if fs18>=60 then
    %>
      <font color="green"><%=fs18%></font>
    <%   
    else
    %>
     <font color="red"><%=fs18%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs19>=60 then
    %>
      <font color="green"><%=fs19%></font>
    <%   
    else
    %>
     <font color="red"><%=fs19%></font>
    <%
    end if
    %> 
    
　</td>
  <td width="45" height="1" align="center">

                 <%
    if fs110>=60 then
    %>
      <font color="green"><%=fs110%></font>
    <%   
    else
    %>
     <font color="red"><%=fs110%></font>
    <%
    end if
    %> </font> 
        </td>
        <td width="45" height="1" align="center">
                         <%
    if fs111>=60 then
    %>
      <font color="green"><%=fs111%></font>
    <%   
    else
    %>
     <font color="red"><%=fs111%></font>
    <%
    end if
    %> 
    　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs112>=60 then
    %>
      <font color="green"><%=fs112%></font>
    <%   
    else
    %>
     <font color="red"><%=fs112%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs113>=60 then
    %>
      <font color="green"><%=fs113%></font>
    <%   
    else
    %>
     <font color="red"><%=fs113%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs114>=60 then
    %>
      <font color="green"><%=fs114%></font>
    <%   
    else
    %>
     <font color="red"><%=fs114%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs115>=60 then
    %>
      <font color="green"><%=fs115%></font>
    <%   
    else
    %>
     <font color="red"><%=fs115%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs116>=60 then
    %>
      <font color="green"><%=fs116%></font>
    <%   
    else
    %>
     <font color="red"><%=fs116%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs117>=60 then
    %>
      <font color="green"><%=fs117%></font>
    <%   
    else
    %>
     <font color="red"><%=fs117%></font>
    <%
    end if
    %> 
　</td>
        <td width="46" height="1" align="center">
                        <%
    if fs118>=60 then
    %>
      <font color="green"><%=fs118%></font>
    <%   
    else
    %>
     <font color="red"><%=fs118%></font>
    <%
    end if
    %> 
　</td>
        <td width="46" height="1" align="center">
                         <%
    if fs119>=60 then
    %>
      <font color="green"><%=fs119%></font>
    <%   
    else
    %>
     <font color="red"><%=fs119%></font>
    <%
    end if
    %> 
    
　</td>

        <td width="14" height="1" align="center"><%=fs10+fs11+fs12+fs13+fs14+fs15+fs16+fs17+fs18+fs19+fs110+fs111+fs112+fs113+fs114+fs115+fs116+fs117+fs118+fs119%>　</td>
      </tr>
      <tr>
        <td width="40" height="16" align="center"><font size="2">第二学期</font></td>
        <td width="40" height="16" align="center"><font size="2"><%=fsm20%></font></td>
        <td width="40" height="16" align="center"><font size="2"><%=fsm21%></font>　</td>
        <td width="40" height="16" align="center"><font size="2"><%=fsm22%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm23%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm24%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm25%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm26%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm27%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm28%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm29%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm120%></font></td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm121%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm122%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm123%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm124%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm125%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm126%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm127%></font>　</td>
        <td width="46" height="16" align="center"><font size="2"><%=fsm128%></font>　</td>
        <td width="46" height="16" align="center"><font size="2"><%=fsm129%></font>　</td>

        <td width="14" height="16" align="center"><font size="2">总分</font></td>
      </tr>
      <tr>
        <td width="40" height="1" align="center"><font size="2">成绩</font></td>
        <td width="40" height="1" align="center">
                   <%
    if fs20>=60 then
    %>
      <font color="green"><%=fs20%></font>
    <%   
    else
    %>
     <font color="red"><%=fs20%></font>
    <%
    end if
    %> 
        </td>
        <td width="40" height="1" align="center">
                         <%
    if fs21>=60 then
    %>
      <font color="green"><%=fs21%></font>
    <%   
    else
    %>
     <font color="red"><%=fs21%></font>
    <%
    end if
    %> 
    　</td>
        <td width="40" height="1" align="center">
                         <%
    if fs22>=60 then
    %>
      <font color="green"><%=fs22%></font>
    <%   
    else
    %>
     <font color="red"><%=fs22%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs23>=60 then
    %>
      <font color="green"><%=fs23%></font>
    <%   
    else
    %>
     <font color="red"><%=fs23%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs24>=60 then
    %>
      <font color="green"><%=fs24%></font>
    <%   
    else
    %>
     <font color="red"><%=fs24%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs25>=60 then
    %>
      <font color="green"><%=fs25%></font>
    <%   
    else
    %>
     <font color="red"><%=fs25%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs26>=60 then
    %>
      <font color="green"><%=fs26%></font>
    <%   
    else
    %>
     <font color="red"><%=fs26%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs27>=60 then
    %>
      <font color="green"><%=fs27%></font>
    <%   
    else
    %>
     <font color="red"><%=fs27%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                        <%
    if fs28>=60 then
    %>
      <font color="green"><%=fs28%></font>
    <%   
    else
    %>
     <font color="red"><%=fs28%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs29>=60 then
    %>
      <font color="green"><%=fs29%></font>
    <%   
    else
    %>
     <font color="red"><%=fs29%></font>
    <%
    end if
    %> 
　</td>
  <td width="45" height="1" align="center">

                 <%
    if fs120>=60 then
    %>
      <font color="green"><%=fs120%></font>
    <%   
    else
    %>
     <font color="red"><%=fs120%></font>
    <%
    end if
    %> 
        </td>
        <td width="45" height="1" align="center">
                         <%
    if fs121>=60 then
    %>
      <font color="green"><%=fs121%></font>
    <%   
    else
    %>
     <font color="red"><%=fs121%></font>
    <%
    end if
    %> 
    　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs122>=60 then
    %>
      <font color="green"><%=fs122%></font>
    <%   
    else
    %>
     <font color="red"><%=fs122%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs123>=60 then
    %>
      <font color="green"><%=fs123%></font>
    <%   
    else
    %>
     <font color="red"><%=fs123%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs124>=60 then
    %>
      <font color="green"><%=fs124%></font>
    <%   
    else
    %>
     <font color="red"><%=fs124%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs125>=60 then
    %>
      <font color="green"><%=fs125%></font>
    <%   
    else
    %>
     <font color="red"><%=fs125%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs126>=60 then
    %>
      <font color="green"><%=fs126%></font>
    <%   
    else
    %>
     <font color="red"><%=fs126%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs127>=60 then
    %>
      <font color="green"><%=fs127%></font>
    <%   
    else
    %>
     <font color="red"><%=fs127%></font>
    <%
    end if
    %> 
　</td>
        <td width="46" height="1" align="center">
                        <%
    if fs128>=60 then
    %>
      <font color="green"><%=fs128%></font>
    <%   
    else
    %>
     <font color="red"><%=fs128%></font>
    <%
    end if
    %> 
　</td>
        <td width="46" height="1" align="center">
                         <%
    if fs129>=60 then
    %>
      <font color="green"><%=fs129%></font>
    <%   
    else
    %>
     <font color="red"><%=fs129%></font>
    <%
    end if
    %> 
　</td>

        <td width="14" height="1" align="center"><%=fs20+fs21+fs22+fs23+fs24+fs25+fs26+fs27+fs28+fs29+fs120+fs121+fs122+fs123+fs124+fs125+fs126+fs127+fs128+fs129%>　</td>
      </tr>
      <tr>
        <td width="40" height="16" align="center"><font size="2">第三学期</font></td>
        <td width="40" height="16" align="center"><font size="2"><%=fsm30%></font></td>
        <td width="40" height="16" align="center"><font size="2"><%=fsm31%></font>　</td>
        <td width="40" height="16" align="center"><font size="2"><%=fsm32%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm33%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm34%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm35%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm36%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm37%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm38%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm39%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm130%></font></td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm131%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm132%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm133%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm134%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm135%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm136%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm137%></font>　</td>
        <td width="46" height="16" align="center"><font size="2"><%=fsm138%></font>　</td>
        <td width="46" height="16" align="center"><font size="2"><%=fsm139%></font>　</td>

        <td width="14" height="16" align="center"><font size="2">总分</font></td>
      </tr>
      <tr>
      <td width="40" height="1" align="center"><font size="2">成绩</font></td>
        <td width="40" height="1" align="center">
                   <%
    if fs30>=60 then
    %>
      <font color="green"><%=fs30%></font>
    <%   
    else
    %>
     <font color="red"><%=fs30%></font>
    <%
    end if
    %> 
        </td>
        <td width="40" height="1" align="center">
                         <%
    if fs31>=60 then
    %>
      <font color="green"><%=fs31%></font>
    <%   
    else
    %>
     <font color="red"><%=fs31%></font>
    <%
    end if
    %> 
    　</td>
        <td width="40" height="1" align="center">
                         <%
    if fs32>=60 then
    %>
      <font color="green"><%=fs32%></font>
    <%   
    else
    %>
     <font color="red"><%=fs32%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs33>=60 then
    %>
      <font color="green"><%=fs33%></font>
    <%   
    else
    %>
     <font color="red"><%=fs33%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs34>=60 then
    %>
      <font color="green"><%=fs34%></font>
    <%   
    else
    %>
     <font color="red"><%=fs34%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs35>=60 then
    %>
      <font color="green"><%=fs35%></font>
    <%   
    else
    %>
     <font color="red"><%=fs35%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs36>=60 then
    %>
      <font color="green"><%=fs36%></font>
    <%   
    else
    %>
     <font color="red"><%=fs36%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs37>=60 then
    %>
      <font color="green"><%=fs37%></font>
    <%   
    else
    %>
     <font color="red"><%=fs37%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                        <%
    if fs38>=60 then
    %>
      <font color="green"><%=fs38%></font>
    <%   
    else
    %>
     <font color="red"><%=fs38%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs39>=60 then
    %>
      <font color="green"><%=fs39%></font>
    <%   
    else
    %>
     <font color="red"><%=fs39%></font>
    <%
    end if
    %> 
　</td>
  <td width="45" height="1" align="center">

              <%
    if fs130>=60 then
    %>
      <font color="green"><%=fs130%></font>
    <%   
    else
    %>
     <font color="red"><%=fs130%></font>
    <%
    end if
    %> 
        </td>
        <td width="45" height="1" align="center">
                         <%
    if fs131>=60 then
    %>
      <font color="green"><%=fs131%></font>
    <%   
    else
    %>
     <font color="red"><%=fs131%></font>
    <%
    end if
    %> 
    　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs132>=60 then
    %>
      <font color="green"><%=fs132%></font>
    <%   
    else
    %>
     <font color="red"><%=fs132%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs133>=60 then
    %>
      <font color="green"><%=fs133%></font>
    <%   
    else
    %>
     <font color="red"><%=fs133%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs134>=60 then
    %>
      <font color="green"><%=fs134%></font>
    <%   
    else
    %>
     <font color="red"><%=fs134%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs135>=60 then
    %>
      <font color="green"><%=fs135%></font>
    <%   
    else
    %>
     <font color="red"><%=fs135%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs136>=60 then
    %>
      <font color="green"><%=fs136%></font>
    <%   
    else
    %>
     <font color="red"><%=fs136%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs137>=60 then
    %>
      <font color="green"><%=fs137%></font>
    <%   
    else
    %>
     <font color="red"><%=fs137%></font>
    <%
    end if
    %> 
　</td>
        <td width="46" height="1" align="center">
                        <%
    if fs138>=60 then
    %>
      <font color="green"><%=fs138%></font>
    <%   
    else
    %>
     <font color="red"><%=fs138%></font>
    <%
    end if
    %> 
　</td>
        <td width="46" height="1" align="center">
                         <%
    if fs139>=60 then
    %>
      <font color="green"><%=fs139%></font>
    <%   
    else
    %>
     <font color="red"><%=fs139%></font>
    <%
    end if
    %> 
　</td>

        <td width="14" height="1" align="center"><%=fs30+fs31+fs32+fs33+fs34+fs35+fs36+fs37+fs38+fs39+fs130+fs131+fs132+fs133+fs134+fs135+fs136+fs137+fs138+fs139%>　</td>
      </tr>
      <tr>
        <td width="40" height="16" align="center"><font size="2">第四学期</font></td>
        <td width="40" height="16" align="center"><font size="2"><%=fsm40%></font></td>
        <td width="40" height="16" align="center"><font size="2"><%=fsm41%></font>　</td>
        <td width="40" height="16" align="center"><font size="2"><%=fsm42%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm43%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm44%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm45%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm46%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm47%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm48%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm49%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm140%></font></td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm141%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm142%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm143%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm144%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm145%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm146%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm147%></font>　</td>
        <td width="46" height="16" align="center"><font size="2"><%=fsm148%></font>　</td>
        <td width="46" height="16" align="center"><font size="2"><%=fsm149%></font>　</td>

        <td width="14" height="16" align="center"><font size="2">总分</font></td>
      </tr>
      <tr>
        <td width="40" height="1" align="center"><font size="2">成绩</font></td>
        <td width="40" height="1" align="center">
                   <%
    if fs40>=60 then
    %>
      <font color="green"><%=fs40%></font>
    <%   
    else
    %>
     <font color="red"><%=fs40%></font>
    <%
    end if
    %> 
        </td>
        <td width="40" height="1" align="center">
                         <%
    if fs41>=60 then
    %>
      <font color="green"><%=fs41%></font>
    <%   
    else
    %>
     <font color="red"><%=fs41%></font>
    <%
    end if
    %> 
    　</td>
        <td width="40" height="1" align="center">
                         <%
    if fs42>=60 then
    %>
      <font color="green"><%=fs42%></font>
    <%   
    else
    %>
     <font color="red"><%=fs42%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs43>=60 then
    %>
      <font color="green"><%=fs43%></font>
    <%   
    else
    %>
     <font color="red"><%=fs43%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs44>=60 then
    %>
      <font color="green"><%=fs44%></font>
    <%   
    else
    %>
     <font color="red"><%=fs44%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs45>=60 then
    %>
      <font color="green"><%=fs45%></font>
    <%   
    else
    %>
     <font color="red"><%=fs45%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs46>=60 then
    %>
      <font color="green"><%=fs46%></font>
    <%   
    else
    %>
     <font color="red"><%=fs46%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs47>=60 then
    %>
      <font color="green"><%=fs47%></font>
    <%   
    else
    %>
     <font color="red"><%=fs47%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                        <%
    if fs48>=60 then
    %>
      <font color="green"><%=fs48%></font>
    <%   
    else
    %>
     <font color="red"><%=fs48%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs49>=60 then
    %>
      <font color="green"><%=fs49%></font>
    <%   
    else
    %>
     <font color="red"><%=fs49%></font>
    <%
    end if
    %> 
　</td>
  <td width="45" height="1" align="center">
                   <%
    if fs140>=60 then
    %>
      <font color="green"><%=fs140%></font>
    <%   
    else
    %>
     <font color="red"><%=fs140%></font>
    <%
    end if
    %> 
        </td>
        <td width="45" height="1" align="center">
                         <%
    if fs141>=60 then
    %>
      <font color="green"><%=fs141%></font>
    <%   
    else
    %>
     <font color="red"><%=fs141%></font>
    <%
    end if
    %> 
    　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs142>=60 then
    %>
      <font color="green"><%=fs142%></font>
    <%   
    else
    %>
     <font color="red"><%=fs142%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs143>=60 then
    %>
      <font color="green"><%=fs143%></font>
    <%   
    else
    %>
     <font color="red"><%=fs143%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs144>=60 then
    %>
      <font color="green"><%=fs144%></font>
    <%   
    else
    %>
     <font color="red"><%=fs144%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs145>=60 then
    %>
      <font color="green"><%=fs145%></font>
    <%   
    else
    %>
     <font color="red"><%=fs145%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs146>=60 then
    %>
      <font color="green"><%=fs146%></font>
    <%   
    else
    %>
     <font color="red"><%=fs146%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs147>=60 then
    %>
      <font color="green"><%=fs147%></font>
    <%   
    else
    %>
     <font color="red"><%=fs147%></font>
    <%
    end if
    %> 
　</td>
        <td width="46" height="1" align="center">
                        <%
    if fs148>=60 then
    %>
      <font color="green"><%=fs148%></font>
    <%   
    else
    %>
     <font color="red"><%=fs148%></font>
    <%
    end if
    %> 
　</td>
        <td width="46" height="1" align="center">
                         <%
    if fs149>=60 then
    %>
      <font color="green"><%=fs149%></font>
    <%   
    else
    %>
     <font color="red"><%=fs149%></font>
    <%
    end if
    %> 
　</td>

        <td width="14" height="1" align="center"><%=fs40+fs41+fs42+fs43+fs44+fs45+fs46+fs47+fs48+fs49+fs140+fs141+fs142+fs143+fs144+fs145+fs146+fs147+fs148+fs149%>　</td>
      </tr>
      <tr>
        <td width="40" height="1" align="center"><font size="2">第五学期</font></td>
        <td width="40" height="16" align="center"><font size="2"><%=fsm50%></font></td>
        <td width="40" height="16" align="center"><font size="2"><%=fsm51%></font>　</td>
        <td width="40" height="16" align="center"><font size="2"><%=fsm52%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm53%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm54%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm55%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm56%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm57%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm58%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm59%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm150%></font></td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm151%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm152%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm153%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm154%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm155%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm156%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm157%></font>　</td>
        <td width="46" height="16" align="center"><font size="2"><%=fsm158%></font>　</td>
        <td width="46" height="16" align="center"><font size="2"><%=fsm159%></font>　</td>

        <td width="14" height="1" align="center"><font size="2">总分</font></td>
      </tr>
      <tr>
        <td width="40" height="1" align="center"><font size="2">成绩</font></td>
        <td width="40" height="1" align="center">
                   <%
    if fs50>=60 then
    %>
      <font color="green"><%=fs50%></font>
    <%   
    else
    %>
     <font color="red"><%=fs50%></font>
    <%
    end if
    %> 
        </td>
        <td width="40" height="1" align="center">
                         <%
    if fs51>=60 then
    %>
      <font color="green"><%=fs51%></font>
    <%   
    else
    %>
     <font color="red"><%=fs51%></font>
    <%
    end if
    %> 
    　</td>
        <td width="40" height="1" align="center">
                         <%
    if fs52>=60 then
    %>
      <font color="green"><%=fs52%></font>
    <%   
    else
    %>
     <font color="red"><%=fs52%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs53>=60 then
    %>
      <font color="green"><%=fs53%></font>
    <%   
    else
    %>
     <font color="red"><%=fs53%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs54>=60 then
    %>
      <font color="green"><%=fs54%></font>
    <%   
    else
    %>
     <font color="red"><%=fs54%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs55>=60 then
    %>
      <font color="green"><%=fs55%></font>
    <%   
    else
    %>
     <font color="red"><%=fs55%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs56>=60 then
    %>
      <font color="green"><%=fs56%></font>
    <%   
    else
    %>
     <font color="red"><%=fs56%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs57>=60 then
    %>
      <font color="green"><%=fs57%></font>
    <%   
    else
    %>
     <font color="red"><%=fs57%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                        <%
    if fs58>=60 then
    %>
      <font color="green"><%=fs58%></font>
    <%   
    else
    %>
     <font color="red"><%=fs58%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs59>=60 then
    %>
      <font color="green"><%=fs59%></font>
    <%   
    else
    %>
     <font color="red"><%=fs59%></font>
    <%
    end if
    %> 
　</td>
 <td width="45" height="1" align="center">
                   <%
    if fs150>=60 then
    %>
      <font color="green"><%=fs150%></font>
    <%   
    else
    %>
     <font color="red"><%=fs150%></font>
    <%
    end if
    %> 
        </td>
        <td width="45" height="1" align="center">
                         <%
    if fs151>=60 then
    %>
      <font color="green"><%=fs151%></font>
    <%   
    else
    %>
     <font color="red"><%=fs151%></font>
    <%
    end if
    %> 
    　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs152>=60 then
    %>
      <font color="green"><%=fs152%></font>
    <%   
    else
    %>
     <font color="red"><%=fs152%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs153>=60 then
    %>
      <font color="green"><%=fs153%></font>
    <%   
    else
    %>
     <font color="red"><%=fs153%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs154>=60 then
    %>
      <font color="green"><%=fs154%></font>
    <%   
    else
    %>
     <font color="red"><%=fs154%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs155>=60 then
    %>
      <font color="green"><%=fs155%></font>
    <%   
    else
    %>
     <font color="red"><%=fs155%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs156>=60 then
    %>
      <font color="green"><%=fs156%></font>
    <%   
    else
    %>
     <font color="red"><%=fs156%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs157>=60 then
    %>
      <font color="green"><%=fs157%></font>
    <%   
    else
    %>
     <font color="red"><%=fs157%></font>
    <%
    end if
    %> 
　</td>
        <td width="46" height="1" align="center">
                        <%
    if fs158>=60 then
    %>
      <font color="green"><%=fs158%></font>
    <%   
    else
    %>
     <font color="red"><%=fs158%></font>
    <%
    end if
    %> 
　</td>
        <td width="46" height="1" align="center">
                         <%
    if fs159>=60 then
    %>
      <font color="green"><%=fs159%></font>
    <%   
    else
    %>
     <font color="red"><%=fs159%></font>
    <%
    end if
    %> 
　</td>

        <td width="14" height="1" align="center"><%=fs50+fs51+fs52+fs53+fs54+fs55+fs56+fs57+fs58+fs59+fs150+fs151+fs152+fs153+fs154+fs155+fs156+fs157+fs158+fs159%>　</td>
      </tr>
      <tr>
        <td width="40" height="16" align="center"><font size="2">第六学期</font></td>
        <td width="40" height="16" align="center"><font size="2"><%=fsm60%></font></td>
        <td width="40" height="16" align="center"><font size="2"><%=fsm61%></font>　</td>
        <td width="40" height="16" align="center"><font size="2"><%=fsm62%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm63%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm64%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm65%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm66%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm67%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm68%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm69%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm160%></font> </td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm161%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm162%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm163%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm164%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm165%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm166%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm167%></font>　</td>
        <td width="46" height="16" align="center"><font size="2"><%=fsm168%></font>　</td>
        <td width="46" height="16" align="center"><font size="2"><%=fsm169%></font>　</td>
        <td width="14" height="16" align="center"><font size="2">总分</font></td>
      </tr>
      <tr>
        <td width="40" height="1" align="center"><font size="2">成绩</font></td>
        <td width="40" height="1" align="center">
                   <%
    if fs60>=60 then
    %>
      <font color="green"><%=fs60%></font>
    <%   
    else
    %>
     <font color="red"><%=fs60%></font>
    <%
    end if
    %> 
        </td>
        <td width="40" height="1" align="center">
                         <%
    if fs61>=60 then
    %>
      <font color="green"><%=fs61%></font>
    <%   
    else
    %>
     <font color="red"><%=fs61%></font>
    <%
    end if
    %> 
    　</td>
        <td width="40" height="1" align="center">
                         <%
    if fs62>=60 then
    %>
      <font color="green"><%=fs62%></font>
    <%   
    else
    %>
     <font color="red"><%=fs62%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs63>=60 then
    %>
      <font color="green"><%=fs63%></font>
    <%   
    else
    %>
     <font color="red"><%=fs63%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs64>=60 then
    %>
      <font color="green"><%=fs64%></font>
    <%   
    else
    %>
     <font color="red"><%=fs64%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs65>=60 then
    %>
      <font color="green"><%=fs65%></font>
    <%   
    else
    %>
     <font color="red"><%=fs65%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs66>=60 then
    %>
      <font color="green"><%=fs66%></font>
    <%   
    else
    %>
     <font color="red"><%=fs66%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs67>=60 then
    %>
      <font color="green"><%=fs67%></font>
    <%   
    else
    %>
     <font color="red"><%=fs67%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                        <%
    if fs68>=60 then
    %>
      <font color="green"><%=fs68%></font>
    <%   
    else
    %>
     <font color="red"><%=fs68%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs69>=60 then
    %>
      <font color="green"><%=fs69%></font>
    <%   
    else
    %>
     <font color="red"><%=fs69%></font>
    <%
    end if
    %> 
　</td>
<td width="45" height="1" align="center">
                   <%
    if fs160>=60 then
    %>
      <font color="green"><%=fs160%></font>
    <%   
    else
    %>
     <font color="red"><%=fs160%></font>
    <%
    end if
    %> 
        </td>
        <td width="45" height="1" align="center">
                         <%
    if fs161>=60 then
    %>
      <font color="green"><%=fs161%></font>
    <%   
    else
    %>
     <font color="red"><%=fs161%></font>
    <%
    end if
    %> 
    　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs162>=60 then
    %>
      <font color="green"><%=fs162%></font>
    <%   
    else
    %>
     <font color="red"><%=fs162%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs163>=60 then
    %>
      <font color="green"><%=fs163%></font>
    <%   
    else
    %>
     <font color="red"><%=fs163%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs164>=60 then
    %>
      <font color="green"><%=fs164%></font>
    <%   
    else
    %>
     <font color="red"><%=fs164%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs165>=60 then
    %>
      <font color="green"><%=fs165%></font>
    <%   
    else
    %>
     <font color="red"><%=fs165%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs166>=60 then
    %>
      <font color="green"><%=fs166%></font>
    <%   
    else
    %>
     <font color="red"><%=fs166%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs167>=60 then
    %>
      <font color="green"><%=fs167%></font>
    <%   
    else
    %>
     <font color="red"><%=fs167%></font>
    <%
    end if
    %> 
　</td>
        <td width="46" height="1" align="center">
                        <%
    if fs168>=60 then
    %>
      <font color="green"><%=fs168%></font>
    <%   
    else
    %>
     <font color="red"><%=fs168%></font>
    <%
    end if
    %> 
　</td>
        <td width="46" height="1" align="center">
                         <%
    if fs169>=60 then
    %>
      <font color="green"><%=fs169%></font>
    <%   
    else
    %>
     <font color="red"><%=fs169%></font>
    <%
    end if
    %> 
　</td>

        <td width="14" height="1" align="center"><%=fs60+fs61+fs62+fs63+fs64+fs65+fs66+fs67+fs68+fs69+fs160+fs161+fs162+fs163+fs164+fs165+fs166+fs167+fs168+fs169%>　</td>
      </tr>
      <tr>
        <td width="40" height="16" align="center"><font size="2">第七学期</font></td>
        <td width="40" height="16" align="center"><font size="2"><%=fsm70%></font></td>
        <td width="40" height="16" align="center"><font size="2"><%=fsm71%></font>　</td>
        <td width="40" height="16" align="center"><font size="2"><%=fsm72%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm73%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm74%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm75%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm76%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm77%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm78%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm79%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm170%></font></td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm171%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm172%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm173%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm174%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm175%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm176%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm177%></font>　</td>
        <td width="46" height="16" align="center"><font size="2"><%=fsm178%></font>　</td>
        <td width="46" height="16" align="center"><font size="2"><%=fsm179%></font>　</td>
        <td width="14" height="16" align="center"><font size="2">总分</font></td>
      </tr>
      <tr>
       <td width="40" height="1" align="center"><font size="2">成绩</font></td>
        <td width="40" height="1" align="center">
                   <%
    if fs70>=60 then
    %>
      <font color="green"><%=fs70%></font>
    <%   
    else
    %>
     <font color="red"><%=fs70%></font>
    <%
    end if
    %> 
        </td>
        <td width="40" height="1" align="center">
                         <%
    if fs71>=60 then
    %>
      <font color="green"><%=fs71%></font>
    <%   
    else
    %>
     <font color="red"><%=fs71%></font>
    <%
    end if
    %> 
    　</td>
        <td width="40" height="1" align="center">
                         <%
    if fs72>=60 then
    %>
      <font color="green"><%=fs72%></font>
    <%   
    else
    %>
     <font color="red"><%=fs72%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs73>=60 then
    %>
      <font color="green"><%=fs73%></font>
    <%   
    else
    %>
     <font color="red"><%=fs73%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs74>=60 then
    %>
      <font color="green"><%=fs74%></font>
    <%   
    else
    %>
     <font color="red"><%=fs74%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs75>=60 then
    %>
      <font color="green"><%=fs75%></font>
    <%   
    else
    %>
     <font color="red"><%=fs75%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs76>=60 then
    %>
      <font color="green"><%=fs76%></font>
    <%   
    else
    %>
     <font color="red"><%=fs76%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs77>=60 then
    %>
      <font color="green"><%=fs77%></font>
    <%   
    else
    %>
     <font color="red"><%=fs77%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                        <%
    if fs78>=60 then
    %>
      <font color="green"><%=fs78%></font>
    <%   
    else
    %>
     <font color="red"><%=fs78%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs79>=60 then
    %>
      <font color="green"><%=fs79%></font>
    <%   
    else
    %>
     <font color="red"><%=fs79%></font>
    <%
    end if
    %> 
　</td>
    <td width="45" height="1" align="center">
                   <%
    if fs170>=60 then
    %>
      <font color="green"><%=fs170%></font>
    <%   
    else
    %>
     <font color="red"><%=fs170%></font>
    <%
    end if
    %> 
        </td>
        <td width="45" height="1" align="center">
                         <%
    if fs171>=60 then
    %>
      <font color="green"><%=fs171%></font>
    <%   
    else
    %>
     <font color="red"><%=fs171%></font>
    <%
    end if
    %> 
    　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs172>=60 then
    %>
      <font color="green"><%=fs172%></font>
    <%   
    else
    %>
     <font color="red"><%=fs172%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs173>=60 then
    %>
      <font color="green"><%=fs173%></font>
    <%   
    else
    %>
     <font color="red"><%=fs173%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs174>=60 then
    %>
      <font color="green"><%=fs174%></font>
    <%   
    else
    %>
     <font color="red"><%=fs174%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs175>=60 then
    %>
      <font color="green"><%=fs175%></font>
    <%   
    else
    %>
     <font color="red"><%=fs175%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs176>=60 then
    %>
      <font color="green"><%=fs176%></font>
    <%   
    else
    %>
     <font color="red"><%=fs176%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="1" align="center">
                         <%
    if fs177>=60 then
    %>
      <font color="green"><%=fs177%></font>
    <%   
    else
    %>
     <font color="red"><%=fs177%></font>
    <%
    end if
    %> 
　</td>
        <td width="46" height="1" align="center">
                        <%
    if fs178>=60 then
    %>
      <font color="green"><%=fs178%></font>
    <%   
    else
    %>
     <font color="red"><%=fs178%></font>
    <%
    end if
    %> 
　</td>
        <td width="46" height="1" align="center">
                         <%
    if fs179>=60 then
    %>
      <font color="green"><%=fs179%></font>
    <%   
    else
    %>
     <font color="red"><%=fs179%></font>
    <%
    end if
    %> 
　</td>

        <td width="14" height="1" align="center"><%=fs70+fs71+fs72+fs73+fs74+fs75+fs76+fs77+fs78+fs79+fs170+fs171+fs172+fs173+fs174+fs175+fs176+fs177+fs178+fs179%>　</td>
      </tr>
      <tr>
        <td width="40" height="16" align="center"><font size="2">第八学期</font></td>
        <td width="40" height="16" align="center"><font size="2"><%=fsm80%></font></td>
        <td width="40" height="16" align="center"><font size="2"><%=fsm81%></font>　</td>
        <td width="40" height="16" align="center"><font size="2"><%=fsm82%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm83%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm84%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm85%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm86%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm87%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm88%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm89%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm180%></font></td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm181%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm182%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm183%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm184%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm185%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm186%></font>　</td>
        <td width="45" height="16" align="center"><font size="2"><%=fsm187%></font>　</td>
        <td width="46" height="16" align="center"><font size="2"><%=fsm188%></font>　</td>
        <td width="46" height="16" align="center"><font size="2"><%=fsm189%></font>　</td>
        <td width="14" height="16" align="center"><font size="2">总分</font></td>
      </tr>
     
      <tr>
       <td width="40" height="2" align="center"><font size="2">成绩</font></td>
        <td width="40" height="2" align="center">
                   <%
    if fs80>=60 then
    %>
      <font color="green"><%=fs80%></font>
    <%   
    else
    %>
     <font color="red"><%=fs80%></font>
    <%
    end if
    %> 
        </td>
        <td width="40" height="2" align="center">
                         <%
    if fs81>=60 then
    %>
      <font color="green"><%=fs81%></font>
    <%   
    else
    %>
     <font color="red"><%=fs81%></font>
    <%
    end if
    %> 
    　</td>
        <td width="40" height="2" align="center">
                         <%
    if fs82>=60 then
    %>
      <font color="green"><%=fs82%></font>
    <%   
    else
    %>
     <font color="red"><%=fs82%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="2" align="center">
                         <%
    if fs83>=60 then
    %>
      <font color="green"><%=fs83%></font>
    <%   
    else
    %>
     <font color="red"><%=fs83%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="2" align="center">
                         <%
    if fs84>=60 then
    %>
      <font color="green"><%=fs84%></font>
    <%   
    else
    %>
     <font color="red"><%=fs84%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="2" align="center">
                         <%
    if fs85>=60 then
    %>
      <font color="green"><%=fs85%></font>
    <%   
    else
    %>
     <font color="red"><%=fs85%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="2" align="center">
                         <%
    if fs86>=60 then
    %>
      <font color="green"><%=fs86%></font>
    <%   
    else
    %>
     <font color="red"><%=fs86%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="2" align="center">
                         <%
    if fs87>=60 then
    %>
      <font color="green"><%=fs87%></font>
    <%   
    else
    %>
     <font color="red"><%=fs87%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="2" align="center">
                        <%
    if fs88>=60 then
    %>
      <font color="green"><%=fs88%></font>
    <%   
    else
    %>
     <font color="red"><%=fs88%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="2" align="center">
                         <%
    if fs89>=60 then
    %>
      <font color="green"><%=fs89%></font>
    <%   
    else
    %>
     <font color="red"><%=fs89%></font>
    <%
    end if
    %> 
　</td>
  <td width="45" height="2" align="center">
                   <%
    if fs180>=60 then
    %>
      <font color="green"><%=fs180%></font>
    <%   
    else
    %>
     <font color="red"><%=fs180%></font>
    <%
    end if
    %> 
        </td>
        <td width="45" height="2" align="center">
                         <%
    if fs181>=60 then
    %>
      <font color="green"><%=fs181%></font>
    <%   
    else
    %>
     <font color="red"><%=fs181%></font>
    <%
    end if
    %> 
    　</td>
        <td width="45" height="2" align="center">
                         <%
    if fs182>=60 then
    %>
      <font color="green"><%=fs182%></font>
    <%   
    else
    %>
     <font color="red"><%=fs182%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="2" align="center">
                         <%
    if fs183>=60 then
    %>
      <font color="green"><%=fs183%></font>
    <%   
    else
    %>
     <font color="red"><%=fs183%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="2" align="center">
                         <%
    if fs184>=60 then
    %>
      <font color="green"><%=fs184%></font>
    <%   
    else
    %>
     <font color="red"><%=fs184%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="2" align="center">
                         <%
    if fs185>=60 then
    %>
      <font color="green"><%=fs185%></font>
    <%   
    else
    %>
     <font color="red"><%=fs185%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="2" align="center">
                         <%
    if fs186>=60 then
    %>
      <font color="green"><%=fs186%></font>
    <%   
    else
    %>
     <font color="red"><%=fs186%></font>
    <%
    end if
    %> 
　</td>
        <td width="45" height="2" align="center">
                         <%
    if fs187>=60 then
    %>
      <font color="green"><%=fs187%></font>
    <%   
    else
    %>
     <font color="red"><%=fs187%></font>
    <%
    end if
    %> 
　</td>
        <td width="46" height="2" align="center">
                        <%
    if fs188>=60 then
    %>
      <font color="green"><%=fs188%></font>
    <%   
    else
    %>
     <font color="red"><%=fs188%></font>
    <%
    end if
    %> 
　</td>
        <td width="46" height="2" align="center">
                         <%
    if fs189>=60 then
    %>
      <font color="green"><%=fs189%></font>
    <%   
    else
    %>
     <font color="red"><%=fs189%></font>
    <%
    end if
    %> 
　</td>

        <td width="14" height="2" align="center"><%=fs80+fs81+fs82+fs83+fs84+fs85+fs86+fs87+fs88+fs89+fs180+fs181+fs182+fs183+fs184+fs185+fs186+fs187+fs188+fs189%>　</td>
      </tr>
      
     <tr>
       <td width="157" height="2" align="center" colspan="4" bgcolor="#66FFCC">
         <p align="center"><font size="2">班主任</font></td>
        <td width="333" height="2" align="center" colspan="7" bgcolor="#66FFCC">
                         　<%=rs1("byxf")%></td>
        <td width="189" height="2" align="center" colspan="4" bgcolor="#66FFCC">
                         <font size="2">总分和</font></td>
        <td width="304" height="2" align="center" colspan="7" bgcolor="#66FFCC">
        <%
        d1bf=fs10+fs11+fs12+fs13+fs14+fs15+fs16+fs17+fs18+fs19+fs20+fs21+fs22+fs23+fs24+fs25+fs26+fs27+fs28+fs29+fs30+fs31+fs32+fs33+fs34+fs35+fs36+fs37+fs38+fs39+fs40+fs41+fs42+fs43+fs44+fs45+fs46+fs47+fs48+fs49+fs50+fs51+fs52+fs53+fs54+fs55+fs56+fs57+fs58+fs59+fs60+fs61+fs62+fs63+fs64+fs65+fs66+fs67+fs68+fs69+fs70+fs71+fs72+fs73+fs74+fs75+fs76+fs77+fs78+fs79+fs80+fs81+fs82+fs83+fs84+fs85+fs86+fs87+fs88+fs89
        d2bf=fs110+fs111+fs112+fs113+fs114+fs115+fs116+fs117+fs118+fs119+fs120+fs121+fs122+fs123+fs124+fs125+fs126+fs127+fs128+fs129+fs130+fs131+fs132+fs133+fs134+fs135+fs136+fs137+fs138+fs139+fs140+fs141+fs142+fs143+fs144+fs145+fs146+fs147+fs148+fs149+fs150+fs151+fs152+fs153+fs154+fs155+fs156+fs157+fs158+fs159+fs160+fs161+fs162+fs163+fs164+fs165+fs166+fs167+fs168+fs169+fs170+fs171+fs172+fs173+fs174+fs175+fs176+fs177+fs178+fs179+fs180+fs181+fs182+fs183+fs184+fs185+fs186+fs187+fs188+fs189
              %>         
<%=d1bf+d2bf%>
                        </td>
      </tr>  
      
      
      
      
      </table>
    </center>
  </div>
<center>

 <form> 
<INPUT TYPE="BUTTON" NAME="close" value="关闭这个窗口" onClick="closeclk()">
</FORM>
</center>






 </body>
</html>