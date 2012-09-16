<!--#include file="Conn.asp"-->
<%
userid=trim(Request("userid"))

'判断接受的帐号是否符合要求
if userid="" then 
  Response.Write "<script language=JavaScript>{window.alert('登录帐号不得为空!');window.history.go(-1);}</script>"
end if
if instr(1,userid,",")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('登录帐号不得包含逗号!');window.history.go(-1);}</script>"
end if
if instr(1,userid,"'")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('登录帐号不得包含单引号!');window.history.go(-1);}</script>"
end if



'判断帐号及密码是否正确 
 set recCheckUser=server.CreateObject("ADODB.recordset")
 uid=trim(Request("userid"))
 upwd=trim(Request("password"))
 strSQL="select * from userinfo where txtId='" & uid & "' and txtPass='" & upwd & "'"
 recCheckUser.Open  strSQL,conn
 
  if not recCheckUser.EOF then
 	'如果用户帐号及密码正确
  	
   	'用户进入
 else
 	'用户帐号及密码不正确
  	recCheckUser.Close 
  	set recCheckUser=nothing
  	set conn=nothing
	Response.Write "<script language=JavaScript>{window.alert('您输入的帐号及密码错误，请重新输入!');window.history.go(-1);}</script>"
	response.end
end if 
%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 4.0">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../css/putong_1t">
<script language="javascript" src="../share/fun_script.js"></script>
<STYLE TYPE="text/css">
<!--
td.grzmRow
{
	padding:0px 4px 0px 4px;	  
}
td.grzmList
{
	padding:0px 4px 0px 0px;	  
}
body
{
	background-color:#F7EBDE;
}
-->
</style>

<title>个人桌面</title>
</HEAD>
<BODY oncontextmenu=self.event.returnValue=false>
<div id="proc" name="proc">		
</div>	             
<form ACTION="modifyinfook.asp" METHOD="POST" NAME="formSignUp">  
<input type=hidden name=txtid value=<%=recCheckUser("txtid")%>>           
<div class="TitleBar">             
　             
</div>             
<div align="center">
  <center>
                 
    <table border=0 cellspacing=1 height=839 width="100%" cellpadding="0">
      <tbody>
        <tr> 
          <td align=right>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td align=right height=18 width="21%">密码：</td>
          <td height=18 width="79%"> <input name=txtPass2 maxLength=10 size=15 value=<%=recCheckUser("txtPass")%>> 
            <font color=#ff0000>* </font><span class=tips_reg style="FONT-SIZE: 9pt">1-10 
            字符,只允许数字和英文字母</span>.</td>
        </tr>
        <tr> 
          <td align=right>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td align=right height=18 width="21%">姓名：</td>
          <td height=18 width="79%"> <input name=txtName id="txtName" value="<%=recCheckUser("txtName")%>" size=15 maxLength=50> 
            <font color=#ff0000>*</font></td>
        </tr>
        <tr> 
          <td align=right height=18>性别：</td>
          <td height=18> <select name=txtSex size=1>
              <option value="男" selected>男</option>
              <option value="女">女</option>
            </select> <font color=#ff0000>*</font></td>
        </tr>
        <tr> 
          <td align=right height=18 width="21%">出生日期：</td>
          <td height=18 width="79%"> <input name=txtDate id="txtDate" value="<%=recCheckUser("txtDate")%>" size=15 maxLength=50> 
            <font color="#FF0000">*</font> 1980/01/01</td>
        </tr>
        <tr> 
          <td align=right height=18 width="21%">家庭所在地：</td>
          <td height=18 width="79%"> <font color=#ff0000> 
            <select name=select size=1>
              <option  value="广东">&nbsp;&nbsp;广东&nbsp;&nbsp;</option>
              <option  value="安徽">&nbsp;&nbsp;安徽&nbsp;&nbsp;</option>
              <option  value="北京">&nbsp;&nbsp;北京&nbsp;&nbsp;</option>
              <option  value="福建">&nbsp;&nbsp;福建&nbsp;&nbsp;</option>
              <option  value="甘肃">&nbsp;&nbsp;甘肃&nbsp;&nbsp;</option>
              <option  value="广西">&nbsp;&nbsp;广西&nbsp;&nbsp;</option>
              <option  value="贵州">&nbsp;&nbsp;贵州&nbsp;&nbsp;</option>
              <option  value="海南">&nbsp;&nbsp;海南&nbsp;&nbsp;</option>
              <option  value="河北">&nbsp;&nbsp;河北&nbsp;&nbsp;</option>
              <option  value="河南">&nbsp;&nbsp;河南&nbsp;&nbsp;</option>
              <option  value="黑龙江">&nbsp;&nbsp;黑龙江&nbsp;&nbsp;</option>
              <option  value="湖北">&nbsp;&nbsp;湖北&nbsp;&nbsp;</option>
              <option  value="湖南">&nbsp;&nbsp;湖南&nbsp;&nbsp;</option>
              <option  value="吉林">&nbsp;&nbsp;吉林&nbsp;&nbsp;</option>
              <option  value="江苏">&nbsp;&nbsp;江苏&nbsp;&nbsp;</option>
              <option  value="江西">&nbsp;&nbsp;江西&nbsp;&nbsp;</option>
              <option  value="辽宁" selected>&nbsp;&nbsp;辽宁&nbsp;&nbsp;</option>
              <option  value="内蒙古">&nbsp;&nbsp;内蒙古&nbsp;&nbsp;</option>
              <option  value="宁夏">&nbsp;&nbsp;宁夏&nbsp;&nbsp;</option>
              <option  value="青海">&nbsp;&nbsp;青海&nbsp;&nbsp;</option>
              <option  value="山东">&nbsp;&nbsp;山东&nbsp;&nbsp;</option>
              <option  value="山西">&nbsp;&nbsp;山西&nbsp;&nbsp;</option>
              <option  value="陕西">&nbsp;&nbsp;陕西&nbsp;&nbsp;</option>
              <option  value="上海">&nbsp;&nbsp;上海&nbsp;&nbsp;</option>
              <option  value="四川">&nbsp;&nbsp;四川&nbsp;&nbsp;</option>
              <option  value="天津">&nbsp;&nbsp;天津&nbsp;&nbsp;</option>
              <option  value="新疆">&nbsp;&nbsp;新疆&nbsp;&nbsp;</option>
              <option  value="西藏">&nbsp;&nbsp;西藏&nbsp;&nbsp;</option>
              <option  value="云南">&nbsp;&nbsp;云南&nbsp;&nbsp;</option>
              <option  value="浙江">&nbsp;&nbsp;浙江&nbsp;&nbsp;</option>
              <option  value="重庆">&nbsp;&nbsp;重庆&nbsp;&nbsp;</option>
            </select>
            *</font></td>
        </tr>
        <tr> 
          <td align=right height=18 width="21%">所属院系：</td>
          <td height=18 width="79%"> <font color=#ff0000> 
            <input name=txtClass id="txtClass" value="<%=recCheckUser("txtClass")%>" size=30 maxlength=50>
            *</font> XX学院XX系XX班</td>
        </tr>
        <tr> 
          <td align=right height=18 width="21%">寝室号：</td>
          <td height=18 width="79%"> <input name=txtNumber id="txtNumber" value="<%=recCheckUser("txtNumber")%>" size=30 maxLength=50> 
            <font color=#ff0000>*</font> </td>
        </tr>
        <tr> 
          <td align=right height=18 width="21%">寝室电话：</td>
          <td height=18 width="79%"> <font color=#ff0000> 
            <input name=txtTel2 value="<%=recCheckUser("txtTel")%>" size=30 maxlength=50>
            </font> <font color=#ff0000>*</font></td>
        </tr>
        <tr> 
          <td align=right width="21%">&nbsp;</td>
          <td width="79%">&nbsp;</td>
        </tr>
        <tr> 
          <td align=right height=20 width="21%">Oicq：</td>
          <td height=20 width="79%"> <input name=txtOicq id="txtOicq" value="<%=recCheckUser("txtOicq")%>" size=15 maxLength=20> 
          </td>
        </tr>
        <tr> 
          <td align=right height=18 width="21%">Email：</td>
          <td height=18 width="79%"> <input name=txtEmail2 id="txtEmail" value="<%=recCheckUser("txtEmail")%>" size=15 maxLength=30> 
          </td>
        </tr>
        <tr> 
          <td align=right height=18>个人主页：</td>
          <td height=18> <font color=#ff0000> 
            <input name=txtPage id="txtPage" value="<%=recCheckUser("txtPage")%>" size=30 maxlength=50>
            </font></td>
        </tr>
        <tr> 
          <td align=right height=18 width="21%">其他联系方式：</td>
          <td height=18 width="79%"> <input name=txtOther id="txtOther" value="<%=recCheckUser("txtOther")%>" size=50 maxLength=50> 
          </td>
        </tr>
        <tr> 
          <td align=right>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td align=right height=18 width="21%">是否有个人电脑并简单介绍对电脑的了解</td>
          <td height=18 width="79%"> <textarea name=txtDesc1 cols=48 rows=3 id="txtDesc1"><%=recCheckUser("txtdesc1")%></textarea> 
            <font color="#FF0000">*</font> </td>
        </tr>
        <tr> 
          <td align=right height=18>介绍你上网的方式及每周上网的时间</td>
          <td height=18> <textarea name=txtDesc2 cols=48 rows=3 id="txtDesc2"><%=recCheckUser("txtdesc2")%></textarea> 
            <font color="#FF0000">*</font> </td>
        </tr>
        <tr> 
          <td align=right height=18>谈谈你喜爱的电脑游戏</td>
          <td height=18><textarea name=txtDesc3 cols=48 rows=3 id="txtDesc3"><%=recCheckUser("txtdesc3")%></textarea> 
            <font color="#FF0000">*</font></td>
        </tr>
        <tr> 
          <td align=right height=18>简单介绍你希望加入本协会的主要目的</td>
          <td height=18><textarea name=txtDesc4 cols=48 rows=3 id="txtDesc4"><%=recCheckUser("txtdesc4")%></textarea> 
            <font color="#FF0000">*</font></td>
        </tr>
        <tr> 
          <td align=right height=18>说出你希望本协会举办的活动</td>
          <td height=18><textarea name=txtDesc5 cols=48 rows=3 id="txtDesc5"><%=recCheckUser("txtdesc5")%></textarea> 
            <font color="#FF0000">*</font></td>
        </tr>
        <tr> 
          <td align=right></td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td align=right height=18 width="21%"></td>
          <td height=18   width="79%"> <input name="cmdOK" type="submit" id="cmdOK" value=修改资料> 
            &nbsp;&nbsp;&nbsp;&nbsp; 
            <input name="cmdReset2" type="reset" value=重置资料> 
          </td>
        </tr>
      </tbody>
    </table>
  </div>               
</form>                   
</BODY>                   
