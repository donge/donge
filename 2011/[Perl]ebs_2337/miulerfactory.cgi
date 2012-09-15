#!/usr/bin/perl
#请加在你 ebs_sub3.cgi 按键群当中
#<input type=button value="工厂" $STYLE_B1 onClick="window.open('miulerfactory.cgi', 'Factory', 'width=510,height=254,top=50,left=50,toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0')">
# eb Factory version number
$ebFEdition = "v1.2"; #版本

# HP Repair Money, 1HP = ?Money, If you setup it to '0', than $FullRepairMoney Active.
$HPRepairMoney = '2'; #HP 修理费用

# Full-Repair Rate
$FullRepairMoney = '20000'; #全修理费用

# Supply 10EN Rate
$EN10Money = '500'; #EN 补充费用

# Notice: $CWarOpen and $CWarPrice only impact Join Battle Country.
# Open Factory when Country War [1=open|0=close]
$CWarOpen = '0';

# Factory Price mount up when Country War [1=price*1|2=price*2|...]
$CWarPrice = '2';

require 'ebs_sub1.cgi'; # NT用真实路径
# require 'ebs_sub1.cgi'; # Unix 用

!$SUB && ($SUB='FLOGIN');
&$SUB;

sub HTTPHEAD	{&HttpHead;}
sub FLOGIN	{&LoginMod;}
sub FFACTORY	{&FactoryMod;}
sub FCOMPLETE	{&CompleteMod;}
sub CWAR	{&CountryWar;}

sub HttpHead {
	print "Content-type: text/html\n\n";
	print << "	-----END-----";
	<html><head>
	<title>ENDLESS BATTLE::Factory</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href=htmlcn.css type=text/css rel=stylesheet>
	-----END-----
}

sub LoginMod {
	@pair = split(/;/, $ENV{'HTTP_COOKIE'});
	foreach (@pair) {my($key, $value) = split(/=/, $_);$DUMMY{$key} = $value;}
	@pairs = split(/,/, $DUMMY{eb});
	foreach (@pairs) {my($key, $value) = split(/:/, $_);$COOKIE{$key} = $value;}

	&HTTPHEAD;
        if($FORM{'medal'} eq ''){$FORM{'medal'}=0;}
	print << "	-----END-----";

	</head><body bgcolor="#000000" text=#dcdcdc style="margin:0px 0px 0px 0px;" oncontextmenu="return false;">
	<table width="100%" border="0" height="100%"><tr><td align="center">
	<table id=table width=350 bgcolor="#909090" style="font-size:16px;" border=1>
	<tr align="center"><td bgcolor="#000000" align="center">机器人工厂 $ebFEdition</td></tr><tr>
	<td height="70"><table border=0 cellpadding=0 cellspacing=2 align=center>
	<form action=miulerfactory.cgi method=POST>
	<input type=hidden name="cmd" value="FFACTORY"><tr>
	<td align=center><b>ID</b></td><td>
	<input type=text name="plname" value="$COOKIE{'pname'}" style="height:21px; color:#ffffff; font-size:16px; background:#000000; border:1 inset #c0c0c0;"><tr>
	<td align=center><b>PASS</b></td><td>
	<input type=password name="pass" value="$COOKIE{'pass'}" style="height:21px; color:#ffffff; font-size:16px; background:#000000; border:1 inset #c0c0c0;">
	<input type=submit value=Login name="Submit"></td></tr></form></table>
	</td></tr><tr align="right"><td align="right" bgcolor="#000000"><font face="Verdana, Arial, Helvetica, sans-serif" style="font-size:9pt;">
	机器人工厂, Copyright &copy; <a href="/" target="_blank"><font color="#CCCCCC"></font></a></font></td>
	</tr></table></td></tr></table></body></html>

	-----END-----
}

sub FactoryMod {
	if ($ENV{'HTTP_REFERER'} !~ m/^$THIS_DIR/) { &ERROR('您可能正以非法方式进入工厂，请求失效','如有疑问请与管理员联系'); }
	if ($FORM{'plname'} eq '') { &ERROR('用户名错误！！'); }
	if ($FORM{'pass'} eq '') { &ERROR('密码错误！！'); }

	&LOCK;
	&DBM_CONVERT('P',"$FORM{plname}");
	$UNLOCK;
	&REPAIR(PL);

	if (!@PL_VALUES) { &ERROR('NameError','用户名有问题，登录失败'); }
	if (crypt($FORM{'pass'},eb) ne $PL_VALUES[2]) { &ERROR('PwdError','密码有问题，登录失败'); }
	if ($PL_VALUES[3] eq '') { &ERROR('机体不存在！'); }

	&DBM_INPORT(C);
	$COWar = 0;
	while (my($key,$val) = each %C) {
		@VALS = split(/\s/,$val);
		if ($VALS[7] > time && ($PL_VALUES[5] eq $key || $PL_VALUES[5] eq $VALS[6])) { $COWar = 1; }
	}

	if($HPRepairMoney == '0') { $RMoney = $FullRepairMoney; }
	else { $RMoney = ($PL_VALUES[16] - $PL_VALUES[15]) * $HPRepairMoney; }

	if ($COWar && $CWarOpen == '0') { &CWAR;exit; }
	if ($COWar && $CWarOpen == '1') {
		$RMoney = $RMoney * $CWarPrice;
		$EN10Money = $EN10Money * $CWarPrice;
	}
	if ($CWarOpen == '0') { $FactoryInfo = "国战发生时工厂将关闭以避战祸"; }
	else { $FactoryInfo = "国战发生时工厂物价指数上涨 ".$CWarPrice." 倍"; }
	if ($HPRepairMoney == '0') { $RepairInfo = "耐久度[HP]修理价格固定，能量[EN]每补充10点需".$EN10Money."元"; }
	else { $RepairInfo = "耐久度[HP]每修理1点需".$HPRepairMoney."元，能量[EN]每补充10点需".$EN10Money."元"; }

	$HRMoney = int($RMoney / 2);
	$ENE = ($PL_VALUES[18] - $PL_VALUES[17]) * ($EN10Money / 10);
	$EN50 = $EN10Money * 5;

	&HTTPHEAD;
	print << "	-----END-----";

	<script language="JavaScript">
	function shp1() {
		var line1 = table.rows[2].cells;
		var line2 = table.rows[3].cells;
		line1[2].bgColor = '#777777';
		line1[3].bgColor = '#777777';
		line1[4].bgColor = '#777777';
		line2[0].bgColor = '#909090';
		line2[1].bgColor = '#909090';
		line2[2].bgColor = '#909090';
		document.form.fchoose.value = 1;
	}
	function shp2() {
		var line1 = table.rows[2].cells;
		var line2 = table.rows[3].cells;
		line1[2].bgColor = '#909090';
		line1[3].bgColor = '#909090';
		line1[4].bgColor = '#909090';
		line2[0].bgColor = '#777777';
		line2[1].bgColor = '#777777';
		line2[2].bgColor = '#777777';
		document.form.fchoose.value = 2;
	}
	function sen1() {
		var line1 = table.rows[4].cells;
		var line2 = table.rows[5].cells;
		line1[1].bgColor = '#777777';
		line1[2].bgColor = '#777777';
		line1[3].bgColor = '#777777';
		line2[0].bgColor = '#909090';
		line2[1].bgColor = '#909090';
		line2[2].bgColor = '#909090';
		document.form.fchoose.value = 1;
	}
	function sen2() {
		var line1 = table.rows[4].cells;
		var line2 = table.rows[5].cells;
		line1[1].bgColor = '#909090';
		line1[2].bgColor = '#909090';
		line1[3].bgColor = '#909090';
		line2[0].bgColor = '#777777';
		line2[1].bgColor = '#777777';
		line2[2].bgColor = '#777777';
		document.form.fchoose.value = 2;
	}
	function hpsend() {
		var money = $PL_VALUES[8];
		if ((document.form.fchoose.value == 1 && $RMoney != 0) || (document.form.fchoose.value == 2 && $HRMoney != 0)) {
			if ((document.form.fchoose.value == 1 && money >= $RMoney) || (document.form.fchoose.value == 2 && money >= $HRMoney)) {
				document.form.ftype.value = "hp";
				document.form.submit();
			} else alert("您的资金不足！");
		} else alert("您似乎不需要这项服务");
	}
	function ensend() {
		var money = $PL_VALUES[8];
		if ((document.form.fchoose.value == 1 && $ENE != 0) || (document.form.fchoose.value == 2 && $EN50 != 0)) {
			if ((document.form.fchoose.value == 1 && money >= $ENE) || (document.form.fchoose.value == 2 && money >= $EN50)) {
				document.form.ftype.value = "en";
				document.form.submit();
			} else alert("您的资金不足！");
		} else alert("您似乎不需要这项服务");
	}
	</script>

	</head><body bgcolor="#000000" text="#dcdcdc" style="margin:0px 0px 0px 0px;" oncontextmenu="return false;" onLoad="shp1();sen1();">
	<table width="100%" border="0" height="100%"><tr><td align="center">
	<table id=table width=500 bgcolor="#909090" style="font-size:16px;" border=1>
	<form name=form action=miulerfactory.cgi method=POST>
	<input type=hidden name="cmd" value="FCOMPLETE">
	<input type=hidden name="plname" value="$FORM{'plname'}">
	<input type=hidden name="pass" value="$FORM{'pass'}">
	<input type=hidden name="ftype">
	<input type=hidden name="fchoose">
	<tr align="center"><td bgcolor="#000000" colspan="6">机器人工厂 $ebFEdition</td></tr>
	<tr align="center">
	<td bgcolor="#555555" width="160">机体名</td>
	<td width="70" bgcolor="#555555">服务类型</td>
	<td colspan="2" bgcolor="#555555">参数</td>
	<td width="80" bgcolor="#555555">价格</td>
	<td width="80" bgcolor="#555555">确认</td>
	</tr><tr align="center">
	<td rowspan="4">$PL_VALUES[3]</td>
	<td rowspan="2">机体修理</td>
	<td width="20">
	<input type="radio" name="HP" value="2" onClick="shp1();" checked>
	</td><td width="60">HP全满</td><td>$RMoney</td><td rowspan="2">
	<input type="button" name="Button1" value="开始修理" onClick="javascript:hpsend();">
	</td></tr><tr align="center"><td>
	<input type="radio" name="HP" value="1" onClick="shp2();">
	</td><td>50%修理</td><td>$HRMoney</td></tr><tr align="center">
	<td rowspan="2">能量补充</td><td bgcolor="#909090">
	<input type="radio" name="EN" value="2" onClick="sen1();" checked>
	</td><td bgcolor="#909090">EN补满</td><td bgcolor="#909090">$ENE</td>
	<td rowspan="2"><input type="button" name="Button2" value="开始补充" onClick="javascript:ensend();">
	</td></tr><tr align="center"><td bgcolor="#909090">
	<input type="radio" name="EN" value="1" onClick="sen2();">
	</td><td bgcolor="#909090">补充50</td><td bgcolor="#909090">$EN50</td>
	</tr><tr align="center"><td bgcolor="#555555">资金</td><td colspan="3">$PL_VALUES[8]</td>
	<td colspan="2"><a href="JavaScript:this.close();">退出机器人工厂</a></td></tr>
	<tr align="center"><td colspan="6"><font color="#FFCC00">$RepairInfo</font><br>
	<font color="#990000">=&gt; $FactoryInfo &lt;=</font></td></tr>
	<tr align="right"><td colspan="6" bgcolor="#000000"><font face="Verdana, Arial, Helvetica, sans-serif" style="font-size:9pt;">
	机器人工厂, Copyright &copy; <a href="/" target="_blank"><font color="#CCCCCC"></font></a></font></td>
	</tr></form></table></td></tr></table></body></html>

	-----END-----

	dbmclose %P;
}

sub CompleteMod {
	if ($ENV{'HTTP_REFERER'} !~ m/^$THIS_DIR/) { &ERROR('您可能正以非法方式进入工厂，请求失效','如有疑问请与管理员联系'); }
	&LOCK;
	&DBM_CONVERT('P',"$FORM{plname}");
	$UNLOCK;
	&REPAIR(PL);
	if ($FORM{'ftype'} eq "hp") {
		$OMONEY = $PL_VALUES[8];
		$OHP = $PL_VALUES[15];
		$MHP = $PL_VALUES[16];
		$OEN = $NEN = $PL_VALUES[17];
		$MEN = $PL_VALUES[18];
		if ($FORM{'HP'} eq '2') {
			if ($HPRepairMoney == '0') { $PL_VALUES[8] = $PL_VALUES[8] - $FullRepairMoney; }
			else { $PL_VALUES[8] = $PL_VALUES[8] - ($PL_VALUES[16] - $PL_VALUES[15]) * $HPRepairMoney; }
			$PL_VALUES[15] = $PL_VALUES[16];
			$PL_VALUES[25] = 0;
			$NMONEY = $PL_VALUES[8];
			$NHP = $PL_VALUES[15];
		}
		if ($FORM{'HP'} eq '1') {
			if ($HPRepairMoney == '0') {
				$PL_VALUES[8] = $PL_VALUES[8] - int($FullRepairMoney / 2);
				$PL_VALUES[15] = $PL_VALUES[15] + int($PL_VALUES[16] / 2);
			}
			else {
				$PL_VALUES[8] = $PL_VALUES[8] - int(($PL_VALUES[16] - $PL_VALUES[15]) * $HPRepairMoney / 2);
				$PL_VALUES[15] = $PL_VALUES[15] + int(($PL_VALUES[16] - $PL_VALUES[15]) / 2);
			}
			if ($PL_VALUES[15] > $PL_VALUES[16]) {
				$PL_VALUES[15] = $PL_VALUES[16];
				$PL_VALUES[25] = 0;
			}
			$NMONEY = $PL_VALUES[8];
			$NHP = $PL_VALUES[15];
		}
		if ($PL_VALUES[8] < 0) { &ERROR('您的资金不足！'); }
	}
	if($FORM{'ftype'} eq "en") {
		$OMONEY = $PL_VALUES[8];
		$OHP = $NHP = $PL_VALUES[15];
		$MHP = $PL_VALUES[16];
		$OEN = $PL_VALUES[17];
		$MEN = $PL_VALUES[18];
		if ($FORM{'EN'} eq '2') {
			$PL_VALUES[8] = $PL_VALUES[8] - ($PL_VALUES[18] - $PL_VALUES[17]) * ($EN10Money / 10);
			$PL_VALUES[17] = $PL_VALUES[18];
			$NMONEY = $PL_VALUES[8];
			$NEN = $PL_VALUES[17];
		}
		if ($FORM{'EN'} eq '1') {
			$PL_VALUES[8] = $PL_VALUES[8] - $EN10Money * 5;
			$PL_VALUES[17] = $PL_VALUES[17] + 50;
			if ($PL_VALUES[17] > $PL_VALUES[18]) { $PL_VALUES[17] = $PL_VALUES[18]; }
			$NMONEY = $PL_VALUES[8];
			$NEN = $PL_VALUES[17];
		}
		if ($PL_VALUES[8] < 0) { &ERROR('您的资金不足！'); }
	}
	dbmopen (%PL,"$DBM_P",0666);
	$PL{"$FORM{'plname'}"}="@PL_VALUES";
	dbmclose %PL;

	$UMONEY = $OMONEY - $NMONEY;
	&HTTPHEAD;
	print << "	-----END-----";

	</head><body bgcolor="#000000" text="#dcdcdc" style="margin:0px 0px 0px 0px;" oncontextmenu="return false;">
	<table width="100%" border="0" height="100%"><tr><td align="center">
	<table id=table width=350 bgcolor="#909090" style="font-size:16px;" border=1>
	<tr align="center"><td bgcolor="#000000" align="center" height="21">机器人工厂 $ebFEdition</td>
	</tr><tr><td align="center" height="120">您所提交的业务已完成，机体情况如下<br>
	<table width="90%" border="1" align="center" bordercolor="#666666" cellspacing="0" cellpadding="0">
	<tr align="center" bordercolor="#909090">
	<td width="45%">HP $OHP/$MHP</td><td>=&gt;</td><td width="45%">HP $NHP/$MHP</td>
	</tr><tr align="center" bordercolor="#909090">
	<td>EN $OEN/$MEN</td><td height="19">=&gt;</td><td>EN $NEN/$MEN</td>
	</tr></table>费用 $UMONEY 剩馀资金 $NMONEY<br>
	<input type="button" name="Button" value="离开机器人工厂" onClick="JavaScript:window.close();">
	</td></tr><tr align="right">
	<td align="right" bgcolor="#000000"><font face="Verdana, Arial, Helvetica, sans-serif" style="font-size:9pt;">
	机器人工厂, Copyright &copy; <a href="http://www.ltb.idv.tw/" target="_blank"><font color="#CCCCCC">元兴</font></a></font></td>
	</tr></table></td></tr></table></body></html>

	-----END-----
}

sub CountryWar {
	if ($ENV{'HTTP_REFERER'} !~ m/^$THIS_DIR/) { &ERROR('您可能正以非法方式进入工厂，请求失效','如有疑问请与管理员联系'); }

	&HTTPHEAD;
	print << "	-----END-----";

	</head><body bgcolor="#000000" text="#dcdcdc" style="margin:0px 0px 0px 0px;" oncontextmenu="return false;">
	<table width="100%" border="0" height="100%"><tr><td align="center">
	<table id=table width=350 bgcolor="#909090" style="font-size:16px;" border=1>
	<tr align="center"><td bgcolor="#000000" align="center" height="21">机器人工厂 $ebFEdition</td>
	</tr><tr><td height="60" align="center"><font color="#FFCC99">您所在的国家正涉入战争，工厂暂停营业</font><br>
	<input type="button" name="Button" value="离开机器人工厂" onClick="JavaScript:window.close();"></td>
	</tr><tr align="right"><td align="right" bgcolor="#000000"><font face="Verdana, Arial, Helvetica, sans-serif" style="font-size:9pt;">
	机器人工厂, Copyright &copy; <a href="http://www.ltb.idv.tw/" target="_blank"><font color="#CCCCCC">元兴</font></a></font></td>
	</tr></table></td></tr></table></body></html>

	-----END-----
}
