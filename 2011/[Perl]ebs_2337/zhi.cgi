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
#
##################################################################
#
#---------------ENDLESSBATTLEスクリプトへの弖紗-------------------
#
# 1.ebs_sub3.cgiの<input type=button>などのコマンドボタンがある魁侭に
#   參和の佩を弖紗してください。
#
# <td><input type=button value="牽哈" $STYLE_B1 onClick="parent.Sub.location.replace('./このスクリプトの兆念')"></td>
#
# このスクリプトの兆念　と慕かれている何蛍をこのスクリプトの兆念に延えてください。
#
# 2._hash.dataの販吭の魁侭に、參和の２佩を弖紗してください。
#
# "hojoken"=>"蓮嗤�V墳,0,0,0,0,0,0,0,100",
# "hukubiki"=>"互�_鶴跳栽署,0,0,0,0,0,0,0,100",
#
# アイテムＩＤは延厚しないで和さい。恷瘁の100という方忖が秘返鳩楕になります。
#
##################################################################
#光嶽譜協

$SCRIPTNM="zhi.cgi";	#花垂スクリプト兆
$HUKUBIKIDB="zhidb";		#冷匂垂デ！タを鯉追する�┘僉�ミッション７７７��
$rekisi = "1";			#匯吉が輝たった扮に煽雰に燕幣する魁栽は１、燕幣しないなら0を磯叔で芝秘してください。
$TABLE_STYLE = "bordercolor=#404040 border=1 cellspacing=0 style=\"font-size:10pt\"";#<TABLE>のスタイルです。
require 'ebs_sub1.cgi';		#ebs_sub1.cgiのスクリプト兆
require "./$LOG_FOLDER/$HASH_DATA";	#ハッシュデ！タの魁侭�┗筝�音勣��

#####################################################################################################################
#尚瞳となるアイテム兆です。參和３つの@の嶄附は畠て揖じ方に栽わせて和さい。(６倖なら６倖と��

@keihin = ("及匯仇�zカイ�`ナ","吸舒從高��","霜藍篤表州，剃�豢�","爺貧爺和廷�啀�哩��","跡符高崩��","高崩襖(握栓某�y��狼�yALICE��","郡����","仔署州","２�B廾致紗送腺徨�h","廷薦編恬敬�萸郵睚�州");

#####################################################################################################
#_hash.data坪の恣迦に芝墮してあるアイテム喘ＩＤです。貧芝のアイテム兆に栽わせて揖じように芝秘してください。

@hash = ("v","x","dcccaa","cccaaaa","eeaa","rrrrc","hhhh","qqqqq","ibb","ssss");

#################################################################################################
#アイテムの輝たる鳩楕です。貧芝２嶽窃の輝たる鳩楕を1000蛍のいくつかを慕いてください。
#匯桑恣から方が寄きくなっていくようにして、恷瘁の方忖はかならず１０００になるようにして和さい。

@kakuritu = ("10","25","50","100","150","200","250","300","350","1000");

#譜協ここまで
##################################################################
#ここから和の何蛍はperlを聞喘したプログラムです。個夛竃栖る袈律で延厚してください。

@pair = split(/;/, $ENV{'HTTP_COOKIE'});
foreach (@pair) {
my($key, $value) = split(/=/, $_);
$key =~ s/ //g;
$DUMMY{$key} = $value;
}
@pairs = split(/,/,$DUMMY{EB});
foreach (@pairs) {
my($key, $value) = split(/:/, $_);
$cookies{$key} = $value;
}

if($cookies{'pname'} eq "" && $FORM{'pname'} eq ""){&COOKIE_IN;}

$inname = $FORM{'pname'};
$inpass = $FORM{'pass'};
if($inname eq ""){$inname = $cookies{'pname'};$inpass = $cookies{'pass'};}

if($SUB){&ERROR('岷リンクは鋤峭です','秘り笥からのアクセスお垳いします。') if $ENV{'HTTP_REFERER'} !~ m/^$THIS_DIR/ && $DIRECT_LINK && $SUB ne 'MY_LIST' && $SUB ne 'C_LIST';}

!$SUB && ($SUB='MAIN');

&$SUB;

sub COOKIE_IN {

&HEADER;
print<<"HTML";
<table border=0 width=100% height=90%><tr><td align=center valign=middle>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=cmd value=MAIN>
<table $TABLE_STYLE>
<tr><td bgcolor=$TABLE_COLOR2 colspan=2>冷匂�u夛�S</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR2>兆�Q</td>
<td bgcolor=$TABLE_COLOR1><input type=text size=30 name=pname $STYLE_B1></td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2>畜�a</td>
<td bgcolor=$TABLE_COLOR1><input type=password size=30 name=pass $STYLE_B1></td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1 colspan=2 align=right><input type=submit value=畳協 $STYLE_B1></td>
</tr>
</table>
</td></tr></table>
</form>
HTML
&END;
exit;
}


sub SETUMEI {

&HEADER;
print<<"HTML";
<table $TABLE_STYLE>
<tr><td bgcolor=$TABLE_COLOR2>�u夛�h苧</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR1>
媾況嶄辛參鎮欺蓮嗤�V墳才互�_鶴跳栽署。<br>
辛參喘�@乂�u夛冷匂��最最。<br>
互�_鶴跳栽署匯��賜宀、蓮嗤�V墳励����祥嬬�u夛匯��冷匂 。<p>
圭隈頁焚�當悖�徭失����。<p>
1��峪嗤誼欺�V墳賜宀互�_鶴跳栽署嘉嬬�u夛<br>
2��埆互��議冷匂祥埆掴�u夛竃��<br><p>
<table>
HTML

$i = 0;
foreach(@keihin){
$j = $i + 1;
print<<"TABLE";
<tr>
<td bgcolor=$TABLE_COLOR2>$j吉</td>
<td bgcolor=$TABLE_COLOR1>$keihin[$i]</td>
</tr>
TABLE
$i++;
}

print<<"SAIGO";
</table>
</td></tr></table>
<br><br><br><br><br>
<input type=button value="卦指" $STYLE_B1 onClick="parent.Sub.location.replace('./$SCRIPTNM')">
SAIGO
&END;
exit;
}

sub HUKUBIKI {

&LOCK;
&DBM_INPORT(P);
dbmopen (%P,"$DBM_P",0666);
@VALS = split(/\s/,$P{"$inname"});
if($VALS[26] > $FORM{'time'}){&ERROR("タイムエラ！です。");}

$randam = int(rand(1000));
$i = 0;

foreach $number (@kakuritu){

if($number >= $randam){$atari = $i;last;}

$i++;
}

if($atari eq ""){&ERROR('�u夛払�　�');}

$buki = $keihin[$atari];
$bukin = $hash[$atari];
$tou = $atari + 1;

if($FORM{'mode'} == 2){
if($VALS[10] ne ""){dbmclose %P;&UNLOCK;&ERROR('附貧�b���M阻。');}
$VALS[10] = "$bukin";
}

elsif($FORM{'mode'} == 3){
if($VALS[11] ne ""){dbmclose %P;&UNLOCK;&ERROR('附貧�b���M阻。');}
$VALS[11] = "$bukin";}

elsif($FORM{'mode'} == 4){
if($VALS[35] ne ""){dbmclose %P;&UNLOCK;&ERROR('附貧�b���M阻。');}
$VALS[35] = "$bukin";}

elsif($FORM{'mode'} == 5){
if($VALS[36] ne ""){dbmclose %P;&UNLOCK;&ERROR('附貧�b���M阻。');}
$VALS[36] = "$bukin";}

else{dbmclose %P;&UNLOCK;&ERROR('エラ！のためはずれです。');}

$VALS[26] = $DATE;

$P{"$inname"}="@VALS";
dbmclose %P;

if($atari == 0 && $rekisi == 1){
dbmopen (%DH,"$DBM_H",0666);
$DH{"$DATE"}="$inname�u夛阻$buki秘返。";
dbmclose %DH;
}

&UNLOCK;

&HEADER;
print<<"HTML";
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2>$tou�V墳</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR1>
$tou吉冷匂$buki資誼阻。
</td></tr></table>
HTML
&END;
exit;
}

sub INPORT {
tie %NOTE,AnyDBM_File,"$HUKUBIKIDB",O_RDONLY,0666;
%KEN=%NOTE;
untie %NOTE;
}

sub MAIN {

&DBM_INPORT(P);
@VALS = split(/\s/,$P{"$inname"});
if(crypt($inpass,eb) ne "$VALS[2]"){&ERROR("畜�a�e�`。");}

&INPORT;
@ken = split(/\s/,$KEN{"$inname"});

if($ken[0] ne ""){$no1 = "¢";}else{$no1 = "＄";}
if($ken[1] ne ""){$no2 = "¢";}else{$no2 = "＄";}
if($ken[2] ne ""){$no3 = "¢";}else{$no3 = "＄";}
if($ken[3] ne ""){$no4 = "¢";}else{$no4 = "＄";}
if($ken[4] ne ""){$no5 = "¢";}else{$no5 = "＄";}

local($WN_A,$WLV_A) = split(/!/,$VALS[9]);	
local($WN_B,$WLV_B) = split(/!/,$VALS[10]);
local($WN_C,$WLV_C) = split(/!/,$VALS[11]);
local($WN_D,$WLV_D) = split(/!/,$VALS[35]);
local($WN_E,$WLV_E) = split(/!/,$VALS[36]);

if($WN_B eq "hukubiki" || $WN_B eq "hojoken"){$submit1 = "<input type=submit value=函竃 $STYLE_B1>";}
if($WN_C eq "hukubiki" || $WN_C eq "hojoken"){$submit2 = "<input type=submit value=函竃 $STYLE_B1>";}
if($WN_D eq "hukubiki" || $WN_D eq "hojoken"){$submit3 = "<input type=submit value=函竃 $STYLE_B1>";}
if($WN_E eq "hukubiki" || $WN_E eq "hojoken"){$submit4 = "<input type=submit value=函竃 $STYLE_B1>";}

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

if($WN_B ne ""){$SB = "$WN_sB[0](Lv.$WLV_B)";}else{$SB = "涙廾姥";}
if($WN_C ne ""){$SC = "$WN_sC[0](Lv.$WLV_C)";}else{$SC = "涙廾姥";}
if($WN_D ne ""){$SD = "$WN_sD[0](Lv.$WLV_D)";}else{$SD = "涙廾姥";}
if($WN_E ne ""){$SE = "$WN_sE[0](Lv.$WLV_E)";}else{$SE = "涙廾姥";}

&HEADER;
print<<"HTML";
<table border=0><tr><td valign=top>
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=3>$innameの廾姥\</b></td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2>廾姥\</td>
<td bgcolor=$TABLE_COLOR1>$WN_sA[0](Lv.$WLV_A)</td>
<td bgcolor=$TABLE_COLOR1></td>
</tr>
<tr>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=pname value=$inname>
<input type=hidden name=pass value=$inpass>
<input type=hidden name=cmd value=IRERU>
<input type=hidden name=mode value=1>
<input type=hidden name=tik1 value=$WN_B>
<td bgcolor=$TABLE_COLOR2>嚠\姥\</td>
<td bgcolor=$TABLE_COLOR1>$SB</td>
<td bgcolor=$TABLE_COLOR1>$submit1</td>
</form>
</tr>
<tr>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=pname value=$inname>
<input type=hidden name=pass value=$inpass>
<input type=hidden name=cmd value=IRERU>
<input type=hidden name=mode value=2>
<input type=hidden name=tik2 value=$WN_C>
<td bgcolor=$TABLE_COLOR2>嚠\姥\</td>
<td bgcolor=$TABLE_COLOR1>$SC</td>
<td bgcolor=$TABLE_COLOR1>$submit2</td>
</form>
</tr>
<tr>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=pname value=$inname>
<input type=hidden name=pass value=$inpass>
<input type=hidden name=cmd value=IRERU>
<input type=hidden name=mode value=3>
<input type=hidden name=tik3 value=$WN_D>
<td bgcolor=$TABLE_COLOR2>嚠\姥\</td>
<td bgcolor=$TABLE_COLOR1>$SD</td>
<td bgcolor=$TABLE_COLOR1>$submit3</td>
</form>
</tr>
<tr>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=pname value=$inname>
<input type=hidden name=pass value=$inpass>
<input type=hidden name=cmd value=IRERU>
<input type=hidden name=mode value=4>
<input type=hidden name=tik4 value=$WN_E>
<td bgcolor=$TABLE_COLOR2>嚠\姥\</td>
<td bgcolor=$TABLE_COLOR1>$SE</td>
<td bgcolor=$TABLE_COLOR1>$submit4</td>
</form>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=3>温廁傍苧</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1 colspan=3>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=pname value=$inname>
<input type=hidden name=pass value=$inpass>
<input type=hidden name=cmd value=SETUMEI>
<input type=submit value="傍苧慕" $STYLE_B1>
</td>
</tr>
</form>
</table>

</td>
<td valign=top>
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=2>蓮嗤�V墳\��晒侭</b></td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1>１</td>
<td bgcolor=$TABLE_COLOR1 align=center>$no1</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1>２</td>
<td bgcolor=$TABLE_COLOR1 align=center>$no2</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1>３</td>
<td bgcolor=$TABLE_COLOR1 align=center>$no3</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1>４</td>
<td bgcolor=$TABLE_COLOR1 align=center>$no4</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1>５</td>
<td bgcolor=$TABLE_COLOR1 align=center>$no5</td>
</tr>
</table>
</td></tr></table>
HTML
&END;
exit;
}

sub END {
print "<div align=center><font size=2>嶄猟晒個夛:(C) 2002 - <a href=http://www.verytown.com/ target=_blank><font size=2>掲械廓偏</font></a> - All Right Reserved.</font></div><p>";
&FOOTER;
print<<"HTML";
</body>
</html>
HTML
exit;
}

sub IRERU {

&DBM_INPORT(P);
&LOCK;
dbmopen (%P,"$DBM_P",0666);
@VALS = split(/\s/,$P{"$inname"});
if(crypt($inpass,eb) ne "$VALS[2]"){dbmclose %P;&UNLOCK;&ERROR("畜�a�e�`。");}

local($WN_B,$WLV_B) = split(/!/,$VALS[10]);	
local($WN_C,$WLV_C) = split(/!/,$VALS[11]);
local($WN_D,$WLV_D) = split(/!/,$VALS[35]);
local($WN_E,$WLV_E) = split(/!/,$VALS[36]);

if($FORM{'mode'} == 1 && $WN_B eq $FORM{'tik1'}){
$VALS[10] = "";
$num = 2;
}
elsif($FORM{'mode'} == 2 && $WN_C eq $FORM{'tik2'}){
$VALS[11] = "";
$num = 3;
}
elsif($FORM{'mode'} == 3 && $WN_D eq $FORM{'tik3'}){
$VALS[35] = "";
$num = 4;
}
elsif($FORM{'mode'} == 4 && $WN_E eq $FORM{'tik4'}){
$VALS[36] = "";
$num = 5;
}
else{dbmclose %P;&UNLOCK;&ERROR('圻咀音苧。');exit;}

$P{"$inname"}="@VALS";
dbmclose %P;

if($FORM{'tik1'} eq "hukubiki"){&UNLOCK;&hukubiki;exit;}
if($FORM{'tik2'} eq "hukubiki"){&UNLOCK;&hukubiki;exit;}
if($FORM{'tik3'} eq "hukubiki"){&UNLOCK;&hukubiki;exit;}
if($FORM{'tik4'} eq "hukubiki"){&UNLOCK;&hukubiki;exit;}

&INPORT;

@ken = split(/\s/,$KEN{"$inname"});

if($ken[0] eq ""){$ken[0] = "hojoken";}
elsif($ken[1] eq ""){$ken[1] = "hojoken";}
elsif($ken[2] eq ""){$ken[2] = "hojoken";}
elsif($ken[3] eq ""){$ken[3] = "hojoken";}
elsif($ken[4] eq ""){$ken[4] = "hojoken";}
elsif($ken[5] eq ""){$ken[5] = "hojoken";}
else{dbmclose %P;&UNLOCK;&ERROR('圻咀音苧祥払�〜法�');}

if($ken[0] eq "hojoken" && $ken[1] eq "hojoken" && $ken[2] eq "hojoken" && $ken[3] eq "hojoken" && $ken[4] eq "hojoken"){$ken[0]=$ken[1]=$ken[2]=$ken[3]=$ken[4]="";$hukubiki = 1;}

@VALUES="$ken[0] $ken[1] $ken[2] $ken[3] $ken[4]";

dbmopen (%KENIN,"$HUKUBIKIDB",0666);
$KENIN{"$inname"}="@VALUES";
dbmclose %KENIN;

&UNLOCK;
if($hukubiki == 1){&hukubiki;exit;}
&MAIN;
}

sub hukubiki {
&HEADER;
print<<"HTML";
<table $TABLE_STYLE>
<tr>
<td colspan=2 bgcolor=$TABLE_COLOR2>辛參�u夛議</td></tr>
HTML
$i = 0;

foreach(@keihin){
$j = $i + 1;
print<<"TABLE";
<tr>
<td bgcolor=$TABLE_COLOR2>$j吉</td>
<td bgcolor=$TABLE_COLOR1>$keihin[$i]</td>
</tr>
TABLE
$i++;
}

print<<"SAIGO";
<tr>
<td colspan=2 bgcolor=$TABLE_COLOR2>冷匂�u夛�S</td></tr>
<tr>
<td colspan=2 bgcolor=$TABLE_COLOR1 align=center>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=pname value=$inname>
<input type=hidden name=pass value=$inpass>
<input type=hidden name=time value=$DATE>
<input type=hidden name=cmd value=HUKUBIKI>
<input type=hidden name=mode value=$num>
<input type=submit value=�u夛冷匂 $STYLE_B1></form>
</td></tr></table>
SAIGO

&END;
exit;
}
