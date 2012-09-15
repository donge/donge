#!/usr/bin/perl
#ver.4
#设定
$SCRIPTNM="souko.cgi";     #武器仓库名称
$tate="30";                #图标竖大小
$yoko="30";                #图标横大小
$SOUKODATA="souko";        #武器库数据文件夹（属性777）
$timer="1";
#
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

require 'ebs_sub1.cgi';
require "$LOG_FOLDER/$HASH_DATA";

&ERROR('请不要直接从此地址进入','安全起见请从您访问的网页进入') if $ENV{'HTTP_REFERER'} !~ m/^$THIS_DIR/ && $DIRECT_LINK && $SUB ne 'MY_LIST' && $SUB ne 'C_LIST';

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
		<table border=0 cellpadding=0 cellspacing=0 bgcolor="#909090" align=center
		 style="border:1px outset #909090;font-size:16px;">
		<form action=$SCRIPTNM method=POST><input type=hidden name="cmd" value="MASTER">
		<tr><td style="background-color:#404040;" colspan=2>
		&nbsp;souko Mode</td></tr>
                <tr><td align=center><b style="color:#000000;">ID</b></td>
		<td><input type=hidden name="plname" value="$COOKIE{'pname'}" style="height:21px; color:#ffffff; font-size:16px; background:#000000; border:1 inset #c0c0c0;">$COOKIE{'pname'}

		<tr><td align=center><b style="color:#000000;">PASS</b></td>
		<td><input type=hidden name="pass" value="$COOKIE{'pass'}" style="height:21px; color:#ffffff; font-size:16px; background:#000000; border:1 inset #c0c0c0;">$COOKIE{'pass'}
		<input type=submit value=Login class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
		</td></tr></form></table>
	</td></tr></table>
		
	-----END-----

}

sub MASTER2{
&ERROR('用户名输入错误！！') if $FORM{'plname'} eq '';
&ERROR('密码错误！！') if $FORM{'pass'} eq '';
&DBM_INPORT(P);



@VALS = split(/\s/,$P{"$FORM{'plname'}"});
&ERROR('                ！！') if crypt ($FORM{'pass'},eb) ne "$VALS[2]";
&HEADER;
	&LOCK;
        open(IN,"$SOUKODATA/$FORM{'plname'}.cgi");
        $cdat = <IN>;
        close(IN);
        ($cname,$weapon1,$weapon2,$weapon3,$weapon4,$weapon5) = split(/<>/,$cdat);
	&UNLOCK;
print << "-----END-----";
<table width=100% height=100%><tr><td align=center>
<table cellspacing=2 cellpadding=3 bgcolor="#909090" style="font-size:16px;" border=1>
<tr><td bgcolor=#404040 colspan=3><center><b>装备</b></center></td></tr>
<tr><td align=center>$FORM{'plname'}</td><td align=center>$VALS[3]</td><td align=center><img src=\"$IMG_FOLDER2/$VALS[27].gif\" width=$yoko height=$tate></td></tr>

-----END-----

print "<tr><td>";
	local($WN_A,$WLV_A) = split(/!/,$VALS[9]);	local($WN_B,$WLV_B) = split(/!/,$VALS[10]);
	local($WN_C,$WLV_C) = split(/!/,$VALS[11]);
	$WEP_A=$WLV_A%$WEAPON_LVUP;	$WEP_B=$WLV_B%$WEAPON_LVUP;	$WEP_C=$WLV_C%$WEAPON_LVUP;	


	$WLV_A=int$WLV_A/$WEAPON_LVUP;$WLV_B=int$WLV_B/$WEAPON_LVUP;$WLV_C=int$WLV_C/$WEAPON_LVUP;
@WN_sA=split(/\,/,$WEAPON_LIST{"$WN_A"});print"<span style=\"$STYL1\">&nbsp;&nbsp;<b>【装备】</b>&nbsp;&nbsp;</span><b><font color=BLUE>".$WN_sA[0]."</font></b>&nbsp;Lv.$WLV_A/exp.$WEP_A</td><td>";
@WN_sB=split(/\,/,$WEAPON_LIST{"$WN_B"});print'&nbsp;&nbsp;【预备１】&nbsp;&nbsp;<b><font color=BLUE>'.$WN_sB[0].'</font></b></td><td>';
@WN_sC=split(/\,/,$WEAPON_LIST{"$WN_C"});print'&nbsp;&nbsp;【预备１】&nbsp;&nbsp;<b><font color=BLUE>'.$WN_sC[0]."</font></b></td></tr><tr>";

print"<td align=center>　</td>";

   if($VALS[10] ne ''){
print << "-----END-----";
<td align=center>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="azuke2" value="$VALS[10]">
<input type=hidden name="cmd" value="HOKAN">
<input type=hidden name="plname" value="$FORM{'plname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<input type=submit value=交换 class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\"></form>
</td>
-----END-----
}else{print"<td align=center>　</td>";}

   if($VALS[11] ne ''){
print << "-----END-----";
<td align=center>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="azuke3" value="$VALS[11]">
<input type=hidden name="cmd" value="HOKAN">
<input type=hidden name="plname" value="$FORM{'plname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<input type=submit value=交换 class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\"></form>
</td>
-----END-----
}else{print"<td align=center>　</td>";}

print << "-----END-----";
</tr></table>
<BR><br>
<table cellspacing=2 cellpadding=3 bgcolor="olive" style="font-size:16px;" border=1>
<tr><td bgcolor=#404040 colspan=5><center><b>装备</b></center></td></tr>
<tr><td align=center>０</td><td align=center>１</td><td align=center>２</td><td align=center>３</td><td align=center>４</td></tr>
-----END-----
print "<tr><td>";
	local($WN_A,$WLV_A) = split(/!/,$weapon1);	local($WN_B,$WLV_B) = split(/!/,$weapon2);
	local($WN_C,$WLV_C) = split(/!/,$weapon3);	local($WN_D,$WLV_D) = split(/!/,$weapon4);	local($WN_E,$WLV_E) = split(/!/,$weapon5);
	$WEP_A=$WLV_A%$WEAPON_LVUP;	$WEP_B=$WLV_B%$WEAPON_LVUP;	$WEP_C=$WLV_C%$WEAPON_LVUP;
	$WLV_A=int$WLV_A/$WEAPON_LVUP;$WLV_B=int$WLV_B/$WEAPON_LVUP;$WLV_C=int$WLV_C/$WEAPON_LVUP;
	$WEP_D=$WLV_D%$WEAPON_LVUP;	$WEP_E=$WLV_E%$WEAPON_LVUP;
	$WLV_D=int$WLV_D/$WEAPON_LVUP;$WLV_E=int$WLV_E/$WEAPON_LVUP;
@WN_sA=split(/\,/,$WEAPON_LIST{"$WN_A"});print"<span style=\"$STYL1\">&nbsp;&nbsp;<b></b>&nbsp;&nbsp;</span><b><font color=RED>".$WN_sA[0]."</font></b>&nbsp;Lv.$WLV_A/exp.$WEP_A</td><td>";
@WN_sB=split(/\,/,$WEAPON_LIST{"$WN_B"});print'&nbsp;&nbsp;&nbsp;&nbsp;<b><font color=RED>'.$WN_sB[0].'</font></b></td><td>';
@WN_sC=split(/\,/,$WEAPON_LIST{"$WN_C"});print'&nbsp;&nbsp;&nbsp;&nbsp;<b><font color=RED>'.$WN_sC[0]."</font></b></td><td>";
@WN_sD=split(/\,/,$WEAPON_LIST{"$WN_D"});print'&nbsp;&nbsp;&nbsp;&nbsp;<b><font color=RED>'.$WN_sD[0].'</font></b></td><td>';
@WN_sE=split(/\,/,$WEAPON_LIST{"$WN_E"});print'&nbsp;&nbsp;&nbsp;&nbsp;<b><font color=RED>'.$WN_sE[0]."</font></b></td></tr><tr>";
print << "-----END-----";
<td align=center>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="houkou" value="LEFT">
<input type=hidden name="cmd" value="IDOU">
<input type=hidden name="plname" value="$FORM{'plname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<input type=submit value='<<' $STYLE_B1></form>
</td>
-----END-----

   if($VALS[10] eq '' and $weapon2 ne ''){
print << "-----END-----";
<td align=center>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="dasi2" value="$weapon2">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="plname" value="$FORM{'plname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<input type=submit value=装备 class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\"></form>
</td>
-----END-----
}else{print"<td align=center>　</td>";}

   if($VALS[11] eq '' and $weapon3 ne ''){
print << "-----END-----";
<td align=center>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="dasi3" value="$weapon3">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="plname" value="$FORM{'plname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<input type=submit value=装备 class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\"></form>
</td>
-----END-----
}else{print"<td align=center>　</td>";}

   if($weapon4 ne ''){
print << "-----END-----";
<td align=center>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="dasi4" value="$weapon4">
<input type=hidden name="cmd" value="DASU">
<input type=hidden name="plname" value="$FORM{'plname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<input type=submit value=废弃 class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\"></form>
</td>
-----END-----
}else{print"<td align=center>　</td>";}

print << "-----END-----";
<TD align=center>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="houkou" value="RIGHT">
<input type=hidden name="cmd" value="IDOU">
<input type=hidden name="plname" value="$FORM{'plname'}">
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
<input type=submit value='>>' $STYLE_B1></form>
</TD></tr></table><br><br>
-----END-----

&FOOTER;
print "</td></tr></table></body>";

}

sub HOKAN2{
if ( $PL_VALUES[26] >= time-$timer){&ERROR('不能连续的使用')}
&DBM_INPORT(P);
@VALS = split(/\s/,$P{"$FORM{'plname'}"});
&LOCK;

        open(IN,"$SOUKODATA/$FORM{'plname'}.cgi");
        $cdat = <IN>;
        close(IN);
        ($cname,$weapon1,$weapon2,$weapon3,$weapon4,$weapon5) = split(/<>/,$cdat);

	dbmopen (%P,"$DBM_P",0666);
		@VALS = split(/\s/,$P{"$FORM{'plname'}"});

if($FORM{'azuke2'} ne '' and $VALS[10] eq $FORM{'azuke2'}){$VALS[10] ="$weapon2";$weapon2="$FORM{'azuke2'}";}
if($FORM{'azuke3'} ne '' and $VALS[11] eq $FORM{'azuke3'}){$VALS[11] ="$weapon3";$weapon3="$FORM{'azuke3'}";}
                $VALS[26] = $DATE ;
		$P{"$FORM{'plname'}"}="@VALS";
	dbmclose %P;

        $VALS="$FORM{'plname'}<>$weapon1<>$weapon2<>$weapon3<>$weapon4<>$weapon5<>";
        if(!open(OUT,">$SOUKODATA/$FORM{'plname'}.cgi")){ &ERROR('UserData Directry open error'); }
	print OUT $VALS;
	close(OUT);
        chmod(0666,"$SOUKODATA/$FORM{'plname'}.cgi");

&UNLOCK;
}

sub DASU2{
if ( $PL_VALUES[26] >= time-$timer){&ERROR('不能连续的使用')}
&LOCK;

        open(IN,"$SOUKODATA/$FORM{'plname'}.cgi");
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
        if(!open(OUT,">$SOUKODATA/$FORM{'plname'}.cgi")){ &ERROR('UserData Directry open error'); }
	print OUT $VALS;
	close(OUT);
        chmod(0666,"$SOUKODATA/$FORM{'plname'}.cgi");
&UNLOCK;
}

sub IDOU2{
if ( $PL_VALUES[26] >= time-$timer){&ERROR('不能连续的使用')}
&LOCK;

        open(IN,"$SOUKODATA/$FORM{'plname'}.cgi");
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
        if(!open(OUT,">$SOUKODATA/$FORM{'plname'}.cgi")){ &ERROR('UserData Directry open error'); }
	print OUT $VALS;
	close(OUT);
        chmod(0666,"$SOUKODATA/$FORM{'plname'}.cgi");
&UNLOCK;
}

sub dell{
#删除不用数据
&DBM_INPORT(P);
        while (my($key,$val) = each %P){
          @VALS = split(/\s/,$val);$ET++;
        $soukolist.="$key.cgi";
	}
&LOCK;
    if(!opendir(DIR,"$SOUKODATA")){ &ERROR('soukoData Directry open error')}
    @usrfile = sort grep /\.cgi/,readdir(DIR);
    closedir(DIR);
    foreach $no (0 .. $#usrfile) {
       if ($soukolist !~ m/$usrfile[$no]/){unlink("$SOUKODATA/$usrfile[$no]")}
    }
&UNLOCK;
}
