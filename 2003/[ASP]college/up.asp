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
<TD height=25 align=center>&nbsp;<font color=#EEEEEE>&nbsp;��ע�����&nbsp;&nbsp;</font></td>
</TR>
   <TR>
    <TD background=image/dotlineh.gif  height=1></TD>
  </TR>
<TR><TD>

	   <TABLE cellSpacing=10 cellPadding=0 width=95% border=0>
	   <TR><TD  valign=top>
<p>�ϴ��ļ���С���ܳ���:<font color=#006600><%=Templates.Normal(7)%>KB</font><BR>
ֻ���ϴ���ʽΪ:<font color=#006600><%=Replace(Templates.Normal(6),"|",",")%></font><BR>
�μ���ַ����ͨ��<font color=#006600>�ϴ��μ�ȡ��</font><BR>
��Ҳ����<font color=#006600>ֱ���ڵ����������ص�ַ</font><BR>
�ϴ���μ��Ժ�,�辭������Ա��˺󷽿�����<BR>
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
<Div style="Height:28" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<Span class=fontdrop>�ϴ��μ�&nbsp;<img src=image/arrb.gif></Span></dIV>
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

