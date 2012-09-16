<!--#include file="conn.asp"-->
<!--#include file="inc/normalclass.asp"-->
<!--#include file="inc/ubb.asp"-->
<%
Set Templates=New Template
Call Templates.HeadHTML
Call Templates.HeadJS
Call Templates.NormalTOP
Set ReAction=New TaleStr
ReAction.StrIn="action{c}s{c}t{c}t{c}operate{c}s{c}t{c}t"
ReAction.StrName="操作|*Tale*|当前操作"
ReAction.RequestStr()
Action=ReAction.StrOut(0)
OnClick=ReAction.NumStr(ReAction.StrOut(1),1,0)
Set ReAction=Nothing
'----------------
Select Case Action
Case "news"
	Set TaleClass=New ShowInfoClass
	TaleClass.SID=0
Case "info"
	Set TaleClass=New ShowInfoClass
	TaleClass.SID=1
Case Else
	Set TaleClass=New ShowInfoClass
	TaleClass.SID=0
End Select
Taleclass()
%>
<!---------------------------------------------Left Start (width:200px)----------------------------------------->
   <TABLE cellSpacing=0 cellPadding=0 width=100%  border=0>
    <TR>
    <TD  background=image/dotlineh.gif  height=1></TD>
	</TR>
  <TR  bgcolor=#006600>
<TD height=25 align=center>&nbsp;<font color=#EEEEEE>&nbsp;「<%=TaleClass.ActionName%>」&nbsp;&nbsp;</font></td>
</TR>
   <TR>
    <TD background=image/dotlineh.gif  height=1></TD>
  </TR>
<TR><TD>

	   <TABLE cellSpacing=10 cellPadding=0 width=95% border=0>
	   <TR><TD  valign=top>
<%=Templates.LeftMenu (TaleClass.ListMenu,OnClick,Action)%>
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
<Div style="Height:28" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<Span class=fontdrop><%=ClickName%>&nbsp;<img src=image/arrb.gif></Span></dIV>
<%=Taleclass.MainInfo%>
	  	</TD>
  </TR>
</TABLE>
<!--------------------------------------------------Main Over--------------------------------------------->
<%
Set TaleClass=NoThing
Call Templates.FootHTML
Set Templates=Nothing
%>

