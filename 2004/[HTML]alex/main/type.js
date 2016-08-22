function document.oncontextmenu(){
if ((event.srcElement.type=="text")||(event.srcElement.type=="textarea"))
{return true;}else{return false;}
}
function document.ondragstart(){
if ((event.srcElement.type=="text")||(event.srcElement.type=="textarea"))
{return true;}else{return false;}
}
function document.onselectstart(){
if ((event.srcElement.type=="text")||(event.srcElement.type=="textarea")||(event.srcElement.className=="textarea"))
{return true;}else{return false;}
}
function document.onmouseover(){
if ((event.srcElement.type=="button")||(event.srcElement.type=="submit")||(event.srcElement.type=="reset")){
if(event.srcElement.className=="buttonxp")
{event.srcElement.className="buttonxp-o";}else{event.srcElement.className="buttonxp1-o";}
}
}
function document.onmouseout(){
if ((event.srcElement.type=="button")||(event.srcElement.type=="submit")||(event.srcElement.type=="reset")){
if(event.srcElement.className=="buttonxp-o")
{event.srcElement.className="buttonxp";}else{event.srcElement.className="buttonxp1";}
}
}