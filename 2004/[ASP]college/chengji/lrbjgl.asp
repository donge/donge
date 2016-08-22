<%
 dim gvv
gvv=43
  if Session.Contents("gws")<>true then
 %>
<!--#include file="gly.asp"-->
<%  
else
%>
<html>
 <head>
  <title>录入管理系统</title>
  </head>
 <body topmargin=0 leftmargin=0 rightmargin=0 bgcolor="#fef4d9">
    <p>
  <center><font face="华文行楷" size="6" color="#FF0000"><b>增加班级记录</b></font></center>
 <form action=in2.asp method=post>
  <center>
  <table width=551 cellpadding=4 cellspacing=1 bgcolor=#ff0000 align=center height="11">
  <tr bgcolor=#FFcccc>
    <td align=center width=100 height="19">部门或专业
    <td height="19" width="432"><input type=text name="s" size=14 maxlength=20 class=i><font size="2">&nbsp;* 不大于10个汉字</font>
    <input type=hidden name="gvv"value="<%=gvv%>">    
     <input type=hidden name="gwsv8v"value="<%=gwsv8v%>">    

    <tr bgcolor=#FFcccc>
    <td align=center width=100 height="18">班级名称
    <td height="18" width="432"><input type=text name="zybj" size=30 maxlength=30 class=i><font size="2">*&nbsp;不大于15个汉字</font>
  
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="1">管理员密码
    <td height="1" width="432"><input type=text name="glymm" size=14 maxlength=20 class=i>&nbsp;&nbsp;<font size="2">*&nbsp;20个字符以内 
    </font>
      
   <tr bgcolor=#FFcccc>
    <td align=center width=100 height="2">班主任
            <td height="2" width="432"><input type=text name="byxf" size=10 maxlength=10 class=i>&nbsp;&nbsp;<font size="2">5个汉字以内 </font>
        
    <tr bgcolor=#FFcccc>
       <td align=center width=100 height="1">班主任性别
    <td height="1" width="432"><input type=radio name="xb" value="男" checked>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name="xb" value="女">女
        
            
 
   
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
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs10" size=14 maxlength=20 class=i> </font>  </td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs20" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs30" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs40" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs50" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs60" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs70" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs80" size=14 maxlength=20 class=i>　</font></td>
        
      </tr>
    
      <tr>
        <td width="5%" height="16" align="center"><font size="2">1</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs11" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs21" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs31" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs41" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs51" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs61" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs71" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs81" size=14 maxlength=20 class=i> </font>  </td>
        

      </tr>
 
      <tr>
        <td width="5%" height="16" align="center"><font size="2">2</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs12" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs22" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs32" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs42" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs52" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs62" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs72" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs82" size=14 maxlength=20 class=i> </font>  </td>
        

        </tr>
   
      <tr>
        <td width="5%" height="16" align="center"><font size="2">3</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs13" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs23" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs33" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs43" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs53" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs63" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs73" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs83" size=14 maxlength=20 class=i> </font>  </td>
        

      </tr>
 
      <tr>
        <td width="5%" height="1" align="center"><font size="2">4</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs14" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs24" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs34" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs44" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs54" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs64" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs74" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs84" size=14 maxlength=20 class=i> </font>  </td>
        

      </tr>
      <tr>
        <td width="5%" height="16" align="center"><font size="2">5</font></td> 
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs15" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs25" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs35" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs45" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs55" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs65" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs75" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs85" size=14 maxlength=20 class=i> </font>  </td>
</tr>
    
      <tr>
        <td width="5%" height="16" align="center"><font size="2">6</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs16" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs26" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs36" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs46" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs56" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs66" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs76" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs86" size=14 maxlength=20 class=i> </font>  </td>

      </tr>
   
      <tr>
        <td width="5%" height="16" align="center"><font size="2">7</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs17" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs27" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs37" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs47" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs57" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs67" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs77" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs87" size=14 maxlength=20 class=i> </font>  </td>
</tr>
     
     
     
      <tr>
        <td width="5%" height="16" align="center"><font size="2">8</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs18" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs28" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs38" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs48" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs58" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs68" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs78" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs88" size=14 maxlength=20 class=i> </font>  </td>

      </tr>
   
      <tr>
        <td width="5%" height="16" align="center"><font size="2">9</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs19" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs29" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs39" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs49" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs59" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs69" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs79" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs89" size=14 maxlength=20 class=i> </font>  </td>
</tr>
     
     
     
            <tr>
        <td width="5%" height="16" align="center"><font size="2">10</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs110" size=14 maxlength=20 class=i> </font>  </td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs120" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs130" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs140" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs150" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs160" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs170" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs180" size=14 maxlength=20 class=i>　</font></td>

      </tr>
    
      <tr>
        <td width="5%" height="16" align="center"><font size="2">11</font></td>
        
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs111" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs121" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs131" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs141" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs151" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs161" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs171" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs181" size=14 maxlength=20 class=i> </font>  </td>


      </tr>
 
      <tr>
        <td width="5%" height="16" align="center"><font size="2">12</font></td>
        
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs112" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs122" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs132" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs142" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs152" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs162" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs172" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs182" size=14 maxlength=20 class=i> </font>  </td>


        </tr>
   
      <tr>
        <td width="5%" height="16" align="center"><font size="2">13</font></td>
        
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs113" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs123" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs133" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs143" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs153" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs163" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs173" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs183" size=14 maxlength=20 class=i> </font>  </td>


      </tr>
 
      <tr>
        <td width="5%" height="1" align="center"><font size="2">14</font></td>
        
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs114" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs124" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs134" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs144" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs154" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs164" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs174" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs184" size=14 maxlength=20 class=i> </font>  </td>


      </tr>
      <tr>
        <td width="5%" height="16" align="center"><font size="2">15</font></td> 
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs115" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs125" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs135" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs145" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs155" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs165" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs175" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs185" size=14 maxlength=20 class=i> </font>  </td>
</tr>
    
      <tr>
        <td width="5%" height="16" align="center"><font size="2">16</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs116" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs126" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs136" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs146" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs156" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs166" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs176" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs186" size=14 maxlength=20 class=i> </font>  </td>

      </tr>
   
      <tr>
        <td width="5%" height="16" align="center"><font size="2">17</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs117" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs127" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs137" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs147" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs157" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs167" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs177" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs187" size=14 maxlength=20 class=i> </font>  </td>
</tr>
     
     
     
      <tr>
        <td width="5%" height="16" align="center"><font size="2">18</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs118" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs128" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs138" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs148" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs158" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs168" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs178" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs188" size=14 maxlength=20 class=i> </font>  </td>

      </tr>
   
      <tr>
        <td width="5%" height="16" align="center"><font size="2">19</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs119" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs129" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs139" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs149" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs159" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs169" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs179" size=14 maxlength=20 class=i>　</font></td>
        <td width="5%" height="16" align="center"><font size="2"><input type=text name="fs189" size=14 maxlength=20 class=i>  </font></td>
</tr>
     

     
      
      
      </table>
      <font face="隶书" color="#FF00FF">注意：属于同一部门或专业(对于中学是年级)必须填写完全相同的课程，<br>否则部门分析各班的课程就不一样了，但不影影响班级分析。<br>有*号的必填</font><br>
   <input type=submit value="提交">&nbsp;&nbsp;&nbsp; <input type=reset value="清除">
 
  </center>
    </form>
   </body>
</html>
<%
end if
%>