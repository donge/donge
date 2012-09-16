<!--#include file="conn.asp"-->
<!--#include file="inc/normalclass.asp"-->
<!--#include file="inc/adminclass.asp"-->
<!--#include file="inc/md5.asp"-->
<%
Set ReAction=New TaleStr
ReAction.StrIn="action{c}s{c}t{c}t{c}operate{c}s{c}t{c}t"
ReAction.StrName="操作|*Tale*|当前操作"
ReAction.RequestStr()
Action=ReAction.StrOut(0)
OnClick=ReAction.NumStr(ReAction.StrOut(1),1,0)
Set ReAction=Nothing
Set Templates=New Template
NowTitle="系统维护"
Call Templates.HeadHTML
Call Templates.HeadJS
Set TaleRS=New AdminID
TaleRS()
Set TaleRS=NoThing

'----------------
Select Case Action
Case "new"
	Set TaleClass=New AClass
	TaleClass.SID=0
Case "info"
	Set TaleClass=New AClass
	TaleClass.SID=1
Case "intro"
	Set TaleClass=New DataClass
	TaleClass.SID=0
Case "edu"
	Set TaleClass=New DataClass
	TaleClass.SID=1
Case "build"
	Set TaleClass=New DataClass
	TaleClass.SID=2
Case "stu"
	Set TaleClass=New DataClass
	TaleClass.SID=3
Case "down"
	Set TaleClass=New DownClass
Case Else
Set Taleclass=New IndexClass
End Select
Taleclass()
if TaleClass.ErrMsg<>"" Then
	Templates.Info "信息提示",TaleClass.ErrMsg&"<li>"&Templates.GetBack,""
	Response.End
End If
Call Templates.AdminTOP
%>
<!---------------------------------------------Left Start (width:200px)----------------------------------------->
   <TABLE cellSpacing=0 cellPadding=0 width=100%  border=0>
    <TR>
    <TD  background=image/dotlineh.gif  height=1></TD>
	</TR>
  <TR  bgcolor=#006600>
<TD height=25 align=center>&nbsp;<font color=#EEEEEE>√&nbsp;<%=TaleClass.ActionName%>&nbsp;&nbsp;</font></td>
</TR>
   <TR>
    <TD background=image/dotlineh.gif  height=1></TD>
  </TR>
<TR><TD>

	   <TABLE cellSpacing=10 cellPadding=0 width=95% border=0>
	   <TR><TD  valign=top>
<%=Templates.LeftMenu (TaleClass.AdminMenu,OnClick,Action)%>
	   </TD></TR>
	   </Table>
</TD></TR>
  </Table>


<!---------------------------------------------Left Over-------------------------------------------------->	
<%Call Templates.BodyLine%>
<!---------------------------------------------Main Start-------------------------------------------------->
<TABLE cellSpacing=0 cellPadding=0 width=100%  border=0 height=400 bgcolor=#FFFFFF>
   <TR>
	  <TD valign=top>
<Div style="Height:28" align=center><Span class=fontdrop><%=ClickName%>&nbsp;<img src=image/arrb.gif></Span></dIV>
<%=Taleclass.MainInfo%>
	  	</TD>
  </TR>
</TABLE>
<!--------------------------------------------------Main Over--------------------------------------------->
<%
Set TaleClass=NoThing
Call Templates.AdminFoot
Set Templates=Nothing
%>