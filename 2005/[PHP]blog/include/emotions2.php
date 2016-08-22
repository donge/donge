<table cellpadding=0 cellspacing=1 width=147><tr>
<td width=20><img src="img/emot/smile.gif"  onclick="insertstr('smile');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/coolsmile.gif"  onclick="insertstr('coolsmile');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/laugh.gif"  onclick="insertstr('laugh');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/angry.gif"  onclick="insertstr('angry');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/astonish.gif"  onclick="insertstr('astonish');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/cry.gif"  onclick="insertstr('cry');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/mute.gif"  onclick="insertstr('mute');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/sweat.gif"  onclick="insertstr('sweat');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/zzz.gif"  onclick="insertstr('zzz');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/puzzled.gif"  onclick="insertstr('puzzled');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/good.gif"  onclick="insertstr('good');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/bad.gif"  onclick="insertstr('bad');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/flower.gif"  onclick="insertstr('flower');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/ball.gif"  onclick="insertstr('ball');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/medicine.gif"  onclick="insertstr('medicine');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/melon.gif"  onclick="insertstr('melon');"  style="CURSOR: hand"></td>
</tr>
<tr>
<td width=20><img src="img/emot/sunny.gif"  onclick="insertstr('sunny');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/moon.gif"  onclick="insertstr('moon');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/pig.gif"  onclick="insertstr('pig');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/present.gif"  onclick="insertstr('present');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/money.gif"  onclick="insertstr('money');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/wound.gif"  onclick="insertstr('wound');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/love.gif"  onclick="insertstr('love');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/heartache.gif"  onclick="insertstr('heartache');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/sh~t.gif"  onclick="insertstr('sh~t');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/phone.gif"  onclick="insertstr('phone');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/coffee.gif"  onclick="insertstr('coffee');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/puke.gif"  onclick="insertstr('puke');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/shy.gif"  onclick="insertstr('shy');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/fear.gif"  onclick="insertstr('fear');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/envy.gif"  onclick="insertstr('envy');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/sad.gif"  onclick="insertstr('sad');"  style="CURSOR: hand"></td>
</tr>

</table>


<!-- Text Editor -->
<script language="JavaScript">
function insertstr(str) {
	editor.setMode ("textmode");
	str="<img src='img/emot/"+str+".gif' border='0'/>";
	if (document.laform.icontent) {
		if (document.all) { 
			insertac(document.laform.icontent, str);
		} else {
			document.laform.icontent.value += str;
		}
		document.laform.icontent.focus();
	} 
	editor.setMode ("wysiwyg");
}

function storeac(texttobe) {
	if (texttobe.createTextRange) {
		texttobe.caretPos = document.selection.createRange().duplicate();
	}
}

function insertac(texttobe, text) {
	if (texttobe.createTextRange && texttobe.caretPos) {
		var caretPos = texttobe.caretPos;
		caretPos.text += caretPos.text.charAt(caretPos.text.length - 2) == ' ' ? text + ' ' : text;
	} else if (texttobe) {
		texttobe.value += text;
	} else {
		texttobe.value = text;
	}
}


</script>