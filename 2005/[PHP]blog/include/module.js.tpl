function submitshortcut(eventobject){
ie = (document.all)? true:false
if (ie){
	if(event.ctrlKey && window.event.keyCode==13) {
		if (this.document.laform.cat.selectedIndex == 0 ) { alert('__&&langaet[1]&&__'); }
		else {
			this.document.laform.submit();
	}
}
}
}

function submitshc (eventobject){
ie = (document.all)? true:false
if (ie){
	if(event.ctrlKey && window.event.keyCode==13) {
			this.document.laform.submit();
}
}
}

function copyText(obj) {
ie = (document.all)? true:false
if (ie){
var rng = document.body.createTextRange();
rng.moveToElementText(obj);
rng.scrollIntoView();
rng.select();
rng.execCommand("Copy");
rng.collapse(false);
}
}


function copycheck() {
if (this.document.laform.cat.selectedIndex == 0 ) { 
	alert('__&&langaet[1]&&__');
	return false;
}
return true;
}

function savedraft() {
this.document.laform.ifsavedraft.value = 1;
return true;
}

function autocopy() {
	if (this.document.laform.isautocopy.checked) { 
	copyText(this.document.laform.icontent);
	}
}

function showemots() { 
	var outshowremote="<iframe frameborder='0' leftmargin='0' marginheight='0' marginwidth='0' scrolling='no' src='include/emots.html' width='405' height='50'></iframe>";
	emotplace.innerHTML=outshowremote;
}

function showicon() {
	iconarea.innerHTML="<img src='img/avatars/"+document.pro.regavatar.options[document.pro.regavatar.selectedIndex].value+".gif' width='24' height='24'/>";
}	

function minsert(str) {
	if (document.laform.icontent) {
		if (document.all) {
			minsertac(document.laform.icontent, str);
		} else {
			document.laform.icontent.value += str;
		}
		document.laform.icontent.focus();
	} 
}
function minsertac(texttobe, text) {
	if (texttobe.createTextRange && texttobe.caretPos) {
		var caretPos = texttobe.caretPos;
		caretPos.text += caretPos.text.charAt(caretPos.text.length - 2) == ' ' ? text + ' ' : text;
	} else if (texttobe) {
		texttobe.value += text;
	} else {
		texttobe.value = text;
	}
}
function ginsert(str) {
	if (document.form.message) {
		if (document.all) {
			minsertac(document.form.message, str);
		} else {
			document.form.message.value += str;
		}
		document.form.message.focus();
	} 
}
