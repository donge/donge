<%
sub webhead()
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
%>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="0" align="left">
  <tr bgcolor="#FFFFFF"> 
    <td width="40%" height="0"><img src="image/logo.gif" width="320" height="70"></td>
    <td width="60%" height="0" valign="bottom"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td>
            <table border="0" width="100%" cellspacing="0" cellpadding="0" align="right">
              <tr> 
                <td width="17%" align=center>部门：<%=oabusyuserdept%></td>
                <td width="19%" align=center>姓名：<%=oabusyname%></td>
                <td width="18%" align=center>职位：<%=oabusyuserlevel%></td>
                <td width="24%" align=center> 
                  <script language="JavaScript">
<!---
   today=new Date();

	 
   function initArray(){
	 this.length=initArray.arguments.length
	 for(var i=0;i<this.length;i++)
	 this[i+1]=initArray.arguments[i]  }
	 
  var d=new initArray("<font color=RED>星期日","<font color=black>星期一","<font color=black>星期二","<font color=black>星期三","<font color=black>星期四","<font color=black>星期五","<font color=GREEN>星期六"); 

  document.write(today.getYear(),"年",today.getMonth()+1,"月",today.getDate(),"日",d[today.getDay()+1]);  

//-->
</script>
                </td>
                <td width="22%" align=center> 
                  <table>
                    <tr> 
                      <td bgcolor=black align="center" valign="middle" height=21> 
                        <img src="images/time/space.gif" width=16 height=21 alt="clock" name="one"><img src="images/time/space.gif" width=16 height=21 alt="clock" name="two"><img src="images/time/space.gif" width=14 height=21 alt="clock" name="three"><img src="images/time/space.gif" width=16 height=21 alt="clock" name="four"><img src="images/time/space.gif" width=16 height=21 alt="clock" name="five"><img src="images/time/space.gif" width=16 height=21 alt="clock" name="six"> 
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr> 
          <td><img src="image/tetle.gif" width="476" height="20" usemap="#Map" border="0" target="_top"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
  <%
end sub
%>
</p>
<map name="Map"> 
  <area shape="rect" coords="11,1,81,18" href="left.asp" target="contents">
  <area shape="rect" coords="88,1,168,18" href="setting.asp" target="contents">
  <area shape="rect" coords="172,2,240,18" href="http://127.0.0.1" target="_blank">
  <area shape="rect" coords="248,3,319,19" href="gensystem.asp" target="contents">
  <area shape="rect" coords="325,2,393,17" href="helpleft.asp" target="contents">
  <area shape="rect" coords="400,3,467,17" href="logout.asp" target="_top">
</map>
