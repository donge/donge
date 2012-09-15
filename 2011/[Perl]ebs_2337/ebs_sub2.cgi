sub LOGIN2{
		@pair = split(/;/, $ENV{'HTTP_COOKIE'});
		foreach (@pair) {my($key, $value) = split(/=/, $_);$DUMMY{$key} = $value;}
	@pairs = split(/,/, $DUMMY{EB});
		foreach (@pairs) {my($key, $value) = split(/:/, $_);$COOKIE{$key} = $value;}

	print "Content-type: text/html\n\n";
	print "<LINK href=miuler.css rel=stylesheet>";
	print << "	-----END-----";
	<html><head>
	<SCRIPT language=JavaScript1.2>
	function high(which2){
	theobject=which2
	highlighting=setInterval("highlightit(theobject)",50)
	}
	function low(which2){
	clearInterval(highlighting)
	which2.filters.alpha.opacity=30
	}
	function highlightit(cur2){
	if (cur2.filters.alpha.opacity<100)
	cur2.filters.alpha.opacity+=10
	else if (window.highlighting)
	clearInterval(highlighting)
	}

	</SCRIPT>
	<script language="JavaScript">
		function showform(){login.style.visibility='visible';}
		function hideform(){login.style.visibility='hidden';}
		function showdata(){data.style.visibility='visible';}
		function hidedata(){data.style.visibility='hidden';}
	</script>
	<style type="text/css">
		a:link    {font-size: 17px; text-decoration:none; color:#707070; }
		a:visited {font-size: 17px; text-decoration:none; color:#707070; }
		a:active  {font-size: 17px; text-decoration:none; color:#707070; }
		a:hover   {font-size: 17px; text-decoration:none; color:#dcdcdc; }
	</style>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<body background=$IMG_FOLDER4/star_bg.jpg bgproperties="fixed" text=#00FF00 topmargin=0 oncontextmenu="return false;">
<style>
<!--
BODY {SCROLLBAR-FACE-COLOR: #000000; SCROLLBAR-HIGHLIGHT-COLOR: #000000; SCROLLBAR-SHADOW-COLOR: #808000; SCROLLBAR-3DLIGHT-COLOR: #FFFFFF; SCROLLBAR-ARROW-COLOR:  #FF6600; SCROLLBAR-TRACK-COLOR: #333333; SCROLLBAR-DARKSHADOW-COLOR: #000000; }
-->
</style>
<LINK href=miuler.css type=text/css rel=stylesheet>

	<a name=#top>
	<table width=100% height=100% id="login" style="position:absolute;visibility:hidden;"><tr><td align=center>
		<table border=0 cellpadding=0 cellspacing=0 $center>
		<form action=$MAIN_SCRIPT method=POST name=frm1 style=\"margin:0px 0px 0px 0px;\">
		<tr><td $center $bg_top><input type=hidden name="cmd" value="MAIN_FRAME">
		<input type=hidden name="login" value="$DATE">
		<b>用户名</b></td>
		<td>&nbsp;<input type=text name="pname" value="$COOKIE{'pname'}" style="height:16px; color:#00ff00; font-size:12px; background:#000000; border:1 inset #c0c0c0;"></td><td>&nbsp;&nbsp;<a href="Javascript:hideform();"><img src=$IMG_FOLDER4/out.gif border=0></A></td></tr>
		<tr><td $center $bg_top><b>密&nbsp;&nbsp;码</b></td>
		<td>&nbsp;<input type=password name="pass" value="$COOKIE{'pass'}" style="height:16px; color:#00ff00; font-size:12px; background:#000000; border:1 inset #c0c0c0;">
		</td><td>&nbsp;&nbsp;<input type=image src="$IMG_FOLDER4/log.gif" name=lgn>
		</td></tr></form></table>
	</td></tr></table>
	<table width=100% height=100% id="data" style="position:absolute;visibility:hidden;"><tr><td align=center>
		<table border=0 cellpadding=0 cellspacing=0 $center style="border:0px solid;">
		<tr><td $bg_top $center $middle><font><a href="info.htm" target="_top">新手说明</a></td><td><a href="Javascript:hidedata();"><img src=$IMG_FOLDER4/close.gif border=0></td>
		</tr>
		<tr><td $bg_top $center><a href="$MAIN_SCRIPT?DELETE2" target="_top">用户自杀</a></td>
			</tr>
	-----END-----
	print << "	-----END-----"if $SATELLITE_FLAG;
		<tr><td $bg_top $center $middle><a href="$MAIN_SCRIPT?EXPORT" target="_top">资料导出</a></td>
			</tr>
		<tr><td $bg_top $center $middle><a href="$MAIN_SCRIPT?INPORT" target="_top">资料导入</a></td>
			</tr>
	-----END-----
	print << "	-----END-----";
		<tr><td $bg_top $center $middle><a href="$MAIN_SCRIPT?WEAPON" target="_blank">武器资料</a></td>
			</tr>
		<tr><td $bg_top $center $middle><a href="$MAIN_SCRIPT?ICON" target="_blank">战士图库</a></td>
			</tr>
		<tr><td $bg_top $center $middle><a href="weaponlist.cgi" target="_blank">详细武器列表</a></td>
			</tr>
		<tr><td $bg_top $center $middle><a href="name.cgi" target="_blank">玩家账号查询</a></td>
			</tr>
		</table>
	</td></tr></table>

	<table border=0 width=100% height=100%>
	<tr><td $center $middle>
	<img src=$IMG_FOLDER4/logo.gif><br>
	-----END-----
	$js1="";
	print "<a href=\"Javascript:showform();\"><img border=\"0\" src=\"$IMG_FOLDER4/star_03h.gif\" onMouseOver=high(this) onMouseOut=low(this) style='filter: alpha(opacity=30); border-style: solid; border-width: 0'></a>";

	if (!$COOKIE{'pname'} && !$COOKIE{'pass'}){
	print "&nbsp;<a href=\"ebs.cgi?ENTRY\" target=\"_top\"><img border=\"0\" src=\"$IMG_FOLDER4/star_05h.gif\" onMouseOver=high(this) onMouseOut=low(this) style='filter: alpha(opacity=30); border-style: solid; border-width: 0'></a>";
	}
	print "&nbsp;<a href=\"Javascript:showdata();\"><img border=\"0\" src=\"$IMG_FOLDER4/star_07h.gif\" onMouseOver=high(this) onMouseOut=low(this) style='filter: alpha(opacity=30); border-style: solid; border-width: 0'></a>";
	print "</td></tr></table></body></html>";

	print "<script language=\"JavaScript\">location.href='#top';\n</script>\n" if $BANNER_DISPLAY;

}
#########################
#     下框架设置        #
#########################
sub LOG01{
	&HEADER2;
if ($CONFIG_DISPLAY){
	print "<LINK href=htmlcn.css rel=stylesheet>";
	print "<table border=0 cellspacing=0 cellpadding=0>";
	print "<tr><td colspan=2><img src=$IMG_FOLDER4/linkbarleft.gif><br><img src=$IMG_FOLDER4/lt_star.gif></td>";
	print "<td rowspan=8 $top width=500 $center>";
	print "<br><iframe src=history.cgi name=history width=95% height=210 marginheight=0 marginwidth=0 frameborder=0 scrolling=NO></iframe>";
	print << "	-----END-----";
	<br><center>版本$VER官方网站:<a href="http://www.ngcoms.net/" target=_blank>NET GAME.</a>
	-----END-----
	print "<br>站長: <a href=$THIS_DIR target=_blank>$OWNER_NAME </a> ; <b>献给2337永远年轻的斗士们！</b></center>" if $OWNER_NAME;
       print "<center>";
	print "</span>";
	print "</td><td colspan=2 $right><img src=$IMG_FOLDER4/linkbarright.gif><br><img src=$IMG_FOLDER4/rt_star.gif></td></tr><tr>";
	print "<td $buttonl $middle>$left_c管理人员</td><td $right><a href=\"mailto:$OWNER_EMAIL?subject=EBS在线信息\">$OWNER_NAME</a></td>";
	print "<td $bottom>\$$MAKE_COUNTRY</td>";
        print "<td $buttonr $middle $right>建国费用$left_b</td></tr>";

	print "<tr><td $buttonl $middle>$left_c机甲图片</td><td $right>$ICON";
	print "" if $SPECIAL_ICON;print "</td>";
	dbmopen (%P,"$DBM_P",0666);	@ENTRy=keys %P;	dbmclose %L;
	$ENTRYS=@ENTRy;
	print "<td $middle>\$$MAKE_TEAM</td>";
	print "<td $buttonr $middle $right>部队编成$left_b</td></tr>";
	print "<tr><td $buttonl $middle>$left_c登录上限 (人)</td><td $right>$ENTRY_MAX</td>";
	print "<td $middle>$COUNTRY_MAX</td>";
	print "<td $buttonr $middle $right>国家数目$left_b</td></tr>";
	print "<tr><td $buttonl valign=\"middle\">$left_c现有人数 (人)</td><td $right>$ENTRYS</td>";
	print "<td></td>";
	print "<td $buttonr $middle $right><a href=$BBS_DIR target=_blank>游戏论坛</a>$left_b</td></tr>";
	print "<tr><td $buttonl $middle>$left_c档案保留 (日)</td><td $right>$COOKIE_KEEP</td>";
	print "<td></td>";
	print "<td $buttonr $middle $right><a href=info.htm target=_blank>游戏说明</a>$left_b</td></tr>";
	print "<tr><td $buttonl $middle>$left_c HP回复 (每秒)</td><td $right>$HP_REPAIR</td>";
	print "<td></td>";
	print "<td $buttonr $middle $right><a href=http://web.gameside.net target=_blank>遊戲邊緣</a>$left_b</td></tr>";
	print "<tr><td $buttonl $middle>$left_c EN回复 (每秒)</td><td $right>$EN_REPAIR</td>";
	print "<td></td>";
	print "<td $buttonr $middle $right><a href=#>版权信息</a>$left_b</td></tr>";
	print "</table>";
}
	print "$COMMENT_2" if $COMMENT_2;

}
sub LOGO2{
	&HEADER;
	print "$COMMENT_3" if $COMMENT_3;
	&FOOTER;
}
sub MY_LIST2{
	@pair = split(/\;/, $ENV{'HTTP_COOKIE'});
		foreach (@pair) {my($key, $value) = split(/=/, $_);$DUMMY{$key} = $value;}
	@pairs = split(/\,/, $DUMMY{'EB'});
		foreach (@pairs) {my($key, $value) = split(/\:/, $_);$COOKIE{"$key"} = $value;}

	&ERROR('COOKIE已经过期') if !$COOKIE{'pname'};
	&HEADER;
	&DBM_INPORT(P);
	@PL_VALUES = split(/\s/,$P{"$COOKIE{'pname'}"});
	&DBM_CONVERT('C',"$PL_VALUES[5]");

	sub TR {$VALUES[7]='No-Comment'if !$VALUES[7];"<tr><td nowrap style=\"color:$VALUES[13];\">$Key</td><td>".&RANK($VALUES[0],$VALUES[5],$VALUES[6])."</td><td><img src=$IMG_FOLDER2/$VALUES[27].gif width=32 height=32></td><td style=\"color:$VALUES[13];\">$VALUES[7]</td></tr>"}

	print "<table $center border=8 cellspacing=0 style=\"font-size:15px;border:8px outset $CL_VALUES[0];\">";
	print "<tr><td colspan=4 bgcolor=$CL_VALUES[0] style=\"color:red;font-size:20px;\">$PL_VALUES[5]";
	print "<span style=\"font-size:15px;\">&nbsp;&nbsp;国费&nbsp;<b>\$$CL_VALUES[1]</b></span>"if $PL_VALUES[5];
	print "<span style=\"font-size:15px;\">  要塞状态 <b>\装甲$Y_HP[1] 威力$Y_ST[0] 防御$Y_ST[1] 命中$Y_ST[2]</b></span>"if $PL_VALUES[5];
	print "</td></tr>";
	foreach $Key (sort {$P{$b} <=> $P{$a}} keys %P){
		@VALUES = split(/\s/,$P{$Key});
		if (!$PL_VALUES[5] && !$VALUES[5]){print &TR;}
		if ($PL_VALUES[5] && $PL_VALUES[5] eq $VALUES[5] && !$VALUES[28] && ($VALUES[6] == 1 || $VALUES[6] == 0)){print &TR;}
		if ($PL_VALUES[5] && $PL_VALUES[5] eq $VALUES[5] && $VALUES[28]){
			($UNIT_A.= &TR,$uflag_A=1) if $VALUES[28] eq $CL_VALUES[2] && $VALUES[6] != -1;
			($UNIT_B.= &TR,$uflag_B=1) if $VALUES[28] eq $CL_VALUES[3] && $VALUES[6] != -1;
			($UNIT_C.= &TR,$uflag_C=1) if $VALUES[28] eq $CL_VALUES[4] && $VALUES[6] != -1;
			($LEADER_A.= &TR,$lflag_A=1) if $VALUES[28] eq $CL_VALUES[2] && $VALUES[6] == -1;
			($LEADER_B.= &TR,$lflag_B=1) if $VALUES[28] eq $CL_VALUES[3] && $VALUES[6] == -1;
			($LEADER_C.= &TR,$lflag_C=1) if $VALUES[28] eq $CL_VALUES[4] && $VALUES[6] == -1;
		}

		$plys++;
	}
	if ($PL_VALUES[5]){
	print "<tr><td colspan=4 bgcolor=$CL_VALUES[0] style=\"color:#000000;font-size:20px;\">&nbsp;<b>第一部队</b>&nbsp;";
	print $CL_VALUES[2] ? "$CL_VALUES[2]":!$CL_VALUES[2] ? '未编制':'</td></tr>';
	print $lflag_A ? "$LEADER_A":!$lflag_A ? "<tr><td colspan=4>暂无司令</td></tr>":'\n';
	print $uflag_A ? "$UNIT_A":!$uflag_A ? "<tr><td colspan=4>暂无队员</td></tr>":'';
	print "<tr><td colspan=4 bgcolor=$CL_VALUES[0] style=\"color:#000000;font-size:20px;\">&nbsp;<b>第二部队</b>&nbsp;";
	print $CL_VALUES[3] ? "$CL_VALUES[3]":!$CL_VALUES[3] ? '未编制':'</td></tr>';
	print $lflag_B ? "$LEADER_B":!$lflag_B ? "<tr><td colspan=4>暂无司令</td></tr>":'\n';
	print $uflag_B ? "$UNIT_B":!$uflag_B ? "<tr><td colspan=4>暂无队员</td></tr>":'';
	print "<tr><td colspan=4 bgcolor=$CL_VALUES[0] style=\"color:#000000;font-size:20px;\">&nbsp;<b>第叁部队</b>&nbsp;";
	print $CL_VALUES[4] ? "$CL_VALUES[4]":!$CL_VALUES[4] ? '未编制':'</td></tr>';
	print $lflag_C ? "$LEADER_C":!$lflag_C ? "<tr><td colspan=4>暂无司令</td></tr>":'\n';
	print $uflag_C ? "$UNIT_C":!$uflag_C ? "<tr><td colspan=4>暂无队员</td></tr>":'';
	}
	print "</table><br><br><br><br>";

#	&FOOTER;

}
sub C_LIST2{
	&DBM_INPORT(C);
	&HEADER;
	print << "	-----END-----";
	<form action=$MAIN_SCRIPT method=POST target=Sub onSubmit="">
	<center><input type=hidden name="cmd" value="CO_LIST">
	<b>查看所有国家的情报</b><br>
	-----END-----
	while (($C_Name,$C_Value) =each %C) {
		@C_VALUE = split(/\s/,$C_Value);
			print "<input type=submit name=CNTRY value=\"$C_Name\"";
			print " STYLE=\" background:$C_VALUE[0];color:black\">\n";
	}
		print "<input type=submit name=CNTRY value=\"流浪者\"";
		print " STYLE=\" background:#808080;color:white\"></center></form>\n";
}

sub WEAPON_LIST{
&HEADER2;

require "$LOG_FOLDER/$HASH_DATA";
print << "END_OF_HTML";
<table width=100% height=100%><tr><td align=center>
<img src=$IMG_FOLDER4/logo_weapon.gif><table>
END_OF_HTML

	foreach my $W_key (sort keys %WEAPON_LIST){
		@W=split(/\,/,$WEAPON_LIST{"$W_key"});
		$opt.= "<option value=\"$W_key\">$W[0]\n"if $W[6]>=4 && $W_key ne $FORM{'wname'};
		$opt.= "<option value=\"$W_key\" selected>$W[0]\n"if $W[6]>=4 && $W_key eq $FORM{'wname'};
		$check=substr($W_key,0,length($FORM{'wname'}));
		if ($W_key =~ /^$FORM{'wname'}/ && length($FORM{'wname'})+1 == length($W_key)){$nexKey=$W_key;
		@nex = split(/\,/,$WEAPON_LIST{"$W_key"});if ($nex[6] <= 3){$nex[0]='秘密武器'}$nextgen.="$nex[0]<br>";}
		if ($W_key eq "$FORM{'wname'}"){
			@WW=@W;$NowW=$W_key;$originW=substr($NowW,0,1);$pregen=substr($NowW,0,length($NowW)-1);
			($PREGEN,$At,$WM) = split(/\,/,$WEAPON_LIST{"$pregen"});
			($orNameA,$At,$WM) = split(/\,/,$WEAPON_LIST{"$originW"});$Sedai=length($NowW);
		}
	}
if (!$PREGEN){$PREGEN='<b style="color:ef8524;">None-Generation</b>';}
if (!$nextgen){$nextgen='<b style="color:ef8524;">None-Generation</b>';}
if (!$FORM{'wname'}){print "<b style=\"font-size:15pt;color:#778899;\">全检索</b>\n";$PREGEN=$nextgen='';}
print << "END_OF_HTML";
<form action="$MAIN_SCRIPT" method="POST">
<tr><td class=left width=220>前世代</td><td class=left width=220 colspan=2>现世代</td>
	<td class=left width=220>後世代</td></tr>
<tr><td class=right><b class=b>$PREGEN</b></td>
	<td class=right colspan=2><select name="wname" $STYLE_L>$opt<br><input type="submit" value="检索" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\"></td>
	<td class=right><b class=b>$nextgen</b></td></tr>
END_OF_HTML
if($FORM{'wname'}){
	print "<tr><td rowspan=7></td><td class=left>武器名</td>\n";
	print "<td class=right nowrap>$WW[0]";
	print "<br><b class=b>（$orNameA系第$Sedai世代）</b>";
	print "</td><td rowspan=7></td></tr>\n";
	print "<tr><td class=left>攻击威力</td><td class=right>".&STATUS_CONVERT($WW[1]*$WW[3]/500,'s');
	print "<b class=b>Level</b></td></tr>";
	print "<tr><td class=left>消耗EN</td><td class=right>$WW[4]</td></tr>";
	print "<tr><td class=left>命中精度</td><td class=right>".&STATUS_CONVERT($WW[2]/4,'s');
	print "<b class=b>Level</b></td></tr>";
	print "<tr><td class=left>攻击回数</td><td class=right>$WW[3]<b class=b>回</b></td></tr>";
	print "<tr><td class=left>市场价格</td><td class=right>$WW[5]</td></tr>";
	print "<tr><td class=left>特殊效果</td><td class=right>&nbsp;<b class=b>";
	print "none" if $WW[7] eq '0';
	print " 机体损坏" if $WW[7]=~m/1/;
	print " 战斗不能" if $WW[7]=~m/2/;
	print " 防御提升" if $WW[7]=~m/3/;
	print " 攻击力提升" if $WW[7]=~m/4/;
	print " 防御力大幅提升" if $WW[7]=~m/5/;
	print " 敏捷微量提升" if $WW[7]=~m/6/;
	print " 防御伤害型武器攻击" if $WW[7]=~m/a/;
	print " 完全防御（不防伤害）" if $WW[7]=~m/b/;
	print " 经验双倍" if $WW[7]=~m/8/;
	print " 贯穿" if $WW[7]=~m/c/;
	print " 金钱双倍" if $WW[7]=~m/d/;
	print " HP吸收" if $WW[7]=~m/e/;
	print " 自爆" if $WW[7]=~m/f/;
	print " 底力" if $WW[7]=~m/g/;
	print " 超级防御" if $WW[7]=~m/h/;
	print "</b></td></tr>";
}
print << "END_OF_HTML";
</table><input type=hidden name=cmd value="WEAPON"></form>
END_OF_HTML
&FOOTER;
print "</td></tr></table>\n";
}
sub ICON_LIST{
&HEADER;$c=$FORM{'start'};
print "<table width=100% height=100%><tr><td align=center><img src=$IMG_FOLDER4/logo_war.gif></div><table bgcolor=#000000 cellpadding=4 cellspacing=4 style=\"border:1px solid #808080;\">";
foreach($FORM{'start'}..$ICON){$c++;
print "<tr>" if $c%7==1;
print "<td><img src=$IMG_FOLDER2/$_.gif><div align=center style=\"font-size:10pt;\">No.$_</div></td>";
print "</tr>" if $c%7==0;
last if $c>=$FORM{'start'}+35;
}
print "</table><table><tr>";
$Next=$FORM{'start'}+35;
$Back=$FORM{'start'}-35;

print << "-----END-----" if $Back >= 0;
<td><form action="$MAIN_SCRIPT" method="POST">
<input type=hidden name=cmd value="ICON">
<input type=hidden name=start value="$Back">
<input type="submit" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" value="<<上一页">
</form></td>
-----END-----

print << "-----END-----" if $Next <= $ICON;
<td><form action="$MAIN_SCRIPT" method="POST">
<input type=hidden name=cmd value="ICON">
<input type=hidden name=start value="$Next">
<input type="submit" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" value="下一页>>">
</form></td>
-----END-----
}

sub FACE_LIST{
&HEADER2;$c=$FORM{'start'};
print "<table width=100% height=100%><tr><td align=center><img src=$IMG_FOLDER4/logo_face.gif></div><table bgcolor=#000000 cellpadding=4 cellspacing=4 style=\"border:1px solid #808080;\">";
foreach($FORM{'start'}..$ICON2){$c++;
print "<tr>" if $c%7==1;
print "<td><img src=$IMG_FOLDER3/$_.gif><div align=center style=\"font-size:10pt;\">No.$_</div></td>";
print "</tr>" if $c%7==0;
last if $c>=$FORM{'start'}+35;
}
print "</table><table><tr>";
$Next=$FORM{'start'}+35;
$Back=$FORM{'start'}-35;

print << "-----END-----" if $Back >= 0;
<td><form action="$MAIN_SCRIPT" method="POST">
<input type=hidden name=cmd value="ICON2">
<input type=hidden name=start value="$Back">
<input type="submit" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" value="<<上一页">
</form></td>
-----END-----

print << "-----END-----" if $Next <= $ICON2;
<td><form action="$MAIN_SCRIPT" method="POST">
<input type=hidden name=cmd value="ICON2">
<input type=hidden name=start value="$Next">
<input type="submit" class=button2 onMouseOver="style.color='#000000';style.background='#adff2f';" onMouseOut="this.style.color='#adff2f';style.background='#00550c';" value="下一页>>">
</form></td>
-----END-----

}
1;
