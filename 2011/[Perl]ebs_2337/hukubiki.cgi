#!/usr/local/bin/perl

##################################################################
#
# -------���p�K��ɂ���-----------------------------------------
# ���̃X�N���v�g��NET GAME Communications�uhttp://www.ngcoms.net/�v
# �Ŕz�z���Ă���ENDLESSBATTLE2�̒ǉ��v���O�����ł��B
#
# ���̃X�N���v�g�̓t���[�\�t�g�ł������쌠�͕������Ă���܂���B
# ���̃X�N���v�g���g�p������͈ȉ��̗��p�K��Ɋ�Â��g�p���Ă��������B
#
# 1.���̃X�N���v�g���g�p�����炩�̑��Q���������Ƃ��Ă��A��ҋy�ѓ��T�C
#   �g�ɐӔC�͖������Ƃ��܂��B
# 2.�������͂����R�ɍs���܂����A�l�̐ӔC�ɂ����čs���Ă�������
# 3.�Ĕz�z�͂����R�ɍs���镨�Ƃ��܂����A���쌠�\�����폜���Ȃ���
#   ������
# SCRIPT NAME	EBS HUKUBIKI ver 2.1
# HOMEPAGE 	http://melcha.zone.ne.jp/ebs/dl/
# E-MAIL 	44net@kk.sakura.ne.jp
# (C)2001 44-net FACTORY
#
##################################################################
#
#---------------ENDLESSBATTLE�X�N���v�g�ւ̒ǉ�-------------------
#
# 1.ebs_sub3.cgi��<input type=button>�Ȃǂ̃R�}���h�{�^��������ꏊ��
#   �ȉ��̍s��ǉ����Ă��������B
#
# <td><input type=button value="����" $STYLE_B1 onClick="parent.Sub.location.replace('./���̃X�N���v�g�̖��O')"></td>
#
# ���̃X�N���v�g�̖��O�@�Ə�����Ă��镔�������̃X�N���v�g�̖��O�ɕς��Ă��������B
#
# 2._hash.data�̔C�ӂ̏ꏊ�ɁA�ȉ��̂Q�s��ǉ����Ă��������B
#
# "hojoken"=>"�����⏕��,0,0,0,0,0,0,0,100",
# "hukubiki"=>"������,0,0,0,0,0,0,0,100",
#
# �A�C�e���h�c�͕ύX���Ȃ��ŉ������B�Ō��100�Ƃ�������������m���ɂȂ�܂��B
#
##################################################################
#�e��ݒ�

$SCRIPTNM="hukubiki.cgi";	#�q�ɃX�N���v�g��
$HUKUBIKIDB="hukubikidb";		#����Ƀf�[�^���i�[����i�p�[�~�b�V�����V�V�V�j
$rekisi = "1";			#�ꓙ�������������ɗ��j�ɕ\������ꍇ�͂P�A�\�����Ȃ��Ȃ�0�𔼊p�ŋL�����Ă��������B
$TABLE_STYLE = "bordercolor=#404040 border=1 cellspacing=0 style=\"font-size:10pt\"";#<TABLE>�̃X�^�C���ł��B
require 'ebs_sub1.cgi';		#ebs_sub1.cgi�̃X�N���v�g��
require "./$LOG_FOLDER/$HASH_DATA";	#�n�b�V���f�[�^�̏ꏊ�i�ύX�s�v�j

#####################################################################################################################
#�i�i�ƂȂ�A�C�e�����ł��B�ȉ��R��@�̒��g�͑S�ē������ɍ��킹�ĉ������B(�U�Ȃ�U�Ɓj

@keihin = ("������","�o�O","�j�@��","�Ί͋@��","�@��");

#####################################################################################################
#_hash.data���̍����ɋL�ڂ��Ă���A�C�e���p�h�c�ł��B��L�̃A�C�e�����ɍ��킹�ē����悤�ɋL�����Ă��������B

@hash = ("kkkkk","kkkk","kkk","kk","k");

#################################################################################################
#�A�C�e���̓�����m���ł��B��L�Q��ނ̓�����m����1000���̂������������Ă��������B
#��ԍ����琔���傫���Ȃ��Ă����悤�ɂ��āA�Ō�̐����͂��Ȃ炸�P�O�O�O�ɂȂ�悤�ɂ��ĉ������B

@kakuritu = ("10","100","300","600","1000");

#�ݒ肱���܂�
##################################################################
#�������牺�̕�����perl���g�p�����v���O�����ł��B�����o����͈͂ŕύX���Ă��������B

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

if($SUB){&ERROR('�������N�͋֎~�ł�','���������̃A�N�Z�X���肢���܂��B') if $ENV{'HTTP_REFERER'} !~ m/^$THIS_DIR/ && $DIRECT_LINK && $SUB ne 'MY_LIST' && $SUB ne 'C_LIST';}

!$SUB && ($SUB='MAIN');

&$SUB;

sub COOKIE_IN {

&HEADER;
print<<"HTML";
<table border=0 width=100% height=90%><tr><td align=center valign=middle>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=cmd value=MAIN>
<table $TABLE_STYLE>
<tr><td bgcolor=$TABLE_COLOR2 colspan=2>�����������</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR2>���O</td>
<td bgcolor=$TABLE_COLOR1><input type=text size=30 name=pname $STYLE_B1></td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2>�p�X���[�h</td>
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
<tr><td bgcolor=$TABLE_COLOR2>�����̐���</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR1>
�퓬���ɕ������╟���⏕�����E�����Ƃ�����܂��B<br>
�������s�����Ƃɂ��A�f�G�Ȍi�i��������܂��B<br>
�������͂P���A�����⏕���͂T���ŁA�P�񂾂��������s�����Ƃ��o���܂��B<p>
�����̎g�p���@�͈ȉ��̂Ƃ���ɂȂ�܂��B<p>
�P�D��ɓ��ꂽ�������A�����⏕����\\��\��\��\�ɓ���Ă����܂��B<br>
�Q�D���������ĕ������ɍs���A�����o���܂��B<br>
�R�D���������o�����ꍇ�́A���̂܂ܕ������s�����Ƃ��o���܂��B<br>
�S�D�����⏕���͌����o���ƌ����~�ς���Ă����܂��B<br>
�T�D�~�ς��ꂽ�����⏕�������v�T���ɂȂ�ƕ������s�����Ƃ��o���܂��B<p>
�i�i�͈ȉ��̂Ƃ���ɂȂ�܂��B<p>
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
<input type=button value="�߂�" $STYLE_B1 onClick="parent.Sub.location.replace('./$SCRIPTNM')">
SAIGO
&END;
exit;
}

sub HUKUBIKI {

&LOCK;
&DBM_INPORT(P);
dbmopen (%P,"$DBM_P",0666);
@VALS = split(/\s/,$P{"$inname"});
if($VALS[26] > $FORM{'time'}){&ERROR("�^�C���G���[�ł��B");}

$randam = int(rand(1));
$i = 0;

foreach $number (@kakuritu){

if($number >= $randam){$atari = $i;last;}

$i++;
}

if($atari eq ""){&ERROR('�G���[�Ńn�Y���ł��B');}

$buki = $keihin[$atari];
$bukin = $hash[$atari];
$tou = $atari + 1;

if($FORM{'mode'} == 2){
if($VALS[10] ne ""){dbmclose %P;&UNLOCK;&ERROR('�莝���������ς��̂��߃n�Y���ł��B');}
$VALS[10] = "$bukin";
}

elsif($FORM{'mode'} == 3){
if($VALS[11] ne ""){dbmclose %P;&UNLOCK;&ERROR('�莝���������ς��̂��߃n�Y���ł��B');}
$VALS[11] = "$bukin";}

else{dbmclose %P;&UNLOCK;&ERROR('�G���[�̂��߂͂���ł��B');}

$VALS[26] = $DATE;

$P{"$inname"}="@VALS";
dbmclose %P;

if($atari == 0 && $rekisi == 1){
dbmopen (%DH,"$DBM_H",0666);
$DH{"$DATE"}="$inname�������łP���𓖂Ă܂����B�i�i�Ƃ���$buki����ɓ���܂����B";
dbmclose %DH;
}

&UNLOCK;

&HEADER;
print<<"HTML";
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2>$tou����������܂���</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR1>
$tou���̏��i$buki���l�����܂����B
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
if(crypt($inpass,eb) ne "$VALS[2]"){&ERROR("�p�X���[�h���Ԉ���Ă��܂��B");}

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

if($WN_B eq "hukubiki" || $WN_B eq "hojoken"){$submit1 = "<input type=submit value=�o�� $STYLE_B1>";}
if($WN_C eq "hukubiki" || $WN_C eq "hojoken"){$submit2 = "<input type=submit value=�o�� $STYLE_B1>";}

$WLV_A=int$WLV_A/$WEAPON_LVUP;
$WLV_B=int$WLV_B/$WEAPON_LVUP;
$WLV_C=int$WLV_C/$WEAPON_LVUP;

@WN_sA=split(/\,/,$WEAPON_LIST{"$WN_A"});
@WN_sB=split(/\,/,$WEAPON_LIST{"$WN_B"});
@WN_sC=split(/\,/,$WEAPON_LIST{"$WN_C"});

if($WN_B ne ""){$SB = "$WN_sB[0](Lv.$WLV_B)";}else{$SB = "������";}
if($WN_C ne ""){$SC = "$WN_sC[0](Lv.$WLV_C)";}else{$SC = "������";}

&HEADER;
print<<"HTML";
<table border=0><tr><td valign=top>
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=3>$inname�̑���\</b></td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2>����\</td>
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
<td bgcolor=$TABLE_COLOR2>�\\��\</td>
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
<td bgcolor=$TABLE_COLOR2>�\\��\</td>
<td bgcolor=$TABLE_COLOR1>$SC</td>
<td bgcolor=$TABLE_COLOR1>$submit2</td>
</form>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=3>�⏕����</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1 colspan=3>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=pname value=$inname>
<input type=hidden name=pass value=$inpass>
<input type=hidden name=cmd value=SETUMEI>
<input type=submit value="������" $STYLE_B1>
</td>
</tr>
</form>
</table>

</td>
<td valign=top>
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=2>�⏕���\\�����</b></td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1>�P</td>
<td bgcolor=$TABLE_COLOR1 align=center>$no1</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1>�Q</td>
<td bgcolor=$TABLE_COLOR1 align=center>$no2</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1>�R</td>
<td bgcolor=$TABLE_COLOR1 align=center>$no3</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1>�S</td>
<td bgcolor=$TABLE_COLOR1 align=center>$no4</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1>�T</td>
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
if(crypt($inpass,eb) ne "$VALS[2]"){dbmclose %P;&UNLOCK;&ERROR("�p�X���[�h���Ԉ���Ă��܂��B");}

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
else{dbmclose %P;&UNLOCK;&ERROR('�����s���̃G���[1�ł��B');exit;}

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
else{dbmclose %P;&UNLOCK;&ERROR('�����s���̃G���[2�ł��B');}

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
<td colspan=2 bgcolor=$TABLE_COLOR2>�i�i�ɂ���</td></tr>
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
<td colspan=2 bgcolor=$TABLE_COLOR2>������</td></tr>
<tr>
<td colspan=2 bgcolor=$TABLE_COLOR1 align=center>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=pname value=$inname>
<input type=hidden name=pass value=$inpass>
<input type=hidden name=time value=$DATE>
<input type=hidden name=cmd value=HUKUBIKI>
<input type=hidden name=mode value=$num>
<input type=submit value=�����J�n $STYLE_B1></form>
</td></tr></table>
SAIGO

&END;
exit;
}

