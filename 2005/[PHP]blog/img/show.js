/******************************************************************************
  JS Code originally comes from Discuz!
*******************************************************************************/

var sPop = null;
var postSubmited = false;

document.write("<style type='text/css'id='defaultPopStyle'>");
document.write(".cPopText { font-family: Tahoma, Verdana; background-color: #FFFFCC; border: 1px #000000 solid; font-size: 12px; padding-right: 4px; padding-left: 4px; height: 20px; padding-top: 2px; padding-bottom: 2px; visibility: hidden; filter: Alpha(Opacity=80)}");

document.write("</style>");
document.write("<div id='popLayer' style='position:absolute;z-index:1000' class='cPopText'></div>");


function showPopupText() {
	var o=event.srcElement;
	MouseX=event.x;
	MouseY=event.y;
	if(o.alt!=null && o.alt!="") { o.pop=o.alt;o.alt="" }
        if(o.title!=null && o.title!=""){ o.pop=o.title;o.title="" }
	if(o.pop!=sPop) {
		sPop=o.pop;
		if(sPop==null || sPop=="") {
			popLayer.style.visibility="hidden";	
		} else {
			if(o.dyclass!=null) popStyle=o.dyclass 
			else popStyle="cPopText";
			popLayer.style.visibility="visible";
			showIt();
		}
	}
}

function showIt() {
	popLayer.className=popStyle;
	popLayer.innerHTML=sPop.replace(/<(.*)>/g,"&lt;$1&gt;").replace(/\n/g,"<br>");;
	popWidth=popLayer.clientWidth;
	popHeight=popLayer.clientHeight;
	if(MouseX+12+popWidth>document.body.clientWidth) popLeftAdjust=-popWidth-24
		else popLeftAdjust=0;
	if(MouseY+12+popHeight>document.body.clientHeight) popTopAdjust=-popHeight-24
		else popTopAdjust=0;
	popLayer.style.left=MouseX+12+document.body.scrollLeft+popLeftAdjust;
	popLayer.style.top=MouseY+12+document.body.scrollTop+popTopAdjust;
}


document.onmouseover=showPopupText;
