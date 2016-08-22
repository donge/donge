<!--#include file="conn.asp"-->
<%
 xh=request("xh")
 zybj=request("zybj")
key = request("key")
topic=request("topic")

 
   dim rs,rs1
 dim sql,sql1
  set rs=server.createobject("adodb.recordset")
  set rs1=server.createobject("adodb.recordset")

 sql="select * from cxb where xh='" + xh + "'"
 sql1="select * from zybjmc where zybj='" + zybj + "'"

 rs.open sql,conn,3,3
 rs1.open sql1,conn,3,3
 
xsmm=rs("xsmm")
 
 
 
 
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
  <title>修改</title>
 </head>
 <body topmargin=0 leftmargin=0 rightmargin=0 bgcolor="#fef4d9">
    <center>
  <font face="华文行楷" size="6" color="#FF0000">修改学生信息</font><br>  
  <IMG SRC="showimg.asp?xh=<%=xh%>" height='160' width='140'></a>
　　 <form name="mainForm" enctype="multipart/form-data" 

action="upload1.asp?xh=<%=xh%>&zybj=<%=zybj%>&key=<%=key%>&topic=<%=topic%>" method=post>
请选择将要重传的相片（最好使用jpg格式160*140象素）<br>
<input type=file name=mefile size="50"><p> 

　　 <input type=submit name=ok value="上传">点击上传后，下面本次修改的内容将被还原！
　　 </form> 

  <form action=xgxs.asp?key=<%=key%>&topic=<%=topic%> method=post>
   <table width=552 cellpadding=4 cellspacing=1 bgcolor=#ff0000 align=center height="1">
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="1">学号  
      <td height="1" width="433"><input type=text name="xh" size=20 maxlength=20 class=i value="<%=rs("xh")%>"><font size="2" color="green">不要更改，</font><font size="2"><font color=#009933>否则可能修改无效</font>或<font color="#009933">修改其它记录</font></font><tr bgcolor=#FFcccc>
    <td align=center width=100 height="1">姓名
     <td height="1" width="433"><input type=text name="xm" size=10 maxlength=10 class=i value="<%=rs("xm")%>">&nbsp;<font size="2">&nbsp;5个汉字以内 
     </font>　　　　　　　　　<a href=sc.asp?xh=<%=xh%>><font color="red"><kbd>点击删除</kbd></font></a><kbd>此记录</kbd>
     
     <tr bgcolor=#FFcccc>
    <td align=center width=100 height="11">性别
    <%
    xb=rs("xb")
    if xb="男" then
    %>
        <td height="11" width="433"><input type=radio name="xb" value="男" checked>男生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name="xb" value="女">女生
    <%   
    else
    %>
        <td height="11" width="433"><input type=radio name="xb" value="男">男生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name="xb" value="女" checked>女生
    <%
    end if
    %>
           
     <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">部门或专业
        <td height="19" width="432"><input type=text name="s" size=20 maxlength=20 class=i value="<%=rs("s")%>"><font size="2">*&nbsp;最多10个汉字</font>
  
    <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">专业班级
        <td height="19" width="432"><input type=text name="zybj" size=30 maxlength=30 class=i value="<%=rs("zybj")%>"><font size="2">*&nbsp;最多15个汉字</font>
  
      
   
   
   
    
    <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">密码
        <td height="19" width="432"><input type=text name="xsmm" size=20 maxlength=20 class=i value="<%=rs("xsmm")%>"><font size="2">&nbsp;&nbsp;最多20个字符</font>
  
<tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">家庭住址
    <td height="19" width="433"><input type=text name="jtdz" size=40 maxlength=40 class=i value="<%=rs("jtdz")%>">&nbsp;&nbsp;<font size="2">25个汉字以内</font>
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="1">联系电话
    <td height="1" width="433"><input type=text name="lxdh" size=20 maxlength=20 class=i value="<%=rs("lxdh")%>">&nbsp;&nbsp;<font size="2">最多20个字符 
    </font>
    

       
     <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">政治面貌
        <td height="19" width="432"><input type=text name="zzmm" size=20 maxlength=20 class=i value="<%=rs("zzmm")%>">&nbsp;&nbsp;<font size="2">最多10个汉字</font>
  
    <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">毕业证书号
        <td height="19" width="432"><input type=text name="byzs" size=30 maxlength=30 class=i value="<%=rs("byzs")%>">&nbsp;&nbsp;<font size="2">最多30个字符</font>
    
   
    
    <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">出生日期
        <td height="19" width="432"><input type=text name="csrq" size=10 maxlength=10 class=i value="<%=rs("csrq")%>">&nbsp;&nbsp;<font size="2">格式：99-01-02或1999-01-02</font>
  
<tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">入学时间
    <td height="19" width="433"><input type=text name="rxsj" size=10 maxlength=10 class=i value="<%=rs("rxsj")%>">&nbsp;&nbsp;<font size="2">格式：99-01-02或1999-01-02</font>
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="1">毕业时间
    <td height="1" width="433"><input type=text name="bysj" size=10 maxlength=10 class=i value="<%=rs("bysj")%>">&nbsp;&nbsp;<font size="2">格式：99-01-02或1999-01-02 
    </font>
    
<tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">籍贯
        <td height="19" width="432"><input type=text name="jg" size=30 maxlength=30 class=i value="<%=rs("jg")%>">&nbsp;&nbsp;<font size="2">最多15个汉字</font>
    
   
    
    <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">学位
        <td height="19" width="432"><input type=text name="sw" size=20 maxlength=20 class=i value="<%=rs("sw")%>">&nbsp;&nbsp;<font size="2">最多10个汉字</font>
  
<tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">奖励
    <td height="19" width="433"><input type=text name="jl" size=60 maxlength=255 class=i value="<%=rs("jl")%>">&nbsp;&nbsp;<font size="2"><br>110个汉字以内</font>
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="1">处分
    <td height="1" width="433"><input type=text name="cf" size=60 maxlength=255 class=i value="<%=rs("cf")%>">&nbsp;&nbsp;<font size="2"><br>110个汉字以内</font>


   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">备注1
    <td height="19" width="433"><input type=text name="bz1" size=30 maxlength=30 class=i value="<%=rs("bz1")%>">&nbsp;&nbsp;<font size="2">15个汉字以内</font>
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="1">备注2
    <td height="1" width="433"><input type=text name="bz2" size=30 maxlength=30 class=i value="<%=rs("bz2")%>">&nbsp;&nbsp;<font size="2">15个汉字以内 
    </font>
    
           
  </table>

    





    <center>
        
  <table width="100%" cellspacing=0 bgcolor=#FFCCbb height="2" style="border-collapse: collapse" bordercolor="#000000" bordercolorlight="blue" bordercolordark="blue" border="1">

            <tr>
        <td width="5%" height="16" align="center"><font size="2">一学期</font></td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm10%></font></td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm11%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm12%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm13%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm14%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm15%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm16%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm17%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm18%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm19%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm110%></font></td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm111%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm112%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm113%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm114%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm115%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm116%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm117%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm118%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm119%></font>　</td>

        <td width="5%" height="16" align="center"><font size="2">总分</font></td>
      </tr>
      <tr>
        <td width="5%" height="1" align="center"><font size="2">成绩</font></td>
        
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs10" size=4 maxlength=4 class=i value="<%=rs("fs10")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs11" size=4 maxlength=4 class=i value="<%=rs("fs11")%>">  </font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs12" size=4 maxlength=4 class=i value="<%=rs("fs12")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs13" size=4 maxlength=4 class=i value="<%=rs("fs13")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs14" size=4 maxlength=4 class=i value="<%=rs("fs14")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs15" size=4 maxlength=4 class=i value="<%=rs("fs15")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs16" size=4 maxlength=4 class=i value="<%=rs("fs16")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs17" size=4 maxlength=4 class=i value="<%=rs("fs17")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs18" size=4 maxlength=4 class=i value="<%=rs("fs18")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs19" size=4 maxlength=4 class=i value="<%=rs("fs19")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs110" size=4 maxlength=4 class=i value="<%=rs("fs110")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs111" size=4 maxlength=4 class=i value="<%=rs("fs111")%>">  </font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs112" size=4 maxlength=4 class=i value="<%=rs("fs112")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs113" size=4 maxlength=4 class=i value="<%=rs("fs113")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs114" size=4 maxlength=4 class=i value="<%=rs("fs114")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs115" size=4 maxlength=4 class=i value="<%=rs("fs115")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs116" size=4 maxlength=4 class=i value="<%=rs("fs116")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs117" size=4 maxlength=4 class=i value="<%=rs("fs117")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs118" size=4 maxlength=4 class=i value="<%=rs("fs118")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs119" size=4 maxlength=4 class=i value="<%=rs("fs119")%>">　</font></td>


      <td width="5%" height="1" align="center"><%=fs10+fs11+fs12+fs13+fs14+fs15+fs16+fs17+fs18+fs19+fs110+fs111+fs112+fs113+fs114+fs115+fs116+fs117+fs118+fs119%>　</td>
      </tr>
      <tr>
        <td width="5%" height="16" align="center"><font size="2">二学期</font></td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm20%></font></td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm21%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm22%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm23%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm24%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm25%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm26%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm27%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm28%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm29%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm120%></font></td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm121%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm122%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm123%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm124%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm125%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm126%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm127%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm128%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm129%></font>　</td>

        <td width="5%" height="16" align="center"><font size="2">总分</font></td>
      </tr>
      <tr>
        <td width="5%" height="1" align="center"><font size="2">成绩</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs20" size=4 maxlength=4 class=i value="<%=rs("fs20")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs21" size=4 maxlength=4 class=i value="<%=rs("fs21")%>">  </font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs22" size=4 maxlength=4 class=i value="<%=rs("fs22")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs23" size=4 maxlength=4 class=i value="<%=rs("fs23")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs24" size=4 maxlength=4 class=i value="<%=rs("fs24")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs25" size=4 maxlength=4 class=i value="<%=rs("fs25")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs26" size=4 maxlength=4 class=i value="<%=rs("fs26")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs27" size=4 maxlength=4 class=i value="<%=rs("fs27")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs28" size=4 maxlength=4 class=i value="<%=rs("fs28")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs29" size=4 maxlength=4 class=i value="<%=rs("fs29")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs120" size=4 maxlength=4 class=i value="<%=rs("fs120")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs121" size=4 maxlength=4 class=i value="<%=rs("fs121")%>">  </font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs122" size=4 maxlength=4 class=i value="<%=rs("fs122")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs123" size=4 maxlength=4 class=i value="<%=rs("fs123")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs124" size=4 maxlength=4 class=i value="<%=rs("fs124")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs125" size=4 maxlength=4 class=i value="<%=rs("fs125")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs126" size=4 maxlength=4 class=i value="<%=rs("fs126")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs127" size=4 maxlength=4 class=i value="<%=rs("fs127")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs128" size=4 maxlength=4 class=i value="<%=rs("fs128")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs129" size=4 maxlength=4 class=i value="<%=rs("fs129")%>">　</font></td>

        <td width="5%" height="1" align="center"><%=fs20+fs21+fs22+fs23+fs24+fs25+fs26+fs27+fs28+fs29+fs120+fs121+fs122+fs123+fs124+fs125+fs126+fs127+fs128+fs129%>　</td>
      </tr>
      <tr>
        <td width="5%" height="16" align="center"><font size="2">三学期</font></td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm30%></font></td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm31%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm32%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm33%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm34%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm35%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm36%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm37%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm38%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm39%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm130%></font></td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm131%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm132%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm133%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm134%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm135%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm136%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm137%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm138%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm139%></font>　</td>

        <td width="5%" height="16" align="center"><font size="2">总分</font></td>
      </tr>
      <tr>
      <td width="5%" height="1" align="center"><font size="2">成绩</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs30" size=4 maxlength=4 class=i value="<%=rs("fs30")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs31" size=4 maxlength=4 class=i value="<%=rs("fs31")%>">  </font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs32" size=4 maxlength=4 class=i value="<%=rs("fs32")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs33" size=4 maxlength=4 class=i value="<%=rs("fs33")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs34" size=4 maxlength=4 class=i value="<%=rs("fs34")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs35" size=4 maxlength=4 class=i value="<%=rs("fs35")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs36" size=4 maxlength=4 class=i value="<%=rs("fs36")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs37" size=4 maxlength=4 class=i value="<%=rs("fs37")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs38" size=4 maxlength=4 class=i value="<%=rs("fs38")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs39" size=4 maxlength=4 class=i value="<%=rs("fs39")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs130" size=4 maxlength=4 class=i value="<%=rs("fs130")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs131" size=4 maxlength=4 class=i value="<%=rs("fs131")%>">  </font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs132" size=4 maxlength=4 class=i value="<%=rs("fs132")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs133" size=4 maxlength=4 class=i value="<%=rs("fs133")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs134" size=4 maxlength=4 class=i value="<%=rs("fs134")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs135" size=4 maxlength=4 class=i value="<%=rs("fs135")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs136" size=4 maxlength=4 class=i value="<%=rs("fs136")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs137" size=4 maxlength=4 class=i value="<%=rs("fs137")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs138" size=4 maxlength=4 class=i value="<%=rs("fs138")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs139" size=4 maxlength=4 class=i value="<%=rs("fs139")%>">　</font></td>

        <td width="5%" height="1" align="center"><%=fs30+fs31+fs32+fs33+fs34+fs35+fs36+fs37+fs38+fs39+fs130+fs131+fs132+fs133+fs134+fs135+fs136+fs137+fs138+fs139%>　</td>
      </tr>
      <tr>
        <td width="5%" height="16" align="center"><font size="2">四学期</font></td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm40%></font></td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm41%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm42%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm43%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm44%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm45%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm46%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm47%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm48%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm49%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm140%></font></td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm141%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm142%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm143%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm144%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm145%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm146%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm147%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm148%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm149%></font>　</td>

        <td width="5%" height="16" align="center"><font size="2">总分</font></td>
      </tr>
      <tr>
        <td width="5%" height="1" align="center"><font size="2">成绩</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs40" size=4 maxlength=4 class=i value="<%=rs("fs40")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs41" size=4 maxlength=4 class=i value="<%=rs("fs41")%>">  </font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs42" size=4 maxlength=4 class=i value="<%=rs("fs42")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs43" size=4 maxlength=4 class=i value="<%=rs("fs43")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs44" size=4 maxlength=4 class=i value="<%=rs("fs44")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs45" size=4 maxlength=4 class=i value="<%=rs("fs45")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs46" size=4 maxlength=4 class=i value="<%=rs("fs46")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs47" size=4 maxlength=4 class=i value="<%=rs("fs47")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs48" size=4 maxlength=4 class=i value="<%=rs("fs48")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs49" size=4 maxlength=4 class=i value="<%=rs("fs49")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs140" size=4 maxlength=4 class=i value="<%=rs("fs140")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs141" size=4 maxlength=4 class=i value="<%=rs("fs141")%>">  </font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs142" size=4 maxlength=4 class=i value="<%=rs("fs142")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs143" size=4 maxlength=4 class=i value="<%=rs("fs143")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs144" size=4 maxlength=4 class=i value="<%=rs("fs144")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs145" size=4 maxlength=4 class=i value="<%=rs("fs145")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs146" size=4 maxlength=4 class=i value="<%=rs("fs146")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs147" size=4 maxlength=4 class=i value="<%=rs("fs147")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs148" size=4 maxlength=4 class=i value="<%=rs("fs148")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs149" size=4 maxlength=4 class=i value="<%=rs("fs149")%>">　</font></td>

        <td width="5%" height="1" align="center"><%=fs40+fs41+fs42+fs43+fs44+fs45+fs46+fs47+fs48+fs49+fs140+fs141+fs142+fs143+fs144+fs145+fs146+fs147+fs148+fs149%>　</td>
      </tr>
      <tr>
        <td width="5%" height="1" align="center"><font size="2">五学期</font></td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm50%></font></td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm51%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm52%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm53%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm54%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm55%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm56%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm57%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm58%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm59%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm150%></font></td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm151%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm152%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm153%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm154%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm155%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm156%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm157%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm158%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm159%></font>　</td>

        <td width="5%" height="1" align="center"><font size="2">总分</font></td>
      </tr>
      <tr>
        <td width="5%" height="1" align="center"><font size="2">成绩</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs50" size=4 maxlength=4 class=i value="<%=rs("fs50")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs51" size=4 maxlength=4 class=i value="<%=rs("fs51")%>">  </font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs52" size=4 maxlength=4 class=i value="<%=rs("fs52")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs53" size=4 maxlength=4 class=i value="<%=rs("fs53")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs54" size=4 maxlength=4 class=i value="<%=rs("fs54")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs55" size=4 maxlength=4 class=i value="<%=rs("fs55")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs56" size=4 maxlength=4 class=i value="<%=rs("fs56")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs57" size=4 maxlength=4 class=i value="<%=rs("fs57")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs58" size=4 maxlength=4 class=i value="<%=rs("fs58")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs59" size=4 maxlength=4 class=i value="<%=rs("fs59")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs150" size=4 maxlength=4 class=i value="<%=rs("fs150")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs151" size=4 maxlength=4 class=i value="<%=rs("fs151")%>">  </font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs152" size=4 maxlength=4 class=i value="<%=rs("fs152")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs153" size=4 maxlength=4 class=i value="<%=rs("fs153")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs154" size=4 maxlength=4 class=i value="<%=rs("fs154")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs155" size=4 maxlength=4 class=i value="<%=rs("fs155")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs156" size=4 maxlength=4 class=i value="<%=rs("fs156")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs157" size=4 maxlength=4 class=i value="<%=rs("fs157")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs158" size=4 maxlength=4 class=i value="<%=rs("fs158")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs159" size=4 maxlength=4 class=i value="<%=rs("fs159")%>">　</font></td>

        <td width="5%" height="1" align="center"><%=fs50+fs51+fs52+fs53+fs54+fs55+fs56+fs57+fs58+fs59+fs150+fs151+fs152+fs153+fs154+fs155+fs156+fs157+fs158+fs159%>　</td>
      </tr>
      <tr>
        <td width="5%" height="16" align="center"><font size="2">六学期</font></td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm60%></font></td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm61%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm62%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm63%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm64%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm65%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm66%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm67%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm68%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm69%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm160%></font></td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm161%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm162%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm163%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm164%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm165%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm166%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm167%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm168%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm169%></font>　</td>

        <td width="5%" height="16" align="center"><font size="2">总分</font></td>
      </tr>
      <tr>
        <td width="5%" height="1" align="center"><font size="2">成绩</font></td> 
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs60" size=4 maxlength=4 class=i value="<%=rs("fs60")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs61" size=4 maxlength=4 class=i value="<%=rs("fs61")%>">  </font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs62" size=4 maxlength=4 class=i value="<%=rs("fs62")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs63" size=4 maxlength=4 class=i value="<%=rs("fs63")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs64" size=4 maxlength=4 class=i value="<%=rs("fs64")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs65" size=4 maxlength=4 class=i value="<%=rs("fs65")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs66" size=4 maxlength=4 class=i value="<%=rs("fs66")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs67" size=4 maxlength=4 class=i value="<%=rs("fs67")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs68" size=4 maxlength=4 class=i value="<%=rs("fs68")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs69" size=4 maxlength=4 class=i value="<%=rs("fs69")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs160" size=4 maxlength=4 class=i value="<%=rs("fs160")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs161" size=4 maxlength=4 class=i value="<%=rs("fs161")%>">  </font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs162" size=4 maxlength=4 class=i value="<%=rs("fs162")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs163" size=4 maxlength=4 class=i value="<%=rs("fs163")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs164" size=4 maxlength=4 class=i value="<%=rs("fs164")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs165" size=4 maxlength=4 class=i value="<%=rs("fs165")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs166" size=4 maxlength=4 class=i value="<%=rs("fs166")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs167" size=4 maxlength=4 class=i value="<%=rs("fs167")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs168" size=4 maxlength=4 class=i value="<%=rs("fs168")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs169" size=4 maxlength=4 class=i value="<%=rs("fs169")%>">　</font></td>

        <td width="5%" height="1" align="center"><%=fs60+fs61+fs62+fs63+fs64+fs65+fs66+fs67+fs68+fs69+fs160+fs161+fs162+fs163+fs164+fs165+fs166+fs167+fs168+fs169%>　</td>
      </tr>
      <tr>
        <td width="5%" height="16" align="center"><font size="2">七学期</font></td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm70%></font></td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm71%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm72%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm73%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm74%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm75%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm76%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm77%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm78%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm79%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm170%></font></td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm171%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm172%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm173%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm174%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm175%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm176%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm177%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm178%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm179%></font>　</td>

        <td width="5%" height="16" align="center"><font size="2">总分</font></td>
      </tr>
      <tr>
       <td width="5%" height="1" align="center"><font size="2">成绩</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs70" size=4 maxlength=4 class=i value="<%=rs("fs70")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs71" size=4 maxlength=4 class=i value="<%=rs("fs71")%>">  </font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs72" size=4 maxlength=4 class=i value="<%=rs("fs72")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs73" size=4 maxlength=4 class=i value="<%=rs("fs73")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs74" size=4 maxlength=4 class=i value="<%=rs("fs74")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs75" size=4 maxlength=4 class=i value="<%=rs("fs75")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs76" size=4 maxlength=4 class=i value="<%=rs("fs76")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs77" size=4 maxlength=4 class=i value="<%=rs("fs77")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs78" size=4 maxlength=4 class=i value="<%=rs("fs78")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs79" size=4 maxlength=4 class=i value="<%=rs("fs79")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs170" size=4 maxlength=4 class=i value="<%=rs("fs170")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs171" size=4 maxlength=4 class=i value="<%=rs("fs171")%>">  </font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs172" size=4 maxlength=4 class=i value="<%=rs("fs172")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs173" size=4 maxlength=4 class=i value="<%=rs("fs173")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs174" size=4 maxlength=4 class=i value="<%=rs("fs174")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs175" size=4 maxlength=4 class=i value="<%=rs("fs175")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs176" size=4 maxlength=4 class=i value="<%=rs("fs176")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs177" size=4 maxlength=4 class=i value="<%=rs("fs177")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs178" size=4 maxlength=4 class=i value="<%=rs("fs178")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs179" size=4 maxlength=4 class=i value="<%=rs("fs179")%>">　</font></td>
        
        <td width="5%" height="1" align="center"><%=fs70+fs71+fs72+fs73+fs74+fs75+fs76+fs77+fs78+fs79+fs170+fs171+fs172+fs173+fs174+fs175+fs176+fs177+fs178+fs179%>　</td>
      </tr>
      <tr>
        <td width="5%" height="16" align="center"><font size="2">八学期</font></td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm80%></font></td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm81%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm82%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm83%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm84%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm85%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm86%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm87%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm88%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm89%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm180%></font></td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm181%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm182%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm183%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm184%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm185%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm186%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm187%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm188%></font>　</td>
        <td width="5%" height="16" align="center"><font size="2"><%=fsm189%></font>　</td>

        <td width="5%" height="16" align="center"><font size="2">总分</font></td>
      </tr>
     
      <tr>
       <td width="5%" height="2" align="center"><font size="2">成绩</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs80" size=4 maxlength=4 class=i value="<%=rs("fs80")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs81" size=4 maxlength=4 class=i value="<%=rs("fs81")%>">  </font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs82" size=4 maxlength=4 class=i value="<%=rs("fs82")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs83" size=4 maxlength=4 class=i value="<%=rs("fs83")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs84" size=4 maxlength=4 class=i value="<%=rs("fs84")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs85" size=4 maxlength=4 class=i value="<%=rs("fs85")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs86" size=4 maxlength=4 class=i value="<%=rs("fs86")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs87" size=4 maxlength=4 class=i value="<%=rs("fs87")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs88" size=4 maxlength=4 class=i value="<%=rs("fs88")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs89" size=4 maxlength=4 class=i value="<%=rs("fs89")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs180" size=4 maxlength=4 class=i value="<%=rs("fs180")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs181" size=4 maxlength=4 class=i value="<%=rs("fs181")%>">  </font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs182" size=4 maxlength=4 class=i value="<%=rs("fs182")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs183" size=4 maxlength=4 class=i value="<%=rs("fs183")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs184" size=4 maxlength=4 class=i value="<%=rs("fs184")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs185" size=4 maxlength=4 class=i value="<%=rs("fs185")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs186" size=4 maxlength=4 class=i value="<%=rs("fs186")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs187" size=4 maxlength=4 class=i value="<%=rs("fs187")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs188" size=4 maxlength=4 class=i value="<%=rs("fs188")%>">　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs189" size=4 maxlength=4 class=i value="<%=rs("fs189")%>">　</font></td>
        
        <td width="5%" height="2" align="center"><%=fs80+fs81+fs82+fs83+fs84+fs85+fs86+fs87+fs88+fs89+fs180+fs181+fs182+fs183+fs184+fs185+fs186+fs187+fs188+fs189%>　</td>
      </tr>
      
     <tr>
       <td width="15%" height="2" align="center" colspan="4" bgcolor="#66FFCC">
         <p align="center"><font size="2">班主任</font></td>
        <td width="15%" height="2" align="center" colspan="7" bgcolor="#66FFCC">
                         　<%=rs1("byxf")%></td>
        <td width="15%" height="2" align="center" colspan="4" bgcolor="#66FFCC">
                         <font size="2">总分和</font></td>
        <td width="15%" height="2" align="center" colspan="7" bgcolor="#66FFCC">
        <%
        zfh1=fs10+fs11+fs12+fs13+fs14+fs15+fs16+fs17+fs18+fs19+fs20+fs21+fs22+fs23+fs24+fs25+fs26+fs27+fs28+fs29+fs30+fs31+fs32+fs33+fs34+fs35+fs36+fs37+fs38+fs39+fs40+fs41+fs42+fs43+fs44+fs45+fs46+fs47+fs48+fs49+fs50+fs51+fs52+fs53+fs54+fs55+fs56+fs57+fs58+fs59+fs60+fs61+fs62+fs63+fs64+fs65+fs66+fs67+fs68+fs69+fs70+fs71+fs72+fs73+fs74+fs75+fs76+fs77+fs78+fs79+fs80+fs81+fs82+fs83+fs84+fs85+fs86+fs87+fs88+fs89
        zfh2=fs110+fs111+fs112+fs113+fs114+fs115+fs116+fs117+fs118+fs119+fs120+fs121+fs122+fs123+fs124+fs125+fs126+fs127+fs128+fs129+fs130+fs131+fs132+fs133+fs134+fs135+fs136+fs137+fs138+fs139+fs140+fs141+fs142+fs143+fs144+fs145+fs146+fs147+fs148+fs149+fs150+fs151+fs152+fs153+fs154+fs155+fs156+fs157+fs158+fs159+fs160+fs161+fs162+fs163+fs164+fs165+fs166+fs167+fs168+fs169+fs170+fs171+fs172+fs173+fs174+fs175+fs176+fs177+fs178+fs179+fs180+fs181+fs182+fs183+fs184+fs185+fs186+fs187+fs188+fs189
           %>
<%=zfh1+zfh2%>
                     </td>
      </tr>  
      
      
      
      
      </table>
    






 
  
    <center>
    <p><input type=submit value="提交">&nbsp;&nbsp;&nbsp; <input type=reset value="还原"></p>
  </form>
  <p>
 </body>
</html>