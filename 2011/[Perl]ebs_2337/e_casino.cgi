#!/usr/bin/perl
unless(($ENV{'HTTP_USER_AGENT'} =~ /MSIE 5/i || $ENV{'HTTP_USER_AGENT'} =~ /MSIE 6/i)
		|| $ENV{'HTTP_USER_AGENT'}=~/Win/i){#如果不是IE5、6 浏览器 Windows平台，退出  了。
		&HEADER;
		print "对不起<BR>你的窗口不适合玩这个游戏。<br>只有IE5及以上版本才可以。";
		exit;
}

use AnyDBM_File;
use Fcntl;

# require 'jcode.pl';
require 'ec_config.pl';


$Start ='<table width=100% height=100%><tr><td align=center>';
$End ='</td></tr></table>';
$LOGO="<a href=\"http://ama.lunar.to/ngc/\" target=_blank><span style=\"font-size:10pt\">&copy 元兴电脑</span></a>";

(read(STDIN, $QUERY_DATA, $ENV{'CONTENT_LENGTH'}),@pairs=split(/&/,$QUERY_DATA))if $ENV{'REQUEST_METHOD'} eq "POST";
@pairs = split(/&/,$ENV{'QUERY_STRING'})if $ENV{'REQUEST_METHOD'} eq "GET";

foreach (@pairs) {
	($key, $value) = split(/=/,);
	$value =~ tr/+/ /;
	$value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
	$value =~ s/</&lt;/g;
	$value =~ s/>/&gt;/g;
	$value =~ s/\n//g;
	$value =~ s/\s//g;
	#&jcode'convert(*value,'sjis');
	$QUERY{$key} = $value;
}
$QUERY{'cmd'}='START' if !$QUERY{'cmd'};
$Sub="$QUERY{'cmd'}";&$Sub;

sub HEADER 	   {print "Content-type: text/html\n\n";
				$CTXTM=' 'if $CONTEXT_MENU;
				print << "				-----END-----" if !$_;
<html><head>
<style type="text/css">
a    {font-size:10pt;text-decoration:none;}
a:hover   {text-decoration:none;}
body {font-size:10pt}
td {font-size:10.5pt}
input{font-weight:bold;font-size:10.5pt;height:110pt;background-color:#99ff99;border:3 outset #66ee66;font-family:'新细明体','新细明体';}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Content-Type" content="text/html; charset=zh-tw">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>$TITLE_BAR</title></head>
<body bgcolor="#006600" text=#ffffff LINK=#ffffff VLINK=#ffffff
style="margin:0px 0px 0px 0px;font-size:10pt;"$CTXTM oncontextmenu="return false;">
				-----END-----
}

sub START{
print << "END_OF_HTML";
Content-type: text/html

	<html oncontextmenu="return false;"><head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<title>$TITLE_BAR</title></head>
	<frameset rows="*,100%" frameborder=no border=0 framespacing=0>
	<frame name="Sub" src="" scrolling=no>
	<frame name="Main" src="$SCRIPT?cmd=MAIN">
	</frameset>
	</html>
END_OF_HTML
}
sub MAIN {
	&HEADER;
	print << "	END_OF_HTML";
	$Start
	<span style="color:#ffffff;font-size:50pt">机器人牌戏</span><br>$LOGO
	<table border=0 cellpadding=10 cellspacing=0><form method="post" id=fm>
		<input type="hidden" name="cmd">
		<input type="hidden" name="medal" value="$QUERY{'medal'}">
		<input id=fd type=submit name="pname" style="display:none;">
	</form><tr align="center"><td>
	<input type=button value=" 比 大 小 " $Style_Button onClick="fm.cmd.value='GAME1';fm.fd.click();">
	</td></tr><tr align="center"><td>
	<input type=button value=" 九 张 牌 " $Style_Button onClick="fm.cmd.value='GAME2';fm.fd.click();">
	</td></tr><tr align="center"><td>
	<input type=button value=" 排 　 名 " $Style_Button onClick="fm.cmd.value='RANKING';fm.fd.click();">
	</td></tr><tr align="center">
	<form action=money.cgi method=POST>
	<input type=hidden name="cmd" value="MAINTE">
	<input type=hidden name="medal" value="$QUERY{'medal'}">
	<td><input type=submit value=" 换 　 金 "></td></form>
	</tr><tr align="center">
	<td><input type=button value=" 终 　 了 " $Style_Button onClick="top.location.href='$RETURN_URL';"></td>
	</tr></table>
	$End
	END_OF_HTML
&FOOTER;
}

sub GAME1 {
	&HEADER;
$Card1="$IMG_URL/card1.gif";
$Card2="$IMG_URL/card2.gif";
$Card3="$IMG_URL/card3.gif";
if (!$QUERY{'medal'}){$QUERY{'medal'}=$START_MEDAL;}
print << "-----END-----";
<table width=100% height=100% bgcolor=#006600>
<tr><td align=center valign=middle>
<style type="text/css">
.card{border-style:none;position:relative;top:-75pt;vertical-align:middle;}
.card2{cursor:hand;}
.mark{position:relative;top:+28px;left:24px}
</style>
<script language="JavaScript">
	var ing=ong=false;
	var oyakazu1;
	var result;
	var bet;
	var oyakazu2;
	var dup=0;
	function mover (c){
		if (ing){eval(c).src='$Card2';}
	}
	function mout (c){
		if (ing){eval(c).src='$Card1';}
	}
	function shuffle(med,betm){
		if (ong){
		return false;
		}else if (eval(mymedal.innerText) < med && result != '赢') {
			alert('筹码点数不足。');return false;
		}else{
		ong='true';
		winbutton.style.visibility='hidden';
		msg.innerText= '押' +med;
		betm.style.border='4px inset #66ee66';
		betm.style.background='#22aa22';
		betmedal.innerText=med;
		if (result != 'win'){
			mymedal.innerText-=med;
		}
		c1.src=c2.src=c3.src=c4.src=c5.src=oya.src='$IMG_URL/dummy.gif';
		mrcoya.src=mrc1.src=mrc2.src=mrc3.src=mrc4.src=mrc5.src='$IMG_URL/dummy2.gif';
		valoya.innerText=valc1.innerText=valc2.innerText=valc3.innerText=valc4.innerText=valc5.innerText='';
		setTimeout("oya.src='$Card1';",400)
		setTimeout("c1.src='$Card1';",500)
		setTimeout("c2.src='$Card1';",600)
		setTimeout("c3.src='$Card1';",700)
		setTimeout("c4.src='$Card1';",800)
		setTimeout("c5.src='$Card1';",900)
		setTimeout("oya.src='$Card3';",1100)
		setTimeout("openoya()",1100)
		}
	}
	function openoya(){

		oyakazu1 =Math.floor( Math.random()*52);

		oyakazu2 = oyakazu1 % 13;
		if (oyakazu2 == 0){oyakazu2=13;}
		var oyakazu3 = Math.floor(oyakazu1 / 13 + 1);
			 if (oyakazu2 == 11){valoya.innerText='J';}
		else if (oyakazu2 == 12){valoya.innerText='Q';}
		else if (oyakazu2 == 13){valoya.innerText='K';}
		else if (oyakazu2 == 1){valoya.innerText='A';oyakazu2=14;}
		   else {valoya.innerText=oyakazu2;}
		mrcoya.src='$IMG_URL/' + oyakazu3 + '.gif';
		ing='true';
	}
	function opencard(cardNo,cNo,dNo){
		if (ing){
			ing=ong=false;
			for(i=0;i=-1;i++){
				var kokazu1 =Math.floor( Math.random()*54);
				if (oyakazu1 != kokazu1){break;}
			}
			var kokazu2 = kokazu1 % 13;
			if (kokazu2 == 0){kokazu2=13;}
			var kokazu3 = Math.floor(kokazu1 / 13 + 1);

		cardNo.src='$Card3';

				 if (kokazu3 == 5){cNo.innerText='Joker';kokazu2=Number.POSITIVE_INFINITY;}
			else if (kokazu2 == 11){cNo.innerText='J';}
			else if (kokazu2 == 12){cNo.innerText='Q';}
			else if (kokazu2 == 13){cNo.innerText='K';}
			else if (kokazu2 == 1){cNo.innerText='A';kokazu2=14;}
		   else {cNo.innerText=kokazu2;}
			dNo.src='$IMG_URL/' + kokazu3 + '.gif';
			if (oyakazu2 < kokazu2){
				msg.innerText='你赢了！';
				dup++;
				result='win';
				betmedal.innerText=eval(betmedal.innerText)*2;
				double.style.border='3px outset #99ff99';
				double.style.background='#66ee66';
				winbutton.style.visibility='visible';
			}else if(oyakazu2 == kokazu2){
				if (oyakazu1 < kokazu1){
					msg.innerText='你赢了!';
					winbutton.style.visibility='visible';
					dup++;
					result='win';
					double.style.border='3px outset #99ff99';
					double.style.background='#66ee66';
					betmedal.innerText=eval(betmedal.innerText)*2;
				}else if(oyakazu1 > kokazu1){
					msg.innerText='你输了~';
					dup=0;
					result='lose';
					betmedal.innerText='0';
					onebet.style.border=fivebet.style.border=tenbet.style.border='3px outset #99ff99';
					onebet.style.background=fivebet.style.background=tenbet.style.background='#66ee66';
				}
			}else if(oyakazu2 > kokazu2){
				msg.innerText='你输了~';
					dup=0;
				result='lose';
				betmedal.innerText='0';
				onebet.style.border=fivebet.style.border=tenbet.style.border='4px outset #99ff99';
				onebet.style.background=fivebet.style.background=tenbet.style.background='#66ee66';
			}
		}else{return false;}
	}
	function pay(){
		if (dup >= $GAME1_RANKIN){
		nm=prompt('你的成绩进入排名了，请输入你的名字\\n（输入文字不能超过八个字）','');
		if(nm){
			if (nm.length > 16){alert('超过八个字了。（'+nm.length+'文字）');return false;}
			if(nm.match('[&! =.,<>]') != null) {window.alert('文字包含禁止使用的半角字符。');return false }
			rank.name.value=nm;
			com=prompt('请输入你的发言（输入文字不能超过30个字）','');
			if(com != null){
				if (com.length > 60){alert('超过30个字了。（'+com.length+'文字）');return false;}
				if(com.match('[! =.,<>]') != null) {window.alert('文字包含禁止使用的半角字符。');return false }
				rank.medal.value=betmedal.innerText;
				rank.up.value=dup;
				rank.Comment.value=com;
				rank.sbm.click();
			}
		}

		}

		winbutton.style.visibility='hidden';
		mymedal.innerText=eval(mymedal.innerText) + eval(betmedal.innerText);
		betmedal.innerText='0';
		onebet.style.border=fivebet.style.border=tenbet.style.border='4p3 outset #99ff99';
		onebet.style.background=fivebet.style.background=tenbet.style.background='#66ee66';
		result='';
	}
</script>
<table border=3 cellspacing=0 cellpadding=10 bordercolordark="#CCFFFF" bordercolorlight="#CCFFCC">
	<tr><td style="font-size:25pt"><b>比 大 小</b><div align=right>$LOGO</div></td></tr>
</table><br>
<input id=onebet type=button value=" 押[壹]点 " onClick="if (result != 'win'){shuffle(1,onebet);}">
<input id=fivebet type=button value=" 押[伍]点 " onClick="if (result != 'win'){shuffle(5,fivebet);}">
<input id=tenbet type=button value=" 押[拾]点 " onClick="if (result != 'win'){shuffle(10,tenbet);}">
<br><br>
<table border=0 cellpadding=0 cellspacing=0 style="color:000000;font-size:12pt;font-weight:bold;">
<tr height=66>
<td><img src="$IMG_URL/dummy.gif" id=oya></td>
<td>&nbsp;&nbsp;</td>
<td><img src="$IMG_URL/dummy.gif" id=c1 onMouseOver="mover(c1)" onMouseOut="mout(c1)" onClick="opencard(c1,valc1,mrc1)" class="card2"></td>
<td><img src="$IMG_URL/dummy.gif" id=c2 onMouseOver="mover(c2)" onMouseOut="mout(c2)" onClick="opencard(c2,valc2,mrc2)" class="card2"></td>
<td><img src="$IMG_URL/dummy.gif" id=c3 onMouseOver="mover(c3)" onMouseOut="mout(c3)" onClick="opencard(c3,valc3,mrc3)" class="card2"></td>
<td><img src="$IMG_URL/dummy.gif" id=c4 onMouseOver="mover(c4)" onMouseOut="mout(c4)" onClick="opencard(c4,valc4,mrc4)" class="card2"></td>
<td><img src="$IMG_URL/dummy.gif" id=c5 onMouseOver="mover(c5)" onMouseOut="mout(c5)" onClick="opencard(c5,valc5,mrc5)" class="card2"></td>
</tr>
<tr height=66>
<td class="card"><div id=valoya align=right></div><img class="mark" src="$IMG_URL/dummy2.gif" id=mrcoya></td>
<td class="card"></td>
<td class="card"><div id=valc1 align=right></div><img class="mark" src="$IMG_URL/dummy2.gif" id=mrc1></td>
<td class="card"><div id=valc2 align=right></div><img class="mark" src="$IMG_URL/dummy2.gif" id=mrc2></td>
<td class="card"><div id=valc3 align=right></div><img class="mark" src="$IMG_URL/dummy2.gif" id=mrc3></td>
<td class="card"><div id=valc4 align=right></div><img class="mark" src="$IMG_URL/dummy2.gif" id=mrc4></td>
<td class="card"><div id=valc5 align=right></div><img class="mark" src="$IMG_URL/dummy2.gif" id=mrc5></td>
</tr>
</table>
<br>
<table border=1 cellspacing=0 cellpadding=3 bordercolordark="#006600" bordercolorlight="#ffffff">
<tr><td bgcolor="003300">筹码点数：</td><td width=50 id=mymedal align=right bgcolor="336633"></td>
<td bgcolor="003300">下注点数：</td><td width=50 id=betmedal align=right bgcolor="336633">0</td>
</tr>
<tr><td colspan=2 id=msg>&nbsp;</td>
<td colspan=2><span id=winbutton style="visibility:hidden;">
<input id=double type=button value="双倍再押" onClick="shuffle(betmedal.innerText,double,true);">
<input id=pay type=button value="收点" onClick="pay();"></span>
</td>
</tr>
</table>
<br>
	<form method="post" action="$SCRIPT" id=exit>
		<input type="hidden" name="cmd" value=MAIN>
		<input type="hidden" name="medal">
		<input type=submit value=" 退出 " onClick="if (ing){return false;}else if (result != 'win'){exit.medal.value=mymedal.innerText;}">
	</form>

<table style="border:3px solid #ffffff;color:#ffffff;">
	<tr><td>游戏说明：<br>
			当你选的牌比第一张牌大时为胜。<br>
			赢了一注後你可选择加倍再押或是收点。<br>
			当牌面同值时，按花色比大小，从小到大顺序为
			<img src="$IMG_URL/1.gif" style="background-color:#ffffff;">→
			<img src="$IMG_URL/2.gif" style="background-color:#ffffff;">→
			<img src="$IMG_URL/3.gif" style="background-color:#ffffff;">→
			<img src="$IMG_URL/4.gif" style="background-color:#ffffff;">。
	</td></tr>
</table>

	<form method="post" action="$SCRIPT" id=rank target=Sub>
		<input type="hidden" name="cmd" value="RANKIN">
		<input type="hidden" name="name">
		<input type="hidden" name="medal">
		<input type="hidden" name="up">
		<input type="hidden" name="Comment">
		<input id=sbm type=submit name="pname" style="display:none;">
	</form>

</td></tr></table>
<div align=right>$LOGO</div>
	$End</body></html>

<script language="JavaScript">
	mymedal.innerText='$QUERY{'medal'}';
</script>

-----END-----

}
sub GAME2 {
	&HEADER;
if (!$QUERY{'medal'}){$QUERY{'medal'}=$START_MEDAL;}
print << "-----END-----";
<table width=100% height=100% bgcolor=#006600>
<tr><td align=center valign=middle>
<style type="text/css">
.card{border-style:none;position:relative;top:-85px;vertical-align:middle;}
.no{border-style:none;position:relative;top:-85px;vertical-align:middle;}
.card2{cursor:hand;}
.mark{position:relative;top:+14px;left:23px;width:20px;heigt:20px;}
</style>
<script language="JavaScript">
var ing;
	function shuffle(line,med){
		lins=line;
		if(ing){
			return false;
		}else if (eval(mymedal.innerText) < med) {
			alert('筹码点数不足。');return false;
		}else{
			mymedal.innerText-=med;
			betbutton.style.visibility='hidden';
			ing='true';
			winmedal.innerText='0';
			l0.style.visibility=l1.style.visibility=l2.style.visibility=l3.style.visibility=l4.style.visibility=l5.style.visibility=l6.style.visibility=l7.style.visibility='hidden';
			d1.innerText=d2.innerText=d3.innerText=d4.innerText=d5.innerText=d6.innerText=d7.innerText=d8.innerText=d9.innerText='';
			mrc1.src=mrc2.src=mrc3.src=mrc4.src=mrc5.src=mrc6.src=mrc7.src=mrc8.src=mrc9.src='$IMG_URL/dummy2.gif';
			c1.src=c2.src=c3.src=c4.src=c5.src=c6.src=c7.src=c8.src=c9.src='$IMG_URL/dummy.gif';
			g1.innerText=g2.innerText=g3.innerText=g4.innerText=g5.innerText=g6.innerText='0';
			switch(line){
			case 1:l0.style.visibility='visible';break;
			case 2:l0.style.visibility=l3.style.visibility='visible';break;
			case 3:l0.style.visibility=l1.style.visibility=l2.style.visibility='visible';break;
			case 4:l0.style.visibility=l1.style.visibility=l2.style.visibility=l3.style.visibility='visible';break;
			case 5:l0.style.visibility=l1.style.visibility=l2.style.visibility=l6.style.visibility=l7.style.visibility='visible';break;
			case 6:l0.style.visibility=l1.style.visibility=l2.style.visibility=l3.style.visibility=l4.style.visibility=l5.style.visibility='visible';break;
			case 7:l0.style.visibility=l1.style.visibility=l2.style.visibility=l3.style.visibility=l4.style.visibility=l5.style.visibility=l6.style.visibility=l7.style.visibility='visible';break;

			}
			for (i=1; i <= 9; i++){
				setTimeout("c" + i + ".src='$IMG_URL/card1.gif';",i*100+400)
			}
			for (j=1; j <= 9; j++){
				setTimeout('open(d'+j+',c'+j+',mrc'+j+')',j*500+2600)
			}
				setTimeout('hantei(lins)',8500)
			ing=false;

		}
	}
	function hantei (ls){
		for (di=0; di <= 7; di++){
			switch (di){
				case 0:Da='d8';Db='d9';Dc='d4';Ma='mrc8';Mb='mrc9';Mc='mrc4';ceck='ls>0';break;
				case 1:Da='d1';Db='d2';Dc='d3';Ma='mrc1';Mb='mrc2';Mc='mrc3';ceck='ls>=3';break;
				case 2:Da='d7';Db='d6';Dc='d5';Ma='mrc7';Mb='mrc6';Mc='mrc5';ceck='ls>=3';break;
				case 3:Da='d2';Db='d9';Dc='d6';Ma='mrc2';Mb='mrc9';Mc='mrc6';ceck='ls==2 || ls==4 || ls>=6';break;
				case 4:Da='d1';Db='d8';Dc='d7';Ma='mrc1';Mb='mrc8';Mc='mrc7';ceck='ls>=6';break;
				case 5:Da='d3';Db='d4';Dc='d5';Ma='mrc3';Mb='mrc4';Mc='mrc5';ceck='ls>=6';break;
				case 6:Da='d1';Db='d9';Dc='d5';Ma='mrc1';Mb='mrc9';Mc='mrc5';ceck='ls==5 || ls==7';break;
				case 7:Da='d7';Db='d9';Dc='d3';Ma='mrc7';Mb='mrc9';Mc='mrc3';csck='ls==5 || ls==7';break;
			}
		if(eval(ceck)){
			 if (eval(Da).innerText == eval(Db).innerText && eval(Db).innerText == eval(Dc).innerText && eval(Dc).innerText == 7 && eval(Ma).src == eval(Mb).src && eval(Mb).src == eval(Mc).src){
				g1.innerText++;
				rankin(4);
			}else if (eval(Da).innerText == eval(Db).innerText && eval(Db).innerText == eval(Dc).innerText && eval(Ma).src == eval(Mb).src && eval(Mb).src == eval(Mc).src){
				g2.innerText++;
				rankin(3);
			}else if (eval(Da).innerText == eval(Db).innerText && eval(Db).innerText == eval(Dc).innerText && eval(Dc).innerText == 7){
				g3.innerText++;
				rankin(2);
			}else if (eval(Da).innerText == eval(Db).innerText && eval(Db).innerText == eval(Dc).innerText){
				g4.innerText++;
				rankin(1);
			}
			else if (eval(Ma).src == eval(Mb).src && eval(Mb).src == eval(Mc).src){g5.innerText++;}
			if (eval(Ma).src == '$IMG_URL/2.gif'){g6.innerText++;}
			if (eval(Mb).src == '$IMG_URL/2.gif'){g6.innerText++;}
			if (eval(Mc).src == '$IMG_URL/2.gif'){g6.innerText++;}
		}
		}

		kakutokum=(g1.innerText*$GAME2_GETMEDAL_1)+(g2.innerText*$GAME2_GETMEDAL_2)+(g3.innerText*$GAME2_GETMEDAL_3)+(g4.innerText*$GAME2_GETMEDAL_4)+(g5.innerText*$GAME2_GETMEDAL_5)+(g6.innerText*$GAME2_GETMEDAL_6);
		winmedal.innerText=kakutokum;
		mymedal.innerText=eval(mymedal.innerText)+kakutokum;
			betbutton.style.visibility='visible';

	}
	function rankin(rnkclass){
		nm=prompt('你的成绩进入排名了，请输入你的名字\\n（输入文字不能超过八个字）','');
		if(nm){
			if (nm.length > 16){alert('超过八个字了。（'+nm.length+'文字）');return false;}
			if(nm.match('[<>]') != null) {window.alert('文字包含禁止使用的半角字符。');return false }
			rank.name.value=nm;
			com=prompt('请输入你的发言（输入文字不能超过30个字）','');
			if(com != null){
				if (com.length > 60){alert('超过30个字了。（'+com.length+'文字）');return false;}
				if(com.match('[<>]') != null) {window.alert('文字包含禁止使用的半角字符。');return false }
				rank.clss.value=rnkclass;
				rank.Comment.value=com;
				rank.sbm.click();
			}
		}
	}

	function open(ddd,ccc,mmm){
		ccc.src='$IMG_URL/card3.gif';
		kazu1 =Math.floor( Math.random()*52);
		kazu2 = kazu1 % 13;

		var kazu3 = Math.floor(kazu1 / 13 + 1);
			 if (kazu2 == 1) {ddd.innerText='A';}
		else if (kazu2 == 0){ddd.innerText='K';}
		else if (kazu2 == 11){ddd.innerText='J';}
		else if (kazu2 == 12){ddd.innerText='Q';}
		   else {ddd.innerText=kazu2;}
		mmm.src='$IMG_URL/' + kazu3 + '.gif';
	}
</script>
<table border=3 cellspacing=0 cellpadding=10 bordercolordark="#CCFFFF" bordercolorlight="#CCFFCC">
	<tr><td style="font-size:25pt"><b>九 张 牌</b><div align=right>$LOGO</div></td></tr>
</table><br>
<table border=0 cellspacing=0 cellpadding=5  id=betbutton id=l3 style="visibility:visible;">
	<form method="post" action="$SCRIPT" id=exit>
		<input type="hidden" name="cmd" value=MAIN>
		<input type="hidden" name="medal">
		<input id=sbm type=submit style="display:none;">
	</form><tr>
<td><img src="$IMG_URL/l1.gif">
<input id=tenbet type=button value="押[$GAME2_1LINE]点" onClick="shuffle(1,$GAME2_1LINE);"></td>
<td><img src="$IMG_URL/l2.gif">
<input id=tenbet type=button value="押[$GAME2_2LINE]点" onClick="shuffle(2,$GAME2_2LINE);"></td>
<td><img src="$IMG_URL/l3.gif">
<input id=tenbet type=button value="押[$GAME2_3LINE]点" onClick="shuffle(3,$GAME2_3LINE);"><td>
<tr>
</tr>
<td><img src="$IMG_URL/l4.gif">
<input id=tenbet type=button value="押[$GAME2_4LINE]点" onClick="shuffle(4,$GAME2_4LINE);"></td>
<td><img src="$IMG_URL/l5.gif">
<input id=tenbet type=button value="押[$GAME2_5LINE]点" onClick="shuffle(5,$GAME2_5LINE);"></td>
<td><img src="$IMG_URL/l6.gif">
<input id=tenbet type=button value="押[$GAME2_6LINE]点" onClick="shuffle(6,$GAME2_6LINE);"></td>
</tr>
<tr>
<td><img src="$IMG_URL/l7.gif">
<input id=tenbet type=button value="押[$GAME2_7LINE]点" onClick="shuffle(7,$GAME2_7LINE);"></td>
<td colspan=2 align="center" align="middle"><input type=button class=button1 value=" 退出 " onClick="exit.medal.value=mymedal.innerText;exit.sbm.click();"></td>
</tr>
</table>
<table cellpadding=0 cellspacing=0 style="color:000000;font-size:12pt;font-weight:bold;;">
<tr align=center>
	<td>
	<img src="$IMG_URL/betline3.gif" id=l6 style="visibility:hidden;">
	</td>
	<td>
	<img src="$IMG_URL/betline2.gif" id=l4 style="visibility:hidden;">
	</td>
	<td>
	<img src="$IMG_URL/betline2.gif" id=l3 style="visibility:hidden;">
	</td>
	<td>
	<img src="$IMG_URL/betline2.gif" id=l5 style="visibility:hidden;">
	</td>
	<td>&nbsp;&nbsp;</td>
	<td>&nbsp;</td>
</tr>
<tr>
<td>
	<img src="$IMG_URL/betline.gif" id=l1 style="visibility:hidden;">
	</td>
	<td><img src="$IMG_URL/dummy.gif" id=c1 class="card2"></td>
	<td><img src="$IMG_URL/dummy.gif" id=c2 class="card2"></td>
	<td><img src="$IMG_URL/dummy.gif" id=c3 class="card2"></td>
	<td rowspan=7>&nbsp;&nbsp;</td>
	<td rowspan=7 valign=top>
		<table border=1 cellpadding=5 cellspacing=0 bordercolordark="#666666" bordercolorlight="#ffffff" style="color:#ffffff;font-weight:bold;;">
			<tr align=center><td>牌花</td><td>线数</td><td width=60>可获金额</td></tr>
			<tr align=right><td align=left nowrap>同花叁７</td><td id=g1>0</td><td nowrap>×$GAME2_GETMEDAL_1</td></tr>
			<tr align=right><td align=left>叁张同牌</td>	<td id=g2>0</td><td>×$GAME2_GETMEDAL_2</td></tr>
			<tr align=right><td align=left>叁张７</td><td id=g3>0</td><td>×$GAME2_GETMEDAL_3</td></tr>
			<tr align=right><td align=left>叁张同数</td><td id=g4>0</td><td>×$GAME2_GETMEDAL_4</td></tr>
			<tr align=right><td align=left>叁同花</td><td id=g5>0</td><td>×$GAME2_GETMEDAL_5</td></tr>
			<tr align=right><td align=left>心牌</td><td id=g6>0</td><td>×$GAME2_GETMEDAL_6</td></tr>
			<tr align=right><td colspan=2>获得筹码：</td><td align=right id=winmedal>0</td></tr>
			<tr align=right><td colspan=2>持用筹码：</td><td align=right id=mymedal></td></tr>
		</table>

	</td>
</tr>
<tr><td>&nbsp;</td>
	<td class=no><div id=d1 align=right></div><img class="mark" src="$IMG_URL/dummy2.gif" id=mrc1></td>
	<td class=no><div id=d2 align=right></div><img class="mark" src="$IMG_URL/dummy2.gif" id=mrc2></td>
	<td class=no><div id=d3 align=right>&nbsp;</div><img class="mark" src="$IMG_URL/dummy2.gif" id=mrc3></td>
</tr>

<tr style="position:relative;top:-30px;">
<td>
	<img src="$IMG_URL/betline.gif" id=l0 style="visibility:hidden;">
	</td>
	<td><img src="$IMG_URL/dummy.gif" id=c8 class="card2"></td>
	<td><img src="$IMG_URL/dummy.gif" id=c9 class="card2"></td>
	<td><img src="$IMG_URL/dummy.gif" id=c4 class="card2"></td>
</tr>
<tr style="position:relative;top:-30px;">
	<td>&nbsp;</td>
	<td class=no><div id=d8 align=right></div><img class="mark" src="$IMG_URL/dummy2.gif" id=mrc8></td>
	<td class=no><div id=d9 align=right></div><img class="mark" src="$IMG_URL/dummy2.gif" id=mrc9></td>
	<td class=no><div id=d4 align=right>&nbsp;</div><img class="mark" src="$IMG_URL/dummy2.gif" id=mrc4></td>
</tr>

<tr style="position:relative;top:-60px;">
	<td>
	<img src="$IMG_URL/betline.gif" id=l2 style="visibility:hidden;">
	</td>
	<td><img src="$IMG_URL/dummy.gif" id=c7 class="card2"></td>
	<td><img src="$IMG_URL/dummy.gif" id=c6 class="card2"></td>
	<td><img src="$IMG_URL/dummy.gif" id=c5 class="card2"></td>
</tr>
<tr style="position:relative;top:-60px;">
	<td>&nbsp;</td>
	<td class=no><div id=d7 align=right></div><img class="mark" src="$IMG_URL/dummy2.gif" id=mrc7></td>
	<td class=no><div id=d6 align=right></div><img class="mark" src="$IMG_URL/dummy2.gif" id=mrc6></td>
	<td class=no><div id=d5 align=right>&nbsp;</div><img class="mark" src="$IMG_URL/dummy2.gif" id=mrc5></td>
</tr>
<tr style="position:relative;top:-90px;">
	<td>
	<img src="$IMG_URL/betline4.gif" id=l7 style="visibility:hidden;">
	</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><tr>
</table>
	<form method="post" action="$SCRIPT" id=rank target=Sub>
		<input type="hidden" name="cmd" value="DENDOU">
		<input type="hidden" name="name">
		<input type="hidden" name="clss">
		<input type="hidden" name="Comment">
		<input id=sbm type=submit style="display:none;">
	</form>
	$End</body></html>
<script language="JavaScript">
	mymedal.innerText='$QUERY{'medal'}';
</script>

-----END-----

}
sub RANKIN {
if ($ENV{'HTTP_REFERER'} =~ m/^$HTTP_REF/){
	$date=time;
	flock(LOCK,2);
		tie %DATA,AnyDBM_File,"$LOG_FOLDER/$DBM_NAME_1",O_CREAT | O_WRONLY,0666;
			$DATA{"$date"}="$QUERY{'up'}<*>$QUERY{'medal'}<*>$QUERY{'name'}<*>$QUERY{'Comment'}";
		untie %DATA;
	flock(LOCK,8);
}else{exit;}
&HEADER(1);
}
sub DENDOU {
if ($ENV{'HTTP_REFERER'} =~ m/^$HTTP_REF/){
	$date=time;
	flock(LOCK,2);
		tie %DATA,AnyDBM_File,"$LOG_FOLDER/$DBM_NAME_2",O_CREAT | O_WRONLY,0666;
			$DATA{"$date"}="$QUERY{'clss'}<*>$QUERY{'name'}<*>$QUERY{'Comment'}";
		untie %DATA;
	flock(LOCK,8);
}else{exit;}
&HEADER(1);
}
sub RANKING {
flock(LOCK,2);
	tie %DATA,AnyDBM_File,"$LOG_FOLDER/$DBM_NAME_1",O_RDWR,0666;
		foreach $key (sort {$DATA{$b} <=> $DATA{$a}} keys %DATA){
			if($count < $RANK_IN){
				$count++;
				$font=30-$count;
				$font=15 if $font<15;
				@data=split(/<\*>/,$DATA{"$key"});
				&DateDecord($key);
				$rnkdata1.= << "				-----END-----";
				<tr style="font-size:$font px;">
					<td nowrap style="background-color:gold;color:#000000;" align=center>$count</td>
					<td nowrap>$data[2]</td><td nowrap>$data[0]</td>
					<td nowrap>$data[1]</td>
					<td style="font-size:10.5pt;">$data[3]<b style="font-size:10.5pt;">[$DecordDate]</b></td>
				</tr>
				-----END-----
			}else{delete $DATA{"$key"};}
		}
	untie %DATA;
	tie %DATA,AnyDBM_File,"$LOG_FOLDER/$DBM_NAME_2",O_RDWR,0666;
		foreach $key (sort {$DATA{$b} <=> $DATA{$a}} keys %DATA){
			if($count2 < $RANK_IN){
				$count2++;
				$font=30-$count2;
				$font=15 if $font<15;
				@data=split(/<\*>/,$DATA{"$key"});
				&DateDecord($key);
				$data[0]=('','叁同数','叁张７','叁同牌','同牌叁７')[$data[0]];
				$rnkdata2.= << "				-----END-----";
				<tr style="font-size:$font px;">
					<td nowrap style="background-color:gold;color:#000000;" align=center>$count2</td>
					<td nowrap>$data[1]</td><td nowrap>$data[0]</td>
					<td style="font-size:10.5pt;">$data[2]<b style="font-size:10.5pt;">[$DecordDate]</b></td>
				</tr>
				-----END-----
			}else{delete $DATA{"$key"};}
		}
	untie %DATA;
flock(LOCK,8);
$rnkdata1="<tr><td colspan=5 align=center>没有大赢家排名</td></tr>"if !$count;
$rnkdata2="<tr><td colspan=4 align=center>没有大赢家排名</td></tr>"if !$count2;
	&HEADER(1);
	print << "	-----END-----";
	$Start
	<span style="color:#ffffff;font-size:50pt">机器人牌戏</span><br>$LOGO
	<form method="post" action="$SCRIPT" id=exit>
		<input type="hidden" name="cmd" value=MAIN>
		<input type="hidden" name="medal" value="$QUERY{'medal'}">
		<input type=submit class=button1 value=" 退出 ">
	</form>
	比大小 历代大赢家排名（翻倍回数）
	<table border=1 bordercolordark="#ccffcc" bordercolorlight="#000000" style="color:#ffffff;font-weight:bold;" cellpadding=5 cellspacing=0>
	<tr style="background-color:gold;color:#000000;" align=center>
		<td>排名</td>
		<td>名字</td>
		<td>回数</td>
		<td>获得</td>
		<td>发言</td></tr>$rnkdata1</table><br><br>
	-----END-----


	print "";
	print << "	-----END-----";
	九张牌 历代大赢家排名
	<table border=1 bordercolordark="#ccffcc" bordercolorlight="#000000"  style="color:#ffffff;font-weight:bold;" cellpadding=5 cellspacing=0>
	<tr style="background-color:gold;color:#000000;" align=center>
		<td>排名</td>
		<td>名字</td>
		<td>牌花</td>
		<td>发言</td></tr>$rnkdata2</table>
	$End<br><br><br></body></html>
	-----END-----



}
sub DateDecord	{
				local($sec,$min,$hour,$day,$mon,$year,$wday,$yday,$isdst) = localtime($_[0]);
				$hour = sprintf("%02d", $hour);
				$min = sprintf("%02d", $min);
				$DecordDate = "$mon月$day日($hour:$min)";
			   }

