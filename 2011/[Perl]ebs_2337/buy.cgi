#!/usr/bin/perl

##################################################################
#
# -------旋喘号協について-----------------------------------------
# このスクリプトはNET GAME Communications仝http://www.ngcoms.net/々
# で塘下しているENDLESSBATTLE2の弖紗プログラムです。
#
# このスクリプトはフリ！ソフトですが广恬幡は慧虹しておりません。
# このスクリプトを聞喘する圭は參和の旋喘号協に児づき聞喘してください。
#
# 1.このスクリプトを聞喘し採らかの鱒墾があったとしても、恬宀式び輝サイ
#   トに夭販は涙い麗とします。
# 2.個夛吉はご徭喇に佩えますが、倖繁の夭販において佩ってください
# 3.壅塘下はご徭喇に佩える麗としますが、广恬幡燕幣を��茅しないで
#   和さい
# SCRIPTNAME	EBS AUCTION ver 1.1
# HOMEPAGE 	
# E-MAIL 	44net@kk.sakura.ne.jp
# (C)2001 44-net FACTORY
#
##################################################################
#
#---------------ENDLESSBATTLEスクリプトへの弖紗-------------------
#
# ebs_sub3.cgiの<input type=button>などのコマンドボタンがある魁侭に
# 參和の佩を弖紗してください。
#
# <td><input type=button value="オ！クション" $STYLE_B1 onClick="parent.Sub.location.replace('./このスクリプトの兆念')"></td>
#
# このスクリプトの兆念　と慕かれている何蛍をこのスクリプトの兆念に延えてください。
#
##################################################################
#光嶽譜協
#

$SCRIPTNM="buy.cgi";			#このスクリプト兆
$AUCTIONDIR="buy";			#オ！クション瞳鯉追ディレクトリ！
$rireki="$AUCTIONDIR/rireki.dat";	#オ！クション鯛奬潤惚です。�╂�嫖徨に.cgiを聞わないで和さい。��
require 'ebs_sub1.cgi';			#ebs_sub1.cgiのスクリプト兆
require "./$LOG_FOLDER/$HASH_DATA";	#冷匂のリスト�┗筝�音勣��
$TABLE_STYLE = "bordercolor=#404040 border=1 cellspacing=0 style=\"font-size:10pt\"";#<TABLE>のスタイルです。
@stime = ("3","6","12","24","48");	#���I豚��
@nyuusatu = ("500","1000","2000","5000","10000","20000","50000","100000","200000","500000","1000000","2000000","5000000");#);#);#);#);#);#);#���穆�駆
$max_num = "20";			#恷寄オ！クション瞳方�╋犢�ぎると嶷くなります。)
$rmax = "20";				#恷寄鯛奬煽雰方
$rekisika = "1";			#オ！クション竃弁を煽雰に燕幣するなら1、しないなら0を磯叔で芝秘
$nmax = "20000000";			#恷寄兜豚署駆

#譜協ここまで
##################################################################
#ここから和の何蛍はperlを聞喘したプログラムです。個夛竃栖る袈律で延厚してください。

if($SUB){&ERROR('岷リンクは鋤峭です','秘り笥からのアクセスお垳いします。') if $ENV{'HTTP_REFERER'} !~ m/^$THIS_DIR/ && $DIRECT_LINK && $SUB ne 'MY_LIST' && $SUB ne 'C_LIST';}

@pair = split(/\;/, $ENV{'HTTP_COOKIE'});
foreach (@pair) {my($key, $value) = split(/=/, $_);
$DUMMY{$key} = $value;}
@pairs = split(/\,/, $DUMMY{'EB'});
foreach (@pairs) {my($key, $value) = split(/\:/, $_);
$cookies{"$key"} = $value;}

if($cookies{'pname'} eq ""){&ERROR('掲隈序秘。');}

!$SUB && ($SUB='MAINTE');
&$SUB;

sub SETUMEI {
&HEADER;
print<<"HTML";
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR1>
<table style="font-size:10pt">
<tr><td align=left valign=top bgcolor=$TABLE_COLOR2 colspan=2>菜偏竃弁�h苧</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>菜偏辛參田�u徭失議冷匂、竃�r恷互議繁��辛參�I欺。</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>オ！クション氏魁へは冷匂コマンド坪にある、オ！クションボタンを兀すと佩けます。</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>匯業竃弁すると匯業でも秘奬があった魁栽、竃弁の函り��しは竃栖ません。</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>竃弁は、匯業に匯繁匯瞳のみとなっております。</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>秘奬は竃弁宀參翌の豊でも佩うことが竃栖ます。</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>秘奬扮に隔ち署が怎りない扮は秘奬することが竃栖ません。</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>竃弁宀はいつでも鯛奬することが竃栖ます。</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>寂離えて秘奬してしまった魁栽は函り��すことが竃栖ません。</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>鯛奬扮に恷嶮秘奬宀の隔ってる冷匂の嚠\姥\２ヵ侭がどちらも托まっている魁栽、鯛奬することが竃栖ません。</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>�┐い賃簫�されるか盾らないので、械に嚠\姥\を腎けておくと措いと房います。)</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>鯛奬扮に恷嶮秘奬宀の隔ち署が鯛奬勺鯉に怎りない魁栽、マイナス署駆となります。</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>匯繁も秘奬宀がいなかった魁栽に鯛奬すると、竃弁した冷匂は竃弁宀の圷に跂ってきます。</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>鯛奬すると、鯛奬の煽雰に秤烏が隠贋されます。</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>あくまでも峻さんで赤しむものなので、いがみ栽い吉にならないよう、オ！クションを赤しみましょう??</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR2 colspan=2>オ！クション鮫中��恣迦��の需圭<br></td></tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>竃弁冷匂</td>
<td align=left>徭蛍が隔っている嚠\姥\の廾\姥\が燕\幣されます。竃弁することが竃栖ます。</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>譜協扮寂</td>
<td align=left>オ！クションを佩う恷互扮寂です。この扮寂を階えると秘奬することが竃栖なくなります。</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>兜豚署駆</td>
<td align=left>竃弁する冷匂の恷詰署駆です。この方忖から署駆の紗麻が兵まります。</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>竃弁ボタン</td>
<td align=left>貧芝譜協を嶮えてこのボタンを兀すと、オ！クションに冷匂を竃弁できます。</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>鯛奬の煽雰</td>
<td align=left>狛肇２０指の鯛奬彜趨を需ることが竃栖ます。</td>
</tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR2 colspan=2>オ！クション鮫中��嘔迦��の需圭<br></td></tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>竃弁宀</td>
<td align=left>オ！クションに冷匂を竃弁した繁の兆念です。</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>冷匂兆��冷匂Lv��</td>
<td align=left>竃弁されている冷匂とその冷匂のＬｖです。</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>兜豚署駆</td>
<td align=left>竃弁されている冷匂の恷兜の峙粁です。</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>�嶬擇僚雍�</td>
<td align=left>�嶬敞誑�された恷互駆です。</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>奐秘奬駆譜協</td>
<td align=left>�嶬擇僚雍遒防漏砲擦垢觸雍遒鯢莇┐靴泙后�</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>譜協扮寂</td>
<td align=left>この扮寂まで鯛奬しなかった魁栽秘奬が竃栖なくなり、畳協ボタンの生が鯛奬ボタンになります。</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>恷嶮秘奬宀</td>
<td align=left>恷瘁に秘奬した繁の兆念です。鯛奬されるとここに燕\幣されている繁が冷匂を杭秘することになります。</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>畳協ボタン</td>
<td align=left>
秘奬ボタンや鯛奬ボタンが燕\幣されます。秘奬ボタンはこの冷匂が圀しい圭が奐秘奬署駆を譜協して兀すと秘奬が竃栖ます。<br>
竃弁した繁には、恷兜から鯛奬ボタンが燕\幣されます。<br>
譜協扮寂を階えると、畠ての繁のボタン燕幣が徭強議に鯛奬ボタンに俳り紋わります。<br>
鯛奬ボタンを兀すと、鯛奬することが竃栖ます。<br>
兜豚署駆峪嬬喘磯叔�久巒�秘。
</td>
</tr>
</table>
</td>
</tr>
</table>
HTML
&foot;
exit;
}


sub REKISI{

open(OPENB,"$rireki");
@hanako = <OPENB>;
close(OPENB);

&HEADER;

print<<"HTML";
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=7>菜偏���I�v雰</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR2 align=center>鯛奬晩扮</td>
<td bgcolor=$TABLE_COLOR2 align=center>竃弁宀</td>
<td bgcolor=$TABLE_COLOR2 align=center>竃弁冷匂</td>
<td bgcolor=$TABLE_COLOR2 align=center>鯛奬宀</td>
<td bgcolor=$TABLE_COLOR2 align=center>鯛奬駆</td>
<td bgcolor=$TABLE_COLOR2 align=center>兜豚署駆</td>
<td bgcolor=$TABLE_COLOR2 align=center>秘奬指方</td>
</tr>
HTML

foreach(@hanako){
$nobuied = "";
($timing,$name,$nname,$buki,$nowmoney,$money,$num) = split(/<>/);

if($timing == 1){$nobuied = 1;}
else{
($sec, $min, $hour, $mday, $mon, $year) = localtime($timing);
$ghour = sprintf("%02d",$hour);
$gmin = sprintf("%02d",$min);
$mon++;
$kitei = "$mon埖$mday晩&nbsp$ghour扮$gmin蛍";
}

if($nobuied){print "<tr><td bgcolor=$TABLE_COLOR1 align=center>------</td><td bgcolor=$TABLE_COLOR1>$nameさん</td><td bgcolor=$TABLE_COLOR1>$buki</td><td bgcolor=$TABLE_COLOR1 colspan=4>秘奬宀はいませんでした。</td></tr>\n";}
else{
print<<"TABLE";
<tr>
<td bgcolor=$TABLE_COLOR1>$kitei</td>
<td bgcolor=$TABLE_COLOR1>$nameさん</td>
<td bgcolor=$TABLE_COLOR1>$buki</td>
<td bgcolor=$TABLE_COLOR1>$nnameさん</td>
<td bgcolor=$TABLE_COLOR1 align=right>$nowmoneyＧ</td>
<td bgcolor=$TABLE_COLOR1 align=right>$moneyＧ</td>
<td bgcolor=$TABLE_COLOR1 align=right>$num指</td>
</tr>
TABLE
}

}
print "</table>";
&foot;
exit;
}

sub INBUKI {

&ERROR('クッキ！が需つかりません。') if $cookies{'pname'} eq '';
&ERROR('兜豚署駆�]嗤�O協。') if $FORM{'money'} eq '';
if($FORM{'money'} =~ m/\D/g){&ERROR('兜豚署�~峪嬬喘磯叔�久巒�秘');}
if(($FORM{'money'} % 1) != 0){&ERROR('峪嬬喘屁��');}
if($FORM{'money'} >= $nmax){&ERROR("恷互兜豚署駆$nmaxＧ階竃����。");}

&DBM_INPORT(P);
&LOCK;
opendir(MEMBER_DIR, "$AUCTIONDIR");
@kkk = sort(grep { m/.*\.cgi/ } readdir(MEMBER_DIR));
closedir(MEMBER_DIR);

$filenum = @kkk;

if($filenum >= $max_num){&UNLOCK;&ERROR('恷寄竃弁方($max_numになっていて書は竃弁できません');}
$amax = 0;
	foreach(@kkk){
	chomp $_;
$file = $_;
	($id,$kaku) = split(/\./);
	push(@option,"$id");#ファイル桑催
	if($amax <= $id){$amax = $id;}#仟号竃弁喘桑催

open(OPENS,"$AUCTIONDIR/$file");
@mitukeru = <OPENS>;
close(OPENS);
($named,$dmy) = split(/<>/,$mitukeru[0]);
if($named eq $cookies{'pname'}){&UNLOCK;&ERROR('竃弁は匯繁匯瞳までです。');}
}

$amax1 = $amax + 1;
$outfile = "$amax1\.cgi";

dbmopen (%P,"$DBM_P",0666);
@VALS = split(/\s/,$P{"$cookies{'pname'}"});
dbmclose %P;

	local($WN_A,$WLV_A) = split(/!/,$VALS[9]);	
	local($WN_B,$WLV_B) = split(/!/,$VALS[10]);
	local($WN_C,$WLV_C) = split(/!/,$VALS[11]);
	local($WN_D,$WLV_D) = split(/!/,$VALS[35]);
	local($WN_E,$WLV_E) = split(/!/,$VALS[36]);
	$WEP_A=$WLV_A%$WEAPON_LVUP;	
	$WEP_B=$WLV_B%$WEAPON_LVUP;	
	$WEP_C=$WLV_C%$WEAPON_LVUP;
	$WEP_D=$WLV_D%$WEAPON_LVUP;	
	$WEP_E=$WLV_E%$WEAPON_LVUP;
	$WLV_A=int$WLV_A/$WEAPON_LVUP;
	$WLV_B=int$WLV_B/$WEAPON_LVUP;
	$WLV_C=int$WLV_C/$WEAPON_LVUP;
	$WLV_D=int$WLV_D/$WEAPON_LVUP;
	$WLV_E=int$WLV_E/$WEAPON_LVUP;

@WN_sA=split(/\,/,$WEAPON_LIST{"$WN_A"});
@WN_sB=split(/\,/,$WEAPON_LIST{"$WN_B"});
@WN_sC=split(/\,/,$WEAPON_LIST{"$WN_C"});
@WN_sD=split(/\,/,$WEAPON_LIST{"$WN_D"});
@WN_sE=split(/\,/,$WEAPON_LIST{"$WN_E"});


if($FORM{'buki'} == 1){if($VALS[10] eq ""){&UNLOCK;&ERROR('竃弁冷匂１が需輝たりません。');}$dbuki = $VALS[10];$VALS[10] = "";$syuppin = "$WN_sB[0]";}
if($FORM{'buki'} == 2){if($VALS[11] eq ""){&UNLOCK;&ERROR('竃弁冷匂２が需輝たりません。');}$dbuki = $VALS[11];$VALS[11] = "";$syuppin = "$WN_sC[0]";}
if($FORM{'buki'} == 3){if($VALS[35] eq ""){&UNLOCK;&ERROR('竃弁冷匂１が需輝たりません。');}$dbuki = $VALS[35];$VALS[35] = "";$syuppin = "$WN_sD[0]";}
if($FORM{'buki'} == 4){if($VALS[36] eq ""){&UNLOCK;&ERROR('竃弁冷匂２が需輝たりません。');}$dbuki = $VALS[36];$VALS[36] = "";$syuppin = "$WN_sE[0]";}

$aatime = $stime["$FORM{'autime'}"];
$ktime = 3600 * $aatime;
$owari = time + $ktime;
($sec, $min, $hour, $mday, $mon, $year) = localtime($owari);
$ghour = sprintf("%02d",$hour);
$gmin = sprintf("%02d",$min);
$mon++;
$kitei = "$mon埖$mday晩&nbsp$ghour扮$gmin蛍唯峭";

	dbmopen (%P,"$DBM_P",0666);
		$P{"$cookies{'pname'}"}="@VALS";
	dbmclose %P;

if($rekisika == 1){
		dbmopen (%DH,"$DBM_H",0666);
			$DH{"$DATE"}="$cookies{'pname'}議冷匂$syuppin竃弁嶄。$kitei竃弁。";
		dbmclose %DH;
		}

$pout = "$cookies{'pname'}<>$dbuki<>$owari<>$FORM{'money'}<>\n";

open(OUT,"> $AUCTIONDIR/$outfile");
print OUT $pout;
close(OUT);
chmod 0666, "$AUCTIONDIR/$outfile";


&UNLOCK;

&HEADER;

print<<"HTML";
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=2>參和のように竃弁しました。</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR2>竃弁冷匂</td>
<td bgcolor=$TABLE_COLOR1 align=right>$syuppin</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2>譜協扮寂</td>
<td bgcolor=$TABLE_COLOR1 align=right>$kitei</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2>兜豚署駆</td>
<td bgcolor=$TABLE_COLOR1 align=right>$FORM{'money'}&nbsp;G</td>
</tr>
</table>
</body>
</html>
HTML
exit;
}

sub MAINTE {

&ERROR('クッキ！が需つかりません。') if $cookies{'pname'} eq '';
&DBM_INPORT(P);
$selecttime = "<select name=autime $STYLE_B1><option value=0>$stime[0]扮寂<option value=1>$stime[1]扮寂<option value=2>$stime[2]扮寂<option value=3>$stime[3]扮寂<option value=4>$stime[4]扮寂</select>";

opendir(MEMBER_DIR, "$AUCTIONDIR");
@kkk = sort(grep { m/.*\.cgi/ } readdir(MEMBER_DIR));
closedir(MEMBER_DIR);

&HEADER;

dbmopen (%P,"$DBM_P",0666);
@VALS = split(/\s/,$P{"$cookies{'pname'}"});
dbmclose %P;
	local($WN_A,$WLV_A) = split(/!/,$VALS[9]);	
	local($WN_B,$WLV_B) = split(/!/,$VALS[10]);
	local($WN_C,$WLV_C) = split(/!/,$VALS[11]);
	local($WN_D,$WLV_D) = split(/!/,$VALS[35]);
	local($WN_E,$WLV_E) = split(/!/,$VALS[36]);
	$WEP_A=$WLV_A%$WEAPON_LVUP;	
	$WEP_B=$WLV_B%$WEAPON_LVUP;	
	$WEP_C=$WLV_C%$WEAPON_LVUP;
	$WEP_D=$WLV_D%$WEAPON_LVUP;	
	$WEP_E=$WLV_E%$WEAPON_LVUP;
	$WLV_A=int$WLV_A/$WEAPON_LVUP;
	$WLV_B=int$WLV_B/$WEAPON_LVUP;
	$WLV_C=int$WLV_C/$WEAPON_LVUP;
	$WLV_D=int$WLV_D/$WEAPON_LVUP;
	$WLV_E=int$WLV_E/$WEAPON_LVUP;

@WN_sA=split(/\,/,$WEAPON_LIST{"$WN_A"});
@WN_sB=split(/\,/,$WEAPON_LIST{"$WN_B"});
@WN_sC=split(/\,/,$WEAPON_LIST{"$WN_C"});
@WN_sD=split(/\,/,$WEAPON_LIST{"$WN_D"});
@WN_sE=split(/\,/,$WEAPON_LIST{"$WN_E"});

if($VALS[10] ne ""){$option10 = "<option value=1>$WN_sB[0](Lv.$WLV_B)";}
if($VALS[11] ne ""){$option11 = "<option value=2>$WN_sC[0](LV.$WLV_C)";}
if($VALS[35] ne ""){$option35 = "<option value=3>$WN_sD[0](Lv.$WLV_D)";}
if($VALS[36] ne ""){$option36 = "<option value=4>$WN_sE[0](LV.$WLV_E)";}

if($option10 ne "" || $option11 ne "" || $option35 ne "" || $option36 ne ""){
print<<"HTML";
<table border=0><tr><td valign=top>
<form aciton=$SCRIPTNM method=POST target=Sub>
<input type=hidden name=cmd value=INBUKI>
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=2>菜偏冷匂竃弁</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR2>竃弁冷匂</td>
<td bgcolor=$TABLE_COLOR1>
<select name=buki $STYLE_B1>$option10$option11$option35$option36</select>
</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2>譜協扮寂</td>
<td bgcolor=$TABLE_COLOR1>$selecttime</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2>兜豚署駆</td>
<td bgcolor=$TABLE_COLOR1><input type=text size=20 name=money $STYLE_B1></td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1 colspan=2 align=right>
署�~峪嬬喘磯叔�久巒�秘
<input type=submit value=竃弁 $STYLE_B1>
</td>
</tr>
</form>
HTML
}

else{
print<<"HTML";
<table border=0><tr><td valign=top>
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=2>菜偏冷匂竃弁</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR1 colspan=2>
�F壓�]嗤販採\冷匂�b�箜�弁。
</td>
</tr>
HTML
}

print<<"HTML";
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=2>菜偏住叟�v雰</td>
</tr>
<tr>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=cmd value=REKISI>
<td bgcolor=$TABLE_COLOR1 colspan=2 align=right><input type=submit value=煽雰 $STYLE_B1></td>
</form>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=2>菜偏�h苧��</td>
</tr>
<tr>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=cmd value=SETUMEI>
<td bgcolor=$TABLE_COLOR1 colspan=2 align=right><input type=submit value=傍苧慕 $STYLE_B1></td>
</form>
</tr>
</table>
</td>
<td valign=top>
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=9>菜偏冷匂竃弁匯誓</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR2 align=center>竃弁宀</td>
<td bgcolor=$TABLE_COLOR2 align=center>冷匂兆(冷匂Lv)</td>
<td bgcolor=$TABLE_COLOR2 align=center>恷詰署�~</td>
<td bgcolor=$TABLE_COLOR2 align=center>�F壓議署�~</td>
<td bgcolor=$TABLE_COLOR2 align=center>�E互�r�X�O協</td>
<td bgcolor=$TABLE_COLOR2 align=center>�Y崩扮寂</td>
<td bgcolor=$TABLE_COLOR2 align=center>�r�X恷互宀</td>
<td bgcolor=$TABLE_COLOR2 align=center>畳協梓�o</td>
<td bgcolor=$TABLE_COLOR2 align=center>���I��</td>
</form>
</tr>
HTML

$onum = @nyuusatu;
$numm = 0;
while($onum >= $numm){
push(@options,"<option value=$nyuusatu[$numm]>+$nyuusatu[$numm]Ｇ");
$numm++;
if($numm == $onum){last;}
}

$gyou = 0;
foreach(@kkk){
$rakusatumode = "";
open(OPENA,"$AUCTIONDIR/$_");
@dada = <OPENA>;
close(OPENA);
$l = 0;
$lognum = @dada;
if($lognum >= 2){$l = $lognum - 1;}
($name,$buki,$owari,$money) = split(/<>/,$dada[0]);
if($l >= 1){($nname,$nowmoney,$com) = split(/<>/,$dada[$l]);}
else{$nowmoney = $money;}
if($nname eq ""){$nname = "�]嗤���I宀";}
if($name eq $cookies{'pname'}){$rakusatumode = 1;}
if($l == 0){$kname = $name;}
else{$kname = $nname;}

local($WN_A,$WLV_A) = split(/!/,$buki);
$WEP_A=$WLV_A%$WEAPON_LVUP;	
$WLV_A=int$WLV_A/$WEAPON_LVUP;
@WN_sA=split(/\,/,$WEAPON_LIST{"$WN_A"});

($sec, $min, $hour, $mday, $mon, $year) = localtime($owari);
$ghour = sprintf("%02d",$hour);
$gmin = sprintf("%02d",$min);
$mon++;
$kitei = "$mon埖$mday晩&nbsp$ghour扮$gmin蛍唯峭";

if($owari <= time || $rakusatumode == 1){$cmd = "<input type=hidden name=cmd value=RAKUSATU><input type=hidden name=pname value=$name><input type=hidden name=rname value=$kname>";$input = "<input type=submit value=�_協 $STYLE_B1>";}
else{$cmd = "<input type=hidden name=cmd value=NYUSATU>";$input = "<input type=submit value=�E�r $STYLE_B1>";}

print<<"TABLE";

<tr>
<form action=$SCRIPTNM method=POST>
$cmd
<input type=hidden name=bukifile value=$_>
<td bgcolor=$TABLE_COLOR2>$name竃弁</td>
<td bgcolor=$TABLE_COLOR1>$WN_sA[0](Lv.$WLV_A)</td>
<td bgcolor=$TABLE_COLOR1 align=right>$moneyＧ</td>
<td bgcolor=$TABLE_COLOR1 align=right>$nowmoneyＧ</td>
<td bgcolor=$TABLE_COLOR1><select name=gaku $STYLE_B1>@options</select></td>
<td bgcolor=$TABLE_COLOR1 align=right>$kitei</td>
<td bgcolor=$TABLE_COLOR1 align=center>$nname</td>
<td bgcolor=$TABLE_COLOR1>$input</td>
<td bgcolor=$TABLE_COLOR1 align=right>$l指</td>
</form>
</tr>
TABLE
$nname = "";
$gyou++;
}
if($gyou == 0){print "<tr><td bgcolor=$TABLE_COLOR1 colspan=9>�嶬擲�弁はありません。</td></tr>";}


print<<"END";
</table>
</td></tr></table>
END
&foot;
exit;
}



sub NYUSATU {
if($cookies{'pname'} eq ""){&ERROR('クッキ！エラ！です。');}

&DBM_INPORT(P);

dbmopen (%P,"$DBM_P",0666);
@VALS = split(/\s/,$P{"$cookies{'pname'}"});
dbmclose %P;


if(!open(OPENA,"$AUCTIONDIR/$FORM{'bukifile'}")){&ERROR('ファイルエラ！です。');}
@dada = <OPENA>;
close(OPENA);

$l = 0;
$lognum = @dada;
if($lognum >= 2){$l = $lognum - 1;}
($name,$buki,$owari,$money) = split(/<>/,$dada[0]);
if($l >= 1){($nname,$nowmoney) = split(/<>/,$dada[$l]);}
else{$nowmoney = $money;}
if($owari < time){&ERROR('秘奬嶮阻扮寂を階えてます。');}
if($nname eq $cookies{'pname'}){&ERROR('銭偬での秘奬は竃栖ません。');}
$ngaku = $nowmoney + $FORM{'gaku'};
if($VALS[8] <= $ngaku){&ERROR('お署が怎りません。');}
&LOCK;
$dada = "$cookies{'pname'}<>$ngaku<>\n";

	open(OUT,">>$AUCTIONDIR/$FORM{'bukifile'}");
	print OUT $dada;
	close(OUT);

&UNLOCK;

&HEADER;

print<<"HTML";
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=2>$nameさん竃弁冷匂への秘奬</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR2>$ngakuＧで秘奬しました。</td>
</tr>
</table>
HTML
&foot;

}

sub RAKUSATU {

&LOCK;
&DBM_INPORT(P);
dbmopen (%P,"$DBM_P",0666);
@VALS = split(/\s/,$P{"$FORM{'rname'}"});
@VS_VAL = split(/\s/,$P{"$FORM{'pname'}"});
dbmclose %P;

if(!open(OPENA,"$AUCTIONDIR/$FORM{'bukifile'}")){&UNLOCK;&ERROR("すでに鯛奬蔀みです。");}
@dada = <OPENA>;
close(OPENA);

if($VALS[10] ne "" && $VALS[11] ne "" && $VALS[35] ne "" && $VALS[35] ne ""){&UNLOCK;&ERROR("$FORM{'rname'}さんの嚠\姥\に腎きが涙いので鯛奬竃栖ません。");exit;}

elsif($VALS[10] eq ""){$yobi = 10;}
elsif($VALS[11] eq ""){$yobi = 11;}
elsif($VALS[35] eq ""){$yobi = 35;}
elsif($VALS[36] eq ""){$yobi = 36;}
else{&UNLOCK;&ERROR('侭隔冷匂ＤＢオ！プンエラ！');}

$l = 0;
$lognum = @dada;
if($lognum >= 2){$l = $lognum - 1;}
($name,$buki,$owari,$money) = split(/<>/,$dada[0]);
if($l >= 1){($nname,$nowmoney) = split(/<>/,$dada[$l]);}
else{$nname = $name;$nowmoney = $money;}

	local($WN_A,$WLV_A) = split(/!/,$buki);	
	$WEP_A=$WLV_A%$WEAPON_LVUP;	
	$WLV_A=int$WLV_A/$WEAPON_LVUP;
	@WN_sA=split(/\,/,$WEAPON_LIST{"$WN_A"});

if($FORM{'rname'} ne $FORM{'pname'}){
$VALS[8] = $VALS[8] - $nowmoney;
$VS_VAL[8] = $VS_VAL[8] + $nowmoney;
$VALS[$yobi] = $buki;
}
else{$VS_VAL[$yobi] = $buki;}


unlink "$AUCTIONDIR/$FORM{'bukifile'}";

	dbmopen (%P,"$DBM_P",0666);
	$P{"$FORM{'rname'}"}="@VALS";
	$P{"$FORM{'pname'}"}="@VS_VAL";
	dbmclose %P;

open(OPENB,"$rireki");
@hanako = <OPENB>;
close(OPENB);

$ti = time;

if($lognum != 1){
while($rmax < @hanako){pop(@hanako);}
unshift(@hanako,"$ti<>$name<>$nname<>$WN_sA[0](Lv.$WLV_A)<>$nowmoney<>$money<>$l<>\n");
open(OUT,">$rireki");
print OUT @hanako;
close(OUT);
}
else{
while($rmax < @hanako){pop(@hanako);}
unshift(@hanako,"1<>$name<>$nname<>$WN_sA[0](Lv.$WLV_A)[0]<>$nowmoney<>$money<>$l<>\n");
open(OUT,">$rireki");
print OUT @hanako;
close(OUT);
}


&UNLOCK;

&HEADER;
print<<"HTML";
<table border=0><tr><td valign=top>
<form aciton=$SCRIPTNM method=POST target=Sub>
<input type=hidden name=cmd value=INBUKI>
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=2>菜偏���I潤惚</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR2>竃弁冷匂</td>
<td bgcolor=$TABLE_COLOR1>$WN_sA[0](Lv.$WLV_A)</td>
</tr>

<tr>
<td bgcolor=$TABLE_COLOR2>竃弁宀</td>
<td bgcolor=$TABLE_COLOR1>$nameさん</td>
</tr>

<tr>
<td bgcolor=$TABLE_COLOR2>鯛奬宀</td>
<td bgcolor=$TABLE_COLOR1>$nnameさん</td>
</tr>

<tr>
<td bgcolor=$TABLE_COLOR2>鯛奬署駆</td>
<td bgcolor=$TABLE_COLOR1>$nowmoneyＧ</td>
</tr>

<tr>
<td bgcolor=$TABLE_COLOR2>秘奬指方</td>
<td bgcolor=$TABLE_COLOR1>$l指</td>
</tr>
</table>
HTML
&foot;
}



sub foot{
print "<br><br><br><input type=button value=\"菜偏\" $STYLE_B1 onClick=\"parent.Sub.location.replace('./$SCRIPTNM')\"><br><br><br>\n
<div align=center><font size=2>PROGRAMING:(C) 2002 - <a href=http://melcha.zone.ne.jp/ target=_blank><font size=2>44NET FACTORY</font></a> - All Right Reserved.</font></div><p>";
&FOOTER;
print<<"FOOT";
</body>
</html>
FOOT
exit;
}



