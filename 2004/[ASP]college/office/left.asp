
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/sqlstr.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0036)http://192.168.10.1/eoffice/left.asp -->
<HTML><HEAD><TITLE>网络办公系统</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 5.50.4134.600" name=GENERATOR>
<META content=FrontPage.Editor.Document name=ProgId><LINK 
href="left.files/css.css" rel=stylesheet>
<!-- Ooulook JavaScript 程序开始部份--> 	
<script language="JavaScript" src="css/outlook-like.js"></script>
<SCRIPT language=JavaScript1.2>
<!--
scores = new Array(20);
var numTotal=0;
NS4 = (document.layers) ? 1 : 0;
IE4 = (document.all) ? 1 : 0;
ver4 = (NS4 || IE4) ? 1 : 0;

if (ver4) {    with (document) {        write("<STYLE TYPE='text/css'>");        if (NS4) {            write(".parent {position:absolute; visibility:visible}");            write(".child {position:absolute; visibility:visible}");            write(".regular {position:absolute; visibility:visible}")        }        else {            write(".child {display:none}")        }        write("</STYLE>");    }}



function getIndex(el) {    ind = null;    for (i=0; i<document.layers.length; i++) {        whichEl = document.layers[i];        if (whichEl.id == el) {            ind = i;            break;        }    }    return ind;}


function arrange() {    nextY = document.layers[firstInd].pageY +document.layers[firstInd].document.height;    for (i=firstInd+1; i<document.layers.length; i++) {        whichEl = document.layers[i];        if (whichEl.visibility != "hide") {            whichEl.pageY = nextY;            nextY += whichEl.document.height;        }    }}function initIt(){    if (!ver4) return;    if (NS4) {        for (i=0; i<document.layers.length; i++) {            whichEl = document.layers[i];            if (whichEl.id.indexOf("Child") != -1) whichEl.visibility = "hide";       }        arrange();    }    else {        divColl = document.all.tags("DIV");        for (i=0; i<divColl.length; i++) {            whichEl = divColl(i);            if (whichEl.className == "child") whichEl.style.display = "none";        }    }}


function expandIt(el) {	if (!ver4) return;    if (IE4) {        whichEl1 = eval(el + "Child");		for(i=1;i<=numTotal;i++){			whichEl = eval(scores[i] + "Child");			if(whichEl!=whichEl1) {				whichEl.style.display = "none";			}		}        whichEl1 = eval(el + "Child");        if (whichEl1.style.display == "none") {            whichEl1.style.display = "block";        }        else {            whichEl1.style.display = "none";        }    }    else {        whichEl = eval("document." + el + "Child");		for(i=1;i<=numTotal;i++){			whichEl = eval("document." + scores[i] + "Child");			if(whichEl!=whichEl1) {				whichEl.visibility = "hide";			}		}        if (whichEl.visibility == "hide") {            whichEl.visibility = "show";        }        else {            whichEl.visibility = "hide";        }        arrange();    }}



onload = initIt;

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && document.getElementById) x=document.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</SCRIPT>
<link rel="stylesheet" href="9pp.css" type="text/css">
</HEAD>
<BODY bgColor=3F6090 leftMargin=0 topMargin=0 marginwidth="0" marginheight="0" onLoad="MM_preloadImages('image/menu1-1-b.gif','image/menu1-2-b.gif','image/menu2-1-b.gif','image/menu2-2-b.gif','image/menu2-3-b.gif','image/menu3-1-b.gif','image/menu3-2-b.gif','image/menu3-3-b.gif','image/menu3-4-b.gif','image/menu5-1-b.gif','image/menu5-2-b.gif','image/menu5-3-b.gif','image/menu6-1-b.gif','image/menu6-2-b.gif')" link="#336699" vlink="#336699">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="90%"><br>
      <br>
      <br>
      <br>
      <br>
    
    <td style="height:100%" id="outLookBarShow" name="outLookBarShow" valign="top" align="center"> 
      <table border="0" cellspacing="0" cellpadding="0" style="height:100%;width:100%;border-bottom:0pt solid #ebf5d6;" valign="middle" align="center" width="90%">
        <tr valign="top"> 
          <td style="position:relative"> 
            <!-- Ooulook 操作开始部分-->
            <%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")

cook_allow_see_all_workrep=request.cookies("cook_allow_see_all_workrep")
cook_allow_see_dept_workrep=request.cookies("cook_allow_see_dept_workrep")
cook_allow_control_dept_user=request.cookies("cook_allow_control_dept_user")
cook_allow_control_all_user=request.cookies("cook_allow_control_all_user")
cook_allow_send_note=request.cookies("cook_allow_send_note")
cook_allow_control_note=request.cookies("cook_allow_control_note")
cook_allow_control_file=request.cookies("cook_allow_control_file")
cook_allow_control_level=request.cookies("cook_allow_control_level")
'打开数据库，读出权限
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where username=" & sqlstr(oabusyusername)
rs.open sql,conn,1
cook_allow_see_all_personinf=rs("allow_see_all_personinf")
cook_allow_see_dept_personinf=rs("allow_see_dept_personinf")

cook_allow_edit_all_jobchanginf=rs("allow_edit_all_jobchanginf")
cook_allow_edit_dept_jobchanginf=rs("allow_edit_dept_jobchanginf")

cook_allow_edit_all_rewpuninf=rs("allow_edit_all_rewpuninf")
cook_allow_edit_dept_rewpuninf=rs("allow_edit_dept_rewpuninf")

cook_allow_edit_all_checkinf=rs("allow_edit_all_checkinf")
cook_allow_edit_dept_checkinf=rs("allow_edit_dept_checkinf")

%>
          </td>
        </tr>
        <tr> 
          <td name="outlooktitle0" id="outlooktitle0" nowrap align="center" onClick="switchoutlookBar(0)"><a href="#"><img src="image/menu1.gif" width="131" height="24" border="0"></a></td>
        </tr>
		<tr name="outlookdiv0" id="outlookdiv0" style="width:100%;display:none;height:0%;"> 
          <td valign="top" align="left" bgcolor="#FFFFFF" height="150"> 
            <!--------------------------------插入代码 ---------------------------->
			<div name="outlookdivin0" id="outlookdivin0" style="overflow:auto;width:100%;height:100%"> 
              
              
			  <table width=80% align=center>
                <tr> 
                  <td> 
                    <div align="center"><a href="dayrep.asp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image11','','image/menu1-1-b.gif',1)" target="main"><img name="Image11" border="0" src="image/menu1-1-a.gif" width="41" height="40"></a></div>
                  </td>
                </tr>
                <tr> 
                  <td> 
                    <div align="center"><font color="#336699" class="unnamed1">个人工作计划</font> 
                    </div>
                  </td>
                </tr>
                <tr> 
                  <td> 
                    <div align="center"><a href="stafdayrep.asp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image6','','image/menu1-2-b.gif',1)" target="main"><img name="Image6" border="0" src="image/menu1-2-a.gif" width="41" height="40"></a></div>
                  </td>
                </tr>
                <tr> 
                  <td> 
                    <div align="center"><font color="#336699" class="unnamed1">员工工作计划</font></div>
                  </td>
                </tr>
              </table>
			  </div>
            
          </td>
        </tr>
		
        <tr> 
          <td name="outlooktitle1" id="outlooktitle1" nowrap align="center" onClick="switchoutlookBar(1)"><a href="#"><img src="image/menu2.gif" width="131" height="24" border="0"></a></td>
        </tr>
        <tr name="outlookdiv1" id="outlookdiv1" style="width:100%;display:none;height:0%;"> 
          <td valign="top" align="left" bgcolor="#FFFFFF" height="200"> 
            <div name="outlookdivin1" id="outlookdivin1" style="overflow:auto;width:100%;height:100%"> 
              <!--------------------------------插入代码 ---------------------------->
              <table width="80%" border="0" align="center">
                <tr>
                  <td>
                    <div align="center"><a href="newnotice.asp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image12','','image/menu2-1-b.gif',1)" target="main"><img name="Image12" border="0" src="image/menu2-1-a.gif" width="41" height="40"></a></div>
                  </td>
                </tr>
                <tr>
                  <td>
                    <div align="center" class="unnamed1"><font color="#336699">发布通告</font></div>
                  </td>
                </tr>
                <tr>
                  <td>
                    <div align="center"><a href="noticecontrol.asp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image13','','image/menu2-2-b.gif',1)" target="main"><img name="Image13" border="0" src="image/menu2-2-a.gif" width="41" height="40"></a></div>
                  </td>
                </tr>
                <tr>
                  <td>
                    <div align="center" class="unnamed1"><font color="#336699">管理通告</font></div>
                  </td>
                </tr>
                <tr>
                  <td>
                    <div align="center"><a href="noticelook.asp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image14','','image/menu2-3-b.gif',1)" target="main"><img name="Image14" border="0" src="image/menu2-3-a.gif" width="41" height="40"></a></div>
                  </td>
                </tr>
                <tr>
                  <td>
                    <div align="center" class="unnamed1"><font color="#336699">浏览通告</font></div>
                  </td>
                </tr>
              </table>
            </div>
          </td>
        </tr>
        <tr> 
          <td name="outlooktitle2" id="outlooktitle2" nowrap align="center" onClick="switchoutlookBar(2)"><a href="#"><img src="image/menu3.gif" width="131" height="24" border="0"></a></td>
        </tr>
        <tr name="outlookdiv2" id="outlookdiv2" style="width:100%;display:none;height:0%;"> 
          <td valign="top" align="center" bgcolor="#FFFFFF" height="250"> 
            <div name="outlookdivin2" id="outlookdivin2" style="overflow:auto;width:100%;height:100%"> 
              <!--------------------------------插入代码 ---------------------------->
              <table width="80%" border="0" align="center">
                <tr> 
                  <td> 
                    <div align="center"><a href="senddatecontrol.asp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image15','','image/menu3-1-b.gif',1)" target="main"><img name="Image15" border="0" src="image/menu3-1-a.gif" width="41" height="40"></a></div>
                  </td>
                </tr>
                <tr> 
                  <td class="unnamed1"> 
                    <div align="center"><font color="#336699">公文管理</font></div>
                  </td>
                </tr>
                <tr> 
                  <td class="unnamed1"> 
                    <div align="center"><font color="#336699"><a href="senddate.asp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image16','','image/menu3-2-b.gif',1)" target="main"><img name="Image16" border="0" src="image/menu3-2-a.gif" width="41" height="40"></a></font></div>
                  </td>
                </tr>
                <tr> 
                  <td class="unnamed1"> 
                    <div align="center"><font color="#336699">发送公文</font></div>
                  </td>
                </tr>
                <tr> 
                  <td class="unnamed1"> 
                    <div align="center"><font color="#336699"><a href="havesenddate.asp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image17','','image/menu3-3-b.gif',1)" target="main"><img name="Image17" border="0" src="image/menu3-3-a.gif" width="41" height="40"></a></font></div>
                  </td>
                </tr>
                <tr> 
                  <td class="unnamed1"> 
                    <div align="center"><font color="#336699">已发公文</font></div>
                  </td>
                </tr>
                <tr> 
                  <td class="unnamed1"> 
                    <div align="center"><font color="#336699"><a href="havercidate.asp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image18','','image/menu3-4-b.gif',1)" target="main"><img name="Image18" border="0" src="image/menu3-4-a.gif" width="41" height="40"></a></font></div>
                  </td>
                </tr>
                <tr> 
                  <td class="unnamed1"> 
                    <div align="center"><font color="#336699">已收公文</font></div>
                  </td>
                </tr>
              </table>
            </div>
          </td>
        </tr>
        <tr> 
          <td name="outlooktitle3" id="outlooktitle3" nowrap align="center" onClick="switchoutlookBar(3)"><a href="#"><img name="Image57" border="0" src="image/menu4.gif" width="131" height="24"></a></td>
        </tr>
		<tr name="outlookdiv3" id="outlookdiv3" style="width:100%;display:none;height:0%;"> 
          <td valign="top" align="center" bgcolor="#FFFFFF" height="230"> 
            <div name="outlookdivin3" id="outlookdivin3" style="overflow:auto;width:100%;height:100%"> 
              <!--------------------------------插入代码 ---------------------------->
              <br>
              <table width="80%" border="0" align="center">
                <tr> 
                  <td height="10"><a href="personinf.asp" target="main">个人基本档案</a><br>
                    <%
if cook_allow_see_all_personinf="yes" or cook_allow_see_dept_personinf="yes" then
%>
                    <a href="stafpersoninf.asp" target="main"> <br>
                    员工基本档案</a><br>
                    <%
end if
%>
                    <br>
                    <%
if cook_allow_edit_all_jobchanginf="yes" or cook_allow_edit_dept_jobchanginf="yes" then
%>
                    <a href="jobchanginf.asp" target="main"> 员工职位变动</a><br>
                    <%
end if
%>
                    <br>
                    <%
if cook_allow_edit_all_rewpuninf="yes" or cook_allow_edit_dept_rewpuninf="yes" then
%>
                    <a href="rewpuninf.asp" target="main"> 员工奖惩情况</a><br>
                    <%
end if
%>
                    <br>
                    <%
if cook_allow_edit_all_checkinf="yes" or cook_allow_edit_dept_checkinf="yes" then
%>
                    <a href="checkinf.asp" target="main"> 员工考核情况</a><br>
                    <%
end if
%>
                    <a href="wageinf.asp" target="main"> <br>
                    员工工资档案</a></td>
                </tr>
              </table>
            </div>
          </td>
        </tr>
        <tr> 
          </tr>
        <tr> 
          <td name="outlooktitle4" id="outlooktitle4" nowrap align="center" onClick="switchoutlookBar(4)"> 
            <a href="#"><img src="image/menu5.gif" width="131" height="24" border="0"></a> 
          </td>
        </tr>
        <tr name="outlookdiv4" id="outlookdiv4" style="width:100%;display:none;height:0%;"> 
          <td valign="top" align="left" height="200" bgcolor="#FFFFFF"> 
            <div name="outlookdivin4" id="outlookdivin4" style="overflow:auto;width:100%;height:100%">
              <!--------------------------------插入代码 ---------------------------->
              <table width="80%" border="0" align="center">
                <tr> 
                  <td> 
                    <div align="center"><a href="stafaddressinf.asp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image19','','image/menu5-1-b.gif',1)" target="main"><img name="Image19" border="0" src="image/menu5-1-a.gif" width="41" height="40"></a></div>
                  </td>
                </tr>
                <tr> 
                  <td class="unnamed1"> 
                    <div align="center"><font color="#336699">员工通讯录</font></div>
                  </td>
                </tr>
                <tr> 
                  <td class="unnamed1"> 
                    <div align="center"><font color="#336699"><a href="clientinf.asp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image20','','image/menu5-2-b.gif',1)" target="main"><img name="Image20" border="0" src="image/menu5-2-a.gif" width="41" height="40"></a></font></div>
                  </td>
                </tr>
                <tr> 
                  <td class="unnamed1"> 
                    <div align="center"><font color="#336699">客户通讯录</font></div>
                  </td>
                </tr>
                <tr> 
                  <td class="unnamed1"> 
                    <div align="center"><font color="#336699"><a href="sendsms.asp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image21','','image/menu5-3-b.gif',1)" target="main"><img name="Image21" border="0" src="image/menu5-3-a.gif" width="41" height="40"></a></font></div>
                  </td>
                </tr>
                <tr> 
                  <td class="unnamed1"> 
                    <div align="center"><font color="#336699">手机短信</font></div>
                  </td>
                </tr>
              </table>
            </div>
          </td>
        </tr>
		<!-- onclick="switchoutlookBar(6)"-->
        <tr> 
          <td name="outlooktitle5" id="outlooktitle5" nowrap align="center" onClick="switchoutlookBar(5)"> 
            <a href="#"><img src="image/menu6.gif" width="131" height="24" border="0"></a> 
          </td>
        </tr>
        <tr name="outlookdiv5" id="outlookdiv5" style="width:100%;display:none;height:0%;"> 
          <td valign="top" align="left" height="200" bgcolor="#FFFFFF"> 
            
              <div name="outlookdivin5" id="outlookdivin5" style="overflow:auto;width:100%;height:100%"> 
                <!--------------------------------插入代码 ---------------------------->
                
              <table width="80%" border="0" align="center">
                <tr> 
                  <td class="unnamed1"> 
                    <div align="center"><font color="#336699"><a href="booking.asp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image22','','image/menu6-1-b.gif',1)" target="main"><img name="Image22" border="0" src="image/menu6-1-a.gif" width="41" height="40"></a></font></div>
                  </td>
                </tr>
                <tr> 
                  <td class="unnamed1"> 
                    <div align="center"><font color="#336699">资源占用情况</font></div>
                  </td>
                </tr>
                <tr> 
                  <td class="unnamed1"> 
                    <div align="center"><font color="#336699"><a href="#" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image23','','image/menu6-2-b.gif',1)"><img name="Image23" border="0" src="image/menu6-2-a.gif" width="41" height="40"></a></font></div>
                  </td>
                </tr>
                <tr> 
                  <td class="unnamed1"> 
                    <div align="center"><font color="#336699">资源预约使用</font></div>
                  </td>
                </tr>
              </table>
              </div>
            
          </td>
        </tr>
      </table>
      
    </td>
    <td width="7%" background="image/line.gif"><img src="image/line.gif" width="23" height="6"></td>
  </tr>
  </table>

<script>
    //outlookbar.show()
	switchoutlookBar(3);
</script>

</BODY></HTML>
