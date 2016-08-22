<table cellpadding=0 cellspacing=1 width=147><tr>
<td width=20><img src="img/emot/smile.gif"  onclick="insertstr('[emot]smile[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/coolsmile.gif"  onclick="insertstr('[emot]coolsmile[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/laugh.gif"  onclick="insertstr('[emot]laugh[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/angry.gif"  onclick="insertstr('[emot]angry[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/astonish.gif"  onclick="insertstr('[emot]astonish[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/cry.gif"  onclick="insertstr('[emot]cry[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/mute.gif"  onclick="insertstr('[emot]mute[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/sweat.gif"  onclick="insertstr('[emot]sweat[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/zzz.gif"  onclick="insertstr('[emot]zzz[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/puzzled.gif"  onclick="insertstr('[emot]puzzled[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/good.gif"  onclick="insertstr('[emot]good[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/bad.gif"  onclick="insertstr('[emot]bad[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/flower.gif"  onclick="insertstr('[emot]flower[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/ball.gif"  onclick="insertstr('[emot]ball[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/medicine.gif"  onclick="insertstr('[emot]medicine[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/melon.gif"  onclick="insertstr('[emot]melon[/emot]');"  style="CURSOR: hand"></td>
</tr>
<tr>
<td width=20><img src="img/emot/sunny.gif"  onclick="insertstr('[emot]sunny[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/moon.gif"  onclick="insertstr('[emot]moon[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/pig.gif"  onclick="insertstr('[emot]pig[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/present.gif"  onclick="insertstr('[emot]present[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/money.gif"  onclick="insertstr('[emot]money[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/wound.gif"  onclick="insertstr('[emot]wound[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/love.gif"  onclick="insertstr('[emot]love[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/heartache.gif"  onclick="insertstr('[emot]heartache[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/sh~t.gif"  onclick="insertstr('[emot]sh~t[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/phone.gif"  onclick="insertstr('[emot]phone[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/coffee.gif"  onclick="insertstr('[emot]coffee[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/puke.gif"  onclick="insertstr('[emot]puke[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/shy.gif"  onclick="insertstr('[emot]shy[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/fear.gif"  onclick="insertstr('[emot]fear[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/envy.gif"  onclick="insertstr('[emot]envy[/emot]');"  style="CURSOR: hand"></td>
<td width=20><img src="img/emot/sad.gif"  onclick="insertstr('[emot]sad[/emot]');"  style="CURSOR: hand"></td>
</tr>

</table>


<!-- div JS Code fo Bo-Blog-->
<!--版权所有： Bobby Shen-->

<script language="JavaScript">

function SH(cid) {
if (document.selection && document.selection.type == "Text") {
	var range = document.selection.createRange();
	if (cid=='b') { 
		range.text = "[b]" + range.text + "[/b]";
	} else if (cid=='i') { 
		range.text = "[i]" + range.text + "[/i]";
	} else if (cid=='u') { 
		range.text = "[u]" + range.text + "[/u]";
	} else if (cid=='url') {
		txt4=prompt("输入为此文字添加的链接地址","http://");
		if (txt4!=null) {
		range.text = "[url=" + txt4 + "]" + range.text + "[/url]";
		}
	} else if (cid=='email') { 
		range.text = "[email]" + range.text + "[/email]";
	} else if (cid=='ed') { 
		range.text = "[ed]" + range.text + "[/ed]";
	} else if (cid=='code') { 
		range.text = "[code]" + range.text + "[/code]";
	} else if (cid=='quote') { 
		range.text = "[quote]" + range.text + "[/quote]";
	}	else if (cid=='sup') { 
		range.text = "[sup]" + range.text + "[/sup]";
	} 	else if (cid=='sub') { 
		range.text = "[sub]" + range.text + "[/sub]";
	}	else if (cid=='left') { 
		range.text = "[left]" + range.text + "[/left]";
	}	else if (cid=='center') { 
		range.text = "[center]" + range.text + "[/center]";
	} 	else if (cid=='right') { 
		range.text = "[right]" + range.text + "[/right]";
	}  	else if (cid=='strike') { 
		range.text = "[strike]" + range.text + "[/strike]";
	}  
 else {
var shw,part1,part2,part3,part4;
part1="<div style='position:absolute; height:20px; z-index:1; left: 0px; top: 0px; '><table width=100% border=0 cellpadding=0 cellspacing=0 bgcolor=#F5F5FA><tr><td height=20>";
part2=" <input name='thisbox' value='";
part3="' size=30><input type=button value=插入 onClick='doinsert((thisbox.value),";
part4=")'></td></tr></table></div>";
part5="' size=30> 宽度： <input name='widthbox' value='400' size=3> 高度： <input name='heightbox' value='100' size=3> <input type=button value=插入 onClick='complexinsert((thisbox.value),";
part6=",(widthbox.value), (heightbox.value)";
part7="</td></tr></table></div>";

wid='"'+cid+'"';
if (cid=="img") { shw=part1+"输入图像的URL地址:"+part2+"http://"+"' size=30> 环绕： <input name='alignbox' value='L' size=1> (L-左环绕 M-上下环绕 R-右环绕) <input type=button value=插入 onClick='complexinsert((thisbox.value),"+wid+",(alignbox.value), (alignbox.value)"+part4; }
if (cid=="flash") { shw=part1+"输入Flash的URL地址:"+part2+"http://"+part5+wid+part6+part4; }
if (cid=="wmp") { shw=part1+"输入多媒体文件地址:"+part2+"http://"+part5+wid+part6+part4; }
if (cid=="real") { shw=part1+"输入real文件地址:"+part2+"http://"+part5+wid+part6+part4; }
if (cid=="font") {
		var createfont='字体 <select onchange=addfont(options[this.selectedIndex].value);options[0].select><OPTION value="" selected>请选择</OPTION><OPTION value=Arial>Arial</OPTION> <OPTION value=Tahoma>Tahoma</OPTION> <OPTION value=Verdana>Verdana</OPTION> <OPTION value="Times New Roman">Times New Roman</OPTION> <OPTION value="Bookman Old Style">Bookman Old Style</OPTION> <OPTION value="Century Gothic">Century Gothic</OPTION><OPTION value="Impact">Impact</OPTION> <OPTION value="Comic Sans MS">Comic Sans MS</OPTION><OPTION value="Geogia">Geogia</OPTION> <OPTION value="Courier New">Courier New</OPTION><option value="宋体">宋体</option> <OPTION value=楷体_GB2312>楷体</OPTION> <OPTION value=新宋体>新宋体</OPTION> <OPTION value=黑体>黑体</OPTION> <OPTION value=隶书>隶书</OPTION> <OPTION value=仿宋体>仿宋体</OPTION>  <OPTION value=Wingdings>Wingdings</OPTION><OPTION value=Webdings>Webdings</OPTION></select>	字号 <select onchange=addsize(options[this.selectedIndex].value) name="bsize"><OPTION value="" selected>请选择</OPTION><OPTION value=1>1</OPTION><OPTION value=2>2</OPTION><OPTION value=3>3</OPTION><OPTION value=4>4</OPTION><OPTION value=5>5</OPTION><OPTION value=6>6</OPTION></select>	颜色 <select onchange=addcolor(options[this.selectedIndex].value) name="bcolor"><OPTION value="" selected>请选择</OPTION><OPTION style="COLOR: skyblue;" value=skyblue>天蓝</OPTION> <OPTION style="COLOR: royalblue" value=royalblue>品蓝</OPTION> <OPTION style="COLOR: blue" value=blue>蓝</OPTION> <OPTION style="COLOR: darkblue" value=darkblue>暗蓝</OPTION> <OPTION style="COLOR: orange" value=orange>橙</OPTION> <OPTION style="COLOR: orangered" value=orangered>桔红</OPTION> <OPTION style="COLOR: crimson" value=crimson>深红</OPTION> <OPTION style="COLOR: red" value=red>红</OPTION> <OPTION style="COLOR: firebrick" value=firebrick>棕</OPTION> <OPTION style="COLOR: darkred" value=darkred>暗红</OPTION> <OPTION style="COLOR: green" value=green>绿色</OPTION> <OPTION style="COLOR: limegreen" value=limegreen>灰绿</OPTION> <OPTION style="COLOR: seagreen" value=seagreen>海绿</OPTION> <OPTION style="COLOR: deeppink" value=deeppink>粉</OPTION> <OPTION style="COLOR: tomato" value=tomato>西红柿色</OPTION> <OPTION style="COLOR: coral" value=coral>珊瑚色</OPTION> <OPTION style="COLOR: purple" value=purple>紫色</OPTION> <OPTION style="COLOR: indigo" value=indigo>靛青</OPTION> <OPTION style="COLOR: burlywood" value=burlywood>棕木</OPTION> <OPTION style="COLOR: sandybrown" value=sandybrown>沙褐</OPTION> <OPTION style="COLOR: sienna" value=sienna>土黄</OPTION> <OPTION style="COLOR: chocolate" value=chocolate>巧克力色</OPTION> <OPTION style="COLOR: teal" value=teal>土绿</OPTION> <OPTION style="COLOR: silver" value=silver>银</OPTION></select>';
	shw=part1+createfont+part7; }

bodyshow.innerHTML=shw;
}
}
else {
var shw,part1,part2,part3,part4;
part1="<div style='position:absolute; height:20px; z-index:1; left: 0px; top: 0px; '><table width=100% border=0 cellpadding=0 cellspacing=0 bgcolor=#F5F5FA><tr><td height=20>";
part2=" <input name='thisbox' value='";
part3="' size=30><input type=button value=插入 onClick='doinsert((thisbox.value),";
part4=")'></td></tr></table></div>";
part5="' size=30> 宽度： <input name='widthbox' value='400' size=3> 高度： <input name='heightbox' value='100' size=3> <input type=button value=插入 onClick='complexinsert((thisbox.value),";
part6=",(widthbox.value), (heightbox.value)";
part7="</td></tr></table></div>";

wid='"'+cid+'"';
if (cid=="b") { shw=part1+"输入变粗的文字:"+part2+part3+wid+part4; }
if (cid=="i") { shw=part1+"输入变斜体的文字:"+part2+part3+wid+part4; }
if (cid=="u") { shw=part1+"输入加下划线的文字:"+part2+part3+wid+part4; }
if (cid=="hr") { shw=part1+"分割线已插入。"+part7; }
if (cid=="sub" ||cid=="sup" || cid=="left" ||cid=="center" || cid=="right" ||cid=="font") { shw=part1+"请先选择文字！"+part7; }
if (cid=="url") { shw=part1+"输入网址:"+part2+"http://"+part3+wid+part4; }
if (cid=="img") { shw=part1+"输入图像的URL地址:"+part2+"http://"+"' size=30> 环绕： <input name='alignbox' value='F' size=1> (L-左环 M-上下 R-右环 F-强迫缩小) <input type=button value=插入 onClick='complexinsert((thisbox.value),"+wid+",(alignbox.value), (alignbox.value)"+part4; }
if (cid=="flash") { shw=part1+"输入Flash的URL地址:"+part2+"http://"+part5+wid+part6+part4; }
if (cid=="wmp") { shw=part1+"输入多媒体文件地址:"+part2+"http://"+part5+wid+part6+part4; }
if (cid=="email") { shw=part1+"输入Email地址:"+part2+"@"+part3+wid+part4; }
if (cid=="real") { shw=part1+"输入real文件地址:"+part2+"http://"+part5+wid+part6+part4; }
if (cid=="ed") { shw=part1+"输入Edonkey(Emule)地址:"+part2+"ed2k://"+part3+wid+part4; }
if (cid=="code") { shw=part1+"输入需要插入的代码文字:"+part2+part3+wid+part4; }
if (cid=="quote") { shw=part1+"输入需要插入的引用内容:"+part2+part3+wid+part4; }
if (cid=="strike") { shw=part1+"输入需要加删除线的内容:"+part2+part3+wid+part4; }

bodyshow.innerHTML=shw;
}
}

function LC(cid) { 
var shw;
if (cid=="b") { shw="插入粗体字"; }
if (cid=="i") { shw="插入斜体字"; }
if (cid=="u") { shw="插入加下划线的文字"; }
if (cid=="url") { shw="插入一个网址"; }
if (cid=="img") { shw="插入一个图像的URL地址"; }
if (cid=="flash") { shw="插入一个Flash的URL地址"; }
if (cid=="wmp") { shw="插入Windows Media Player文件地址"; }
if (cid=="email") { shw="插入Email地址"; }
if (cid=="real") { shw="插入RealOne Player文件地址"; }
if (cid=="ed") { shw="插入Edonkey(Emule)地址"; }
if (cid=="code") { shw="插入一段代码或需要标记的文字"; }
if (cid=="quote") { shw="插入一段引用的文字"; }
if (cid=="sup") { shw="插入上标文字"; }
if (cid=="sub") { shw="插入下标文字"; }
if (cid=="strike") { shw="插入删除线文字"; }
if (cid=="font") { shw="改变字体属性"; }
if (cid=="hr") { shw="插入水平分割线"; }
if (cid=="left") { shw="文字左对齐"; }
if (cid=="center") { shw="文字居中对齐"; }
if (cid=="right") { shw="文字右对齐"; }
if (cid=="separator") { shw="插入内容截断符(用于摘要显示时正确截断文章)"; }

shw="<div style='position:absolute; width:100%; height:20px; z-index:1; left: 0px; top: 0px; '><table width=100% border=0 cellpadding=0 cellspacing=0 bgcolor=#F5F5FA><tr><td height=20>"+shw+"</td></tr></table></div>";
bodyshow2.innerHTML=shw;
}

function backtonone() {
var shw;
shw="<div  style='position:relative; width:100%; height:20px; z-index:1; left: 0px; top: 0px;'><table width=100% border=0 cellpadding=0 cellspacing=0 bgcolor=#F5F5FA><tr><td height=20>请点击图标插入相应的对象。</table></div>";
bodyshow2.innerHTML=shw;
}

function addfont(varcat) {
		var range = document.selection.createRange();
		range.text = "[font="+varcat + "]" + range.text + "[/font]";
}
function addsize(varcat) {
		var range = document.selection.createRange();
		range.text = "[size="+varcat + "]" + range.text + "[/size]";
}
function addcolor(varcat) {
		var range = document.selection.createRange();
		range.text = "[color="+varcat + "]" + range.text + "[/color]";
}

</script>




<!-- Text Editor -->
<!-- Original Code from CTB -->
<script language="JavaScript">
function insertstr(str) {
	if (document.laform.icontent) {
		if (document.all) {
			insertac(document.laform.icontent, str);
		} else {
			document.laform.icontent.value += str;
		}
		document.laform.icontent.focus();
	} 
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

function doinsert (txt, act) {
	document.laform.thisbox.value="";
	if (txt != "") {
	if (act=='b') { 
		AddTxt = "[b]" + txt + "[/b]";
	} else if (act=='i') { 
		AddTxt = "[i]" + txt + "[/i]";
	} else if (act=='u') { 
		AddTxt = "[u]" + txt + "[/u]";
	} else if (act=='url') { 
		AddTxt = "[url]" + txt + "[/url]";
	} else if (act=='email') { 
		AddTxt = "[email]" + txt + "[/email]";
	} else if (act=='ed') { 
		AddTxt = "[ed]" + txt + "[/ed]";
	} else if (act=='quote') { 
		AddTxt = "[quote]" + txt + "[/quote]";
	} else if (act=='sub') { 
		AddTxt = "[sub]" + txt + "[/sub]";
	} else if (act=='sup') { 
		AddTxt = "[sup]" + txt + "[/sup]";
	} else if (act=='strike') { 
		AddTxt = "[strike]" + txt + "[/strike]";
	} else if (act=='hr') { 
		AddTxt =  txt + "[hr]";
	} else if (act=='separator') { 
		AddTxt =  txt + "[separator]";
	} else {
		AddTxt = "[code]" + txt + "[/code]";
	} 
	insertstr(AddTxt);
	backtonone();
	}
}


function complexinsert (txt, act, width, height) {
	document.laform.thisbox.value="";
	if (txt != "") {
	if (act=='wmp') { 
		AddTxt = "[wmp width=" + width + " height=" + height + "]" + txt + "[/wmp]";
	} else if (act=='real') { 
		AddTxt = "[real width=" + width + " height=" + height + "]" + txt + "[/real]";
	} else if (act=='img') { 
		AddTxt = "[img align=" + width + "]" + txt + "[/img]";
	} else  { 
		AddTxt = "[swf width=" + width + " height=" + height + "]" + txt + "[/swf]";
	} 
	insertstr(AddTxt);
	backtonone();
	}
}

</script>