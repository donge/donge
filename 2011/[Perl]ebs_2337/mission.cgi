#!/usr/bin/perl
# 设定
$SCRIPTNM="mission.cgi";   #本文件名
$YOUSAINM = "集训基地";    #基地名称
$MABOROSI = "训练机";      #机体名称
$ZAKO = "陪练机";          #训练机名称
$ZAKOGIF="999";            #训练机图像号
$timer = "10";             #每次训练时间间隔秒
#
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

require 'ebs_sub1.cgi';

&ERROR('请不要直接从此地址进入','安全起见请从您访问的网页进入') if $ENV{'HTTP_REFERER'} !~ m/^$THIS_DIR/ && $DIRECT_LINK && $SUB ne 'MY_LIST' && $SUB ne 'C_LIST';

!$SUB && ($SUB='TOP');
&$SUB;

sub LOGIN		{&LOGIN2;}
sub LOG0		{require 'ebs_sub2.cgi';&LOG01;}
sub LOGO		{require 'ebs_sub2.cgi';&LOGO2;}

sub TOP 		{&FRAME;}
sub MAIN_FRAME 	{require "$LOG_FOLDER/$HASH_DATA";&STATUS;}
sub BATTLE_2	{&BATTLE2;}

sub FRAME{
	print <<"	-----END-----";
Content-type: text/html


                <html><head>
                <title>$THIS_Title</title></head>
                <frameset rows="220,*" frameBorder="1" bordercolor="#002720" framespacing="10">
                <frame name="Main" src="$SCRIPTNM?LOGIN">
                <frame name="Sub" src="$SCRIPTNM?LOG0">
                </frameset>
                </html>
	-----END-----
}
sub LOGIN2{
		@pair = split(/;/, $ENV{'HTTP_COOKIE'});
		foreach (@pair) {my($key, $value) = split(/=/, $_);$DUMMY{$key} = $value;}
	@pairs = split(/,/, $DUMMY{EB});
		foreach (@pairs) {my($key, $value) = split(/:/, $_);$COOKIE{$key} = $value;}

#	$BG_TOP="bgcolor=\"$BG_TOP\"" if $BG_TOP !~ /\./;
#	$BG_TOP="background=\"$BG_TOP\"" if $BG_TOP =~ /\./;

	print "Content-type: text/html\n\n";
	print << "	-----END-----";
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<body background=images/bg1.jpg text=#FFFFFF>
<LINK href=htmlcn.css type=text/css rel=stylesheet>
<script language=javascript>var intDelay=30; //设置菜单显示速度，越大越慢
var intInterval=50; //每次更改的透明度
function MenuClick()
{if (LayerMenu.style.display=="")
{GradientClose();}
else
{LayerMenu.filters.alpha.opacity=0;
LayerMenu.style.display="";
GradientShow();
hide('first');}}
function GradientShow() //实现淡入的函数
{LayerMenu.filters.alpha.opacity+=intInterval;
if (LayerMenu.filters.alpha.opacity<100) setTimeout("GradientShow()",intDelay);}
function GradientClose() //实现淡出的函数
{LayerMenu.filters.alpha.opacity-=intInterval;
if (LayerMenu.filters.alpha.opacity>0)
{setTimeout("GradientClose()",intDelay);
}else{LayerMenu.style.display="none";}}
function updown()
{if (startmenu.className == "down")
startmenu.className = "up1";
else if (startmenu.className == "up1")
startmenu.className = "up1";}
function ctrl()
{if (startmenu.className == "down")
startmenu.className = "up1";
else if (startmenu.className == "up1")
startmenu.className = "down";}
</script>
<br><br>
<center><div class=up1 onClick="MenuClick();" onmousedown=this.className='down' id="startmenu" style="position:absolute; z-index:1"><img border="0" src="$IMG_FOLDER4/mission.gif" alt="打开登机舱 / 关闭登机舱"></div></center>
<center><div id=LayerMenu style="position: absolute; display: none; filter: alpha(opacity=0); left:50px; top:80px; z-index: 1">
<table width=100% height=100% id="login"><tr><td $center>
<table border=0 cellpadding=0 cellspacing=0 $center>
<form action=$SCRIPTNM method=POST name=frm1>
<tr><td $center $bg_top><input type=hidden name="cmd" value="MAIN_FRAME">
<input type=hidden name="login" value="$DATE">
<b>用户名</b></td>
<td>&nbsp;<input type=text name="pname" value="$COOKIE{'pname'}" style="height:21px; color:#ffffff; font-size:16px; background:#000000; border:1 inset #c0c0c0;"></td><td>&nbsp;&nbsp;<a href="Javascript:MenuClick();"><img src=$IMG_FOLDER4/out.gif border=0></A></td></tr>
<tr><td $center $bg_top><b>密&nbsp;&nbsp;码</b></td>
<td>&nbsp;<input type=password name="pass" value="$COOKIE{'pass'}" style="height:21px; color:#ffffff; font-size:16px; background:#000000; border:1 inset #c0c0c0;">
</td><td>&nbsp;&nbsp;<input type=image src="$IMG_FOLDER4/log.gif" name=lgn>
</td></tr></form></table>
</td></tr></table>

	-----END-----


	$js1="";
	print "</body></html>";
	print "<script language=\"JavaScript\">location.href='#top';\n</script>\n" if $BANNER_DISPLAY;

}

sub STATUS{
	&DBM_CONVERT('P',"$FORM{pname}") if !$FORM{'Cmode'};
	&DBM_CONVERT('C',"$PL_VALUES[5]") if $PL_VALUES[5];
	&ERROR('NameError','用户名错误，此用户没有登记') if !@PL_VALUES;
	&ERROR('PwdError','密码输入错误') if crypt ($FORM{'pass'},eb) ne "$PL_VALUES[2]";
	&REPAIR(PL);
		if ($FORM{'login'}){
		if ($ENV{'REMOTE_HOST'}){$host="$ENV{'REMOTE_HOST'}";}else{$ipad=pack('C4',split(/\./,$ENV{'REMOTE_ADDR'}));
		$host = gethostbyaddr($ipad,2);}
		dbmopen (%L,"$DBM_L",0666);
			foreach (sort {$b <=> $a} keys %L){$lc++;delete $L{"$_"} if $lc > 51;}
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
	if ($flagd){
		dbmopen (%PL,"$DBM_P",0666);
			$PL{"$FORM{'pname'}"}="@PL_VALUES";
		dbmclose %PL;
	}

	local($WN_A,$WLV_A) = split(/!/,$PL_VALUES[9]);	local($WN_B,$WLV_B) = split(/!/,$PL_VALUES[10]);
	local($WN_C,$WLV_C) = split(/!/,$PL_VALUES[11]);

	if   ($PL_VALUES[25] == 0){$CONDITIONAL = '<font color=#143dca>动</font>';}
	elsif($PL_VALUES[25] == 1){$CONDITIONAL = '<font color=#dc143c>修</font>';}

	$CL_VALUES[0]='#808080' if !$PL_VALUES[5];

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
print "<SPAN><TD class=num noWrap align=middle colSpan=2>$PL_VALUES[8]</TD>";
print "</tr></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV></center></td>";


print "<td width=34% rowspan=3>";
print "<table border=3 cellpadding=0 cellspacing=0 style=\"border-collapse: collapse\" width=95% bgcolor=#000000 bordercolor=#008080>";
print "<tr><td width=100% align=center><img src=$IMG_FOLDER2/$PL_VALUES[27].gif><br>";
print "<font size=3>&nbsp;<b>$PL_VALUES[3]</b></font></td></tr></table>";
print "<b>$STATUS_NAME[9]</b><br><font color=#ffffff size=2>";
($DatHp,$Result,$DatHp2,$Result2,$DatHp3,$Result3,$DatHp4,$Result4,$DatHp5,$Result5) = split(/!/,$PL_VALUES[1]);
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
print "<TD class=num noWrap $right><B>Piii 500*2</B></TD><TD></TD></TR><TR>";
print "<TD class=num noWrap $right colSpan=5>";
print "<B>-----</B></TD></TR></TBODY></TABLE></TD></TR><TR>";
print "<TD style=\"BORDER-RIGHT: #89a078 2px solid; BORDER-TOP: medium none; FONT-SIZE: 12px; BORDER-LEFT: #89a078 2px solid; BORDER-BOTTOM: #89a078 2px solid; BACKGROUND-REPEAT: no-repeat\" bgColor=#000000 colSpan=2>";
print "<DIV><TABLE $tb_kill bgColor=#000000><font color=#99fffff>&nbsp;<b>$STATUS_NAME[10]</b></a></font>&nbsp;&nbsp;&nbsp;<font color=ffffff>$PL_VALUES[39]</font></TABLE>";
print "<TABLE $tb_kill bgColor=#000000><font color=#990000>&nbsp;<b>$STATUS_NAME[11]</b></a></font>&nbsp;&nbsp;&nbsp;<font color=ffffff>$PL_VALUES[32]</font></TABLE>";
print "敌机损毁" if $WN_sA[7]=~ m/A/;
print "一击必杀" if $WN_sA[7]=~ m/B/;
print "速度" if $WN_sA[7]=~ m/C/;
print "防御" if $WN_sA[7]=~ m/D/;
print "命中" if $WN_sA[7]=~ m/E/;
print "乱射" if $WN_sA[7]=~ m/F/;
print "幸运" if $WN_sA[7]=~ m/G/;
	@WN_sB=split(/\,/,$WEAPON_LIST{"$WN_B"});print'&nbsp;&nbsp;備用武器&nbsp;&nbsp;<b>'.$WN_sB[0].'</b>';
	print "&nbsp;等级.$WLV_B/经验.$WEP_B" if $WN_sB[0];print "<br>";
	@WN_sC=split(/\,/,$WEAPON_LIST{"$WN_C"});print'&nbsp;&nbsp;備用武器&nbsp;&nbsp;<b>'.$WN_sC[0]."</b>";
	print "&nbsp;等级.$WLV_C/经验.$WEP_C" if $WN_sC[0];print "<br>";
	@WN_sD=split(/\,/,$WEAPON_LIST{"$WN_D"});print'&nbsp;&nbsp;備用武器&nbsp;&nbsp;<b>'.$WN_sD[0]."</b>";
	print "&nbsp;等级.$WLV_D/经验.$WEP_D" if $WN_sD[0];print "<br>";
	@WN_sE=split(/\,/,$WEAPON_LIST{"$WN_E"});print'&nbsp;&nbsp;備用武器&nbsp;&nbsp;<b>'.$WN_sE[0]."</b>";
	print "&nbsp;等级.$WLV_E/经验.$WEP_E" if $WN_sE[0];print "</div>";
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
print "<TD style=\"BORDER-RIGHT: #89a078 2px solid; PADDING-RIGHT: 4px; BORDER-TOP: medium none; PADDING-LEFT: 4px; PADDING-BOTTOM: 4px; BORDER-LEFT: #89a078 2px solid; PADDING-TOP: 4px; BORDER-BOTTOM: #89a078 2px solid\" width=208 bgColor=#000000 colSpan=2><IMG height=10 width=208 src=$IMG_FOLDER4/mater.gif></TD>";
print "</TR></TBODY></TABLE></DIV>";

print "<DIV style=\"FILTER: dropshadow(offx=8,offy=8,color=#000000); POSITION: relative; HEIGHT: 50px\">";
print "<TABLE cellSpacing=0 cellPadding=0><TBODY><TR>";
print "<TD style=\"BORDER-RIGHT: #89a078 2px solid; PADDING-RIGHT: 4px; BORDER-TOP: #89a078 2px solid; PADDING-LEFT: 4px; PADDING-BOTTOM: 4px; BORDER-LEFT: #89a078 2px solid; PADDING-TOP: 4px; BORDER-BOTTOM: medium none\" width=208 bgColor=#000000 colSpan=2><IMG height=10 width=208 src=$IMG_FOLDER4/mater.gif></TD></TR><TR>";
print "<TD style=\"PADDING-RIGHT: 1px; BORDER-TOP: #89a078 2px solid; PADDING-LEFT: 0px; PADDING-BOTTOM: 1px; PADDING-TOP: 1px\" $right width=150>";
print "<SPAN style=\"BORDER-RIGHT: medium none; BORDER-TOP: medium none; FONT-SIZE: 16px; BORDER-LEFT: #23a012 1px solid; BORDER-BOTTOM: #23a012 1px solid; BACKGROUND-COLOR: #000000\">";
print "<b id=j_en>$PL_VALUES[17]</b>/<B>$PL_VALUES[18]</B></SPAN></TD>";
print "<TD style=\"BORDER-RIGHT: #89a078 2px solid; BORDER-TOP: medium none; FONT-SIZE: 15px; BORDER-LEFT: #89a078 2px solid; COLOR: #efef80; BORDER-BOTTOM: #89a078 2px solid\" noWrap align=middle width=50 bgColor=#000000>EN</TD></TR></TBODY></TABLE></DIV></center></td>";


print "<td width=34%>";
print "<center><DIV style=\"FILTER: dropshadow(offx=8,offy=8,color=#000000); POSITION: relative; HEIGHT: 65px\">";
print "<TABLE cellSpacing=0 cellPadding=0><TBODY><TR>";
print "<TD style=\"BORDER-RIGHT: #89a078 2px solid; PADDING-RIGHT: 0px; BORDER-TOP: #89a078 2px solid; PADDING-LEFT: 0px; FONT-SIZE: 15px; PADDING-BOTTOM: 0px; BORDER-LEFT: #89a078 2px solid; COLOR: #efef80; PADDING-TOP: 0px; BORDER-BOTTOM: medium none\" noWrap align=middle width=160 bgColor=#000000>目前装备武器</TD>";
print "<TD style=\"BORDER-RIGHT: #23a012 1px solid; BORDER-TOP: #23a012 1px solid; FONT-SIZE: 15px; BORDER-LEFT: medium none; BORDER-BOTTOM: #89a078 2px solid; BACKGROUND-COLOR: #000000\" width=100 align=middle>";
print "<B class=num>消耗EN: $WN_sA[4]</B></TD></TR><TR>";
print "<TD style=\"BORDER-RIGHT: #89a078 2px solid; PADDING-RIGHT: 4px; BORDER-TOP: medium none; PADDING-LEFT: 4px; FONT-SIZE: 15px; PADDING-BOTTOM: 4px; BORDER-LEFT: #89a078 2px solid; COLOR: #e0e0e0; PADDING-TOP: 4px; BORDER-BOTTOM: #89a078 2px solid\" width=208 bgColor=#000000 colSpan=2>";
print "<B>".$WN_sA[0]."</B>&nbsp;等级.$WLV_A/经验.$WEP_A<BR>";
print "<span style=\"$STYL1\">&nbsp;&nbsp;性\能\&nbsp;&nbsp;攻：".&STATUS_CONVERT($WN_sA[1]*$WN_sA[3]/500,'s');print "&nbsp;&nbsp;命：".&STATUS_CONVERT($WN_sA[2]/4,'s');print "&nbsp;&nbsp;回：$WN_sA[3]<BR>";
print "<B></B></TD></TR></TBODY></TABLE></DIV></center></td></tr></table>";
print "</td></tr>";
print << "-----END-----";
	<tr><form action=$SCRIPTNM name="FM" method="POST" target=Sub><td colspan=7>
	<script language="JavaScript">
		function Move(){parent.Sub.location.replace("$SCRIPTNM?LOGO");}
	</script>

		<input type=hidden name=cmd>
		<input type=hidden name=pname value=$FORM{'pname'}>
		<input type=hidden name=pass value=$FORM{'pass'}>
		<div id="master">
<div id="menu">
<table border=0 width=100% cellspacing=0 cellpadding=0>
<tr><td width=100%><a href="javascript:expand()" onfocus="this.blur()"><img name="menutop" border=0 src="$IMG_FOLDER4/menu.gif" width="18" height="70"></a></td></tr>
</table></div>
<div id="top">
<table border=0 width=100% cellspacing=0 cellpadding=0>
<tr><td width=100%><img border=0 src="$IMG_FOLDER4/menutop.gif" width="145" height="6"></td></tr>
</table></div>
<div id="screen">
<table border=0 width=100% cellspacing=0 cellpadding="5">
<tr><td width=100% bgcolor="#808080">
<table border=0 width=100% bgcolor="#808080" cellspacing=0 cellpadding=0>
<tr><td width=100%>
<table border=0 width=100% cellspacing="1" cellpadding="5">
<tr><td width=100% bgcolor="#FFFFFF">
<font><br></font><font><br></font><font><br></font>
</td></tr></table></td></tr></table></td></tr></table></div>
<div id="screenlinks">
<table border=0 width=100% cellspacing=0 cellpadding="5">
<tr><td width=100%>
<table border=0 width=100% bgcolor="#808080" cellspacing=0 cellpadding=0>
<tr><td width=100%>
<table border=0 width=100% cellspacing="1" cellpadding="5">
<tr><td width=100% bgcolor="#FFFFFF">
<center>
<font color=#787986><b>集训指令</b></font><br>
<input type=submit name="b_mode" value="袭击要塞训练" $STYLE_B1 onClick="document.FM.cmd.value='BATTLE_2';Move();"><br>
<input type=submit name="b_mode" value="实战演习" $STYLE_B1 onClick="document.FM.cmd.value='BATTLE_2';Move();"><br>
<input type=submit name="b_mode" value="攻击训练" $STYLE_B1 onClick="document.FM.cmd.value='BATTLE_2';Move();"><br>
<input type=button value="争霸" $STYLE_B1 onClick="parent.top.location.replace('wars.cgi')">
<input type=button value="擂台" $STYLE_B1 onClick="parent.top.location.replace('champ.cgi')">
<input type=button value="退出" $STYLE_B1 onClick="parent.top.location.replace('$YOUR_HOME')"></form>
<form action=$SCRIPTNM method=POST target=_self>
<input type=hidden name=cmd value=MAIN_FRAME>
<input type=hidden name=pname value=$FORM{'pname'}>
<input type=hidden name=pass value=$FORM{'pass'}>
<input type=submit value="刷新" $STYLE_B1 onClick=\"parent.Sub.location.replace(\'$MAIN_SCRIPT?LOGO\');\">
</form></center></td></tr></table></div></td></tr></table></td></tr></table>
-----END-----
	print "<script language=\"JavaScript\">location.href='#top';\n</script>\n" if $BANNER_DISPLAY;
print << "	-----END-----"if $ENV{'HTTP_USER_AGENT'} =~ m/MSIE/i;
	<script language="JavaScript">
	var h=$PL_VALUES[15];var e=$PL_VALUES[17];var timerID;
	myDate1 = new Date();
	var m_time=myDate1.getTime();
	HERepair();
	function HERepair(){
	myDate2 = new Date();
		n_time=myDate2.getTime();
		sasi = (m_time - n_time)/-1000;

		if (h < $PL_VALUES[16]){h = $PL_VALUES[15] + sasi*$HP_REPAIR;}else{h = $PL_VALUES[16];}
		if (e < $PL_VALUES[18]){e = $PL_VALUES[17] + sasi*$EN_REPAIR;}else{e = $PL_VALUES[18];}
		if (h >= $PL_VALUES[16] && cond.innerText=='机体修理中'){
			cond.innerText='可以战斗';cond.style.color='#143dc1';
		}
		j_hp.innerText=Math.round (h);
		j_en.innerText=Math.round (e);
		clearTimeout(timerID);
		timerID = setTimeout(\"HERepair()\",5000);
		}
		</script>
	-----END-----
	exit;
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
		&DBM_CONVERT('P',"$FORM{pname}",'VS',"$FORM{vsname}") if !$FORM{'yousai'};
		&DBM_CONVERT('C',"$PL_VALUES[5]",'VC',"$VS_VALUES[5]") if !$FORM{'yousai'};
		&DBM_CONVERT('C',"$PL_VALUES[5]",'VC',"$FORM{'vsname'}") if $FORM{'yousai'};
	&UNLOCK;
###要塞能力设定
if ($FORM{'b_mode'} eq '袭击要塞训练'){
        $RAND=int(rand(10)+1);
        $HITPOINT=$PL_VALUES[16]*$RAND;$MAXPOINT=$PL_VALUES[16]*$RAND;
        @VS_VALUES=("300","$PL_VALUES[1]","0","要塞","AL","$PL_VALUES[5]","99","","0","zzzz","zzzz","zzzz","6","$PL_VALUES[0]","0","$HITPOINT","$MAXPOINT","9999","9999","$PL_VALUES[19]","$PL_VALUES[20]","$PL_VALUES[21]","$PL_VALUES[22]","99","999","0","$DATE","1000","0","99","0");
}
if ($FORM{'b_mode'} eq '实战演习'){
        $YOUSAINM = $MABOROSI;

        @VS_VALUES=("$PL_VALUES[0]","$PL_VALUES[1]","$PL_VALUES[2]","$PL_VALUES[3]","AL","$PL_VALUES[5]","$PL_VALUES[6]","$PL_VALUES[7]","$PL_VALUES[8]","$PL_VALUES[9]","$PL_VALUES[10]","$PL_VALUES[11]","$PL_VALUES[12]","$PL_VALUES[13]","$PL_VALUES[14]","$PL_VALUES[15]","$PL_VALUES[16]","$PL_VALUES[17]","$PL_VALUES[18]","$PL_VALUES[19]","$PL_VALUES[20]","$PL_VALUES[21]","$PL_VALUES[22]","$PL_VALUES[23]","$PL_VALUES[24]","$PL_VALUES[25]","$DATE","$PL_VALUES[27]","$PL_VALUES[28]","$PL_VALUES[29]","$PL_VALUES[30]");
}
if ($FORM{'b_mode'} eq '攻击训练'){
        $YOUSAINM = $ZAKO;
        $RAND=int(rand(10)+1);
        $HITPOINT=int($PL_VALUES[16]/$RAND);$MAXPOINT=int($PL_VALUES[16]/$RAND);
        @VS_VALUES=("0","$PL_VALUES[1]","","$ZAKO","AL","$PL_VALUES[5]","$PL_VALUES[6]","$PL_VALUES[7]","0","a","$PL_VALUES[10]","$PL_VALUES[11]","6","$PL_VALUES[13]","$PL_VALUES[14]","$HITPOINT","$MAXPOINT","100","100","$PL_VALUES[19]","$PL_VALUES[20]","$PL_VALUES[21]","$PL_VALUES[22]","$PL_VALUES[23]","$PL_VALUES[24]","$PL_VALUES[25]","$DATE","$ZAKOGIF","$PL_VALUES[28]","$PL_VALUES[29]","$PL_VALUES[30]");
}
	&REPAIR(PL);&REPAIR(VS);
        if (@CL_VALUES){$PL_Country="$PL_VALUES[5]";}else{$PL_Country=$NONE_NATIONALITY;$CL_VALUES[0]='#808080';}
        if (@VC_VALUES){$VS_Country="$VS_VALUES[5]";}else{$VS_Country=$NONE_NATIONALITY;$VC_VALUES[0]='#808080';}

if ( $PL_VALUES[26] >= time-$timer){&ERROR('每次训练时间不得小於10秒')}

        &ERROR('机体修理中') if $PL_VALUES[25]==1;
	local($PL_WN,$PL_WLV) = split(/!/,$PL_VALUES[9]);
	local($VS_WN,$VS_WLV) = split(/!/,$VS_VALUES[9]);
	require "$LOG_FOLDER/$HASH_DATA";
	@Pl_W=split(/\,/,$WEAPON_LIST{"$PL_WN"});
	@Vs_W=split(/\,/,$WEAPON_LIST{"$VS_WN"});
	$plbs=int ($PL_VALUES[20]+7) if $Pl_W[7] =~ m/4/;
	$vsbs=int ($VS_VALUES[20]+7) if $Vs_W[7] =~ m/4/;
	$Pl_AttPoint=int($Pl_W[1]*(($PL_WLV*0.0001)+1));
	$Pl_SpPoint=$PL_VALUES[21];$Pl_DefPoint=($PL_VALUES[20]+$plbs)*2-int($VS_VALUES[19]/3);$Pl_MisPoint=$PL_VALUES[22];
	$Pl_Kaikyu=&RANK($PL_VALUES[0],$PL_VALUES[5],$PL_VALUES[6]);
	$pwl=int $PL_WLV/$WEAPON_LVUP;$Pl_WeaponNameA="$Pl_W[0](Level.$pwl)";
	&ERROR('noEnergy','EN不足') if $PL_VALUES[17] < $Pl_W[4];
	$Vs_AttPoint=int($Vs_W[1]*(($VS_WLV*0.0001)+1));
	$Vs_SpPoint=$VS_VALUES[21];$Vs_DefPoint=($VS_VALUES[20]+$vsbs)*2-int($PL_VALUES[19]/3);$Vs_MisPoint=$VS_VALUES[22];
	$Vs_Kaikyu=&RANK($VS_VALUES[0],$VS_VALUES[5],$VS_VALUES[6]);
	$vwl=int $VS_WLV/$WEAPON_LVUP;$Vs_WeaponNameA="$Vs_W[0](Level.$vwl)";
	$Pl_SpPoint=int ($Pl_SpPoint*1.5) if $Pl_W[7] =~ m/3/;
	$Vs_SpPoint=int ($Vs_SpPoint*1.5) if $Vs_W[7] =~ m/3/;
	if ($PL_VALUES[16] > 50000){$Pl_SpPoint-=int(($PL_VALUES[16]-50000)/5000);}
	if ($VS_VALUES[16] > 50000){$Vs_SpPoint-=int(($VS_VALUES[16]-50000)/5000);}
	&SYUSEI('m',"$FORM{'mode'}",'Pl');
	$VsMsnNo=int(rand(8)+1);
	&SYUSEI('m',"$VsMsnNo",'Vs');
	&SYUSEI('s',"$PL_VALUES[12]",'Pl');
	&SYUSEI('s',"$VS_VALUES[12]",'Vs');
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
	$Pl_AtPoint=0 if $Pl_AtPoint < 0;
	$Vs_AtPoint=0 if $Vs_AtPoint < 0;
	$dmgStyl="style=\"font-size:21px;color:#9acd32;\"";
	$chaStyl="style=\"font-size:12px;color:#dc143c;\"";
	$PlsumDmg="<b $dmgStyl>$Pl_W[3]</b> <b $chaStyl>次出击</b> <b $dmgStyl>$Pl_Times</b> <b $chaStyl>次击中</b>
		<b $dmgStyl>对方$Pl_AtPoint</b><b $chaStyl> 点损伤</b>" if $Pl_Times > 0;
	$PlsumDmg='<font color=#6a5acd>失败</font>' if $Pl_Times == 0;
	$VssumDmg="<b $dmgStyl>$Vs_W[3]</b> <b $chaStyl>次出击</b> <b $dmgStyl>$Vs_Times</b> <b $chaStyl>次击中</b>
		<b $dmgStyl>对方$Vs_AtPoint</b><b $chaStyl> 点损伤</b>" if $Vs_Times > 0;
	$VssumDmg='<font color=#6a5acd>失败</font>' if $Vs_Times == 0;
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
	$PL_In[2]=10 if $PL_In[2]<10;$VS_In[2]=10 if $VS_In[2]<10;
	$PL_VALUES[0]+=$PL_In[1];
	$VS_VALUES[0]+=$VS_In[1];
	$PL_VALUES[8]+=$PL_In[2];
	$VS_VALUES[8]+=$VS_In[2];
	$PL_VALUES[0]=0   if $PL_VALUES[0] < 0;
	$PL_VALUES[0]=215 if $PL_VALUES[0] >= 215;
	$PL_VALUES[0]=220 if $PL_VALUES[6] == 1;
	$VS_VALUES[0]=0   if $VS_VALUES[0] < 0;
	$VS_VALUES[0]=215 if $VS_VALUES[0] >= 215;
	$VS_VALUES[0]=220 if $VS_VALUES[6] == 1;
	$PL_VALUES[17]-=$Pl_W[4] if $Pl_Times;$PL_VALUES[17]=0 if $PL_VALUES[17] < 0;
	$Pl_vs="$VS_VALUES[5]的"if $VS_VALUES[5];$Pl_vs="流浪者的"if !$VS_VALUES[5];
	$Vs_vs="$PL_VALUES[5]的"if $PL_VALUES[5];$Vs_vs="流浪者的"if !$PL_VALUES[5];
	$PL_VALUES[1]="$DATE!$Pl_vs$YOUSAINM交战";$PL_VALUES[26]=time;
	$VS_VALUES[1]="$DATE!$Vs_vs$FORM{'pname'}交战";
	($ResultTag.="$YOUSAINM大败<br>",$PL_VALUES[1].="$YOUSAINM大败",$VS_VALUES[1].="$YOUSAINM大败")
	if $ResultBattle==0;
	($ResultTag.="$PL_VALUES[3]大败<br>",$PL_VALUES[1].="$PL_VALUES[3]大败",$VS_VALUES[1].="$PL_VALUES[3]大败")
	if $ResultBattle==1;
	&HEADER;
	print << "	-----END-----";
	<div align=center>

	<table border=0 width=100% cellspacing=0 cellpadding=0>
	<tr><td align=center width=50% bgcolor="$CL_VALUES[0]" style="color:#000000;font-size:25pt;">
		<b>$PL_Country</b></td>
		<td align=center width=50% bgcolor="$VC_VALUES[0]" style="color:#000000;font-size:25pt;">
		<b>$PL_Country</b></td></tr>
	<tr><td align=center width=50%><font color=$PL_VALUES[13] style="font-size:18pt;">$PL_VALUES[3]</font><br>
		<div style="font-size:15px;">（$FORM{'pname'}$Pl_Kaikyu机）</div></td>
		<td align=center width=50%><font color=$VS_VALUES[13] style="font-size:18pt;">$VS_VALUES[3]</font><br>
		<div style="font-size:15px;">（$YOUSAINM）</div></td></tr>
	<tr><td align=center width=50% height=100 valign=bottom>
		<div align=center><img src=\"$IMG_FOLDER2/$PL_VALUES[27].gif\"></div>
		<div style="font-size:15px;">  $Pl_MsnStyle  </div>
		<table $TBL_TAG1><tr><td style="font-size:15px;"><b>HP</b>&nbsp;</td>
			<td>$PL_HPTAG</td><td width=50 align=right style="font-size:14px;"><span id=cplhp>$Pl_BfrHP</span></td>
			<td style="font-size:14px;">/<b>$PL_VALUES[16]</b></td></tr></table></td>
	<td align=center width=50% height=100 valign=bottom>
		<div align=center><img src=\"$IMG_FOLDER2/$VS_VALUES[27].gif\" style=\"filter:fliph();\"></div>
		<div style="font-size:15px;">  $Vs_MsnStyle  </div>
		<table $TBL_TAG1><tr><td style="font-size:15px;"><b>HP</b>&nbsp;</td>
			<td>$VS_HPTAG</td><td width=50 align=right style="font-size:14px;"><span id=cvshp>$Vs_BfrHP</span></td>
			<td style="font-size:14px;">/<b>$VS_VALUES[16]</b></td></tr></table></td></tr>
	<tr><td align=center valign=top width=40%><font color=#778899 style="font-size:16px;">
			<b>$Pl_WeaponNameA</b></font><div align=center>$PlResult<div align=center>$PlsumDmg<br>
			<b $chaStyl>EN:-$Pl_W[4]</b></div></td>
			<td align=center valign=top width=40%><font color=#778899 style="font-size:16px;">
			<b>$Vs_WeaponNameA</b></font><div align=center>$VsResult<div align=center>$VssumDmg<br>
			<b $chaStyl>EN:-$Vs_W[4]</b></div></td></tr></table>
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
		print " $FORM{'pname'} $Ch_rank被";
		print $PL_In[1] > 0 ? "升级罗<br>":$PL_In[1] < 0 ? "降级罗<br>":"<br>";
	}
	$Ch_rank=&RANK($VS_VALUES[0],$VS_VALUES[5],$VS_VALUES[6]);
	if($Ch_rank ne $Vs_Kaikyu && $Ch_rank){
		print "$FORM{'vsname'}  $Ch_rank被";
		print $VS_In[1] > 0 ? "升级罗<br>":$PL_In[1] < 0 ? "降级罗<br>":"<br>";
	}


	$PL_In[4]=$PL_In[0]*($VS_VALUES[0]+1);
	$PL_VALUES[30]+=$PL_In[4];
	print "$FORM{'pname'} 阁下得到了 $PL_In[4]的经验 $PL_In[2] 的金钱 $PL_In[0] 的武器经验 <br>";

	if (($PL_VALUES[29]+1)*200 <= $PL_VALUES[30]){
		print "<font color=#f7e957>恭喜$FORM{'pname'}等级提高</font><br>";
		$PL_VALUES[30]=0;
		$PL_VALUES[29]++;
		sub BONUS{"&nbsp;&nbsp;&nbsp;<font color=#f7e957>$_[0]与机体防御力提高</font><br>";}

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
		if (rand(22) < $BoSp && $PL_VALUES[21] < $StatusMax){print &BONUS('速度');$PL_VALUES[21]++;}
		if (rand(22) < $BoAg && $PL_VALUES[22] < $StatusMax){print &BONUS('命中率');$PL_VALUES[22]++;}
	}


	if ($ResultBattle==1){
		sub DOWN{"&nbsp;&nbsp;&nbsp;<font color=#dc143c>机体损坏，$_[0]机体防御力下降</font><br>";}
		$Event=int(rand(70));
		if ($Event == 12 && $PL_VALUES[19] >= 1){print &DOWN("$STATUS_NAME[0]");$PL_VALUES[19]--;}
		if ($Event == 13 && $PL_VALUES[20] >= 1){print &DOWN("$STATUS_NAME[1]");$PL_VALUES[20]--;}
		if ($Event == 14 && $PL_VALUES[21] >= 1){print &DOWN("$STATUS_NAME[2]");$PL_VALUES[21]--;}
		if ($Event == 15 && $PL_VALUES[22] >= 1){print &DOWN("$STATUS_NAME[3]");$PL_VALUES[22]--;}
		if ($Event == 20 && $PL_VALUES[16] >= 5000){print &DOWN("$STATUS_NAME[4]");$PL_VALUES[16]=int($PL_VALUES[16]*0.995);}
		if ($Event == 40 && $PL_VALUES[18] >= 100){print &DOWN("$STATUS_NAME[5]");$PL_VALUES[18]=int($PL_VALUES[18]*0.995);}
	}

	if (!$ResultBattle && (!$PL_VALUES[10] || !$PL_VALUES[11])){
		my@al=keys %WEAPON_LIST;$alw=@al;
		$alw=int rand($alw);$gw=@al[$alw];$gw='a' if !$gw;
			@q=split(/\,/,$WEAPON_LIST{"$gw"});
                if ($FORM{'b_mode'} eq '袭击要塞训练'){$q[8]=$q[8]*2;}
                elsif ($FORM{'b_mode'} eq '攻击训练'){$q[8]=0;}
		if ($q[8] > rand(100)){
		 if (!$PL_VALUES[10]){$PL_VALUES[10]=$gw;}
		elsif(!$PL_VALUES[11]){$PL_VALUES[11]=$gw;}
		print "<font color=\"#f7e957\">武器获得</font><br>\n";
		}
	}

	if ($PL_VALUES[12] != 6){$PL_VALUES[12]='6' if ($FORM{'mode'} ==1 && rand(255) > 253 && $NT_START==1) || (rand(255) > 253 && $NT_START==2) || (rand(255) > 253 && $NT_START==2) || (rand(500) == 1 && $NT_START==3);}else{$PL_VALUES[12]="$VS_VALUES[12]" if ($FORM{'mode'} !=1 && rand(255) > 200 && $NT_END==1) || (rand(255) > 253 && $NT_END==2) || (rand(255) > 253 && $NT_END==2) || (rand(500) == 1 && $NT_END==3);}

	if ($Pl_W[7] =~ m/1/){
		if (rand(255) > 240){print "<font color=#8000ff>敌机攻击系统被损坏</font><br>\n";$VS_VALUES[19]--;}
		if (rand(255) > 240){print "<font color=#8000ff>敌机防御系统被损坏</font><br>\n";$VS_VALUES[20]--;}
		if (rand(255) > 240){print "<font color=#8000ff>敌机回避系统被损坏</font><br>\n";$VS_VALUES[21]--;}
		if (rand(255) > 240){print "<font color=#8000ff>敌机命中系统被损坏</font><br>\n";$VS_VALUES[22]--;}
	}
	if ($Pl_W[7] =~ m/2/ && rand(255) > 240){print "<font color=#ff0080>$VS_VALUES[3]不能战斗</font><br>\n";$VS_VALUES[25]=1;}
	if ($Vs_W[7] =~ m/2/ && rand(255) > 240){print "<font color=#ff0080>$PL_VALUES[3]不能战斗</font><br>\n";$PL_VALUES[25]=1;}

	$WLDUMMYpl=$PL_WLV;$PL_WLV+=$PL_In[0] if $PL_WLV < $MAX_WEAPONLV*100;
	$WLDUMMYvs=$VS_WLV;$VS_WLV+=$VS_In[0] if $VS_WLV < $MAX_WEAPONLV*100;
	$PL_WLV=$MAX_WEAPONLV*100 if $PL_WLV > $MAX_WEAPONLV*100;
	$VS_WLV=$MAX_WEAPONLV*100 if $VS_WLV > $MAX_WEAPONLV*100;

	if(int($PL_WLV/$WEAPON_LVUP) > int($WLDUMMYpl/$WEAPON_LVUP) && $PL_WLV < $MAX_WEAPONLV*100){
		print "<font color=#f7e957>$FORM{'pname'}的$Pl_W[0]升级</font><br>\n";
		$PL_VALUES[14]=$PL_VALUES[14]-$WEAPON_LVUP;
	}
	if(int($VS_WLV/$WEAPON_LVUP) > int($WLDUMMYvs/$WEAPON_LVUP) && $VS_WLV < $MAX_WEAPONLV*100){
		print "<font color=#f7e957>$YOUSAINM的$Vs_W[0]升级</font><br>\n";
		$VS_VALUES[14]=$VS_VALUES[14]-$WEAPON_LVUP;
	}
		$PL_VALUES[9]="$PL_WN!$PL_WLV";
		$VS_VALUES[9]="$VS_WN!$VS_WLV";

	$TheEnd=1 if $FORM{'yousai'} && !$ResultBattle;
	$VC_VALUES[11]="$VS_VALUES[15]!$Y_HP[1]!$DATE" if $FORM{'yousai'};
	if(!$ResultBattle && $PL_VALUES[5]){$CL_VALUES[1]+=$VS_VALUES[0]+20;$CL_VALUES[1]+=5000 if $TheEnd==1;}
	elsif($ResultBattle && $PL_VALUES[5]){$CL_VALUES[1]+=int(($VS_VALUES[0]+20)/3);}
	$CL_VALUES[1]+=$VS_VALUES[0]+20;
	$CL_VALUES[1]='99999' if $CL_VALUES[1] > 99999;

	&LOCK;
	dbmopen (%PL,"$DBM_P",0666);
		$PL{"$FORM{'pname'}"}="@PL_VALUES";

	dbmclose %PL;

	if ($PL_Country ne "流浪者" && !$FORM{'b_mode'}){
		dbmopen (%CL,"$DBM_C",0666);
			$CL{"$PL_Country"}="@CL_VALUES" if $CL{"$PL_Country"} && $PL_Country ne "流浪者";

		dbmclose %CL;
	}
	&UNLOCK;

	print << "	END_OF_HTML";
	</td></tr></table><table border=0 cellspacing=0>
	<form action=$SCRIPTNM method=POST target=Main>
	<input type=hidden name=cmd value=MAIN_FRAME>
	<input type=hidden name=pname value=$FORM{'pname'}>
	<input type=hidden name=pass value=$FORM{'pass'}><tr><td>
	<input class=buttonA value="" onmouseover="value='返回';" style="BACKGROUND-IMAGE: url(img/button2.jpg)" onClick=\"parent.Sub.location.replace(\'$SCRIPTNM?LOGO\');\" onmouseout="value='';" type=submit>
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
		}elsif($_[1] == 6){$$AT*=2;$$DE/=5;$$MsnStyle="闪身";}
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
		}else{$$MsnStyle="普通攻击";}
	}
	if($_[0] eq 's'){
		if   ($_[1] eq "1"){$$AT*=1.2;$$DE-=2;}
		elsif($_[1] eq "2"){$$AT*=1.2;$$WM-=5;}
		elsif($_[1] eq "3"){$$AT*=0.9;$$SP+=3;}
		elsif($_[1] eq "4"){$$WM+=5;}
		elsif($_[1] eq "5"){$$AT*=1.3;$$WM+=10;$$DE-=4;}
		elsif($_[1] eq "6"){$$AT*=1.5;$$DE*=1.5;$$SP*=4;$$WM*=1.5;}
		elsif($_[1] eq "7"){$$AT*=2;$$DE*=2;$$SP*=0.8;$$WM*=0.8;}
		elsif($_[1] eq "8"){$$AT*=2;$$DE*=0.8;$$SP*=2;$$WM*=1.5;}
	}
}
