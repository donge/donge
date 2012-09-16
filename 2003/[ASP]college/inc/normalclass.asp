<%
' 底层类库
'╋━━━━━━━━━━━━━━━━━━╋
' 类:TaleStr
' 功能:本类可以获取表单等提交的数据并进行相应的处理
' 版本:Version 2003-9-8
'╋━━━━━━━━━━━━━━━━━━╋
'
Class TaleStr
Public StrIn,StrOut,StrName,ErrMsg
Private SubStr,CharArr
Private Sub Class_Initialize()
	ErrMsg=""
End Sub
'
' ==============================
' 函数:RequestStr()
' 描述:主函数
' 版本:Version 2003-9-9
' ==============================
'
Public Sub RequestStr()
StrName=Split(StrName,"|*Tale*|")
StrIn=Split(StrIn,"{c}")
For i=0 to Ubound(StrIn)
	If i Mod 4=0 Then
		Select Case LCase(StrIn(i+1))
		Case "f"
			StrIn(i)=Request.Form(StrIn(i))
		Case "s"
			StrIn(i)=Request.Querystring(StrIn(i))		
		End Select
		If  LCase(StrIn(i+2))="t" Then StrIn(i)=Trim(StrIn(i))	
		If  LCase(StrIn(i+3))="t" Then 
			StrIn(i)=replace(StrIn(i),CHR(32),"")		'空格
			StrIn(i)=replace(StrIn(i),CHR(39),"")		'单引号
			StrIn(i)=replace(StrIn(i),CHR(34),"")		'双引号	
		End If
		If i = 0 Then
			SubStr=StrIn(0)
		Else
			SubStr=SubStr&"{c}"&StrIn(i)
		End If
	End If
Next
If InStr(SubStr,"{c}")>0 Then
	StrOut=Split(SubStr,"{c}")
Else
	StrOut=SubStr
End If
End Sub
'
' ==============================
' 函数:NumStr(WithStr,j,DoNum)
' 描述:过滤或判断是否是数字 
' 版本:Version 2003-9-9
' ==============================
'
Public Function NumStr(WithStr,j,DoNum)
	If DoNum=1 Then
		If isNumeric(WithStr) = False Then
			ErrMsg = ErrMsg&"<li><b>"&StrName(j)&"</b>&nbsp;&nbsp;必须是数字"
		Else
			NumStr=WithStr
		End If
	Else
		If isNumeric(WithStr) = False Then
			NumStr = 0
		Else
			NumStr=WithStr
		End If
	End If
End Function
'
' ==============================
' 函数:LenStr(WithStr,j,DoLen,GetLen)
' 描述:判断或截取一定长度的字符串
' 版本:Version 2003-9-9
' ==============================
'
Public Function LenStr(WithStr,j,DoLen,GetLen)
	If DoLen=1 Then
		If Len(WithStr)>GetLen Then
			ErrMsg=ErrMsg&"<li><b>"&StrName(j)&"</b>&nbsp;&nbsp;不能超过"&GetLen&"个字符"
			Exit Function
		Else
			LenStr=WithStr
		End If
	Else
		If Len(WithStr)>GetLen Then LenStr=Left(WithStr,GetLen)
	End If
End Function
'
' ==============================
' 函数:IsEmail(WithStr)
' 描述:判断字符串是否是有效的邮件地址
' 版本:Version 2003-9-9
' ==============================
'
Public Function IsEmail(WithStr,j)
Dim Emailchars,Emailchar,Ch,ErrEmail
ErrEmail="<li>"&StrName(j)&"不是有效的<b>邮件地址</b>"
Emailchars= Split(WithStr, "@")
If UBound(Emailchars) <> 1 Then
	ErrMsg=ErrMsg&ErrEmail
	Exit Function
End If
For Each Emailchar in Emailchars
	If Len(Emailchar) <= 0 Then
		ErrMsg=ErrMsg&ErrEmail
		Exit Function
	End If
	For i = 1 to Len(Emailchar)
		Ch = Lcase(Mid(Emailchar,i,1))
		If InStr("abcdefghijklmnopqrstuvwxyz-_.", Ch)<=0 and Not IsNumeric(Ch) Then
			ErrMsg=ErrMsg&ErrEmail
			Exit Function
		End If
	Next
	If Left(Emailchar, 1) = "." or Right(Emailchar, 1) = "." Then
		ErrMsg=ErrMsg&ErrEmail
		Exit Function
	End If
Next
If InStr(Emailchars(1), ".")<=0 Then
	ErrMsg=ErrMsg&ErrEmail
	Exit Function
End If
i=Len(Emailchars(1)) - InStrRev(Emailchars(1), ".")
If i <> 2 and i <> 3 Then
	ErrMsg=ErrMsg&ErrEmail
	Exit Function
End If
If InStr(talechar, "..") > 0 Then
	ErrMsg=ErrMsg&ErrEmail
	Exit Function
End If
If ErrMsg="" Then IsEmail = WithStr
End Function
'
' ==============================
' 函数:IsURLStr(WithStr,j)
' 描述:判断字符串是否是有效的URL地址
' 版本:Version 2003-9-9
' ==============================
'
Public Function IsURLStr(WithStr,j)
	If Lcase(Left(WithStr,7)) <> "http://" Then
		ErrMsg=ErrMsg&"<li>"&StrName(j)&"不是有效的URL地址"
	Else
		IsURLStr=WithStr
	End If
End Function
'
' ==============================
' 函数:IsDateStr(WithStr,j)
' 描述:判断字符串是否是有效的时间日期值
' 版本:Version 2003-9-9
' ==============================
'
Public Function IsDateStr(WithStr,j)
		If IsDate(WithStr)=False Then
			ErrMsg=ErrMsg&"<li>"&StrName(j)&"不是有效日期时间值"
		Else
			IsDateStr=WithStr
		End If
End Function
'
' ==============================
' 函数:IsInStr(WithStr,j,NoExistStr)
' 描述:判断字符串是否含有不希望出现的字符串
' 版本:Version 2003-9-9
' ==============================
'
Public Function IsInStr(WithStr,j,NoExistStr)
		If InStr(WithStr,NoExistStr)>0 Then
			ErrMsg=ErrMsg&"<li><B>"&StrName(j)&"</B>含有当前禁用的字符串<B>"&NoExistStr&"</B>"
		Else
			IsInStr=WithStr
		ENd If
End Function
'
Private Sub Class_Terminate()
If IsArray(StrIn) Then Erase StrIn
If IsArray(StrName) Then Erase StrName
If InStr(SubStr,"{c}")>0 Then Erase StrOut
End Sub
End Class
'
'╋━━━━━━━━━━━━━━━━━━╋
' 类:SelectDataClass
' 功能:获取指定的一项数据以TaleSD输出
' 版本:Version 2003-8-22
' Build 2003-10-31 增加多表查询能力
'╋━━━━━━━━━━━━━━━━━━╋
'
Class SelectDataClass
Public TaleField,TaleTable,TaleOther,TaleSD,NoData
Private SDSQL,SDRS,i
Private Sub Class_Initialize()
	NoData=False
End Sub
Public Sub StartSD()
 SDSQL="Select Top 1  "&TaleField&"  From "&TaleTable&"  "&TaleOther
 Set SDRS=Conn.ExeCute(SDSQL)
 If Not SDRS.Eof Then
 If Instr(TaleField,",")>0 Then
	TaleSD=Split(TaleField,",")
	For i=0 to Ubound(TaleSD)
		If Instr(TaleSD(i),"AS")>0  Then TaleSD(i)=Split(TaleSD(i),"AS")(1)
		TaleSD(i)=SDRS(TaleSD(i))
	Next
 Else
	TaleSD=SDRS(TaleField)
 End If
 Else
	NoData=True
 End If
End Sub
Private Sub Class_Terminate()
 SDRS.Close
 Set SDRS=Nothing
End Sub
End Class
'
'╋━━━━━━━━━━━━━━━━━━╋
' 类:CountDataClass
' 功能:统计哪一项的记录数以TaleCD输出
' 版本:Version 2003-8-22
'╋━━━━━━━━━━━━━━━━━━╋
' 
Class CountDataClass
Public TaleField,TaleTable,TaleOther,TaleCD
Private SDSQL,SDRS
Public Sub StartCD
SDSQL="Select COUNT("&TaleField&") as TaleCDNum  From  "&TaleTable&"   "&TaleOther
Set SDRS=Conn.ExeCute(SDSQL)
If Not SDRS.Eof Then
	TaleCD=SDRS("TaleCDNum")
Else
	TaleCD=0
End If
SDRS.Close
Set SDRS=Nothing
End Sub
End Class
'╋━━━━━━━━━━━━━━━━━━╋
' 类:Template
' 功能:本类可以获取表单等提交的数据并进行相应的处理
' 版本:Version 2003-9-8
'╋━━━━━━━━━━━━━━━━━━╋
'
Class Template
Public TrLine,UserBrowser,UserSystem,PrePage,UserIP,PageURL,GetBack,GetBack2,CTW,Normal,Stat,PageIndex
Public Adminname,AdminPassword,AdminNum,Count
Public ErrHead,ErrBody

Private Sub Class_Initialize()
	Response.buffer=True
	Response.Write "<!--版权所有,禁止翻录-->"
' Cookies
Adminname=Removesensitivity(Trim(Request.cookies("ljysystem")("adminname")))
Adminpassword=Removesensitivity(Trim(Request.cookies("ljysystem")("adminpassword")))
AdminNum=Session("adminnum")
Count=Request.cookies("count")

' #操作系统资料
Prepage=request.servervariables("http_referer")
If Prepage="" Then Prepage="default.asp?"
Userip=Request.ServerVariables("HTTP_X_FORWARDED_FOR")
If UserIP="" Then Userip=Request.servervariables("REMOTE_ADDR")
Dim Strsplit:Strsplit=split(Request.Servervariables("HTTP_USER_AGENT"),";")
Strsplit(1)=Trim(replace(Strsplit(1),"MSIE","Internet Explorer"))
Strsplit(2)=Trim(replace(Strsplit(2),")",""))
Strsplit(2)=Trim(replace(Strsplit(2),"NT 5.1","XP"))
Strsplit(2)=Trim(replace(Strsplit(2),"NT 5.0","2000"))
Strsplit(2)=Trim(replace(Strsplit(2),"NT 5.2","2003"))
PageURL=lcase(request.ServerVariables("PATH_INFO"))
PageIndex="http://"&request.ServerVariables("SERVER_NAME")&Mid(PageURL,1,(InstrRev(PageURL,"/")))
UserBrowser=Strsplit(1)
UserSystem=Strsplit(2)
Erase Strsplit
'
Set  TaleClass=New SelectDataClass
TaleClass.TaleField="l_base,l_stat"
TaleClass.TaleTable="ljy_config"
TaleClass.TaleOther=""
TaleClass.StartSD()
if  TaleClass.NoData=True Then 
	Response.Write "系统错误,表ljy_config被置空"
	Response.End
Else
	Normal=Split(TaleClass.TaleSD(0),"|*ljy*|")
	Stat=TaleClass.TaleSD(1)
	If Count="" Then
		Conn.ExeCute("update ljy_config set l_stat=l_stat+1")
		Response.cookies("count")="ljy"
		Response.cookies("count").expires=Dateadd("n",CLng(Normal(8)),Now())
	End If
End If
Set  TaleClass=Nothing
GetBack="<a href=javascript:history.back(1)>返回上一页</a>"
GetBack2="<a href="&PrePage&">返回上一页</a>"
CTW="<INPUT type=Button name=Button value='关闭窗口'  class=go  onclick=window.close()>"

TrLine="<tr><td height=1 background='image/tline.gif' colspan=5></td></tr><tr><td align=right bgcolor={bgcolor} height=41 width={tdwidth}>{leftinfo}: &nbsp;&nbsp;&nbsp;&nbsp;</td><td width=1 background='image/line.gif'></td><td>&nbsp;&nbsp;&nbsp;&nbsp;{rightinfo}</td></tr>"

End Sub
Public Function Removesensitivity(talechar)
	talechar=Trim(talechar)
	talechar=replace(talechar,CHR(32),"")
	talechar=replace(talechar,CHR(39),"")	
	talechar=replace(talechar,CHR(34),"")
	Removesensitivity=talechar
End Function
Private Sub Class_Terminate()
	Response.WRite vbCrLf&"<!--Powered by LJYong,now is "&Now&"-->"
	Call CloseDB
End Sub
Public Sub HeadHTML()
%>
<html>
<head>
<title>信息科学与工程学院-<%=NowTitle%></title>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta content="沈阳工业大学,信息科学与工程学院,课件下载" name=keywords>
<meta content="Powered By Ljy"  name=description>
<Style>
A {FONT-SIZE: 12px; TEXT-DECORATION: none;COLOR: #333333; }
A:hover  {FONT-SIZE: 12px; TEXT-DECORATION: underline;COLOR: #000000; }
A:active {FONT-SIZE: 12px; TEXT-DECORATION: none;COLOR: #000000; }
A.head {FONT-SIZE: 12px; TEXT-DECORATION: none;COLOR: #cccccc; }
A.head:hover  {FONT-SIZE: 12px; COLOR: #FFFFFF; TEXT-DECORATION: none;POSITION: relative; TOP: 1px;left:1px}
A.head:active {FONT-SIZE: 12px; COLOR: #FFFFFF; TEXT-DECORATION: none;POSITION: relative; TOP: 1px;left:1px}
A.list {FONT-SIZE: 14px; TEXT-DECORATION: none;COLOR: #006600; }
A.list:hover  {FONT-SIZE: 14px; COLOR: #006600; TEXT-DECORATION: underline;}
A.list:active {FONT-SIZE: 14px; COLOR: #006600; TEXT-DECORATION: none;}
Body{SCROLLBAR-FACE-COLOR: #EEEEEE; SCROLLBAR-HIGHLIGHT-COLOR: #EEEEEE;SCROLLBAR-SHADOW-COLOR: #EEEEEE;  SCROLLBAR-3DLIGHT-COLOR: #000000; SCROLLBAR-ARROW-COLOR: #333333; SCROLLBAR-TRACK-COLOR: #EEEEEE; BACKGROUND-COLOR: #FFFFFF;OVERFLOW-Y: Auto; OVERFLOW-X: auto;FONT-SIZE: 12px; FONT-FAMILY: MS Shell Dlg, 宋体,Tahoma;COLOR: #333333;}
P {LINE-HEIGHT: 150%}
Table {FONT-SIZE:12px; CURSOR: default; COLOR:#333333; word-break:break-all;}
.redfont {FONT-SIZE: 12px ; color:#006600;}
.Tablehead{BORDER-RIGHT: 1  solid #006600; BORDER-LEFT: 1  solid #006600;   BORDER-Top: 1  solid #006600; BORDER-Bottom: #006600 0  solid;BACKGROUND-COLOR: #FFFFFF;}
.Tablebody{BORDER-RIGHT: 1  solid #006600; BORDER-LEFT: 1  solid #006600;   BORDER-Top: 1  solid #006600; BORDER-Bottom: 1  solid #006600;BACKGROUND-COLOR: #FFFFFF;color:#006600}
input{FONT-SIZE: 12px;COLOR: #333333; FONT-FAMILY: MS Shell Dlg, Tahoma, 宋体 ; CURSOR: hand; }
textarea{FONT-SIZE: 12px;COLOR: #333333; FONT-FAMILY: MS Shell Dlg, Tahoma, 宋体 ; CURSOR: Cross; BACKGROUND-COLOR: #EEEEEE;}
select {FONT-SIZE: 12px;COLOR: #333333; FONT-FAMILY: MS Shell Dlg, Tahoma, 宋体 ; CURSOR: Cross; BACKGROUND-COLOR: #EEEEEE;}
.input1 {COLOR:#006600;BACKGROUND-COLOR:#EEEEEE; vertical-align: middle;Border:none;height: 20px ;}
.input2 {BACKGROUND-COLOR: #FFFFFF; height: 20px ;  BORDER-RIGHT:1  solid #006600 ; BORDER-LEFT:1  solid  #006600 ;   BORDER-TOP: 1  solid #006600 ; 1  solid;BORDER-BOTTOM:1  solid  #006600 ;}
.go {BACKGROUND-COLOR: #EEEEEE;  BORDER-LEFT:1  solid  #333333 ;   BORDER-TOP: 1  solid #333333 ; 1  solid;}
.fontdrop {FONT-SIZE: 14px; FILTER: dropshadow(color=#cccccc,offx=1,offy=1); WIDTH: 300 ; COLOR: #006600; POSITION: relative;}
</Style>
</head>
<BODY  leftMargin="1"  topMargin="0"  onmouseover="self.status='Welcome';return true" background=image/bg.gif> 
<a name=top></a>
<%
If ErrHead<>"" Or ErrBody<>"" Then 
Info ErrHead,ErrBody&"<li>"&GetBack,"有任何问题请联系<a href='mailto:"&Normal(0)&"'>管理人员</a>"
Response.End
End If
End Sub
Public Sub HeadJS()
%>
<script Language="JavaScript">
tPopWait=50;
tPopShow=5000;
showPopStep=20;
popOpacity=99;
sPop=null;
curShow=null;
tFadeOut=null;
tFadeIn=null;
tFadeWaiting=null;
document.write("<style type='text/css'id='defaultPopStyle'>");
document.write(".cPopText {  background-color: #F8F8F5;color:#000000; border: 1px #006600 solid;font-color: font-size: 12px; padding-right: 4px; padding-left: 4px; height: 20px; padding-top: 2px; padding-bottom: 2px; filter: Alpha(Opacity=0)}");
document.write("</style>");
document.write("<div id='dypopLayer' style='position:absolute;z-index:1000;' class='cPopText'></div>");
function showPopupText(){
var o=event.srcElement;
	MouseX=event.x;
	MouseY=event.y;
	if(o.alt!=null && o.alt!=""){o.dypop=o.alt;o.alt=""};
        if(o.title!=null && o.title!=""){o.dypop=o.title;o.title=""};
	if(o.dypop!=sPop) {
			sPop=o.dypop;
			clearTimeout(curShow);
			clearTimeout(tFadeOut);
			clearTimeout(tFadeIn);
			clearTimeout(tFadeWaiting);	
			if(sPop==null || sPop=="") {
				dypopLayer.innerHTML="";
				dypopLayer.style.filter="Alpha()";
				dypopLayer.filters.Alpha.opacity=0;	
				}
			else {
				if(o.dyclass!=null) popStyle=o.dyclass 
				else 
				popStyle="cPopText";	curShow=setTimeout("showIt()",tPopWait);	}	}}
function showIt(){
		dypopLayer.className=popStyle;
		dypopLayer.innerHTML=sPop;
		popWidth=dypopLayer.clientWidth;
		popHeight=dypopLayer.clientHeight;
		if(MouseX+12+popWidth>document.body.clientWidth) {popLeftAdjust=-popWidth-24}
			else popLeftAdjust=0;
		if(MouseY+12+popHeight>document.body.clientHeight) popTopAdjust=-popHeight-24
else 
popTopAdjust=0;dypopLayer.style.left=MouseX+12+document.body.scrollLeft+popLeftAdjust;dypopLayer.style.top=MouseY+12+document.body.scrollTop+popTopAdjust;dypopLayer.style.filter="Alpha(Opacity=0)";fadeOut();}
function fadeOut(){if(dypopLayer.filters.Alpha.opacity<popOpacity) {dypopLayer.filters.Alpha.opacity+=showPopStep;tFadeOut=setTimeout("fadeOut()",1);}else {dypopLayer.filters.Alpha.opacity=popOpacity;tFadeWaiting=setTimeout("fadeIn()",tPopShow);}}
function fadeIn(){if(dypopLayer.filters.Alpha.opacity>0) {dypopLayer.filters.Alpha.opacity-=1;tFadeIn=setTimeout("fadeIn()",1);}}
document.onmouseover=showPopupText;
function CheckAll(form)  {  for (var i=0;i<form.elements.length;i++)    {  var e = form.elements[i];  if (e.name != 'chkall')       e.checked = form.chkall.checked;   } }
function ask(talechar)
{if(confirm(talechar)){this.document.link;return true;}return false;}
</script>

<%
End SUB
'
Public Sub NormalTOP()
%>
<TABLE  align=center cellSpacing=0 cellPadding=0 width="100%" background="image/bg1.gif">
 <TR >
  <TD ><img src=image/ci.jpg ></TD>
  <TD Align=center></TD>
 </TR>
</TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=100%  border=0>
    <TR>
    <TD  background=image/dotlineh.gif  height=1 colspan=20></TD>
	</TR>
  <TR  bgcolor=#006600>
  <TD width=18><img src=image/menu.gif></td>
<TD height=27 width=80 align=center><a href=default.asp class=head><img src=image/arrow.gif border=0>首 页</a></td>
<TD width=80><a href=info.asp class=head><img src=image/arrow.gif border=0>新闻动态</a></td>
<TD width=80><a href=intro.asp class=head><img src=image/arrow.gif border=0>学院介绍</a></td>
<TD width=80><a href=intro.asp?action=edu class=head><img src=image/arrow.gif border=0>科研活动</a></td>
<TD width=80><a href=intro.asp?action=build class=head><img src=image/arrow.gif border=0>教学建设</a></td>
<TD width=80><a href=intro.asp?action=stu class=head><img src=image/arrow.gif border=0>学生管理</a></td>
<TD width=80><a href=info.asp?action=info class=head><img src=image/arrow.gif border=0>资讯中心</a></td>
<TD width=80><a href=down.asp class=head><img src=image/arrow.gif border=0>课件下载</a></td>
<TD width=80><a href=http://www.sut.edu.cn class=head><img src=image/arrow.gif border=0>工大首页</a></td>
<TD Width=*>&nbsp;</td>
</TR>
</TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=100%  border=0 bgcolor=#EEEEEE>
   <TR>
    <TD background=image/dotlineh.gif  height=1 colspan=10></TD>
  </TR>
     <TR>
  <TD height=20 align=left>

  </TD>
  </TR>
</TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=100%  border=0 height=400>
   <TR>
       <TD valign=top width=200 bgcolor=#EEEEEE>
<%
End Sub
Public Sub FootHTML()
%>
</TD>
  </TR>
</TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=100%  border=0>
  	<TR>
    <TD background=image/tline.gif  height=1 colspan=10></TD>
  </TR>
</TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=100%  border=0>
  	<TR>
    <TD align=center height=10></TD>
  </TR>
  	<TR>
    <TD align=center height=20><a href=# onClick="window.external.AddFavorite('<%=PageIndex%>','工大信息科学与工程学院')">加入收藏</a>  §  <a href=# onclick="var strHref=window.location.href;this.style.behavior='url(#default#homepage)';this.setHomePage('<%=PageIndex%>');">设为首页</a> §  <a href="mailto:<%=Normal(0)%>">联系我们</a>  §  <a href=admin.asp target=_blank>系统维护</a></TD>
  </TR>
  	<TR>
    <TD align=center height=20>Copyright &copy;2004 Inc. All Rights Reserved &nbsp; 科技部保留本程序所有权利 </TD>
  </TR>
</TABLE>
<%
ENd Sub
'
Public Sub BodyLIne()
%>
</TD>
  <TD width=1 background=image/line.gif></TD>
   <TD valign=top>
   <TABLE cellSpacing=0 cellPadding=0 width=100%  border=0 bgcolor=#FFFFFF>
   <TR>
    <TD background=image/tline.gif  height=1 colspan=10></TD>
  </TR>
     <TR>
  <TD height=18 >
  </TD>
  </TR>
</TABLE>
<%
End Sub
Public Sub AdminTOP()
%>
<TABLE  align=center cellSpacing=0 cellPadding=0 width="100%" background="image/bg1.gif">
 <TR >
  <TD ><img src=image/ci.jpg ></TD>
  <TD Align=center></TD>
 </TR>
</TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=100%  border=0>
    <TR>
    <TD  background=image/dotlineh.gif  height=1 colspan=20></TD>
	</TR>
  <TR  bgcolor=#006600>
  <TD width=18><img src=image/menu.gif></td>
  <TD Width=*><font color=#EEEEEE>系统维护§ </font><a href=admin.asp?op=1 class=head>退出</a></td>
<TD height=27 width=80 align=center><img src=image/arrow.gif border=0><a href=admin.asp class=head>首 页</a></td>
<TD width=80><a href=admin.asp?action=new class=head><img src=image/arrow.gif border=0>新闻动态</a></td>
<TD width=80><a href=admin.asp?action=intro class=head><img src=image/arrow.gif border=0>学院介绍</a></td>
<TD width=80><a href=admin.asp?action=edu class=head><img src=image/arrow.gif border=0>科研活动</a></td>
<TD width=80><a href=admin.asp?action=build class=head><img src=image/arrow.gif border=0>教学建设</a></td>
<TD width=80><a href=admin.asp?action=stu class=head><img src=image/arrow.gif border=0>学生管理</a></td>
<TD width=80><a href=admin.asp?action=info class=head><img src=image/arrow.gif border=0>资讯中心</a></td>
<TD width=80><a href=admin.asp?action=down class=head><img src=image/arrow.gif border=0>课件下载</a></td>


</TR>
</TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=100%  border=0 bgcolor=#EEEEEE>
   <TR>
    <TD background=image/dotlineh.gif  height=1 colspan=10></TD>
  </TR>
     <TR>
  <TD height=20>
  </TD>
  </TR>
</TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=100%  border=0 height=400>
   <TR>
       <TD valign=top width=200 bgcolor=#EEEEEE>
	   <%
End SUb
'
Public Sub AdminFoot()
%>
</TD>
  </TR>
</TABLE>

<TABLE cellSpacing=0 cellPadding=0 width=100%  border=0>
  	<TR>
    <TD background=image/tline.gif  height=1 colspan=10></TD>
  </TR>
  	<TR>
    <TD align=center height=5></TD>
  </TR>
  	<TR>
    <TD  height=30 align=right>Copyright &copy;2004 Inc. All Rights Reserved &nbsp; 科技部保留本程序所有权利&nbsp;&nbsp;&nbsp;</TD>
  </TR>
    	<TR>
    <TD align=center height=5></TD>
  </TR>
</TABLE>
<%
ENd Sub
Public Sub Info(Title,Content,Bottom)
%>
<Div Style='height:100px'>&nbsp;</DIv>
<TABLE cellSpacing=0 cellPadding=0 width=400  border=0  bgcolor=#FFFFFF align=center>
  <tr> 
    <td height="1" colspan="3" background=image/tline.gif></td>
  </tr>
  <tr> 
    <td rowspan="5" width=1  background=image/line.gif></td>
    <td height="27" bgcolor=#006600 align=center><img src=image/list.gif>&nbsp;&nbsp;<font color=#EEEEEE><%=Title%></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td rowspan="5" width=1 background=image/line.gif></td>
  </tr>
    <tr> 
    <td height="1" background=image/tline.gif></td>
  </tr>
  <tr> 
    <td height="150">
<TABLE cellSpacing=5 cellPadding=5  border=0  align=center WIDTH='100%'>
<TR><TD>
<%=Content%>
</TD></TR>
</TABLE>
</td>
  </tr>
      <tr> 
    <td height="1" background=image/tline.gif></td>
  </tr>
      <tr> 
    <td height="25"  bgcolor=#EEEEEE align=right><font color=#006600> <%=Bottom%></font>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr> 
    <td height="1" colspan="3" background=image/tline.gif></td>
  </tr>
</table>
<%
End Sub
'
Public Function LeftMenu(MenuArr,OnClick,Action)
DIm OperateMenu:OperateMenu=Split(MenuArr,"|")
Dim LinkURL
For i=0 To Ubound(OperateMenu)

If IsNumeric(OnClick) Then
If CInt(OnClick)=i Then
	LeftMenu=LeftMenu&"<Div style='Height:25' ><img src='image/listn.gif'>"
Else
	LeftMenu=LeftMenu&"<Div style='Height:25' ><img src='image/list.gif'>"
End If
Else
	LeftMenu=LeftMenu&"<Div style='Height:25' ><img src='image/list.gif'>"
End If
If Action="" Then
	LinkURL=PageURL&"?operate="&i
Else
	LinkURL=PageURL&"?action="&Action&"&operate="&i
End If
LeftMenu=LeftMenu&"&nbsp;&nbsp;<a href="&LinkURL&" class=list>"&OperateMenu(i)&"</a></Div>"
Next
If Cint(onclick)>Cint(Ubound(OperateMenu)) THen onclick=0
ClickName=OperateMenu(onclick)
End Function
'
Public Sub NoThisPost()
Dim Url_1,Url_2
Url_1=Cstr(Request.ServerVariables("HTTP_REFERER")) 
Url_2=Cstr(Request.ServerVariables("SERVER_NAME")) 
If Mid(Url_1,8,len(Url_2))<>Url_2  then
	ErrHead="非法访问"
	ErrBody="<li>本页面不能从外部提交脚本<li>请操作操作的合法性与正确性"
End If
End Sub
'
'
Public Sub  NoDownLoad(DownSoft)
Dim UserAgent
DownSoft=Split(DownSoft,"|*TaleBBS*|")
UserAgent=Trim(lcase(Request.Servervariables("HTTP_USER_AGENT")))
For i=0 to Ubound(DownSoft)
If Instr(UserAgent,DownSoft(i))>0 Then 
	ErrHead="非法浏览操作"
	ErrBody="<li>请不要使用"&DownSoft(i)&"这类软件浏览本站"
End If
Next
End Sub

Public Function ListPages(Intro,PageUrl,TotalRecords,MaxRecord,Npage,Currentpage)
PageUrl=PageUrl&"&page="
If TotalRecords="" Then TotalRecords=0
If Npage="" Then Npage=1 

ListPages="<table border=0 cellpadding=10 cellspacing=5 width=95% >"
ListPages=ListPages&"<tr><td valign=middle>总"&Intro&"数<b>"&TotalRecords&"</b>&nbsp;&nbsp;┋&nbsp;&nbsp; 每页<b>"&MaxRecord&"</b>&nbsp;&nbsp;┋&nbsp;&nbsp;共<b>"&Npage&"页</b>"
ListPages=ListPages&"</td><td valign=middle><div align=right >"
If Currentpage<2 Then
	ListPages=ListPages&"<font face=webdings class=redfont>9</font> "
	ListPages=ListPages&"<font face=webdings class=redfont>7</font> "
Else
	ListPages=ListPages&"<font face=webdings ><a href="&Pageurl&"1 alt='首页'>9</a></font>"
	ListPages=ListPages&"<font face=webdings ><a href="&Pageurl&Clng(Currentpage-1)&" alt='上一页'>7</a></font>"
End If
 ListPages=ListPages&"&nbsp;&nbsp;当前第<b>"&Currentpage&"</b>页"
If Npage-Currentpage<1 Then
	ListPages=ListPages&"<font face=webdings class=redfont>8</font>"
	ListPages=ListPages&"<font face=webdings class=redfont>:</font>"
Else
	ListPages=ListPages&"<font face=webdings><a href="&pageurl&CLng(Currentpage+1)&" alt=下一页>8</a></font>"
	ListPages=ListPages&"<font face=webdings><a href="&pageurl&npage&" alt=尾页>:</a></font>"
End if
ListPages=ListPages&" &nbsp;&nbsp; 跳转到第:"
ListPages=ListPages&"<Select class=go  onchange="&Chr(34)&"location=this.options[this.selectedIndex].value"&Chr(34)&">"
For i=1 To Npage
	ListPages=ListPages&"<option value="&PageUrl&i&""
	If CLng(i)=CLng(Currentpage) Then ListPages=ListPages&" selected"
	ListPages=ListPages&">"&i&"</option>"
Next
ListPages=ListPages&"</select>页</td></tr></Table>"
End Function

'
' ==============================
' 函数:RandNum(RandMode,MinNum,MaxNum)
' 描述:随机数生成,当RandMode=0时,可以生成介于(包括)MinNum与MaxNum之间的数,否则生成数位是RandMode的数
' 版本:Version 2003-9-9
' ==============================
'
Public Function RandNum(RandMode,MinNum,MaxNum)
Randomize
If RandMode=0 Then	
	RandNum=Round((MaxNum - MinNum) * Rnd + MinNum)
Else
	Do While Len(RandNum)<>RandMode
	Randomize
	RandNum=Round(Rnd*10^RandMode)
	Loop
End IF
End Function
'
Public  Function TimeIn(TStart,TEnd)
	TimeIn=0
	If ( Cint(Hour(Time)) >=Cint(Tstart) AND Cint( Hour(Time))<=Cint(TEnd) ) Then TimeIn=1
End Function
'
Public Function NumOption(Stepnum,NName,Starti,Endi,Selecti,NType)
	For i = Starti to Endi Step stepnum
		NumOption=NumOption&"<option value="&i&" "
		If Cint(Selecti) = i Then NumOption=NumOption&"selected "
		If NType =1 Then
			NumOption=NumOption&">"&NName&i&"</option>"
		Else
			NumOption=NumOption&">"&i&" "&NName&"</option>"
		End If
	Next
End Function
'
Public Function IntroList(sid)
Dim ActionName,SStr
Select Case sid
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
	IntroList="<BR><a href=intro.asp?action="&SStr&" class=list>"&ActionName&"</a>"
	Set Talers=Conn.Execute("Select l_title from ljy_collegedata where l_sid="&SID&"")
	If Not TaleRs.Eof Then
		j=0
		Do While Not Talers.Eof
		IntroList=IntroList&"&nbsp;&nbsp;<a href=intro.asp?action="&SStr&"&operate="&j&">"&Talers("l_title")&"</a>"
		Talers.MoveNext
		j=j+1
		Loop
End If
End Function
'
Public Function InfoList(sid)
Dim ActionName,SStr
Select Case sid
Case 0
	ActionName="新闻动态"
	SStr="news"
Case 1
	ActionName="资讯中心"
	SStr="info"
End Select
	InfoList="<a href=info.asp?action="&SStr&" class=list>"&ActionName&"</a>"
	Set Talers=Conn.Execute("Select l_title,l_intro from ljy_sort where l_sid="&SID&"")
	If Not TaleRs.Eof Then
		j=0
		Do While Not Talers.Eof
		InfoList=InfoList&"&nbsp;&nbsp;<a href=info.asp?action="&SStr&"&operate="&j&" alt='"&Talers("l_intro")&"'>"&Talers("l_title")&"</a>"
		Talers.MoveNext
		j=j+1
		Loop
End If
End Function
'
Public Function NewNews()
Dim TitleLen
Set Talers=Conn.Execute("Select top "&Normal(1)&"  C.l_title,C.l_id,C.l_time,C.l_top from  [ljy_info] C inner join [ljy_sort] S on S.l_id=C.l_sid  where (S.l_id=C.l_sid AND S.l_sid=0) AND ( (now > Dateadd('d',-C.l_top,C.l_time) and C.l_top>0 ) Or C.l_top=0 ) order by C.l_top desc,C.l_time desc")
If Not Talers.Eof Then
Do While NOt Talers.Eof
	If Len(Talers("l_title"))>25 Then
		TitleLen=Left(Talers("l_title"),25)&"..."
	Else
		TitleLen=Talers("l_title")
	End if
	 NewNews=NewNews&"<Div style='Height:18'>"
	 If Talers("l_top")>0 Then
		NewNews=NewNews&"<img src=image/aarr.gif  alt='置顶公告'>"
	Else
		NewNews=NewNews&"<img src=image/arr.gif>"
	End If
	 NewNews=NewNews&"&nbsp; <a target=_blank href=show.asp?id="&Talers("l_id")&" title='"&Talers("l_title")&"'>["&Year(Talers("l_time"))&"/"&Month(Talers("l_time"))&"/"&Day(Talers("l_time"))&"] "&TitleLen&"</a></dIV>"
Talers.MoveNext
Loop
End If
Set TaleRs=NoThing
End Function
'
Public Function DownList()
Dim TitleLen
Set Talers=Conn.Execute("Select top 10 l_title,l_downurl from ljy_soft where l_post=true order by l_time desc")
If Not Talers.Eof Then
Do While NOt Talers.Eof
%>
<Div style='Height:18'><img src=image/aarr.gif>
<a title='点击下载' href='
<%If Instr(Talers("l_downurl"),"http://")>0 Then
	REsponse.Write Talers("l_downurl")
Else
	Response.Write Templates.PageIndex&"/"&Templates.Normal(9)&"/"&Talers("l_downurl")
End If%>'>
<%=TaleRs("l_title")%>
</a></Div>
<%
Talers.MoveNext
Loop
End If
Set TaleRs=NoThing
End Function
'
'
End Class
'
'╋━━━━━━━━━━━━━━━━━━╋
' 类名:FileSYS
' 版本:Version 2003-10-11
'╋━━━━━━━━━━━━━━━━━━╋
'
Class FileSYS
Private Fso
Private Sub Class_Initialize()
End Sub
Private Sub Class_Terminate()
End Sub
'
Function FExist(FName,IsFolder)
FName=Server.MapPath(".")&"\"&FName
Set Fso = CreateObject("Scripting.FileSystemObject")
Select Case IsFolder
Case 1
If Fso.FolderExists(FName) then
	FExist = True
Else
	 FExist = False
	Response.Write FName
End if
Case Else
If Fso.FileExists(FName) then
	FExist = True
Else
	 FExist = False
End if
End Select
Set Fso = Nothing
End Function
'
Function CreatF(FName)
Dim Newfolder
FName=Server.MapPath(".")&"\"&FName
Set Fso = CreateObject("Scripting.FileSystemObject")
Set Newfolder = Fso.CreateFolder(FName)
CreatF = True
Set Fso = nothing
End Function
'
Function DeleteF(FName,IsFolder)
FName=Server.MapPath(".")&"\"&FName
Set Fso = CreateObject("Scripting.FileSystemObject")
Select Case IsFolder
Case 1
	If Fso.FolderExists(FName) Then
		Fso.DeleteFolder FName
		DeleteF=True
	Else
		DeleteF=False
	End If
Case Else
	If Fso.FileExists(FName) Then
		Fso.DeleteFile FName
		DeleteF=True
	Else
		DeleteF=False
	End If
End Select
Set Fso = Nothing
End Function
'
Function FSize(FName,IsFolder)
FName=Server.MapPath(".")&"\"&FName
Dim fs, f
Set fs = CreateObject("Scripting.FileSystemObject")
Select Case  IsFolder
Case 1
	Set f = fs.GetFolder(FName)
	Fsize=f.size
Case Else
	Set f = fs.GetFile(FName)
	Fsize=f.size
End Select
Set f=nothing
set fs=nothing	
End Function
'
Function MoveF(FName,ToFName,IsFolder)
FName=Server.MapPath(".")&"\"&FName
ToFName=Server.MapPath(".")&"\"&ToFName
Dim fs, f
Set fs = CreateObject("Scripting.FileSystemObject")
Select Case  IsFolder
Case 0
	fs.movefile FName,ToFName
Case Else
	fs.MoveFolder FName,ToFName
End Select
Set f=nothing
set fs=nothing	
End Function
'
Function CopyF(FName,ToFName,IsFolder)
FName=Server.MapPath(".")&"\"&FName
ToFName=Server.MapPath(".")&"\"&ToFName
Dim fs, f
Set fs = CreateObject("Scripting.FileSystemObject")
Select Case  IsFolder
Case 0
	fs.copyfile FName,ToFName
Case Else
	fs.CopyFolder FName,ToFName
End Select
Set f=nothing
set fs=nothing	
End Function
'
Function OptionImg(FolderName,FName)
Dim objFolder,objFile
OptionImg="<select name='opimg'   size=1 onChange="&CHR(34)&"document.images['imgvalue'].src='"&FolderName&"/'+options[selectedIndex].value;TaleForm.imginput.value=options[selectedIndex].value;"&CHR(34)&">"
FolderName =Server.MapPath(".")&"\"&FolderName
Set FSO = CreateObject("Scripting.FileSystemObject")
Set objFolder = FSO.GetFolder(FolderName)
i=1
For Each objFile In objFolder.Files
OptionImg=OptionImg&"<option value='"&objFile.Name&"'>"&FName&i&"</option>"
i=i+1
Next
OptionImg=OptionImg&"</select>"
Set objFolder = Nothing
Set FSO= NoThing
End Function
'
Function AdminFiles(FolderName,FName)
End Function
'
Function ReadFile(FolderName)
ReadFile=""
FolderName =Server.MapPath(".")&"\"&FolderName
dim objFSO
dim objCountFile
on error resume next
Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
Set objCountFile = objFSO.OpenTextFile(FolderName,1,True)
If Not objCountFile.AtEndOfStream Then 
	ReadFile = objCountFile.ReadAll
End if
objCountFile.Close
Set objCountFile=Nothing
Set objFSO = Nothing
End Function
'
Function FaceAndIco(TDinfo,FolderName,Fname,numi,Uwidth)
Dim objFolder,objFile,MapName,FSO,LoopNum,ThisTD
MapName =Server.MapPath(".")&"\"&FolderName
FaceAndIco="<table width='100%'  cellSpacing=1 cellPadding=10 bgcolor="&Style(4)&"><tr bgcolor="&Style(2)&">"	
Set FSO = CreateObject("Scripting.FileSystemObject")
Set objFolder = FSO.GetFolder(MapName)
i=1
For Each objFile In objFolder.Files
ThisTD=TDinfo
ThisTD=Replace(ThisTD,"{file}",objFile.Name)
ThisTD=Replace(ThisTD,"{folder}",FolderName)
ThisTD=Replace(ThisTD,"{uwidth}",UWidth)
ThisTD=Replace(ThisTD,"{fname}",Fname)
ThisTD=Replace(ThisTD,"{i}",i)
FaceAndIco=FaceAndIco&ThisTD
If i mod numi=0 Then FaceAndIco=FaceAndIco&"</tr><tr  bgcolor="&Style(2)&">"
i=i+1
Next
LoopNum = i mod numi
If LoopNum >= 0 Then
	Do While (LoopNum >= 0)
		FaceAndIco=FaceAndIco&"<td></td>"
		LoopNum=LoopNum-1
	Loop
	FaceAndIco=FaceAndIco&"</tr>"
End If
Set objFolder = Nothing
Set FSO= NoThing
FaceAndIco=FaceAndIco&"</table>"
End Function
'
Public Function CompactDB(Dbpath)
Dim fso, Engine, strDBPath
strDBPath =Server.MapPath(".")&"\"&Dbpath
Set fso = CreateObject("Scripting.FileSystemObject")
If fso.FileExists(strDBPath) Then
Set Engine = CreateObject("JRO.JetEngine")
Engine.CompactDatabase "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath, _
"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & "temp.mdb"
fso.CopyFile strDBPath & "temp.mdb",strDBPath
fso.DeleteFile(strDBPath & "temp.mdb")
Set fso = nothing
Set Engine = nothing
	CompactDB = "数据库: " & strDBPath & "，已经压缩成功!<BR><BR>"
Else
	CompactDB = "数据库名称或路径不正确. 请重试!<BR><BR>"&Templates.GetBack
End If
End Function
'
End Class
'
Class ShowDClass
Public ListMenu,MainInfo,ActionName,IOperate,ErrMsg,SID
Private ReOperate,NowDo,Rinfo,Linfo,SStr
Private Sub Class_Initialize()
MainInfo=""
Set ReOperate=New TaleStr
ReOperate.StrIn="operate{c}s{c}t{c}t"
ReOperate.StrName="具体操作"
ReOperate.RequestStr()
IOperate=ReOperate.StrOut
IOperate=ReOperate.NumStr(IOperate,0,0)
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
	ShowDate()
End Sub
'
Public Sub ShowDate()
	Set TaleRS=Conn.ExeCute("Select * From ljy_collegedata where l_sid="&SID&"")
	If Not TaleRs.Eof Then
		ListMenu=TaleRS("l_title")
		TaleRs.MoveNext
		Do While Not TaleRs.Eof 
		ListMenu=ListMenu&"|"&TaleRS("l_title")
		TaleRs.MoveNext
		Loop
	Else
		ListMenu="目前还没有记录"
	End If
	Set TaleRS=NoThing

	Dim NShow,Content
	NShow=Split(ListMenu,"|")

	If ListMenu<>"目前还没有记录" Then
	If Cint(IOperate) > Cint(Ubound(NShow)) Then IOperate=0
	Set TaleRS=Conn.ExeCute("Select Top 1 l_html,l_time,l_content From ljy_collegedata where l_title='"&NShow(IOperate)&"'")
	If Talers("l_html")=False Then
		Content=UBBCode(TaleRs("l_content"))
	Else
		Content=Replace(TaleRs("l_content"),"[upimg]","<img border=0 src='upimg/")
		Content=Replace(Content,"[/upimg]","'  align=center  onload="&Chr(34)&"javascript:if(this.width>screen.width-300)this.width=screen.width-300"&Chr(34)&">")
	End IF
	Maininfo=TableH&Pwidth&"<p>"&Content&"</P><table align=right cellSpacing=10 cellPadding=20><tr><td>资料更新:"&Talers("l_time")&"</table>"&TableF
	Set TaleRs=Nothing
	Else
		Maininfo=TableH&Pwidth&"<p>目前还无资料加入<p>"&TableF
	End IF
End Sub
'
End Class
'
'
Class ShowInfoClass
Public ListMenu,MainInfo,ActionName,IOperate,ErrMsg,SID
Private ReOperate,NowDo,Rinfo,Linfo,SStr,Currentpage,Maxrecord,Totalrecords,Npage,PageURL
Private Sub Class_Initialize()
MainInfo=""
Set ReOperate=New TaleStr
ReOperate.StrIn="operate{c}s{c}t{c}t"
ReOperate.StrName="具体操作"
ReOperate.RequestStr()
IOperate=ReOperate.StrOut
IOperate=ReOperate.NumStr(IOperate,0,0)
Set ReOperate=Nothing
End Sub
'
Private Sub Class_Terminate()
End Sub
'
Public Default Sub DoDefault()
Select Case  SID
Case 0
	ActionName="新闻动态"
	SStr="news"
Case 1
	ActionName="资讯中心"
	SStr="info"
End Select
	ShowData()
End Sub
'
Public Sub ShowData()
	Set TaleRS=Conn.ExeCute("Select * From ljy_sort where l_sid="&SID&"")
	If Not TaleRs.Eof Then
		ListMenu=TaleRS("l_title")
		TaleRs.MoveNext
		Do While Not TaleRs.Eof 
		ListMenu=ListMenu&"|"&TaleRS("l_title")
		TaleRs.MoveNext
		Loop
	Else
		ListMenu="目前还没有分类"
	End If
	Set TaleRS=NoThing

	Dim NShow
	NShow=Split(ListMenu,"|")

	If ListMenu<>"目前还没有分类" Then
	If Cint(IOperate) > Cint(Ubound(NShow)) Then IOperate=0
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
	PageUrl="info.asp?action="&SStr&"&operate="&IOperate
	TaleSQL="Select  C.l_id,C.l_time,C.l_title From [ljy_info] C inner join [ljy_sort] S on S.l_id=C.l_sid where S.l_title='"&NShow(IOperate)&"'"
	Set Talers=Server.Createobject("Adodb.recordset")
	Talers.open Talesql,Conn,1,1
	If Not Talers.Eof Then
		Maininfo="<table cellSpacing=5 cellPadding=0 width=95%  border=0 align=center>"

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
		Maininfo=TableH&Pwidth&"<p>目前还无记录<p>"&TableF
	End If
	Set TaleRs=Nothing
	Else
		Maininfo=TableH&Pwidth&"<p>目前还无分类<p>"&TableF
	End IF
	End Sub
	Private Sub ListPanel()
	Do While Not Talers.Eof 
	 Maininfo=Maininfo&"<tr><td width=450><img src=image/arr.gif>&nbsp; <a href=show.asp?id="&Talers("l_id")&" target=_blank title='"&Talers("l_title")&"'>"&Talers("l_title")&"</a></td><td>["&Year(Talers("l_time"))&"/"&Month(Talers("l_time"))&"/"&Day(Talers("l_time"))&"] </td></tr>"
	i=i+1
If i>=Maxrecord Then
	Exit Do
End if
Talers.Movenext
Loop
	End Sub
'
End Class

'
Class SInfoClass
Public ListMenu,MainInfo,ActionName,ErrMsg,Title
Private ReOperate,DID,SID
Private Sub Class_Initialize()
ActionName="相关链接"
MainInfo=""
Set ReOperate=New TaleStr
ReOperate.StrIn="id{c}s{c}t{c}t"
ReOperate.StrName="ID号"
ReOperate.RequestStr()
DID=ReOperate.StrOut
DID=ReOperate.NumStr(DID,0,0)
Set ReOperate=Nothing
End Sub
'
Private Sub Class_Terminate()
End Sub
'
Public Sub ShowData()
Dim Content,KeyWord,About
Set TaleRs=Conn.ExeCute("Select C.*,S.l_sid as sid,S.l_title as title  from [ljy_info] C inner join [ljy_sort] S on S.l_id=C.l_sid where C.l_id="&DID&"")
If Not TaleRs.Eof Then
		Title=Talers("l_title")
		KeyWord=Talers("l_keyword")
		SID=Talers("sid")
		If Talers("l_html")=False THen
			Content=UBBCode(TaleRs("l_content"))
		Else
			Content=Replace(TaleRs("l_content"),"[upimg]","<img border=0 src='upimg/")
			Content=Replace(Content,"[/upimg]","'  align=center  onload="&Chr(34)&"javascript:if(this.width>screen.width-300)this.width=screen.width-300"&Chr(34)&">")
		End IF
		DIm Info
		
       Info=Info&"<BR><div align=right><font color=#006600>所属分类："&Talers("title")&"  &nbsp;&nbsp;更新日期："&Talers("l_time")&"  &nbsp;&nbsp; 阅读次数："&Talers("l_count")&"</font><P>"
		Maininfo=Maininfo&Content& Info
		
		If InStr(KeyWord,"|")>0 Then
			KeyWord=Split(KeyWord,"|")
			About="C.l_keyword like '%"&KeyWord(0)&"%'"
			For i=1 to Ubound(KeyWord)
				About=About&"  or C.l_keyword like '%"&KeyWord(i)&"%'"
			NExt
		Else
		About="C.l_keyword like '%"&KeyWord&"%'"
		End If
		TaleSQL="Select  top 10  C.l_id,C.l_title from   [ljy_info] C inner join [ljy_sort] S on S.l_id=C.l_sid  where (S.l_sid="&SID&" and C.l_id<> "&DID&") and ("&About&") order by C.l_id desc"
		Dim AboutRS
		Set AboutRS=Conn.ExeCute(TaleSQL)
		If Not AboutRS.Eof Then
		Do While NOt AboutRS.Eof
			ListMenu=ListMenu&"<img src=image/arr.gif>&nbsp; <a href=show.asp?id="&AboutRS("l_id")&" title='"&AboutRS("l_title")&"'>"&Left(AboutRS("l_title"),12)&"</a><BR>"
			AboutRS.MoveNext
		Loop
		Else
			ListMenu=ListMenu&"<img src=image/arr.gif>&nbsp; 无相关链接"
		End IF
		Set AboutRs=Nothing
Else
	Title="该内容可能已被删除"
	Maininfo="该内容已被删除"
	ListMenu="无相关链接"
End If
Maininfo=TableH&Pwidth&Maininfo&"<p>"&TableF
Set Talers=Nothing
Conn.ExeCute("update ljy_info set l_count=l_count+1 where l_id="&DID&"")
End Sub
'
End Class
%>