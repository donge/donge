#!/usr/bin/perl

##################################################################
#
# -------���ù涨�ˤĤ���-----------------------------------------
# ���Υ�����ץȤ�NET GAME Communications��http://www.ngcoms.net/��
# ���䲼���Ƥ���ENDLESSBATTLE2��׷�ӥץ����Ǥ���
#
# ���Υ�����ץȤϥեꡪ���եȤǤ�������Ȩ�Ϸ������Ƥ���ޤ���
# ���Υ�����ץȤ�ʹ�ä��뷽�����¤����ù涨�˻��Ť�ʹ�ä��Ƥ���������
#
# 1.���Υ�����ץȤ�ʹ�ä��Τ餫���𺦤����ä��Ȥ��Ƥ⡢���߼��ӵ�����
#   �Ȥ����Τ��ޤ���Ȥ��ޤ���
# 2.����ȤϤ����ɤ��Ф��ޤ��������ˤ����Τˤ������ФäƤ�������
# 3.���䲼�Ϥ����ɤ��Ф�����Ȥ��ޤ���������Ȩ��ʾ���������ʤ���
#   �¤���
#
##################################################################
#
#---------------ENDLESSBATTLE������ץȤؤ�׷��-------------------
#
# 1.ebs_sub3.cgi��<input type=button>�ʤɤΥ��ޥ�ɥܥ��󤬤��볡����
#   ���¤��Ф�׷�Ӥ��Ƥ���������
#
# <td><input type=button value="����" $STYLE_B1 onClick="parent.Sub.location.replace('./���Υ�����ץȤ���ǰ')"></td>
#
# ���Υ�����ץȤ���ǰ�����餫��Ƥ��벿�֤򤳤Υ�����ץȤ���ǰ�˱䤨�Ƥ���������
#
# 2._hash.data������γ����ˡ����¤Σ��Ф�׷�Ӥ��Ƥ���������
#
# "hojoken"=>"ϡ�еVʯ,0,0,0,0,0,0,0,100",
# "hukubiki"=>"���_��ķ�Ͻ�,0,0,0,0,0,0,0,100",
#
# �����ƥ�ɣĤϱ�����ʤ����¤����������100�Ȥ������֤�����ȷ�ʤˤʤ�ޤ���
#
##################################################################
#�����趨

$SCRIPTNM="zhi.cgi";	#�ֿ⥹����ץ���
$hukubikiDB="zhidb";		#������ǡ�������ɤ��루�ѡ��ߥå���󣷣�����
$rekisi = "1";			#һ�Ȥ������ä�ʱ����ʷ�˱�ʾ���볡�Ϥϣ�����ʾ���ʤ��ʤ�0���ǤǼ��뤷�Ƥ���������
$TABLE_STYLE = "bordercolor=#404040 border=1 cellspacing=0 style=\"font-size:10pt\"";#<TABLE>�Υ�������Ǥ���
require 'ebs_sub1.cgi';		#ebs_sub1.cgi�Υ�����ץ���
require "./$LOG_FOLDER/$HASH_DATA";	#�ϥå���ǡ����γ����������Ҫ��

#####################################################################################################################
#��Ʒ�Ȥʤ륢���ƥ����Ǥ������£��Ĥ�@�������ȫ��ͬ�����˺Ϥ碌���¤�����(�����ʤ飶���ȣ�

@keihin = ("��һ�تz�����`��","����������ӱ��鄦","���Ͻ������","������","����װ��","EXAM(������ϵ�y)ǿ��װ��4","�ƽ�","�������","�������������͹�����");

#####################################################################################################
#_hash.data�ڤ����˼��ؤ��Ƥ��륢���ƥ��ãɣĤǤ����ϼǤΥ����ƥ����˺Ϥ碌��ͬ���褦�˼��뤷�Ƥ���������

@hash = ("v","cccaaa","aaaaaa","ccccc","sssssc","pppp","qqqqq","occ","ssss");

#################################################################################################
#�����ƥ�ε�����ȷ�ʤǤ����ϼǣ�����ε�����ȷ�ʤ�1000�֤Τ����Ĥ����餤�Ƥ���������
#һ���󤫤������󤭤��ʤäƤ����褦�ˤ��ơ���������֤Ϥ��ʤ餺���������ˤʤ�褦�ˤ����¤�����

@kakuritu = ("5","10","100","150","200","400","500","600","1000");

#�趨�����ޤ�
##################################################################
#���������¤β��֤�perl��ʹ�ä����ץ����Ǥ�����������뷶Χ�Ǳ�����Ƥ���������

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

if($SUB){&ERROR('ֱ��󥯤Ͻ�ֹ�Ǥ�','���ڤ���Υ���������Ը�����ޤ���') if $ENV{'HTTP_REFERER'} !~ m/^$THIS_DIR/ && $DIRECT_LINK && $SUB ne 'MY_LIST' && $SUB ne 'C_LIST';}

!$SUB && ($SUB='MAIN');

&$SUB;

sub COOKIE_IN {

&HEADER;
print<<"HTML";
<table border=0 width=100% height=90%><tr><td align=center valign=middle>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=cmd value=MAIN>
<table $TABLE_STYLE>
<tr><td bgcolor=$TABLE_COLOR2 colspan=2>�����u��S</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR2>���Q</td>
<td bgcolor=$TABLE_COLOR1><input type=text size=30 name=pname $STYLE_B1></td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2>�ܴa</td>
<td bgcolor=$TABLE_COLOR1><input type=password size=30 name=pass $STYLE_B1></td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1 colspan=2 align=right><input type=submit value=���� $STYLE_B1></td>
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
<tr><td bgcolor=$TABLE_COLOR2>�u���h��</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR1>
ս���п����õ�ϡ�еVʯ�͸��_��ķ�Ͻ�<br>
�������@Щ�u���������Ǻǡ�<br>
���_��ķ�Ͻ�һ�����ߡ�ϡ�еVʯ�傀�������u��һ������ ��<p>
������ʲ���أ��Լ�ԇ򞡣<p>
�����Լ�ԇ򞣬�eʲ�ᶼ��<br><p>
<table>
HTML

$i = 0;
foreach(@keihin){
$j = $i + 1;
print<<"TABLE";
<tr>
<td bgcolor=$TABLE_COLOR2>$j��</td>
<td bgcolor=$TABLE_COLOR1>$keihin[$i]</td>
</tr>
TABLE
$i++;
}

print<<"SAIGO";
</table>
</td></tr></table>
<br><br><br><br><br>
<input type=button value="����" $STYLE_B1 onClick="parent.Sub.location.replace('./$SCRIPTNM')">
SAIGO
&END;
exit;
}

sub hukubiki {

&LOCK;
&DBM_INPORT(P);
dbmopen (%P,"$DBM_P",0666);
@VALS = split(/\s/,$P{"$inname"});
if($VALS[26] > $FORM{'time'}){&ERROR("�����२�顪�Ǥ���");}

$randam = int(rand(2000));
$i = 0;

foreach $number (@kakuritu){

if($number >= $randam){$atari = $i;last;}

$i++;
}

if($atari eq ""){&ERROR('���顪�ǥϥ���Ǥ���');}

$buki = $keihin[$atari];
$bukin = $hash[$atari];
$tou = $atari + 1;

if($FORM{'mode'} == 2){
if($VALS[10] ne ""){dbmclose %P;&UNLOCK;&ERROR('�����b��M�ˡ�');}
$VALS[10] = "$bukin";
}

elsif($FORM{'mode'} == 3){
if($VALS[11] ne ""){dbmclose %P;&UNLOCK;&ERROR('�����b��M�ˡ�');}
$VALS[11] = "$bukin";}

elsif($FORM{'mode'} == 4){
if($VALS[35] ne ""){dbmclose %P;&UNLOCK;&ERROR('�����b��M�ˡ�');}
$VALS[35] = "$bukin";}

elsif($FORM{'mode'} == 5){
if($VALS[36] ne ""){dbmclose %P;&UNLOCK;&ERROR('�����b��M�ˡ�');}
$VALS[36] = "$bukin";}

else{dbmclose %P;&UNLOCK;&ERROR('���顪�Τ���Ϥ���Ǥ���');}

$VALS[26] = $DATE;

$P{"$inname"}="@VALS";
dbmclose %P;

if($atari == 0 && $rekisi == 1){
dbmopen (%DH,"$DBM_H",0666);
$DH{"$DATE"}="$inname�u����$buki���֡�";
dbmclose %DH;
}

&UNLOCK;

&HEADER;
print<<"HTML";
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2>$tou�Vʯ</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR1>
$tou�Vʯ$buki����ˡ�
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
if(crypt($inpass,eb) ne "$VALS[2]"){&ERROR("�ܴa�e�`��");}

&INPORT;
@ken = split(/\s/,$KEN{"$inname"});

if($ken[0] ne ""){$no1 = "��";}else{$no1 = "��";}
if($ken[1] ne ""){$no2 = "��";}else{$no2 = "��";}
if($ken[2] ne ""){$no3 = "��";}else{$no3 = "��";}
if($ken[3] ne ""){$no4 = "��";}else{$no4 = "��";}
if($ken[4] ne ""){$no5 = "��";}else{$no5 = "��";}

local($WN_A,$WLV_A) = split(/!/,$VALS[9]);	
local($WN_B,$WLV_B) = split(/!/,$VALS[10]);
local($WN_C,$WLV_C) = split(/!/,$VALS[11]);
local($WN_D,$WLV_D) = split(/!/,$VALS[35]);
local($WN_E,$WLV_E) = split(/!/,$VALS[36]);

if($WN_B eq "hukubiki" || $WN_B eq "hojoken"){$submit1 = "<input type=submit value=ȡ�� $STYLE_B1>";}
if($WN_C eq "hukubiki" || $WN_C eq "hojoken"){$submit2 = "<input type=submit value=ȡ�� $STYLE_B1>";}
if($WN_D eq "hukubiki" || $WN_D eq "hojoken"){$submit3 = "<input type=submit value=ȡ�� $STYLE_B1>";}
if($WN_E eq "hukubiki" || $WN_E eq "hojoken"){$submit4 = "<input type=submit value=ȡ�� $STYLE_B1>";}

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

if($WN_B ne ""){$SB = "$WN_sB[0](Lv.$WLV_B)";}else{$SB = "��װ��";}
if($WN_C ne ""){$SC = "$WN_sC[0](Lv.$WLV_C)";}else{$SC = "��װ��";}
if($WN_D ne ""){$SD = "$WN_sD[0](Lv.$WLV_D)";}else{$SD = "��װ��";}
if($WN_E ne ""){$SE = "$WN_sE[0](Lv.$WLV_E)";}else{$SE = "��װ��";}

&HEADER;
print<<"HTML";
<table border=0><tr><td valign=top>
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=3>$inname��װ��\</b></td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2>װ��\</td>
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
<td bgcolor=$TABLE_COLOR2>��\��\</td>
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
<td bgcolor=$TABLE_COLOR2>��\��\</td>
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
<td bgcolor=$TABLE_COLOR2>��\��\</td>
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
<td bgcolor=$TABLE_COLOR2>��\��\</td>
<td bgcolor=$TABLE_COLOR1>$SE</td>
<td bgcolor=$TABLE_COLOR1>$submit4</td>
</form>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=3>����˵��</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1 colspan=3>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=pname value=$inname>
<input type=hidden name=pass value=$inpass>
<input type=hidden name=cmd value=SETUMEI>
<input type=submit value="˵����" $STYLE_B1>
</td>
</tr>
</form>
</table>

</td>
<td valign=top>
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=2>ϡ�еVʯ\倻���</b></td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1>��</td>
<td bgcolor=$TABLE_COLOR1 align=center>$no1</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1>��</td>
<td bgcolor=$TABLE_COLOR1 align=center>$no2</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1>��</td>
<td bgcolor=$TABLE_COLOR1 align=center>$no3</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1>��</td>
<td bgcolor=$TABLE_COLOR1 align=center>$no4</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1>��</td>
<td bgcolor=$TABLE_COLOR1 align=center>$no5</td>
</tr>
</table>
</td></tr></table>
HTML
&END;
exit;
}

sub END {
print "<div align=center><font size=2>���Ļ�����:(C) 2002 - <a href=http://www.verytown.com/ target=_blank><font size=2>�ǳ�����</font></a> - All Right Reserved.</font></div><p>";
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
if(crypt($inpass,eb) ne "$VALS[2]"){dbmclose %P;&UNLOCK;&ERROR("�ܴa�e�`��");}

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
else{dbmclose %P;&UNLOCK;&ERROR('ԭ������');exit;}

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
else{dbmclose %P;&UNLOCK;&ERROR('ԭ������');}

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
<td colspan=2 bgcolor=$TABLE_COLOR2>�u���</td></tr>
HTML
$i = 0;

foreach(@keihin){
$j = $i + 1;
print<<"TABLE";
<tr>
<td bgcolor=$TABLE_COLOR2>$j��</td>
<td bgcolor=$TABLE_COLOR1>$keihin[$i]</td>
</tr>
TABLE
$i++;
}

print<<"SAIGO";
<tr>
<td colspan=2 bgcolor=$TABLE_COLOR2>�����u��S</td></tr>
<tr>
<td colspan=2 bgcolor=$TABLE_COLOR1 align=center>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=pname value=$inname>
<input type=hidden name=pass value=$inpass>
<input type=hidden name=time value=$DATE>
<input type=hidden name=cmd value=hukubiki>
<input type=hidden name=mode value=$num>
<input type=submit value=�u������ $STYLE_B1></form>
</td></tr></table>
SAIGO

&END;
exit;
}
