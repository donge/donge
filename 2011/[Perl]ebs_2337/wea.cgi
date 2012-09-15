#!/usr/bin/perl


############################################################################
#
#	
#
#	masimaroさんのＨＰ	http://members.jcom.home.ne.jp/masimaro/
#	
#####   设定个所   ##########################################################

$SCRIPTNM = "wea.cgi";	#名字
$BUKIDB = "wea/wea";	#武器库檔案

require 'ebs_sub1.cgi';		
require "./$LOG_FOLDER/$HASH_DATA";	#不可變更
$TABLE_STYLE = "bordercolor=#404040 border=1 cellspacing=0 style=\"font-size:10pt\"";#<TABLE>のスタイルです。

#########################################################################
#これ以下はプログラム部分となります。

if($SUB){&ERROR('非法進入。') if $ENV{'HTTP_REFERER'} !~ m/^$THIS_DIR/ && $DIRECT_LINK && $SUB ne 'MY_LIST' && $SUB ne 'C_LIST';}

@pair = split(/;/, $ENV{'HTTP_COOKIE'});
foreach (@pair) {
my($key, $value) = split(/=/, $_);
$DUMMY{$key} = $value;
}

@pairs = split(/,/, $DUMMY{EB});
foreach (@pairs) {my($key, $value) = split(/:/, $_);
$COOKIE{$key} = $value;
}

&DBM_INPORT(P);
@LOOK = split(/\s/,$P{"$COOKIE{'pname'}"});

if(crypt($COOKIE{'pass'},$LOOK[2]) ne $LOOK[2]){&ERROR('密碼錯誤','請從新登陸。');}


!$SUB && ($SUB='MAIN');
&$SUB;

sub INPORT {
tie %NOTE,AnyDBM_File,"$BUKIDB",O_RDONLY,0666;
%BUKI=%NOTE;
untie %NOTE;
}


sub MAIN {

&INPORT;
&HEADER;

while (($Name,$Val) = each %BUKI){
if($COOKIE{'pname'} ne $Name){$option = "$option<option value=$Name>$Name的武器库";}
}

print<<"BUKIHTML";
<table width=100% height=70%><tr><td align=center>
<table $TABLE_STYLE>
<tr><td bgcolor=$TABLE_COLOR2 align=center><b>可以去別人的武器庫買武器、也能去自己倉庫存放武器</b>
</td></tr></table><p>　<p>
</td></tr><tr><td align=center>
<table border=0 cellpadding=5 cellspacing=0 bgcolor="#909090" align=center style="border:1px outset #909090;font-size:16px;">
<form action=$SCRIPTNM method=POST>
<input type=hidden name="cmd" value="SOUKO">
<tr><td bgcolor=$TABLE_COLOR2 colspan=2 align=center><b>選擇您要去的地方</b></td></tr>
<tr>
<td bgcolor=$TABLE_COLOR1 colspan=2>
<select name=pname $STYLE_B1><option value="$COOKIE{'pname'}">$COOKIE{'pname'}的仓库$option</select></td>
</tr>

<tr><td align=center colspan=2 bgcolor=$TABLE_COLOR1>
<input type=submit value=决定 $STYLE_B1>
</td></tr></form></table>
</td></tr></table>
BUKIHTML

&ENDHTML;

}

sub ENDHTML{
print<<"ENDHT";
<br><br>
<br><br><br><input type=button value=武器库 $STYLE_B1 onClick=\"parent.Sub.location.replace('./$SCRIPTNM')\"><br><br><br>\n
<div align=center>
<font size=2>PROGRAMING:(C) 2002 - <a href=http://www.verytown.com/ target=_blank>
<font size=2>中文化添加改造-非常城市</font></a>
 - All Right Reserved.</font></div><p>
</body>
</html>
ENDHT

exit;
}

sub SOUKO {

&ERROR('ID入力エラ—！！') if $FORM{'pname'} eq '';
&DBM_INPORT(P);
&INPORT;

@VALS = split(/\s/,$P{"$COOKIE{'pname'}"});
@WEP = split(/\s/,$BUKI{"$FORM{'pname'}"});

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

	local($OWN_A,$OWLV_A) = split(/!/,$WEP[0]);
	local($OWN_B,$OWLV_B) = split(/!/,$WEP[1]);
	local($OWN_C,$OWLV_C) = split(/!/,$WEP[2]);
	local($OWN_D,$OWLV_D) = split(/!/,$WEP[3]);
	local($OWN_E,$OWLV_E) = split(/!/,$WEP[4]);

	$OWEP_A=$OWLV_A%$WEAPON_LVUP;
	$OWEP_B=$OWLV_B%$WEAPON_LVUP;
	$OWEP_C=$OWLV_C%$WEAPON_LVUP;
	$OWEP_D=$OWLV_D%$WEAPON_LVUP;
	$OWEP_E=$OWLV_E%$WEAPON_LVUP;

	$OWLV_A=int$OWLV_A/$WEAPON_LVUP;
	$OWLV_B=int$OWLV_B/$WEAPON_LVUP;
	$OWLV_C=int$OWLV_C/$WEAPON_LVUP;
	$OWLV_D=int$OWLV_D/$WEAPON_LVUP;
	$OWLV_E=int$OWLV_E/$WEAPON_LVUP;

@OWN_sA=split(/\,/,$WEAPON_LIST{"$OWN_A"});
@OWN_sB=split(/\,/,$WEAPON_LIST{"$OWN_B"});
@OWN_sC=split(/\,/,$WEAPON_LIST{"$OWN_C"});
@OWN_sD=split(/\,/,$WEAPON_LIST{"$OWN_D"});
@OWN_sE=split(/\,/,$WEAPON_LIST{"$OWN_E"});

if($VALS[10]){$ININ10 = "$WN_sB[0](Lv.$WLV_B)\n";}else{$ININ10 = "　 ";}
if($VALS[11]){$ININ11 = "$WN_sC[0](Lv.$WLV_C)\n";}else{$ININ11 = "　 ";}
if($VALS[35]){$ININ35 = "$WN_sD[0](Lv.$WLV_D)\n";}else{$ININ35 = "　 ";}
if($VALS[36]){$ININ36 = "$WN_sE[0](Lv.$WLV_E)\n";}else{$ININ36 = "　 ";}

$noin = 0;

if($OWN_sA[0] eq "" || $OWN_sB[0] eq "" || $OWN_sC[0] eq "" || $OWN_sD[0] eq "" || $OWN_sE[0] eq ""){$noin = 1;}

if($FORM{'pname'} eq $COOKIE{'pname'} && $noin == 1){

if($VALS[10] ne ''){
$nyuko10 = "
<td align=center bgcolor=$TABLE_COLOR1>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=\"azuke2\" value=\"$VALS[10]\">
<input type=hidden name=\"cmd\" value=\"HOKAN\">
<input type=hidden name=\"pname\" value=\"$COOKIE{'pname'}\">
<input type=hidden name=\"pass\" value=\"$COOKIE{'pass'}\">
<input type=submit value=入库 $STYLE_B1>
</td>
</form>
";
}
else{$nyuko10 = "<td align=center bgcolor=$TABLE_COLOR1>　</td>";}

if($VALS[11] ne ''){
$nyuko11 = "
<td align=center bgcolor=$TABLE_COLOR1>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=\"azuke3\" value=\"$VALS[11]\">
<input type=hidden name=\"cmd\" value=\"HOKAN\">
<input type=hidden name=\"pname\" value=\"$COOKIE{'pname'}\">
<input type=hidden name=\"pass\" value=\"$COOKIE{'pass'}\">
<input type=submit value=入库 $STYLE_B1>
</td>
</form>
";
}
else{$nyuko11 = "<td align=center bgcolor=$TABLE_COLOR1>　</td>";}

if($VALS[35] ne ''){
$nyuko35 = "
<td align=center bgcolor=$TABLE_COLOR1>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=\"azuke4\" value=\"$VALS[35]\">
<input type=hidden name=\"cmd\" value=\"HOKAN\">
<input type=hidden name=\"pname\" value=\"$COOKIE{'pname'}\">
<input type=hidden name=\"pass\" value=\"$COOKIE{'pass'}\">
<input type=submit value=入库 $STYLE_B1>
</td>
</form>
";
}
else{$nyuko35 = "<td align=center bgcolor=$TABLE_COLOR1>　</td>";}

if($VALS[36] ne ''){
$nyuko36 = "
<td align=center bgcolor=$TABLE_COLOR1>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=\"azuke5\" value=\"$VALS[36]\">
<input type=hidden name=\"cmd\" value=\"HOKAN\">
<input type=hidden name=\"pname\" value=\"$COOKIE{'pname'}\">
<input type=hidden name=\"pass\" value=\"$COOKIE{'pass'}\">
<input type=submit value=入库 $STYLE_B1>
</td>
</form>
";
}
else{$nyuko36 = "<td align=center bgcolor=$TABLE_COLOR1>　</td>";}
}
else{$nyuko36 = "<td align=center bgcolor=$TABLE_COLOR1>　</td>";$nyuko35 = "<td align=center bgcolor=$TABLE_COLOR1>　</td>";$nyuko11 = "<td align=center bgcolor=$TABLE_COLOR1>　</td>";$nyuko10 = "<td align=center bgcolor=$TABLE_COLOR1>　</td>";}
&HEADER;

print<<"MIDHTML";
<table border=0 height=100%>
<tr>
<td valign=top align=left>
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=3 align=left><b>$COOKIE{'pname'}的装备</b></td></tr>
<tr>
<td bgcolor=$TABLE_COLOR2 align=center>装备\</td>
<td bgcolor=$TABLE_COLOR1 align=center>$WN_sA[0]</font></b>Lv.$WLV_A</td>
<td bgcolor=$TABLE_COLOR1>　 </td>
</tr>

<tr>
<td bgcolor=$TABLE_COLOR2 align=center>予\备\</td>
<td bgcolor=$TABLE_COLOR1 align=center>$ININ10</td>
$nyuko10
</tr>

<tr>
<td bgcolor=$TABLE_COLOR2 align=center>予\备\</td>
<td bgcolor=$TABLE_COLOR1 align=center>$ININ11</td>
$nyuko11

</tr>
<tr>
<td bgcolor=$TABLE_COLOR2 align=center>予\备\</td>
<td bgcolor=$TABLE_COLOR1 align=center>$ININ35</td>
$nyuko35
</tr>

<tr>
<td bgcolor=$TABLE_COLOR2 align=center>予\备\</td>
<td bgcolor=$TABLE_COLOR1 align=center>$ININ36</td>
$nyuko36
</tr></table>

</td><td valign=top align=left>

<table $TABLE_STYLE width=750>
<tr><td bgcolor=$TABLE_COLOR2 colspan=6 align=left><b>$FORM{'pname'}的武器库</b>&nbsp;&nbsp;&nbsp;$KEKKA</td></tr>
MIDHTML

print "<tr><td align=center bgcolor=$TABLE_COLOR2>武器名</td>";
if($OWN_sA[0] ne ""){print "<td align=center bgcolor=$TABLE_COLOR1><b>$OWN_sA[0]</b></td>\n";}else{print "<td bgcolor=$TABLE_COLOR1>－－－－－－</td>\n";}
if($OWN_sB[0] ne ""){print "<td align=center bgcolor=$TABLE_COLOR1><b>$OWN_sB[0]</b></td>\n";}else{print "<td bgcolor=$TABLE_COLOR1>－－－－－－</td>\n";}
if($OWN_sC[0] ne ""){print "<td align=center bgcolor=$TABLE_COLOR1><b>$OWN_sC[0]</b></td>\n";}else{print "<td bgcolor=$TABLE_COLOR1>－－－－－－</td>\n";}
if($OWN_sD[0] ne ""){print "<td align=center bgcolor=$TABLE_COLOR1><b>$OWN_sD[0]</b></td>\n";}else{print "<td bgcolor=$TABLE_COLOR1>－－－－－－</td>\n";}
if($OWN_sE[0] ne ""){print "<td align=center bgcolor=$TABLE_COLOR1><b>$OWN_sE[0]</b></td></tr>\n";}else{print "<td bgcolor=$TABLE_COLOR1>－－－－－－</td></tr>\n";}

print "<tr><td align=center bgcolor=$TABLE_COLOR2>武器Ｌｖ</td>";
if($OWN_sA[0] ne ""){print "<td bgcolor=$TABLE_COLOR1 align=center><b>Lv.$OWLV_A/exp.$OWEP_A</b></td>\n";}else{print "<td bgcolor=$TABLE_COLOR1>－－－－－－</td>\n";}
if($OWN_sB[0] ne ""){print "<td bgcolor=$TABLE_COLOR1 align=center><b>Lv.$OWLV_B/exp.$OWEP_B</b></td>\n";}else{print "<td bgcolor=$TABLE_COLOR1>－－－－－－</td>\n";}
if($OWN_sC[0] ne ""){print "<td bgcolor=$TABLE_COLOR1 align=center><b>Lv.$OWLV_C/exp.$OWEP_C</b></td>\n";}else{print "<td bgcolor=$TABLE_COLOR1>－－－－－－</td>\n";}
if($OWN_sD[0] ne ""){print "<td bgcolor=$TABLE_COLOR1 align=center><b>Lv.$OWLV_D/exp.$OWEP_D</b></td>\n";}else{print "<td bgcolor=$TABLE_COLOR1>－－－－－－</td>\n";}
if($OWN_sE[0] ne ""){print "<td bgcolor=$TABLE_COLOR1 align=center><b>Lv.$OWLV_E/exp.$OWEP_E</b></td>\n";}else{print "<td bgcolor=$TABLE_COLOR1>－－－－－－</td>\n";}
print "</tr>";

if($VALS[10] ne "" && $VALS[11] ne "" && $VALS[35] ne "" && $VALS[36] ne ""){$noout = 1;}
elsif($VALS[10] eq ""){$dasimode = "dasi2";}
elsif($VALS[11] eq ""){$dasimode = "dasi3";}
elsif($VALS[35] eq ""){$dasimode = "dasi8";}
elsif($VALS[36] eq ""){$dasimode = "dasi9";}
else{$bukimoti = 1;}

if($noout ne 1 && $FORM{'pname'} eq $COOKIE{'pname'}){

print "<tr><td align=center bgcolor=$TABLE_COLOR2>出库</td>";

if($WEP[0] ne ''){
print<<"PUSHINPUT";
<td align=center bgcolor=$TABLE_COLOR1>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="$dasimode" value="$WEP[0]">
<input type=hidden name="wepnum" value="1">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="pname" value="$COOKIE{'pname'}">
<input type=hidden name="pass" value=\"$COOKIE{'pass'}\">
<input type=submit value=領出 $STYLE_B1>
</td>
</form>
PUSHINPUT
}
else{print"<td align=center bgcolor=$TABLE_COLOR1>　</td>";}

if($WEP[1] ne ''){
print<<"PUSHINPUT";
<td align=center bgcolor=$TABLE_COLOR1>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="$dasimode" value="$WEP[1]">
<input type=hidden name="wepnum" value="2">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="pname" value="$COOKIE{'pname'}">
<input type=hidden name="pass" value=\"$COOKIE{'pass'}\">
<input type=submit value=領出 $STYLE_B1>
</td>
</form>
PUSHINPUT
}
else{print"<td align=center bgcolor=$TABLE_COLOR1>　</td>";}

if($WEP[2] ne ''){
print<<"PUSHINPUT";
<td align=center bgcolor=$TABLE_COLOR1>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="$dasimode" value="$WEP[2]">
<input type=hidden name="wepnum" value="3">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="pname" value="$COOKIE{'pname'}">
<input type=hidden name="pass" value=\"$COOKIE{'pass'}\">
<input type=submit value=領出 $STYLE_B1>
</td>
</form>
PUSHINPUT
}
else{print"<td align=center bgcolor=$TABLE_COLOR1>　</td>";}

if($WEP[3] ne ''){
print<<"PUSHINPUT";
<td align=center bgcolor=$TABLE_COLOR1>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="$dasimode" value="$WEP[3]">
<input type=hidden name="wepnum" value="4">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="pname" value="$COOKIE{'pname'}">
<input type=hidden name="pass" value=\"$COOKIE{'pass'}\">
<input type=submit value=領出 $STYLE_B1>
</td>
</form>
PUSHINPUT
}
else{print"<td align=center bgcolor=$TABLE_COLOR1>　</td>";}

if($WEP[4] ne ''){
print<<"PUSHINPUT";
<td align=center bgcolor=$TABLE_COLOR1>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="$dasimode" value="$WEP[4]">
<input type=hidden name="wepnum" value="5">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="pname" value="$COOKIE{'pname'}">
<input type=hidden name="pass" value=\"$COOKIE{'pass'}\">
<input type=submit value=領出 $STYLE_B1>
</td>
</form>
PUSHINPUT
}
else{print"<td align=center bgcolor=$TABLE_COLOR1>　</td>";}
print "</tr>";

}

if($FORM{'pname'} eq $COOKIE{'pname'}){

print "<tr><td align=center bgcolor=$TABLE_COLOR2>废弃</td>";

if($WEP[0] ne ''){
print << "-----END-----";
<td align=center bgcolor=$TABLE_COLOR1>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="dasi4" value="0">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="pname" value="$FORM{'pname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<input type=submit value=废弃 $STYLE_B1>
</td>
</form>
-----END-----
}
else{print"<td align=center bgcolor=$TABLE_COLOR1>　</td>";}

if($WEP[1] ne ''){
print << "-----END-----";
<td align=center bgcolor=$TABLE_COLOR1>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="dasi4" value="1">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="pname" value="$FORM{'pname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<input type=submit value=废弃 $STYLE_B1>
</td>
</form>
-----END-----
}
else{print"<td align=center bgcolor=$TABLE_COLOR1>　</td>";}

if($WEP[2] ne ''){
print << "-----END-----";
<td align=center bgcolor=$TABLE_COLOR1>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="dasi4" value="2">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="pname" value="$FORM{'pname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<input type=submit value=废弃 $STYLE_B1>
</td>
</form>
-----END-----
}
else{print"<td align=center bgcolor=$TABLE_COLOR1>　</td>";}

if($WEP[3] ne ''){
print << "-----END-----";
<td align=center bgcolor=$TABLE_COLOR1>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="dasi4" value="3">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="pname" value="$FORM{'pname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<input type=submit value=废弃 $STYLE_B1>
</td>
</form>
-----END-----
}
else{print"<td align=center bgcolor=$TABLE_COLOR1>　</td>";}

if($WEP[4] ne ''){
print << "-----END-----";
<td align=center bgcolor=$TABLE_COLOR1>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="dasi4" value="4">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="pname" value="$FORM{'pname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<input type=submit value=废弃 $STYLE_B1>
</td></form></tr>
-----END-----
}
else{print"<td align=center bgcolor=$TABLE_COLOR1>　</td></tr>";}

print "<tr><td align=center bgcolor=$TABLE_COLOR2>价格设定</td>";

print << "-----END-----";
<td align=center bgcolor=$TABLE_COLOR1>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="dasi6" value="1">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="pname" value="$FORM{'pname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<input type=text name="uri1" size=12 value=$WEP[5]>
<input type=submit value=设定 $STYLE_B2>
</td>
</form>
<td align=center bgcolor=$TABLE_COLOR1>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="dasi6" value="2">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="pname" value="$FORM{'pname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<input type=text name="uri2" size=12 value=$WEP[6]>
<input type=submit value=设定 $STYLE_B2>
</td>
</form>
<td align=center bgcolor=$TABLE_COLOR1>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="dasi6" value="3">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="pname" value="$FORM{'pname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<input type=text name="uri3" size=12 value=$WEP[7]>
<input type=submit value=设定 $STYLE_B2>
</td>
</form>
<td align=center bgcolor=$TABLE_COLOR1>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="dasi6" value="4">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="pname" value="$FORM{'pname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<input type=text name="uri4" size=12 value=$WEP[8]>
<input type=submit value=设定 $STYLE_B2>
</td>
</form>
<td align=center bgcolor=$TABLE_COLOR1>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="dasi6" value="5">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="pname" value="$FORM{'pname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<input type=text name="uri5" size=12 value=$WEP[9]>
<input type=submit value=设定 $STYLE_B2>
</td></form></tr>
-----END-----
}

if($FORM{'pname'} ne $COOKIE{'pname'} && $noout ne 1){

print "<tr><td align=center bgcolor=$TABLE_COLOR2>贩卖价格</td>\n";

if($WEP[5] ne '' && $WEP[0] ne ""){print "<td align=center bgcolor=$TABLE_COLOR1><font size=5 color=red><b>$WEP[5]</b></font>Ｇ</td>\n";}
elsif($WEP[0] ne ""){print"<td align=center bgcolor=$TABLE_COLOR1><font color=blue>非卖品</font></td>\n";}
else{print"<td align=center bgcolor=$TABLE_COLOR1>　</td>\n";}

if($WEP[6] ne '' && $WEP[1] ne ""){print "<td align=center bgcolor=$TABLE_COLOR1><font size=5 color=red><b>$WEP[6]</b></font>Ｇ</td>\n";}
elsif($WEP[1] ne ""){print"<td align=center bgcolor=$TABLE_COLOR1><font color=blue>非卖品</font></td>\n";}
else{print"<td align=center bgcolor=$TABLE_COLOR1>　</td>\n";}

if($WEP[7] ne '' && $WEP[2] ne ""){print "<td align=center bgcolor=$TABLE_COLOR1><font size=5 color=red><b>$WEP[7]</b></font>Ｇ</td>\n";}
elsif($WEP[2] ne ""){print"<td align=center bgcolor=$TABLE_COLOR1><font color=blue>非卖品</font></td>\n";}
else{print"<td align=center bgcolor=$TABLE_COLOR1>　</td>\n";}


if($WEP[8] ne '' && $WEP[3] ne ""){print "<td align=center bgcolor=$TABLE_COLOR1><font size=5 color=red><b>$WEP[8]</b></font>Ｇ</td>\n";}
elsif($WEP[3] ne ""){print"<td align=center bgcolor=$TABLE_COLOR1><font color=blue>非卖品</font></td>\n";}
else{print"<td align=center bgcolor=$TABLE_COLOR1>　</td>\n";}

if($WEP[9] ne '' && $WEP[4] ne ""){print "<td align=center bgcolor=$TABLE_COLOR1><font size=5 color=red><b>$WEP[9]</b></font>Ｇ</td></tr>\n";}
elsif($WEP[4] ne ""){print"<td align=center bgcolor=$TABLE_COLOR1><font color=blue>非卖品</font></td></tr>\n";}
else{print"<td align=center bgcolor=$TABLE_COLOR1>　</td></tr>\n";}

print "<tr><td align=center bgcolor=$TABLE_COLOR2>购入</td>";


if($WEP[5] ne '' && $WEP[0] ne ""){
print << "-----END-----";
<td align=center bgcolor=$TABLE_COLOR1>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="dasi5" value="1">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="pname" value="$FORM{'pname'}">
<input type=hidden name="money" value="$WEP[5]">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<input type=submit value=购入 $STYLE_B1>
</td>
</form>
-----END-----
}
else{print"<td align=center bgcolor=$TABLE_COLOR1>　</td>";}

if($WEP[6] ne '' && $WEP[1] ne ""){
print << "-----END-----";
<td align=center bgcolor=$TABLE_COLOR1>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="dasi5" value="2">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="money" value="$WEP[6]">
<input type=hidden name="pname" value="$FORM{'pname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<input type=submit value=购入 $STYLE_B1>
</td>
</form>
-----END-----
}
else{print"<td align=center bgcolor=$TABLE_COLOR1>　</td>";}

if($WEP[7] ne '' && $WEP[2] ne ""){
print << "-----END-----";
<td align=center bgcolor=$TABLE_COLOR1>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="dasi5" value="3">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="money" value="$WEP[7]">
<input type=hidden name="pname" value="$FORM{'pname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<input type=submit value=购入 $STYLE_B1>
</td>
</form>
-----END-----
}
else{print"<td align=center bgcolor=$TABLE_COLOR1>　</td>";}


if($WEP[8] ne '' && $WEP[3] ne ""){
print << "-----END-----";
<td align=center bgcolor=$TABLE_COLOR1>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="dasi5" value="4">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="money" value="$WEP[8]">
<input type=hidden name="pname" value="$FORM{'pname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<input type=submit value=购入 $STYLE_B1>
</td>
</form>
-----END-----
}
else{print"<td align=center bgcolor=$TABLE_COLOR1>　</td>";}

if($WEP[9] ne '' && $WEP[4] ne ""){
print << "-----END-----";
<td align=center bgcolor=$TABLE_COLOR1>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="dasi5" value="5">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="money" value="$WEP[9]">
<input type=hidden name="pname" value="$FORM{'pname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<input type=submit value=购入 $STYLE_B1>
</td></form></tr>
-----END-----
}
else{print"<td align=center bgcolor=$TABLE_COLOR1>　</td></tr>";}

}

print "</table></td></tr>
<tr><td align=center colspan=2>
<font size=2>中文化改造- <a href=http://www.verytown.com/ target=_blank>
<font size=2>非常城市</font></a>
 - All Right Reserved.</font><p>
";
print "</td></tr></table>";
&FOOTER;
print "</body></html>";
exit;
}

sub HOKAN{

&INPORT;
@WEP = split(/\s/,$BUKI{"$FORM{'pname'}"});

&DBM_INPORT(P);
@VALS = split(/\s/,$P{"$FORM{'pname'}"});
if ($VALS[26] >= (time - 3)){&ERROR('不能连续的按');exit;}

&LOCK;

if($WEP[0] eq ""){$inweapon = "0";}
elsif($WEP[1] eq ""){$inweapon = "1";}
elsif($WEP[2] eq ""){$inweapon = "2";}
elsif($WEP[3] eq ""){$inweapon = "3";}
elsif($WEP[4] eq ""){$inweapon = "4";}
else{dbmclose %P;&UNLOCK;&ERROR('仓库がいっぱいです');}

if($FORM{'azuke2'} ne '' and $VALS[10] eq $FORM{'azuke2'}){
$WEP[$inweapon] = "$FORM{'azuke2'}";
$VALS[10] = "";
$num = 2;

	local($OWN_A,$OWLV_A) = split(/!/,$FORM{'azuke2'});
	@WN_sA=split(/\,/,$WEAPON_LIST{"$OWN_A"});
	$KEKKA = "【 $WN_sA[0]放入了倉庫。 】";
}

if($FORM{'azuke3'} ne '' and $VALS[11] eq $FORM{'azuke3'}){
$WEP[$inweapon] = "$FORM{'azuke3'}";
$VALS[11] = "";
$num = 3;

	local($OWN_A,$OWLV_A) = split(/!/,$FORM{'azuke3'});
	@WN_sA=split(/\,/,$WEAPON_LIST{"$OWN_A"});
	$KEKKA = "【 $WN_sA[0]放入了倉庫。 】";

}

if($FORM{'azuke4'} ne '' and $VALS[35] eq $FORM{'azuke4'}){
$WEP[$inweapon] = "$FORM{'azuke4'}";
$VALS[35] = "";
$num = 4;

	local($OWN_A,$OWLV_A) = split(/!/,$FORM{'azuke4'});
	@WN_sA=split(/\,/,$WEAPON_LIST{"$OWN_A"});
	$KEKKA = "【 $WN_sA[0]放入了倉庫。 】";

}

if($FORM{'azuke5'} ne '' and $VALS[36] eq $FORM{'azuke5'}){
$WEP[$inweapon] = "$FORM{'azuke5'}";
$VALS[36] = "";
$num = 5;

	local($OWN_A,$OWLV_A) = split(/!/,$FORM{'azuke5'});
	@WN_sA=split(/\,/,$WEAPON_LIST{"$OWN_A"});
	$KEKKA = "【 $WN_sA[0]放入了倉庫。 】";

}

$VALS[26] = $DATE;

dbmopen (%P,"$DBM_P",0666);
$P{"$FORM{'pname'}"}="@VALS";
dbmclose %P;

($hidari,$migi) = split(/\!/,$FORM{'azuke2'});
($hidari3,$migi3) = split(/\!/,$FORM{'azuke3'});

@OUTPUT="$WEP[0] $WEP[1] $WEP[2] $WEP[3] $WEP[4] $WEP[5] $WEP[6] $WEP[7] $WEP[8] $WEP[9]";

dbmopen (%BUKI,"$BUKIDB",0666);
$BUKI{"$COOKIE{'pname'}"}="@OUTPUT";
dbmclose %BUKI;
&UNLOCK;
&SOUKO;
}

sub DASU {

&INPORT;
@WEP = split(/\s/,$BUKI{"$FORM{'pname'}"});

&LOCK;
dbmopen (%P,"$DBM_P",0666);
@VALS = split(/\s/,$P{"$FORM{'pname'}"});
@VS_VALS = split(/\s/,$P{"$COOKIE{'pname'}"});

if ($VS_VALS[26] >= (time - 3)){dbmclose %P;&ERROR('不能连续的按');exit;}

if($VS_VALS[10] ne "" && $VS_VALS[11] ne "" && $VS_VALS[35] ne "" && $VS_VALS[36] ne ""){$bukimoti = 1;}

$upwep = "$$FORM{'wepnum'}";

if($FORM{'dasi2'} ne ''){
if($VALS[10] ne ""){dbmclose %P;&UNLOCK;&ERROR('身上的武器滿了');}
$VS_VALS[10] = $FORM{'dasi2'};
if($FORM{'wepnum'} eq "1"){$WEP[0] = "";$WEP[5] = "";$err = 1;}
if($FORM{'wepnum'} eq "2"){$WEP[1] = "";$WEP[6] = "";$err = 1;}
if($FORM{'wepnum'} eq "3"){$WEP[2] = "";$WEP[7] = "";$err = 1;}
if($FORM{'wepnum'} eq "4"){$WEP[3] = "";$WEP[8] = "";$err = 1;}
if($FORM{'wepnum'} eq "5"){$WEP[4] = "";$WEP[9] = "";$err = 1;}
if($err ne 1){dbmclose %P;&UNLOCK;&ERROR('身上的武器滿了');}

	local($WN_A,$WLV_A) = split(/!/,$FORM{'dasi2'});	
	@WN_sA=split(/\,/,$WEAPON_LIST{"$WN_A"});
	$KEKKA = "【 $WN_sA[0]從庫房中取了出來。 】";
}

if($FORM{'dasi3'} ne ''){
if($VALS[11] ne ""){dbmclose %P;&UNLOCK;&ERROR('身上的武器滿了');}
$VS_VALS[11] = $FORM{'dasi3'};
if($FORM{'wepnum'} eq "1"){$WEP[0] = "";$WEP[5] = "";$err = 1;}
if($FORM{'wepnum'} eq "2"){$WEP[1] = "";$WEP[6] = "";$err = 1;}
if($FORM{'wepnum'} eq "3"){$WEP[2] = "";$WEP[7] = "";$err = 1;}
if($FORM{'wepnum'} eq "4"){$WEP[3] = "";$WEP[8] = "";$err = 1;}
if($FORM{'wepnum'} eq "5"){$WEP[4] = "";$WEP[9] = "";$err = 1;}
if($err ne 1){dbmclose %P;&UNLOCK;&ERROR('身上的武器滿了');}

	local($WN_A,$WLV_A) = split(/!/,$FORM{'dasi3'});	
	@WN_sA=split(/\,/,$WEAPON_LIST{"$WN_A"});
	$KEKKA = "【 $WN_sA[0]從倉庫中拿出了。 】";

}
if($FORM{'dasi8'} ne ''){
if($VALS[35] ne ""){dbmclose %P;&UNLOCK;&ERROR('身上的武器滿了');}
$VS_VALS[35] = $FORM{'dasi8'};
if($FORM{'wepnum'} eq "1"){$WEP[0] = "";$WEP[5] = "";$err = 1;}
if($FORM{'wepnum'} eq "2"){$WEP[1] = "";$WEP[6] = "";$err = 1;}
if($FORM{'wepnum'} eq "3"){$WEP[2] = "";$WEP[7] = "";$err = 1;}
if($FORM{'wepnum'} eq "4"){$WEP[3] = "";$WEP[8] = "";$err = 1;}
if($FORM{'wepnum'} eq "5"){$WEP[4] = "";$WEP[9] = "";$err = 1;}
if($err ne 1){dbmclose %P;&UNLOCK;&ERROR('身上的武器滿了');}

	local($WN_A,$WLV_A) = split(/!/,$FORM{'dasi8'});	
	@WN_sA=split(/\,/,$WEAPON_LIST{"$WN_A"});
	$KEKKA = "【 $WN_sA[0]從倉庫中拿出了。 】";

}
if($FORM{'dasi9'} ne ''){
if($VALS[36] ne ""){dbmclose %P;&UNLOCK;&ERROR('身上的武器滿了');}
$VS_VALS[36] = $FORM{'dasi9'};
if($FORM{'wepnum'} eq "1"){$WEP[0] = "";$WEP[5] = "";$err = 1;}
if($FORM{'wepnum'} eq "2"){$WEP[1] = "";$WEP[6] = "";$err = 1;}
if($FORM{'wepnum'} eq "3"){$WEP[2] = "";$WEP[7] = "";$err = 1;}
if($FORM{'wepnum'} eq "4"){$WEP[3] = "";$WEP[8] = "";$err = 1;}
if($FORM{'wepnum'} eq "5"){$WEP[4] = "";$WEP[9] = "";$err = 1;}
if($err ne 1){dbmclose %P;&UNLOCK;&ERROR('身上的武器滿了');}

	local($WN_A,$WLV_A) = split(/!/,$FORM{'dasi9'});	
	@WN_sA=split(/\,/,$WEAPON_LIST{"$WN_A"});
	$KEKKA = "【 $WN_sA[0]從倉庫中拿出了。 】";

}

if($FORM{'dasi4'} ne ''){
	$haikiw = "$FORM{'dasi4'}";

	local($WN_A,$WLV_A) = split(/!/,$WEP[$haikiw]);	
	@WN_sA=split(/\,/,$WEAPON_LIST{"$WN_A"});
	$KEKKA = "【 $WN_sA[0]丟掉了。 】";
	$WEP[$haikiw] = "";
}                
          
if($FORM{'dasi6'} ne ""){
if($FORM{'uri1'} =~ m/\D/g && $FORM{'uri1'} ne ""){dbmclose %P;&UNLOCK;&ERROR('半角数字で记入してください');}
if($FORM{'uri2'} =~ m/\D/g && $FORM{'uri2'} ne ""){dbmclose %P;&UNLOCK;&ERROR('半角数字で记入してください');}
if($FORM{'uri3'} =~ m/\D/g && $FORM{'uri3'} ne ""){dbmclose %P;&UNLOCK;&ERROR('半角数字で记入してください');}
if($FORM{'uri4'} =~ m/\D/g && $FORM{'uri4'} ne ""){dbmclose %P;&UNLOCK;&ERROR('半角数字で记入してください');}
if($FORM{'uri5'} =~ m/\D/g && $FORM{'uri5'} ne ""){dbmclose %P;&UNLOCK;&ERROR('半角数字で记入してください');}

	local($OWN_A,$OWLV_A) = split(/!/,$WEP[0]);
	local($OWN_B,$OWLV_B) = split(/!/,$WEP[1]);
	local($OWN_C,$OWLV_C) = split(/!/,$WEP[2]);
	local($OWN_D,$OWLV_D) = split(/!/,$WEP[3]);
	local($OWN_E,$OWLV_E) = split(/!/,$WEP[4]);

@WN_sA=split(/\,/,$WEAPON_LIST{"$OWN_A"});
@WN_sB=split(/\,/,$WEAPON_LIST{"$OWN_B"});
@WN_sC=split(/\,/,$WEAPON_LIST{"$OWN_C"});
@WN_sD=split(/\,/,$WEAPON_LIST{"$OWN_D"});
@WN_sE=split(/\,/,$WEAPON_LIST{"$OWN_E"});

if($FORM{'dasi6'} == 1 && $WEP[0] ne ""){$WEP[5] = $FORM{'uri1'};$KEKKA = "【 $WN_sA[0]を$FORM{'uri1'}Ｇ開始販賣。】";}
if($FORM{'dasi6'} == 2 && $WEP[1] ne ""){$WEP[6] = $FORM{'uri2'};$KEKKA = "【 $WN_sB[0]を$FORM{'uri2'}Ｇ開始販賣。】";}
if($FORM{'dasi6'} == 3 && $WEP[2] ne ""){$WEP[7] = $FORM{'uri3'};$KEKKA = "【 $WN_sC[0]を$FORM{'uri3'}Ｇ開始販賣。】";}
if($FORM{'dasi6'} == 4 && $WEP[3] ne ""){$WEP[8] = $FORM{'uri4'};$KEKKA = "【 $WN_sD[0]を$FORM{'uri4'}Ｇ開始販賣。】";}
if($FORM{'dasi6'} == 5 && $WEP[4] ne ""){$WEP[9] = $FORM{'uri5'};$KEKKA = "【 $WN_sE[0]を$FORM{'uri5'}Ｇ開始販賣。】";}
}

if($FORM{'dasi5'} ne ""){
if($bukimoti == 1){dbmclose %P;&UNLOCK;&ERROR('身上的武器滿了');}
if($VS_VALS[8] < $FORM{'money'}){dbmclose %P;&UNLOCK;&ERROR("お金が足りません");}
if($FORM{'dasi5'} == 1){if($WEP[0] eq ""){dbmclose %P;&UNLOCK;&ERROR('商品は卖り切れです');exit;}$vswep = $WEP[0];$WEP[0] = "";$WEP[5] = "";}
if($FORM{'dasi5'} == 2){if($WEP[1] eq ""){dbmclose %P;&UNLOCK;&ERROR('商品は卖り切れです');exit;}$vswep = $WEP[1];$WEP[1] = "";$WEP[6] = "";}
if($FORM{'dasi5'} == 3){if($WEP[2] eq ""){dbmclose %P;&UNLOCK;&ERROR('商品は卖り切れです');exit;}$vswep = $WEP[2];$WEP[2] = "";$WEP[7] = "";}
if($FORM{'dasi5'} == 4){if($WEP[3] eq ""){dbmclose %P;&UNLOCK;&ERROR('商品は卖り切れです');exit;}$vswep = $WEP[3];$WEP[3] = "";$WEP[8] = "";}
if($FORM{'dasi5'} == 5){if($WEP[4] eq ""){dbmclose %P;&UNLOCK;&ERROR('商品は卖り切れです');exit;}$vswep = $WEP[4];$WEP[4] = "";$WEP[9] = "";}

$VALS[8] = $VALS[8] + $FORM{'money'};
$VS_VALS[8] = $VS_VALS[8] - $FORM{'money'};

if($VS_VALS[10] eq ""){$VS_VALS[10] = "$vswep";}
elsif($VS_VALS[11] eq ""){$VS_VALS[11] = "$vswep";}
elsif($VS_VALS[35] eq ""){$VS_VALS[35] = "$vswep";}
elsif($VS_VALS[36] eq ""){$VS_VALS[36] = "$vswep";}
else{dbmclose %P;&UNLOCK;&ERROR('身上裝備滿了');exit;}

	local($OWN_A,$OWLV_A) = split(/!/,$vswep);
	@WN_sA=split(/\,/,$WEAPON_LIST{"$OWN_A"});

$KEKKA = "【 $WN_sA[0]用了$FORM{'money'}Ｇ買入了。 】";
}

$VALS[26] = $DATE ;
$P{"$FORM{'pname'}"}="@VALS";
$P{"$COOKIE{'pname'}"}="@VS_VALS";
dbmclose %P;

@OUTPUT="$WEP[0] $WEP[1] $WEP[2] $WEP[3] $WEP[4] $WEP[5] $WEP[6] $WEP[7] $WEP[8] $WEP[9]";

dbmopen (%BUKI,"$BUKIDB",0666);
$BUKI{"$FORM{'pname'}"}="@OUTPUT";
dbmclose %BUKI;

&UNLOCK;
&SOUKO;
}