sub BATTLE1{
	&DBM_INPORT(P);
	@PL_VALUES = split(/\s/,$P{"$FORM{'pname'}"});
	&REPAIR(PL);
	&ERROR('流浪者机师不能内乱') if $FORM{'b_mode'} eq '内乱' && !$PL_VALUES[5];
	&ERROR('队长或者总帅不允许内乱') if $FORM{'b_mode'} eq '内乱' && $PL_VALUES[6]!=0;
	&ERROR('在修理中') if $PL_VALUES[25]==1;
### 内乱组织费
	&ERROR('内乱组织费不够') if ($FORM{'b_mode'} eq '内乱') && ($PL_VALUES[8] <= $NAIRAN_MONEY);###内乱限制费
### end
	&HEADER;
require "./$LOG_FOLDER/$HASH_DATA";
require "./$LOG_FOLDER/_ex.data";
local($WN_A,$WLV_A,$WEX_A) = split(/!/,$PL_VALUES[9]);
@WN_sA=split(/\,/,$WEAPON_LIST{"$WN_A"});
@PEX_A=split(/\,/,$WEAPONEX_LIST{"$WEX_A"});
if ($PEX_A[1] eq "e"){$WN_sA[4]=int($WN_sA[4]*1.2);}
if ($PEX_A[1] eq "f"){$WN_sA[4]=int($WN_sA[4]*0.8);}
$PL_VALUES[17] < $WN_sA[4] && do{print "EN不足。";exit;};

	&DBM_INPORT(C);

	@pair = split(/;/, $ENV{'HTTP_COOKIE'});
		foreach (@pair) {my($key, $value) = split(/=/, $_);$DUMMY{$key} = $value;}
	@MISSION=('普通攻击,0','突击,5','防御,18','防守反击,25',
				'狙击,30','闪身,40','见切,50','全弹放出,70','乱射,120','心眼,200','齐射叁连,300','一点集中,500');
	$Sakusen="作战指令 <select size=1 name=\"mode\" $STYLE_L>\n";
	foreach (@MISSION){$c++;
		my($M,$R)=split(/\,/,$_);
		if($PL_VALUES[29] >= $R){
			$Sakusen .= "<option value=\"$c\"";
			$Sakusen .= "selected"if $c ==  $DUMMY{' EBMISSON'};
			$Sakusen .= ">$M \n";
		}
	}
	$Sakusen .= "</select>";

	print "<span style=\"font-size:35px;\">$FORM{'b_mode'}</span>" if $FORM{'b_mode'} ne '战斗';

	if ($FORM{'b_mode'} eq '战斗' ||!$FORM{'b_mode'}){
		print << "		-----END-----";
			<form action=$MAIN_SCRIPT method=POST target=Sub>
			<input type=hidden name="cmd" value="BATTLE_1">
			<input type=hidden name="pname" value="$FORM{'pname'}">
			<input type=hidden name="pass" value="$FORM{'pass'}">
		-----END-----
		while (($C_Name,$C_Value) =each %C) {
			@C_VALUES = split(/\s/,$C_Value);
			if ($PL_VALUES[5] ne "$C_Name"){
				print "<input type=submit name=CNTRY value=\"$C_Name\"";
				print " style=\" background:$C_VALUES[0];color:black\">\n";
			}
		}
		print "<input type=submit name=CNTRY value=\"流浪者\"";
		print " style=\" background:#808080;color:black\"></form>\n";
	}
	if ($FORM{'b_mode'} eq '亡命'){
		$boumeiTag="&nbsp;亡命去<select name=\"boumeiC\" $STYLE_L>";
		while (($C_Name,$C_Value) =each %C) {
		@C_VALUES = split(/\s/,$C_Value);
		if ($PL_VALUES[5] ne "$C_Name"){$boumeiTag.="<option value=\"$C_Name\">$C_Name\n";$bf=1;}
		}
		$boumeiTag.="<option value=\"\">流浪者\n"if $PL_VALUES[5];
		$boumeiTag.="</select>";
		$boumeiTag='' if !$bf;
	}
	$VS_COUNTRY="$FORM{'CNTRY'}" if $FORM{'CNTRY'};
	$VS_COUNTRY="$PL_VALUES[5]" if !$FORM{'CNTRY'};
	@CL_VALUE = split(/\s/,$C{"$VS_COUNTRY"});
	@CL_VALUE2 = split(/\s/,$C{"$PL_VALUES[5]"}) if $PL_VALUES[5];

	print << "	-----END-----" if $FORM{'b_mode'} ne '战斗';
		<center><table><tr><td style=\"background-color:$CL_VALUE[0];font-size:40px;color:#000000;\" colspan=4>
			$VS_COUNTRY</td><form action=$MAIN_SCRIPT method=POST target=Sub></tr>
	-----END-----

	$FORM{'CNTRY'}='' if $FORM{'CNTRY'} eq '流浪者';
	while (($Key,$Value) = each %P){
		@VS_VALUES = split(/\s/,$Value);
		&REPAIR(VS);
		if ($Key ne "$FORM{'pname'}"){
			&FILTING if $VS_VALUES[5] eq "$FORM{'CNTRY'}" && !$FORM{'b_mode'} && !$VS_VALUES[25];
			&FILTING if $VS_VALUES[5] eq "$PL_VALUES[5]" && $PL_VALUES[5] && $FORM{'b_mode'} eq'亡命' && $VS_VALUES[0] >$PL_VALUES[0];
			(&FILTING,$sousuiCh++) if $VS_VALUES[5] eq "$PL_VALUES[5]" && $FORM{'b_mode'} eq '内乱' && $VS_VALUES[6] ==1 && $PL_VALUES[0] >=170;
			if ($VS_VALUES[5] eq "$PL_VALUES[5]" && $FORM{'b_mode'} eq '内乱' && $PL_VALUES[6] ==0 && $VS_VALUES[6] ==-1 && $CL_VALUE2[2] && $CL_VALUE2[2] eq "$VS_VALUES[28]" && $PL_VALUES[0] >=100){&FILTING;$flagta=1;}
			if ($VS_VALUES[5] eq "$PL_VALUES[5]" && $FORM{'b_mode'} eq '内乱' && $PL_VALUES[6] ==0 && $VS_VALUES[6] ==-1 && $CL_VALUE2[3] && $CL_VALUE2[3] eq "$VS_VALUES[28]" && $PL_VALUES[0] >=100){&FILTING;$flagtb=1;}
			if ($VS_VALUES[5] eq "$PL_VALUES[5]" && $FORM{'b_mode'} eq '内乱' && $PL_VALUES[6] ==0 && $VS_VALUES[6] ==-1 && $CL_VALUE2[4] && $CL_VALUE2[4] eq "$VS_VALUES[28]" && $PL_VALUES[0] >=100){&FILTING;$flagtc=1;}
		}
	}
	if($PL_VALUES[5] && !$PL_VALUES[28]){$M_AITE="$CL_VALUE2[6]";}
	elsif($PL_VALUES[5] && $PL_VALUES[28] eq "$CL_VALUE2[2]" && $CL_VALUE2[2]){$M_AITE="$CL_VALUE2[8]";}
	elsif($PL_VALUES[5] && $PL_VALUES[28] eq "$CL_VALUE2[3]" && $CL_VALUE2[3]){$M_AITE="$CL_VALUE2[9]";}
	elsif($PL_VALUES[5] && $PL_VALUES[28] eq "$CL_VALUE2[4]" && $CL_VALUE2[4]){$M_AITE="$CL_VALUE2[10]";}

	if ($FORM{'b_mode'} eq '' && !$PlMs){
		print "<tr><td bgcolor=\"$CL_VALUE[0]\">&nbsp;</td><td bgcolor=#000000 colspan=3>No-PLAYER</td></tr>"
		if $CL_VALUE2[7] < time || $M_AITE ne "$VS_COUNTRY";
		print << "		-----END-----"if $CL_VALUE2[7] > time && $M_AITE eq "$VS_COUNTRY";
			<tr><td bgcolor=$CL_VALUE[0] align=center>&nbsp;&nbsp;</td>
			<td bgcolor=#000000><input type=radio name=vsname checked value=\"$VS_COUNTRY\">
			<input type=hidden name=yousai value="true">
			$VS_COUNTRY防卫要塞<br>&nbsp;&nbsp;现在可以直接攻击敌军要塞本部了。</td>
			<td bgcolor=#000000><img src=$IMG_FOLDER2/1000.gif></td><td bgcolor=#000000>亅</td></tr>
		-----END-----
		$PlMs++ if $CL_VALUE2[7] > time && $M_AITE eq "$VS_COUNTRY";
	}
	$HiddenTag="<form action=$MAIN_SCRIPT method=POST target=Main><input type=hidden name=\"cmd\" value=\"CUSTOM\"><input type=hidden name=\"pname\" value=\"$FORM{'pname'}\"><input type=hidden name=\"pass\" value=\"$FORM{'pass'}\">";

	sub HiddenTAG{"
			<tr></form><td bgcolor=\"$CL_VALUE[0]\">&nbsp;</td>
				$HiddenTag<td bgcolor=#000000 colspan=3>
				第$_[0]部队  $_[1]目前没有队长，有实力的话值得争取。
				<input type=hidden name=\"team\" value=\"$_[1]\">
				<input type=submit name=\"Cmode\" value=\"司令就任\" $STYLE_B1
				onClick=\"location.replace('$MAIN_SCRIPT?LOGO');\">
			</td></tr>
		";
	}

	if ($FORM{'b_mode'} eq '亡命' && !$PlMs && $boumeiTag){
		print << "		-----END-----";
			<tr></form><td bgcolor=\"$CL_VALUE[0]\">&nbsp;</td>
				$HiddenTag<td bgcolor=#000000 colspan=3>$boumeiTag
				亡命很苦的哦，确定吗？
				<input type=submit name="Cmode" value="亡命" $STYLE_B1
				onClick="location.replace('$MAIN_SCRIPT?LOGO');">
			</td></tr>
		-----END-----
	}elsif($FORM{'b_mode'} eq '亡命' && !$boumeiTag){
		print "<tr></form><td bgcolor=\"$CL_VALUE[0]\">&nbsp;</td><td bgcolor=#000000 colspan=3>开始亡命生涯。</td></tr>";}
	if ($FORM{'b_mode'} eq '内乱' && !$sousuiCh && $PL_VALUES[0] >=170 && $PL_VALUES[6] ==0){$PlMs2=1;
		$hanran.= << "		-----END-----";
			<tr></form><td bgcolor=\"$CL_VALUE[0]\">&nbsp;</td>
				$HiddenTag<td bgcolor=#000000 colspan=3>
				目前国家没有皇帝了，议会决定委任你全权指挥权利，你接受吗？
				<input type=submit name="Cmode" value="总帅就任" $STYLE_B1
				onClick="location.replace('$MAIN_SCRIPT?LOGO');">
			</td></tr>
		-----END-----
	}
	if ($FORM{'b_mode'} eq '内乱' && !$flagta && $PL_VALUES[0] >=100 && $PL_VALUES[6] ==0 && $CL_VALUE2[2]){$PlMs2=1;
		$hanran.= &HiddenTAG('一',$CL_VALUE2[2]);
	}
	if ($FORM{'b_mode'} eq '内乱' && !$flagtb && $PL_VALUES[0] >=100 && $PL_VALUES[6] ==0 && $CL_VALUE2[3]){$PlMs2=1;
		$hanran.= &HiddenTAG('二',$CL_VALUE2[3]);
	}
	if ($FORM{'b_mode'} eq '内乱' && !$flagtc && $PL_VALUES[0] >=100 && $PL_VALUES[6] ==0 && $CL_VALUE2[4]){$PlMs2=1;
		$hanran.= &HiddenTAG('叁',$CL_VALUE2[4]);
	}
	print << "	-----END-----" if $FORM{'b_mode'} ne '战斗' && $PlMs;
		<tr><td bgcolor=\"$CL_VALUE[0]\"><a name=sbm>&nbsp;</td>
			<td colspan=4 bgcolor=\"#000000\">
			$Sakusen$boumeiTag
			<input type=hidden name="cmd" value="BATTLE_2">
			<input type=hidden name="pname" value="$FORM{'pname'}">
			<input type=hidden name="pass" value="$FORM{'pass'}">
			<input type=hidden name="b_mode" value="$FORM{'b_mode'}">
			<input type=hidden name="check" value="$DATE">
			<input type=submit value="开始战斗" $STYLE_B1 onClick="location.replace('$MAIN_SCRIPT?LOGO');">
		</td></tr>
	-----END-----
	print $hanran if $FORM{'b_mode'} ne '战斗' && $PlMs2;
	print << "	-----END-----" if $FORM{'b_mode'} eq '内乱' && !$PlMs2;
			<tr></form><td bgcolor=\"$CL_VALUE[0]\">&nbsp;</td><td bgcolor=#000000 colspan=3>
				目前没有和你等级相当的对手，无法进行战斗
			</td></tr>
	-----END-----

	print "</table></form><br><br>";
	&FOOTER;
exit;
}
sub FILTING {
			$PlMs++;
	$IconTag=$Guarder='';
	if ($PlMs==1){$rc='checked';}else{$rc='';}
	print "<tr><td bgcolor=\"$CL_VALUE[0]\" align=center>&nbsp;&nbsp;</td>";
	print "<td bgcolor=\"$VS_VALUES[13]\"><input type=radio name=vsname value=\"$Key\" $rc onClick=\"location.replace('#sbm')\">";
	print "<span style=\"font-size:18px;color:#000000;\">$Key</span>";
	print "<span style=\"font-size:15px;\"><b>".&RANK($VS_VALUES[0],$VS_VALUES[5],$VS_VALUES[6])."</b></font></td>";
	print "<td bgcolor=\"$VS_VALUES[13]\">$IconTag<font color=\"#000000\">$VS_VALUES[3]</font></td>";
	print "<td bgcolor=\"$VS_VALUES[13]\" style=\"FONT-SIZE: 20px\">".&STATUS_CONVERT("$VS_VALUES[24]",'j');
	print "<td bgcolor=\"$VS_VALUES[13]\" style=\"FONT-SIZE: 20px\">";
	if(LOGIN_CHECK($Key)){ print "<font color=#000080>参战中</font>"; }
	else{ print "<font color=#ff0000>休战中</font>"; }
	print "</font></b></td></tr>";
	print "</font></b></td>";

	print "</td></tr>";
}

sub BATTLE2{
		SET_COOKIE:{
		my @gmt = gmtime(time + $COOKIE_KEEP*24*60*60);
		$gmt[0] = sprintf("%02d", $gmt[0]);$gmt[1] = sprintf("%02d", $gmt[1]);$gmt[2] = sprintf("%02d", $gmt[2]);
		$gmt[3] = sprintf("%02d", $gmt[3]);$gmt[5] += 1900;
		$gmt[4] = ('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec')[$gmt[4]];
		$gmt[6] = ('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday')[$gmt[6]];
		my $date_gmt = "$gmt[6], $gmt[3]\-$gmt[4]\-$gmt[5] $gmt[2]:$gmt[1]:$gmt[0] GMT";
		print "Set-Cookie:EBMISSON=$FORM{'mode'}; expires=$date_gmt\n";
	}
	&LOCK;
		&DBM_CONVERT('P',"$FORM{pname}") if $FORM{'yousai'};
		&DBM_CONVERT('P',"$FORM{pname}",'VS',"$FORM{vsname}") if !$FORM{'yousai'};
		&DBM_CONVERT('C',"$PL_VALUES[5]",'VC',"$VS_VALUES[5]") if !$FORM{'yousai'};
		&DBM_CONVERT('C',"$PL_VALUES[5]",'VC',"$FORM{'vsname'}") if $FORM{'yousai'};
	&UNLOCK;

	if ($FORM{'yousai'}){
			if(!$PL_VALUES[28]){$M_AITE="$CL_VALUE2[6]";}
			elsif($PL_VALUES[28] eq "$CL_VALUE2[2]" && $CL_VALUE2[2]){$M_AITE="$CL_VALUE2[8]";}
			elsif($PL_VALUES[28] eq "$CL_VALUE2[3]" && $CL_VALUE2[3]){$M_AITE="$CL_VALUE2[9]";}
			elsif($PL_VALUES[28] eq "$CL_VALUE2[4]" && $CL_VALUE2[4]){$M_AITE="$CL_VALUE2[10]";}
			&ERROR('已经被别国进行攻略') if $M_AITE ne "$VS_Country";
			&ERROR('超过作战期限') if time > $CL_VALUES[7];
			&ERROR('这个国家已经灭亡了') if !@VC_VALUES;

		@Y_HP=split(/!/,$VC_VALUES[11]);
		@Y_ST=split(/!/,$VC_VALUES[12]);$Y_ST[0]+=50;$Y_ST[1]+=50;$Y_ST[2]+=50;
	@VS_VALUES=("300","$Y_HP[2]!0","","$Y_ST[3]","AL","$FORM{'vsname'}","99","","0","zzzz","zzzz","zzzz","6","$VC_VALUES[0]","0","$Y_HP[0]","$Y_HP[1]","9999","9999","$Y_ST[0]","$Y_ST[1]","0","$Y_ST[2]","99","999","0","$DATE","1000","0","99","0");
	}

	&REPAIR(PL);&REPAIR(VS);
	if (@CL_VALUES){$PL_Country="$PL_VALUES[5]";}else{$PL_Country='流浪者';$CL_VALUES[0]='#808080';}
	if (@VC_VALUES){$VS_Country="$VS_VALUES[5]";}else{$VS_Country='流浪者';$VC_VALUES[0]='#808080';}

	&ERROR('SystemError','系统时间发生问题') if $FORM{'check'} < $PL_VALUES[26];
	&ERROR('Repair','之前的战斗还在计算之中，你不能同时进行两次战斗') if $PL_VALUES[25] || $VS_VALUES[25];
require "./$LOG_FOLDER/_ex.data";
local($PL_WN,$PL_WLV,$PL_WEX) = split(/!/,$PL_VALUES[9]);
local($VS_WN,$VS_WLV,$VS_WEX) = split(/!/,$VS_VALUES[9]);
require "./$LOG_FOLDER/$HASH_DATA";
@PEX_sA=split(/\,/,$WEAPONEX_LIST{"$PL_WEX"});
@VEX_sA=split(/\,/,$WEAPONEX_LIST{"$VS_WEX"});
if (!$PL_WEX){$PEX_sA[1]="a";}
@Pl_W=split(/\,/,$WEAPON_LIST{"$PL_WN"});
@Vs_W=split(/\,/,$WEAPON_LIST{"$VS_WN"});
$plbs=int ($PL_VALUES[20]+4) if $Pl_W[7] =~ m/4/;
$vsbs=int ($VS_VALUES[20]+4) if $Vs_W[7] =~ m/4/;
$Pl_AttPoint=int($Pl_W[1]*(($PL_WLV*0.0001)+1)*(($PL_VALUES[29]/1000)+1));
if ($PEX_sA[1] eq "b"){$Pl_AttPoint=int($Pl_AttPoint*0.7);}
if ($PEX_sA[1] eq "c"){$Pl_AttPoint=int($Pl_AttPoint*1.3);}
if ($PEX_sA[1] eq "d"){$Pl_AttPoint=int($Pl_AttPoint*1.5);}
if ($PEX_sA[1] eq "e"){$Pl_AttPoint=int($Pl_AttPoint*1.2);}
	&ERROR('NeiLuanError','内乱必须在国内展开') if (($FORM{'b_mode'} eq '内乱') && ($PL_VALUES[5] != $VS_VALUES[5]));
	local($PL_WN,$PL_WLV) = split(/!/,$PL_VALUES[9]);
	local($VS_WN,$VS_WLV) = split(/!/,$VS_VALUES[9]);
	require "$LOG_FOLDER/$HASH_DATA";
	@Pl_W=split(/\,/,$WEAPON_LIST{"$PL_WN"});
	@Vs_W=split(/\,/,$WEAPON_LIST{"$VS_WN"});
local($PL_BG,$PL_BGT) = split(/!/,$PL_VALUES[41]);
local($VS_BG,$VS_BGT) = split(/!/,$VS_VALUES[41]);
require "./$LOG_FOLDER/_bougu.data"; 
@Pl_B=split(/\,/,$BOUGU_LIST{"$PL_BG"});
@Vs_B=split(/\,/,$BOUGU_LIST{"$VS_BG"});
	$Pl_W[3] = int (rand ($Pl_W[3]))+1 if $Pl_W[7] =~ m/9/;
	$Vs_W[3] = int (rand ($Vs_W[3]))+1 if $Vs_W[7] =~ m/9/;
	$plbs=int ($PL_VALUES[20]+7) if $Pl_W[7] =~ m/4/;
	$vsbs=int ($VS_VALUES[20]+7) if $Vs_W[7] =~ m/4/;
	$plbs=int ($PL_VALUES[20]+65) if ($Pl_W[7] =~ m/5/)&&($Vs_W[7] !~ m/c/);
	$vsbs=int ($VS_VALUES[20]+65) if ($Vs_W[7] =~ m/5/)&&($Pl_W[7] !~ m/c/);
	$plbs=int ($PL_VALUES[20]+160) if ($Pl_W[7] =~ m/h/)&&($Vs_W[7] !~ m/c/);
	$vsbs=int ($VS_VALUES[20]+160) if ($Vs_W[7] =~ m/h/)&&($Pl_W[7] !~ m/c/);
	$plbs=int ($PL_VALUES[20]+500) if ($Pl_W[7] =~ m/h/)&&($Vs_W[7] !~ m/7/);
	$vsbs=int ($VS_VALUES[20]+500) if ($Vs_W[7] =~ m/h/)&&($Pl_W[7] !~ m/7/);
	$plbs=int ($PL_VALUES[20]+5000) if ($Pl_W[7] =~ m/b/)&&($Vs_W[7] !~ m/c/);
	$vsbs=int ($VS_VALUES[20]+5000) if ($Vs_W[7] =~ m/b/)&&($Pl_W[7] !~ m/c/);
	$Pl_AttPoint=int($Pl_W[1]*(($PL_WLV*0.0001)+1));
$Pl_SpPoint=$PL_VALUES[21]-$Pl_B[2];$Pl_DefPoint=($PL_VALUES[20]+$plbs+$Pl_B[1])*2-int($VS_VALUES[19]/3+$Vs_B[4]);$Pl_MisPoint=$PL_VALUES[22]+$Pl_B[3];
	$Pl_Kaikyu=&RANK($PL_VALUES[0],$PL_VALUES[5],$PL_VALUES[6]);
	$pwl=int $PL_WLV/$WEAPON_LVUP;$Pl_WeaponNameA="$Pl_W[0](Level.$pwl)";
if ($PEX_sA[1] eq "e"){int($Pl_W[4]*=1.2);}
if ($PEX_sA[1] eq "f"){int($Pl_W[4]*=0.8);}
if ($VEX_sA[1] eq "e"){int($Vs_W[4]*=1.2);}
if ($VEX_sA[1] eq "f"){int($Vs_W[4]*=0.8);}
	&ERROR('noEnergy','EN不足') if $PL_VALUES[17] < $Pl_W[4];
	$Vs_AttPoint=int($Vs_W[1]*(($VS_WLV*0.0001)+1));
if ($VEX_sA[1] eq "b"){$Vs_AttPoint=int($Vs_AttPoint*0.7);}
if ($VEX_sA[1] eq "c"){$Vs_AttPoint=int($Vs_AttPoint*1.3);}
if ($VEX_sA[1] eq "d"){$Vs_AttPoint=int($Vs_AttPoint*1.5);}
if ($VEX_sA[1] eq "e"){$Vs_AttPoint=int($Vs_AttPoint*1.2);}
if ($VEX_sA[1] eq "f"){$Vs_AttPoint=int($Vs_AttPoint*0.8);}
$Vs_SpPoint=$VS_VALUES[21]-$Vs_B[2];$Vs_DefPoint=($VS_VALUES[20]+$vsbs+$Vs_B[1])*2-int($PL_VALUES[19]/3+$Pl_B[4]);$Vs_MisPoint=$VS_VALUES[22]+$Vs_B[3];	$Vs_Kaikyu=&RANK($VS_VALUES[0],$VS_VALUES[5],$VS_VALUES[6]);
	$vwl=int $VS_WLV/$WEAPON_LVUP;$Vs_WeaponNameA="$Vs_W[0](Level.$vwl)";
	$Pl_SpPoint=int ($Pl_SpPoint*1.5) if $Pl_W[7] =~ m/3/;
	$Vs_SpPoint=int ($Vs_SpPoint*1.5) if $Vs_W[7] =~ m/3/;
if ($PEX_sA[1] eq "b"){$Pl_SpPoint=int($Pl_SpPoint*1.2);}
if ($PEX_sA[1] eq "c"){$Pl_SpPoint=int($Pl_SpPoint*0.8);}
if ($PEX_sA[1] eq "d"){$Pl_SpPoint=int($Pl_SpPoint*0.6);}
if ($VEX_sA[1] eq "b"){$Vs_SpPoint=int($Vs_SpPoint*1.2);}
if ($VEX_sA[1] eq "c"){$Vs_SpPoint=int($Vs_SpPoint*0.8);}
if ($VEX_sA[1] eq "d"){$Vs_SpPoint=int($Vs_SpPoint*0.6);}#--- 13
	$Pl_SpPoint=int ($Pl_SpPoint*1.25) if $Pl_W[7] =~ m/6/;
	$Vs_SpPoint=int ($Vs_SpPoint*1.25) if $Vs_W[7] =~ m/6/;
	if ($PL_VALUES[16] > 50000){$Pl_SpPoint-=int(($PL_VALUES[16]-50000)/5000);}
	if ($VS_VALUES[16] > 50000){$Vs_SpPoint-=int(($VS_VALUES[16]-50000)/5000);}
	&SYUSEI('m',"$FORM{'mode'}",'Pl');
	$VsMsnNo=int(rand(8)+1);
	&SYUSEI('m',"$VsMsnNo",'Vs');
	&SYUSEI('s',"$PL_VALUES[12]",'Pl');
	&SYUSEI('s',"$VS_VALUES[12]",'Vs');
$Pl_W[1] = int ($Pl_W[1] + $Vs_W[1]*0.5) if $Pl_W[7] =~ m/e/;
$Vs_W[1] = int ($Vs_W[1] + $Pl_W[1]*0.5) if $Vs_W[7] =~ m/e/;
$Vs_W[1] = int ($Vs_W[1]*0.5) if $Pl_W[7] =~ m/e/;
$Pl_W[1] = int ($Pl_W[1]*0.5) if $Vs_W[7] =~ m/e/;
$Pl_SpPoint=int ($Vs_SpPoint*0.8) if $Pl_W[7] =~ m/e/;
$Vs_SpPoint=int ($Pl_SpPoint*0.8) if $Vs_W[7] =~ m/e/;
	$Pl_Times=$Vs_Times=0;	$Pl_Check=$Vs_Check=1;
	$hImg="<img src=\"$IMG_FOLDER1/hit.gif\">";
	$mImg="<img src=\"$IMG_FOLDER1/miss.gif\">";

	for ($Plt=1;$Plt < 100; $Plt++ ){
		$Pl_Initiative=$Pl_SpPoint+int(rand(30));$Vs_Initiative=$Vs_SpPoint+int(rand(30));
		if($Pl_Initiative >= $Vs_Initiative){$Initiative=1;}else{$Initiative=0;}
		if($VS_W >= $Vs_W[3] && $PL_W >= $Pl_W[3]){last;}
		if ($Vs_AtPoint < $PL_VALUES[15] && $PL_W < $Pl_W[3] && ($Initiative || $VS_W >= $Vs_W[3])){
			$Pl_Check=int(rand(100)+$Vs_SpPoint/2-$Pl_MisPoint/2);$PL_W++;
			if ($Pl_Check < $Pl_W[2]){$PlResult.="$hImg";$Pl_Times++;
				$Pl_AtPoint=$Pl_AtPoint+int($Pl_AttPoint-int($Vs_DefPoint*(int(rand(50)+90))/$Pl_W[3]));
			}elsif ($Pl_Check >= $Pl_W[2]) {$PlResult.="$mImg";}
		unless($PL_W % 10){$PlResult.="<br>\n";}
		next;
		}
		if ($Pl_AtPoint < $VS_VALUES[15] && $VS_W < $Vs_W[3] && (!$Initiative || $PL_W >= $Pl_W[3])){
			$Vs_Check=int(rand(100)+$Pl_SpPoint/2-$Vs_MisPoint/2);$VS_W++;
			if ($Vs_Check < $Vs_W[2]){$VsResult.="$hImg";$Vs_Times++;
				$Vs_AtPoint=$Vs_AtPoint+int($Vs_AttPoint-int($Pl_DefPoint*(int(rand(50)+90))/$Vs_W[3]));
			}elsif ($Vs_Check >= $Vs_W[2]){$VsResult.="$mImg";}
		unless($VS_W % 10){$VsResult.="<br>\n";}
		next;
		}
	}
$Event_hissatu=int(rand(115))+1;
		if ($Pl_Check < $Pl_W[2]){
		if ($Event_hissatu == 1){($ResultTag.= "<font color=$CL_VALUES[0]>$FORM{'pname'} 奋力一击</font><br>\n");$Pl_AtPoint=int($Pl_AtPoint*2);}
		if ($Event_hissatu == 2){($ResultTag.= "<font color=$CL_VALUES[0]>$FORM{'pname'} 说「阁下的攻击是无效的！」</font><br>\n");$Vs_AtPoint=int($Vs_AtPoint*0.2);}
		if ($Event_hissatu == 3){($ResultTag.= "<font color=$CL_VALUES[0]>$FORM{'pname'} 说「阁下的攻击已经被我看穿了」</font><br>\n");$Pl_AtPoint=int($Pl_AtPoint+$Vs_AtPoint/100);}
		if ($Event_hissatu == 4){($ResultTag.= "<font color=$CL_VALUES[0]>$FORM{'pname'} 虚弱的攻击！</font><br>\n");$Pl_AtPoint=int($Pl_AtPoint*0.5);}
		if (($Event_hissatu==5)&&($PL_VALUES[5])){($ResultTag.= "<font color=$CL_VALUES[0]><B>$PL_VALUES[5]要塞支援攻击<B></font><br>\n");$Pl_AtPoint=int($Pl_AtPoint*5);}
		if (($Event_hissatu==6)&&($VS_VALUES[5])){($ResultTag.= "<font color=$VC_VALUES[0]><B>$VS_VALUES[5] 干扰对方行动</B></font><br>\n");$Pl_AtPoint=int($Pl_AtPoint*0.001);}
		if ($Event_hissatu == 7){($ResultTag.= "<font color=$PL_VALUES[13]>$FORM{'pname'} 使用必杀！<br><b>$PL_VALUES[39]</b></font><br>\n");$Pl_AtPoint=int($Pl_AtPoint*3);}
		if ($Event_hissatu == 8){($ResultTag.= "<font color=$CL_VALUES[0]>$FORM{'pname'} 偷取钱财！！！！(嘘)</font><br>\n");$Pl_AtPoint=int($Pl_AtPoint*0.5);}
		if ($Event_hissatu == 9){($ResultTag.= "<font color=$CL_VALUES[0]>呵呵$FORM{'vsname'} 来做一个饭前运动好了！</font><br>\n");$Pl_AtPoint=int($Pl_AtPoint*1.2);}
		if ($Event_hissatu == 10){($ResultTag.= "<font color=$CL_VALUES[0]>$FORM{'pname'} 捡到了一块大金子！</font><br>\n");$PL_VALUES[8]+=201760}
		if (($Event_hissatu==11)&&($PL_VALUES[5])){($ResultTag.= "<font color=$CL_VALUES[0]><B>$PL_VALUES[5] 基地的补给物资到了<br>$FORM{'pname'}的EN回复<B></font><br>\n");$PL_VALUES[17]+=50000}
		if ($Event_hissatu == 12){($ResultTag.= "<font color=$CL_VALUES[0]>$FORM{'pname'} 一击入魂,熟练度上升</font><br>\n");$PL_VALUES[24]+=30}
		if ($Event_hissatu == 13){($ResultTag.= "<font color=$CL_VALUES[0]>$FORM{'pname'} 的钱掉了一些</font><br>\n");$PL_VALUES[8]-=50300;if($PL_VALUES[8] < 0){$PL_VALUES[8] = 0}}
		if ($Event_hissatu == 14){($ResultTag.= "<font color=$CL_VALUES[0]>$FORM{'pname'} 被打昏，熟练下降一点!</font><br>\n");$PL_VALUES[24]-=10;if($PL_VALUES[24] < 0){$PL_VALUES[24] = 0}}
		if ($Event_hissatu == 15){($ResultTag.= "<font color=$CL_VALUES[0]>$FORM{'pname'} 基地送来的补给物资！HP回复</font><br>\n");$PL_VALUES[15]+=9999999}
		if ($Event_hissatu == 16){($ResultTag.= "<font color=$PL_VALUES[13]>$FORM{'pname'} 使用超必杀。。<br><b>$PL_VALUES[38]</b></font><br>\n");$Pl_AtPoint=int($Pl_AtPoint*4.5);}
		if ($Event_hissatu == 17){($ResultTag.= "<font color=$CL_VALUES[0]>$FORM{'pname'} 取出自己的光束剑，挡住对方的攻击</font><br>\n");$VS_AtPoint=int($VS_AtPoint*0.00001);}
		if ($Event_hissatu == 18){($ResultTag.= "<font color=$PL_VALUES[13]>$FORM{'pname'} 发现一块稀有矿石-EN上限提升 @_@ </font><br>\n");if($PL_VALUES[18] < 10000){$PL_VALUES[18]+=3}}
		if ($Event_hissatu == 19){($ResultTag.= "<font color=$PL_VALUES[13]>$FORM{'pname'} 救出一位神秘科学家，为了报答你，帮你改造装甲，HP上限提升 @_@ </font><br>\n");if($PL_VALUES[16] < 100000){$PL_VALUES[16]+=10}}
		if ($Event_hissatu == 20){($ResultTag.= "<font color=$PL_VALUES[13]>$FORM{'pname'} 的装甲被对方击破，HP上限减少 *_* </font><br>\n");$PL_VALUES[16]-=5}
		if ($Event_hissatu == 21){($ResultTag.= "<font color=$PL_VALUES[13]>$FORM{'pname'} 的能源装置被对方击穿，能源上限减少</font><br>\n");$PL_VALUES[18]-=1}
}


	$Event_vshissatu=int(rand(115))+1;
		if ($Vs_Check < $Vs_W[2]){
		if ($Event_vshissatu == 1){($ResultTag.= "<font color=$VC_VALUES[0]>$FORM{'vsname'} 奋力一击</font><br>\n");$Vs_AtPoint=int($Vs_AtPoint*2);}
		if ($Event_vshissatu == 2){($ResultTag.= "<font color=$VC_VALUES[0]>$FORM{'vsname'}「阁下的攻击是无效的！」说道！</font><br>\n");$Pl_AtPoint=int($Pl_AtPoint*0.2);}
		if ($Event_vshissatu == 3){($ResultTag.= "<font color=$VC_VALUES[0]>$FORM{'vsname'}「阁下的攻击已经被我看穿了」叫道</font><br>\n");$Vs_AtPoint=int($Vs_AtPoint+$Pl_AtPoint/100);}
		if ($Event_vshissatu == 4){($ResultTag.= "<font color=$VC_VALUES[0]>$FORM{'vsname'} 虚弱的攻击！</font><br>\n");$Vs_AtPoint=int($Vs_AtPoint*0.5);}
  		if (($Event_vshissatu==5)&&($VS_VALUES[5])){($ResultTag.= "<font color=$VC_VALUES[0]><B>$VS_VALUES[5]要塞支援攻击<B></font><br>\n");$Vs_AtPoint=int($Vs_AtPoint*5);}
		if (($Event_vshissatu==6)&&($PL_VALUES[5])){($ResultTag.= "<font color=$CL_VALUES[0]><B>$PL_VALUES[5] 干扰对方行动</B></font><br>\n");$Vs_AtPoint=int($Vs_AtPoint*0.001);}
    		if ($Event_vshissatu == 7){($ResultTag.= "<font color=$VS_VALUES[13]>$FORM{'vsname'} 使用必杀!<br><b>$VS_VALUES[39]</b></font><br>\n");$Vs_AtPoint=int($Vs_AtPoint*3);}
		if ($Event_vshissatu == 8){($ResultTag.= "<font color=$VC_VALUES[0]>$FORM{'vsname'} $FORM{'pname'}(嘘）</font><br>\n");$Vs_AtPoint=int($Vs_AtPoint*0.5);}
		if ($Event_vshissatu == 9){($ResultTag.= "<font color=$VC_VALUES[0]>好像$FORM{'pname'} 的什麽东西少了一些？</font><br>\n");$Vs_AtPoint=int($Vs_AtPoint*1.2);}
		if ($Event_vshissatu == 10){($ResultTag.= "<font color=$VC_VALUES[0]>$FORM{'vsname'} 捡到了一块大金子！</font><br>\n");$VS_VALUES[8]+=207600}
	  	if (($Event_vshissatu==11)&&($VS_VALUES[5])){($ResultTag.= "<font color=$VC_VALUES[0]><B>$VS_VALUES[5] 基地的补给物资到了<br>$FORM{'vsname'}  EN回复<B></font><br>\n");$VS_VALUES[17]+=50000}
		if ($Event_vshissatu == 12){($ResultTag.= "<font color=$VC_VALUES[0]>$FORM{'vsname'} 强行击破, 熟练度上升</font><br>\n");$VS_VALUES[24]+=30}
		if ($Event_vshissatu == 13){($ResultTag.= "<font color=$VC_VALUES[0]>$FORM{'vsname'} 钱丢了???</font><br>\n");$VS_VALUES[8]-=59020;if($VS_VALUES[8] < 0){$VS_VALUES[8] = 0}}
		if ($Event_vshissatu == 14){($ResultTag.= "<font color=$VC_VALUES[0]>$FORM{'vsname'} 被打昏，熟练下降一点！</font><br>\n");$VS_VALUES[24]-=10;if($VS_VALUES[24] < 0){$VS_VALUES[24] = 0}}
		if ($Event_vshissatu == 15){($ResultTag.= "<font color=$VC_VALUES[0]>$FORM{'vsname'} 基地送来的补给物资！HP回复</font><br>\n");$VS_VALUES[15]+=9999999}
	  	if ($Event_vshissatu == 16){($ResultTag.= "<font color=$VS_VALUES[13]>$FORM{'vsname'} 使用超必杀。。<br><b>$VS_VALUES[38]</b></font><br>\n");$Vs_AtPoint=int($Vs_AtPoint*4.5);}
	  	if ($Event_vshissatu == 17){($ResultTag.= "<font color=$VC_VALUES[0]>$FORM{'vsname'} 拿出自己的光束剑，挡住你的攻击</font><br>\n");$Pl_AtPoint=int($Pl_AtPoint*0.000001);}
		if ($Event_vshissatu == 18){($ResultTag.= "<font color=$VS_VALUES[13]>$FORM{'vsname'} 发现一块稀有矿石-EN上限提升 @_@ </font><br>\n");if($VS_VALUES[18] < 10000){$VS_VALUES[18]+=3}}
		if ($Event_hissatu == 19){($ResultTag.= "<font color=$VS_VALUES[13]>$FORM{'vsname'} 救出一位神秘科学家，为了报答你，帮你改造装甲，HP上限提升 @_@ </font><br>\n");if($VS_VALUES[16] < 100000){$VS_VALUES[16]+=10}}
		if ($Event_hissatu == 20){($ResultTag.= "<font color=$VS_VALUES[13]>$FORM{'vsname'} 的装甲被对方击破，HP上限减少 *_* </font><br>\n");$VS_VALUES[16]-=5}
		if ($Event_hissatu == 21){($ResultTag.= "<font color=$VS_VALUES[13]>$FORM{'vsname'} 的能源装置被对方击穿，能源上限减少</font><br>\n");$VS_VALUES[18]-=1}
	}
	$Pl_AtPoint=0 if $Pl_AtPoint < 0;
	$Vs_AtPoint=0 if $Vs_AtPoint < 0;
	$dmgStyl="style=\"font-size:21px;color:#9acd32;\"";
	$chaStyl="style=\"font-size:12px;color:#dc143c;\"";
	$PlsumDmg="<b $dmgStyl>$Pl_W[3]</b> <b $chaStyl>次攻击</b>  <b $chaStyl>击中了</b> <b $dmgStyl>$Pl_Times</b> <b $chaStyl>次</b>
		<b $dmgStyl>$Pl_AtPoint</b><b $chaStyl> 的破坏</b>" if $Pl_Times > 0;
	$PlsumDmg='<font color=#6a5acd>Miss</font>' if $Pl_Times == 0;
	$VssumDmg="<b $dmgStyl>$Vs_W[3]</b> <b $chaStyl>次攻击</b> <b $chaStyl>击中了</b> <b $dmgStyl>$Vs_Times</b> <b $chaStyl>次</b>
		<b $dmgStyl>$Vs_AtPoint</b><b $chaStyl> 的破坏</b>" if $Vs_Times > 0;
	$VssumDmg='<font color=#6a5acd>Miss</font>' if $Vs_Times == 0;
	$Pl_BfrHP=$PL_VALUES[15];
	$Vs_AtPoint=$PL_VALUES[15] if $PL_VALUES[15] < $Vs_AtPoint;
	$PL_VALUES[15]=$PL_VALUES[15]-$Vs_AtPoint;
	$Pl_width_per=$PL_VALUES[16]/150;
	$Pl_width_hp=int($PL_VALUES[15]/$Pl_width_per);
	$Pl_width_zen=int(($PL_VALUES[16]-$Pl_BfrHP)/$Pl_width_per);
	$Pl_width_dmg=int($Vs_AtPoint/$Pl_width_per);
	$PL_HPTAG="<img src=\"$IMG_FOLDER1/hp.gif\" hspace=0 height=7 width=$Pl_width_hp>" if $Pl_width_hp;
	$PL_HPTAG.="<img src=\"$IMG_FOLDER1/dmg.gif\" hspace=0 height=7 width=$Pl_width_dmg>" if $Pl_width_dmg;
	$PL_HPTAG.="<img src=\"$IMG_FOLDER1/zen.gif\" hspace=0 height=7 width=$Pl_width_zen>" if $Pl_width_zen;
	$Vs_BfrHP=$VS_VALUES[15];
	$Pl_AtPoint=$VS_VALUES[15] if $VS_VALUES[15] < $Pl_AtPoint;
	$VS_VALUES[15]=$VS_VALUES[15]-$Pl_AtPoint;
	$Vs_width_per=$VS_VALUES[16]/150;
	$Vs_width_hp=int($VS_VALUES[15]/$Vs_width_per);
	$Vs_width_zen=int(($VS_VALUES[16]-$Vs_BfrHP)/$Vs_width_per);
	$Vs_width_dmg=int($Pl_AtPoint/$Vs_width_per);
	$VS_HPTAG="<img src=\"$IMG_FOLDER1/hp.gif\" hspace=0 height=7 width=$Vs_width_hp>" if $Vs_width_hp;
	$VS_HPTAG.="<img src=\"$IMG_FOLDER1/dmg.gif\" hspace=0 height=7 width=$Vs_width_dmg>" if $Vs_width_dmg;
	$VS_HPTAG.="<img src=\"$IMG_FOLDER1/zen.gif\" hspace=0 height=7 width=$Vs_width_zen>" if $Vs_width_zen;
WORL:{
	$VS_VALUES[15] == 0 && $PL_VALUES[15] > 0 && do{
		$ResultBattle=0;
		$PL_In[0]=int (rand(5)+8);$VS_In[0]=int (rand(2)+2);
		$PL_In[1]=3;$VS_In[1]=-2;
		$PL_In[2]=int(rand(200)+400)+((250-$PL_VALUES[29])*$GET_MONEY);
		$VS_In[2]=int(rand(200)+400)+((250-$VS_VALUES[29])*int($GET_MONEY/3));
		$PL_VALUES[24]++;$VS_VALUES[25]=1;
		($PL_VALUES[0]=0,$PL_VALUES[5]="$FORM{'boumeiC'}",$B_Com='完成',$PL_VALUES[6]=0)if $FORM{'b_mode'} eq '亡命';
		($PL_VALUES[6]="$VS_VALUES[6]",$PL_VALUES[28]="$VS_VALUES[28]",$VS_VALUES[6]=0,$Vs_KakutokuRank=-120,$VS_VALUES[5]=$VS_VALUES[28]='',$B_Com='完成')
		if $FORM{'b_mode'} eq '内乱';
	last WORL;};
	$PL_VALUES[15] == 0 && $VS_VALUES[15] > 0 && do {
		$ResultBattle=1;
		$PL_In[0]=int (rand(2)+2);$VS_In[0]=int (rand(5)+8);
		$PL_In[1]=-2;$VS_In[1]=3;
		$PL_In[2]=int(rand(200)+400)+((250-$PL_VALUES[29])*int($GET_MONEY/3));
		$VS_In[2]=int(rand(200)+400)+((250-$VS_VALUES[29])*$GET_MONEY);
		$VS_VALUES[24]++;$PL_VALUES[25]=1;
		($PL_In[1]=int($PL_VALUES[0]/-3)*2,$B_Com='失败') if $FORM{'b_mode'} eq '亡命';
		($PL_In[1]=($PL_VALUES[0])*-1,$B_Com='失败') if $FORM{'b_mode'} eq '内乱';
	last WORL;};
	$VS_VALUES[15] > 0 && $PL_VALUES[15] > 0 && do{
		$ResultBattle=2;
		$PL_In[0]=int (rand(3)+4);$VS_In[0]=int (rand(3)+4);
		$PL_In[1]=1;$VS_In[1]=1;
		$PL_In[2]=int(rand(200)+400);$VS_In[2]=int(rand(200)+400);
		($PL_In[1]=int($PL_VALUES[0]/-3)*2,$B_Com='失败') if $FORM{'b_mode'} eq '亡命';
		($PL_In[1]=($PL_VALUES[0])*-1,$B_Com='失败') if $FORM{'b_mode'} eq '内乱';
	last WORL;};
}
	$PL_In[2]=400 if $PL_In[2]<10;$VS_In[2]=400 if $VS_In[2]<1;
	if ($Pl_W[7] =~ m/d/){
        $PL_In[2]=$PL_In[2]*2;
        $VS_In[2]=$VS_In[2]*2;
    }
	$PL_VALUES[0]+=$PL_In[1];
	$VS_VALUES[0]+=$VS_In[1];
	$PL_VALUES[8]+=$PL_In[2];
	$VS_VALUES[8]+=$VS_In[2];
	$PL_VALUES[0]=0   if $PL_VALUES[0] < 0 || !$PL_VALUES[5];
	$PL_VALUES[0]=215 if $PL_VALUES[0] >= 215;
	$PL_VALUES[0]=220 if $PL_VALUES[6] == 1;
	$VS_VALUES[0]=0   if $VS_VALUES[0] < 0 || !$VS_VALUES[5];
	$VS_VALUES[0]=215 if $VS_VALUES[0] >= 215;
	$VS_VALUES[0]=220 if $VS_VALUES[6] == 1;
	$PL_VALUES[17]-=$Pl_W[4] if $Pl_Times;$PL_VALUES[17]=0 if $PL_VALUES[17] < 0;
	$Pl_vs="$VS_VALUES[5]的"if $VS_VALUES[5];$Pl_vs="流浪者的"if !$VS_VALUES[5];
	$Vs_vs="$PL_VALUES[5]的"if $PL_VALUES[5];$Vs_vs="流浪者的"if !$PL_VALUES[5];
local($PL_RETI1,$PL_RE1,$PL_RETI2,$PL_RE2,$PL_RETI3,$PL_RE3) = split(/!/,$PL_VALUES[1]);
local($VS_RETI1,$VS_RE1,$VS_RETI2,$VS_RE2,$VS_RETI3,$VS_RE3) = split(/!/,$VS_VALUES[1]);
$PL_VALUES[1]="$DATE!$Pl_vs$FORM{'vsname'}进行交战." ;$PL_VALUES[26]=time;
$VS_VALUES[1]="$DATE!$Vs_vs$FORM{'pname'}进行交战." ;
$ResultTag.= $Tokusyu;
($ResultTag.="$VS_VALUES[3]大破。<br>",$PL_VALUES[1].="$VS_VALUES[3]大破。",$VS_VALUES[1].="$VS_VALUES[3]大破。")
if $ResultBattle==0;
($ResultTag.="$PL_VALUES[3]大破。<br>",$PL_VALUES[1].="$PL_VALUES[3]大破。",$VS_VALUES[1].="$PL_VALUES[3]大破。")
if $ResultBattle==1;
$PL_VALUES[1].="!".$PL_RETI1."!".$PL_RE1."!".$PL_RETI2."!".$PL_RE2;
$VS_VALUES[1].="!".$VS_RETI1."!".$VS_RE1."!".$VS_RETI2."!".$VS_RE2;
	&HEADER;
	print << "	-----END-----";
	<div align=center>

	<table border=0 bgcolor=#000000 width=100% cellspacing=0 cellpadding=0>
<td align=center width=50% bgcolor="$CL_VALUES[0]" style="color:#000000;font-size:25pt;">
  <table cellpadding=0 cellspacing=0 border=0><tr>
      <td rowspan=2><div align=left><img src=$IMG_FOLDER3/$PL_VALUES[37].gif ></div></td>
      <td rowspan=2><div style="font-size:25px;"><b>$PL_Country</b></div></td>
      <td align=center><font color=#000000 style="font-size:18pt;"><b>$PL_VALUES[3]</b></font></td>
    </tr><tr>
      <td align=center><div style="font-size:12px;">$FORM{'pname'}$Pl_Kaikyu</div></td>
    </tr></table></td>
<td align=center width=50% bgcolor="$VC_VALUES[0]" style="color:#000000;font-size:25pt;">
  <table cellpadding=0 cellspacing=0 border=0><tr>
      <td rowspan=2><div align=left><img src=$IMG_FOLDER3/$VS_VALUES[37].gif ></div></td>
      <td rowspan=2><b><div style="font-size:25px;">$VS_Country</b></div></td>
      <td align=center><font color=#000000 style="font-size:18pt;"><b>$VS_VALUES[3]</b></font></td>
    </tr><tr>
      <td align=center><div style="font-size:12px;">$FORM{'vsname'}$Vs_Kaikyu</div></td>
    </tr>  </table></td></tr><tr>
    <td align=center width=50%><B>$PL_VALUES[31]</B></td>
    <td align=center width=50%><B>$VS_VALUES[31]</B></td></tr>
	<tr><td align=center width=50% height=100 valign=bottom>
		<div align=center><img src=\"$IMG_FOLDER2/$PL_VALUES[27].gif\"></div>
		<div style="font-size:15px;">【$Pl_MsnStyle】</div>
		<table $TBL_TAG1><tr><td style="font-size:15px;"><b>HP</b>&nbsp;</td>
			<td>$PL_HPTAG</td><td width=50 align=right style="font-size:14px;"><span id=cplhp>$Pl_BfrHP</span></td>
			<td style="font-size:14px;">/<b>$PL_VALUES[16]</b></td></tr></table></td>
	<td align=center width=50% height=100 valign=bottom>
		<div align=center><img src=\"$IMG_FOLDER2/$VS_VALUES[27].gif\" style=\"filter:fliph();\"></div>
		<div style="font-size:15px;">【$Vs_MsnStyle】</div>
		<table $TBL_TAG1><tr><td style="font-size:15px;"><b>HP</b>&nbsp;</td>
			<td>$VS_HPTAG</td><td width=50 align=right style="font-size:14px;"><span id=cvshp>$Vs_BfrHP</span></td>
			<td style="font-size:14px;">/<b>$VS_VALUES[16]</b></td></tr></table></td></tr>
	<tr><td align=center valign=top width=40%><font color=#778899 style="font-size:16px;">
			<b>$Pl_WeaponNameA</b></font><div align=center>$PlResult<div align=center>$PlsumDmg<br>
			<b $chaStyl>能源:-$Pl_W[4]</b></div></td>
			<td align=center valign=top width=40%><font color=#778899 style="font-size:16px;">
			<b>$Vs_WeaponNameA</b></font><div align=center>$VsResult<div align=center>$VssumDmg<br>
			<b $chaStyl>能源 :-$Vs_W[4]</b></div></td></tr></table>
	<div style="line-height:4pt;">&nbsp;</div>
		<table><tr><td bgcolor=#000000 style="line-height:18px;font-size:14px;">$ResultTag
	-----END-----

	print << "	-----END-----";
	<script language="JavaScript">
	timeID=10;
		cdplhp=Math.round(($Pl_BfrHP-$PL_VALUES[15])*0.1);
		cdvshp=Math.round(($Vs_BfrHP-$VS_VALUES[15])*0.1);
		flaga=flagb=flagc=0;
		setTimeout(\"HEcount()\",2500);
	function HEcount(){
		cplhp.innerText-=cdplhp;
		cvshp.innerText-=cdvshp;
		if (eval(cplhp.innerText) <= $PL_VALUES[15]){cplhp.innerText='$PL_VALUES[15]';flaga=1;}
		if (eval(cvshp.innerText) <= $VS_VALUES[15]){cvshp.innerText='$VS_VALUES[15]';flagb=1;}
		clearTimeout(timeID);
		if (!flaga || !flagb){timeID = setTimeout(\"HEcount()\",1);}
	}
	</script>
	-----END-----
	$Ch_rank=&RANK($PL_VALUES[0],$PL_VALUES[5],$PL_VALUES[6]);
	if($Ch_rank ne $Pl_Kaikyu && $Ch_rank){
		print "$FORM{'pname'}阁下$Ch_rank变更";
		print $PL_In[1] > 0 ? "升格<br>":$PL_In[1] < 0 ? "降格<br>":"<br>";
	}
	$Ch_rank=&RANK($VS_VALUES[0],$VS_VALUES[5],$VS_VALUES[6]);
	if($Ch_rank ne $Vs_Kaikyu && $Ch_rank){
		print "$FORM{'vsname'}阁下$Ch_rank变更";
		print $VS_In[1] > 0 ? "升格<br>":$PL_In[1] < 0 ? "降格<br>":"<br>";
	}


	$PL_In[4]=$PL_In[0]*($VS_VALUES[0]+1);
	$PL_Ln[8] *= 2 if $Pl_W[7] =~ m/8/;
	$PL_In[4] *= 2 if $Pl_W[7] =~ m/8/;
	$PL_In[0] *= 2 if $Pl_W[7] =~ m/8/;
	$PL_VALUES[30]+=$PL_In[4];
	print "$FORM{'pname'} 阁下得到了 $PL_In[4]的经验 $PL_In[2] 的金钱 $PL_In[0] 的武器经验 <br>";
	print "<LINK href=htmlcn.css rel=stylesheet>";
	if (($PL_VALUES[29]+1)*200 <= $PL_VALUES[30]){
		print "<font color=#f7e957>$FORM{'pname'} 阁下 等级上升</font><br>";
		$PL_VALUES[30]=0;
		$PL_VALUES[29]++;
		sub BONUS{"&nbsp;&nbsp;&nbsp;<font color=#f7e957>$_[0]能力提高了</font><br>";}

		$C=$PL_VALUES[23];$C=4 if $C > 4;
		$StatusMax=('20','30','35','40','50')[$C];

		$BoAt=$BoSp=$BoDe=$BoAg=5;
		if ($PL_VALUES[4] == 1){$BoAt=20;}
		elsif ($PL_VALUES[4] == 2){$BoDe=20;}
		elsif ($PL_VALUES[4] == 3){$BoSp=20;}
		elsif ($PL_VALUES[4] == 4){$BoAg=20;}
		elsif ($PL_VALUES[4] == 0){$BoAt=$BoSp=$BoDe=$BoAg=9;}
		if (rand(22) < $BoAt && $PL_VALUES[19] < $StatusMax){print &BONUS('攻击力');$PL_VALUES[19]++;}
		if (rand(22) < $BoDe && $PL_VALUES[20] < $StatusMax){print &BONUS('防御力');$PL_VALUES[20]++;}
		if (rand(22) < $BoSp && $PL_VALUES[21] < $StatusMax){print &BONUS('灵敏度');$PL_VALUES[21]++;}
		if (rand(22) < $BoAg && $PL_VALUES[22] < $StatusMax){print &BONUS('命中力');$PL_VALUES[22]++;}
	}


	if ($ResultBattle==1){
		sub DOWN{"&nbsp;&nbsp;&nbsp;<font color=#dc143c>机体损坏 $_[0]能力下降</font><br>";}
		$Event=int(rand(200));
		if ($Event == 12 && $PL_VALUES[19] >= 1){print &DOWN('攻击力');$PL_VALUES[19]--;}
		if ($Event == 13 && $PL_VALUES[20] >= 1){print &DOWN('防御力');$PL_VALUES[20]--;}
		if ($Event == 14 && $PL_VALUES[21] >= 1){print &DOWN('敏捷度');$PL_VALUES[21]--;}
		if ($Event == 15 && $PL_VALUES[22] >= 1){print &DOWN('命中力');$PL_VALUES[22]--;}
		if ($Event == 20 && $PL_VALUES[16] >= 5000){print &DOWN('HP');$PL_VALUES[16]=int($PL_VALUES[16]*0.995);}
		if ($Event == 40 && $PL_VALUES[18] >= 100){print &DOWN('EN');$PL_VALUES[18]=int($PL_VALUES[18]*0.995);}
	}

	if (rand(100) <= $GET_WEAPON  && !$ResultBattle && (!$PL_VALUES[10] || !$PL_VALUES[11])){
		my@al=keys %WEAPON_LIST;$alw=@al;
		$alw=int rand($alw);$gw=@al[$alw];$gw='a' if !$gw;
			@q=split(/\,/,$WEAPON_LIST{"$gw"});
		if ($q[5] == 0){
		 if (!$PL_VALUES[10]){$PL_VALUES[10]=$gw;}
		elsif(!$PL_VALUES[11]){$PL_VALUES[11]=$gw;}
		elsif(!$PL_VALUES[35]){$PL_VALUES[35]=$gw;}
		elsif(!$PL_VALUES[36]){$PL_VALUES[36]=$gw;}
		print "<font color=\"#f7e957\">武器获得</font><br>\n";
		}
	}

	if ($PL_VALUES[12] == 6 && $FORM{'mode'} !=1 && rand(255) > 200){$PL_VALUES[12]="$VS_VALUES[12]";}
	elsif($PL_VALUES[12] != 6 && $FORM{'mode'} ==1 && rand(255) > 253){$PL_VALUES[12]='6';}
	#elsif($PL_VALUES[12] != 6 && $FORM{'mode'} ==1){$qiang=rand(255);$PL_VALUES[12]='6' if $qiang=250;$PL_VALUES[12]='7' if $qiang=300;$PL_VALUES[12]='8'; }
	#elsif($PL_VALUES[12] != 6 && $FORM{'mode'} ==1){$qiang=rand(255);$PL_VALUES[12]='6' if $qiang=8;$PL_VALUES[12]='7' if $qiang=4;$PL_VALUES[12]='8' if $qiang=2;}
	$Pl_Drain = 0;$Vs_Drain = 0;
if (($Pl_W[7] =~ m/e/) && rand(100) > 80){
print "<font color=#80ff00>一阵光芒中$VS_VALUES[3]的生命力被吸取了。</font><br>\n";
if($PL_VALUES[16] > $VS_VALUES[15]){
$Pl_Drain = int(rand($VS_VALUES[15]*0.3));
}else{
$Pl_Drain = int(rand($PS_VALUES[16]*0.3));
}
$VS_VALUES[15]-=$Pl_Drain;
$PL_VALUES[15]+=$Pl_Drain;
}
if (($Vs_W[7] =~ m/e/) && rand(100) > 80){
print "<font color=#80ff00>一阵光芒中$PL_VALUES[3]的生命力被吸取了。</font><br>\n";
if($VS_VALUES[16] > $PL_VALUES[15]){
$Vs_Drain = int(rand($PL_VALUES[15]*0.3));
}else{
$Vs_Drain = int(rand($VS_VALUES[16]*0.3));
}
$PL_VALUES[15]-=$Vs_Drain;
$VS_VALUES[15]+=$Vs_Drain;
}
	if ($Vs_W[7] !~ m/a/){if ($Pl_W[7] =~ m/1/){
		if (rand(255) > 240){print "<font color=#8000ff>敌机攻击系统破坏</font><br>\n";$VS_VALUES[19]--;}
		if (rand(255) > 240){print "<font color=#8000ff>敌机防御系统破坏</font><br>\n";$VS_VALUES[20]--;}
		if (rand(255) > 240){print "<font color=#8000ff>敌机回避系统破坏</font><br>\n";$VS_VALUES[21]--;}
		if (rand(255) > 240){print "<font color=#8000ff>敌机命中系统破坏</font><br>\n";$VS_VALUES[22]--;}
	}}
if (($Pl_W[7] =~ m/f/) && $ResultBattle!=0){
print "<font color=#ff0080>$PL_VALUES[3]的自爆装置启动<font><br>\n";$PL_VALUES[25]=1;}
if (($Vs_W[7] =~ m/f/) && $ResultBattle!=0){
print "<font color=#ff0080>$VS_VALUES[3]的自爆装置启动<font><br>\n";$PL_VALUES[25]=1;}
if (($Pl_W[7] =~ m/f/) && $ResultBattle!=0){$VS_VALUES[15]-=$PL_VALUES[15];}
if (($Vs_W[7] =~ m/f/) && $ResultBattle!=0){$VS_VALUES[15]-=$PL_VALUES[15];}
if (($Pl_W[7] =~ m/f/) && $ResultBattle!=0){$PL_VALUES[15]=1;}
if (($Vs_W[7] =~ m/f/) && $ResultBattle!=0){$PL_VALUES[15]=1;}
if (($Pl_W[7] =~ m/f/) && 0 > $VS_VALUES[15]){print "<font color=#ff0080>$VS_VALUES[3]被卷入爆炸中!!</font><br>\n";$VS_VALUES[25]=1;}
if (($Vs_W[7] =~ m/f/) && 0 > $VS_VALUES[15]){print "<font color=#ff0080>$VS_VALUES[3]被卷入爆炸中!!</font><br>\n";$VS_VALUES[25]=1;}
if (($Pl_W[7] =~ m/f/) && 0 > $VS_VALUES[15]){$VS_VALUES[15]=1;}
if (($Vs_W[7] =~ m/f/) && 0 > $VS_VALUES[15]){$VS_VALUES[15]=1;}
	if (($Pl_W[7] =~ m/2/) && rand(255) > 240){print "<font color=#ff0080>$VS_VALUES[3]战斗不能</font><br>\n";$VS_VALUES[25]=1;}
	if (($Vs_W[7] =~ m/2/) && rand(255) > 240){print "<font color=#ff0080>$PL_VALUES[3]战斗不能</font><br>\n";$VS_VALUES[25]=1;}

	$WLDUMMYpl=$PL_WLV;$PL_WLV+=$PL_In[0] if $PL_WLV < $MAX_WEAPONLV*100;
	$WLDUMMYvs=$VS_WLV;$VS_WLV+=$VS_In[0] if $VS_WLV < $MAX_WEAPONLV*100;
	$PL_WLV=$MAX_WEAPONLV*100 if $PL_WLV > $MAX_WEAPONLV*100;
	$VS_WLV=$MAX_WEAPONLV*100 if $VS_WLV > $MAX_WEAPONLV*100;

	if(int($PL_WLV/$WEAPON_LVUP) > int($WLDUMMYpl/$WEAPON_LVUP) && $PL_WLV < $MAX_WEAPONLV*100){
		print "<font color=#f7e957>$FORM{'pname'}的$Pl_W[0]等级提升了</font><br>\n";
		$PL_VALUES[14]=$PL_VALUES[14]-$WEAPON_LVUP;
	}
	if(int($VS_WLV/$WEAPON_LVUP) > int($WLDUMMYvs/$WEAPON_LVUP) && $VS_WLV < $MAX_WEAPONLV*100){
		print "<font color=#f7e957>$FORM{'vsname'}的$Vs_W[0]等级提升了</font><br>\n";
		$VS_VALUES[14]=$VS_VALUES[14]-$WEAPON_LVUP;
	}
		$PL_VALUES[9]="$PL_WN!$PL_WLV";
		$VS_VALUES[9]="$VS_WN!$VS_WLV";
if($PL_VALUES[41] && rand(50)>38){
if ($PL_BGT>1){$TAI_p=$PL_BGT-=1;$PL_VALUES[41]="$PL_BG!$TAI_p";
}else{print "装備的辅助装置被破坏了！";$PL_VALUES[41]="";}
}
if($VS_VALUES[41] && rand(50)>38){
if ($VS_BGT>1){$TAI_v=$VS_BGT-=1;$VS_VALUES[41]="$VS_BG!$TAI_v";
}else{print "敌人的辅助装置被破坏了！";$VS_VALUES[41]="";}
}
$PL_VALUES[9]="$PL_WN!$PL_WLV!$PEX_sA[1]";#--- 14
$VS_VALUES[9]="$VS_WN!$VS_WLV!$VEX_sA[1]";#--- 15
	$TheEnd=1 if $FORM{'yousai'} && !$ResultBattle;
	$VC_VALUES[11]="$VS_VALUES[15]!$Y_HP[1]!$DATE" if $FORM{'yousai'};
	if(!$ResultBattle && $PL_VALUES[5]){$CL_VALUES[1]+=$VS_VALUES[0]+20;$CL_VALUES[1]+=5000 if $TheEnd==1;}
	elsif($ResultBattle && $PL_VALUES[5]){$CL_VALUES[1]+=int(($VS_VALUES[0]+20)/3);}
	$CL_VALUES[1]+=$VS_VALUES[0]+20;
	$CL_VALUES[1]='99999' if $CL_VALUES[1] > 99999;
$PL_VALUES[32]++;
if ($VS_VALUES[15] < 1){$PL_VALUES[33]++;}

	if ($FORM{'b_mode'} eq '内乱' || $FORM{'b_mode'} eq "亡命"){print "$FORM{'b_mode'}$B_Com<br>\n";}
### 内乱组织费
	if ($FORM{'b_mode'} eq '内乱'){
		print "内乱组织费$NAIRAN_MONEY花费";
		$PL_VALUES[8]-=$NAIRAN_MONEY;
	}###内乱限制费
### add end
	&LOCK;
	dbmopen (%PL,"$DBM_P",0666);
		$PL{"$FORM{'pname'}"}="@PL_VALUES";
		$PL{"$FORM{'vsname'}"}="@VS_VALUES" if !$FORM{'yousai'};
	dbmclose %PL;
	if (($FORM{'b_mode'} eq '内乱' && $B_Com && $PL_VALUES[6] == 1) || $TheEnd){
		dbmopen (%DH,"$DBM_H",0666);
			$DH{"$DATE"}="$PL_VALUES[5] 内乱爆发 $FORM{'pname'} 掌握了完全指挥权$FORM{'vsname'}下野$FORM{'pname'}革命" if $B_Com;
			$DH{"$DATE"}="$FORM{'vsname'}防卫要塞陷落$VS_Country灭亡" if $TheEnd;
		dbmclose %DH;
	}
	if ($PL_Country ne '流浪者' && !$FORM{'b_mode'}){
		dbmopen (%CL,"$DBM_C",0666);
			$CL{"$PL_Country"}="@CL_VALUES" if $CL{"$PL_Country"} && $PL_Country ne '流浪者';
			$CL{"$VS_Country"}="@VC_VALUES" if $FORM{'yousai'} && !$TheEnd;
			delete $CL {"$VS_Country"} if $CL{"$VS_Country"} && $TheEnd;
		dbmclose %CL;
	}
	&UNLOCK;

	print << "	END_OF_HTML";
	</td></tr></table><table border=0 cellspacing=0>
	<form action=$MAIN_SCRIPT method=POST target=Main>
	<input type=hidden name=cmd value=MAIN_FRAME>
	<input type=hidden name=pname value=$FORM{'pname'}>
	<input type=hidden name=pass value=$FORM{'pass'}><tr><td>
	<input class=buttonA value="" onmouseover="value='返回';" style="BACKGROUND-IMAGE: url(img/button2.jpg)" onClick=\"parent.Sub.location.replace(\'$MAIN_SCRIPT?LOGO\');\" onmouseout="value='';" type=submit>
	</td></form>
	END_OF_HTML



}

sub SYUSEI{
		$AT="$_[2]_AttPoint";$DE="$_[2]_DefPoint";$SP="$_[2]_SpPoint";
	if($_[0] eq 'm'){
		$MsnStyle="$_[2]_MsnStyle";
		if   ($_[1] == 1){$$MsnStyle="普通攻击";}
		elsif($_[1] == 2){$$AT*=1.3;$$DE*=0.7;$$MsnStyle="突击";}
		elsif($_[1] == 3){$$AT*=0.8;$$DE*=2;$$MsnStyle="防御";}
		elsif($_[1] == 4){$$AT*=0.7;$$SP*=2;$$MsnStyle="防守反击";}
		elsif($_[1] == 5){$$DE*=0.8;$$MsnStyle="狙击";
			$Pl_W[2]+=20 if $_[2] eq 'Pl';$Vs_W[2]+=20 if $_[2] eq 'Vs';
		}elsif($_[1] == 6){$$AT*=2;$$DE/=5;$$MsnStyle="舍身";}
		elsif($_[1] == 7){$$AT*=0.9;$$SP*=3;$$MsnStyle="见切";
			$Pl_W[2]+=10 if $_[2] eq 'Pl';$Vs_W[2]+=10 if $_[2] eq 'Vs';
		}elsif($_[1] == 8){$$MsnStyle="全弹放出";
			($Pl_W[2]-=35,$Pl_W[3]*=2,$Pl_W[4]*=2) if $_[2] eq 'Pl';
			($Vs_W[2]-=35,$Vs_W[3]*=2,$Vs_W[4]*=2) if $_[2] eq 'Vs';
		}elsif($_[1] == 9){$$AT*=2;$$DE*=2;$$MsnStyle="乱射";}
		elsif($_[1] == 10){$$AT*=1.2;$$SP*=4;$$MsnStyle="心眼";
			$Pl_W[2]+=20 if $_[2] eq 'Pl';$Vs_W[2]+=20 if $_[2] eq 'Vs';
		}elsif($_[1] == 11){$$MsnStyle="齐射叁连";
			($Pl_W[2]-=65,$Pl_W[3]*=3,$Pl_W[4]*=3) if $_[2] eq 'Pl';
			($Vs_W[2]-=65,$Vs_W[3]*=3,$Vs_W[4]*=3) if $_[2] eq 'Vs';}
		elsif($_[1] == 12){$$AT*=2.5;$$SP*=1.5;$$MsnStyle="一点集中";
			$Pl_W[2]+=10 if $_[2] eq 'Pl';$Vs_W[2]+=10 if $_[2] eq 'Vs';
		}
	}
	if($_[0] eq 's'){
		if   ($_[1] eq "1"){$$AT*=1.2;$$DE-=2;}
		elsif($_[1] eq "2"){$$AT*=1.2;$$WM-=5;}
		elsif($_[1] eq "3"){$$AT*=0.9;$$SP+=3;}
		elsif($_[1] eq "4"){$$WM+=5;}
		elsif($_[1] eq "5"){$$AT*=1.3;$$WM+=10;$$DE-=4;}
		elsif($_[1] eq "6"){$$AT*=1.5;$$DE*=1.5;$$SP*=4;$$WM*=1.5;}
		elsif($_[1] eq "7"){$$AT*=2;$$DE*=10;$$SP*=0.6;$$WM*=0.6;}
		elsif($_[1] eq "8"){$$AT*=2.5;$$DE*=0.8;$$SP*=2.5;$$WM*=2.5;}



	}
}




1;
