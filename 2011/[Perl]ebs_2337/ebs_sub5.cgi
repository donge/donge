sub CUSTOM_HEADER {
	$BgColor="bgcolor=\"#000000\"";
	&HEADER;
	print << "	-----END-----";
	<form action=$MAIN_SCRIPT method=POST name=Ms target="$_[0]" onSubmit='window.location.replace("./$MAIN_SCRIPT?LOGO");'>
		<input type=hidden name=cmd value=CUSTOM>
		<input type=hidden name=CustomCheck value=$Date>
		<input type=hidden name=pname value=$FORM{'pname'}>
		<input type=hidden name=pass value=$FORM{'pass'}>
	<center><table bordercolor=\"#333333\" border=1 cellspacing=0 style="font-size:10pt;">
		<tr><td bgcolor=\"#808080\"><b>$FORM{'custom'}</b></td></tr>
	-----END-----
}
sub EQUIP {
	&CUSTOM_HEADER('Main');
	require "$LOG_FOLDER/$HASH_DATA";
	&LOCK;&DBM_CONVERT('P',"$FORM{pname}");&UNLOCK;
	local($WN_A,$WLV_A,$WEX_A) = split(/!/,$PL_VALUES[9]);
	local($WN_B,$WLV_B,$WEX_B) = split(/!/,$PL_VALUES[10]);
	local($WN_C,$WLV_C,$WEX_C) = split(/!/,$PL_VALUES[11]);
	local($WN_D,$WLV_D,$WEX_D) = split(/!/,$PL_VALUES[35]);
	local($WN_E,$WLV_E,$WEX_E) = split(/!/,$PL_VALUES[36]);
	@WN_sA=split(/\,/,$WEAPON_LIST{"$WN_A"});
	@WN_sB=split(/\,/,$WEAPON_LIST{"$WN_B"});
	@WN_sC=split(/\,/,$WEAPON_LIST{"$WN_C"});
	@WN_sD=split(/\,/,$WEAPON_LIST{"$WN_D"});
	@WN_sE=split(/\,/,$WEAPON_LIST{"$WN_E"});
	$WLV_A=int $WLV_A/$WEAPON_LVUP;
	$WLV_B=int $WLV_B/$WEAPON_LVUP;
	$WLV_C=int $WLV_C/$WEAPON_LVUP;
	$WLV_D=int $WLV_D/$WEAPON_LVUP;
	$WLV_E=int $WLV_E/$WEAPON_LVUP;
	$Pl_WeaponNameA="$WN_sA[0](Lv$WLV_A)$WEX_sA[0]";
	$Pl_WeaponNameB="$WN_sB[0](Lv$WLV_B)$WEX_sB[0]";
	$Pl_WeaponNameC="$WN_sC[0](Lv$WLV_C)$WEX_sC[0]";
	$Pl_WeaponNameD="$WN_sD[0](Lv$WLV_D)$WEX_sD[0]";
	$Pl_WeaponNameE="$WN_sE[0](Lv$WLV_E)$WEX_sE[0]";
	if ($WN_sB[0] ||$WN_sC[0]||$WN_sD[0]||$WN_sE[0]){
		$PartofW="<select name=soubi $STYLE_L>";
		if ($WN_sB[0] ne ""){$PartofW.="<option value=B>$Pl_WeaponNameB";}
		if ($WN_sC[0] ne ""){$PartofW.="<option value=C>$Pl_WeaponNameC";}
		if ($WN_sD[0] ne ""){$PartofW.="<option value=D>$Pl_WeaponNameD";}
		if ($WN_sE[0] ne ""){$PartofW.="<option value=E>$Pl_WeaponNameE";}
		$PartofW.="</select><input type=submit name=Cmode value=装备 $STYLE_B1 onClick=\"return checkEquip()\">";
		&JScfm(checkEquip,"装备变更，确认吗？");
		print "<tr><td $BgColor><b>装备变更</b><br>\n";
		print "&nbsp;$Pl_WeaponNameA装备中<div align=right>$PartofW</div></td></tr>\n";
	}
	if ($WLV_A >= $WEAPON_RANKUP){
		&JScfm(checkRnkup,"武器改造，确认吗？");
		while (my ($key,$val) = each %WEAPON_LIST){
			if (substr($key,0,length($WN_A)) eq $WN_A && length($key) == length($WN_A)+1){
				my @UpW = split(/\,/,$val);
				$WeCH++;
				print "<tr><td $BgColor><b>升级武器</b><br>\n" if $WeCH ==1;
				print "<table style=\"font-size:10pt;\"><tr><td $BgColor>&nbsp;\n";
				print "$Pl_WeaponNameA\n" if $WeCH ==1;
				print "<font color=\"000000\">$Pl_WeaponNameA</font>\n" if $WeCH !=1;
				print "</td><td $BgColor><font color=#1e90ff><b>=></b></font>\n";
				print "<input type=radio name=wname value=$key\n";
				print " checked" if $WeCH ==1;
				print ">$UpW[0]</td><td $BgColor>\n";
				print "<input name=\"Cmode\" type=submit value=CUSTOM化 class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\"" if $WeCH ==1;
				print "onClick=\"return checkRnkup()\">\n" if $WeCH ==1;
				print "</td></tr></table>\n";
			}
		}
	}
		if ($WN_sB[0] ||$WN_sC[0]||$WN_sD[0]||$WN_sE[0]){
		$PartofSW.="<option value=1>$Pl_WeaponNameB" if $WN_sB[0];
		$PartofSW.="<option value=2>$Pl_WeaponNameC" if $WN_sC[0];
		$PartofSW.="<option value=3>$Pl_WeaponNameD" if $WN_sD[0];
		$PartofSW.="<option value=4>$Pl_WeaponNameE" if $WN_sE[0];
		print "<SCRIPT language=\"JavaScript\">\nfunction checkMoney (){\n";
		print "num=document.Ms.sellw.value;\nif (num==1){var wn='$Pl_WeaponNameB';var mn='".int($WN_sB[5]/3)."';}\n";
		print "else if (num ==2){var wn='$Pl_WeaponNameC';var mn='".int($WN_sC[5]/3)."';}\n";
		print "if (confirm(wn + '将\$' + mn + '出售') == true){\n";
		print "window.location.replace(\"./dummy.html\");return true;}else{return false}\n";
		print "}\n</script>\n<tr><td $BgColor><b>武器出售</b><div align=right><select name=sellw $STYLE_L>";
		print "$PartofSW</select><input type=submit name=Cmode value=出售 ";
		print "$STYLE_B1 onClick=\"return checkMoney()\"></div></td></tr>";
	}
	if (!$WN_sB[0] ||!$WN_sC[0]||!$WN_sD[0]||!$WN_sE[0]){
		print "<tr><td $BgColor><b>武器购入</b><table style=\"font-size:10pt;\">\n";	
		&JScfm(checkBuy,"要购入新武器，确定吗？");
		local($Flag=0);
		$buy="<select name=buyw $STYLE_L>";
		while (my($key,$value) = each %WEAPON_LIST){
			if (length($key) == 1){
				my @ByW = split(/\,/,$value);
				if (!$PL_VALUES[5]){$ByW[5]=int ($ByW[5]*0.8);}
				if($ByW[5] <= $PL_VALUES[8] && $ByW[6] != 1 && $ByW[6] != 4 && $ByW[6] != 5){
					print "<tr><td>&nbsp;&nbsp;$ByW[0]</td><td>\$$ByW[5]</td></tr>";
					$buy.="<option value=$key>$ByW[0]\n";$Flag++;}
			}
		}
		if ($Flag>0){$buy.="</select><input name=\"Cmode\" type=submit value=购入 
					$STYLE_B1 onClick=\"return checkBuy()\">\n";}else{$buy="已经达到改造上限";$Flag++;}
		print "</table><div align=right>$buy</div></td></tr>\n";
	}
	if (!$PL_VALUES[10] && !$PL_VALUES[11] && $Flag==0 && $WeCH ==0){
		print "<tr><td $BgColor>实行机体改造和强化</td></tr></table>\n";}
	if ($WN_sA[8] eq $WN_sB[8] && $WN_sA[8] && $WN_sA[8]!=1 && $PL_VALUES[5] && $WLV_A >= $WEAPON_RANKUP && $WLV_B >= $WEAPON_RANKUP) {@PW_RH=split(/\,/,$WEAPON_LIST{"$WN_sA[8]"});&JScfm(checkRH,"要改造$PW_RH[0]，确定吗？");
	print "<tr><td $BgColor><table style=\"font-size:10pt;\"><b>改造<font color=#f7e957>$PW_RH[0]</font></b>&nbsp;<input name=\"Cmode\" type=submit value=武器改造 class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick=\"return checkRH()\"></table></td></tr>";}
	print "</form></table>\n";&FOOTER;
}
sub CUSTOMING2 {
	&LOCK;&DBM_CONVERT('P',"$FORM{pname}");&UNLOCK;
	&CUSTOM_HEADER('Main');
	&JScfm(checkHp,"耐久力强化，确定吗？");
	&JScfm(checkEn,"燃料箱增大，确定吗？");
	$HM=$PL_VALUES[16]+5000;$EM=$PL_VALUES[18]*10+5000;$LVBACK=$PL_VALUES[29]*10000;
	&JScfm(checklvback,"转生要$LVBACK，确定吗？");
	$HM=$PL_VALUES[16]+5000;$EM=$PL_VALUES[18]*10+5000;#小量时
	$HM2=($PL_VALUES[16]+5000)*5;$EM2=($PL_VALUES[18]*10+5000)*5;#中量时
	$HM3=($PL_VALUES[16]+5000)*7;$EM3=($PL_VALUES[18]*10+5000)*7;#大量时
print "<tr><td $BgColor colspan=4><b>机  强化</b><br>&nbsp;&nbsp;HP升级&nbsp;&nbsp;（\$$HM）";
print "<input type=submit name=\"Cmode\" value=\"HP小量升级\" $STYLE_B1 onClick='";
print "return checkHp()'>" if $PL_VALUES[8] >= $HM && $PL_VALUES[16] < $MAX_HP;
print "alert (\"所持资金不足\");return false;'>" if $PL_VALUES[8] < $HM;
print "alert (\"已经达到改造上限\");return false;'>" if $PL_VALUES[8] >= $HM && $PL_VALUES[16] >= $MAX_HP;
print "<br>&nbsp;&nbsp;HP升级 &nbsp;&nbsp;（\$$HM2）";
print "<input type=submit name=\"Cmode\" value=\"HP中量升级\" $STYLE_B1 onClick='";
print "return checkHp()'>" if $PL_VALUES[8] >= $HM2 && $PL_VALUES[16] < $MAX_HP;
print "alert (\"所持资金不足\");return false;'>" if $PL_VALUES[8] < $HM2;
print "alert (\"已经达到改造上限\");return false;'>" if $PL_VALUES[8] >= $HM2 && $PL_VALUES[16] >= $MAX_HP;
print "<br>&nbsp;&nbsp;HP升级 &nbsp;&nbsp;（\$$HM3）";
print "<input type=submit name=\"Cmode\" value=\"HP大量升级\" $STYLE_B1 onClick='";
print "return checkHp()'>" if $PL_VALUES[8] >= $HM3 && $PL_VALUES[16] < $MAX_HP;
print "alert (\"所持资金不足\");return false;'>" if $PL_VALUES[8] < $HM3;
print "alert (\"已经达到改造上限\");return false;'>" if $PL_VALUES[8] >= $HM3 && $PL_VALUES[16] >= $MAX_HP;
print "<br>&nbsp;&nbsp;EN升级&nbsp;&nbsp;（\$$EM）";
print "<input type=submit name=\"Cmode\" value=\"EN小量升级\" $STYLE_B1 onClick='";
print "return checkEn()'>" if $PL_VALUES[8] >= $EM && $PL_VALUES[18] < $MAX_EN && ($PL_VALUES[18] <= ($PL_VALUES[16]/4));
print "alert (\"所持资金不足\");return false;'>" if $PL_VALUES[8] < $EM;
print "alert (\"已经达到改造上限\");return false;'>" if $PL_VALUES[8] >= $EM && $PL_VALUES[18] >= $MAX_EN && ($PL_VALUES[18] <= ($PL_VALUES[16]/4));
print "alert (\"你的hp和en比例不符，提高hp才能突破en上限\");return false;'>" if ($PL_VALUES[8] >= $EM) && ($PL_VALUES[18] > ($PL_VALUES[16]/4));### add for hp&en balance
print "<br>&nbsp;&nbsp;EN升级&nbsp;&nbsp;（\$$EM2）";
print "<input type=submit name=\"Cmode\" value=\"EN中量升级\" $STYLE_B1 onClick='";
print "return checkEn()'>" if $PL_VALUES[8] >= $EM2 && $PL_VALUES[18] < $MAX_EN && ($PL_VALUES[18] <= ($PL_VALUES[16]/4));
print "alert (\"所持资金不足\");return false;'>" if $PL_VALUES[8] < $EM2;
print "alert (\"已经达到改造上限\");return false;'>" if $PL_VALUES[8] >= $EM2 && $PL_VALUES[18] >= $MAX_EN && ($PL_VALUES[18] <= ($PL_VALUES[16]/4));
print "alert (\"你的hp和en比例不符，提高hp才能突破en上限\");return false;'>" if ($PL_VALUES[8] >= $EM2) && ($PL_VALUES[18] > ($PL_VALUES[16]/4));### add for hp&en balance
print "<br>&nbsp;&nbsp;EN升级&nbsp;&nbsp;（\$$EM3）";
print "<input type=submit name=\"Cmode\" value=\"EN大量升级\" $STYLE_B1 onClick='";
print "return checkEn()'>" if $PL_VALUES[8] >= $EM3 && $PL_VALUES[18] < $MAX_EN && ($PL_VALUES[18] <= ($PL_VALUES[16]/4));
print "alert (\"所持资金不足\");return false;'>" if $PL_VALUES[8] < $EM3;
print "alert (\"已经达到改造上限\");return false;'>" if $PL_VALUES[8] >= $EM3 && $PL_VALUES[18] >= $MAX_EN && ($PL_VALUES[18] <= ($PL_VALUES[16]/4));
print "alert (\"你的hp和en比例不符，提高hp才能突破en上限\");return false;'>" if ($PL_VALUES[8] >= $EM3) && ($PL_VALUES[18] > ($PL_VALUES[16]/4));### add for hp&en balance
	print "<br><input type=submit name=\"Cmode\" value=\"转生\" $STYLE_B1 onClick='";
	print "return checklvback()'>" if $PL_VALUES[8] >= $LVBACK && $PL_VALUES[29] >= 300;
	print "alert (\"所持资金不足$LVBACK\");return false;'>" if $PL_VALUES[8] < $LVBACK;
	print "alert (\"不需要转生\");return false;'>" if $PL_VALUES[29] < 300;
	print "</td></tr>";
print << "-----END-----";
<script language="JavaScript">
function checkRiyou (){
if ($PL_VALUES[8] < 100000) {window.alert("金钱不足。");return false 
}else if(document.Ms.c_pass.value == '') {window.alert("  在的密码没有输入。");return false 
}else if(document.Ms.c_pass.value.match('[&! =.,<>]') != null) {
window.alert("只可以使用英文或者数字。");return false ;
}else if(document.Ms.c_pass2.value.match('[&! =.,<>]') != null) {
window.alert("只可以使用英文或者数字。");return false ;
}else {if (confirm('登陆开始。') == true){return true;}else{return false} } 
}
</script>
-----END-----
print "<tr><td $BgColor colspan=4><b>帐号＆密码变更</b>  ＄100000<br>\n";
print "请改掉原来的（??）<br><input type=text name=c_pname size=30 maxlength=15 value=\"$FORM{'pname'}\" $STYLE_L><br>\n";
print "原来的密码<br><input type=password maxlength=8 name=c_pass size=15 $STYLE_L><br>\n";
print "新的密码（输入你要的新密码）<br><input type=password maxlength=8 name=c_pass2 size=15 $STYLE_L><br>\n";
print "<font style=\"font-size:12px;\">密码<b>用数字或者英文</b>保持在8个字符以内</font><br>\n";
print "<div align=right>\n";
print "<input name=\"Cmode\" type=submit value=\"ID变更\" $STYLE_B1 onClick=\"return checkRiyou()\">\n";
print "</div></td></tr>\n";


	if ($PL_VALUES[8] >= 20000 && $PL_VALUES[24] >=210){
	print "<script language=\"JavaScript\">\nfunction changeImg(){num=document.Ms.icon.value;document.msImg.src=\"$IMG_FOLDER2/\"+ num +\".gif\";}\n</script>";
	&JScfm(checkCustom,"机体Custom化，确定吗？");
	print "<tr><td $BgColor colspan=4><b>Custom</b><br>&nbsp;&nbsp;$20000<br>\n";
	print "&nbsp;&nbsp;ICON变更<img src=\"$IMG_FOLDER2/$PL_VALUES[27].gif\" name=\"msImg\"><br>\n";
	print "&nbsp;&nbsp;&nbsp;&nbsp;<select name=icon $STYLE_L onChange=\"changeImg()\">\n";
	foreach (0..$ICON){
		print "<option value=\"$_\"";
		print " selected\n"if $_ eq $PL_VALUES[27];
		print ">ICON No.$_\n";
	}
if (  ($SPECIAL_ICON == 1 && $PL_VALUES[16] >= 10000)
	||($SPECIAL_ICON == 2 && $PL_VALUES[12] eq '6')
	||($SPECIAL_ICON == 3 && $PL_VALUES[6] == 1)){$_='';
	foreach (500..$S_ICON_NUMBER){
		print "<option value=\"$_\"";
		print " selected\n"if $_ eq $PL_VALUES[27];
		print ">ICON No.$_\n";
	}
}
	print "</select><br>&nbsp;&nbsp;MS类型<br>&nbsp;&nbsp;&nbsp;&nbsp;\n";
	print "<input type=text name=MsName size=30 maxlength=10 value=$PL_VALUES[3] $STYLE_L><br>\n";
	print "&nbsp;&nbsp;成长类型变更<br>&nbsp;&nbsp;&nbsp;&nbsp;\n";
	print "<select name=MsType $STYLE_L>\n";
	print "<option value=1";print " selected"if $PL_VALUES[4] eq '1';print ">攻击力重视\n";
	print "<option value=2";print " selected"if $PL_VALUES[4] eq '2';print ">防御力重视\n";
	print "<option value=3";print " selected"if $PL_VALUES[4] eq '3';print ">敏捷度重视\n";
	print "<option value=4";print " selected"if $PL_VALUES[4] eq '4';print ">命中力重视\n";
	print "<option value=0";print " selected"if $PL_VALUES[4] eq '0';print ">平均型</select><br>\n";
	print "&nbsp;&nbsp;色变更<br>&nbsp;&nbsp;&nbsp;&nbsp;\n";
	$br=0;
		foreach (@COLOR){$br++;
			print "<input type=\"radio\" name=\"MsColor\" value=$_";
	        print " checked" if $_ =~ /$PL_VALUES[13]/i;
	        print "><font color=$_>■</font>\n";
			if ($br==5){print"<br>&nbsp;&nbsp;&nbsp;&nbsp;\n";$br=0;}
		}
	print "<div align=right>\n";
	print "<input name=\"Cmode\" type=submit value=\"Custom\" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick=\"if (document.Ms.MsName.value!=''){if (document.Ms.MsName.value.match('[&! =.,<>]') != null){alert('半角?号  使用            。');return false;}else{return checkCustom()}}else{alert('??  ?入              ');return false;}\">\n";
	print "</div></td></tr>\n";
	}
	print "</form></table>\n";
	&FOOTER;
}
sub HISTORY {
	&CUSTOM_HEADER('Main');
	$c=0;
	dbmopen (%NOTE,"$DBM_H",0666);
		foreach $Key (sort {$b <=> $a} keys %NOTE){$c++;
			if ($c <= $HISTORY_MAX){
				print "<tr><td $BgColor><b>".&DATE_DECORD($Key)."</b>&nbsp;&nbsp;$NOTE{$Key}</td></tr>\n";
			}else{delete $NOTE{$Key};}
		}
	dbmclose %NOTE;
	print "</table>\n";
	&FOOTER;
}
sub COMMENT {
	&CUSTOM_HEADER('Main');
	&JScfm(checkComment,"提案变更，确认吗？");
	print << "	-----END-----";
		<tr><td $BgColor><b>提案变更</b><br>
		&nbsp;&nbsp;<input type="text" name="com" size="70" maxlength="30" value="" $STYLE_L><br>
		&nbsp;&nbsp;<span style="font-size:13px;">提案输入以後，必须按回车或者确定键才能刷新变更</span><br>
		&nbsp;&nbsp;<input name="Cmode" type="submit" value="变更" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick=\"return checkComment()\">
		&nbsp;&nbsp;<input type="reset" value="清除" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\"></td></tr></form></table>
	-----END-----

	&FOOTER;
}
sub SPECIAL{
	&LOCK;&DBM_CONVERT('P',"$FORM{pname}");&UNLOCK;
	&CUSTOM_HEADER('Sub');
	print "<tr><td $BgColor><br>";
	$sp.= "<input name=\"custom\" type=\"submit\" value=\"銀行\" $STYLE_B1 onClick=\"document.Ms.cmd.value='BANK_KK';\">";
	$sp.= "<input name=\"custom\" type=\"submit\" value=\"建国\" $STYLE_B1 onClick=\"document.Ms.cmd.value='MAKE_C';\">" if $PL_VALUES[8] > $MAKE_COUNTRY && !$PL_VALUES[6];
	$sp.= "<input name=\"custom\" type=\"submit\" value=\"部队\" $STYLE_B1 onClick=\"document.Ms.cmd.value='MAKE_T';\">"if $PL_VALUES[6]!=1 && $PL_VALUES[5];
	$sp.= "<input name=\"custom\" type=\"submit\" value=\"战略\" $STYLE_B1 onClick=\"document.Ms.cmd.value='MISSION';\">" if $PL_VALUES[6] == 1 && $PL_VALUES[5];
	$sp.= "<input name=\"custom\" type=\"submit\" value=\"要塞强化\" $STYLE_B1 onClick=\"document.Ms.cmd.value='BOSS';\">" if $PL_VALUES[6] != 0 && $PL_VALUES[5];
	$sp.= "<input name=\"custom\" type=\"submit\" value=\"部队解散\" $STYLE_B1 onClick=\"document.Ms.cmd.value='DEL_U';\">" if $PL_VALUES[6] == 1 && $PL_VALUES[5] && $PL_VALUES[8]>=$MAKE_TEAM*2;
	$sp.= "<input name=\"custom\" type=\"submit\" value=\"继承\" $STYLE_B1 onClick=\"document.Ms.cmd.value='MAKE_K';\">" if $PL_VALUES[5] && $PL_VALUES[6] == 1;
	$sp='目前没有可以执行的特殊指令' if !$sp;
	print "&nbsp;&nbsp;$sp&nbsp;&nbsp;<br><br></td></tr></form></table>";
	print "</form></table>\n";
	&FOOTER;
}
sub MISSION2{
	&LOCK;&DBM_CONVERT('P',"$FORM{pname}");&DBM_INPORT('C');&UNLOCK;
	@C_VALUES = split(/\s/,$C{"$PL_VALUES[5]"});
	&ERROR if $PL_VALUES[6]!=1 || !$PL_VALUES[5] || !$C{"$PL_VALUES[5]"};
	&ERROR('ERROR',"现在$C_VALUES[5]作战正在发动中") if $C_VALUES[7] > time;
	&CUSTOM_HEADER('Main');
	print "<tr><td $BgColor align=right><br>";
	while (my($key,$val) =each %C) {
		if ($PL_VALUES[5] ne "$key"){$op.= "<option value=\"$key\">$key\n";}
	}
	&ERROR('攻略国还没有指定') if !$op;
	print "<input type=hidden name=dmmy>";
	print "国费<b>\$ $C_VALUES[1]</b><br>";
	print "战略费<input type=text name=sikin size=10 maxlength=10 style=\"border:none;background:#000000;text-align:right;\"><br>";
	print "作战名<input type=text name=mname size=25 maxlength=15 class=button2><br>";
	print "战略对象：<select name=main $STYLE_L onChange=\"YOSAN()\">$op</select><br>";

	print "第一军团 $C_VALUES[2] 战略：<select name=u1 $STYLE_L onChange=\"YOSAN()\">$op</select><br>" if $C_VALUES[2];
	print "第二军团 $C_VALUES[3] 战略：<select name=u2 $STYLE_L onChange=\"YOSAN()\">$op</select><br>" if $C_VALUES[3];
	print "第叁军团 $C_VALUES[4] 战略：<select name=u3 $STYLE_L onChange=\"YOSAN()\">$op</select><br>" if $C_VALUES[4];
	print "战略时限：<select name=kikan $STYLE_L onChange=\"YOSAN()\"><option value=1>2小时<option value=2>4小时<option value=3>6小时</select><br>";
	print "<input name=\"Cmode\" type=\"submit\" value=\"发动\" class=button2 onClick=\"return ChMn()\">";
	print "<script language=\"JavaScript\">\nfunction YOSAN(){\nvar mm=8000;\n";
	print "if (document.Ms.main.selectedIndex != document.Ms.u1.selectedIndex){mm+=1000;}\n" if $C_VALUES[2];
	print "if (document.Ms.main.selectedIndex != document.Ms.u2.selectedIndex){mm+=1000;}\n" if $C_VALUES[3];
	print "if (document.Ms.main.selectedIndex != document.Ms.u3.selectedIndex){mm+=1000;}\n" if $C_VALUES[4];
	print "if (document.Ms.u1.selectedIndex == document.Ms.u2.selectedIndex){mm-=1000;}\n" if $C_VALUES[2] && $C_VALUES[3];
	print "if (document.Ms.u2.selectedIndex == document.Ms.u3.selectedIndex){mm-=1000;}\n" if $C_VALUES[3] && $C_VALUES[4];
	print "if (document.Ms.u1.selectedIndex == document.Ms.u3.selectedIndex){mm-=1000;}\n" if $C_VALUES[2] && $C_VALUES[4];
	print "if (document.Ms.u1.selectedIndex != document.Ms.u2.selectedIndex && document.Ms.u1.selectedIndex != document.Ms.u3.selectedIndex){mm+=3000;}\n" if $C_VALUES[2] && $C_VALUES[3] && $C_VALUES[4];

	print << "	-----END-----";
		total=(eval(document.Ms.kikan.selectedIndex) + 1)*mm;
		document.Ms.sikin.value='\$'+total;
		document.Ms.dmmy.value=total;
		if (total > $C_VALUES[1]){document.Ms.sikin.style.color='#ffadac';}
	}
	function ChMn(){
	if (document.Ms.dmmy.value > $C_VALUES[1]){alert('资金不足');return false;}
	if (document.Ms.mname.value == ''){alert('没有指定作战名');return false;}
	if (confirm('战略就要发动。\\n你确认吗？') == true){return true;}else{return false;}

	}
	YOSAN();
	</script></td></tr></form></table>
	-----END-----
	&FOOTER;
}
sub BOSS2{
	&LOCK;&DBM_CONVERT('P',"$FORM{pname}");&DBM_CONVERT('C',"$PL_VALUES[5]");&UNLOCK;
	&ERROR if $PL_VALUES[6]==0 || !$PL_VALUES[5] || !@CL_VALUES;
	&CUSTOM_HEADER('Main');
	print "<tr><td $BgColor><br>";
	print "<b>国费：\$ $CL_VALUES[1]</b><br>";
	@Y_HP=split(/!/,$CL_VALUES[11]);
	$Y_HP[0]=$Y_HP[0]+(time-$Y_HP[2])*$HP_REPAIR*2;$Y_HP[0]=$Y_HP[1] if $Y_HP[0] > $Y_HP[1];

	@Y_ST=split(/!/,$CL_VALUES[12]);
		print "<input type=hidden name=yousaiCheck value=$DATE";
	print "<b><span style=\"font-size:20px;\">HP</span>&nbsp;&nbsp;$Y_HP[0]/$Y_HP[1]</b>&nbsp;&nbsp;&nbsp;";
	print "<input name=\"Cmode\" type=\"submit\" value=\"回覆少\"$STYLE_B1 \"";
	print " onClick=\"return ChMn('HP的回覆（少）','1000')\">";
	print "<input name=\"Cmode\" type=\"submit\" value=\"回覆大\"$STYLE_B1 \"";
	print " onClick=\"return ChMn('HP的回覆（大）','10000')\">";
	if ($PL_VALUES[6] == 1){
		print "<input name=\"Cmode\" type=\"submit\" value=\"HP强化\" $STYLE_B1 ;\"";
		print " onClick=\"return ChMn('HP的强化','50000')\"><br><b>攻击力</b>&nbsp;&nbsp;";
		print "<b style=\"color:#ff0080;\">NT</b>+$Y_ST[0]&nbsp;&nbsp;";
		print "<input name=\"Cmode\" type=\"submit\" value=\"攻击力强化\" $STYLE_B1 ;\"";
		print " onClick=\"return ChMn('攻击力的强化','10000')\"><br><b>防御力</b>&nbsp;&nbsp;";
		print "<b style=\"color:#ff0080;\">NT</b>+$Y_ST[1]&nbsp;&nbsp;";
		print "<input name=\"Cmode\" type=\"submit\" value=\"防御力强化\" $STYLE_B1 ;\"";
		print " onClick=\"return ChMn('防御力的强化','10000')\"><br><b>命中力</b>&nbsp;&nbsp;";
		print "<b style=\"color:#ff0080;\">NT</b>+$Y_ST[2]&nbsp;&nbsp;";
		print "<input name=\"Cmode\" type=\"submit\" value=\"命中力强化\" $STYLE_B1 ;\"" ;
		print " onClick=\"return ChMn('命中力的强化','10000')\"><br>";
	}
	print << "	-----END-----";
	<script language="JavaScript">
		function ChMn(msg,mny){
			if (mny > $CL_VALUES[1]){alert('资金不足');return false;}
			if (confirm(msg+'累计\\n费用\$'+mny+'）\\n确认吗？') == true){
				return true;}else{return false;}
		}
	</script>

	</td></tr></form></table>
	-----END-----
	&FOOTER;
}
sub MAKE_C2{
	&LOCK;&DBM_INPORT('C');&UNLOCK;
	&CUSTOM_HEADER('Main');
	my@C=%C;my$C=@C/2;
	if ($C >= $COUNTRY_MAX){print "<tr><td $BgColor>$COUNTRY_MAX已经超过了限制的国家数量</td></tr></table>\n";
	}else{
		print << "		-----END-----";
			<tr><td $BgColor><b>建国费用 \$$MAKE_COUNTRY</b><br>&nbsp;&nbsp;国家名字
			<input type=text name=\"cname\" size=25 maxlength=20 $STYLE_L><br>&nbsp;&nbsp;国家颜色<br>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type=\"radio\" name=\"cl\" value=\"#C0C0C0\" checked><font color=#C0C0C0>■</font>
		-----END-----
			$br=1;
			foreach $Ccol(@COLOR){$br++;
				print "<input type=\"radio\" name=\"cl\" value=$Ccol><font color=$Ccol>■</font>\n";
				if ($br==5){print"<br>&nbsp;&nbsp;&nbsp;&nbsp;\n";$br=0;}
			}
			&JScfm(checkCountry,"建立国家，你确认吗？");
			print "<input name=\"Cmode\" type=submit value=建国 $STYLE_B1  onClick=\"if (document.Ms.cname.value!=''){if (document.Ms.cname.value.match('[&! =.,<>]') != null){alert('不要使用非法字。');return false;}else{return checkCountry()}}else{alert('重复国家名称。');return false;}\">\n";
			print "<input type=reset value=清除 $STYLE_B1 ;\"></td></tr></form></table>\n";
		}
	&FOOTER;
}
sub MAKE_T2{
	&LOCK;&DBM_CONVERT('P',"$FORM{pname}");&DBM_CONVERT('C',"$PL_VALUES[5]");&UNLOCK;
	&CUSTOM_HEADER('Main');
	if ($PL_VALUES[6] != 1 && $PL_VALUES[5]){
		if (!$PL_VALUES[28] && ($CL_VALUES[2] || $CL_VALUES[3] || $CL_VALUES[4])){
			&JScfm(checkInteam,"加入部队，确认吗？");
			print "<tr><td $BgColor><b>入队</b><br>&nbsp;&nbsp;部队<br>\n";
			print "&nbsp;&nbsp;&nbsp;&nbsp;<select name=inunit $STYLE_L>\n";
			for ($i=2;$i <= 4; $i++){
				if ($CL_VALUES[$i]){print "<option value=\"$CL_VALUES[$i]\">$CL_VALUES[$i]\n";}
			}
			print "</select>\n";
			print "<input name=\"Cmode\" type=submit value=\"入队\"";
			print " class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick=\"return checkInteam()\"></td></tr>\n";
		}elsif ($PL_VALUES[28]){
			&JScfm(checkOutteam,"离开部队，确认吗？");
			print "<tr><td $BgColor><b>离队</b><br>&nbsp;&nbsp;部队&nbsp;$PL_VALUES[28]\n";
			print "<input name=\"Cmode\" type=submit value=\"离队\"";
			print " class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick=\"return checkOutteam()\"></td></tr>\n";
		}
		if (!$PL_VALUES[28] && $PL_VALUES[8] >= $MAKE_TEAM && $PL_VALUES[0] >= 150 &&
			(!$CL_VALUES[2] || !$CL_VALUES[3] || !$CL_VALUES[4]) && $PL_VALUES[5]){
		print << "		-----END-----";
			<SCRIPT language="JavaScript">
			function checkUnit(){
			if (document.Ms.uname.value == ''){alert("部队名称没有输入");return false; }
			else if (confirm('建立部队，确认吗？') == true){
					window.location.replace("./$MAIN_SCRIPT?LOGO");return true;
			}else{return false}
			}
			</script>
			<tr><td $BgColor><b>部队成立</b><br>
			&nbsp;&nbsp;<b>成立费用 \$$MAKE_TEAM</b><br>
			&nbsp;&nbsp;&nbsp;&nbsp;部队的名字
			<input type=text name="uname" size=25 maxlength=15 $STYLE_L>
			<input name="Cmode" type=submit value="部队编成" class=button2 onClick="return checkUnit()"></td></tr>
		-----END-----
		}
	print "</form></table>\n";
	}else{print "<tr><td $BgColor><b>还不能使用部队成立的指令</b></td></tr></table>";}
	&FOOTER;
}
sub DEL_U2{
	&LOCK;&DBM_CONVERT('P',"$FORM{pname}");&DBM_CONVERT('C',"$PL_VALUES[5]");&UNLOCK;
	&CUSTOM_HEADER('Main');
	if ($PL_VALUES[6] == 1 && $PL_VALUES[5] && @CL_VALUES){
		if (!$PL_VALUES[28] && ($CL_VALUES[2] || $CL_VALUES[3] || $CL_VALUES[4])){
			&JScfm(checkInteam,"解散部队要花费总帅个人一倍的建队费用，确定吗？");
			print "<tr><td $BgColor><b>解散</b><br>&nbsp;&nbsp;部队<br>\n";
			print "&nbsp;&nbsp;&nbsp;&nbsp;<select name=delunit $STYLE_L>\n";
			for ($i=2;$i <= 4; $i++){
				if ($CL_VALUES[$i]){print "<option value=\"$CL_VALUES[$i]\">$CL_VALUES[$i]\n";}
			}
			print "</select>\n";
			print "<input name=\"Cmode\" type=submit value=\"解散\"";
			print " class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick=\"return checkInteam()\"></td></tr>\n";
		}
	print "</form></table>\n";
	}else{print "<tr><td $BgColor><b>还不能使用解散部队的指令</b></td></tr></table>";}
	&FOOTER;
}

sub DEL_UNIT{
&LOCK;&DBM_CONVERT('P',"$FORM{pname}");&DBM_CONVERT('C',"$PL_VALUES[5]");&UNLOCK;

@pair = split(/\;/, $ENV{'HTTP_COOKIE'});
foreach (@pair) {my($key, $value) = split(/=/, $_);$DUMMY{$key} = $value;}
@pairs = split(/\,/, $DUMMY{'EB'});
foreach (@pairs) {my($key, $value) = split(/\:/, $_);$COOKIE{"$key"} = $value;}

&ERROR('COOKIE  無i              。') if !$COOKIE{'pname'};
&DBM_INPORT(P);
@PL_VALUES = split(/\s/,$P{"$COOKIE{'pname'}"});
&DBM_CONVERT('C',"$PL_VALUES[5]");

&CUSTOM_HEADER('Main');
if ($PL_VALUES[6] == 1 && $PL_VALUES[5]){
&JScfm(checkInteam,"解雇      。              ？");
print "<tr><td $BgColor><br>          <br>\n";
print "    <select name=delunit $STYLE_L>\n";

foreach $Key (sort {$P{$b} <=> $P{$a}} keys %P){
@VALUES = split(/\s/,$P{$Key});
if ($PL_VALUES[5] && $PL_VALUES[5] eq $VALUES[5] && $VALUES[6] ne 1)
{print "<option value=\"$Key\">$Key\n";}
}

print "</select>\n";
print "<input name=\"Cmode\" type=submit value=\"解雇\"";
print " class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick=\"return checkInteam()\"></td></tr>\n";

print "</form></table>\n";

}else{print "<tr><td $BgColor><b>解雇使用。</b></td></tr></table>";}
&FOOTER;
}
sub COMMENT {
	&CUSTOM_HEADER('Main');
	&JScfm(checkComment,"自国的发言变更？？");
	&JScfm(checkBaCom,"战斗的台词变更？？");
	&JScfm(checkHiCom,"必杀技名变更？");
	&JScfm(checkCiCom,"超必杀技名变更？");
	print << "	-----END-----";

	<tr><td $BgColor><b>自国发言变更</b><br>
	&nbsp;&nbsp;<input type="text" name="com" size="70" maxlength=5 value="" $STYLE_L><br>
	&nbsp;&nbsp;<span style="font-size:13px;">自国发言入後、必须按「变更」按钮o。
	</span><br>
	&nbsp;&nbsp;<input name="Cmode" type="submit" value="变更" $STYLE_B1 onClick=\"return checkComment()\">
	&nbsp;&nbsp;<input type="reset" value="清空" $STYLE_B1 ;\"><BR>

	<b>战斗台词变更</b><br>
	&nbsp;&nbsp;<input type="text" name="bacom" size="70" maxlength=10 value="" $STYLE_L><BR>
	&nbsp;&nbsp;<span style="font-size:13px;">战斗台词变更之後、必须按「台词 」按钮。
	</span><br>
	&nbsp;&nbsp;<input name="Cmode" type="submit" value="台词" $STYLE_B1 onClick=\"return checkBaCom()\">
	&nbsp;<input type="reset" value="清空" $STYLE_B1 ;\"><br>

	<b>必杀技名</b><br>
	&nbsp;&nbsp;<input type="text" name="hicom" size="70" maxlength=10 value="" $STYLE_L><BR>
	&nbsp;&nbsp;<span style="font-size:13px;">必杀技入後、必须按「必杀」按钮。
	</span><br>
	&nbsp;&nbsp;<input name="Cmode" type="submit" value="必杀" $STYLE_B1 onClick=\"return checkHiCom()\">
	&nbsp;<input type="reset" value="清空" $STYLE_B1 ;\"><br>

	<b>超必杀技名</b><br>
	&nbsp;&nbsp;<input type="text" name="cicom" size="70" maxlength=10 value="" $STYLE_L><BR>
	&nbsp;&nbsp;<span style="font-size:13px;">超必杀技名入力後按「超必」按钮。</span><br>
	&nbsp;&nbsp;<input name="Cmode" type="submit" value="超必" $STYLE_B1 onClick=\"return checkCiCom()\">
	&nbsp;<input type="reset" value="清空" $STYLE_B1 ;\"><br>
	</td></tr></form></table>

	-----END-----
	&FOOTER;
}
sub MAKE_K2{
&LOCK;&DBM_CONVERT('P',"$FORM{pname}");&DBM_CONVERT('C',"$PL_VALUES[5]");&UNLOCK;
@pair = split(/\;/, $ENV{'HTTP_COOKIE'});
foreach (@pair) {my($key, $value) = split(/=/, $_);$DUMMY{$key} = $value;}
@pairs = split(/\,/, $DUMMY{'EB'});
foreach (@pairs) {my($key, $value) = split(/\:/, $_);$COOKIE{"$key"} = $value;}
&ERROR('COOKIE  無i。') if !$COOKIE{'pname'};
&DBM_INPORT(P);
@PL_VALUES = split(/\s/,$P{"$COOKIE{'pname'}"});
&DBM_CONVERT('C',"$PL_VALUES[5]");
&CUSTOM_HEADER('Main');
&JScfm(checkkoui,"要把王位让给别人？？");
print "<tr><td $BgColor colspan=4>准备把王未让给谁呢呢？<br><B>国民一览 </B><BR>\n";
print "<select name=atotugi $STYLE_L>\n";
foreach $Key (sort {$P{$b} <=> $P{$a}} keys %P){
@VALUES = split(/\s/,$P{$Key});
if ($VALUES[5] eq $PL_VALUES[5] && $FORM{'pname'} ne $Key)
{print "<option value=\"$Key\">$Key\n";}
}
print "</select>\n";
print "<input type=submit name=\"Cmode\" value=\"继承\" $STYLE_B1 onClick='";
print "return checkkoui()'>" ;
print "</td></tr>";
}
sub FACE_C{
	&LOCK;&DBM_CONVERT('P',"$FORM{pname}");&UNLOCK;
	&CUSTOM_HEADER('Main');
	print "<script language=\"JavaScript\">\nfunction changeImg(){num=document.Ms.icon.value;document.msImg.src=\"$IMG_FOLDER3/\"+ num +\".gif\";}\n</script>";
	&JScfm(checkface,"要更换脸谱，确定吗？");
	print "<tr><td $BgColor colspan=4><b>选择你喜欢的脸谱吧</b><br>&nbsp;&nbsp;$20000<br>\n";
	print "&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"$IMG_FOLDER3/$PL_VALUES[37].gif\" name=\"msImg\">&nbsp;&nbsp;<a href=ebs.cgi?ICON2 target=face><font size=4>脸谱图库</font></a><br>\n";
	print "&nbsp;&nbsp;<select name=icon $STYLE_L onChange=\"changeImg()\">\n";
	foreach (0..$ICON2){
		print "<option value=\"$_\"";
		print " selected\n"if $_ eq $PL_VALUES[37];
		print ">ICON No.$_\n";
	}
	print "<div align=right>\n";
	print "<input name=\"Cmode\" type=submit value=\"脸谱变更\" $STYLE_B1 onClick='";
	print "return checkface()'>" ;
	print "</div></td></tr>\n";

}
sub BANK_kk{
&LOCK;&DBM_CONVERT('P',"$FORM{pname}");
&DBM_CONVERT('C',"$PL_VALUES[5]");&UNLOCK;
&CUSTOM_HEADER('Main');
dbmopen (%P,"$DBM_P",0666); @ENTRy=keys %P; dbmclose %L;
$ENTRYS=@ENTRy;
$yokin=$PL_VALUES[40] if $PL_VALUES[40];
$yokin="0" if !$PL_VALUES[40];
print "<tr><td $BgColor width=350><table cellpadding=0 cellspacing=0 style=font-size:13px; width=100%><tr><td nowrap><tr><td nowrap width=50%><b>銀行大廳</b></td><td >存款額：\$$yokin</td></tr></table>";
print "&nbsp;&nbsp;您好，歡迎您來到銀行，有什麽能爲您效勞的嗎？？<br>\n";
print "<input type=radio name=bank checked value=bank1>支援國家建設"if $PL_VALUES[5] && @CL_VALUES;
print "&nbsp;&nbsp;<input type=radio name=bank value=bank2>寄錢"if $ENTRYS>=2;
print "&nbsp;&nbsp;<input type=radio name=bank value=bank3>存錢"; print "&nbsp;&nbsp;<input type=radio name=bank value=bank4>取錢"if $PL_VALUES[40]>0; print "<br><table cellpadding=0 cellspacing=0 style=font-size:13px; width=100%><tr><td nowrap width=50%>";
print "&nbsp;□金額設定（半角数字）<br>";
print "&nbsp;&nbsp;&nbsp;＄<input type=text name=money size=8 maxlength=8 $STYLE_L></td>";
print "<td>&nbsp;</td><td nowrap width=50%>&nbsp;□請選擇收錢人。<br>";

print "&nbsp;&nbsp;&nbsp;<select name=soukin $STYLE_L>\n";
foreach $Key (sort {$P{$b} <=> $P{$a}} keys %P){
@VALUES = split(/\s/,$P{$Key});
if ($Key ne "$FORM{pname}"){
print "<option value=\"$Key\">$Key \n";}
}
print "</select>\n";
print "</td></table></td></tr><tr><td $BgColor></td></tr><tr><td $BgColor>";
&JScfm(checkbank,"銀行的手續都辦好了嗎？？");
print "<div align=center><input name=Cmode type=submit value=手續 $STYLE_B1 onClick=\"return checkbank()\">";
print "</td></tr></form></table>";
&FOOTER;
}

sub BOUGU2 {
&CUSTOM_HEADER('Main');
require "./$LOG_FOLDER/_bougu.data";
&LOCK;&DBM_CONVERT('P',"$FORM{pname}");&UNLOCK;
local($BG_A) = split(/!/,$PL_VALUES[41]);
@BG_sA=split(/\,/,$BOUGU_LIST{"$BG_A"});
$Pl_BOUGUNameA="$BG_sA[0]";
if ($BG_sA[0]){
$PartofSB.="<option value=1>$Pl_BOUGUNameA" if $BG_sA[0];
print "<SCRIPT language=\"JavaScript\">\nfunction checkMoney (){\n";
print "num=document.Ms.sellb.value;\nif (num==1){var bn='$Pl_BOUGUNameA';var mn='".int($BG_sA[5]/3)."';}\n";
print "if (confirm(bn + '\$' + mn + '賣出') == true){\n";
print "window.location.replace(\"./dummy.html\");return true;}else{return false}\n";
print "}\n</script>\n<tr><td $BgColor><b>輔助裝置出售</b><div align=right><select name=sellb $STYLE_L>";
print "$PartofSB</select><input type=submit name=Cmode value=輔助裝置出售 ";
print "$STYLE_B1 onClick=\"return checkMoney()\"></div></td></tr>";
} 
if (!$BG_sA[0]){
print "<tr><td $BgColor><b>辅助装置購入</b><table style=\"font-size:9pt;\">\n"; 
&JScfm(checkBuy,"确定购买该项目?？");
local($Flag=0);
$buy="<select name=buyb $STYLE_L>";
while (my($key,$value) = each %BOUGU_LIST){
if (length($key) == 1){
my @ByB = split(/\,/,$value);
if($ByB[5] <= $PL_VALUES[8] && $ByB[8] != 1 && $ByW[8] != 4 && $ByW[8] != 5){
print "<tr><td>&nbsp;&nbsp;$ByB[0]</td><td>\$$ByB[5]</td></tr>";
$buy.="<option value=$key>$ByB[0]\n";$Flag++;}
}
}
if ($Flag>0){$buy.="</select><input name=\"Cmode\" type=submit value=辅助購入 
$STYLE_B1 onClick=\"return checkBuy()\">\n";}else{$buy="所持金额不足。";$Flag++;}
print "</table><div align=right>$buy</div></td></tr>\n";
}
if (!$PL_VALUES[41] && $Flag==0 && $WeCH ==0){
print "<tr><td $BgColor>実行确定。</td></tr>\n";}
print "</form></table>\n";&FOOTER;
}
sub WEX {
&CUSTOM_HEADER('Main');
require "./$LOG_FOLDER/$HASH_DATA";
require "./$LOG_FOLDER/_ex.data";
&LOCK;&DBM_CONVERT('P',"$FORM{pname}");&UNLOCK;
local($WN_A,$WLV_A,$WEX_A) = split(/!/,$PL_VALUES[9]);
local($WN_B,$WLV_B,$WEX_B) = split(/!/,$PL_VALUES[10]);
local($WN_C,$WLV_C,$WEX_C) = split(/!/,$PL_VALUES[11]);
local($WN_D,$WLV_D,$WEX_D) = split(/!/,$PL_VALUES[35]);
local($WN_E,$WLV_E,$WEX_E) = split(/!/,$PL_VALUES[36]);
@WN_sA=split(/\,/,$WEAPON_LIST{"$WN_A"});
@WN_sB=split(/\,/,$WEAPON_LIST{"$WN_B"});
@WN_sC=split(/\,/,$WEAPON_LIST{"$WN_C"});
@WN_sD=split(/\,/,$WEAPON_LIST{"$WN_D"});
@WN_sE=split(/\,/,$WEAPON_LIST{"$WN_E"});
@WEX_sA=split(/\,/,$WEAPONEX_LIST{"$WEX_A"});
@WEX_sB=split(/\,/,$WEAPONEX_LIST{"$WEX_B"});
@WEX_sC=split(/\,/,$WEAPONEX_LIST{"$WEX_C"});
@WEX_sD=split(/\,/,$WEAPONEX_LIST{"$WEX_D"});
@WEX_sE=split(/\,/,$WEAPONEX_LIST{"$WEX_E"});
$WLV_A=int $WLV_A/$WEAPON_LVUP;
$WLV_B=int $WLV_B/$WEAPON_LVUP;
$WLV_C=int $WLV_C/$WEAPON_LVUP;
$WLV_D=int $WLV_D/$WEAPON_LVUP;
$WLV_E=int $WLV_E/$WEAPON_LVUP;
$Pl_WeaponNameA="$WN_sA[0](Lv$WLV_A)$WEX_sA[0]";
$Pl_WeaponNameB="$WN_sB[0](Lv$WLV_B)$WEX_sB[0]";
$Pl_WeaponNameC="$WN_sC[0](Lv$WLV_C)$WEX_sC[0]";
$Pl_WeaponNameD="$WN_sD[0](Lv$WLV_D)$WEX_sD[0]";
$Pl_WeaponNameE="$WN_sE[0](Lv$WLV_E)$WEX_sE[0]";
print "<tr><td $BgColor><b>武器改造</b><table style=\"font-size:9pt;\">\n"; 
&JScfm(checkBuy,"武器改造？");
local($Flag=0);
$buy2="<select name=buyww $STYLE_L>";
while (my($key,$value) = each %WEAPONEX_LIST){
# if (length($key) == 1){
my @ByW = split(/\,/,$value);
if($PL_VALUES[24]>=500){
print "<tr><td>&nbsp;&nbsp;$ByW[0]</td><td>\＄1000000</td></tr>";
$buy2.="<option value=$key>$ByW[0]\n";$Flag++;}
# }
}
if ($Flag>0){$buy2.="</select><input name=\"Cmode\" type=submit value=武器 
$STYLE_B1 onClick=\"return checkBuy()\">\n";}else{$buy2="金錢或者熟練不足。";$Flag++;}
print "</table><div align=right>$buy2</div></td></tr>\n";
if ($Flag==0 && $WeCH ==0){
print "<tr><td $BgColor>実行。</td></tr>\n";}
print "</form></table>\n";&FOOTER;
}#--- 18

1;
