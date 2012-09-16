

<html>
<head>
<title>会 员 注 册</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
td {  font-family: "宋体", "serif"; font-size: 9pt}
a:link {  font-size: 9pt; color: #003399; text-decoration: underline}
a:hover {  font-size: 9pt; color: #FF9900; text-decoration: underline}
a:visited {  font-size: 9pt; text-decoration: underline}
.unnamed1 {  font-family: "宋体", "serif"; font-size: 10.5pt}
-->
</style>

</head>

<body bgcolor="#003366" text="#FFFFFF" vlink="#003399" alink="#CCCCCC" leftmargin="0" topmargin="0">
<div align="right"> </div>
<table width="620" border="0" cellpadding="0" align="center" cellspacing="1">
  <tr valign="top"> 
    <td width="400" bgcolor="#336699"> 
      <div align="center">&nbsp;
        <p><br>
          请认真填写你的会员资料<br>
          &nbsp;(带<font color="#FF0000">*</font>号为必填字资料)</p>
        </div>
    </td>
    <td width="625"> 
      <form action=Register_3.asp method=post name="frmRegister">
        <table border=0 cellspacing=1 height=839 width="100%" cellpadding="0">
          <tbody>
            <tr> 
              <td align=right>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr> 
              <td align=right height=25 width="21%">会员级别：</td>
              <td height=25 width="79%"> <select name=txtLevel size=1 id="txtLevel">
                  <option value="普通会员" selected>普通会员</option>
                </select> <font color=#ff0000>*</font></td>
            </tr>
            <tr> 
              <td align=right height=18 width="21%">会员账号：</td>
              <td height=18 width="79%"> <input name=txtId maxLength=15 size=15> 
                <font color=#ff0000>* </font>1-15 字符,只允许数字和英文字母.</td>
            </tr>
            <tr> 
              <td align=right height=18 width="21%">密码：</td>
              <td height=18 width="79%"> <input type="password" name=txtPass maxlength=10 size=15> 
                <font color=#ff0000>* </font><span class=tips_reg style="FONT-SIZE: 9pt">1-10 
                字符,只允许数字和英文字母</span>.</td>
            </tr>
            <tr> 
              <td align=right height=20 width="21%">确认密码：</td>
              <td height=20 width="79%"> <input type="Password" name=txtRepass maxLength=10 size=15> 
                <font color=#ff0000>*</font></td>
            </tr>
            <tr> 
              <td align=right height=30 width="21%">自设问题：</td>
              <td height=30 width="79%"> <input name=txtQuestion maxLength=20 size=30 value=""> 
                <font color=#ff0000>*</font> 在您忘记了密码，需要找回密码的时候，会问您这个问题。比如，这样的问题“我的生日是几月几日？”</td>
            </tr>
            <tr> 
              <td align=right height=18 width="21%">自设答案：</td>
              <td height=18 width="79%"> <input name=txtAnswer maxLength=20 size=30 value=""> 
                <font color=#ff0000>*<span class=tips_reg style="FONT-SIZE: 9pt"><font color="#009999"> 
                </font></span></font><span class=tips_reg style="FONT-SIZE: 9pt">您的自设问题的答案。比如，您的答案是“六月三号”.请牢记您的答案.</span></td>
            </tr>
            <tr> 
              <td align=right>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td align=right height=18>你想加入的部门：</td>
              <td height=18><select name=txtType size=1 id="txtType">
                  <option selected>请选择一个部门</option>
                  <option value="网络部">网络部</option>
                  <option value="娱乐部">娱乐部</option>
                  <option value="硬件部">硬件部</option>
                  <option value="软件部">软件部</option>
                </select>
                <font color=#ff0000>*</font></td>
            </tr>
            <tr> 
              <td align=right height=18 width="21%">姓名：</td>
              <td height=18 width="79%"> <input name=txtName id="txtName" size=15 maxLength=50> 
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
              <td height=18 width="79%"> <input name=txtDate id="txtDate" size=15 maxLength=50> 
                <font color="#FF0000">*</font> 1980/01/01</td>
            </tr>
            <tr> 
              <td align=right height=18 width="21%">家庭所在地：</td>
              <td height=18 width="79%"> <font color=#ff0000> 
                <select name=txtProv size=1>
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
                <input name=txtClass id="txtClass" size=30 maxlength=50>
                *</font> XX学院XX系XX班</td>
            </tr>
            <tr> 
              <td align=right height=18 width="21%">寝室号：</td>
              <td height=18 width="79%"> <input name=txtNumber id="txtNumber" size=30 maxLength=50>
                <font color=#ff0000>*</font> 注明公寓或宿舍名</td>
            </tr>
            <tr> 
              <td align=right height=18 width="21%">寝室电话：</td>
              <td height=18 width="79%"> <font color=#ff0000> 
                <input name=txtTel maxlength=50 size=30>
                </font> <font color=#ff0000>*</font></td>
            </tr>
            <tr> 
              <td align=right width="21%">&nbsp;</td>
              <td width="79%">&nbsp;</td>
            </tr>
            <tr> 
              <td align=right height=20 width="21%">Oicq：</td>
              <td height=20 width="79%"> <input name=txtOicq id="txtOicq" size=15 maxLength=20> 
              </td>
            </tr>
            <tr> 
              <td align=right height=18 width="21%">Email：</td>
              <td height=18 width="79%"> <input name=txtEmail id="txtEmail" value="" size=15 maxLength=30> 
              </td>
            </tr>
            <tr> 
              <td align=right height=18>个人主页：</td>
              <td height=18> <font color=#ff0000> 
                <input name=txtPage id="txtPage" value="" size=30 maxlength=50>
                </font></td>
            </tr>
            <tr> 
              <td align=right height=18 width="21%">其他联系方式：</td>
              <td height=18 width="79%"> <input name=txtOther id="txtOther" value="" size=50 maxLength=50> 
              </td>
            </tr>
            <tr> 
              <td align=right>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr> 
              <td align=right height=18 width="21%">是否有个人电脑并简单介绍对电脑的了解</td>
              <td height=18 width="79%"> <textarea name=txtDesc1 cols=48 rows=3 id="txtDesc1"></textarea> 
                <font color="#FF0000">*</font> </td>
            </tr>
            <tr> 
              <td align=right height=18>介绍你上网的方式及每周上网的时间</td>
              <td height=18> <textarea name=txtDesc2 cols=48 rows=3 id="txtDesc2"></textarea> 
                <font color="#FF0000">*</font> </td>
            </tr>
            <tr> 
              <td align=right height=18>谈谈你喜爱的电脑游戏</td>
              <td height=18><textarea name=txtDesc3 cols=48 rows=3 id="txtDesc3"></textarea> 
                <font color="#FF0000">*</font></td>
            </tr>
            <tr> 
              <td align=right height=18>简单介绍你希望加入本协会的主要目的</td>
              <td height=18><textarea name=txtDesc4 cols=48 rows=3 id="txtDesc4"></textarea> 
                <font color="#FF0000">*</font></td>
            </tr>
            <tr> 
              <td align=right height=18>说出你希望本协会举办的活动</td>
              <td height=18><textarea name=txtDesc5 cols=48 rows=3 id="txtDesc5"></textarea> 
                <font color="#FF0000">*</font></td>
            </tr>
            <tr> 
              <td align=right></td>
              <td>&nbsp;</td>
            </tr>
            <tr> 
              <td align=right height=18 width="21%"></td>
              <td height=18   width="79%"> <input name="cmdOK" type="button" value=提交资料> 
                &nbsp;&nbsp;&nbsp;&nbsp; <input name="cmdReset" type="reset" value=重置资料> 
              </td>
            </tr>
          </tbody>
        </table>      
      </form>      
    </td>      
  </tr>      
</table>      
    
</body>      
</html>      
   
<SCRIPT language=VBScript>   
    '提交资料时检测必填字段   
    sub cmdOK_OnClick   
		if frmRegister.txtId.value="" then   
			alert "提示: 请输入会员代码!"   
			frmRegister.txtId.focus    
		else   
			if frmRegister.txtPass.value="" then   
				alert "提示: 请输入密码!"   
				frmRegister.txtPass.focus    
			else   
				if frmRegister.txtRepass.value<>frmRegister.txtPass.value then   
					alert "提示: 两次密码不相符,请重新确认密码!"   
					frmRegister.txtRepass.focus    
				else   
					if frmRegister.txtQuestion.value="" then   
						alert "提示: 请设置问题,以便以后提取密码!"   
						frmRegister.txtQuestion.focus    
					else   
						if frmRegister.txtAnswer.value="" then   
							alert "提示: 请设置答案,以便以后提取密码!"   
							frmRegister.txtAnswer.focus    
						else   
						if frmRegister.txtType.value="" then   
								alert "提示: 请选择你要加入的部门!"   
								frmRegister.txtType.focus    
							else   
							if frmRegister.txtName.value="" then   
								alert "提示: 请输入姓名!"   
								frmRegister.txtName.focus    
							else   
								if frmRegister.txtClass.value="" then   
									alert "提示: 请输入所属院系!"   
									frmRegister.txtClass.focus    
								else   
									if frmRegister.txtEmail.value="" then   
										alert "提示: 请输入你的联系邮箱!"   
										frmRegister.txtEmail.focus    
									else   
										if instr(1,frmRegister.txtEmail.value,"@")<2 then   
											alert "提示; 你的联系邮箱不对!"   
											frmRegister.txtEmail.focus    
										else   
											if trim(mid(frmRegister.txtEmail.value,instr(1,frmRegister.txtEmail.value,"@")+1,1))="" or trim(mid(frmRegister.txtEmail.value,instr(1,frmRegister.txtEmail.value,"@")+1,1))="." then   
												alert "提示: 你的联系邮箱不对!"   
												frmRegister.txtEmail.focus    
											else   
											    if frmRegister.txtDate.value="" then   
													alert "请输入你的生日"   
													frmRegister.txtDate.focus    
											    else   
													if frmRegister.txtNumber.value="" then   
														alert "提示: 输入寝室号!"   
														frmRegister.txtNumber.focus    
													else   
														if frmRegister.txtTel.value="" then   
															alert "提示: 请输入你的电话!"   
															frmRegister.txtTel.focus    
														else   
														    if frmRegister.txtDesc1.value="" then   
																alert "提示: 请简单回答问题1!"   
																frmRegister.txtDesc1.focus    
																else   
														    if frmRegister.txtDesc2.value="" then   
																alert "提示: 请简单回答问题2!"   
																frmRegister.txtDesc2.focus    
																else   
														    if frmRegister.txtDesc3.value="" then   
																alert "提示: 请简单回答问题3!"   
																frmRegister.txtDesc3.focus    
																else   
														    if frmRegister.txtDesc4.value="" then   
																alert "提示: 请简单回答问题4!"   
																frmRegister.txtDesc4.focus    
																else   
														    if frmRegister.txtDesc5.value="" then   
																alert "提示: 请简单回答问题5!"   
																frmRegister.txtDesc5.focus    
															else   
																if confirm("确定提交你的资料吗?") then   
																	call frmRegister.submit()   
																end if   
															end if   
														end if   
													end if   
											   end if   
											end if   
										end if   
									end if   
								end if   
							end if   
						end if   
					end if   
				end if   
			end if   
			end if
					end if   
							end if   
									end if   
											end if   
		end if   
    end sub   
</SCRIPT>   
   
   
