sub FRAME{
	print <<"	-----END-----";
Content-type: text/html

		<html><head>
		<title>$THIS_Title</title>
                </head>
		<frameset rows="*,$UPPER_FRAME" frameBorder="1" bordercolor="#002720" framespacing="10">
		<frame name="Main" scrolling=yes src="$MAIN_SCRIPT?LOGIN">
		<frame name="Sub" scrolling=yes src="$MAIN_SCRIPT?LOG0">
		</frameset>
		</html>
	-----END-----
}
sub STATUS{
	&DBM_CONVERT('P',"$FORM{pname}") if !$FORM{'Cmode'};
	&DBM_CONVERT('C',"$PL_VALUES[5]") if $PL_VALUES[5];
	&ERROR('NameError','用户名有问题，登录失败') if !@PL_VALUES;
	&ERROR('PwdError','密码有问题，登录失败') if crypt ($FORM{'pass'},eb) ne "$PL_VALUES[2]";
	&REPAIR(PL);
		if ($FORM{'login'}){
		if ($ENV{'REMOTE_HOST'}){$host="$ENV{'REMOTE_HOST'}";}else{$ipad=pack('C4',split(/\./,$ENV{'REMOTE_ADDR'}));
		$host = gethostbyaddr($ipad,2);}
		dbmopen (%L,"$DBM_L",0666);
			foreach (sort {$b <=> $a} keys %L){$lc++;delete $L{"$_"} if $lc > $LOGIN_H;}
			$L{"$DATE"}="$FORM{'pname'}!$ENV{'REMOTE_ADDR'}!$host";
		dbmclose %L;
	}
	SET_COOKIE:{
		my @gmt = gmtime(time + $COOKIE_KEEP*24*60*60);
		$gmt[0] = sprintf("%02d", $gmt[0]);	$gmt[1] = sprintf("%02d", $gmt[1]);
		$gmt[2] = sprintf("%02d", $gmt[2]);	$gmt[3] = sprintf("%02d", $gmt[3]);	$gmt[5] += 1900;
		$gmt[4] = ('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec')[$gmt[4]];
		$gmt[6] = ('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday')[$gmt[6]];
		my $date_gmt = "$gmt[6], $gmt[3]\-$gmt[4]\-$gmt[5] $gmt[2]:$gmt[1]:$gmt[0] GMT";
		my $cook = "pname:$FORM{'pname'},pass:$FORM{'pass'}";print "Set-Cookie: EB=$cook; expires=$date_gmt\n";
	}
	if ($PL_VALUES[28]){
		foreach ("$CL_VALUES[2]","$CL_VALUES[3]","$CL_VALUES[4]"){if ($PL_VALUES[28] eq "$_") {$DeleteFlag=1;}}
		if (!$DeleteFlag){$PL_VALUES[6]=$PL_VALUES[28]="";$flagd=1;}
	}
	if ($PL_VALUES[5] && !@CL_VALUES){$PL_VALUES[5]=$PL_VALUES[28]='';$PL_VALUES[6]=0;$flagd=1;}
	if (!$PL_VALUES[5] && $PL_VALUES[6]){$PL_VALUES[6]='0';$flagd=1;}
	$tmpdate=time;
	if ($PL_VALUES[34] eq ""){$PL_VALUES[34]="$tmpdate!0";$flagd=1;}
	if ($flagd){
		dbmopen (%PL,"$DBM_P",0666);
			$PL{"$FORM{'pname'}"}="@PL_VALUES";
		dbmclose %PL;
	}

	local($WN_A,$WLV_A,$WEX_A) = split(/!/,$PL_VALUES[9]); local($WN_B,$WLV_B,$WEX_B) = split(/!/,$PL_VALUES[10]);
	local($WN_C,$WLV_C,$WEX_C) = split(/!/,$PL_VALUES[11]);local($WN_D,$WLV_D,$WEX_D) = split(/!/,$PL_VALUES[35]);
	local($WN_E,$WLV_E,$WEX_E) = split(/!/,$PL_VALUES[36]);
	require "./$LOG_FOLDER/_bougu.data";
	local($BG_A,$BGT_A) = split(/!/,$PL_VALUES[41]);

	if   ($PL_VALUES[25] == 0){$CONDITIONAL = '<font color=#33CCFF>動</font>';}
	elsif($PL_VALUES[25] == 1){$CONDITIONAL = '<font color=red>修</font>';}

	$CL_VALUES[0]='#808080' if !$PL_VALUES[5];
	$pl_rank=int($PL_VALUES[0]/10)*$GET_RANK;
&HEADER;
$JIZHUISHU=$PL_VALUES[23] * 110 + $PL_VALUES[24];
sub BORDER {"border$_[0]:1px solid $_[1];";}
	$AT=int(($PL_VALUES[19]/50)*30);
	$DE=int(($PL_VALUES[20]/50)*30);
	$SP=int(($PL_VALUES[21]/50)*30);
	$MT=int(($PL_VALUES[22]/50)*30);
	$fil='style="position:relative;filter:alpha(opacity=70,finishopacitiy=70);"';
	$STYL2='style="border:1px solid #051485;"';
	$NEXT=($PL_VALUES[29]+1)*200;
print "<table border=0 cellpadding=0 cellspacing=0 style=\"border-collapse: collapse\" bordercolor=#111111 width=100% id=AutoNumber1><iframe name=music width=0 height=0 marginheight=0 marginwidth=0 frameborder=0 scrolling=NO></iframe><tr>";
print "<td width=33%>";

print "<center><DIV style=\"FILTER: dropshadow(offx=8,offy=8,color=#000000); POSITION: relative; HEIGHT: 110px\">";
print "<TABLE cellSpacing=0 cellPadding=0><TBODY><tr>";
print "<TD style=\"BORDER-RIGHT: #89a078 2px solid; BORDER-TOP: #89a078 2px solid; FONT-SIZE: 15px; BORDER-LEFT: #89a078 2px solid; COLOR: #efef80; BORDER-BOTTOM: medium none\" noWrap align=middle width=120 bgColor=#000000>$FORM{pname}</TD>";
print "<TD style=\"BORDER-RIGHT: #23a012 1px solid; BORDER-TOP: #23a012 1px solid; FONT-SIZE: 15px; BORDER-LEFT: medium none; BORDER-BOTTOM: #89a078 2px solid; BACKGROUND-COLOR: #000000\" width=70 align=middle>";
	print &RANK($PL_VALUES[0],$PL_VALUES[5],$PL_VALUES[6])."&nbsp;";
	$PL_VALUES[5]='流浪者' if !$PL_VALUES[5];
print "</TD></TR><tr>";
print "<TD style=\"BORDER-RIGHT: #89a078 2px solid; PADDING-RIGHT: 4px; BORDER-TOP: medium none; PADDING-LEFT: 4px; PADDING-BOTTOM: 4px; BORDER-LEFT: #89a078 2px solid; PADDING-TOP: 4px; BORDER-BOTTOM: #89a078 2px solid\" bgColor=#000000 colSpan=2>";
print "<TABLE style=\"FONT-SIZE: 13px; COLOR: #d0d0d0\" cellSpacing=0 cellPadding=0><TBODY><tr>";
print "<TD align=right><img border=0 src=$IMG_FOLDER3/$PL_VALUES[37].gif></TD>";
print "<TD class=num style=\"COLOR: #efef80\" noWrap align=right colSpan=2>$STATUS_NAME[0]:&nbsp;".&STATUS_CONVERT("$PL_VALUES[24]",'j')."<br>$STATUS_NAME[1]:&nbsp;".$JIZHUISHU."<br>$STATUS_NAME[2]:&nbsp;".$PL_VALUES[23]."型</TD></TR><tr>";
print "<SPAN><TD align=right>$STATUS_NAME[3]</TD>";
require "./$LOG_FOLDER/_ex.data";
@WEX_sA=split(/\,/,$WEAPONEX_LIST{"$WEX_A"});
@WEX_sB=split(/\,/,$WEAPONEX_LIST{"$WEX_B"});
@WEX_sC=split(/\,/,$WEAPONEX_LIST{"$WEX_C"});
@WEX_sD=split(/\,/,$WEAPONEX_LIST{"$WEX_D"});
@WEX_sE=split(/\,/,$WEAPONEX_LIST{"$WEX_E"});
$WEP_A=$WLV_A%$WEAPON_LVUP;	$WEP_B=$WLV_B%$WEAPON_LVUP;	$WEP_C=$WLV_C%$WEAPON_LVUP;$WEP_D=$WLV_D%$WEAPON_LVUP;$WEP_E=$WLV_E%$WEAPON_LVUP;
$WLV_A=int$WLV_A/$WEAPON_LVUP;$WLV_B=int$WLV_B/$WEAPON_LVUP;$WLV_C=int$WLV_C/$WEAPON_LVUP;$WLV_D=int$WLV_D/$WEAPON_LVUP;$WLV_E=int$WLV_E/$WEAPON_LVUP;
@WN_sA=split(/\,/,$WEAPON_LIST{"$WN_A"});
print "<SPAN><TD class=num style=\"COLOR: #efef80\" noWrap align=right colSpan=2><B>$PL_VALUES[5]</B></TD></tr><tr>";
print "<TD noWrap align=right>$STATUS_NAME[4]</TD>";
print "<TD noWrap width=30><B class=num>$PL_VALUES[29]</B></TD>";
print "<TD noWrap align=right width=70>$PL_VALUES[30]/$NEXT</TD></TR><tr>";
print "<TD noWrap>$STATUS_NAME[5]</TD>";
print "<TD noWrap><B>$WLV_A</B></TD>";
print "<TD noWrap align=right>$WEP_A/$WEAPON_LVUP</TD></TR><tr>";
print "<TD noWrap align=right>$STATUS_NAME[6]</TD>";
print "<TD class=num noWrap align=middle colSpan=2>".&STATUS_CONVERT("$PL_VALUES[12]",'c')."</TD></TR><tr>";
print "<TD noWrap align=right>$STATUS_NAME[13]</TD>";
print "<TD class=num noWrap align=middle colSpan=2>$PL_VALUES[32]</TD></TR><tr>";
print "<TD noWrap align=right>$STATUS_NAME[14]</TD>";
if (!$PL_VALUES[32]){$syouritu = 0;}
else{$syouritu=int(($PL_VALUES[33]/$PL_VALUES[32])*100);}
print "<TD class=num noWrap align=middle colSpan=2>$PL_VALUES[33]</TD></TR><tr>";
print "<TD noWrap align=right>$STATUS_NAME[15]</TD>";
print "<TD class=num noWrap align=middle colSpan=2>$syouritu％</TD></TR><tr>";
print "<TD noWrap align=right>$STATUS_NAME[7]</TD>";
print "<TD class=num noWrap align=middle colSpan=2><b>";
print &STATUS_CONVERT("$PL_VALUES[4]",'t')."型</b></TD></TR><tr>";
print "<SPAN><TD noWrap align=right>$STATUS_NAME[8]</TD>";
print "<SPAN><TD class=num noWrap align=middle colSpan=2><b id=j_mon>$PL_VALUES[8]</b></TD>";
print "</tr></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV></center></td>";


print "<td width=34% rowspan=3>";
print "<table border=3 cellpadding=0 cellspacing=0 style=\"border-collapse: collapse\" width=95% bgcolor=#000000 bordercolor=#008080>";
print "<tr><td width=100% align=center><img src=$IMG_FOLDER2/$PL_VALUES[27].gif><br>";
print "<font size=3>&nbsp;<b>$PL_VALUES[3]</b></font></td></tr></table>";
print "<b>$STATUS_NAME[9]</b><br><font color=#ffffff size=2>";
($DatHp,$Result,$DatHp2,$Result2,$DatHp3,$Result3) = split(/!/,$PL_VALUES[1]);
print "<font color=#FFFF00><span style=\"background-color: #FF0000\">";
print &DATE_DECORD("$DatHp")." <br>$Result</span></font><br>";
print &DATE_DECORD("$DatHp2")." <br>$Result2<br>";
print &DATE_DECORD("$DatHp3")." <br>$Result3</font></td>";


print "<td width=33%>";
print "<center><DIV style=\"FILTER: dropshadow(offx=8,offy=8,color=#000000); POSITION: relative; HEIGHT: 140px\">";
print "<TABLE cellSpacing=0 cellPadding=0><TBODY><TR>";
print "<TD style=\"BORDER-RIGHT: #89a078 2px solid; BORDER-TOP: #89a078 2px solid; FONT-SIZE: 15px; BORDER-LEFT: #89a078 2px solid; COLOR: #efef80; BORDER-BOTTOM: medium none\" noWrap align=middle width=50 bgColor=#000000>ARMS</TD>";
print "<TD style=\"PADDING-RIGHT: 1px; PADDING-LEFT: 0px; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; BORDER-BOTTOM: #89a078 2px solid\" width=150>";
print "<SPAN style=\"BORDER-RIGHT: #23a012 1px solid; BORDER-TOP: #23a012 1px solid; FONT-SIZE: 16px; BORDER-LEFT: medium none; BORDER-BOTTOM: medium none; BACKGROUND-COLOR: #000000\">";
print "<B>機體狀態資料</B></SPAN></TD></TR><TR>";
print "<TD style=\"BORDER-RIGHT: #89a078 2px solid; BORDER-TOP: medium none; BORDER-LEFT: #89a078 2px solid; BORDER-BOTTOM: medium none; BACKGROUND-REPEAT: no-repeat\" vAlign=top bgColor=#000000 colSpan=3 height=70>";
print "<TABLE style=\"FONT-SIZE: 14px; LINE-HEIGHT: 16px\" cellSpacing=0 cellPadding=0 $right><TBODY><TR>";
print "<TD rowSpan=4>";
	print "<center><table cellpadding=0 cellspacing=0 border=0>";
	print "<tr><td width=30 height=30 $right valign=bottom background=\"$IMG_FOLDER1/btl.gif\">";
	print "<img src='$IMG_FOLDER1/tl.gif' width=$AT height=$DE $fil></td>";
	print "<td width=30 height=30 align=left valign=bottom background=\"$IMG_FOLDER1/btr.gif\">";
	print "<img src='$IMG_FOLDER1/tr.gif' width=$SP height=$DE $fil></td></tr>";
	print "<tr><td width=30 height=30 $right valign=top background=\"$IMG_FOLDER1/bbl.gif\">";
	print "<img src='$IMG_FOLDER1/bl.gif' width=$AT height=$MT $fil></td>";
	print "<td width=30 height=30 align=left valign=top background=\"$IMG_FOLDER1/bbr.gif\">";
	print "<img src='$IMG_FOLDER1/br.gif' width=$SP height=$MT $fil></td></tr></table></center></TD>";
	print "<TD $right width=27><IMG src=$IMG_FOLDER4/fight.gif></TD>";
print "<TD class=num noWrap width=25><B>".&STATUS_CONVERT("$PL_VALUES[19]",'s')."</B></TD>";
$fil='style="position:relative;filter:alpha(opacity=70,finishopacitiy=70);"';
print "<TD $right width=20><IMG src=$IMG_FOLDER4/gu.gif></TD>";
print "<TD class=num noWrap><B>".&STATUS_CONVERT("$PL_VALUES[20]",'s')."</B></TD><TD noWrap $right>攻||防</TD></TR><TR>";
print "<TD $right><IMG src=$IMG_FOLDER4/short.gif></TD><TD class=num noWrap><B>".&STATUS_CONVERT("$PL_VALUES[22]",'s')."</B></TD>";
print "<TD $right height=16><IMG src=$IMG_FOLDER4/speed.gif></TD>";
print "<TD class=num noWrap><B>".&STATUS_CONVERT("$PL_VALUES[21]",'s')."</B></TD>";
print "<TD noWrap $right>命||速</TD></TR><TR>";
print "<TD align=middle><IMG src=$IMG_FOLDER4/long.gif></TD>";
print "<TD class=num noWrap $right><B id=j_am_long>--</B></TD>";
print "<TD align=middle><IMG src=$IMG_FOLDER4/cpu.gif></TD>";
print "<TD class=num noWrap $right><B>XEON 1150*2</B></TD><TD></TD></TR><TR>";
print "<TD class=num noWrap $right colSpan=5>";
print "<B>-----</B></TD></TR></TBODY></TABLE></TD></TR><TR>";
print "<TD style=\"BORDER-RIGHT: #89a078 2px solid; BORDER-TOP: medium none; FONT-SIZE: 12px; BORDER-LEFT: #89a078 2px solid; BORDER-BOTTOM: #89a078 2px solid; BACKGROUND-REPEAT: no-repeat\" bgColor=#000000 colSpan=2>";
print "<DIV><TABLE $tb_kill bgColor=#000000><font color=#99fffff>&nbsp;<b>$STATUS_NAME[10]</b></a></font>&nbsp;&nbsp;&nbsp;<font color=ffffff>$PL_VALUES[39]</font></TABLE>";
print "<TABLE $tb_kill bgColor=#000000><font color=#990000>&nbsp;<b>$STATUS_NAME[11]</b></a></font>&nbsp;&nbsp;&nbsp;<font color=ffffff>$PL_VALUES[38]</font></TABLE>";
print "敌机损毁" if $WN_sA[7]=~ m/A/;
print "一击必杀" if $WN_sA[7]=~ m/B/;
print "速度" if $WN_sA[7]=~ m/C/;
print "防御" if $WN_sA[7]=~ m/D/;
print "命中" if $WN_sA[7]=~ m/E/;
print "乱射" if $WN_sA[7]=~ m/F/;
print "幸运" if $WN_sA[7]=~ m/G/;
@WN_sB=split(/\,/,$WEAPON_LIST{"$WN_B"});
if (!$WN_sB[0]){$WEX_sB[0]="";}
print'&nbsp;&nbsp;備用武器&nbsp;&nbsp;<b>'.$WN_sB[0].'</b><small>'.$WEX_sB[0].'</small>';
print "&nbsp;Lv.$WLV_B/exp.$WEP_B" if $WN_sB[0];print "<br>";
@WN_sC=split(/\,/,$WEAPON_LIST{"$WN_C"});
if (!$WN_sC[0]){$WEX_sC[0]="";}
print'&nbsp;&nbsp;備用武器&nbsp;&nbsp;<b>'.$WN_sC[0]."</b><small>".$WEX_sC[0]."</small>";
print "&nbsp;Lv.$WLV_C/exp.$WEP_C" if $WN_sC[0];print "<br>";
@WN_sD=split(/\,/,$WEAPON_LIST{"$WN_D"});
if (!$WN_sD[0]){$WEX_sD[0]="";}
print'&nbsp;&nbsp;備用武器&nbsp;&nbsp;<b>'.$WN_sD[0]."</b><small>".$WEX_sD[0]."</small>";
print "&nbsp;Lv.$WLV_D/exp.$WEP_D" if $WN_sC[0];print "<br>";
@WN_sE=split(/\,/,$WEAPON_LIST{"$WN_E"});
if (!$WN_sE[0]){$WEX_sE[0]="";}
print'&nbsp;&nbsp;備用武器&nbsp;&nbsp;<b>'.$WN_sE[0]."</b><small>".$WEX_sE[0]."</small>";
print "&nbsp;Lv.$WLV_E/exp.$WEP_E" if $WN_sE[0];print "<br>";
print "</TD></TR></TBODY></TABLE></DIV></center></td>";
print "</tr><tr><td width=33%></td><td width=4%></td>";
if($CL_VALUES[7] > time){
	print "<br>&nbsp;&nbsp;<b>战 略</b>&nbsp;&nbsp;&nbsp;&nbsp;<b style=\"color:$CL_VALUES[0];\">$CL_VALUES[5]</b> Limit:";
	print &DATE_DECORD("$CL_VALUES[7]")."<br>&nbsp;&nbsp;<b>任务</b>&nbsp;&nbsp;";
	print "&nbsp;&nbsp;<b>$CL_VALUES[6] 本国的攻略及要塞的破坏</b>";
}

print "</tr><tr>";
print "<td width=33%>";
print "<DIV style=\"FILTER: dropshadow(offx=8,offy=8,color=#000000); POSITION: relative; HEIGHT: 50px\">";
print "<TABLE cellSpacing=0 cellPadding=0><TBODY><TR>";
print "<TD style=\"BORDER-RIGHT: #89a078 2px solid; BORDER-TOP: #89a078 2px solid; FONT-SIZE: 15px; BORDER-LEFT: #89a078 2px solid; COLOR: #efef80; BORDER-BOTTOM: medium none\" noWrap align=middle width=50 bgColor=#000000 onclick=SK(3);>HP</TD>";
print "<TD style=\"PADDING-RIGHT: 1px; PADDING-LEFT: 0px; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; BORDER-BOTTOM: #89a078 2px solid\" width=140><SPAN style=\"BORDER-RIGHT: #23a012 1px solid; BORDER-TOP: #23a012 1px solid; FONT-SIZE: 16px; BORDER-LEFT: medium none; BORDER-BOTTOM: medium none; BACKGROUND-COLOR: #000000\">";
print "<b id=j_hp>$PL_VALUES[15]</b>/<B>$PL_VALUES[16]</B>[<span id=cond>$CONDITIONAL</span>]</span></TD></TR><TR>";
print "<TD style=\"BORDER-RIGHT: #89a078 2px solid; PADDING-RIGHT: 4px; BORDER-TOP: medium none; PADDING-LEFT: 4px; PADDING-BOTTOM: 4px; BORDER-LEFT: #89a078 2px solid; PADDING-TOP: 4px; BORDER-BOTTOM: #89a078 2px solid\" width=208 bgColor=#000000 colSpan=2><IMG height=10 width=208 name=hpimg src=$IMG_FOLDER4/mater.gif></TD>";
print "</TR></TBODY></TABLE></DIV>";

print "<DIV style=\"FILTER: dropshadow(offx=8,offy=8,color=#000000); POSITION: relative; HEIGHT: 50px\">";
print "<TABLE cellSpacing=0 cellPadding=0><TBODY><TR>";
print "<TD style=\"BORDER-RIGHT: #89a078 2px solid; PADDING-RIGHT: 4px; BORDER-TOP: #89a078 2px solid; PADDING-LEFT: 4px; PADDING-BOTTOM: 4px; BORDER-LEFT: #89a078 2px solid; PADDING-TOP: 4px; BORDER-BOTTOM: medium none\" width=208 bgColor=#000000 colSpan=2><IMG name=enimg height=10 width=208 src=$IMG_FOLDER4/mater.gif></TD></TR><TR>";
print "<TD style=\"PADDING-RIGHT: 1px; BORDER-TOP: #89a078 2px solid; PADDING-LEFT: 0px; PADDING-BOTTOM: 1px; PADDING-TOP: 1px\" $right width=150>";
print "<SPAN style=\"BORDER-RIGHT: medium none; BORDER-TOP: medium none; FONT-SIZE: 16px; BORDER-LEFT: #23a012 1px solid; BORDER-BOTTOM: #23a012 1px solid; BACKGROUND-COLOR: #000000\">";
print "<b id=j_en>$PL_VALUES[17]</b>/<B>$PL_VALUES[18]</B></SPAN></TD>";
print "<TD style=\"BORDER-RIGHT: #89a078 2px solid; BORDER-TOP: medium none; FONT-SIZE: 15px; BORDER-LEFT: #89a078 2px solid; COLOR: #efef80; BORDER-BOTTOM: #89a078 2px solid\" noWrap align=middle width=50 bgColor=#000000>EN</TD></TR></TBODY></TABLE></DIV></center></td><td>";

print "<center><DIV style=\"FILTER: dropshadow(offx=8,offy=8,color=#000000); POSITION: relative; HEIGHT: 65px\">";
print "<TABLE cellSpacing=0 cellPadding=0><TBODY><TR>";
print "<TD style=\"BORDER-RIGHT: #89a078 2px solid; PADDING-RIGHT: 0px; BORDER-TOP: #89a078 2px solid; PADDING-LEFT: 0px; FONT-SIZE: 15px; PADDING-BOTTOM: 0px; BORDER-LEFT: #89a078 2px solid; COLOR: #efef80; PADDING-TOP: 0px; BORDER-BOTTOM: medium none\" noWrap align=middle width=160 bgColor=#000000>目前裝備武器</TD>";
print "<TD style=\"BORDER-RIGHT: #23a012 1px solid; BORDER-TOP: #23a012 1px solid; FONT-SIZE: 15px; BORDER-LEFT: medium none; BORDER-BOTTOM: #89a078 2px solid; BACKGROUND-COLOR: #000000\" width=100 align=middle>";
print "<B class=num>消耗EN: $WN_sA[4]</B></TD></TR><TR>";
print "<TD style=\"BORDER-RIGHT: #89a078 2px solid; PADDING-RIGHT: 4px; BORDER-TOP: medium none; PADDING-LEFT: 4px; FONT-SIZE: 15px; PADDING-BOTTOM: 4px; BORDER-LEFT: #89a078 2px solid; COLOR: #e0e0e0; PADDING-TOP: 4px; BORDER-BOTTOM: #89a078 2px solid\" width=208 bgColor=#000000 colSpan=2>";
#print "<B>".$WN_sA[0]."</B>&nbsp;等级.$WLV_A/经验.$WEP_A<BR>";
@WN_sA=split(/\,/,$WEAPON_LIST{"$WN_A"});
if (!$WN_sA[0]){$WEX_sA[0]="";}
print '&nbsp;<b> '.$WN_sA[0].'</b><small>'.$WEX_sA[0].'</small>';
print "&nbsp;Lv.$WLV_A/exp.$WEP_A" if $WN_sA[0];print "<br>";
#@WN_sA=split(/\,/,$WEAPON_LIST{"$WN_A"});
#if (!$WN_sA[0]){$WEX_sA[0]="";};
print "<span style=\"$STYL1\">&nbsp;&nbsp;性\能\&nbsp;&nbsp;攻：".&STATUS_CONVERT($WN_sA[1]*$WN_sA[3]/600,'s');print "&nbsp;&nbsp;命：".&STATUS_CONVERT($WN_sA[2]/2,'s');print "&nbsp;&nbsp;回：$WN_sA[3]<BR>";
@BG_sA=split(/\,/,$BOUGU_LIST{"$BG_A"});
print"<span style=\"$STYL1\">&nbsp;&nbsp;<b>輔助</b>&nbsp;&nbsp;</span><b>".$BG_sA[0]."</b><br>";
print "<span style=\"$STYL1\">&nbsp;&nbsp;性\能\&nbsp;&nbsp;</span>防：$BG_sA[1]重：$BG_sA[2]命補：$BG_sA[3]攻補：$BG_sA[4]耐久：$BGT_A<br>";

print "<B></B></TD></TR></TBODY></TABLE></DIV></center></td></tr></table>";
print "</td></tr>";
print << "-----END-----";
	<tr><form action=$MAIN_SCRIPT name="FM" method="POST" target=Sub><td colspan=7>
	<script language="JavaScript">
		function Move(){parent.Sub.location.replace("$MAIN_SCRIPT?LOGO");}
	</script>

		<input type=hidden name=cmd>
		<input type=hidden name=pname value=$FORM{'pname'}>
		<input type=hidden name=pass value=$FORM{'pass'}>
<div id="master">
<div id="menu">
<table border=0 width=100% cellspacing=0 cellpadding=0>
<tr><td width=100%><a href="javascript:expand()" onfocus="this.blur()"><img name="menutop" border=0 src="$IMG_FOLDER4/menu.gif" width="18" height="70"></a></td></tr>
</table>
</div>
<div id="top">
<table border=0 width=100% cellspacing=0 cellpadding=0>
<tr><td width=100%><img border=0 src="$IMG_FOLDER4/menutop.gif" width="145" height="6"></td></tr>
</table>
</div>
<div id="screen">
<table border=0 width=100% cellspacing=0 cellpadding="5">
<tr><td width=100% bgcolor="#808080">
<table border=0 width=100% bgcolor="#808080" cellspacing=0 cellpadding=0>
<tr><td width=100%>
<table border=0 width=100% cellspacing="1" cellpadding="5">
<tr><td width=100% bgcolor="#ffffff">
<font><br></font><font><br></font><font><br></font>
</td></tr></table></td></tr></table></td></tr></table></div>
<div id="screenlinks">
<table border=0 width=100% cellspacing=0 cellpadding="5">
<tr><td width=100%>
<table border=0 width=100% bgcolor="#808080" cellspacing=0 cellpadding=0>
<tr><td width=100%>
<table border=0 width=100% cellspacing="1" cellpadding="5">
<tr><td width=100% bgcolor="#665544">
<center>
<font color=#FFFFFF><b>机器人指令</b></font><br>
<input type=submit name="b_mode" value="战斗" $STYLE_B1 style=color:#003300 onClick="document.FM.cmd.value='BATTLE_1';Move()">
<input type=submit name="b_mode" value="亡命" $STYLE_B1 onClick="document.FM.cmd.value='BATTLE_1';Move()">
<input type=submit name="b_mode" value="内乱" $STYLE_B1 onClick="document.FM.cmd.value='BATTLE_1';Move()"><br>
<input type=submit name="custom" value="脸谱" $STYLE_B1 onClick="document.FM.cmd.value='FACE';Move()">
<input type=submit name="custom" value="历史" $STYLE_B1 onClick="document.FM.cmd.value='HIS';Move()">
<input type=button value="记录" $STYLE_B1 onClick="parent.Sub.location.replace('member.cgi')"><br>
<input type=button value="工厂" $STYLE_B1 onClick="parent.Sub.location.replace('miulerfactory.cgi')">
<input type=submit name="custom" value="辅助" $STYLE_B1 onClick="document.FM.cmd.value='BOUGU';Move()">
<input type=button value="黑市" $STYLE_B1 onClick="parent.Sub.location.replace('buy.cgi')"><br>
<input type=submit name="custom" value="发言" $STYLE_B1 onClick="document.FM.cmd.value='COM';Move()">
<input type=button value="议会" $STYLE_B1 onClick="parent.Sub.location.replace('bbs.cgi')">
<input type=button value=\"仓库\" $STYLE_B1 onClick=\"window.open('souko.cgi', 'Souko', 'width=610,height=554,top=50,left=50,toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0')\"><br>
<input type=submit name="custom" value="改造" $STYLE_B1 onClick="document.FM.cmd.value='CUSTOMING';Move()">
<input type=submit name="custom" value="装备" $STYLE_B1 onClick="document.FM.cmd.value='EQUIPMENT';Move()">
<input type=submit name="custom" value="特殊" $STYLE_B1 onClick="document.FM.cmd.value='SPC';Move()"><br>
<input type=button value="本国" $STYLE_B1 onClick="parent.Sub.location.replace('$MAIN_SCRIPT?MY_LIST')">
<input type=button value="情报" $STYLE_B1 onClick="parent.Sub.location.replace('$MAIN_SCRIPT?C_LIST')">
<input type=button value="国情" $STYLE_B1 onClick="parent.Sub.location.replace('kunijyouhou.cgi')"><br>
<input type=button value="势力" $STYLE_B1 onClick="parent.Sub.location.replace('ballance.cgi')">
<input type=button value="排名" $STYLE_B1 onClick="parent.Sub.location.replace('ranking.cgi')">
<input type=button value="牌戏" $STYLE_B1 onClick="window.open('e_casino.cgi','','resizable=1,scrollbars=1,status=yes,toolbar=yes,location=no,menubar=yes,width=789,height=450,left=0,top=0')"><br>
<input type=button value="争霸" $STYLE_B1 onClick="parent.top.location.replace('wars.cgi')">
<input type=button value="擂台" $STYLE_B1 onClick="parent.top.location.replace('champ.cgi')">
<input type=button value="集训" $STYLE_B1 onClick="parent.top.location.replace('mission.cgi')"><br>
<input type=button value="製造" $STYLE_B1 onClick="parent.Sub.location.replace('zhi.cgi')">
<input type=submit name="custom" value="武器" $STYLE_B1 onClick="document.FM.cmd.value='EX';Move()">
<input type=button value="庫房" $STYLE_B1 onClick="parent.Sub.location.replace('wea.cgi')"><br>
<a href="music/music.htm" class="NavJump" target=music>音乐▲</a>||<a href="music/nomusic.htm"  class="NavJump" target=music>静音■</a>
</form>
<form action=$MAIN_SCRIPT method=POST target=_self>
<input type=hidden name=cmd value=MAIN_FRAME>
<input type=hidden name=pname value=$FORM{'pname'}>
<input type=hidden name=pass value=$FORM{'pass'}>
<input type="submit" value="刷新" $STYLE_B1 onClick="parent.Sub.location.replace('$MAIN_SCRIPT?LOGO');">
<input type=button value="終了" $STYLE_B1 onClick="window.open('safeout.cgi', 'safeout', 'width=510,height=254,top=50,left=50,toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0')">
</form>
<a href="info.htm" target=_blank>♀♂游戏说明♂♀</a>
</center></td></tr></table></div></td></tr></table></td></tr></table>
-----END-----
	print "<script language=\"JavaScript\">location.href='#top';\n</script>\n" if $BANNER_DISPLAY;
print << "	-----END-----"if $ENV{'HTTP_USER_AGENT'} =~ m/MSIE/i;
	<script language="JavaScript">
	var h=$PL_VALUES[15];var e=$PL_VALUES[17];var timerID;var m=$PL_VALUES[8];
	myDate1 = new Date();
	var m_time=myDate1.getTime();
	HERepair();
	function HERepair(){
	myDate2 = new Date();
		n_time=myDate2.getTime();
		sasi = (m_time - n_time)/-1000;

		if (h < $PL_VALUES[16]){h = $PL_VALUES[15] + sasi*$HP_REPAIR;}else{h = $PL_VALUES[16];}
		if (e < $PL_VALUES[18]){e = $PL_VALUES[17] + sasi*$EN_REPAIR;}else{e = $PL_VALUES[18];}
		if (m < $MAX_MONEY){m = $PL_VALUES[8] + sasi*$pl_rank;}else{m = $MAX_MONEY;}
		if (h >= $PL_VALUES[16] && cond.innerText=='修'){
			cond.innerText='动';cond.style.color='#143dc1';
		}
		var hp=h/$PL_VALUES[16]*200;
		var en=e/$PL_VALUES[18]*200;
		document.hpimg.width=hp;
		document.enimg.width=en;
		j_hp.innerText=Math.round (h);
		j_en.innerText=Math.round (e);
		j_mon.innerText=Math.round (m);
		clearTimeout(timerID);
		timerID = setTimeout(\"HERepair()\",70);
		}
		</script>
	-----END-----
	exit;
}
sub CNTRY_LIST{
	@pair = split(/\;/, $ENV{'HTTP_COOKIE'});
		foreach (@pair) {my($key, $value) = split(/=/, $_);$DUMMY{$key} = $value;}
	@pairs = split(/\,/, $DUMMY{'EB'});
		foreach (@pairs) {my($key, $value) = split(/\:/, $_);$COOKIE{"$key"} = $value;}

	$CO_NAME=$FORM{'CNTRY'};
	($FORM{'CNTRY'}='',$CL_VALUES[0]='#000000') if $FORM{'CNTRY'} eq '流浪者';
	&HEADER;
	&LOCK;&DBM_INPORT(P);&DBM_INPORT(C);&UNLOCK;
	@PL_VALUES = split(/\s/,$P{"$COOKIE{'pname'}"});
	@CL_VALUES = split(/\s/,$C{"$FORM{'CNTRY'}"});
	require "$LOG_FOLDER/_hash.data"if $FORM{'CNTRY'} eq "$PL_VALUES[5]";

	sub TR {local($WN_A,$WLV_A) = split(/!/,$VALUES[9]);$WLV_A=int($WLV_A/$WEAPON_LVUP);
			if ($FORM{'CNTRY'} eq "$PL_VALUES[5]"){
				@WN_sA=split(/\,/,$WEAPON_LIST{"$WN_A"});
			}else{$WN_sA[0]='????????';}
		"<tr><td nowrap>$Key</td><td>".&RANK($VALUES[0],$VALUES[5],$VALUES[6])."</td><td><img src=$IMG_FOLDER3/$VALUES[37].gif ><img src=$IMG_FOLDER2/$VALUES[27].gif width=32 height=32></td><td align=center>".&STATUS_CONVERT("$VALUES[19]",'s')."</td><td align=center>".&STATUS_CONVERT("$VALUES[20]",'s')."</td><td align=center>".&STATUS_CONVERT("$VALUES[21]",'s')."</td><td align=center>".&STATUS_CONVERT("$VALUES[22]",'s')."</td><td align=center>".&STATUS_CONVERT("$VALUES[24]",'j')."</td><td><b>".$WN_sA[0]."(LV$WLV_A)</b></td><td align=center>".(&LOGIN_CHECK($Key) ? "参赛中":"<font color=red>休战中</font>")."</td></tr>"}

	print << "	-----END-----";
	<form action=$MAIN_SCRIPT method=POST target=Sub onSubmit="">
	<center><input type=hidden name="cmd" value="CO_LIST">
	<b style=\"font-size:13px;\">想查看哪个国家的情报？</b><br>
	-----END-----
	while (($C_Name,$C_Value) =each %C) {
		@C_VALUE = split(/\s/,$C_Value);
			print "<input type=submit name=CNTRY value=\"$C_Name\"";
			print " STYLE=\" background:$C_VALUE[0];color:black\">\n";
	}
		print "<input type=submit name=CNTRY value=\"流浪者\"";
		print " STYLE=\" background:#808080;color:white\"></center></form>\n";

	print "<table $center border=8 cellspacing=0 style=\"font-size:15px;border:8px outset $CL_VALUES[0];\">";
	print "<tr><td colspan=9 bgcolor=$CL_VALUES[0] style=\"font-size:35px;\">$CO_NAME";
	print "<span style=\"font-size:15px;\">&nbsp;&nbsp;&nbsp;国费&nbsp;<b>\$$CL_VALUES[1]</b></span></td></tr>";
	print "<tr><td>用户名</td><td>等级</td><td>&nbsp;</td><td>AT</td><td>GD</td><td>SP</td><td>HIT</td><td>熟</td><td>武器装备</td></tr>";
	foreach $Key (sort {$P{$b} <=> $P{$a}} keys %P){
		@VALUES = split(/\s/,$P{$Key});
		if ($FORM{'CNTRY'} eq "$VALUES[5]" && !$VALUES[28] && ($VALUES[6] == 1 || $VALUES[6] == 0)){print &TR;}

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

	if ($FORM{'CNTRY'}){
	print "<tr><td colspan=9 bgcolor=$CL_VALUES[0] style=\"color:#000000;font-size:25px;\">&nbsp;<b>第一部队</b>&nbsp;";
	print $CL_VALUES[2] ? "$CL_VALUES[2]":!$CL_VALUES[2] ? '未编制':'</td></tr>';
	print $lflag_A ? "$LEADER_A":!$lflag_A ? "<tr><td colspan=9>暂无司令</td></tr>":'\n';
	print $uflag_A ? "$UNIT_A":!$uflag_A ? "<tr><td colspan=9>暂无队员</td></tr>":'';
	print "<tr><td colspan=9 bgcolor=$CL_VALUES[0] style=\"color:#000000;font-size:25px;\">&nbsp;<b>第二部队</b>&nbsp;";
	print $CL_VALUES[3] ? "$CL_VALUES[3]":!$CL_VALUES[3] ? '未编制':'</td></tr>';
	print $lflag_B ? "$LEADER_B":!$lflag_B ? "<tr><td colspan=9>暂无司令</td></tr>":'\n';
	print $uflag_B ? "$UNIT_B":!$uflag_B ? "<tr><td colspan=9>暂无队员</td></tr>":'';
	print "<tr><td colspan=9 bgcolor=$CL_VALUES[0] style=\"color:#000000;font-size:25px;\">&nbsp;<b>第叁部队</b>&nbsp;";
	print $CL_VALUES[4] ? "$CL_VALUES[4]":!$CL_VALUES[4] ? '未编制':'</td></tr>';
	print $lflag_C ? "$LEADER_C":!$lflag_C ? "<tr><td colspan=9>暂无司令</td></tr>":'\n';
	print $uflag_C ? "$UNIT_C":!$uflag_C ? "<tr><td colspan=9>暂无队员</td></tr>":'';
	}

	print "</table><br><br><br><br>";

	&FOOTER;
	exit;
}

sub CUSTOMIZE{
	&LOCK;
	&DBM_CONVERT('P',"$FORM{pname}");$flagp=1;
	&DBM_CONVERT('C',"$PL_VALUES[5]") if $PL_VALUES[5];
	&UNLOCK;
	$PL_VALUES[5]='' if $PL_VALUES[5] && !@CL_VALUES;
	$PL_VALUES[6]='0' if !$PL_VALUES[5];
	if ($PL_VALUES[28]){
		foreach ("$CL_VALUES[2]","$CL_VALUES[3]","$CL_VALUES[4]"){if ($PL_VALUES[28] eq "$_") {$DeleteFlag=1;}}
		if (!$DeleteFlag){$PL_VALUES[6]=$PL_VALUES[28]="";}
	}
$_="$FORM{'Cmode'}";
CUSTOM:{
	/^出售$/ && do{	$SW=$PL_VALUES[10] if $FORM{'sellw'}==1;$SW=$PL_VALUES[11] if $FORM{'sellw'}==2;$SW=$PL_VALUES[35] if $FORM{'sellw'}==3;$SW=$PL_VALUES[36] if $FORM{'sellw'}==4;
		my($wk,$wl)= split(/!/,$SW);my@www=split(/\,/,$WEAPON_LIST{"$wk"});
		if ($FORM{'sellw'}==1 && $PL_VALUES[10]){$PL_VALUES[10]='';$PL_VALUES[8]+=int $www[5]/3;}
		elsif ($FORM{'sellw'}==2 && $PL_VALUES[11]){$PL_VALUES[11]='';$PL_VALUES[8]+=int $www[5]/3;}
		elsif ($FORM{'sellw'}==3 && $PL_VALUES[35]){$PL_VALUES[35]='';$PL_VALUES[8]+=int $www[5]/3;}
		elsif ($FORM{'sellw'}==4 && $PL_VALUES[36]){$PL_VALUES[36]='';$PL_VALUES[8]+=int $www[5]/3;}

	last CUSTOM;};
	/^CUSTOM化$/ && do{my($wk,$wl) = split(/!/,$PL_VALUES[9]);
		if ($FORM{'wname'} =~ m/^$wk/){$PL_VALUES[9]="$FORM{'wname'}!0";}last CUSTOM;
	};
	/^装备$/ && do{
		if ($FORM{'soubi'} eq "B" && $PL_VALUES[10]){($PL_VALUES[9],$PL_VALUES[10])=($PL_VALUES[10],$PL_VALUES[9]);}
	 elsif ($FORM{'soubi'} eq "C" && $PL_VALUES[11]){($PL_VALUES[9],$PL_VALUES[11])=($PL_VALUES[11],$PL_VALUES[9]);}
	 elsif ($FORM{'soubi'} eq "D" && $PL_VALUES[35]){($PL_VALUES[9],$PL_VALUES[35])=($PL_VALUES[35],$PL_VALUES[9]);}
	 elsif ($FORM{'soubi'} eq "E" && $PL_VALUES[36]){($PL_VALUES[9],$PL_VALUES[36])=($PL_VALUES[36],$PL_VALUES[9]);}

	last CUSTOM;};
	/^购入$/ && do{my @www=split(/\,/,$WEAPON_LIST{"$FORM{'buyw'}"});
		if (!$PL_VALUES[5]){$www[5]=int ($www[5]*0.8);}$PL_VALUES[8]-=$www[5];
### cheat low
		$WEP=$FORM{'buyw'};
		if (length($WEP)>=2){$PL_VALUES[8]='0';$WEP='a';}
### cheat low end
		if (!$PL_VALUES[10]){$PL_VALUES[10]="$FORM{'buyw'}!0";}
		elsif (!$PL_VALUES[11]){$PL_VALUES[11]="$FORM{'buyw'}!0";}
		elsif (!$PL_VALUES[35]){$PL_VALUES[35]="$FORM{'buyw'}!0";}
		elsif (!$PL_VALUES[36]){$PL_VALUES[36]="$FORM{'buyw'}!0";}
	last CUSTOM;};
### old
#	/^Custom$/ && do{$PL_VALUES[24]=$PL_VALUES[24]-110;$PL_VALUES[8]-=20000;$PL_VALUES[23]++;$PL_VALUES[27]=$FORM{'icon'};
#		$PL_VALUES[13]=$FORM{'MsColor'};$PL_VALUES[4]=$FORM{'MsType'};$PL_VALUES[3]=$FORM{'MsName'};
#	last CUSTOM;};

	### add start 多窗改造bug
	/^Custom$/ && do{$PL_VALUES[24]=$PL_VALUES[24]-110;$PL_VALUES[8]-=20000;if ($PL_VALUES[24]>=100){$PL_VALUES[23]++};$PL_VALUES[27]=$FORM{'icon'};
		$PL_VALUES[13]=$FORM{'MsColor'};if ($PL_VALUES[13] eq ""){$PL_VALUES[13]="#FFFFFF";}$PL_VALUES[4]=$FORM{'MsType'};$PL_VALUES[3]=$FORM{'MsName'};
	last CUSTOM;};
	### add end


	/^脸谱变更$/ && do{$PL_VALUES[37]=$FORM{'icon'};last CUSTOM;};
	/^HP小量升级$/ && do{$PL_VALUES[8]-=$PL_VALUES[16]+5000;$PL_VALUES[16]+=200 if $PL_VALUES[16] < $MAX_HP;$PL_VALUES[16]=$MAX_HP if $PL_VALUES[16] > $MAX_HP;last CUSTOM;};
	/^EN小量升级$/ && do{$PL_VALUES[8]-=$PL_VALUES[18]*10+5000;$PL_VALUES[18]+=5 if $PL_VALUES[18] < $MAX_EN;$PL_VALUES[18]=$MAX_EN if $PL_VALUES[18] > $MAX_EN;last CUSTOM;};
	/^HP中量升级$/ && do{$PL_VALUES[8]-=($PL_VALUES[16]+5000)*5;$PL_VALUES[16]+=1000 if $PL_VALUES[16] < $MAX_HP;$PL_VALUES[16]=$MAX_HP if $PL_VALUES[16] > $MAX_HP;last CUSTOM;};
	/^EN中量升级$/ && do{$PL_VALUES[8]-=($PL_VALUES[18]*10+5000)*5;$PL_VALUES[18]+=25 if $PL_VALUES[18] < $MAX_EN;$PL_VALUES[18]=$MAX_EN if $PL_VALUES[18] > $MAX_EN;last CUSTOM;};
	/^HP大量升级$/ && do{$PL_VALUES[8]-=($PL_VALUES[16]+5000)*7;$PL_VALUES[16]+=1400 if $PL_VALUES[16] < $MAX_HP;$PL_VALUES[16]=$MAX_HP if $PL_VALUES[16] > $MAX_HP;last CUSTOM;};
	/^EN大量升级$/ && do{$PL_VALUES[8]-=($PL_VALUES[18]*10+5000)*7;$PL_VALUES[18]+=35 if $PL_VALUES[18] < $MAX_EN;$PL_VALUES[18]=$MAX_EN if $PL_VALUES[18] > $MAX_EN;last CUSTOM;};
/^辅助購入$/ && do{my @www=split(/\,/,$BOUGU_LIST{"$FORM{'buyb'}"});
$PL_VALUES[8]-=$www[5];$PL_VALUES[41]="$FORM{'buyb'}!$www[9]";
last CUSTOM;};
/^輔助裝置出售$/ && do{$SB=$PL_VALUES[41];
my($bk,$bl)= split(/!/,$SB);my@www=split(/\,/,$BOUGU_LIST{"$bk"});
if ($PL_VALUES[41]){$PL_VALUES[41]='';$PL_VALUES[8]+=int $www[5]/3;}
last CUSTOM;};
/^武器$/ && do{my @www=split(/\,/,$WEAPONEX_LIST{"$FORM{'buyww'}"});
&LOCK;&DBM_CONVERT('P',"$FORM{pname}");&UNLOCK;
local($WN_A,$WLV_A,$WEX_A) = split(/!/,$PL_VALUES[9]);
@WN_sA=split(/\,/,$WEAPON_LIST{"$WN_A"});
$PL_VALUES[8]-=1000000;$PL_VALUES[24]=400;
if ($PL_VALUES[9]){$PL_VALUES[9]="$WN_A!0!$FORM{'buyww'}";}
last CUSTOM;};
	
/^变更$/ && do{$PL_VALUES[7]="$FORM{'com'}";last CUSTOM;};
	/^台词$/ && do{$PL_VALUES[31]="$FORM{'bacom'}";last CUSTOM;};
/^必杀/ && do{$PL_VALUES[39]="$FORM{'hicom'}";last CUSTOM;};
/^超必$/ && do{$PL_VALUES[38]="$FORM{'cicom'}";last CUSTOM;};
/^ID变更$/ && do{
#
&ERROR('现在密码不存在。')if $FORM{'c_pass'} eq '';
&ERROR('密码错误。') if $FORM{'pass'} ne $FORM{'c_pass'};
&ERROR('密码错误。') if crypt ($FORM{'c_pass'},eb) ne "$PL_VALUES[2]";
&DBM_INPORT(P);
if($P{"$FORM{'c_pname'}"}){&ERROR('同名用户存在','换个id试试');}
$PL_VALUES[8] -= 100000;
if($FORM{'c_pass2'} ne ''){
$PL_VALUES[2] = crypt ($FORM{'c_pass2'},eb);
$FORM{'pass'} = $FORM{'c_pass2'};
}
if($FORM{'c_pname'} ne ''){
if($FORM{'pname'} ne $FORM{'c_pname'}){
$flagp=1;
&LOCK;
dbmopen (%PL,"$DBM_P",0666);
$PL{"$FORM{'c_pname'}"}="@PL_VALUES";
delete $PL{"$FORM{'pname'}"};
dbmclose %PL;
$FORM{'pname'} = $FORM{'c_pname'};
&UNLOCK;
}
}
last CUSTOM;};
	/^亡命$/ && do{$PL_VALUES[5]="$FORM{'boumeiC'}";$PL_VALUES[28]='';$PL_VALUES[0]=$PL_VALUES[6]=0;last CUSTOM;};
	/^入队$/ && do{$PL_VALUES[28]="$FORM{'inunit'}";last CUSTOM;};
	/^离队$/ && do{$PL_VALUES[28]="";$PL_VALUES[6]=0;last CUSTOM;};
	/^部队编成$/ && do{&ERROR('部队名尚未输入') if !$FORM{'uname'};
		&DBM_INPORT(C);&ERROR('这个国家不存在') if !$C{"$PL_VALUES[5]"};
		$flagc=1;
		$PL_VALUES[8]-=$MAKE_TEAM;$PL_VALUES[28]="$FORM{'uname'}";$PL_VALUES[6]=-1;
		UNIT:for ($i=2;$i <= 4; $i++){if (!$CL_VALUES[$i]){$CL_VALUES[$i]="$FORM{'uname'}";last UNIT;}}
	last CUSTOM;};
	/^建国$/ && do{&DBM_INPORT(C);&ERROR('和已建立的国家重名') if $C{"$FORM{'cname'}"};
		&ERROR(noName) if $FORM{'cname'} eq '';@CL_VALUES='';$Moto="$PL_VALUES[5]" if $PL_VALUES[5];
        $PL_VALUES[8]-=$MAKE_COUNTRY;$PL_VALUES[5]="$FORM{'cname'}";$PL_VALUES[0]=200;$PL_VALUES[6]=1;
		$CL_VALUES[0]='#'.$FORM{'cl'};$CL_VALUES[1]=10000;$CL_VALUES[7]=0;
		$CL_VALUES[11]="$YOUSAI_HP!$YOUSAI_HP!$DATE";$CL_VALUES[12]="1!1!1!$FORM{'cname'}防卫要塞";$flagc=1;
		$HISTORY="$FORM{'pname'} 建国 $FORM{'cname'}。最高指导者$FORM{'pname'}同时就任" if !$Moto;
		$HISTORY="$FORM{'pname'} 建立$FORM{'cname'}同时宣布独立。对$Moto发布了独立宣言" if $Moto;
	last CUSTOM;};
	/^解散$/ && $PL_VALUES[5] && $PL_VALUES[6] == 1 && do{$flagc=1;$flagp=0;
		&DBM_INPORT(C);&ERROR('这个国家不存在') if !$C{"$PL_VALUES[5]"};
		$CL_VALUES[2]='' if $FORM{'delunit'} eq "$CL_VALUES[2]";
		$CL_VALUES[3]='' if $FORM{'delunit'} eq "$CL_VALUES[3]";
		$CL_VALUES[4]='' if $FORM{'delunit'} eq "$CL_VALUES[4]";
	last CUSTOM;};
	/^发动$/ && $PL_VALUES[5] && $PL_VALUES[6] == 1 && $CL_VALUES[7] < time && do{
		&DBM_INPORT(C);&ERROR('这个国家不存在') if !$C{"$PL_VALUES[5]"};
		$flagc=1;$flagp=0;
		$CL_VALUES[7]=time+7200*$FORM{'kikan'};$CL_VALUES[1]-=$FORM{'dmmy'};
		$CL_VALUES[6]="$FORM{'main'}";$CL_VALUES[5]="$FORM{'mname'}";
		$CL_VALUES[8]="$FORM{'u1'}";$CL_VALUES[9]="$FORM{'u2'}";$CL_VALUES[10]="$FORM{'u3'}";
		$HISTORY="$PL_VALUES[5]宣布$FORM{'mname'}开始。" if $FORM{'mname'} =~ /作战$/ ;
		$HISTORY="$PL_VALUES[5]的$FORM{'mname'}作战发动。" if !$HISTORY;
	last CUSTOM;};

/^手續$/ && do{&DBM_INPORT(P);&DBM_INPORT(C);&ERROR('請設定金額') if !$FORM{'money'} || $FORM{'money'}!~ /[0-9]+/ || $FORM{'money'} < 0;
if ($FORM{'bank'}eq"bank1"){&ERROR('你沒有國籍。') if !$C{"$PL_VALUES[5]"};
if ($FORM{'money'}>=$PL_VALUES[8]){
$CL_VALUES[1]+=$PL_VALUES[8];
$PL_VALUES[8]=0;
$flagc=1;
}else{
$PL_VALUES[8]-=$FORM{'money'};
$CL_VALUES[1]+=$FORM{'money'};
$flagc=1;
}}
elsif ($FORM{'bank'}eq"bank2"){
while (my($key,$value) = each %P){my@VS_VALUE = split(/\s/,$value);
if ($FORM{'soukin'} eq $key){
$PL_VALUES[8]-=$FORM{'money'};
$VS_VALUE[8]+=$FORM{'money'};
dbmopen (%PL,"$DBM_P",0666);$PL{"$FORM{'soukin'}"}="@VS_VALUE";dbmclose %PL;
}}}
elsif($FORM{'bank'}eq"bank3"){
$PL_VALUES[8]-=$FORM{'money'};
$PL_VALUES[40]+=$FORM{'money'};
}
elsif($FORM{'bank'}eq"bank4"){
if ($FORM{'money'}>=$PL_VALUES[40]){
$PL_VALUES[8]+=$PL_VALUES[40];
$PL_VALUES[40]=0;
}else{
$PL_VALUES[40]-=$FORM{'money'};
$PL_VALUES[8]+=$FORM{'money'};
}}else{&ERROR('不能實行');}
last CUSTOM;};

	$FORM{'yousaiCheck'} && $PL_VALUES[6] != 0 && $PL_VALUES[5] && do{
		&DBM_INPORT(C);&ERROR('这个国家不存在') if !$C{"$PL_VALUES[5]"};
		@Y_HP=split(/!/,$CL_VALUES[11]);
		@Y_ST=split(/!/,$CL_VALUES[12]);$flagc=1;$flagp=0;
		if ($FORM{'Cmode'} eq "回覆大"){$Y_HP[0]+=int($Y_HP[1]*0.2);$CL_VALUES[1]-=1000;}
		if ($FORM{'Cmode'} eq "回覆少"){$Y_HP[0]+=int($Y_HP[1]*0.5);$CL_VALUES[1]-=10000;}
		if ($FORM{'Cmode'} eq "HP强化"){$Y_HP[1]+=5000;$CL_VALUES[1]-=50000;}
		if ($FORM{'Cmode'} eq "攻击力强化"){$Y_ST[0]++;$CL_VALUES[1]-=10000;}
		if ($FORM{'Cmode'} eq "防御力强化"){$Y_ST[1]++;$CL_VALUES[1]-=10000;}
		if ($FORM{'Cmode'} eq "命中力强化"){$Y_ST[2]++;$CL_VALUES[1]-=10000;}
		$CL_VALUES[11]="$Y_HP[0]!$Y_HP[1]!$Y_HP[2]";
		$CL_VALUES[12]="$Y_ST[0]!$Y_ST[1]!$Y_ST[2]!$Y_ST[3]";
	last CUSTOM;};
	/^武器改造$/ && do{my($wa,$waa)= split(/!/,$PL_VALUES[9]);my($wb,$wbb)= split(/!/,$PL_VALUES[10]);@PW_A=split(/\,/,$WEAPON_LIST{"$wb"});if ($PW_A[8] && $PW_A[8]!=1) {$PL_VALUES[9]="$PW_A[8]!0";$PL_VALUES[10]='';}last CUSTOM;};
	/^转生$/ && do{if ($PL_VALUES[29]>300 && $PL_VALUES[8]>$PL_VALUES[29]*10000) {$PL_VALUES[8]-=$PL_VALUES[29]*10000;$PL_VALUES[29]=1;$PL_VALUES[30]=0;$PL_VALUES[19]=int($PL_VALUES[19]*0.9);$PL_VALUES[20]=int($PL_VALUES[20]*0.9);$PL_VALUES[21]=int($PL_VALUES[21]*0.9);$PL_VALUES[22]=int($PL_VALUES[22]*0.9);}last CUSTOM;};

        /^继承$/ && do{&DBM_INPORT(P);
while (my($key,$value) = each %P){my@VS_VALUE = split(/\s/,$value);
if ($FORM{'atotugi'} eq $key) {$VS_VALUE[6]='1';$VS_VALUE[28]='';$PL_VALUES[0]=0;$PL_VALUES[6]=0;
$HISTORY="$PL_VALUES[5]的总帅<font color=blue>$FORM{'pname'} </font>決定了新的继承人。新的继承人<font color=blue>$FORM{'atotugi'}</font>继承王位。";
dbmopen (%PL,"$DBM_P",0666);$PL{"$FORM{'atotugi'}"}="@VS_VALUE";dbmclose %PL;
}
}
last CUSTOM;};

	/^解雇$/ && $PL_VALUES[5] && $PL_VALUES[6] == 1 && do{&DBM_INPORT(P);

while (my($key,$value) = each %P){my@VS_VALUE = split(/\s/,$value);
if ($FORM{'delunit'} eq $key) {
$VS_VALUE[5]='';
$VS_VALUE[6]='0';
$VS_VALUE[28]='';
dbmopen (%PL,"$DBM_P",0666);$PL{"$FORM{'delunit'}"}="@VS_VALUE";dbmclose %PL;
}
}
last CUSTOM;};
	/^司令就任$/ && $PL_VALUES[5] && !$PL_VALUES[6] && do{&DBM_INPORT(P);
		while (my($key,$value) = each %P){my@VS_VALUE = split(/\s/,$value);
			if($FORM{'team'} eq "$VS_VALUE[28]" && $VS_VALUE[6] == -1){&ERROR('已经有其它玩家就任了这个位置');}
		}
		$PL_VALUES[6]='-1';$PL_VALUES[28]="$FORM{'team'}";
	last CUSTOM;};
	/^总帅就任$/ && $PL_VALUES[5] && $PL_VALUES[6] == 0 && do{&DBM_INPORT(P);
		while (my($key,$value) = each %P){my@VS_VALUE = split(/\s/,$value);
			if($PL_VALUES[5] eq "$VS_VALUE[5]" && $VS_VALUE[6] == 1){&ERROR('已经有其它玩家就任了这个位置');}
		}
		$PL_VALUES[6]='1';$PL_VALUES[0]='200';
		$HISTORY="$FORM{'pname'} 的总帅就任经过 $PL_VALUES[5]的议会承认$FORM{'pname'}委任其完全指挥权";
	last CUSTOM;};
}
	&ERROR('资金不足') if $PL_VALUES[8] < 0 || $CL_VALUES[1] < 0;
	&LOCK;
	if($flagp){dbmopen (%PL,"$DBM_P",0666);$PL{"$FORM{'pname'}"}="@PL_VALUES";dbmclose %PL;}
	if($flagc){dbmopen (%CL,"$DBM_C",0666);$CL{"$PL_VALUES[5]"}="@CL_VALUES";dbmclose %CL;}
	if($HISTORY){dbmopen (%DH,"$DBM_H",0666);$DH{"$DATE"}="$HISTORY";dbmclose %DH;}
	&UNLOCK;
}

1;
