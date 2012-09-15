#!/usr/bin/perl
# ver1.01设定
$SCRIPTNM="kunijyouhou.cgi";
#
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
require 'ebs_sub1.cgi';

&ERROR('请不要直接从此地址进入','安全起见请从您访问的网页进入') if $ENV{'HTTP_REFERER'} !~ m/^$THIS_DIR/ && $DIRECT_LINK && $SUB ne 'MY_LIST' && $SUB ne 'C_LIST';

!$SUB && ($SUB='KUNI');
&$SUB;

sub KUNI{
	&HEADER;
	&DBM_INPORT(P);&DBM_INPORT(C);
	print << "	-----END-----";
	<form action=$SCRIPTNM method=POST onSubmit="">
	<TABLE align="left"><TBODY>
	<input type=hidden name="cmd" value="CON_LIST">
	<TD bgcolor="#616161"><b style=\"font-size:13px;\">观看各国情报？</b></TD>
	-----END-----
	while (($C_Name,$C_Value) =each %C) {
		@C_VALUE = split(/\s/,$C_Value);
			print "<tr><td><input type=submit name=CNTRY value=\"$C_Name\"";
			print " STYLE=\" background:$C_VALUE[0];color:black\"><br>\n";
	}
		print "<input type=submit name=CNTRY value=\"$NONE_NATIONALITY\"";
		print " STYLE=\" background:#808080;color:white\"></td></tr></form>\n";
print << "	-----END-----";
<tr><TD>
<form action=$MAIN_SCRIPT method=POST>
<input type=submit value=返回 class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
</form>
</TD></tr>
</TBODY></TABLE>
	-----END-----
}
sub CON_LIST{
	&DBM_INPORT(P);&DBM_INPORT(C);
	@pair = split(/\;/, $ENV{'HTTP_COOKIE'});
		foreach (@pair) {my($key, $value) = split(/=/, $_);$DUMMY{$key} = $value;}
	@pairs = split(/\,/, $DUMMY{'EB'});
		foreach (@pairs) {my($key, $value) = split(/\:/, $_);$COOKIE{"$key"} = $value;}

	$CO_NAME=$FORM{'CNTRY'};
	($FORM{'CNTRY'}='',$CL_VALUES[0]='#000000') if $FORM{'CNTRY'} eq "$NONE_NATIONALITY";
	&HEADER;
	&LOCK;&DBM_INPORT(P);&DBM_INPORT(C);&UNLOCK;
	@PL_VALUES = split(/\s/,$P{"$COOKIE{'pname'}"});
	@CL_VALUES = split(/\s/,$C{"$FORM{'CNTRY'}"});
	require "$LOG_FOLDER/_hash.data"if $FORM{'CNTRY'} eq "$PL_VALUES[5]";

	sub TR {"<tr><td nowrap style=\"color:$VALUES[13];\">$Key</td><TD>$VALUES[3]</TD><td>".&RANK($VALUES[0],$VALUES[5],$VALUES[6])."</td><td align=center>".&STATUS_CONVERT("$VALUES[19]",'s')."</td><td align=center>".&STATUS_CONVERT("$VALUES[20]",'s')."</td><td align=center>".&STATUS_CONVERT("$VALUES[21]",'s')."</td><td align=center>".&STATUS_CONVERT("$VALUES[22]",'s')."</td><td align=center>".&STATUS_CONVERT("$VALUES[24]",'j')."</td><td align=right nowrap $STYL2><b>$VALUES[29]</b></td></tr>"}
	sub SO {"<TABLE border=5 cellspacing=0 style=\"font-size:15px;background:#000000;border:5px outset $CL_VALUES[0];\"><TBODY><TR><TD>".&RANK($VALUES[0],$VALUES[5],$VALUES[6])."</TD><TD>$Key</TD></TR><TR><TD colspan=2><img src=$IMG_FOLDER2/$VALUES[27].gif width=64 height=64></TD></TR><TR><TD>机  </TD><TD>$VALUES[3]</TD></TR><TR><TD>??</TD><td align=center><b>$VALUES[29]</b></TD></TR><TR><TD>??</TD><TD align=center>".&STATUS_CONVERT("$VALUES[19]",'s')."</TD></TR><TR><TD>??</TD><TD align=center>".&STATUS_CONVERT("$VALUES[20]",'s')."</TD></TR><TR><TD>??</TD><TD align=center>".&STATUS_CONVERT("$VALUES[21]",'s')."</TD></TR><TR><TD>???</TD><TD align=center>".&STATUS_CONVERT("$VALUES[22]",'s')."</TD></TR><TR><TD>熟练度</TD><TD align=center>".&STATUS_CONVERT("$VALUES[24]",'j')."</TD></TR></TBODY></TABLE><br>各国介绍<br><FORM><TEXTAREA rows=10 cols=25 name=com4>$VALUES[100]</TEXTAREA></FORM>"}


	print << "	-----END-----";
	<form action=$SCRIPTNM method=POST onSubmit="">
	<TABLE align="left"><TBODY>
	<input type=hidden name="cmd" value="CON_LIST">
	<TD bgcolor="#616161"><b style=\"font-size:13px;\">观看各国情报？</b></TD>
	-----END-----
	while (($C_Name,$C_Value) =each %C) {
		@C_VALUE = split(/\s/,$C_Value);
			print "<tr><td><input type=submit name=CNTRY value=\"$C_Name\"";
			print " STYLE=\" background:$C_VALUE[0];color:black\"><br>\n";
	}
		print "<input type=submit name=CNTRY value=\"$NONE_NATIONALITY\"";
		print " STYLE=\" background:#808080;color:white\"></td></tr></form>\n";

print << "	-----END-----";
<tr><TD>
	<form action=$MAIN_SCRIPT method=POST>
	<input type=submit value=返回 class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
	</form>
</TD></tr>
</TBODY></TABLE>
	-----END-----

	print "<TABLE border=5 cellspacing=0 style=\"font-size:15px;background:#000000;border:5px outset $CL_VALUES[0];\"><TBODY>";
	print "<tr><td colspan=5 bgcolor=$CL_VALUES[0] style=\"color:#000000;font-size:35px;\">$CO_NAME";
	print "<span style=\"font-size:15px;\">&nbsp;&nbsp;&nbsp;国费&nbsp;<b>\$$CL_VALUES[1]</b></span></td></tr>";
	print "<TR><TD rowspan=2 valign=top align=center>";
foreach $Key (sort {$P{$b} <=> $P{$a}} keys %P){
@VALUES = split(/\s/,$P{$Key});
if ($FORM{'CNTRY'} eq "$VALUES[5]" && !$VALUES[28] && $VALUES[6] == 1){print &SO;}
$plys++;}
	print "</TD><TD><TABLE border=0><TBODY><TR>";
	print "<TD bgcolor=$CL_VALUES[0]>人口</TD>";
if(!$COUNTER){$COUNTER="0";}
if(!$NONCOUNTER){$NONCOUNTER="0";}
&DBM_INPORT(P);
while (my($key,$val) = each %P){
@VALS = split(/\s/,$val);$ET++;
if($VALS[5] eq "$CO_NAME"){$COUNTER++;}
if($VALS[5] eq ''){$NONCOUNTER++;}
}
if($CO_NAME eq "流浪者"){print "<TD>$NONCOUNTER人</TD>";}
else{print "<TD>$COUNTER人</TD>";}
	print "</TR></TBODY></TABLE></TD><TD><TABLE border=0><TBODY><TR>";
	print "<TD bgcolor=$CL_VALUES[0] align=left>军事力</TD>";
if(!$COUNTER){$COUNTER="0";}
if(!$NONCOUNTER){$NONCOUNTER="0";}
&DBM_INPORT(P);
while (my($key,$val) = each %P){
@VALS = split(/\s/,$val);$ET++;
if($VALS[5] eq "$CO_NAME"){$COUNTER+=($VALS[16]+$VALS[18]+$VALS[19]*100+$VALS[20]*100+$VALS[21]*100+$VALS[22]*100);}
if($VALS[5] eq ''){$NONCOUNTER+=($VALS[16]+$VALS[18]+$VALS[19]*100+$VALS[20]*100+$VALS[21]*100+$VALS[22]*100);}
}
if($CO_NAME eq "流浪者"){print "<TD>$NONCOUNTER 战斗力</TD>";}
else{print "<TD>$COUNTER 战斗力</TD>";}
	print "</TR></TBODY></TABLE></TD></TR>";
print "<TR><TD colspan=2>";
	print "<TABLE><TBODY><TR><td colspan=9 bgcolor=$CL_VALUES[0] style=\"color:#000000;font-size:25px;\">&nbsp;<b>人民</b>&nbsp;";
	print "<tr><td>Name</td><td>机  名</td><td>Rank</td><td>$STATUS_NAME[0]</td><td>$STATUS_NAME[1]</td><td>$STATUS_NAME[2]</td><td>$STATUS_NAME[3]</td><td>熟</td><td>LV</td></tr>";
	foreach $Key (sort {$P{$b} <=> $P{$a}} keys %P){
		@VALUES = split(/\s/,$P{$Key});
		if ($FORM{'CNTRY'} eq "$VALUES[5]" && !$VALUES[28] && $VALUES[6] == 0){print &TR;}
		if ($FORM{'CNTRY'} && $FORM{'CNTRY'} eq "$VALUES[5]" && $VALUES[28]){
			($UNIT_A.= &TR,$uflag_A=1) if $VALUES[28] eq $CL_VALUES[2] && $VALUES[6] != -1;
			($UNIT_B.= &TR,$uflag_B=1) if $VALUES[28] eq $CL_VALUES[3] && $VALUES[6] != -1;
			($UNIT_C.= &TR,$uflag_C=1) if $VALUES[28] eq $CL_VALUES[4] && $VALUES[6] != -1;
			($LEADER_A.= &TR,$lflag_A=1) if $VALUES[28] eq $CL_VALUES[2] && $VALUES[6] == -1;
			($LEADER_B.= &TR,$lflag_B=1) if $VALUES[28] eq $CL_VALUES[3] && $VALUES[6] == -1;
			($LEADER_C.= &TR,$lflag_C=1) if $VALUES[28] eq $CL_VALUES[4] && $VALUES[6] == -1;
		}
		$plys++;
	}
	if ($FORM{'CNTRY'} ){
	print "<tr><td colspan=9 bgcolor=$CL_VALUES[0] style=\"color:#000000;font-size:25px;\">&nbsp;<b>第一部队</b>&nbsp;";
	print $CL_VALUES[2] ? "$CL_VALUES[2]":!$CL_VALUES[2] ? '未结成':'</td></tr>';
	print $lflag_A ? "$LEADER_A":!$lflag_A ? "<tr><td colspan=9>队长不在</td></tr>":'\n';
	print $uflag_A ? "$UNIT_A":!$uflag_A ? "<tr><td colspan=9>NoPlayer</td></tr>":'';
	print "<tr><td colspan=9 bgcolor=$CL_VALUES[0] style=\"color:#000000;font-size:25px;\">&nbsp;<b>第二部队</b>&nbsp;";
	print $CL_VALUES[3] ? "$CL_VALUES[3]":!$CL_VALUES[3] ? '未结成':'</td></tr>';
	print $lflag_B ? "$LEADER_B":!$lflag_B ? "<tr><td colspan=9>队长不在</td></tr>":'\n';
	print $uflag_B ? "$UNIT_B":!$uflag_B ? "<tr><td colspan=9>NoPlayer</td></tr>":'';
	print "<tr><td colspan=9 bgcolor=$CL_VALUES[0] style=\"color:#000000;font-size:25px;\">&nbsp;<b>第叁部队</b>&nbsp;";
	print $CL_VALUES[4] ? "$CL_VALUES[4]":!$CL_VALUES[4] ? '未结成':'</td></tr>';
	print $lflag_C ? "$LEADER_C":!$lflag_C ? "<tr><td colspan=9>队长不在</td></tr>":'\n';
	print $uflag_C ? "$UNIT_C":!$uflag_C ? "<tr><td colspan=9>NoPlayer</td></tr>":'';
	
	print "</table><br><br><br><br>";
}
print "</TD></TR></TBODY></TABLE>";
&FOOTER;
	exit;
}
