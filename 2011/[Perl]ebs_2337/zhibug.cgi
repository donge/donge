#!/usr/bin/perl

##################################################################
#
# -------利用规定について-----------------------------------------
# このスクリプトはNET GAME Communications「http://www.ngcoms.net/」
# で配布しているENDLESSBATTLE2の追加プログラムです。
#
# このスクリプトはフリ—ソフトですが著作权は放弃しておりません。
# このスクリプトを使用する方は以下の利用规定に基づき使用してください。
#
# 1.このスクリプトを使用し何らかの损害があったとしても、作者及び当サイ
#   トに责任は无い物とします。
# 2.改造等はご自由に行えますが、个人の责任において行ってください
# 3.再配布はご自由に行える物としますが、著作权表示を削除しないで
#   下さい
#
##################################################################
#
#---------------ENDLESSBATTLEスクリプトへの追加-------------------
#
# 1.ebs_sub3.cgiの<input type=button>などのコマンドボタンがある场所に
#   以下の行を追加してください。
#
# <td><input type=button value="福引" $STYLE_B1 onClick="parent.Sub.location.replace('./このスクリプトの名前')"></td>
#
# このスクリプトの名前　と书かれている部分をこのスクリプトの名前に变えてください。
#
# 2._hash.dataの任意の场所に、以下の２行を追加してください。
#
# "hojoken"=>"稀有礦石,0,0,0,0,0,0,0,100",
# "hukubiki"=>"高達尼姆合金,0,0,0,0,0,0,0,100",
#
# アイテムＩＤは变更しないで下さい。最後の100という数字が入手确率になります。
#
##################################################################
#各种设定

$SCRIPTNM="zhi.cgi";	#仓库スクリプト名
$hukubikiDB="zhidb";		#武器库デ—タを格纳する（パ—ミッション７７７）
$rekisi = "1";			#一等が当たった时に历史に表示する场合は１、表示しないなら0を半角で记入してください。
$TABLE_STYLE = "bordercolor=#404040 border=1 cellspacing=0 style=\"font-size:10pt\"";#<TABLE>のスタイルです。
require 'ebs_sub1.cgi';		#ebs_sub1.cgiのスクリプト名
require "./$LOG_FOLDER/$HASH_DATA";	#ハッシュデ—タの场所（变更不要）

#####################################################################################################################
#景品となるアイテム名です。以下３つの@の中身は全て同じ数に合わせて下さい。(６个なら６个と）

@keihin = ("第一地獄カイーナ","天上天下念動爆碎劍","超合金光束刀","灭狱剑","干扰装置","EXAM(赛可谬系統)强化装置4","黄金剑","绝对零度","念力试作飞翔型光束剑");

#####################################################################################################
#_hash.data内の左侧に记载してあるアイテム用ＩＤです。上记のアイテム名に合わせて同じように记入してください。

@hash = ("v","cccaaa","aaaaaa","ccccc","sssssc","pppp","qqqqq","occ","ssss");

#################################################################################################
#アイテムの当たる确率です。上记２种类の当たる确率を1000分のいくつかを书いてください。
#一番左から数が大きくなっていくようにして、最後の数字はかならず１０００になるようにして下さい。

@kakuritu = ("5","10","100","150","200","400","500","600","1000");

#设定ここまで
##################################################################
#ここから下の部分はperlを使用したプログラムです。改造出来る范围で变更してください。

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

if($SUB){&ERROR('直リンクは禁止です','入り口からのアクセスお愿いします。') if $ENV{'HTTP_REFERER'} !~ m/^$THIS_DIR/ && $DIRECT_LINK && $SUB ne 'MY_LIST' && $SUB ne 'C_LIST';}

!$SUB && ($SUB='MAIN');

&$SUB;

sub COOKIE_IN {

&HEADER;
print<<"HTML";
<table border=0 width=100% height=90%><tr><td align=center valign=middle>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=cmd value=MAIN>
<table $TABLE_STYLE>
<tr><td bgcolor=$TABLE_COLOR2 colspan=2>武器製造廠</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR2>名稱</td>
<td bgcolor=$TABLE_COLOR1><input type=text size=30 name=pname $STYLE_B1></td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2>密碼</td>
<td bgcolor=$TABLE_COLOR1><input type=password size=30 name=pass $STYLE_B1></td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1 colspan=2 align=right><input type=submit value=决定 $STYLE_B1></td>
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
<tr><td bgcolor=$TABLE_COLOR2>製造説明</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR1>
战斗中可以拿到稀有礦石和高達尼姆合金。<br>
可以用這些製造武器，呵呵。<br>
高達尼姆合金一個或者、稀有礦石五個，就能製造一個武器 。<p>
方法是什麽呢，自己試驗。<p>
１．自己試驗，別什麽都問<br><p>
<table>
HTML

$i = 0;
foreach(@keihin){
$j = $i + 1;
print<<"TABLE";
<tr>
<td bgcolor=$TABLE_COLOR2>$j等</td>
<td bgcolor=$TABLE_COLOR1>$keihin[$i]</td>
</tr>
TABLE
$i++;
}

print<<"SAIGO";
</table>
</td></tr></table>
<br><br><br><br><br>
<input type=button value="返回" $STYLE_B1 onClick="parent.Sub.location.replace('./$SCRIPTNM')">
SAIGO
&END;
exit;
}

sub hukubiki {

&LOCK;
&DBM_INPORT(P);
dbmopen (%P,"$DBM_P",0666);
@VALS = split(/\s/,$P{"$inname"});
if($VALS[26] > $FORM{'time'}){&ERROR("タイムエラ—です。");}

$randam = int(rand(2000));
$i = 0;

foreach $number (@kakuritu){

if($number >= $randam){$atari = $i;last;}

$i++;
}

if($atari eq ""){&ERROR('エラ—でハズレです。');}

$buki = $keihin[$atari];
$bukin = $hash[$atari];
$tou = $atari + 1;

if($FORM{'mode'} == 2){
if($VALS[10] ne ""){dbmclose %P;&UNLOCK;&ERROR('身上裝備滿了。');}
$VALS[10] = "$bukin";
}

elsif($FORM{'mode'} == 3){
if($VALS[11] ne ""){dbmclose %P;&UNLOCK;&ERROR('身上裝備滿了。');}
$VALS[11] = "$bukin";}

elsif($FORM{'mode'} == 4){
if($VALS[35] ne ""){dbmclose %P;&UNLOCK;&ERROR('身上裝備滿了。');}
$VALS[35] = "$bukin";}

elsif($FORM{'mode'} == 5){
if($VALS[36] ne ""){dbmclose %P;&UNLOCK;&ERROR('身上裝備滿了。');}
$VALS[36] = "$bukin";}

else{dbmclose %P;&UNLOCK;&ERROR('エラ—のためはずれです。');}

$VALS[26] = $DATE;

$P{"$inname"}="@VALS";
dbmclose %P;

if($atari == 0 && $rekisi == 1){
dbmopen (%DH,"$DBM_H",0666);
$DH{"$DATE"}="$inname製造了$buki入手。";
dbmclose %DH;
}

&UNLOCK;

&HEADER;
print<<"HTML";
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2>$tou礦石</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR1>
$tou礦石$buki获得了。
</td></tr></table>
HTML
&END;
exit;
}

sub INPORT {
tie %NOTE,AnyDBM_File,"$hukubikiDB",O_RDONLY,0666;
%KEN=%NOTE;
untie %NOTE;
}

sub MAIN {

&DBM_INPORT(P);
@VALS = split(/\s/,$P{"$inname"});
if(crypt($inpass,eb) ne "$VALS[2]"){&ERROR("密碼錯誤。");}

&INPORT;
@ken = split(/\s/,$KEN{"$inname"});

if($ken[0] ne ""){$no1 = "●";}else{$no1 = "○";}
if($ken[1] ne ""){$no2 = "●";}else{$no2 = "○";}
if($ken[2] ne ""){$no3 = "●";}else{$no3 = "○";}
if($ken[3] ne ""){$no4 = "●";}else{$no4 = "○";}
if($ken[4] ne ""){$no5 = "●";}else{$no5 = "○";}

local($WN_A,$WLV_A) = split(/!/,$VALS[9]);	
local($WN_B,$WLV_B) = split(/!/,$VALS[10]);
local($WN_C,$WLV_C) = split(/!/,$VALS[11]);
local($WN_D,$WLV_D) = split(/!/,$VALS[35]);
local($WN_E,$WLV_E) = split(/!/,$VALS[36]);

if($WN_B eq "hukubiki" || $WN_B eq "hojoken"){$submit1 = "<input type=submit value=取出 $STYLE_B1>";}
if($WN_C eq "hukubiki" || $WN_C eq "hojoken"){$submit2 = "<input type=submit value=取出 $STYLE_B1>";}
if($WN_D eq "hukubiki" || $WN_D eq "hojoken"){$submit3 = "<input type=submit value=取出 $STYLE_B1>";}
if($WN_E eq "hukubiki" || $WN_E eq "hojoken"){$submit4 = "<input type=submit value=取出 $STYLE_B1>";}

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

if($WN_B ne ""){$SB = "$WN_sB[0](Lv.$WLV_B)";}else{$SB = "无装备";}
if($WN_C ne ""){$SC = "$WN_sC[0](Lv.$WLV_C)";}else{$SC = "无装备";}
if($WN_D ne ""){$SD = "$WN_sD[0](Lv.$WLV_D)";}else{$SD = "无装备";}
if($WN_E ne ""){$SE = "$WN_sE[0](Lv.$WLV_E)";}else{$SE = "无装备";}

&HEADER;
print<<"HTML";
<table border=0><tr><td valign=top>
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=3>$innameの装备\</b></td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2>装备\</td>
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
<td bgcolor=$TABLE_COLOR2>予\备\</td>
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
<td bgcolor=$TABLE_COLOR2>予\备\</td>
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
<td bgcolor=$TABLE_COLOR2>予\备\</td>
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
<td bgcolor=$TABLE_COLOR2>予\备\</td>
<td bgcolor=$TABLE_COLOR1>$SE</td>
<td bgcolor=$TABLE_COLOR1>$submit4</td>
</form>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=3>补助说明</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1 colspan=3>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=pname value=$inname>
<input type=hidden name=pass value=$inpass>
<input type=hidden name=cmd value=SETUMEI>
<input type=submit value="说明书" $STYLE_B1>
</td>
</tr>
</form>
</table>

</td>
<td valign=top>
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=2>稀有礦石\鍊化所</b></td>
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
print "<div align=center><font size=2>中文化改造:(C) 2002 - <a href=http://www.verytown.com/ target=_blank><font size=2>非常城市</font></a> - All Right Reserved.</font></div><p>";
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
if(crypt($inpass,eb) ne "$VALS[2]"){dbmclose %P;&UNLOCK;&ERROR("密碼錯誤。");}

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
else{dbmclose %P;&UNLOCK;&ERROR('原因不明。');exit;}

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
else{dbmclose %P;&UNLOCK;&ERROR('原因不明。');}

if($ken[0] eq "hojoken" && $ken[1] eq "hojoken" && $ken[2] eq "hojoken" && $ken[3] eq "hojoken" && $ken[4] eq "hojoken"){$ken[0]=$ken[1]=$ken[2]=$ken[3]=$ken[4]="";$hukubiki = 1;}

@VALUES="$ken[0] $ken[1] $ken[2] $ken[3] $ken[4]";

dbmopen (%KENIN,"$hukubikiDB",0666);
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
<td colspan=2 bgcolor=$TABLE_COLOR2>製造出</td></tr>
HTML
$i = 0;

foreach(@keihin){
$j = $i + 1;
print<<"TABLE";
<tr>
<td bgcolor=$TABLE_COLOR2>$j等</td>
<td bgcolor=$TABLE_COLOR1>$keihin[$i]</td>
</tr>
TABLE
$i++;
}

print<<"SAIGO";
<tr>
<td colspan=2 bgcolor=$TABLE_COLOR2>武器製造廠</td></tr>
<tr>
<td colspan=2 bgcolor=$TABLE_COLOR1 align=center>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=pname value=$inname>
<input type=hidden name=pass value=$inpass>
<input type=hidden name=time value=$DATE>
<input type=hidden name=cmd value=hukubiki>
<input type=hidden name=mode value=$num>
<input type=submit value=製造武器 $STYLE_B1></form>
</td></tr></table>
SAIGO

&END;
exit;
}
