<%

  if Session.Contents("gws")<>true then
 %>
<!--#include file="gly.asp"-->
<%  
else
%>

<HTML>
<HEAD>
<TITLE>龚文生用导航菜单</TITLE>



<SCRIPT  type=text/javascript>

var dragobject = null;
var tx;
var ty;

function getReal(el) {
	temp = el;

	while ((temp != null) && (temp.tagName != "BODY")) {
		if ((temp.className == "moveme") || (temp.className == "handle")){
			el = temp;
			return el;
		}
		temp = temp.parentElement;
	}
	return el;
}


function moveme_onmousedown() {
	el = getReal(window.event.srcElement)
	if (el.className == "moveme") {
		dragobject = el;
		ty = (window.event.clientY - dragobject.style.pixelTop);
		tx = (window.event.clientX - dragobject.style.pixelLeft);
		window.event.returnValue = false;
		window.event.cancelBubble = true;
	}
	else if (el.className == "handle") {
		tmp = el.getAttribute("for");
		if (tmp != null) {
			el = eval(tmp);
			dragobject = el;
			ty = (window.event.clientY - dragobject.style.pixelTop);
			tx = (window.event.clientX - dragobject.style.pixelLeft);
			window.event.returnValue = false;
			window.event.cancelBubble = true;
		}
		else {
			dragobject = null;
		}
	}
	else {
		dragobject = null;
	}
}

function moveme_onmouseup() {
	if(dragobject) {
		dragobject = null;
	}
}

function moveme_onmousemove() {
	if (dragobject) {
		if(window.event.clientX >= 0) {
			dragobject.style.left = window.event.clientX - tx;
			dragobject.style.top = window.event.clientY - ty;
		}
		window.event.returnValue = false;
		window.event.cancelBubble = true;
	}
}

if (document.all) { //This only works in IE4 or better
	document.onmousedown = moveme_onmousedown;
	document.onmouseup = moveme_onmouseup;
	document.onmousemove = moveme_onmousemove;
}

document.write("<style>");
document.write(".moveme		{cursor: move;}");
document.write(".handle		{cursor: move;}");
document.write("</style>");
</SCRIPT>

<SCRIPT  type=text/javascript>

document.onmouseover = doOver;
document.onmouseout  = doOut;
document.onmousedown = doDown;
document.onmouseup   = doUp;


function doOver() {
	var toEl = getReal(window.event.toElement, "className", "coolButton");
	var fromEl = getReal(window.event.fromElement, "className", "coolButton");
	if (toEl == fromEl) return;
	var el = toEl;
	
//	alert(el);
	
//	var cDisabled = el.getAttribute("cDisabled");
	var cDisabled = el.cDisabled;
//	alert(cDisabled);
	cDisabled = (cDisabled != null); // If CDISABLED atribute is present
	
	if (el.className == "coolButton")
		el.onselectstart = new Function("return false");
	
	if ((el.className == "coolButton") && !cDisabled) {
		makeRaised(el);
		makeGray(el,false);
	}
}

function doOut() {
	var toEl = getReal(window.event.toElement, "className", "coolButton");
	var fromEl = getReal(window.event.fromElement, "className", "coolButton");
	if (toEl == fromEl) return;
	var el = fromEl;

//	var cDisabled = el.getAttribute("cDisabled");
	var cDisabled = el.cDisabled;
	cDisabled = (cDisabled != null); // If CDISABLED atribute is present

	var cToggle = el.cToggle;
	toggle_disabled = (cToggle != null); // If CTOGGLE atribute is present

	if (cToggle && el.value) {
		makePressed(el);
		makeGray(el,true);
	}
	else if ((el.className == "coolButton") && !cDisabled) {
		makeFlat(el);
		makeGray(el,true);
	}

}

function doDown() {
	el = getReal(window.event.srcElement, "className", "coolButton");
	
	var cDisabled = el.cDisabled;
	cDisabled = (cDisabled != null); // If CDISABLED atribute is present
	
	if ((el.className == "coolButton") && !cDisabled) {
		makePressed(el)
	}
}

function doUp() {
	el = getReal(window.event.srcElement, "className", "coolButton");
	
	var cDisabled = el.cDisabled;
	cDisabled = (cDisabled != null); // If CDISABLED atribute is present
	
	if ((el.className == "coolButton") && !cDisabled) {
		makeRaised(el);
	}
}


function getReal(el, type, value) {
	temp = el;
	while ((temp != null) && (temp.tagName != "BODY")) {
		if (eval("temp." + type) == value) {
			el = temp;
			return el;
		}
		temp = temp.parentElement;
	}
	return el;
}

function findChildren(el, type, value) {
	var children = el.children;
	var tmp = new Array();
	var j=0;
	
	for (var i=0; i<children.length; i++) {
		if (eval("children[i]." + type + "==\"" + value + "\"")) {
			tmp[tmp.length] = children[i];
		}
		tmp = tmp.concat(findChildren(children[i], type, value));
	}
	
	return tmp;
}

function disable(el) {

	if (document.readyState != "complete") {
		window.setTimeout("disable(" + el.id + ")", 100);	// If document not finished rendered try later.
		return;
	}
	
	var cDisabled = el.cDisabled;
	
	cDisabled = (cDisabled != null); // If CDISABLED atribute is present

	if (!cDisabled) {
		el.cDisabled = true;
		
		el.innerHTML = '<span style="background: buttonshadow; width: 100%; height: 100%; text-align: center;">' +
						'<span style="filter:Mask(Color=buttonface) DropShadow(Color=buttonhighlight, OffX=1, OffY=1, Positive=0); height: 100%; width: 100%%; text-align: center;">' +
						el.innerHTML +
						'</span>' +
						'</span>';

		if (el.onclick != null) {
			el.cDisabled_onclick = el.onclick;
			el.onclick = null;
		}
	}
}

function enable(el) {
	var cDisabled = el.cDisabled;
	
	cDisabled = (cDisabled != null); // If CDISABLED atribute is present
	
	if (cDisabled) {
		el.cDisabled = null;
		el.innerHTML = el.children[0].children[0].innerHTML;

		if (el.cDisabled_onclick != null) {
			el.onclick = el.cDisabled_onclick;
			el.cDisabled_onclick = null;
		}
	}
}

function addToggle(el) {
	var cDisabled = el.cDisabled;
	
	cDisabled = (cDisabled != null); // If CDISABLED atribute is present
	
	var cToggle = el.cToggle;
	
	cToggle = (cToggle != null); // If CTOGGLE atribute is present

	if (!cToggle && !cDisabled) {
		el.cToggle = true;
		
		if (el.value == null)
			el.value = 0;		// Start as not pressed down
		
		if (el.onclick != null)
			el.cToggle_onclick = el.onclick;	// Backup the onclick
		else 
			el.cToggle_onclick = "";

		el.onclick = new Function("toggle(" + el.id +"); " + el.id + ".cToggle_onclick();");
	}
}

function removeToggle(el) {
	var cDisabled = el.cDisabled;
	
	cDisabled = (cDisabled != null); // If CDISABLED atribute is present
	
	var cToggle = el.cToggle;
	
	cToggle = (cToggle != null); // If CTOGGLE atribute is present
	
	if (cToggle && !cDisabled) {
		el.cToggle = null;

		if (el.value) {
			toggle(el);
		}

		makeFlat(el);
		
		if (el.cToggle_onclick != null) {
			el.onclick = el.cToggle_onclick;
			el.cToggle_onclick = null;
		}
	}
}

function toggle(el) {
	el.value = !el.value;
	
	if (el.value)
		el.style.background = "URL()";
	else
		el.style.backgroundImage = "";

//	doOut(el);	
}


function makeFlat(el) {
	with (el.style) {
		background = "";
		border = "1px solid buttonface";
		padding      = "1px";
	}
}

function makeRaised(el) {
	with (el.style) {
		borderLeft   = "1px solid buttonhighlight";
		borderRight  = "1px solid buttonshadow";
		borderTop    = "1px solid buttonhighlight";
		borderBottom = "1px solid buttonshadow";
		padding      = "1px";
	}
}

function makePressed(el) {
	with (el.style) {
		borderLeft   = "1px solid buttonshadow";
		borderRight  = "1px solid buttonhighlight";
		borderTop    = "1px solid buttonshadow";
		borderBottom = "1px solid buttonhighlight";
		paddingTop    = "2px";
		paddingLeft   = "2px";
		paddingBottom = "0px";
		paddingRight  = "0px";
	}
}

function makeGray(el,b) {
	var filtval;
	
	if (b)
		filtval = "gray()";
	else
		filtval = "";

	var imgs = findChildren(el, "tagName", "IMG");
		
	for (var i=0; i<imgs.length; i++) {
		imgs[i].style.filter = filtval;
	}

}
	

document.write("<style>");
document.write(".coolBar	{background: buttonface;border-top: 1px solid buttonhighlight;	border-left: 1px solid buttonhighlight;	border-bottom: 1px solid buttonshadow; border-right: 1px solid buttonshadow; padding: 2px; font: menu;}");
document.write(".coolButton {border: 1px solid buttonface; padding: 1px; text-align: center; cursor: default;}");
document.write(".coolButton IMG	{filter: gray();}");
document.write("</style>");

</SCRIPT>

<SCRIPT type=text/javascript>
<!--

document.onmousedown = initDown; 
document.onmouseup   = initUp;
document.onmousemove = initMove;

function initDown() {
	doDown();
	moveme_onmousedown();
}

function initUp() {
	doUp();
	moveme_onmouseup();
}

function initMove() {
	moveme_onmousemove();
}

//-->
</SCRIPT>

<STYLE type=text/css>BODY {
	FONT-FAMILY: "宋体"; FONT-SIZE: 9pt; MARGIN-TOP: 0px
}
.pt9 {
	FONT-FAMILY: "宋体"; FONT-SIZE: 9pt
}
</STYLE>


</HEAD>


<BODY bgColor=#e0dfde leftMargin=0 topMargin=0>

<SCRIPT language=JavaScript>
var mylocation="main.htm"
var winheight=100
var winsize=100
var x=5
function go(){
win2=window.open("","","scrollbars")
win2.location=mylocation
if (!document.layers&&!document.all){
win2.location=mylocation
return}
win2.resizeTo(100,100)
win2.moveTo(0,0)
go2()}
function go2(){
if (winheight>=screen.availHeight-3)
x=0
win2.resizeBy(5,x)
winheight+=5
winsize+=5
if (winsize>=screen.width-5){
win2.location=mylocation
winheight=100
winsize=100
x=5
return}
setTimeout("go2()",50)
}
</SCRIPT>


<DIV align=left>
<TABLE cellPadding=0 class=coolBar id=toolbar1 
style="LEFT: 0px; POSITION: relative; TOP: 0px; Z-INDEX: 99" width="100%">
  <TBODY>
  <TR>
  
      <TD class=coolButton onclick=javascript:history.back()><NOBR><IMG 
      height=12 src="001a.gif" width=20>后退</NOBR></TD>
           <TD class=coolButton 
    onclick="window.open('index0.asp', 'gwsz')"><NOBR><IMG 
      height=12 src="002.gif" width=20>学生管理</NOBR> </TD>
           <TD class=coolButton 
    onclick="window.open('gws05.asp', 'gwsz')"><NOBR><IMG 
      height=12 src="002.gif" width=20>权限管理</NOBR> </TD>
     
           <TD class=coolButton 
    onclick="window.open('sjbf.asp', 'gwsz')"><NOBR><IMG 
      height=12 src="002.gif" width=20>数据备份</NOBR> </TD>
      <TD class=coolButton 
    onclick="window.open('gggl.asp', 'gwsz')"><NOBR><IMG height=12 
      src="002.gif" width=20>公告</NOBR> </TD>
    <TD class=coolButton 
    onclick="window.open('lrgl.asp', 'gwsz')"><NOBR><IMG height=12 
      src="002.gif" width=20>增加学生</NOBR> </TD>
    <TD class=coolButton 
    onclick="window.open('lrbjgl.asp', 'gwsz')"><NOBR><IMG height=12 
      src="002.gif" width=20>增加班级</NOBR></TD>
       <TD class=coolButton 
    onclick="window.open('bmfx.asp', 'gwsz')"><NOBR><IMG height=12 
      src="002.gif" width=20>部门分析</NOBR></TD>
    <TD class=coolButton 
    onclick="window.open('bjcz.asp', 'gwsz')"><NOBR><IMG 
      height=12 src="002.gif" width=20>班级管理</NOBR></TD>
      <TD class=coolButton onclick=javascript:history.forward()>前进<NOBR><IMG 
      height=12 src="001.gif" width=20></NOBR></TD>
  
 
   </TR></TBODY></TABLE></DIV>




</BODY></HTML>


     <%
end if
%>