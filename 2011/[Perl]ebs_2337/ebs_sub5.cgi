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
		$PartofW.="</select><input type=submit name=Cmode value=װ�� $STYLE_B1 onClick=\"return checkEquip()\">";
		&JScfm(checkEquip,"װ�������ȷ����");
		print "<tr><td $BgColor><b>װ�����</b><br>\n";
		print "&nbsp;$Pl_WeaponNameAװ����<div align=right>$PartofW</div></td></tr>\n";
	}
	if ($WLV_A >= $WEAPON_RANKUP){
		&JScfm(checkRnkup,"�������죬ȷ����");
		while (my ($key,$val) = each %WEAPON_LIST){
			if (substr($key,0,length($WN_A)) eq $WN_A && length($key) == length($WN_A)+1){
				my @UpW = split(/\,/,$val);
				$WeCH++;
				print "<tr><td $BgColor><b>��������</b><br>\n" if $WeCH ==1;
				print "<table style=\"font-size:10pt;\"><tr><td $BgColor>&nbsp;\n";
				print "$Pl_WeaponNameA\n" if $WeCH ==1;
				print "<font color=\"000000\">$Pl_WeaponNameA</font>\n" if $WeCH !=1;
				print "</td><td $BgColor><font color=#1e90ff><b>=></b></font>\n";
				print "<input type=radio name=wname value=$key\n";
				print " checked" if $WeCH ==1;
				print ">$UpW[0]</td><td $BgColor>\n";
				print "<input name=\"Cmode\" type=submit value=CUSTOM�� class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\"" if $WeCH ==1;
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
		print "if (confirm(wn + '��\$' + mn + '����') == true){\n";
		print "window.location.replace(\"./dummy.html\");return true;}else{return false}\n";
		print "}\n</script>\n<tr><td $BgColor><b>��������</b><div align=right><select name=sellw $STYLE_L>";
		print "$PartofSW</select><input type=submit name=Cmode value=���� ";
		print "$STYLE_B1 onClick=\"return checkMoney()\"></div></td></tr>";
	}
	if (!$WN_sB[0] ||!$WN_sC[0]||!$WN_sD[0]||!$WN_sE[0]){
		print "<tr><td $BgColor><b>��������</b><table style=\"font-size:10pt;\">\n";	
		&JScfm(checkBuy,"Ҫ������������ȷ����");
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
		if ($Flag>0){$buy.="</select><input name=\"Cmode\" type=submit value=���� 
					$STYLE_B1 onClick=\"return checkBuy()\">\n";}else{$buy="�Ѿ��ﵽ��������";$Flag++;}
		print "</table><div align=right>$buy</div></td></tr>\n";
	}
	if (!$PL_VALUES[10] && !$PL_VALUES[11] && $Flag==0 && $WeCH ==0){
		print "<tr><td $BgColor>ʵ�л�������ǿ��</td></tr></table>\n";}
	if ($WN_sA[8] eq $WN_sB[8] && $WN_sA[8] && $WN_sA[8]!=1 && $PL_VALUES[5] && $WLV_A >= $WEAPON_RANKUP && $WLV_B >= $WEAPON_RANKUP) {@PW_RH=split(/\,/,$WEAPON_LIST{"$WN_sA[8]"});&JScfm(checkRH,"Ҫ����$PW_RH[0]��ȷ����");
	print "<tr><td $BgColor><table style=\"font-size:10pt;\"><b>����<font color=#f7e957>$PW_RH[0]</font></b>&nbsp;<input name=\"Cmode\" type=submit value=�������� class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick=\"return checkRH()\"></table></td></tr>";}
	print "</form></table>\n";&FOOTER;
}
sub CUSTOMING2 {
	&LOCK;&DBM_CONVERT('P',"$FORM{pname}");&UNLOCK;
	&CUSTOM_HEADER('Main');
	&JScfm(checkHp,"�;���ǿ����ȷ����");
	&JScfm(checkEn,"ȼ��������ȷ����");
	$HM=$PL_VALUES[16]+5000;$EM=$PL_VALUES[18]*10+5000;$LVBACK=$PL_VALUES[29]*10000;
	&JScfm(checklvback,"ת��Ҫ$LVBACK��ȷ����");
	$HM=$PL_VALUES[16]+5000;$EM=$PL_VALUES[18]*10+5000;#С��ʱ
	$HM2=($PL_VALUES[16]+5000)*5;$EM2=($PL_VALUES[18]*10+5000)*5;#����ʱ
	$HM3=($PL_VALUES[16]+5000)*7;$EM3=($PL_VALUES[18]*10+5000)*7;#����ʱ
print "<tr><td $BgColor colspan=4><b>��  ǿ��</b><br>&nbsp;&nbsp;HP����&nbsp;&nbsp;��\$$HM��";
print "<input type=submit name=\"Cmode\" value=\"HPС������\" $STYLE_B1 onClick='";
print "return checkHp()'>" if $PL_VALUES[8] >= $HM && $PL_VALUES[16] < $MAX_HP;
print "alert (\"�����ʽ���\");return false;'>" if $PL_VALUES[8] < $HM;
print "alert (\"�Ѿ��ﵽ��������\");return false;'>" if $PL_VALUES[8] >= $HM && $PL_VALUES[16] >= $MAX_HP;
print "<br>&nbsp;&nbsp;HP���� &nbsp;&nbsp;��\$$HM2��";
print "<input type=submit name=\"Cmode\" value=\"HP��������\" $STYLE_B1 onClick='";
print "return checkHp()'>" if $PL_VALUES[8] >= $HM2 && $PL_VALUES[16] < $MAX_HP;
print "alert (\"�����ʽ���\");return false;'>" if $PL_VALUES[8] < $HM2;
print "alert (\"�Ѿ��ﵽ��������\");return false;'>" if $PL_VALUES[8] >= $HM2 && $PL_VALUES[16] >= $MAX_HP;
print "<br>&nbsp;&nbsp;HP���� &nbsp;&nbsp;��\$$HM3��";
print "<input type=submit name=\"Cmode\" value=\"HP��������\" $STYLE_B1 onClick='";
print "return checkHp()'>" if $PL_VALUES[8] >= $HM3 && $PL_VALUES[16] < $MAX_HP;
print "alert (\"�����ʽ���\");return false;'>" if $PL_VALUES[8] < $HM3;
print "alert (\"�Ѿ��ﵽ��������\");return false;'>" if $PL_VALUES[8] >= $HM3 && $PL_VALUES[16] >= $MAX_HP;
print "<br>&nbsp;&nbsp;EN����&nbsp;&nbsp;��\$$EM��";
print "<input type=submit name=\"Cmode\" value=\"ENС������\" $STYLE_B1 onClick='";
print "return checkEn()'>" if $PL_VALUES[8] >= $EM && $PL_VALUES[18] < $MAX_EN && ($PL_VALUES[18] <= ($PL_VALUES[16]/4));
print "alert (\"�����ʽ���\");return false;'>" if $PL_VALUES[8] < $EM;
print "alert (\"�Ѿ��ﵽ��������\");return false;'>" if $PL_VALUES[8] >= $EM && $PL_VALUES[18] >= $MAX_EN && ($PL_VALUES[18] <= ($PL_VALUES[16]/4));
print "alert (\"���hp��en�������������hp����ͻ��en����\");return false;'>" if ($PL_VALUES[8] >= $EM) && ($PL_VALUES[18] > ($PL_VALUES[16]/4));### add for hp&en balance
print "<br>&nbsp;&nbsp;EN����&nbsp;&nbsp;��\$$EM2��";
print "<input type=submit name=\"Cmode\" value=\"EN��������\" $STYLE_B1 onClick='";
print "return checkEn()'>" if $PL_VALUES[8] >= $EM2 && $PL_VALUES[18] < $MAX_EN && ($PL_VALUES[18] <= ($PL_VALUES[16]/4));
print "alert (\"�����ʽ���\");return false;'>" if $PL_VALUES[8] < $EM2;
print "alert (\"�Ѿ��ﵽ��������\");return false;'>" if $PL_VALUES[8] >= $EM2 && $PL_VALUES[18] >= $MAX_EN && ($PL_VALUES[18] <= ($PL_VALUES[16]/4));
print "alert (\"���hp��en�������������hp����ͻ��en����\");return false;'>" if ($PL_VALUES[8] >= $EM2) && ($PL_VALUES[18] > ($PL_VALUES[16]/4));### add for hp&en balance
print "<br>&nbsp;&nbsp;EN����&nbsp;&nbsp;��\$$EM3��";
print "<input type=submit name=\"Cmode\" value=\"EN��������\" $STYLE_B1 onClick='";
print "return checkEn()'>" if $PL_VALUES[8] >= $EM3 && $PL_VALUES[18] < $MAX_EN && ($PL_VALUES[18] <= ($PL_VALUES[16]/4));
print "alert (\"�����ʽ���\");return false;'>" if $PL_VALUES[8] < $EM3;
print "alert (\"�Ѿ��ﵽ��������\");return false;'>" if $PL_VALUES[8] >= $EM3 && $PL_VALUES[18] >= $MAX_EN && ($PL_VALUES[18] <= ($PL_VALUES[16]/4));
print "alert (\"���hp��en�������������hp����ͻ��en����\");return false;'>" if ($PL_VALUES[8] >= $EM3) && ($PL_VALUES[18] > ($PL_VALUES[16]/4));### add for hp&en balance
	print "<br><input type=submit name=\"Cmode\" value=\"ת��\" $STYLE_B1 onClick='";
	print "return checklvback()'>" if $PL_VALUES[8] >= $LVBACK && $PL_VALUES[29] >= 300;
	print "alert (\"�����ʽ���$LVBACK\");return false;'>" if $PL_VALUES[8] < $LVBACK;
	print "alert (\"����Ҫת��\");return false;'>" if $PL_VALUES[29] < 300;
	print "</td></tr>";
print << "-----END-----";
<script language="JavaScript">
function checkRiyou (){
if ($PL_VALUES[8] < 100000) {window.alert("��Ǯ���㡣");return false 
}else if(document.Ms.c_pass.value == '') {window.alert("  �ڵ�����û�����롣");return false 
}else if(document.Ms.c_pass.value.match('[&! =.,<>]') != null) {
window.alert("ֻ����ʹ��Ӣ�Ļ������֡�");return false ;
}else if(document.Ms.c_pass2.value.match('[&! =.,<>]') != null) {
window.alert("ֻ����ʹ��Ӣ�Ļ������֡�");return false ;
}else {if (confirm('��½��ʼ��') == true){return true;}else{return false} } 
}
</script>
-----END-----
print "<tr><td $BgColor colspan=4><b>�ʺţ�������</b>  ��100000<br>\n";
print "��ĵ�ԭ���ģ�??��<br><input type=text name=c_pname size=30 maxlength=15 value=\"$FORM{'pname'}\" $STYLE_L><br>\n";
print "ԭ��������<br><input type=password maxlength=8 name=c_pass size=15 $STYLE_L><br>\n";
print "�µ����루������Ҫ�������룩<br><input type=password maxlength=8 name=c_pass2 size=15 $STYLE_L><br>\n";
print "<font style=\"font-size:12px;\">����<b>�����ֻ���Ӣ��</b>������8���ַ�����</font><br>\n";
print "<div align=right>\n";
print "<input name=\"Cmode\" type=submit value=\"ID���\" $STYLE_B1 onClick=\"return checkRiyou()\">\n";
print "</div></td></tr>\n";


	if ($PL_VALUES[8] >= 20000 && $PL_VALUES[24] >=210){
	print "<script language=\"JavaScript\">\nfunction changeImg(){num=document.Ms.icon.value;document.msImg.src=\"$IMG_FOLDER2/\"+ num +\".gif\";}\n</script>";
	&JScfm(checkCustom,"����Custom����ȷ����");
	print "<tr><td $BgColor colspan=4><b>Custom</b><br>&nbsp;&nbsp;$20000<br>\n";
	print "&nbsp;&nbsp;ICON���<img src=\"$IMG_FOLDER2/$PL_VALUES[27].gif\" name=\"msImg\"><br>\n";
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
	print "</select><br>&nbsp;&nbsp;MS����<br>&nbsp;&nbsp;&nbsp;&nbsp;\n";
	print "<input type=text name=MsName size=30 maxlength=10 value=$PL_VALUES[3] $STYLE_L><br>\n";
	print "&nbsp;&nbsp;�ɳ����ͱ��<br>&nbsp;&nbsp;&nbsp;&nbsp;\n";
	print "<select name=MsType $STYLE_L>\n";
	print "<option value=1";print " selected"if $PL_VALUES[4] eq '1';print ">����������\n";
	print "<option value=2";print " selected"if $PL_VALUES[4] eq '2';print ">����������\n";
	print "<option value=3";print " selected"if $PL_VALUES[4] eq '3';print ">���ݶ�����\n";
	print "<option value=4";print " selected"if $PL_VALUES[4] eq '4';print ">����������\n";
	print "<option value=0";print " selected"if $PL_VALUES[4] eq '0';print ">ƽ����</select><br>\n";
	print "&nbsp;&nbsp;ɫ���<br>&nbsp;&nbsp;&nbsp;&nbsp;\n";
	$br=0;
		foreach (@COLOR){$br++;
			print "<input type=\"radio\" name=\"MsColor\" value=$_";
	        print " checked" if $_ =~ /$PL_VALUES[13]/i;
	        print "><font color=$_>��</font>\n";
			if ($br==5){print"<br>&nbsp;&nbsp;&nbsp;&nbsp;\n";$br=0;}
		}
	print "<div align=right>\n";
	print "<input name=\"Cmode\" type=submit value=\"Custom\" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick=\"if (document.Ms.MsName.value!=''){if (document.Ms.MsName.value.match('[&! =.,<>]') != null){alert('���?��  ʹ��            ��');return false;}else{return checkCustom()}}else{alert('??  ?��              ');return false;}\">\n";
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
	&JScfm(checkComment,"�᰸�����ȷ����");
	print << "	-----END-----";
		<tr><td $BgColor><b>�᰸���</b><br>
		&nbsp;&nbsp;<input type="text" name="com" size="70" maxlength="30" value="" $STYLE_L><br>
		&nbsp;&nbsp;<span style="font-size:13px;">�᰸�������ᣬ���밴�س�����ȷ��������ˢ�±��</span><br>
		&nbsp;&nbsp;<input name="Cmode" type="submit" value="���" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick=\"return checkComment()\">
		&nbsp;&nbsp;<input type="reset" value="���" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\"></td></tr></form></table>
	-----END-----

	&FOOTER;
}
sub SPECIAL{
	&LOCK;&DBM_CONVERT('P',"$FORM{pname}");&UNLOCK;
	&CUSTOM_HEADER('Sub');
	print "<tr><td $BgColor><br>";
	$sp.= "<input name=\"custom\" type=\"submit\" value=\"�y��\" $STYLE_B1 onClick=\"document.Ms.cmd.value='BANK_KK';\">";
	$sp.= "<input name=\"custom\" type=\"submit\" value=\"����\" $STYLE_B1 onClick=\"document.Ms.cmd.value='MAKE_C';\">" if $PL_VALUES[8] > $MAKE_COUNTRY && !$PL_VALUES[6];
	$sp.= "<input name=\"custom\" type=\"submit\" value=\"����\" $STYLE_B1 onClick=\"document.Ms.cmd.value='MAKE_T';\">"if $PL_VALUES[6]!=1 && $PL_VALUES[5];
	$sp.= "<input name=\"custom\" type=\"submit\" value=\"ս��\" $STYLE_B1 onClick=\"document.Ms.cmd.value='MISSION';\">" if $PL_VALUES[6] == 1 && $PL_VALUES[5];
	$sp.= "<input name=\"custom\" type=\"submit\" value=\"Ҫ��ǿ��\" $STYLE_B1 onClick=\"document.Ms.cmd.value='BOSS';\">" if $PL_VALUES[6] != 0 && $PL_VALUES[5];
	$sp.= "<input name=\"custom\" type=\"submit\" value=\"���ӽ�ɢ\" $STYLE_B1 onClick=\"document.Ms.cmd.value='DEL_U';\">" if $PL_VALUES[6] == 1 && $PL_VALUES[5] && $PL_VALUES[8]>=$MAKE_TEAM*2;
	$sp.= "<input name=\"custom\" type=\"submit\" value=\"�̳�\" $STYLE_B1 onClick=\"document.Ms.cmd.value='MAKE_K';\">" if $PL_VALUES[5] && $PL_VALUES[6] == 1;
	$sp='Ŀǰû�п���ִ�е�����ָ��' if !$sp;
	print "&nbsp;&nbsp;$sp&nbsp;&nbsp;<br><br></td></tr></form></table>";
	print "</form></table>\n";
	&FOOTER;
}
sub MISSION2{
	&LOCK;&DBM_CONVERT('P',"$FORM{pname}");&DBM_INPORT('C');&UNLOCK;
	@C_VALUES = split(/\s/,$C{"$PL_VALUES[5]"});
	&ERROR if $PL_VALUES[6]!=1 || !$PL_VALUES[5] || !$C{"$PL_VALUES[5]"};
	&ERROR('ERROR',"����$C_VALUES[5]��ս���ڷ�����") if $C_VALUES[7] > time;
	&CUSTOM_HEADER('Main');
	print "<tr><td $BgColor align=right><br>";
	while (my($key,$val) =each %C) {
		if ($PL_VALUES[5] ne "$key"){$op.= "<option value=\"$key\">$key\n";}
	}
	&ERROR('���Թ���û��ָ��') if !$op;
	print "<input type=hidden name=dmmy>";
	print "����<b>\$ $C_VALUES[1]</b><br>";
	print "ս�Է�<input type=text name=sikin size=10 maxlength=10 style=\"border:none;background:#000000;text-align:right;\"><br>";
	print "��ս��<input type=text name=mname size=25 maxlength=15 class=button2><br>";
	print "ս�Զ���<select name=main $STYLE_L onChange=\"YOSAN()\">$op</select><br>";

	print "��һ���� $C_VALUES[2] ս�ԣ�<select name=u1 $STYLE_L onChange=\"YOSAN()\">$op</select><br>" if $C_VALUES[2];
	print "�ڶ����� $C_VALUES[3] ս�ԣ�<select name=u2 $STYLE_L onChange=\"YOSAN()\">$op</select><br>" if $C_VALUES[3];
	print "�������� $C_VALUES[4] ս�ԣ�<select name=u3 $STYLE_L onChange=\"YOSAN()\">$op</select><br>" if $C_VALUES[4];
	print "ս��ʱ�ޣ�<select name=kikan $STYLE_L onChange=\"YOSAN()\"><option value=1>2Сʱ<option value=2>4Сʱ<option value=3>6Сʱ</select><br>";
	print "<input name=\"Cmode\" type=\"submit\" value=\"����\" class=button2 onClick=\"return ChMn()\">";
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
	if (document.Ms.dmmy.value > $C_VALUES[1]){alert('�ʽ���');return false;}
	if (document.Ms.mname.value == ''){alert('û��ָ����ս��');return false;}
	if (confirm('ս�Ծ�Ҫ������\\n��ȷ����') == true){return true;}else{return false;}

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
	print "<b>���ѣ�\$ $CL_VALUES[1]</b><br>";
	@Y_HP=split(/!/,$CL_VALUES[11]);
	$Y_HP[0]=$Y_HP[0]+(time-$Y_HP[2])*$HP_REPAIR*2;$Y_HP[0]=$Y_HP[1] if $Y_HP[0] > $Y_HP[1];

	@Y_ST=split(/!/,$CL_VALUES[12]);
		print "<input type=hidden name=yousaiCheck value=$DATE";
	print "<b><span style=\"font-size:20px;\">HP</span>&nbsp;&nbsp;$Y_HP[0]/$Y_HP[1]</b>&nbsp;&nbsp;&nbsp;";
	print "<input name=\"Cmode\" type=\"submit\" value=\"�ظ���\"$STYLE_B1 \"";
	print " onClick=\"return ChMn('HP�Ļظ����٣�','1000')\">";
	print "<input name=\"Cmode\" type=\"submit\" value=\"�ظ���\"$STYLE_B1 \"";
	print " onClick=\"return ChMn('HP�Ļظ�����','10000')\">";
	if ($PL_VALUES[6] == 1){
		print "<input name=\"Cmode\" type=\"submit\" value=\"HPǿ��\" $STYLE_B1 ;\"";
		print " onClick=\"return ChMn('HP��ǿ��','50000')\"><br><b>������</b>&nbsp;&nbsp;";
		print "<b style=\"color:#ff0080;\">NT</b>+$Y_ST[0]&nbsp;&nbsp;";
		print "<input name=\"Cmode\" type=\"submit\" value=\"������ǿ��\" $STYLE_B1 ;\"";
		print " onClick=\"return ChMn('��������ǿ��','10000')\"><br><b>������</b>&nbsp;&nbsp;";
		print "<b style=\"color:#ff0080;\">NT</b>+$Y_ST[1]&nbsp;&nbsp;";
		print "<input name=\"Cmode\" type=\"submit\" value=\"������ǿ��\" $STYLE_B1 ;\"";
		print " onClick=\"return ChMn('��������ǿ��','10000')\"><br><b>������</b>&nbsp;&nbsp;";
		print "<b style=\"color:#ff0080;\">NT</b>+$Y_ST[2]&nbsp;&nbsp;";
		print "<input name=\"Cmode\" type=\"submit\" value=\"������ǿ��\" $STYLE_B1 ;\"" ;
		print " onClick=\"return ChMn('��������ǿ��','10000')\"><br>";
	}
	print << "	-----END-----";
	<script language="JavaScript">
		function ChMn(msg,mny){
			if (mny > $CL_VALUES[1]){alert('�ʽ���');return false;}
			if (confirm(msg+'�ۼ�\\n����\$'+mny+'��\\nȷ����') == true){
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
	if ($C >= $COUNTRY_MAX){print "<tr><td $BgColor>$COUNTRY_MAX�Ѿ����������ƵĹ�������</td></tr></table>\n";
	}else{
		print << "		-----END-----";
			<tr><td $BgColor><b>�������� \$$MAKE_COUNTRY</b><br>&nbsp;&nbsp;��������
			<input type=text name=\"cname\" size=25 maxlength=20 $STYLE_L><br>&nbsp;&nbsp;������ɫ<br>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type=\"radio\" name=\"cl\" value=\"#C0C0C0\" checked><font color=#C0C0C0>��</font>
		-----END-----
			$br=1;
			foreach $Ccol(@COLOR){$br++;
				print "<input type=\"radio\" name=\"cl\" value=$Ccol><font color=$Ccol>��</font>\n";
				if ($br==5){print"<br>&nbsp;&nbsp;&nbsp;&nbsp;\n";$br=0;}
			}
			&JScfm(checkCountry,"�������ң���ȷ����");
			print "<input name=\"Cmode\" type=submit value=���� $STYLE_B1  onClick=\"if (document.Ms.cname.value!=''){if (document.Ms.cname.value.match('[&! =.,<>]') != null){alert('��Ҫʹ�÷Ƿ��֡�');return false;}else{return checkCountry()}}else{alert('�ظ��������ơ�');return false;}\">\n";
			print "<input type=reset value=��� $STYLE_B1 ;\"></td></tr></form></table>\n";
		}
	&FOOTER;
}
sub MAKE_T2{
	&LOCK;&DBM_CONVERT('P',"$FORM{pname}");&DBM_CONVERT('C',"$PL_VALUES[5]");&UNLOCK;
	&CUSTOM_HEADER('Main');
	if ($PL_VALUES[6] != 1 && $PL_VALUES[5]){
		if (!$PL_VALUES[28] && ($CL_VALUES[2] || $CL_VALUES[3] || $CL_VALUES[4])){
			&JScfm(checkInteam,"���벿�ӣ�ȷ����");
			print "<tr><td $BgColor><b>���</b><br>&nbsp;&nbsp;����<br>\n";
			print "&nbsp;&nbsp;&nbsp;&nbsp;<select name=inunit $STYLE_L>\n";
			for ($i=2;$i <= 4; $i++){
				if ($CL_VALUES[$i]){print "<option value=\"$CL_VALUES[$i]\">$CL_VALUES[$i]\n";}
			}
			print "</select>\n";
			print "<input name=\"Cmode\" type=submit value=\"���\"";
			print " class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick=\"return checkInteam()\"></td></tr>\n";
		}elsif ($PL_VALUES[28]){
			&JScfm(checkOutteam,"�뿪���ӣ�ȷ����");
			print "<tr><td $BgColor><b>���</b><br>&nbsp;&nbsp;����&nbsp;$PL_VALUES[28]\n";
			print "<input name=\"Cmode\" type=submit value=\"���\"";
			print " class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick=\"return checkOutteam()\"></td></tr>\n";
		}
		if (!$PL_VALUES[28] && $PL_VALUES[8] >= $MAKE_TEAM && $PL_VALUES[0] >= 150 &&
			(!$CL_VALUES[2] || !$CL_VALUES[3] || !$CL_VALUES[4]) && $PL_VALUES[5]){
		print << "		-----END-----";
			<SCRIPT language="JavaScript">
			function checkUnit(){
			if (document.Ms.uname.value == ''){alert("��������û������");return false; }
			else if (confirm('�������ӣ�ȷ����') == true){
					window.location.replace("./$MAIN_SCRIPT?LOGO");return true;
			}else{return false}
			}
			</script>
			<tr><td $BgColor><b>���ӳ���</b><br>
			&nbsp;&nbsp;<b>�������� \$$MAKE_TEAM</b><br>
			&nbsp;&nbsp;&nbsp;&nbsp;���ӵ�����
			<input type=text name="uname" size=25 maxlength=15 $STYLE_L>
			<input name="Cmode" type=submit value="���ӱ��" class=button2 onClick="return checkUnit()"></td></tr>
		-----END-----
		}
	print "</form></table>\n";
	}else{print "<tr><td $BgColor><b>������ʹ�ò��ӳ�����ָ��</b></td></tr></table>";}
	&FOOTER;
}
sub DEL_U2{
	&LOCK;&DBM_CONVERT('P',"$FORM{pname}");&DBM_CONVERT('C',"$PL_VALUES[5]");&UNLOCK;
	&CUSTOM_HEADER('Main');
	if ($PL_VALUES[6] == 1 && $PL_VALUES[5] && @CL_VALUES){
		if (!$PL_VALUES[28] && ($CL_VALUES[2] || $CL_VALUES[3] || $CL_VALUES[4])){
			&JScfm(checkInteam,"��ɢ����Ҫ������˧����һ���Ľ��ӷ��ã�ȷ����");
			print "<tr><td $BgColor><b>��ɢ</b><br>&nbsp;&nbsp;����<br>\n";
			print "&nbsp;&nbsp;&nbsp;&nbsp;<select name=delunit $STYLE_L>\n";
			for ($i=2;$i <= 4; $i++){
				if ($CL_VALUES[$i]){print "<option value=\"$CL_VALUES[$i]\">$CL_VALUES[$i]\n";}
			}
			print "</select>\n";
			print "<input name=\"Cmode\" type=submit value=\"��ɢ\"";
			print " class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick=\"return checkInteam()\"></td></tr>\n";
		}
	print "</form></table>\n";
	}else{print "<tr><td $BgColor><b>������ʹ�ý�ɢ���ӵ�ָ��</b></td></tr></table>";}
	&FOOTER;
}

sub DEL_UNIT{
&LOCK;&DBM_CONVERT('P',"$FORM{pname}");&DBM_CONVERT('C',"$PL_VALUES[5]");&UNLOCK;

@pair = split(/\;/, $ENV{'HTTP_COOKIE'});
foreach (@pair) {my($key, $value) = split(/=/, $_);$DUMMY{$key} = $value;}
@pairs = split(/\,/, $DUMMY{'EB'});
foreach (@pairs) {my($key, $value) = split(/\:/, $_);$COOKIE{"$key"} = $value;}

&ERROR('COOKIE  �oi              ��') if !$COOKIE{'pname'};
&DBM_INPORT(P);
@PL_VALUES = split(/\s/,$P{"$COOKIE{'pname'}"});
&DBM_CONVERT('C',"$PL_VALUES[5]");

&CUSTOM_HEADER('Main');
if ($PL_VALUES[6] == 1 && $PL_VALUES[5]){
&JScfm(checkInteam,"���      ��              ��");
print "<tr><td $BgColor><br>          <br>\n";
print "    <select name=delunit $STYLE_L>\n";

foreach $Key (sort {$P{$b} <=> $P{$a}} keys %P){
@VALUES = split(/\s/,$P{$Key});
if ($PL_VALUES[5] && $PL_VALUES[5] eq $VALUES[5] && $VALUES[6] ne 1)
{print "<option value=\"$Key\">$Key\n";}
}

print "</select>\n";
print "<input name=\"Cmode\" type=submit value=\"���\"";
print " class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick=\"return checkInteam()\"></td></tr>\n";

print "</form></table>\n";

}else{print "<tr><td $BgColor><b>���ʹ�á�</b></td></tr></table>";}
&FOOTER;
}
sub COMMENT {
	&CUSTOM_HEADER('Main');
	&JScfm(checkComment,"�Թ��ķ��Ա������");
	&JScfm(checkBaCom,"ս����̨�ʱ������");
	&JScfm(checkHiCom,"��ɱ���������");
	&JScfm(checkCiCom,"����ɱ���������");
	print << "	-----END-----";

	<tr><td $BgColor><b>�Թ����Ա��</b><br>
	&nbsp;&nbsp;<input type="text" name="com" size="70" maxlength=5 value="" $STYLE_L><br>
	&nbsp;&nbsp;<span style="font-size:13px;">�Թ��������ᡢ���밴���������ťo��
	</span><br>
	&nbsp;&nbsp;<input name="Cmode" type="submit" value="���" $STYLE_B1 onClick=\"return checkComment()\">
	&nbsp;&nbsp;<input type="reset" value="���" $STYLE_B1 ;\"><BR>

	<b>ս��̨�ʱ��</b><br>
	&nbsp;&nbsp;<input type="text" name="bacom" size="70" maxlength=10 value="" $STYLE_L><BR>
	&nbsp;&nbsp;<span style="font-size:13px;">ս��̨�ʱ��֮�ᡢ���밴��̨�� ����ť��
	</span><br>
	&nbsp;&nbsp;<input name="Cmode" type="submit" value="̨��" $STYLE_B1 onClick=\"return checkBaCom()\">
	&nbsp;<input type="reset" value="���" $STYLE_B1 ;\"><br>

	<b>��ɱ����</b><br>
	&nbsp;&nbsp;<input type="text" name="hicom" size="70" maxlength=10 value="" $STYLE_L><BR>
	&nbsp;&nbsp;<span style="font-size:13px;">��ɱ�����ᡢ���밴����ɱ����ť��
	</span><br>
	&nbsp;&nbsp;<input name="Cmode" type="submit" value="��ɱ" $STYLE_B1 onClick=\"return checkHiCom()\">
	&nbsp;<input type="reset" value="���" $STYLE_B1 ;\"><br>

	<b>����ɱ����</b><br>
	&nbsp;&nbsp;<input type="text" name="cicom" size="70" maxlength=10 value="" $STYLE_L><BR>
	&nbsp;&nbsp;<span style="font-size:13px;">����ɱ���������ᰴ�����ء���ť��</span><br>
	&nbsp;&nbsp;<input name="Cmode" type="submit" value="����" $STYLE_B1 onClick=\"return checkCiCom()\">
	&nbsp;<input type="reset" value="���" $STYLE_B1 ;\"><br>
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
&ERROR('COOKIE  �oi��') if !$COOKIE{'pname'};
&DBM_INPORT(P);
@PL_VALUES = split(/\s/,$P{"$COOKIE{'pname'}"});
&DBM_CONVERT('C',"$PL_VALUES[5]");
&CUSTOM_HEADER('Main');
&JScfm(checkkoui,"Ҫ����λ�ø����ˣ���");
print "<tr><td $BgColor colspan=4>׼������δ�ø�˭���أ�<br><B>����һ�� </B><BR>\n";
print "<select name=atotugi $STYLE_L>\n";
foreach $Key (sort {$P{$b} <=> $P{$a}} keys %P){
@VALUES = split(/\s/,$P{$Key});
if ($VALUES[5] eq $PL_VALUES[5] && $FORM{'pname'} ne $Key)
{print "<option value=\"$Key\">$Key\n";}
}
print "</select>\n";
print "<input type=submit name=\"Cmode\" value=\"�̳�\" $STYLE_B1 onClick='";
print "return checkkoui()'>" ;
print "</td></tr>";
}
sub FACE_C{
	&LOCK;&DBM_CONVERT('P',"$FORM{pname}");&UNLOCK;
	&CUSTOM_HEADER('Main');
	print "<script language=\"JavaScript\">\nfunction changeImg(){num=document.Ms.icon.value;document.msImg.src=\"$IMG_FOLDER3/\"+ num +\".gif\";}\n</script>";
	&JScfm(checkface,"Ҫ�������ף�ȷ����");
	print "<tr><td $BgColor colspan=4><b>ѡ����ϲ�������װ�</b><br>&nbsp;&nbsp;$20000<br>\n";
	print "&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"$IMG_FOLDER3/$PL_VALUES[37].gif\" name=\"msImg\">&nbsp;&nbsp;<a href=ebs.cgi?ICON2 target=face><font size=4>����ͼ��</font></a><br>\n";
	print "&nbsp;&nbsp;<select name=icon $STYLE_L onChange=\"changeImg()\">\n";
	foreach (0..$ICON2){
		print "<option value=\"$_\"";
		print " selected\n"if $_ eq $PL_VALUES[37];
		print ">ICON No.$_\n";
	}
	print "<div align=right>\n";
	print "<input name=\"Cmode\" type=submit value=\"���ױ��\" $STYLE_B1 onClick='";
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
print "<tr><td $BgColor width=350><table cellpadding=0 cellspacing=0 style=font-size:13px; width=100%><tr><td nowrap><tr><td nowrap width=50%><b>�y�д�d</b></td><td >����~��\$$yokin</td></tr></table>";
print "&nbsp;&nbsp;���ã��gӭ�����y�У���ʲ���ܠ���Ч�ڵĆ᣿��<br>\n";
print "<input type=radio name=bank checked value=bank1>֧Ԯ���ҽ��O"if $PL_VALUES[5] && @CL_VALUES;
print "&nbsp;&nbsp;<input type=radio name=bank value=bank2>���X"if $ENTRYS>=2;
print "&nbsp;&nbsp;<input type=radio name=bank value=bank3>���X"; print "&nbsp;&nbsp;<input type=radio name=bank value=bank4>ȡ�X"if $PL_VALUES[40]>0; print "<br><table cellpadding=0 cellspacing=0 style=font-size:13px; width=100%><tr><td nowrap width=50%>";
print "&nbsp;�����~�O����������֣�<br>";
print "&nbsp;&nbsp;&nbsp;��<input type=text name=money size=8 maxlength=8 $STYLE_L></td>";
print "<td>&nbsp;</td><td nowrap width=50%>&nbsp;��Ո�x�����X�ˡ�<br>";

print "&nbsp;&nbsp;&nbsp;<select name=soukin $STYLE_L>\n";
foreach $Key (sort {$P{$b} <=> $P{$a}} keys %P){
@VALUES = split(/\s/,$P{$Key});
if ($Key ne "$FORM{pname}"){
print "<option value=\"$Key\">$Key \n";}
}
print "</select>\n";
print "</td></table></td></tr><tr><td $BgColor></td></tr><tr><td $BgColor>";
&JScfm(checkbank,"�y�е����m���k���ˆ᣿��");
print "<div align=center><input name=Cmode type=submit value=���m $STYLE_B1 onClick=\"return checkbank()\">";
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
print "if (confirm(bn + '\$' + mn + '�u��') == true){\n";
print "window.location.replace(\"./dummy.html\");return true;}else{return false}\n";
print "}\n</script>\n<tr><td $BgColor><b>�o���b�ó���</b><div align=right><select name=sellb $STYLE_L>";
print "$PartofSB</select><input type=submit name=Cmode value=�o���b�ó��� ";
print "$STYLE_B1 onClick=\"return checkMoney()\"></div></td></tr>";
} 
if (!$BG_sA[0]){
print "<tr><td $BgColor><b>����װ��ُ��</b><table style=\"font-size:9pt;\">\n"; 
&JScfm(checkBuy,"ȷ���������Ŀ?��");
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
if ($Flag>0){$buy.="</select><input name=\"Cmode\" type=submit value=����ُ�� 
$STYLE_B1 onClick=\"return checkBuy()\">\n";}else{$buy="���ֽ��㡣";$Flag++;}
print "</table><div align=right>$buy</div></td></tr>\n";
}
if (!$PL_VALUES[41] && $Flag==0 && $WeCH ==0){
print "<tr><td $BgColor>�g��ȷ����</td></tr>\n";}
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
print "<tr><td $BgColor><b>��������</b><table style=\"font-size:9pt;\">\n"; 
&JScfm(checkBuy,"�������죿");
local($Flag=0);
$buy2="<select name=buyww $STYLE_L>";
while (my($key,$value) = each %WEAPONEX_LIST){
# if (length($key) == 1){
my @ByW = split(/\,/,$value);
if($PL_VALUES[24]>=500){
print "<tr><td>&nbsp;&nbsp;$ByW[0]</td><td>\��1000000</td></tr>";
$buy2.="<option value=$key>$ByW[0]\n";$Flag++;}
# }
}
if ($Flag>0){$buy2.="</select><input name=\"Cmode\" type=submit value=���� 
$STYLE_B1 onClick=\"return checkBuy()\">\n";}else{$buy2="���X�����쾚���㡣";$Flag++;}
print "</table><div align=right>$buy2</div></td></tr>\n";
if ($Flag==0 && $WeCH ==0){
print "<tr><td $BgColor>�g�С�</td></tr>\n";}
print "</form></table>\n";&FOOTER;
}#--- 18

1;
