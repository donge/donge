<!--#include file="conn.asp"-->
<!--#include file="inc/normalclass.asp"-->
<%
Set Templates=New Template
NowTitle="��ҳ"
Call Templates.HeadHTML
Call Templates.HeadJS

%><SCRIPT language=JavaScript>function HelpArray(len){this.length=len;} HelpText = new HelpArray(3);HelpText[0] =' ';HelpText[1] ='&nbsp;&nbsp;&nbsp;�Ͻ� ��ʵ';HelpText[2] ='&nbsp;&nbsp;&nbsp;�ڷ� ����';ScriptText = new HelpArray(3);HelpText2 = new HelpArray2(3);HelpText2[0] ="<img border='0' width='760' height='150' src='1.gif' alt='1' onload=''>";HelpText2[1] ="<img border='0' width='760' height='150' src='2.gif' alt='2' onload=''>";HelpText2[2] ="<img border='0' width='760' height='150' src='3.gif' alt='3' onload=''>";ScriptText2 = new HelpArray2(3);var i = 0;function playHelp(){if (i == 2) 	{		i = 0;	}	else	{		i++;	}	div1.filters[0].apply();	div1.innerHTML = HelpText[i];	div1.filters[0].play();	div2.filters[0].apply();	div2.innerHTML = HelpText2[i];	div2.filters[0].play();			mytimeout = setTimeout('playHelp()',10000);}function HelpArray(len) {	this.length=len;}function HelpArray2(len) {this.length=len;}</SCRIPT>
<TABLE width="760" height="150"  align=center cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
 <TR >
  <TD><DIV id=playerDiv></DIV><DIV id=pageViewCell style="DISPLAY: none"></DIV><SPAN style="WIDTH: 760px; HEIGHT: 150px"><SPAN 
                  style="Z-INDEX: 3; LEFT: 841px; WIDTH: 26px; CURSOR: hand; POSITION: absolute; TOP: 12px; HEIGHT: 26px" 
                  onclick=clearTimeout(mytimeout);><IMG 
                  src="Pause-default.gif" 
                  alt=Pause width="26" height="26" 
                  border=0 
                  onmouseover="this.src='Pause-hover.gif';" 
                  onmouseout="this.src='Pause-default.gif';"></SPAN><SPAN 
                  style="Z-INDEX: 3; LEFT: 811px; WIDTH: 26px; CURSOR: hand; POSITION: absolute; TOP: 12px; HEIGHT: 26px" 
                  onclick=clearTimeout(mytimeout);playHelp();><IMG 
                  src="Next-default.gif" 
                  alt=Next width="22" height="22" 
                  border=0 
                  onmouseover="this.src='Next-hover.gif';" 
                  onmouseout="this.src='Next-default.gif';"></SPAN></SPAN><SPAN 
                  style="Z-INDEX: 2; WIDTH: 760px; POSITION: absolute; HEIGHT: 150px; left: 121px; top: 0;">
  <TABLE 
                  style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-COLLAPSE: collapse; BORDER-RIGHT-WIDTH: 0px" 
                  cellSpacing=0 cellPadding=0 border=0><TBODY><TR>
                      <TD><TABLE style="HEIGHT: 20px" cellPadding=0 border=0 
                        TrackingId="MN">
                        <TBODY>
                          <TR>
                            <TD style="WIDTH: 431px">
                              <TABLE style="BORDER-COLLAPSE: collapse" 
                                cellSpacing=0 cellPadding=2 border=0>
                                <TBODY>
                                  <TR>
                                    <TD width="8" vAlign=bottom noWrap>&nbsp;</TD>
                                    <TD width="413" vAlign=bottom noWrap><span style="font-family: Tahoma; font-size: 14px; font-weight: bold; color: #006600;">Information Technology &amp; Engineering</span></TD></TR>
                                  <TR>
                                    <TD vAlign=bottom noWrap>&nbsp;</TD>
                                    <TD vAlign=bottom noWrap><img src="sy.gif" width="200" height="40"></TD>
                                  </TR>
                                  <TR>
                                    <TD colspan="2" vAlign=bottom noWrap>   <img src="xinxi.gif" width="300" height="40"></TD>
                                  </TR>
                                </TBODY>
                              </TABLE>                               
                              <TABLE style="BORDER-COLLAPSE: collapse" 
                              cellSpacing=0 cellPadding=0 border=0>
                                <TBODY>
                                  <TR>
                                    <TD style="CURSOR: hand">&nbsp;</TD>
                                  </TR>
                                </TBODY>
                            </TABLE></TD>
                          </TR>
                        </TBODY>
                      </TABLE></TD>
                    </TR>
                    <TR>
                      <TD>
                      </TD></TR>
                    <TR>
                      <TD vAlign=top><SCRIPT>var mytimeout;</SCRIPT><SPAN id=div1 
                        style="PADDING-LEFT: 5px; Z-INDEX: 1; FILTER: progid:DXImageTransform.Microsoft.Fade(duration=1,overlap=0); POSITION: absolute">
                      </SPAN></TD>
                    </TR></TBODY></TABLE></SPAN>
								<SPAN 
                  id=div2 
                  style="FILTER: progid:DXImageTransform.Microsoft.Wipe(duration=3, gradientsize=0.25,motion=reverse ); WIDTH: 760px; POSITION: absolute; HEIGHT: 150px; left: 122; top: 0;"><IMG height=150 
                  src="1.gif" 
                  width=760 onload='mytimeout = setTimeout("playHelp()",5000);' 
                  border=0></SPAN></TD>
 </TR>
</TABLE>
<TABLE width=760  border=0 align="center" cellPadding=0 cellSpacing=0>
    <TR>
    <TD  background=image/dotlineh.gif  height=1 colspan=20></TD>
	</TR>
  <TR  bgcolor=#006600>
  <TD width=18><img src=image/menu.gif></td>
<TD width=80 height=27 align=center bgcolor="#006600"><a href=default.asp class=head><img src=image/arrow.gif border=0>�� ҳ</a></td>
<TD width=80><a href=info.asp class=head><img src=image/arrow.gif border=0>���Ŷ�̬</a></td>
<TD width=80><a href=intro.asp class=head><img src=image/arrow.gif border=0>ѧԺ����</a></td>
<TD width=80><a href=intro.asp?action=edu class=head><img src=image/arrow.gif border=0>���л</a></td>
<TD width=80 bgcolor="#006600"><a href=intro.asp?action=build class=head><img src=image/arrow.gif border=0>��ѧ����</a></td>
<TD width=80><a href=intro.asp?action=stu class=head><img src=image/arrow.gif border=0>ѧ������</a></td>
<TD width=80 bgcolor="#006600"><a href=info.asp?action=info class=head><img src=image/arrow.gif border=0>��Ѷ����</a></td>
<TD width=80><a href=down.asp class=head><img src=image/arrow.gif border=0>�μ�����</a></td>
<TD width=80><a href=http://www.sut.edu.cn target=_blank class=head><img src=image/arrow.gif border=0>����У��</a></td>
<TD Width=*>&nbsp;</td>
</TR>
</TABLE>
<TABLE width=760  border=0 align="center" cellPadding=0 cellSpacing=0 bgcolor=#EEEEEE>
   <TR>
    <TD background=image/dotlineh.gif  height=1 colspan=10></TD>
  </TR>
     <TR>
  <TD height=20 align=left>

  </TD>
  </TR>
</TABLE>

<TABLE width=760 height=400  border=0 align="center" cellPadding=0 cellSpacing=0>
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
    <TD valign=top width=185 align=right><p align="left"><br>
        <Span style="FONT-SIZE: 14px; FILTER: dropshadow(color=#cccccc,offx=1,offy=1); WIDTH: 200; COLOR: #006600; POSITION: relative; font-family: Tahoma;">&nbsp;&nbsp;&nbsp;&nbsp;<img src="image/listd.gif" width="25" height="29"> �� ���Ź��� / News &nbsp;</Span></p>
      <p align="center"><img src="image/1.jpg" width="145" height="95"><br>�������ͼƬ</p></TD>
	  <TD valign=top align=left width=300>
	   <Div style="Height:18"></dIV>
	  <%=Templates.NewNews%>
		<Div style="Height:18">
		  <div align="right"><a href=info.asp><br>
		    <img src=image/more.gif border=0 alt="��������"></a></div>
		</dIV>
		</TD>
		<TD width=*>&nbsp;
	   </TD>
	  <TR>
<TD  height=200 colspan=10 valign=top><div align="center">
  <table width="468" height="60" border="0" cellpadding="0" cellspacing="10">
    <tr>
      <td background="new.gif"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="468" height="60">
        <param name="movie" value="top.swf">
        <param name="quality" value="high">
		<PARAM NAME="wmode" VALUE="transparent">
        <embed src="top.swf" width="468" height="60" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash"></embed>
      </object></td>
    </tr>
  </table>
  </div>
  <p><Span style="FONT-SIZE: 14px; FILTER: dropshadow(color=#cccccc,offx=1,offy=1); WIDTH: 200; COLOR: #006600; POSITION: relative; font-family: Tahoma;">&nbsp;&nbsp;&nbsp;&nbsp;<img src="image/listd.gif" width="25" height="29"> �� վ�ڵ��� / Navigation</Span></p>
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
  <TABLE cellSpacing=10 cellPadding=0 width=95%  border=0>
    <TR>
      <TD background=image/tline.gif  height=1></TD>
    </TR>
    <TR>
      <TD>
        <p> <a href="chengji/index.asp" target="_blank">ѧ���������ɼ�����ϵͳ</a> <a href="office/default.asp" target="_blank" >��ʦ����칫OAϵͳ</a></TD>
    </TR>
  </Table></TD>
  </TR>
  </Table>

</TD>
  <TD width=1 background=image/line.gif></TD>
 <TD valign=top width=200 bgcolor=#EEEEEE>
<table cellSpacing=10 cellPadding=1 Style="color:#006600" width=95% align=center>
<tr><td><span style="font-size: 12px">��ӭ�� <b><%=Templates.Stat%> </b>λ���ѵ����ã�</span></td>
</tr>
<tr><td>
<%Response.Write "<b>"&Year(Now)&"</b>��<b>"&Month(Now)&"</b>��<b>"&Day(Now)&"</b>��<b>"&Hour(Now)&"</b>ʱ<b>"&Minute(Now)&"</b>��"%>
</td>
</tr>
</table>   <Span style="FONT-SIZE: 14px; FILTER: dropshadow(color=#cccccc,offx=1,offy=1); WIDTH: 200; COLOR: #006600; POSITION: relative; font-family: Tahoma;">&nbsp;&nbsp;&nbsp;&nbsp;<img src="right.gif" width="20" height="20"> ѧ������ / BBS&nbsp;</Span>   <table cellSpacing=5 cellPadding=1 Style="color:#006600" width=95% align=center>
      <form action="bbsxp/login.asp" method="post" target="_blank">
        <tr>
          <td>
            <input type="hidden" value="add" name="menu">
            <input type="hidden" value="main.asp" name="url">
          �û�����:
          <input size="15" name="username" value="">
          </td>
        </tr>
        <tr>
          <td>�û�����:
              <input type="password" size="15" value name="userpass"></td>
        </tr>
        <tr>
          <td><div align="center">
              <input type="checkbox" value="1" name="eremite" id="eremite2">
              <label for="eremite2">�����¼</label>
              <input type="checkbox" value="1" name="xuansave" id="xuansave3">
            <label for="xuansave3">��ס����</label>
          </div></td>
        </tr>
        <tr>
          <td><div align="center">
              <label for="eremite">
              <input type="submit" value=" ��¼ " name="Submit1">
              <input type="reset" value=" ȡ�� " name="Submit">
              </label>
          </div></td>
        </tr>
      </form>
   </table><Span style="FONT-SIZE: 14px; FILTER: dropshadow(color=#cccccc,offx=1,offy=1); WIDTH: 200; COLOR: #006600; POSITION: relative; font-family: Tahoma;">&nbsp;&nbsp;&nbsp;&nbsp;<img src="right.gif" width="20" height="20"> �μ����� / Downloads &nbsp;</Span>
   <table cellSpacing=10 cellPadding=1>
<tr><td>
<%=Templates.DownList()%>
</td>
</tr>
</table>
   <Span style="FONT-SIZE: 14px; FILTER: dropshadow(color=#cccccc,offx=1,offy=1); WIDTH: 200; COLOR: #006600; POSITION: relative; font-family: Tahoma;">&nbsp;&nbsp;&nbsp;&nbsp;<img src="right.gif" width="20" height="20"> �ȵ�ͶƱ / Vote&nbsp;</Span>
   <div align="center"></div>
<table cellSpacing=0 cellPadding=1 Style="color:#006600" width=95% align=center>
  <tr>
    <td><iframe frameborder=0 scrolling=no width=100% height=190 src=vote/index.asp></iframe></td>
  </tr>
</table>
<Span style="FONT-SIZE: 14px; FILTER: dropshadow(color=#cccccc,offx=1,offy=1); WIDTH: 200; COLOR: #006600; POSITION: relative; font-family: Tahoma; left: 1px;">&nbsp;&nbsp;&nbsp;&nbsp;<img src="right.gif" width="20" height="20"> �������� / Links&nbsp;</Span>
<table width="100%" cellPadding=1 cellSpacing=10>
  <tr>
    <td><div align="center">
      <SELECT style="border:1px solid #000000; WIDTH: 120; BACKGROUND-COLOR: #F7F7F7;" onchange=javascript:window.open(this.options[this.selectedIndex].value) size=3 name=wangy>
          <option value="http://www.sut.edu.cn">������ҵ��ѧ</option>
          <option value="http://www.163.com">����</option>
          <option value="http://www.sina.com">����</option>
          <option value="http://www.sohu.com">�Ѻ�</option>
      </SELECT> 
    </div></td>
  </tr>
</table></TD>
  </TR>
</TABLE>
<!--------------------------------------------------Main Over--------------------------------------------->
<%
Call Templates.FootHTML
Set Templates=Nothing
%>

