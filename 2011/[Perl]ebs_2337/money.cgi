#!/usr/bin/perl
#ver.2
#设置
$SCRIPTNM="money.cgi";               #变卖名称
$KRATE="1";                          #变卖人
#
#按钮设置
#
#在需要的地方加上下面的代码。
#
#<form action=money.cgi method=POST>
#<input type=hidden name="cmd" value="MAINTE">
#<input type=hidden name="medal" value="$QUERY{'medal'}">
#<input type=submit value=变卖 $STYLE_B2></form>
#######################################################################




require 'ebs_sub1.cgi';
require 'ec_config.pl';

&ERROR('请不要直接从此地址进入','安全起见请从您访问的网页进入') if $ENV{'HTTP_REFERER'} !~ m/^$THIS_DIR/ && $DIRECT_LINK && $SUB ne 'MY_LIST' && $SUB ne 'C_LIST';

!$SUB && ($SUB='MAINTE');
&$SUB;

sub MAINTE		{&MAINTENANCE;}
sub MASTER              {&MASTER2;}
sub SYUSEI		{&SYUSEI2;}
sub TYOUSEI		{&TYOUSEI2;&SYUSEI2;}

sub MAINTENANCE{
		@pair = split(/;/, $ENV{'HTTP_COOKIE'});
		foreach (@pair) {my($key, $value) = split(/=/, $_);$DUMMY{$key} = $value;}
	@pairs = split(/,/, $DUMMY{EB});
		foreach (@pairs) {my($key, $value) = split(/:/, $_);$COOKIE{$key} = $value;}

	&HEADER;
        if($FORM{'medal'} eq ''){$FORM{'medal'}=0;}
	print << "	-----END-----";

	<table width=100% height=100%><tr><td align=center>
		<table $tb_stl>
		<form action=$SCRIPTNM method=POST><input type=hidden name="cmd" value="SYUSEI">
		<tr><td colspan=2>
		&nbsp;勋 章 变 卖 场</td></tr>
                <tr><td $center><b>用户名</b></td>
		<td><input type=hidden name="plname" value="$COOKIE{'pname'}" style="height:21px; color:#ffffff; font-size:16px; background:#000000; border:1 inset #c0c0c0;">$COOKIE{'pname'}
                <input type=hidden name="medal" value="$FORM{'medal'}">
		<tr><td align=center><b>密码</b></td>
		<td><input type=pass name="pass" value="" style="height:21px; color:#ffffff; font-size:16px; background:#000000; border:1 inset #c0c0c0;">
		<input type=submit value=Login $STYLE_B2>
		</td></tr></form></table>
	<form action=e_casino.cgi method=POST>
	<input type=submit value=返回 $STYLE_B2>
        <input type=hidden name="medal" value="$FORM{'medal'}">
	</form>
	</td></tr></table>

	-----END-----
}

sub SYUSEI2{
&ERROR('用户名输入错误！！') if $FORM{'plname'} eq '';
&ERROR('密码错误！！') if $FORM{'pass'} eq '';

&DBM_INPORT(P);

@VALS = split(/\s/,$P{"$FORM{'plname'}"});
&ERROR('密码错误！！') if crypt ($FORM{'pass'},eb) ne "$VALS[2]";

&HEADER;

$KANKIN="$VALS[8]";
$GOLD="$FORM{'medal'}"-$START_MEDAL;
if($GOLD < 0){$GOLD=0;}
$SILVER=int($GOLD*$KRATE);
$KANKIN+=$SILVER;
print << "-----END-----";
	<script language="JavaScript">
		function tyousei(nm){
                        alert("$GOLD 勋章变卖");
			fm1.plname.value=nm;
			fm1.sbm1.click();
		}

	</script>
	<form action=$SCRIPTNM method=POST name=fm1 style="position:absolute;visibility:hidden;">
	<input type=hidden name="cmd" value=TYOUSEI>
	<input type=hidden name="plname">

        <input type=hidden name="medal" value=0>
	<input type=hidden name="pass" value="$FORM{'pass'}">
	<input type=submit name="sbm1" onClick="parent.window.close()">
        <input type=hidden name="para8" value="$KANKIN">
        </form>
<table width=100% height=100%><tr><td $center>
<table $tb_stl>
<tr><td $center colspan=35><b>勋 章 变 卖</b></td></tr>
<tr><td>姓名</td><td>资金</td><td>变卖</td></tr>

<tr><td>＄</td><td>$GOLD × $KRATE = <font color=RED>$SILVER</font></td><td><marquee>★　　☆　　★　　☆　　★　　☆</marquee></td></tr>

-----END-----

print "<tr><td>$FORM{'plname'}</td><td>$VALS[8]</td><td><a href=\"javascript:tyousei('$FORM{'plname'}')\">决定</a></td></tr>";


print << "-----END-----";

<form action=$SCRIPTNM method=POST>
<input type=hidden name="cmd" value="MAINTE">
<input type=hidden name="pass" value=\"$FORM{'pass'}\"><tr><td $center colspan=35>
<input type=hidden name="medal" value="$FORM{'medal'}">
<input type=submit value=返回 $STYLE_B2>
</td></tr></table>
-----END-----

&FOOTER;
print "</td></tr></table></form></body>";
}

sub TYOUSEI2{
&LOCK;
	dbmopen (%P,"$DBM_P",0666);
		@VALS = split(/\s/,$P{"$FORM{'plname'}"});

                $VALS[8]=$FORM{'para8'};

		$P{"$FORM{'plname'}"}="@VALS";
	dbmclose %P;
&UNLOCK;
}

