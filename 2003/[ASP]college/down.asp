<!--#include file="conn.asp"-->
<!--#include file="inc/normalclass.asp"-->
<!--#include file="inc/ubb.asp"-->
<%
Set Templates=New Template
Call Templates.HeadHTML
Call Templates.HeadJS
Call Templates.NormalTOP
%>
<!---------------------------------------------Left Start (width:200px)----------------------------------------->
   <TABLE cellSpacing=0 cellPadding=0 width=100%  border=0>
    <TR>
    <TD  background=image/dotlineh.gif  height=1></TD>
	</TR>
  <TR  bgcolor=#006600>
<TD height=25 align=center>&nbsp;<font color=#EEEEEE>&nbsp;������������ء�&nbsp;&nbsp;</font></td>
</TR>
   <TR>
    <TD background=image/dotlineh.gif  height=1></TD>
  </TR>
<TR><TD>

	   <TABLE cellSpacing=10 cellPadding=0 width=95% border=0>
	   <TR><TD  valign=top>
	   <Div style="Height:25" ><img src=image/darr.gif>&nbsp;&nbsp;<a href=# class=list>NetAnts</a></Div>
	   <Div style="Height:25" ><img src=image/darr.gif>&nbsp;&nbsp;<a href=# class=list>FlashGet</a></Div>
	   <Div style="Height:25" ><img src=image/darr.gif>&nbsp;&nbsp;<a href=# class=list>WinRAR</a></Div>
	   <Div style="Height:25" ><img src=image/darr.gif>&nbsp;&nbsp;<a href=# class=list>WinZip</a></Div>
	   <Div style="Height:25" ><img src=image/darr.gif>&nbsp;&nbsp;<a href=# class=list>FLashPlayer </a></Div>
	   <Div style="Height:25" ><img src=image/darr.gif>&nbsp;&nbsp;<a href=# class=list>HotMail </a></Div>
	   </TD></TR>
	   </Table>

  </Table>

  
<!---------------------------------------------Left Over-------------------------------------------------->	
<%Call Templates.BodyLine%>
<!---------------------------------------------Main Start-------------------------------------------------->
<TABLE cellSpacing=0 cellPadding=0 width=100%  border=0 height=400 bgcolor=#FFFFFF>
   <TR>
   <TD width=15>&nbsp;</TD>
	  <TD valign=top>
	   <Div style="Height:28"><Span class=fontdrop><img src=image/download.gif></Span></dIV>
	   <%
	   Dim Currentpage,Maxrecord,Totalrecords,Npage,PageURL
	   TaleSql="Select * from ljy_soft where l_post=true order by l_time desc"
	 Currentpage=Trim(Request("page"))
Maxrecord=5
If Currentpage<>"" then
	If isnumeric(Currentpage)=True then
        		Currentpage=Currentpage
	Else
        		Currentpage=1
	End if
Else
Currentpage=1
End if
	PageUrl="down.asp?down=1"
Set Talers=Server.Createobject("Adodb.recordset")
	Talers.open Talesql,Conn,1,1
	If Not Talers.Eof Then
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
Else
	Response.Write TableH&Pwidth&"Ŀǰ��û�пμ��ṩ����"&TableF
End IF
Response.Write Templates.ListPages("�μ�",PageUrl,Totalrecords,MaxRecord,Npage,Currentpage)
Sub ListPanel()
Do While Not Talers.Eof 
%>
<BR>
<TABLE cellSpacing=1 cellPadding=5 width=100%  border=0  bgcolor=#006600>
<tr bgcolor=#FFFFFF><td width=200 height=30>�μ����ƣ�<font color=#006600><%=Talers("l_title")%></font></td><td width=120>�μ���С��<font color=#006600><%=Talers("l_size")%> KB</font></td><td width=*>�ϴ�ʱ�䣺<font color=#006600><%=Talers("l_time")%></font></td></tr>
<tr bgcolor=#FFFFFF><td width=200><a href='
<%If Instr(Talers("l_downurl"),"http://")>0 Then
	REsponse.Write Talers("l_downurl")
Else
	Response.Write Templates.PageIndex&"/"&Templates.Normal(9)&"/"&Talers("l_downurl")
End If%>'><img src=image/down.gif border=0 alt='������ؿμ�'></a></td><td colspan=2>�μ��ṩ��<a href='mailto:<%=Talers("l_email")%>' class=list title="��ϵ�μ��ṩ��"><%=Talers("l_postman")%></a></td></tr>
<tr bgcolor=#FFFFFF><td colspan=3>�μ����ܣ�<BR><%=UbbCode(Talers("l_intro"))%></td></tr>
</Table>
<%
	i=i+1
If i>=Maxrecord Then
	Exit Do
End if
Talers.Movenext
Loop
End Sub%>
		</TD>
		<TD width=30>&nbsp;
	   </TD>
</TR>
	 <TR>
    <TD background=image/tline.gif  height=1 Colspan=10></TD>
  </TR>
<TR><TD Colspan=10 height=30>
<Font color=#006600>&nbsp;&nbsp;&nbsp;��������FlashGet��NetAnts���أ����������Ч�ʣ����Ҫ�ϴ��μ�����&nbsp;&nbsp;��<a href=up.asp class=list>�ϴ��μ�</a>��</DIV>
</TD></TR>
</TABLE>

<!--------------------------------------------------Main Over--------------------------------------------->
<%
Call Templates.FootHTML
Set Templates=Nothing
%>

