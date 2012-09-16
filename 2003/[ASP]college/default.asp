<!--#include file="conn.asp"-->
<!--#include file="inc/normalclass.asp"-->
<%
Set Templates=New Template
NowTitle="首页"
Call Templates.HeadHTML
Call Templates.HeadJS

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
       <TD valign=top>
  <TABLE cellSpacing=0 cellPadding=0 width=100%  border=0 bgcolor=#FFFFFF>
   <TR>
    <TD background=image/tline.gif  height=1 colspan=10></TD>
  </TR>

</TABLE>
<!---------------------------------------------Main Start-------------------------------------------------->
<TABLE cellSpacing=10 cellPadding=0 width=100%  border=0 height=400 bgcolor=#FFFFFF>
   <TR>
    <TD valign=top width=185 align=right><img src=image/new.gif></TD>
	  <TD valign=top align=left width=300>
	   <Div style="Height:18"></dIV>
	  <%=Templates.NewNews%>
		<Div style="Height:18">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=info.asp><img src=image/more.gif border=0 alt="μ??÷???á?ü?àD???1???"></a></dIV>
		</TD>
		<TD width=*>&nbsp;
	   </TD>
	  <TR>
<TD  height=200 colspan=10 valign=top>&nbsp;&nbsp;<img src=image/navigation.gif>
<TABLE cellSpacing=10 cellPadding=0 width=95%  border=0>
	 <TR>
    <TD background=image/tline.gif  height=1></TD>
  </TR>
	 <TR>
    <TD height=60 valign=top>
	<p>
	<%=Templates.InfoList(0)%>
	<%=Templates.IntroList(0)%>
	<%=Templates.IntroList(1)%>
	<%=Templates.IntroList(2)%>
	<%=Templates.IntroList(3)%><BR>
	<%=Templates.InfoList(1)%>
	</TD>
  </TR>
  </Table>
	</TD>
  </TR>
  </Table>

</TD>
  <TD width=1 background=image/line.gif></TD>
   

 <TD valign=top width=200 bgcolor=#EEEEEE>
<table cellSpacing=10 cellPadding=1 Style="color:#006600" width=95% align=center>
<tr><td>欢迎第 <b><%=Templates.Stat%> </b>位朋友的来访！</td>
</tr>
<tr><td>
<%Response.Write "<b>"&Year(Now)&"</b>年<b>"&Month(Now)&"</b>月<b>"&Day(Now)&"</b>日<b>"&Hour(Now)&"</b>时<b>"&Minute(Now)&"</b>分"%>
</td>
</tr>
</table>

<center><img src=image/download.gif></center>
<table cellSpacing=10 cellPadding=1>
<tr><td>
<%=Templates.DownList()%>
</td>
</tr>
</table>
</TD>
  </TR>
</TABLE>
<!--------------------------------------------------Main Over--------------------------------------------->
<%
Call Templates.FootHTML
Set Templates=Nothing
%>

