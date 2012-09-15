#!/usr/bin/perl
$SCRIPTNM="bbs.cgi";      #档案名称
$timer = "20";             #使用之後每隔（秒）, 才可以继续发言
$bbstitle ="信使";   #标题
$maxlog="300";             #最大保存数
$maxlines="20";            #表示件数
$tate="30";                #横列最多文字
$yoko="30";                #直列最多文字
$mojisuu="300";            #投稿最大文字数
$siyouflag="1";            #流浪者国籍  使用可否：0=不可使用 / 1=可以使用
$info="<font color=blue>国家的消息</font>只有发信息国家的全体人员可以看到、<font color=white>自国发的消息</font>只有本国人可以看到<BR><font color=#d0a020>个人间的消息</font>只有收信对方可以\看到。";
#########################################################################
require 'ebs_sub1.cgi';
&ERROR('请不要直接从此地址进入','安全起见请从您访问的网页进入') if $ENV{'HTTP_REFERER'} !~ m/^$THIS_DIR/ && $DIRECT_LINK && $SUB ne 'MY_LIST' && $SUB ne 'C_LIST';

!$SUB && ($SUB='BBS');
&$SUB;

sub BBS		{&BBSNANCE;}
sub TOUKOU      {&TOUKOU2;}
sub SYUSEI	{&SYUSEI2;&TOUKOU2;}

sub BBSNANCE{
		@pair = split(/; /, $ENV{'HTTP_COOKIE'});
		foreach (@pair) {my($key, $value) = split(/=/, $_);$DUMMY{$key} = $value;}
	@pairs = split(/,/, $DUMMY{'EB'});
		foreach (@pairs) {my($key, $value) = split(/:/, $_);$COOKIE{$key} = $value;}

	&HEADER;
        if($FORM{'medal'} eq ''){$FORM{'medal'}=0;}
	print << "	-----END-----";

	<table width=100% height=100%><tr><td align=center>
		<table border=0 cellpadding=0 cellspacing=0 bgcolor="#909090" align=center
		 style="border:1px outset #909090;font-size:16px;">
		<form action=$SCRIPTNM method=POST><input type=hidden name="cmd" value="TOUKOU">
		<tr><td style="background-color:#404040;" colspan=2>
		 BBS Mode</td></tr>
                <tr><td align=center><b style="color:#000000;">ID</b></td>
		<td><input type=text name="plname" value="$COOKIE{'pname'}" style="height:21px; color:#ffffff; font-size:16px; background:#000000; border:1 inset #c0c0c0;">

		<tr><td align=center><b style="color:#000000;">PASS</b></td>
		<td><input type=password name="pass" value="$COOKIE{'pass'}" style="height:21px; color:#ffffff; font-size:16px; background:#000000; border:1 inset #c0c0c0;">
		<input type=submit value=Login class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
		</td></tr></form></table>
	<form action=$MAIN_SCRIPT method=POST>
	<input type=submit value=返回 class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">

	</form>
	</td></tr></table>

	-----END-----
}

sub TOUKOU2{
&ERROR('帐号错误！！') if $FORM{'plname'} eq '';
&ERROR('密码错误！！') if $FORM{'pass'} eq '';

&DBM_INPORT(P);
@VALS = split(/\s/,$P{"$FORM{'plname'}"});
&ERROR('                ！！') if crypt ($FORM{'pass'},eb) ne "$VALS[2]";

	{
		my @gmt = gmtime(time + $COOKIE_KEEP*24*60*60);
		$gmt[0] = sprintf("%02d", $gmt[0]);	$gmt[1] = sprintf("%02d", $gmt[1]);
		$gmt[2] = sprintf("%02d", $gmt[2]);	$gmt[3] = sprintf("%02d", $gmt[3]);	$gmt[5] += 1900;
		$gmt[4] = ('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec')[$gmt[4]];
		$gmt[6] = ('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday')[$gmt[6]];
		my $date_gmt = "$gmt[6], $gmt[3]\-$gmt[4]\-$gmt[5] $gmt[2]:$gmt[1]:$gmt[0] GMT";
		my $cook = "lastcheck:$DATE";print "Set-Cookie:EBBBS=$cook;expires=$date_gmt\n";
	}

&HEADER;
		@pair = split(/; /, $ENV{'HTTP_COOKIE'});
		foreach (@pair) {my($key, $value) = split(/=/, $_);$DUMMY{$key} = $value; }
		@pairs = split(/,/, $DUMMY{'EBBBS'});
		foreach (@pairs) {my($key, $value) = split(/:/, $_);$COOKIEBBS{$key} = $value; }

&LOCK;
    open(IN,"bbs.dat");
    @bbslines = <IN>;
    close(IN);

&UNLOCK;
if($VALS[5] eq ''){$NATION=$NONE_NATIONALITY;}else{$NATION=$VALS[5];}
if($siyouflag == 0 and $NATION eq $NONE_NATIONALITY){&ERROR('流浪者不可使用')}

&DBM_INPORT(C);

$countryTag="<select name=\"country\" $STYLE_L>";
while (($C_Name,$C_Value) =each %C) {
	@C_VALUES = split(/\s/,$C_Value);
	$countryTag.="<option value=\"$C_Name\"";
	if ($VALS[5] eq "$C_Name") {$countryTag.=" selected";}
	$countryTag.=">$C_Name\n";
}
$countryTag.="<option value=\"\">$NONE_NATIONALITY\n";
$countryTag.="</select>";

$playerTag="<select name=\"player\" $STYLE_L>";
$playerTag.="<option value=\"\" selected>选择接收方.\n";
foreach $P_Name (sort (keys %P)) {
	$playerTag.="<option value=\"$P_Name\">$P_Name\n" if ($FORM{'plname'} ne $P_Name) ;
}
$playerTag.="</select>";

print << "-----END-----";
<table width=100% height=100%><tr><td align=center><center><b>[ $NATION $bbstitle ]</b></center>
<table border=0 cellspacing=2 cellpadding=3 bgcolor="#202020" style="font-size:16px;">
-----END-----
print "<tr><td></td><td align=center><font color=CYAN>【$FORM{'plname'}】</font></td><td>现在时刻</td><td>".&DATE_DECORD($DATE);
print "</td>";
print "</tr>";
print "<tr><td></td><td align=left><font color=red>$info</font></td><td>更新时刻</td><td>".&DATE_DECORD($VALS[26]);
print "</td></tr>";

print << "-----END-----";
<tr><td width=60>
	<form action=$SCRIPTNM method=POST>
	<input type=hidden name="cmd" value=SYUSEI>
	<input type=hidden name="plname" value=$FORM{'plname'}>
        <input type=hidden name="pnation" value=$NATION>
        <input type=hidden name="picon" value=$VALS[27]>
        <input type=hidden name="ptime" value=$VALS[26]>

        发言文</td><td><input type="text" name="com" size="80" maxlength=$mojisuu value="" $STYLE_L>
        </td><td><input type=submit value="　 发言　" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
        </td><td><input type="reset" value="　重写　" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\"></td>
	<input type=hidden name="pass" value="$FORM{'pass'}">
</td></tr>
<tr><td width=60>
	国家名</td><td>$countryTag
</td></tr>
<tr><td width=60>
	个人名</td><td>$playerTag
</td></tr>
</form>
-----END-----
print << "-----END-----";
<tr><td>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="cmd" value="TOUKOU">
</td><td>
<input type=hidden name="plname" value=\"$FORM{'plname'}\">
</td><td>
<input type=hidden name="pass" value=\"$FORM{'pass'}\">
</td><td>
<input type=submit value="　最新　" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
</td>
</form>
</tr>
-----END-----

    print "<tr><td colspan=4><hr>\n";

    print "<table border=1>";

    $bb=0;
    foreach (@bbslines) {
($pname,$pcountry,$pcomment,$pdate,$picon,$pto) = split(/<>/);
    if($maxlines <= $bb) { last; }
       if( ($NATION eq $pcountry) || ($FORM{'plname'} eq $pto) || ($FORM{'plname'} eq $pname) ) {
print "<tr><td><img src=\"$IMG_FOLDER2/$picon.gif\" width=$yoko height=$tate></td><td>$pname</td><td width=500><font color=";
$color="white";
if ( $pto eq "\0" ) { $pto=''; }
if ( ($pto eq '') && ($FORM{'plname'} eq $pname) && ($VALS[5] ne $pcountry) ) {$color="blue"; $pcomment.=">$pcountry"; }
if ( ($pto ne '') && ($FORM{'plname'} eq $pname) ) {$color="#d0a020"; $pcomment.=">$pto"; }
if ( ( $FORM{'plname'} eq $pto) )                      {$color="#d0a020"; }
print "$color>$pcomment</font></td><td>".&DATE_DECORD($pdate);
print "<font color=red> New!</font>" if ($pdate ge $COOKIEBBS{'lastcheck'} );
print "</td></tr>";
       $bb++;
       }
    }
    print "</table>";

    print "</table>";

	print "<BR><BR>信息中心：EDIT BY MASIMARO </a> 繁体中文<a href=\"http://202.160.70.40/bbs\" target=new>LTB</a>";
&FOOTER;
print "</td></tr></table></form></body>";
}

sub SYUSEI2{

    if($FORM{'com'} ne '' and $FORM{'ptime'} < time-$timer){

&LOCK;
    open(IN,"bbs.dat");
    @bbslines = <IN>;
    close(IN);

	$mes_max = @bbslines;

	if($mes_max >= $maxlog) { pop(@bbslines); }

	if ( $FORM{'player'} ne '' ) {
	unshift(@bbslines,"$FORM{'plname'}<>??＊＊??<>$FORM{'com'}<>$DATE<>$FORM{'picon'}<>$FORM{'player'}<>\n");
	} else {
	unshift(@bbslines,"$FORM{'plname'}<>$FORM{'country'}<>$FORM{'com'}<>$DATE<>$FORM{'picon'}<><>\n");
	}

	open(OUT,">bbs.dat");
	print OUT @bbslines;
	close(OUT);
	chmod(0666,"bbs.dat");

	dbmopen (%P,"$DBM_P",0666);
		@VALS = split(/\s/,$P{"$FORM{'plname'}"});
                $VALS[26] = $DATE ;
		$P{"$FORM{'plname'}"}="@VALS";
	dbmclose %P;

&UNLOCK;
    }elsif($FORM{'ptime'} >= time-$timer){$info="离上次发帖字$timer秒以内不能再发";
    }elsif($FORM{'com'} eq ''){$info="没有输入规定内容";}

}
