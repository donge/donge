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
# SCRIPTNAME	EBS AUCTION ver 1.1
# HOMEPAGE 	
# E-MAIL 	44net@kk.sakura.ne.jp
# (C)2001 44-net FACTORY
#
##################################################################
#
#---------------ENDLESSBATTLEスクリプトへの追加-------------------
#
# ebs_sub3.cgiの<input type=button>などのコマンドボタンがある场所に
# 以下の行を追加してください。
#
# <td><input type=button value="オ—クション" $STYLE_B1 onClick="parent.Sub.location.replace('./このスクリプトの名前')"></td>
#
# このスクリプトの名前　と书かれている部分をこのスクリプトの名前に变えてください。
#
##################################################################
#各种设定
#

$SCRIPTNM="buy.cgi";			#このスクリプト名
$AUCTIONDIR="buy";			#オ—クション品格纳ディレクトリ—
$rireki="$AUCTIONDIR/rireki.dat";	#オ—クション落札结果です。（扩张子に.cgiを使わないで下さい。）
require 'ebs_sub1.cgi';			#ebs_sub1.cgiのスクリプト名
require "./$LOG_FOLDER/$HASH_DATA";	#武器のリスト（变更不要）
$TABLE_STYLE = "bordercolor=#404040 border=1 cellspacing=0 style=\"font-size:10pt\"";#<TABLE>のスタイルです。
@stime = ("3","6","12","24","48");	#購買期限
@nyuusatu = ("500","1000","2000","5000","10000","20000","50000","100000","200000","500000","1000000","2000000","5000000");#);#);#);#);#);#);#競標增额
$max_num = "20";			#最大オ—クション品数（多过ぎると重くなります。)
$rmax = "20";				#最大落札历史数
$rekisika = "1";			#オ—クション出售を历史に表示するなら1、しないなら0を半角で记入
$nmax = "20000000";			#最大初期金额

#设定ここまで
##################################################################
#ここから下の部分はperlを使用したプログラムです。改造出来る范围で变更してください。

if($SUB){&ERROR('直リンクは禁止です','入り口からのアクセスお愿いします。') if $ENV{'HTTP_REFERER'} !~ m/^$THIS_DIR/ && $DIRECT_LINK && $SUB ne 'MY_LIST' && $SUB ne 'C_LIST';}

@pair = split(/\;/, $ENV{'HTTP_COOKIE'});
foreach (@pair) {my($key, $value) = split(/=/, $_);
$DUMMY{$key} = $value;}
@pairs = split(/\,/, $DUMMY{'EB'});
foreach (@pairs) {my($key, $value) = split(/\:/, $_);
$cookies{"$key"} = $value;}

if($cookies{'pname'} eq ""){&ERROR('非法进入。');}

!$SUB && ($SUB='MAINTE');
&$SUB;

sub SETUMEI {
&HEADER;
print<<"HTML";
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR1>
<table style="font-size:10pt">
<tr><td align=left valign=top bgcolor=$TABLE_COLOR2 colspan=2>黑市出售説明</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>黑市可以拍賣自己的武器、出價最高的人，可以買到。</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>オ—クション会场へは武器コマンド内にある、オ—クションボタンを押すと行けます。</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>一度出售すると一度でも入札があった场合、出售の取り消しは出来ません。</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>出售は、一度に一人一品のみとなっております。</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>入札は出售者以外の谁でも行うことが出来ます。</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>入札时に持ち金が足りない时は入札することが出来ません。</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>出售者はいつでも落札することが出来ます。</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>间违えて入札してしまった场合は取り消すことが出来ません。</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>落札时に最终入札者の持ってる武器の予\备\２ヵ所がどちらも埋まっている场合、落札することが出来ません。</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>（いつ落札されるか解らないので、常に予\备\を空けておくと良いと思います。)</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>落札时に最终入札者の持ち金が落札价格に足りない场合、マイナス金额となります。</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>一人も入札者がいなかった场合に落札すると、出售した武器は出售者の元に戾ってきます。</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>落札すると、落札の历史に情报が保存されます。</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>あくまでも皆さんで乐しむものなので、いがみ合い等にならないよう、オ—クションを乐しみましょう??</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR2 colspan=2>オ—クション画面（左侧）の见方<br></td></tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>出售武器</td>
<td align=left>自分が持っている予\备\の装\备\が表\示されます。出售することが出来ます。</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>设定时间</td>
<td align=left>オ—クションを行う最高时间です。この时间を超えると入札することが出来なくなります。</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>初期金额</td>
<td align=left>出售する武器の最低金额です。この数字から金额の加算が始まります。</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>出售ボタン</td>
<td align=left>上记设定を终えてこのボタンを押すと、オ—クションに武器を出售できます。</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>落札の历史</td>
<td align=left>过去２０回の落札状况を见ることが出来ます。</td>
</tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR2 colspan=2>オ—クション画面（右侧）の见方<br></td></tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>出售者</td>
<td align=left>オ—クションに武器を出售した人の名前です。</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>武器名（武器Lv）</td>
<td align=left>出售されている武器とその武器のＬｖです。</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>初期金额</td>
<td align=left>出售されている武器の最初の值段です。</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>现在の金额</td>
<td align=left>现在入札された最高额です。</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>增入札额设定</td>
<td align=left>现在の金额に上乘せする金额を设定します。</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>设定时间</td>
<td align=left>この时间まで落札しなかった场合入札が出来なくなり、决定ボタンの栏が落札ボタンになります。</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>最终入札者</td>
<td align=left>最後に入札した人の名前です。落札されるとここに表\示されている人が武器を购入することになります。</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>决定ボタン</td>
<td align=left>
入札ボタンや落札ボタンが表\示されます。入札ボタンはこの武器が欲しい方が增入札金额を设定して押すと入札が出来ます。<br>
出售した人には、最初から落札ボタンが表\示されます。<br>
设定时间を超えると、全ての人のボタン表示が自动的に落札ボタンに切り替わります。<br>
落札ボタンを押すと、落札することが出来ます。<br>
初期金额只能用半角數字輸入。
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
<td bgcolor=$TABLE_COLOR2 colspan=7>黑市購買歷史</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR2 align=center>落札日时</td>
<td bgcolor=$TABLE_COLOR2 align=center>出售者</td>
<td bgcolor=$TABLE_COLOR2 align=center>出售武器</td>
<td bgcolor=$TABLE_COLOR2 align=center>落札者</td>
<td bgcolor=$TABLE_COLOR2 align=center>落札额</td>
<td bgcolor=$TABLE_COLOR2 align=center>初期金额</td>
<td bgcolor=$TABLE_COLOR2 align=center>入札回数</td>
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
$kitei = "$mon月$mday日&nbsp$ghour时$gmin分";
}

if($nobuied){print "<tr><td bgcolor=$TABLE_COLOR1 align=center>------</td><td bgcolor=$TABLE_COLOR1>$nameさん</td><td bgcolor=$TABLE_COLOR1>$buki</td><td bgcolor=$TABLE_COLOR1 colspan=4>入札者はいませんでした。</td></tr>\n";}
else{
print<<"TABLE";
<tr>
<td bgcolor=$TABLE_COLOR1>$kitei</td>
<td bgcolor=$TABLE_COLOR1>$nameさん</td>
<td bgcolor=$TABLE_COLOR1>$buki</td>
<td bgcolor=$TABLE_COLOR1>$nnameさん</td>
<td bgcolor=$TABLE_COLOR1 align=right>$nowmoneyＧ</td>
<td bgcolor=$TABLE_COLOR1 align=right>$moneyＧ</td>
<td bgcolor=$TABLE_COLOR1 align=right>$num回</td>
</tr>
TABLE
}

}
print "</table>";
&foot;
exit;
}

sub INBUKI {

&ERROR('クッキ—が见つかりません。') if $cookies{'pname'} eq '';
&ERROR('初期金额沒有設定。') if $FORM{'money'} eq '';
if($FORM{'money'} =~ m/\D/g){&ERROR('初期金額只能用半角數字輸入');}
if(($FORM{'money'} % 1) != 0){&ERROR('只能用整數');}
if($FORM{'money'} >= $nmax){&ERROR("最高初期金额$nmaxＧ超出範圍。");}

&DBM_INPORT(P);
&LOCK;
opendir(MEMBER_DIR, "$AUCTIONDIR");
@kkk = sort(grep { m/.*\.cgi/ } readdir(MEMBER_DIR));
closedir(MEMBER_DIR);

$filenum = @kkk;

if($filenum >= $max_num){&UNLOCK;&ERROR('最大出售数($max_numになっていて今は出售できません');}
$amax = 0;
	foreach(@kkk){
	chomp $_;
$file = $_;
	($id,$kaku) = split(/\./);
	push(@option,"$id");#ファイル番号
	if($amax <= $id){$amax = $id;}#新规出售用番号

open(OPENS,"$AUCTIONDIR/$file");
@mitukeru = <OPENS>;
close(OPENS);
($named,$dmy) = split(/<>/,$mitukeru[0]);
if($named eq $cookies{'pname'}){&UNLOCK;&ERROR('出售は一人一品までです。');}
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


if($FORM{'buki'} == 1){if($VALS[10] eq ""){&UNLOCK;&ERROR('出售武器１が见当たりません。');}$dbuki = $VALS[10];$VALS[10] = "";$syuppin = "$WN_sB[0]";}
if($FORM{'buki'} == 2){if($VALS[11] eq ""){&UNLOCK;&ERROR('出售武器２が见当たりません。');}$dbuki = $VALS[11];$VALS[11] = "";$syuppin = "$WN_sC[0]";}
if($FORM{'buki'} == 3){if($VALS[35] eq ""){&UNLOCK;&ERROR('出售武器１が见当たりません。');}$dbuki = $VALS[35];$VALS[35] = "";$syuppin = "$WN_sD[0]";}
if($FORM{'buki'} == 4){if($VALS[36] eq ""){&UNLOCK;&ERROR('出售武器２が见当たりません。');}$dbuki = $VALS[36];$VALS[36] = "";$syuppin = "$WN_sE[0]";}

$aatime = $stime["$FORM{'autime'}"];
$ktime = 3600 * $aatime;
$owari = time + $ktime;
($sec, $min, $hour, $mday, $mon, $year) = localtime($owari);
$ghour = sprintf("%02d",$hour);
$gmin = sprintf("%02d",$min);
$mon++;
$kitei = "$mon月$mday日&nbsp$ghour时$gmin分停止";

	dbmopen (%P,"$DBM_P",0666);
		$P{"$cookies{'pname'}"}="@VALS";
	dbmclose %P;

if($rekisika == 1){
		dbmopen (%DH,"$DBM_H",0666);
			$DH{"$DATE"}="$cookies{'pname'}的武器$syuppin出售中。$kitei出售。";
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
<td bgcolor=$TABLE_COLOR2 colspan=2>以下のように出售しました。</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR2>出售武器</td>
<td bgcolor=$TABLE_COLOR1 align=right>$syuppin</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2>设定时间</td>
<td bgcolor=$TABLE_COLOR1 align=right>$kitei</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2>初期金额</td>
<td bgcolor=$TABLE_COLOR1 align=right>$FORM{'money'}&nbsp;G</td>
</tr>
</table>
</body>
</html>
HTML
exit;
}

sub MAINTE {

&ERROR('クッキ—が见つかりません。') if $cookies{'pname'} eq '';
&DBM_INPORT(P);
$selecttime = "<select name=autime $STYLE_B1><option value=0>$stime[0]时间<option value=1>$stime[1]时间<option value=2>$stime[2]时间<option value=3>$stime[3]时间<option value=4>$stime[4]时间</select>";

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
<td bgcolor=$TABLE_COLOR2 colspan=2>黑市武器出售</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR2>出售武器</td>
<td bgcolor=$TABLE_COLOR1>
<select name=buki $STYLE_B1>$option10$option11$option35$option36</select>
</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2>设定时间</td>
<td bgcolor=$TABLE_COLOR1>$selecttime</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2>初期金额</td>
<td bgcolor=$TABLE_COLOR1><input type=text size=20 name=money $STYLE_B1></td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1 colspan=2 align=right>
金額只能用半角數字輸入
<input type=submit value=出售 $STYLE_B1>
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
<td bgcolor=$TABLE_COLOR2 colspan=2>黑市武器出售</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR1 colspan=2>
現在沒有任何\武器裝備出售。
</td>
</tr>
HTML
}

print<<"HTML";
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=2>黑市交易歷史</td>
</tr>
<tr>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=cmd value=REKISI>
<td bgcolor=$TABLE_COLOR1 colspan=2 align=right><input type=submit value=历史 $STYLE_B1></td>
</form>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=2>黑市説明書</td>
</tr>
<tr>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=cmd value=SETUMEI>
<td bgcolor=$TABLE_COLOR1 colspan=2 align=right><input type=submit value=说明书 $STYLE_B1></td>
</form>
</tr>
</table>
</td>
<td valign=top>
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=9>黑市武器出售一览</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR2 align=center>出售者</td>
<td bgcolor=$TABLE_COLOR2 align=center>武器名(武器Lv)</td>
<td bgcolor=$TABLE_COLOR2 align=center>最低金額</td>
<td bgcolor=$TABLE_COLOR2 align=center>現在的金額</td>
<td bgcolor=$TABLE_COLOR2 align=center>擡高價錢設定</td>
<td bgcolor=$TABLE_COLOR2 align=center>結束时间</td>
<td bgcolor=$TABLE_COLOR2 align=center>價錢最高者</td>
<td bgcolor=$TABLE_COLOR2 align=center>决定按鈕</td>
<td bgcolor=$TABLE_COLOR2 align=center>購買數</td>
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
if($nname eq ""){$nname = "沒有購買者";}
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
$kitei = "$mon月$mday日&nbsp$ghour时$gmin分停止";

if($owari <= time || $rakusatumode == 1){$cmd = "<input type=hidden name=cmd value=RAKUSATU><input type=hidden name=pname value=$name><input type=hidden name=rname value=$kname>";$input = "<input type=submit value=確定 $STYLE_B1>";}
else{$cmd = "<input type=hidden name=cmd value=NYUSATU>";$input = "<input type=submit value=擡價 $STYLE_B1>";}

print<<"TABLE";

<tr>
<form action=$SCRIPTNM method=POST>
$cmd
<input type=hidden name=bukifile value=$_>
<td bgcolor=$TABLE_COLOR2>$name出售</td>
<td bgcolor=$TABLE_COLOR1>$WN_sA[0](Lv.$WLV_A)</td>
<td bgcolor=$TABLE_COLOR1 align=right>$moneyＧ</td>
<td bgcolor=$TABLE_COLOR1 align=right>$nowmoneyＧ</td>
<td bgcolor=$TABLE_COLOR1><select name=gaku $STYLE_B1>@options</select></td>
<td bgcolor=$TABLE_COLOR1 align=right>$kitei</td>
<td bgcolor=$TABLE_COLOR1 align=center>$nname</td>
<td bgcolor=$TABLE_COLOR1>$input</td>
<td bgcolor=$TABLE_COLOR1 align=right>$l回</td>
</form>
</tr>
TABLE
$nname = "";
$gyou++;
}
if($gyou == 0){print "<tr><td bgcolor=$TABLE_COLOR1 colspan=9>现在出售はありません。</td></tr>";}


print<<"END";
</table>
</td></tr></table>
END
&foot;
exit;
}



sub NYUSATU {
if($cookies{'pname'} eq ""){&ERROR('クッキ—エラ—です。');}

&DBM_INPORT(P);

dbmopen (%P,"$DBM_P",0666);
@VALS = split(/\s/,$P{"$cookies{'pname'}"});
dbmclose %P;


if(!open(OPENA,"$AUCTIONDIR/$FORM{'bukifile'}")){&ERROR('ファイルエラ—です。');}
@dada = <OPENA>;
close(OPENA);

$l = 0;
$lognum = @dada;
if($lognum >= 2){$l = $lognum - 1;}
($name,$buki,$owari,$money) = split(/<>/,$dada[0]);
if($l >= 1){($nname,$nowmoney) = split(/<>/,$dada[$l]);}
else{$nowmoney = $money;}
if($owari < time){&ERROR('入札终了时间を超えてます。');}
if($nname eq $cookies{'pname'}){&ERROR('连续での入札は出来ません。');}
$ngaku = $nowmoney + $FORM{'gaku'};
if($VALS[8] <= $ngaku){&ERROR('お金が足りません。');}
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
<td bgcolor=$TABLE_COLOR2 colspan=2>$nameさん出售武器への入札</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR2>$ngakuＧで入札しました。</td>
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

if(!open(OPENA,"$AUCTIONDIR/$FORM{'bukifile'}")){&UNLOCK;&ERROR("すでに落札济みです。");}
@dada = <OPENA>;
close(OPENA);

if($VALS[10] ne "" && $VALS[11] ne "" && $VALS[35] ne "" && $VALS[35] ne ""){&UNLOCK;&ERROR("$FORM{'rname'}さんの予\备\に空きが无いので落札出来ません。");exit;}

elsif($VALS[10] eq ""){$yobi = 10;}
elsif($VALS[11] eq ""){$yobi = 11;}
elsif($VALS[35] eq ""){$yobi = 35;}
elsif($VALS[36] eq ""){$yobi = 36;}
else{&UNLOCK;&ERROR('所持武器ＤＢオ—プンエラ—');}

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
<td bgcolor=$TABLE_COLOR2 colspan=2>黑市購買结果</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR2>出售武器</td>
<td bgcolor=$TABLE_COLOR1>$WN_sA[0](Lv.$WLV_A)</td>
</tr>

<tr>
<td bgcolor=$TABLE_COLOR2>出售者</td>
<td bgcolor=$TABLE_COLOR1>$nameさん</td>
</tr>

<tr>
<td bgcolor=$TABLE_COLOR2>落札者</td>
<td bgcolor=$TABLE_COLOR1>$nnameさん</td>
</tr>

<tr>
<td bgcolor=$TABLE_COLOR2>落札金额</td>
<td bgcolor=$TABLE_COLOR1>$nowmoneyＧ</td>
</tr>

<tr>
<td bgcolor=$TABLE_COLOR2>入札回数</td>
<td bgcolor=$TABLE_COLOR1>$l回</td>
</tr>
</table>
HTML
&foot;
}



sub foot{
print "<br><br><br><input type=button value=\"黑市\" $STYLE_B1 onClick=\"parent.Sub.location.replace('./$SCRIPTNM')\"><br><br><br>\n
<div align=center><font size=2>PROGRAMING:(C) 2002 - <a href=http://melcha.zone.ne.jp/ target=_blank><font size=2>44NET FACTORY</font></a> - All Right Reserved.</font></div><p>";
&FOOTER;
print<<"FOOT";
</body>
</html>
FOOT
exit;
}



