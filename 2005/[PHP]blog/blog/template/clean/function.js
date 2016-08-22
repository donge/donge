//Comes from Discuz! 4.0
function findobj(n, d) {
	var p, i, x;
	if(!d) d = document;
	if((p = n.indexOf("?"))>0 && parent.frames.length) {
		d = parent.frames[n.substring(p + 1)].document;
		n = n.substring(0, p);
	}
	if(x != d[n] && d.all) x = d.all[n];
	for(i = 0; !x && i < d.forms.length; i++) x = d.forms[i][n];
	for(i = 0; !x && d.layers && i < d.layers.length; i++) x = findobj(n, d.layers[i].document);
	if(!x && document.getElementById) x = document.getElementById(n);
	return x;
}

function toggle_collapse(objname) {
	obj = findobj(objname);
	collapsed = getcookie("boblog_collapse");
	cookie_start = collapsed ? collapsed.indexOf(objname) : -1;
	cookie_end = cookie_start + objname.length + 1;

	if(obj.style.display == "none") {
		obj.style.display = "";
		if(cookie_start != -1) collapsed = collapsed.substring(0, cookie_start) + collapsed.substring(cookie_end, collapsed.length);
	} else {
		obj.style.display = "none";
		if(cookie_start == -1) collapsed = collapsed + objname + " ";
	}

	expires = new Date();
	expires.setTime(expires.getTime() + (collapsed ? 86400 * 30 : -(86400 * 30 * 1000)));
	document.cookie = "boblog_collapse=" + escape(collapsed) + "; expires=" + expires.toGMTString() + "; path=/";
}

function getcookie(name) {
	var cookie_start = document.cookie.indexOf(name);
	var cookie_end = document.cookie.indexOf(";", cookie_start);
	return cookie_start == -1 ? '' : unescape(document.cookie.substring(cookie_start + name.length + 1, (cookie_end > cookie_start ? cookie_end : document.cookie.length)));
}