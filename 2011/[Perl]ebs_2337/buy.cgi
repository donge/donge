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
# SCRIPTNAME	EBS AUCTION ver 1.1
# HOMEPAGE 	
# E-MAIL 	44net@kk.sakura.ne.jp
# (C)2001 44-net FACTORY
#
##################################################################
#
#---------------ENDLESSBATTLE������ץȤؤ�׷��-------------------
#
# ebs_sub3.cgi��<input type=button>�ʤɤΥ��ޥ�ɥܥ��󤬤��볡����
# ���¤��Ф�׷�Ӥ��Ƥ���������
#
# <td><input type=button value="�����������" $STYLE_B1 onClick="parent.Sub.location.replace('./���Υ�����ץȤ���ǰ')"></td>
#
# ���Υ�����ץȤ���ǰ�����餫��Ƥ��벿�֤򤳤Υ�����ץȤ���ǰ�˱䤨�Ƥ���������
#
##################################################################
#�����趨
#

$SCRIPTNM="buy.cgi";			#���Υ�����ץ���
$AUCTIONDIR="buy";			#�����������Ʒ���ɥǥ��쥯�ȥꡪ
$rireki="$AUCTIONDIR/rireki.dat";	#�������������������Ǥ����������Ӥ�.cgi��ʹ��ʤ����¤�������
require 'ebs_sub1.cgi';			#ebs_sub1.cgi�Υ�����ץ���
require "./$LOG_FOLDER/$HASH_DATA";	#�����Υꥹ�ȣ������Ҫ��
$TABLE_STYLE = "bordercolor=#404040 border=1 cellspacing=0 style=\"font-size:10pt\"";#<TABLE>�Υ�������Ǥ���
@stime = ("3","6","12","24","48");	#ُ�I����
@nyuusatu = ("500","1000","2000","5000","10000","20000","50000","100000","200000","500000","1000000","2000000","5000000");#);#);#);#);#);#);#��������
$max_num = "20";			#��󥪡��������Ʒ�������������ؤ��ʤ�ޤ���)
$rmax = "20";				#���������ʷ��
$rekisika = "1";			#�������������ۤ���ʷ�˱�ʾ����ʤ�1�����ʤ��ʤ�0���ǤǼ���
$nmax = "20000000";			#�����ڽ��

#�趨�����ޤ�
##################################################################
#���������¤β��֤�perl��ʹ�ä����ץ����Ǥ�����������뷶Χ�Ǳ�����Ƥ���������

if($SUB){&ERROR('ֱ��󥯤Ͻ�ֹ�Ǥ�','���ڤ���Υ���������Ը�����ޤ���') if $ENV{'HTTP_REFERER'} !~ m/^$THIS_DIR/ && $DIRECT_LINK && $SUB ne 'MY_LIST' && $SUB ne 'C_LIST';}

@pair = split(/\;/, $ENV{'HTTP_COOKIE'});
foreach (@pair) {my($key, $value) = split(/=/, $_);
$DUMMY{$key} = $value;}
@pairs = split(/\,/, $DUMMY{'EB'});
foreach (@pairs) {my($key, $value) = split(/\:/, $_);
$cookies{"$key"} = $value;}

if($cookies{'pname'} eq ""){&ERROR('�Ƿ����롣');}

!$SUB && ($SUB='MAINTE');
&$SUB;

sub SETUMEI {
&HEADER;
print<<"HTML";
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR1>
<table style="font-size:10pt">
<tr><td align=left valign=top bgcolor=$TABLE_COLOR2 colspan=2>���г����h��</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>���п������u�Լ������������r��ߵ��ˣ������I����</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>�����������᳡�ؤ��������ޥ���ڤˤ��롢�����������ܥ����Ѻ�����Ф��ޤ���</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>һ�ȳ��ۤ����һ�ȤǤ����������ä����ϡ����ۤ�ȡ�������ϳ����ޤ���</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>���ۤϡ�һ�Ȥ�һ��һƷ�ΤߤȤʤäƤ���ޤ���</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>�����ϳ����������˭�Ǥ��Ф����Ȥ������ޤ���</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>����ʱ�˳֤������ʤ�ʱ���������뤳�Ȥ������ޤ���</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>�����ߤϤ��ĤǤ��������뤳�Ȥ������ޤ���</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>��Υ�����������Ƥ��ޤä����Ϥ�ȡ���������Ȥ������ޤ���</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>����ʱ�����������ߤγ֤äƤ���������\��\���������ɤ������ޤäƤ��볡�ϡ��������뤳�Ȥ������ޤ���</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>��������������뤫���ʤ��Τǡ�������\��\��դ��Ƥ�����������˼���ޤ���)</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>����ʱ�����������ߤγ֤��������۸�����ʤ����ϡ��ޥ��ʥ����Ȥʤ�ޤ���</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>һ�ˤ������ߤ����ʤ��ä����Ϥ���������ȡ����ۤ��������ϳ����ߤ�Ԫ����äƤ��ޤ���</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>��������ȡ���������ʷ���鱨�����椵��ޤ���</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR1 colspan=2>�����ޤǤ�Ԥ�����֤����ΤʤΤǡ������ߺϤ��Ȥˤʤ�ʤ��褦���������������֤��ߤޤ��礦??</td></tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR2 colspan=2>������������棨��ࣩ�μ���<br></td></tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>��������</td>
<td align=left>�Է֤��֤äƤ�����\��\��װ\��\����\ʾ����ޤ������ۤ��뤳�Ȥ������ޤ���</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>�趨ʱ��</td>
<td align=left>�������������Ф����ʱ��Ǥ�������ʱ��򳬤�����������뤳�Ȥ������ʤ��ʤ�ޤ���</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>���ڽ��</td>
<td align=left>���ۤ�����������ͽ��Ǥ����������֤�����μ��㤬ʼ�ޤ�ޤ���</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>���ۥܥ���</td>
<td align=left>�ϼ��趨���դ��Ƥ��Υܥ����Ѻ���ȡ���������������������ۤǤ��ޤ���</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>��������ʷ</td>
<td align=left>��ȥ�����ؤ�����״������뤳�Ȥ������ޤ���</td>
</tr>
<tr><td align=left valign=top bgcolor=$TABLE_COLOR2 colspan=2>������������棨�Ҳࣩ�μ���<br></td></tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>������</td>
<td align=left>��������������������ۤ����ˤ���ǰ�Ǥ���</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>������������Lv��</td>
<td align=left>���ۤ���Ƥ��������Ȥ��������Σ̣��Ǥ���</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>���ڽ��</td>
<td align=left>���ۤ���Ƥ��������������ֵ�ΤǤ���</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>���ڤν��</td>
<td align=left>�����������줿��߶�Ǥ���</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>���������趨</td>
<td align=left>���ڤν����ϳˤ���������趨���ޤ���</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>�趨ʱ��</td>
<td align=left>����ʱ��ޤ��������ʤ��ä����������������ʤ��ʤꡢ�����ܥ�������������ܥ���ˤʤ�ޤ���</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>����������</td>
<td align=left>��������������ˤ���ǰ�Ǥ������������Ȥ����˱�\ʾ����Ƥ����ˤ��������뤹�뤳�Ȥˤʤ�ޤ���</td>
</tr>
<tr>
<td align=left valign=top bgcolor=$TABLE_COLOR2>�����ܥ���</td>
<td align=left>
�����ܥ���������ܥ��󤬱�\ʾ����ޤ��������ܥ���Ϥ������������������������������趨����Ѻ���������������ޤ���<br>
���ۤ����ˤˤϡ�������������ܥ��󤬱�\ʾ����ޤ���<br>
�趨ʱ��򳬤���ȡ�ȫ�Ƥ��ˤΥܥ����ʾ���Զ��Ĥ������ܥ�����Ф�����ޤ���<br>
�����ܥ����Ѻ���ȡ��������뤳�Ȥ������ޤ���<br>
���ڽ��ֻ���ð�ǔ���ݔ�롣
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
<td bgcolor=$TABLE_COLOR2 colspan=7>����ُ�I�vʷ</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR2 align=center>������ʱ</td>
<td bgcolor=$TABLE_COLOR2 align=center>������</td>
<td bgcolor=$TABLE_COLOR2 align=center>��������</td>
<td bgcolor=$TABLE_COLOR2 align=center>������</td>
<td bgcolor=$TABLE_COLOR2 align=center>������</td>
<td bgcolor=$TABLE_COLOR2 align=center>���ڽ��</td>
<td bgcolor=$TABLE_COLOR2 align=center>��������</td>
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
$kitei = "$mon��$mday��&nbsp$ghourʱ$gmin��";
}

if($nobuied){print "<tr><td bgcolor=$TABLE_COLOR1 align=center>------</td><td bgcolor=$TABLE_COLOR1>$name����</td><td bgcolor=$TABLE_COLOR1>$buki</td><td bgcolor=$TABLE_COLOR1 colspan=4>�����ߤϤ��ޤ���Ǥ�����</td></tr>\n";}
else{
print<<"TABLE";
<tr>
<td bgcolor=$TABLE_COLOR1>$kitei</td>
<td bgcolor=$TABLE_COLOR1>$name����</td>
<td bgcolor=$TABLE_COLOR1>$buki</td>
<td bgcolor=$TABLE_COLOR1>$nname����</td>
<td bgcolor=$TABLE_COLOR1 align=right>$nowmoney��</td>
<td bgcolor=$TABLE_COLOR1 align=right>$money��</td>
<td bgcolor=$TABLE_COLOR1 align=right>$num��</td>
</tr>
TABLE
}

}
print "</table>";
&foot;
exit;
}

sub INBUKI {

&ERROR('���å��������Ĥ���ޤ���') if $cookies{'pname'} eq '';
&ERROR('���ڽ��]���O����') if $FORM{'money'} eq '';
if($FORM{'money'} =~ m/\D/g){&ERROR('���ڽ��~ֻ���ð�ǔ���ݔ��');}
if(($FORM{'money'} % 1) != 0){&ERROR('ֻ��������');}
if($FORM{'money'} >= $nmax){&ERROR("��߳��ڽ��$nmax�ǳ���������");}

&DBM_INPORT(P);
&LOCK;
opendir(MEMBER_DIR, "$AUCTIONDIR");
@kkk = sort(grep { m/.*\.cgi/ } readdir(MEMBER_DIR));
closedir(MEMBER_DIR);

$filenum = @kkk;

if($filenum >= $max_num){&UNLOCK;&ERROR('��������($max_num�ˤʤäƤ��ƽ�ϳ��ۤǤ��ޤ���');}
$amax = 0;
	foreach(@kkk){
	chomp $_;
$file = $_;
	($id,$kaku) = split(/\./);
	push(@option,"$id");#�ե����뷬��
	if($amax <= $id){$amax = $id;}#�¹�����÷���

open(OPENS,"$AUCTIONDIR/$file");
@mitukeru = <OPENS>;
close(OPENS);
($named,$dmy) = split(/<>/,$mitukeru[0]);
if($named eq $cookies{'pname'}){&UNLOCK;&ERROR('���ۤ�һ��һƷ�ޤǤǤ���');}
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


if($FORM{'buki'} == 1){if($VALS[10] eq ""){&UNLOCK;&ERROR('��������������������ޤ���');}$dbuki = $VALS[10];$VALS[10] = "";$syuppin = "$WN_sB[0]";}
if($FORM{'buki'} == 2){if($VALS[11] eq ""){&UNLOCK;&ERROR('��������������������ޤ���');}$dbuki = $VALS[11];$VALS[11] = "";$syuppin = "$WN_sC[0]";}
if($FORM{'buki'} == 3){if($VALS[35] eq ""){&UNLOCK;&ERROR('��������������������ޤ���');}$dbuki = $VALS[35];$VALS[35] = "";$syuppin = "$WN_sD[0]";}
if($FORM{'buki'} == 4){if($VALS[36] eq ""){&UNLOCK;&ERROR('��������������������ޤ���');}$dbuki = $VALS[36];$VALS[36] = "";$syuppin = "$WN_sE[0]";}

$aatime = $stime["$FORM{'autime'}"];
$ktime = 3600 * $aatime;
$owari = time + $ktime;
($sec, $min, $hour, $mday, $mon, $year) = localtime($owari);
$ghour = sprintf("%02d",$hour);
$gmin = sprintf("%02d",$min);
$mon++;
$kitei = "$mon��$mday��&nbsp$ghourʱ$gmin��ֹͣ";

	dbmopen (%P,"$DBM_P",0666);
		$P{"$cookies{'pname'}"}="@VALS";
	dbmclose %P;

if($rekisika == 1){
		dbmopen (%DH,"$DBM_H",0666);
			$DH{"$DATE"}="$cookies{'pname'}������$syuppin�����С�$kitei���ۡ�";
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
<td bgcolor=$TABLE_COLOR2 colspan=2>���¤Τ褦�˳��ۤ��ޤ�����</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR2>��������</td>
<td bgcolor=$TABLE_COLOR1 align=right>$syuppin</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2>�趨ʱ��</td>
<td bgcolor=$TABLE_COLOR1 align=right>$kitei</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2>���ڽ��</td>
<td bgcolor=$TABLE_COLOR1 align=right>$FORM{'money'}&nbsp;G</td>
</tr>
</table>
</body>
</html>
HTML
exit;
}

sub MAINTE {

&ERROR('���å��������Ĥ���ޤ���') if $cookies{'pname'} eq '';
&DBM_INPORT(P);
$selecttime = "<select name=autime $STYLE_B1><option value=0>$stime[0]ʱ��<option value=1>$stime[1]ʱ��<option value=2>$stime[2]ʱ��<option value=3>$stime[3]ʱ��<option value=4>$stime[4]ʱ��</select>";

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
<td bgcolor=$TABLE_COLOR2 colspan=2>������������</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR2>��������</td>
<td bgcolor=$TABLE_COLOR1>
<select name=buki $STYLE_B1>$option10$option11$option35$option36</select>
</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2>�趨ʱ��</td>
<td bgcolor=$TABLE_COLOR1>$selecttime</td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2>���ڽ��</td>
<td bgcolor=$TABLE_COLOR1><input type=text size=20 name=money $STYLE_B1></td>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR1 colspan=2 align=right>
���~ֻ���ð�ǔ���ݔ��
<input type=submit value=���� $STYLE_B1>
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
<td bgcolor=$TABLE_COLOR2 colspan=2>������������</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR1 colspan=2>
�F�ڛ]���κ�\�����b����ۡ�
</td>
</tr>
HTML
}

print<<"HTML";
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=2>���н��ךvʷ</td>
</tr>
<tr>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=cmd value=REKISI>
<td bgcolor=$TABLE_COLOR1 colspan=2 align=right><input type=submit value=��ʷ $STYLE_B1></td>
</form>
</tr>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=2>�����h����</td>
</tr>
<tr>
<form action=$SCRIPTNM method=POST>
<input type=hidden name=cmd value=SETUMEI>
<td bgcolor=$TABLE_COLOR1 colspan=2 align=right><input type=submit value=˵���� $STYLE_B1></td>
</form>
</tr>
</table>
</td>
<td valign=top>
<table $TABLE_STYLE>
<tr>
<td bgcolor=$TABLE_COLOR2 colspan=9>������������һ��</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR2 align=center>������</td>
<td bgcolor=$TABLE_COLOR2 align=center>������(����Lv)</td>
<td bgcolor=$TABLE_COLOR2 align=center>��ͽ��~</td>
<td bgcolor=$TABLE_COLOR2 align=center>�F�ڵĽ��~</td>
<td bgcolor=$TABLE_COLOR2 align=center>�E�߃r�X�O��</td>
<td bgcolor=$TABLE_COLOR2 align=center>�Y��ʱ��</td>
<td bgcolor=$TABLE_COLOR2 align=center>�r�X�����</td>
<td bgcolor=$TABLE_COLOR2 align=center>�������o</td>
<td bgcolor=$TABLE_COLOR2 align=center>ُ�I��</td>
</form>
</tr>
HTML

$onum = @nyuusatu;
$numm = 0;
while($onum >= $numm){
push(@options,"<option value=$nyuusatu[$numm]>+$nyuusatu[$numm]��");
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
if($nname eq ""){$nname = "�]��ُ�I��";}
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
$kitei = "$mon��$mday��&nbsp$ghourʱ$gmin��ֹͣ";

if($owari <= time || $rakusatumode == 1){$cmd = "<input type=hidden name=cmd value=RAKUSATU><input type=hidden name=pname value=$name><input type=hidden name=rname value=$kname>";$input = "<input type=submit value=�_�� $STYLE_B1>";}
else{$cmd = "<input type=hidden name=cmd value=NYUSATU>";$input = "<input type=submit value=�E�r $STYLE_B1>";}

print<<"TABLE";

<tr>
<form action=$SCRIPTNM method=POST>
$cmd
<input type=hidden name=bukifile value=$_>
<td bgcolor=$TABLE_COLOR2>$name����</td>
<td bgcolor=$TABLE_COLOR1>$WN_sA[0](Lv.$WLV_A)</td>
<td bgcolor=$TABLE_COLOR1 align=right>$money��</td>
<td bgcolor=$TABLE_COLOR1 align=right>$nowmoney��</td>
<td bgcolor=$TABLE_COLOR1><select name=gaku $STYLE_B1>@options</select></td>
<td bgcolor=$TABLE_COLOR1 align=right>$kitei</td>
<td bgcolor=$TABLE_COLOR1 align=center>$nname</td>
<td bgcolor=$TABLE_COLOR1>$input</td>
<td bgcolor=$TABLE_COLOR1 align=right>$l��</td>
</form>
</tr>
TABLE
$nname = "";
$gyou++;
}
if($gyou == 0){print "<tr><td bgcolor=$TABLE_COLOR1 colspan=9>���ڳ��ۤϤ���ޤ���</td></tr>";}


print<<"END";
</table>
</td></tr></table>
END
&foot;
exit;
}



sub NYUSATU {
if($cookies{'pname'} eq ""){&ERROR('���å������顪�Ǥ���');}

&DBM_INPORT(P);

dbmopen (%P,"$DBM_P",0666);
@VALS = split(/\s/,$P{"$cookies{'pname'}"});
dbmclose %P;


if(!open(OPENA,"$AUCTIONDIR/$FORM{'bukifile'}")){&ERROR('�ե����륨�顪�Ǥ���');}
@dada = <OPENA>;
close(OPENA);

$l = 0;
$lognum = @dada;
if($lognum >= 2){$l = $lognum - 1;}
($name,$buki,$owari,$money) = split(/<>/,$dada[0]);
if($l >= 1){($nname,$nowmoney) = split(/<>/,$dada[$l]);}
else{$nowmoney = $money;}
if($owari < time){&ERROR('��������ʱ��򳬤��Ƥޤ���');}
if($nname eq $cookies{'pname'}){&ERROR('�����Ǥ������ϳ����ޤ���');}
$ngaku = $nowmoney + $FORM{'gaku'};
if($VALS[8] <= $ngaku){&ERROR('�������ޤ���');}
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
<td bgcolor=$TABLE_COLOR2 colspan=2>$name������������ؤ�����</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR2>$ngaku�Ǥ��������ޤ�����</td>
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

if(!open(OPENA,"$AUCTIONDIR/$FORM{'bukifile'}")){&UNLOCK;&ERROR("���Ǥ������äߤǤ���");}
@dada = <OPENA>;
close(OPENA);

if($VALS[10] ne "" && $VALS[11] ne "" && $VALS[35] ne "" && $VALS[35] ne ""){&UNLOCK;&ERROR("$FORM{'rname'}�������\��\�˿դ����ޤ��Τ����������ޤ���");exit;}

elsif($VALS[10] eq ""){$yobi = 10;}
elsif($VALS[11] eq ""){$yobi = 11;}
elsif($VALS[35] eq ""){$yobi = 35;}
elsif($VALS[36] eq ""){$yobi = 36;}
else{&UNLOCK;&ERROR('���������ģ¥����ץ󥨥顪');}

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
<td bgcolor=$TABLE_COLOR2 colspan=2>����ُ�I���</td></tr>
<tr>
<td bgcolor=$TABLE_COLOR2>��������</td>
<td bgcolor=$TABLE_COLOR1>$WN_sA[0](Lv.$WLV_A)</td>
</tr>

<tr>
<td bgcolor=$TABLE_COLOR2>������</td>
<td bgcolor=$TABLE_COLOR1>$name����</td>
</tr>

<tr>
<td bgcolor=$TABLE_COLOR2>������</td>
<td bgcolor=$TABLE_COLOR1>$nname����</td>
</tr>

<tr>
<td bgcolor=$TABLE_COLOR2>�������</td>
<td bgcolor=$TABLE_COLOR1>$nowmoney��</td>
</tr>

<tr>
<td bgcolor=$TABLE_COLOR2>��������</td>
<td bgcolor=$TABLE_COLOR1>$l��</td>
</tr>
</table>
HTML
&foot;
}



sub foot{
print "<br><br><br><input type=button value=\"����\" $STYLE_B1 onClick=\"parent.Sub.location.replace('./$SCRIPTNM')\"><br><br><br>\n
<div align=center><font size=2>PROGRAMING:(C) 2002 - <a href=http://melcha.zone.ne.jp/ target=_blank><font size=2>44NET FACTORY</font></a> - All Right Reserved.</font></div><p>";
&FOOTER;
print<<"FOOT";
</body>
</html>
FOOT
exit;
}



