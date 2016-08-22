<!--#include file="conn.asp"-->
<!--#include file="inc/normalclass.asp"-->
<!--#include file="inc/ubb.asp"-->
<%
Set Templates=New Template
Call Templates.HeadHTML
Call Templates.HeadJS
Call Templates.NormalTOP
Set TaleClass=New SInfoClass
Call TaleClass.ShowData
%>
<!---------------------------------------------Left Start (width:200px)----------------------------------------->
   <TABLE cellSpacing=0 cellPadding=0 width=100%  border=0>
    <TR>
    <TD  background=image/dotlineh.gif  height=1></TD>
	</TR>
  <TR  bgcolor=#006600>
<TD height=25 align=center>&nbsp;<font color=#EEEEEE>&nbsp;¡¸<%=TaleClass.ActionName%>¡¹&nbsp;&nbsp;</font></td>
</TR>
   <TR>
    <TD background=image/dotlineh.gif  height=1></TD>
  </TR>
<TR><TD>

	   <TABLE cellSpacing=10 cellPadding=0 width=95% border=0>
	   <TR><TD  valign=top>
<%=TaleClass.ListMenu%>
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
<Div style="Height:28" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<Span class=fontdrop><%=Taleclass.Title%>&nbsp;<img src=image/arrb.gif></Span></dIV>
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

