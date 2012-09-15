#!/usr/local/bin/perl

##################################################################
#
# -------利用規定について-----------------------------------------
# このスクリプトはNET GAME Communications「http://www.ngcoms.net/」
# で配布しているENDLESSBATTLE2の追加プログラムです。
#
# このスクリプトはフリーソフトですが著作権は放棄しておりません。
# このスクリプトを使用する方は以下の利用規定に基づき使用してください。
#
# 1.このスクリプトを使用し何らかの損害があったとしても、作者及び当サイ
#   トに責任は無い物とします。
# 2.改造等はご自由に行えますが、個人の責任において行ってください
# 3.再配布はご自由に行える物としますが、著作権表示を削除しないで
#   下さい
# SCRIPT NAME	EBS HUKUBIKI ver 2.1
# HOMEPAGE 	http://melcha.zone.ne.jp/ebs/dl/
# E-MAIL 	44net@kk.sakura.ne.jp
# (C)2001 44-net FACTORY
#
##################################################################
#
#---------------ENDLESSBATTLEスクリプトへの追加-------------------
#
# 1.ebs_sub3.cgiの<input type=button>などのコマンドボタンがある場所に
#   以下の行を追加してください。
#
# <td><input type=button value="福引" $STYLE_B1 onClick="parent.Sub.location.replace('./このスクリプトの名前')"></td>
#
# このスクリプトの名前　と書かれている部分をこのスクリプトの名前に変えてください。
#
# 2._hash.dataの任意の場所に、以下の２行を追加してください。
#
# "hojoken"=>"福引補助券,0,0,0,0,0,0,0,100",
# "hukubiki"=>"福引券,0,0,0,0,0,0,0,100",
#
# アイテムＩＤは変更しないで下さい。最後の100という数字が入手確率になります。
#
##################################################################
#各種設定

$SCRIPTNM="hukubiki.cgi";	#倉庫スクリプト名
$HUKUBIKIDB="hukubikidb";		#武器庫データを格納する（パーミッション７７７）
$rekisi = "1";			#一等が当たった時に歴史に表示する場合は１、表示しないなら0を半角で記入してください。
$TABLE_STYLE = "bordercolor=#404040 border=1 cellspacing=0 style=\"font-size:10pt\"";#<TABLE>のスタイルです。
require 'ebs_sub1.cgi';		#ebs_sub1.cgiのスクリプト名
require "./$LOG_FOLDER/$HASH_DATA";	#ハッシュデータの場所（変更不要）

#####################################################################################################################
#景品となるアイテム名です。以下３つの@の中身は全て同じ数に合わせて下さい。(６個なら６個と）

@keihin = ("爆導策","バグ","核機雷","対艦機雷","機雷");

#####################################################################################################
#_hash.data内の左側に記載してあるアイテム用ＩＤです。上記のアイテム名に合わせて同じように記入してください。

@hash = ("kkkkk","kkkk","kkk","kk","k");

#################################################################################################
#アイテムの当たる確率です。上記２種類の当たる確率を1000分のいくつかを書いてください。
#一番左から数が大きくなっていくようにして、最後の数字はかならず１０００になるようにして下さい。

@kakuritu = ("10","100","300","600","1000");

#設定ここまで
##################################################################
#ここから下の部分はperlを使用したプログラムです。改造出来る範囲で変更してください。

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

if($SUB){&ERROR('直リンクは禁止です','入り口からのアクセスお願いします。') if $ENV{'HTTP_REFERER'} !~ m/^$THIS_DIR/ && $DIRECT_LINK && $SUB ne 'MY_LIST' && $SUB ne 'C_LIST';}

!$SUB && ($SUB='MAIN');

&$SUB;

sub COOKIE_IN {

&HEADER;
print<<"HTML";
<table border=0 width=100% height=90%><tr><td align=center valign=middle>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=cmd value=MAIN>
<table $TABLE_STYLE>
<tr><td bgcolor=$TABLE_COLOR2 colspan=2>福引所入り口</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR2>名前</td>
<td bgcolor=$TABLE_COLOR1><input type=text size=30 name=pname $STYLE_B1></td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2>パスワード</td>
<td bgcolor=$TABLE_COLOR1><input type=password size=30 name=pass $STYLE_B1></td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1 colspan=2 align=right><input type=submit value=決定 $STYLE_B1></td>
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
<tr><td bgcolor=$TABLE_COLOR2>福引の説明</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR1>
戦闘中に福引券や福引補助券を拾うことがあります。<br>
福引を行うことにより、素敵な景品が当たります。<br>
福引券は１枚、福引補助券は５枚で、１回だけ福引を行うことが出来ます。<p>
福引の使用方法は以下のとおりになります。<p>
１．手に入れた福引券、福引補助券を予\備\装\備\に入れておきます。<br>
２．券を持って福引所に行き、券を出します。<br>
３．福引券を出した場合は、そのまま福引を行うことが出来ます。<br>
４．福引補助券は券を出すと券が蓄積されていきます。<br>
５．蓄積された福引補助券が合計５枚になると福引を行うことが出来ます。<p>
景品は以下のとおりになります。<p>
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
<input type=button value="戻る" $STYLE_B1 onClick="parent.Sub.location.replace('./$SCRIPTNM')">
SAIGO
&END;
exit;
}

sub HUKUBIKI {

&LOCK;
&DBM_INPORT(P);
dbmopen (%P,"$DBM_P",0666);
@VALS = split(/\s/,$P{"$inname"});
if($VALS[26] > $FORM{'time'}){&ERROR("タイムエラーです。");}

$randam = int(rand(1));
$i = 0;

foreach $number (@kakuritu){

if($number >= $randam){$atari = $i;last;}

$i++;
}

if($atari eq ""){&ERROR('エラーでハズレです。');}

$buki = $keihin[$atari];
$bukin = $hash[$atari];
$tou = $atari + 1;

if($FORM{'mode'} == 2){
if($VALS[10] ne ""){dbmclose %P;&UNLOCK;&ERROR('手持ちがいっぱいのためハズレです。');}
$VALS[10] = "$bukin";
}

elsif($FORM{'mode'} == 3){
if($VALS[11] ne ""){dbmclose %P;&UNLOCK;&ERROR('手持ちがいっぱいのためハズレです。');}
$VALS[11] = "$bukin";}

else{dbmclose %P;&UNLOCK;&ERROR('エラーのためはずれです。');}

$VALS[26] = $DATE;

$P{"$inname"}="@VALS";
dbmclose %P;

if($atari == 0 && $rekisi == 1){
dbmopen (%DH,"$DBM_H",0666);
$DH{"$DATE"}="$innameが福引で１等を当てました。景品として$bukiを手に入れました。";
dbmclose %DH;
}

&UNLOCK;

&HEADER;
print<<"HTML";
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2>$tou等が当たりました</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR1>
$tou等の商品$bukiを獲得しました。
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
if(crypt($inpass,eb) ne "$VALS[2]"){&ERROR("パスワードが間違っています。");}

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

if($WN_B eq "hukubiki" || $WN_B eq "hojoken"){$submit1 = "<input type=submit value=出す $STYLE_B1>";}
if($WN_C eq "hukubiki" || $WN_C eq "hojoken"){$submit2 = "<input type=submit value=出す $STYLE_B1>";}

$WLV_A=int$WLV_A/$WEAPON_LVUP;
$WLV_B=int$WLV_B/$WEAPON_LVUP;
$WLV_C=int$WLV_C/$WEAPON_LVUP;

@WN_sA=split(/\,/,$WEAPON_LIST{"$WN_A"});
@WN_sB=split(/\,/,$WEAPON_LIST{"$WN_B"});
@WN_sC=split(/\,/,$WEAPON_LIST{"$WN_C"});

if($WN_B ne ""){$SB = "$WN_sB[0](Lv.$WLV_B)";}else{$SB = "無装備";}
if($WN_C ne ""){$SC = "$WN_sC[0](Lv.$WLV_C)";}else{$SC = "無装備";}

&HEADER;
print<<"HTML";
<table border=0><tr><td valign=top>
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=3>$innameの装備\</b></td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2>装備\</td>
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
<td bgcolor=$TABLE_COLOR2>予\備\</td>
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
<td bgcolor=$TABLE_COLOR2>予\備\</td>
<td bgcolor=$TABLE_COLOR1>$SC</td>
<td bgcolor=$TABLE_COLOR1>$submit2</td>
</form>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=3>補助説明</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1 colspan=3>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=pname value=$inname>
<input type=hidden name=pass value=$inpass>
<input type=hidden name=cmd value=SETUMEI>
<input type=submit value="説明書" $STYLE_B1>
</td>
</tr>
</form>
</table>

</td>
<td valign=top>
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=2>補助券貼\りつけ所</b></td>
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
print "<div align=center><font size=2>PROGRAMING:(C) 2002 - <a href=http://melcha.zone.ne.jp/ebs/dl/ target=_blank><font size=2>44NET FACTORY</font></a> - All Right Reserved.</font></div><p>";
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
if(crypt($inpass,eb) ne "$VALS[2]"){dbmclose %P;&UNLOCK;&ERROR("パスワードが間違っています。");}

local($WN_B,$WLV_B) = split(/!/,$VALS[10]);	
local($WN_C,$WLV_C) = split(/!/,$VALS[11]);

if($FORM{'mode'} == 1 && $WN_B eq $FORM{'tik1'}){
$VALS[10] = "";
$num = 2;
}
elsif($FORM{'mode'} == 2 && $WN_C eq $FORM{'tik2'}){
$VALS[11] = "";
$num = 3;
}
else{dbmclose %P;&UNLOCK;&ERROR('原因不明のエラー1です。');exit;}

$P{"$inname"}="@VALS";
dbmclose %P;

if($FORM{'tik1'} eq "hukubiki"){&UNLOCK;&hukubiki;exit;}
if($FORM{'tik2'} eq "hukubiki"){&UNLOCK;&hukubiki;exit;}

&INPORT;

@ken = split(/\s/,$KEN{"$inname"});

if($ken[0] eq ""){$ken[0] = "hojoken";}
elsif($ken[1] eq ""){$ken[1] = "hojoken";}
elsif($ken[2] eq ""){$ken[2] = "hojoken";}
elsif($ken[3] eq ""){$ken[3] = "hojoken";}
elsif($ken[4] eq ""){$ken[4] = "hojoken";}
elsif($ken[4] eq ""){$ken[5] = "hojoken";}
else{dbmclose %P;&UNLOCK;&ERROR('原因不明のエラー2です。');}

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
<td colspan=2 bgcolor=$TABLE_COLOR2>景品について</td></tr>
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
<td colspan=2 bgcolor=$TABLE_COLOR2>福引所</td></tr>
<tr>
<td colspan=2 bgcolor=$TABLE_COLOR1 align=center>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=pname value=$inname>
<input type=hidden name=pass value=$inpass>
<input type=hidden name=time value=$DATE>
<input type=hidden name=cmd value=HUKUBIKI>
<input type=hidden name=mode value=$num>
<input type=submit value=福引開始 $STYLE_B1></form>
</td></tr></table>
SAIGO

&END;
exit;
}

