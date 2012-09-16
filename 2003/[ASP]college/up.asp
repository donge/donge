<!--#include file="conn.asp"-->
<!--#include file="inc/normalclass.asp"-->
<!--#include file="inc/adminclass.asp"-->
<!--#include file="inc/ubb.asp"-->
<%
Set Templates=New Template
Call Templates.NoThisPost()
Call Templates.HeadHTML
Call Templates.HeadJS
Call Templates.NormalTOP
Set TaleClass=New DownClass
Call TaleClass.PostSoft()
%>
<!---------------------------------------------Left Start (width:200px)----------------------------------------->
   <TABLE cellSpacing=0 cellPadding=0 width=100%  border=0>
    <TR>
    <TD  background=image/dotlineh.gif  height=1></TD>
	</TR>
  <TR  bgcolor=#006600>
<TD height=25 align=center>&nbsp;<font color=#EEEEEE>&nbsp;「注意事项」&nbsp;&nbsp;</font></td>
</TR>
   <TR>
    <TD background=image/dotlineh.gif  height=1></TD>
  </TR>
<TR><TD>

	   <TABLE cellSpacing=10 cellPadding=0 width=95% border=0>
	   <TR><TD  valign=top>
<p>上传文件大小不能超过:<font color=#006600><%=Templates.Normal(7)%>KB</font><BR>
只能上传格式为:<font color=#006600><%=Replace(Templates.Normal(6),"|",",")%></font><BR>
课件地址可能通过<font color=#006600>上传课件取得</font><BR>
您也可以<font color=#006600>直接在地栏输入下载地址</font><BR>
上传完课件以后,需经过管理员审核后方可下载<BR>
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
<Div style="Height:28" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<Span class=fontdrop>上传课件&nbsp;<img src=image/arrb.gif></Span></dIV>
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

