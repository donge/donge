#!/usr/bin/perl

#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
#
#              The Endless Battle program Satellite
#       Copyright Net Game Communications All Rights reserved
#                          �趨
#
#
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
#
#              The Endless Battle sub program 
#       Copyright huiniao All Rights reserved
#                 �����ֿⲹ��������������
#
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
#ver.4
#�趨
$SCRIPTNM="cangku.cgi";     #�ļ��ֿⲹ���ļ���
$tate="30";                 #ͼ���
$yoko="30";                 #ͼ���
$CANGKUDATA="cangku";       #��������ֿ����ݵ�Ŀ¼
$timer="1";
#
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

require 'ebs_sub1.cgi';
require "./$LOG_FOLDER/$HASH_DATA";

!$SUB && ($SUB='MAINTE');
&$SUB;

sub MAINTE		{&MAINTENANCE;}
sub MASTER              {&MASTER2;&dell;}
sub HOKAN		{&HOKAN2;&MASTER2;}
sub DASU		{&DASU2;&MASTER2;}
sub IDOU		{&IDOU2;&MASTER2;}

sub MAINTENANCE{
		@pair = split(/;/, $ENV{'HTTP_COOKIE'});
		foreach (@pair) {my($key, $value) = split(/=/, $_);$DUMMY{$key} = $value;}
	@pairs = split(/,/, $DUMMY{EB});
		foreach (@pairs) {my($key, $value) = split(/:/, $_);$COOKIE{$key} = $value;}

	&HEADER;

	print << "	-----END-----";

	<table width=100% height=100%><tr><td align=center>
		<table border=1 cellpadding=2 cellspacing=0 bgcolor="#222222" align=center
		 style="font-size:10.5pt;">
		<form action=$SCRIPTNM method=POST><input type=hidden name="cmd" value="MASTER">
		<tr><td height=25pt>
		<b>�ֿ�ģʽ</b></td></tr><tr><td bgcolor="#909090">
		<table border=0 cellpadding=0 cellspacing=0 style="font-size:9pt;color:#000000">
                <tr><td><b style="color:#000000;">�û�����</b></td>
		<td><input type=hidden name="plname" value="$COOKIE{'pname'}">$COOKIE{'pname'}
		<tr><td ><b style="color:#000000;">�ܡ��룺</b></td>
		<td><input type=hidden name="pass" value="$COOKIE{'pass'}">$COOKIE{'pass'}
		<input type=submit value=��¼ $STYLE_B2 style="height:15pt;font-size:9pt">
		</td></tr></form></table></td></tr></table>
	<input type=button value="�ر�" onclick="window.close()" $STYLE_B2>
	</td></tr></table>
		
	-----END-----

}

sub MASTER2{
&ERROR('�û����������ܵ�¼') if $FORM{'plname'} eq '';
&ERROR('������������µ�¼') if $FORM{'pass'} eq '';
&DBM_INPORT(P);
&DBM_INPORT(C);

@VALS = split(/\s/,$P{"$FORM{'plname'}"});
&ERROR('������������µ�¼') if crypt ($FORM{'pass'},eb) ne "$VALS[2]";
&HEADER;
	&LOCK;
        open(IN,"$CANGKUDATA/$FORM{'plname'}.cgi");
        $cdat = <IN>;
        close(IN);
        ($cname,$weapon1,$weapon2,$weapon3,$weapon4,$weapon5) = split(/<>/,$cdat);
	&UNLOCK;
print << "-----END-----";
<table width=100% height=100%><tr><td align=center>
<table cellspacing=0 cellpadding=0 border=0 bgcolor="#FFFFFF">
<tr><td>
<table cellspacing=1 cellpadding=3 border=0 style="font-size:9pt;">
<tr><th bgcolor=#222222 style="font-size:10.5pt;" colspan=3>װ��������</th></tr>

-----END-----
print "<tr bgcolor=\"#000000\"><td>";
	local($WN_A,$WLV_A) = split(/!/,$VALS[9]);
	local($WN_B,$WLV_B) = split(/!/,$VALS[10]);
	local($WN_C,$WLV_C) = split(/!/,$VALS[11]);
	$WEP_A=$WLV_A%$WEAPON_LVUP;
	$WEP_B=$WLV_B%$WEAPON_LVUP;
	$WEP_C=$WLV_C%$WEAPON_LVUP;
	$WLV_A=int$WLV_A/$WEAPON_LVUP;
	$WLV_B=int$WLV_B/$WEAPON_LVUP;
	$WLV_C=int$WLV_C/$WEAPON_LVUP;
@WN_sA=split(/\,/,$WEAPON_LIST{"$WN_A"});
print"<span style=background-color:$TABLE_COLOR2><b>��װ����</b></span><b>".$WN_sA[0]."</b>&nbsp;Lv.$WLV_A/exp.$WEP_A</td><td>";
@WN_sB=split(/\,/,$WEAPON_LIST{"$WN_B"});
print'��Ԥ��1��<b>'.$WN_sB[0].'</b></td><td>';
@WN_sC=split(/\,/,$WEAPON_LIST{"$WN_C"});
print'��Ԥ��2��<b>'.$WN_sC[0]."</b></td></tr><tr bgcolor=\"#000000\" align=center>";

print"<td>��</td>";

   if($VALS[10] ne ''){
print << "-----END-----";
<form action=$SCRIPTNM method=POST>
<input type=hidden name="azuke2" value="$VALS[10]">
<input type=hidden name="cmd" value="HOKAN">
<input type=hidden name="plname" value="$FORM{'plname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<td>
<input type=submit value=���� $STYLE_B2 style="height:15pt;font-size:9pt">
</td></form>
-----END-----
}else{print"<td>��</td>";}

   if($VALS[11] ne ''){
print << "-----END-----";
<form action=$SCRIPTNM method=POST>
<input type=hidden name="azuke3" value="$VALS[11]">
<input type=hidden name="cmd" value="HOKAN">
<input type=hidden name="plname" value="$FORM{'plname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<td>
<input type=submit value=���� $STYLE_B2 style="height:15pt;font-size:9pt">
</td></form>
-----END-----
}else{print"<td>��</td>";}

print << "-----END-----";
</tr></table></td></tr></table>
<br>
<table cellspacing=0 cellpadding=0 border=0 bgcolor="gold">
<tr><td>
<table cellspacing=1 cellpadding=3 border=0 style="font-size:9pt;">
<tr><th bgcolor=#222222 style="font-size:10.5pt;" colspan=5>�֡�������</th></tr>
<tr bgcolor=#000000 align=center><td>��λ��</td><td>��λ��</td><td>��λ��</td><td>��λ��</td><td>��λ��</td></tr>
-----END-----
print "<tr bgcolor=#000000><td>";
	local($WN_A,$WLV_A) = split(/!/,$weapon1);	local($WN_B,$WLV_B) = split(/!/,$weapon2);
	local($WN_C,$WLV_C) = split(/!/,$weapon3);	local($WN_D,$WLV_D) = split(/!/,$weapon4);	local($WN_E,$WLV_E) = split(/!/,$weapon5);
	$WEP_A=$WLV_A%$WEAPON_LVUP;	$WEP_B=$WLV_B%$WEAPON_LVUP;	$WEP_C=$WLV_C%$WEAPON_LVUP;
	$WLV_A=int$WLV_A/$WEAPON_LVUP;$WLV_B=int$WLV_B/$WEAPON_LVUP;$WLV_C=int$WLV_C/$WEAPON_LVUP;
	$WEP_D=$WLV_D%$WEAPON_LVUP;	$WEP_E=$WLV_E%$WEAPON_LVUP;
	$WLV_D=int$WLV_D/$WEAPON_LVUP;$WLV_E=int$WLV_E/$WEAPON_LVUP;
@WN_sA=split(/\,/,$WEAPON_LIST{"$WN_A"});print"<b><font color=RED>".$WN_sA[0]."</font></b>&nbsp;Lv.$WLV_A/exp.$WEP_A</td><td>";
@WN_sB=split(/\,/,$WEAPON_LIST{"$WN_B"});print'<b><font color=RED>'.$WN_sB[0].'</font></b></td><td>';
@WN_sC=split(/\,/,$WEAPON_LIST{"$WN_C"});print'<b><font color=RED>'.$WN_sC[0]."</font></b></td><td>";
@WN_sD=split(/\,/,$WEAPON_LIST{"$WN_D"});print'<b><font color=RED>'.$WN_sD[0].'</font></b></td><td>';
@WN_sE=split(/\,/,$WEAPON_LIST{"$WN_E"});print'<b><font color=RED>'.$WN_sE[0]."</font></b></td></tr><tr bgcolor=#000000 align=center>";
print << "-----END-----";
<form action=$SCRIPTNM method=POST>
<input type=hidden name="houkou" value="LEFT">
<input type=hidden name="cmd" value="IDOU">
<input type=hidden name="plname" value="$FORM{'plname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<td>
<input type=submit value='<<' $STYLE_B1>
</td></form>
-----END-----

   if($VALS[10] eq '' and $weapon2 ne ''){
print << "-----END-----";
<form action=$SCRIPTNM method=POST>
<input type=hidden name="dasi2" value="$weapon2">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="plname" value="$FORM{'plname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<td>
<input type=submit value=���� $STYLE_B2 style="height:15pt;font-size:9pt">
</td></form>
-----END-----
}else{print"<td>��</td>";}

   if($VALS[11] eq '' and $weapon3 ne ''){
print << "-----END-----";
<form action=$SCRIPTNM method=POST>
<input type=hidden name="dasi3" value="$weapon3">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="plname" value="$FORM{'plname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<td>
<input type=submit value=���� $STYLE_B2 style="height:15pt;font-size:9pt">
</td></form>
-----END-----
}else{print"<td>��</td>";}

   if($weapon4 ne ''){
print << "-----END-----";
<form action=$SCRIPTNM method=POST>
<input type=hidden name="dasi4" value="$weapon4">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="plname" value="$FORM{'plname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<td>
<input type=submit value=���� $STYLE_B2 style="height:15pt;font-size:9pt">
</td></form>
-----END-----
}else{print"<td>��</td>";}

print << "-----END-----";
<form action=$SCRIPTNM method=POST>
<input type=hidden name="houkou" value="RIGHT">
<input type=hidden name="cmd" value="IDOU">
<input type=hidden name="plname" value="$FORM{'plname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<td>
<input type=submit value='>>' $STYLE_B1>
</td></form></tr></table></td></tr></table>

-----END-----

print "<BR><center><span style=\"font-size:9pt\">�����ֿ� �� <a href=\"http://www.huiniao.com/\"><font color=\"gold\">������Ѷ-��������Թ�����</font></a>����</span></center>";
&FOOTER;
print "</td></tr></table></body>";

}

sub HOKAN2{
if ( $PL_VALUES[26] >= time-$timer){&ERROR('�ٴ�ʹ��ʱ��δ��������̣�')}
&DBM_INPORT(P);
&DBM_INPORT(C);
@VALS = split(/\s/,$P{"$FORM{'plname'}"});
&LOCK;

        open(IN,"$CANGKUDATA/$FORM{'plname'}.cgi");
        $cdat = <IN>;
        close(IN);
        ($cname,$weapon1,$weapon2,$weapon3,$weapon4,$weapon5) = split(/<>/,$cdat);

	dbmopen (%P,"$DBM_P",0666);
		@VALS = split(/\s/,$P{"$FORM{'plname'}"});
		local($WN_B,$WLV_B,$WEX_B) = split(/!/,$FORM{'azuke2'});
	        @WN_sB=split(/\,/,$WEAPON_LIST{"$WN_B"});
	        local($WN_C,$WLV_C,$WEX_C) = split(/!/,$FORM{'azuke3'});
	        @WN_sC=split(/\,/,$WEAPON_LIST{"$WN_C"});

if($FORM{'azuke2'} ne '' and $VALS[10] eq $FORM{'azuke2'}){$VALS[10] ="$weapon2";$FORM{'azuke2'}="$WN_B!$WLV_B";$weapon2="$FORM{'azuke2'}";}
if($FORM{'azuke3'} ne '' and $VALS[11] eq $FORM{'azuke3'}){$VALS[11] ="$weapon3";$FORM{'azuke3'}="$WN_C!$WLV_C";$weapon3="$FORM{'azuke3'}";}
                $VALS[26] = $DATE ;
		$P{"$FORM{'plname'}"}="@VALS";
	dbmclose %P;

        $VALS="$FORM{'plname'}<>$weapon1<>$weapon2<>$weapon3<>$weapon4<>$weapon5<>";
        if(!open(OUT,">$CANGKUDATA/$FORM{'plname'}.cgi")){ &ERROR('�û�����Ŀ¼�򿪴���'); }
	print OUT $VALS;
	close(OUT);
        chmod(0666,"$CANGKUDATA/$FORM{'plname'}.cgi");

&UNLOCK;
}

sub DASU2{
if ( $PL_VALUES[26] >= time-$timer){&ERROR('�ٴ�ʹ��ʱ��δ��������̣�')}
&DBM_INPORT(P);
&DBM_INPORT(C);
@VALS = split(/\s/,$P{"$FORM{'plname'}"});
&LOCK;

        open(IN,"$CANGKUDATA/$FORM{'plname'}.cgi");
        $cdat = <IN>;
        close(IN);
        ($cname,$weapon1,$weapon2,$weapon3,$weapon4,$weapon5) = split(/<>/,$cdat);

	dbmopen (%P,"$DBM_P",0666);
		@VALS = split(/\s/,$P{"$FORM{'plname'}"});
	
if($FORM{'dasi2'} ne '' and $FORM{'dasi2'} eq $weapon2){$VALS[10] =$FORM{'dasi2'};$weapon2="";}
if($FORM{'dasi3'} ne '' and $FORM{'dasi3'} eq $weapon3){$VALS[11] =$FORM{'dasi3'};$weapon3="";}

if($FORM{'dasi4'} ne ''){$weapon4="";}
                $VALS[26] = $DATE ;
		$P{"$FORM{'plname'}"}="@VALS";
	dbmclose %P;

        $VALS="$FORM{'plname'}<>$weapon1<>$weapon2<>$weapon3<>$weapon4<>$weapon5<>";
        if(!open(OUT,">$CANGKUDATA/$FORM{'plname'}.cgi")){ &ERROR('�û�����Ŀ¼�򿪴���'); }
	print OUT $VALS;
	close(OUT);
        chmod(0666,"$CANGKUDATA/$FORM{'plname'}.cgi");
&UNLOCK;
}

sub IDOU2{
if ( $PL_VALUES[26] >= time-$timer){&ERROR('�ٴ�ʹ��ʱ��δ��������̣�')}
&DBM_INPORT(P);
&DBM_INPORT(C);
@VALS = split(/\s/,$P{"$FORM{'plname'}"});

&LOCK;

        open(IN,"$CANGKUDATA/$FORM{'plname'}.cgi");
        $cdat = <IN>;
        close(IN);
        ($cname,$weapon1,$weapon2,$weapon3,$weapon4,$weapon5) = split(/<>/,$cdat);

	dbmopen (%P,"$DBM_P",0666);
		@VALS = split(/\s/,$P{"$FORM{'plname'}"});
                $VALS[26] = $DATE ;
		$P{"$FORM{'plname'}"}="@VALS";
	dbmclose %P;
if($FORM{'houkou'} eq "LEFT"){
        $VALS="$FORM{'plname'}<>$weapon2<>$weapon3<>$weapon4<>$weapon5<>$weapon1<>";
}else{
        $VALS="$FORM{'plname'}<>$weapon5<>$weapon1<>$weapon2<>$weapon3<>$weapon4<>";
}
        if(!open(OUT,">$CANGKUDATA/$FORM{'plname'}.cgi")){ &ERROR('�û�����Ŀ¼�򿪴���'); }
	print OUT $VALS;
	close(OUT);
        chmod(0666,"$CANGKUDATA/$FORM{'plname'}.cgi");
&UNLOCK;
}

sub dell{
#��Ҫɾ��
&DBM_INPORT(P);
        while (my($key,$val) = each %P){
          @VALS = split(/\s/,$val);$ET++;
        $cangkulist.="$key.cgi";
	}
&LOCK;
    if(!opendir(DIR,"$CANGKUDATA")){ &ERROR('�ֿ�����Ŀ¼�򿪴���')}
    @usrfile = sort grep /\.cgi/,readdir(DIR);
    closedir(DIR);
    foreach $no (0 .. $#usrfile) {
       if ($cangkulist !~ m/$usrfile[$no]/){unlink("$CANGKUDATA/$usrfile[$no]")}
    }
&UNLOCK;
}

