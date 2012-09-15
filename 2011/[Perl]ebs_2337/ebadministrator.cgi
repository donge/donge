#!/usr/bin/perl

#ver.5
#设定
$SCRIPTNM="ebadministrator.cgi";    #档案名称
$USERDATA="backup/backup.dat";        #使用者资料备分

require 'ebs_sub1.cgi';

&ERROR('请不要直接从此地址进入','安全起见请从您访问的网页进入') if $ENV{'HTTP_REFERER'} !~ m/^$THIS_DIR/ && $DIRECT_LINK && $SUB ne 'MY_LIST' && $SUB ne 'C_LIST';

!$SUB && ($SUB='MAINTE');
&$SUB;

sub MAINTE		{&MAINTENANCE;}
sub MAINTE2		{&MAINTENANCE2;}

sub ebadministrator              {&MASTER2;}
sub SYUSEI		{&SYUSEI2;}
sub TYOUSEI		{&TYOUSEI2;&SYUSEI2;}

sub BACKUP              {&BACKUP2;}
sub DATAUP{&DATAUP2;}
sub HUKUGEN		{&SYUSEI4;}
sub SYUUHUKU		{&TYOUSEI2;&SYUSEI4;}

sub COUNTRY             {&COUNTRY2;}
sub HENSYU		{&HENSYU2;}
sub KAIZAN		{&KAIZAN2;&HENSYU2;}

sub COOKIES              {&COOKIES2;}
sub DEL		{&DEL2;&COOKIES2;}

sub MAINTENANCE{
	&HEADER;
	print << "	-----END-----";
	<table width=100% height=100%><tr><td align=center>
		<table border=0 cellpadding=0 cellspacing=0 bgcolor="#909090" align=center
		 style="border:1px outset #909090;font-size:16px;">
		<form action=$SCRIPTNM method=POST><input type=hidden name="cmd" value="MAINTE2">
		<tr><td style="background-color:#404040;" colspan=2>
		&nbsp;Maintenance Mode</td></tr>
		<tr><td align=center><b style="color:#000000;">PASS</b></td>
		<td><input type=password name="pass" style="height:21px; color:#ffffff; font-size:16px; background:#000000; border:1 inset #c0c0c0;">
		<input type=submit value=Login class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
		</td></tr></form></table>
	<form action=$MAIN_SCRIPT method=POST>
	<input type=submit value=确定 class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
	</form>
	</td></tr></table>
		
	-----END-----
}
sub MAINTENANCE2{
	&ERROR('密码错误！！') if $MASTER_PWD ne "$FORM{'pass'}";
	
	&HEADER;
	print << "	-----END-----";
	<form action=$SCRIPTNM method=POST name=mainte>
	<input type=hidden name="cmd"><input type=hidden name="pass" value="$FORM{'pass'}">
	<table width=100% height=100%><tr><td align=center>

	<table class=font9 cellspacing=2 cellpadding=3 bgcolor="#909090">
		<tr><td bgcolor=#404040 colspan=3><center><b>管理菜单</b></center></td></tr>

        <tr><td bgcolor=#404040 align=center>人物资料修改</td>
        <td style="border:1px solid #404040;font-size:12px;color:#000000;">可以修改人物的资料。</td>
        <td style="border:1px solid #404040;"><input type=submit value="GO" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick="mainte.cmd.value='ebadministrator'"></td>
        </tr>

        <tr><td bgcolor=#404040 align=center>国家资料修改</td>
        <td style="border:1px solid #404040;font-size:12px;color:#000000;">可以修改各国的资料。</td>
        <td style="border:1px solid #404040;"><input type=submit value="GO" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick="mainte.cmd.value='COUNTRY'"></td>
        </tr>

        <tr><td bgcolor=#404040 align=center>档案导出</td>
        <td style="border:1px solid #404040;font-size:12px;color:#000000;">资料导出。</td>
        <td style="border:1px solid #404040;"><input type=submit value="GO" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick="mainte.cmd.value='BACKUP'"></td>
        </tr>
        <tr><td bgcolor=#404040 align=center>档案导入</td>
        <td style="border:1px solid #404040;font-size:12px;color:#000000;">资料导入。</td>
        <td style="border:1px solid #404040;"><input type=submit value="GO" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick="mainte.cmd.value='DATAUP'"></td>
        </tr>

        <tr><td bgcolor=#404040 align=center>玩家管理</td>
        <td style="border:1px solid #404040;font-size:12px;color:#000000;">参加者削除期限和表\示</td>
        <td style="border:1px solid #404040;"><input type=submit value="GO" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick="mainte.cmd.value='COOKIES'"></td>
        </tr>

	</table></form>
	<form action=$MAIN_SCRIPT method=POST>
	<input type=submit value=返回 class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
	</form>
	</td></tr></table>

	-----END-----
	&FOOTER;

}

sub MASTER2{
&ERROR('密码错误！！') if $MASTER_PWD ne "$FORM{'pass'}";
&HEADER2;
&DBM_INPORT(P);
print << "-----END-----";
	<script language="JavaScript">
		function syusei(nm){
			fm1.plname.value=nm;
			fm1.sbm1.click();
		}
		
	</script>
	<form action=$SCRIPTNM method=POST name=fm1 style="position:absolute;visibility:hidden;">
	<input type=hidden name="cmd" value=SYUSEI>
	<input type=hidden name="plname">
	<input type=hidden name="pass" value="$FORM{'pass'}">
	<input type=submit name="sbm1">
        </form>
<table width=100% height=100%><tr><td align=left>
《检索机能\:<a href="http://www12.big.or.jp/~kazu777/">kazu777</a>》
<form onSubmit="return seek_str(this.strings.value);">
输入要搜索的内容。
<input name=strings type=text size=15 onChange="n = 0;">
<input type=submit value="检索">
</form>
<table cellspacing=2 cellpadding=3 bgcolor="#909090" style="font-size:16px;" border=1>
<tr><td bgcolor=#404040 colspan=35><b>人物资料修改</b></td></tr>
<tr><td>编号</td><td>$c </td><td>帐号</td><td>阶级</td><td>战历</td><td>PASS</td><td>MS型</td><td>成长型</td><td>所属国</td><td>国内</td><td>发言</td><td>资金</td><td>武器</td><td>\预\备1</td><td>\预\备2</td><td>性格</td><td>色</td><td>武器经验</td><td>HP</td><td>MAXHP</td><td>EN</td><td>MAXEN</td><td>攻击力</td><td>防御力</td><td>敏捷度</td><td>命中率</td><td>改造回数</td><td>熟练</td><td>修理状态</td><td>时间</td><td>画像</td><td>部队</td><td>等级</td><td>经验</td><td>选择</td></tr>

-----END-----
while (my($key,$val) = each %P){
@VALS = split(/\s/,$val);$ET++;
print "<tr><td>$ET</td><td>$c </td><td>$key</td><td>$VALS[0]</td><td>$VALS[1]</td><td>$VALS[2]</td><td>$VALS[3]</td><td>$VALS[4]</td><td>$VALS[5]</td><td>$VALS[6]</td><td>$VALS[7]</td><td>$VALS[8]</td><td>$VALS[9]</td><td>$VALS[10]</td><td>$VALS[11]</td><td>$VALS[12]</td><td>$VALS[13]</td><td>$VALS[14]</td><td>$VALS[15]</td><td>$VALS[16]</td><td>$VALS[17]</td><td>$VALS[18]</td><td>$VALS[19]</td><td>$VALS[20]</td><td>$VALS[21]</td><td>$VALS[22]</td><td>$VALS[23]</td><td>$VALS[24]</td><td>$VALS[25]</td><td>$VALS[26]</td><td>$VALS[27]</td><td>$VALS[28]</td><td>$VALS[29]</td><td>$VALS[30]</td><td><a href=javascript:syusei(\"$key\")>修正</a></td></tr>";
}

print << "-----END-----";

<form action=$SCRIPTNM method=POST>
<input type=hidden name="cmd" value="MAINTE2">
<input type=hidden name="pass" value=\"$FORM{'pass'}\"><tr><td colspan=35>
<input type=submit value=返回 class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
</td></tr></table>
-----END-----
&FOOTER;
print "</td></tr></table></form></body>";
}

sub SYUSEI2{
&ERROR('密码错误！！') if $MASTER_PWD ne "$FORM{'pass'}";
&HEADER;
&DBM_INPORT(P);

@VALS = split(/\s/,$P{"$FORM{'plname'}"});

print << "-----END-----";
	<script language="JavaScript">
		function tyousei(nm){
			fm1.plname.value=nm;
			fm1.sbm1.click();
		}
		
	</script>

<table width=100% height=100%><tr><td align=center>
<table cellspacing=2 cellpadding=3 bgcolor="#909090" style="font-size:16px;" border=1>

<tr><td bgcolor=#404040 colspan=35>

<form action=$SCRIPTNM method=POST name=fm1 style="visibility:hidden;">
	<input type=hidden name="cmd" value=TYOUSEI>
	<input type=hidden name="plname">
	<input type=hidden name="pass" value="$FORM{'pass'}">
	<input type=submit name="sbm1">
</td></tr>
<tr><td bgcolor=#404040 colspan=35><b>国家资料修改</b></td></tr>
<tr><td>编号</td><td>$c </td><td>名前</td><td>阶级</td><td>战历</td><td>PASS</td><td>MS型</td><td>成长</td><td>所属国</td><td>国内</td><td>发言</td><td>资金</td><td>武器</td><td>\预\备1</td><td>\预\备2</td><td>性格</td><td>色</td><td>武器经验</td><td>H P</td><td>MAXHP</td><td>E N</td><td>MAXEN</td><td>攻击力</td><td>防御力</td><td>敏捷度</td><td>命中率</td><td>改造回数</td><td>熟练</td><td>修理状态</td><td>时间</td><td>画像</td><td>部队</td><td>等级</td><td>经验</td><td>修正</td></tr>
	
<tr><td>NO.</td><td>$c </td><td>

</td><td>
<input type=text name="para0" value="$VALS[0]"></td><td><input type=text name="para1" value="$VALS[1]"></td><td><input type=text name="para2" value="$VALS[2]"></td><td><input type=text name="para3" value="$VALS[3]"></td><td><input type=text name="para4" value="$VALS[4]"></td><td><input type=text name="para5" value="$VALS[5]"></td><td><input type=text name="para6" value="$VALS[6]"></td><td><input type=text name="para7" value="$VALS[7]"></td><td><input type=text name="para8" value="$VALS[8]"></td><td><input type=text name="para9" value="$VALS[9]"></td><td><input type=text name="para10" value="$VALS[10]"></td>
<td><input type=text name="para11" value="$VALS[11]"></td><td><input type=text name="para12" value="$VALS[12]"></td><td><input type=text name="para13" value="$VALS[13]"></td><td><input type=text name="para14" value="$VALS[14]"></td><td><input type=text name="para15" value="$VALS[15]"></td><td><input type=text name="para16" value="$VALS[16]"></td><td><input type=text name="para17" value="$VALS[17]"></td><td><input type=text name="para18" value="$VALS[18]"></td><td><input type=text name="para19" value="$VALS[19]"></td><td><input type=text name="para20" value="$VALS[20]"></td>
<td><input type=text name="para21" value="$VALS[21]"></td><td><input type=text name="para22" value="$VALS[22]"></td><td><input type=text name="para23" value="$VALS[23]"></td><td><input type=text name="para24" value="$VALS[24]"></td><td><input type=text name="para25" value="$VALS[25]"></td><td><input type=text name="para26" value="$VALS[26]"></td><td><input type=text name="para27" value="$VALS[27]"></td><td><input type=text name="para28" value="$VALS[28]"></td><td><input type=text name="para29" value="$VALS[29]"></td><td><input type=text name="para30" value="$VALS[30]">
</td></form><td>↓</td></tr>
        
-----END-----

print "<tr><td>☆</td><td>$c </td><td>$FORM{'plname'}</td><td>$VALS[0]</td><td>$VALS[1]</td><td>$VALS[2]</td><td>$VALS[3]</td><td>$VALS[4]</td><td>$VALS[5]</td><td>$VALS[6]</td><td>$VALS[7]</td><td>$VALS[8]</td><td>$VALS[9]</td><td>$VALS[10]</td><td>$VALS[11]</td><td>$VALS[12]</td><td>$VALS[13]</td><td>$VALS[14]</td><td>$VALS[15]</td><td>$VALS[16]</td><td>$VALS[17]</td><td>$VALS[18]</td><td>$VALS[19]</td><td>$VALS[20]</td><td>$VALS[21]</td><td>$VALS[22]</td><td>$VALS[23]</td><td>$VALS[24]</td><td>$VALS[25]</td><td>$VALS[26]</td><td>$VALS[27]</td><td>$VALS[28]</td><td>$VALS[29]</td><td>$VALS[30]</td><td><a href=javascript:tyousei(\"$FORM{plname}\")>确定</a></td></tr>";


print << "-----END-----";

<form action=$SCRIPTNM method=POST>
<input type=hidden name="cmd" value="MASTER2">
<input type=hidden name="pass" value=\"$FORM{'pass'}\"><tr><td colspan=35>
<input type=submit value=返回 class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
</td></tr></table>
-----END-----
&FOOTER;
print "</td></tr></table></form></body>";
}
sub SYUSEI4{
&ERROR('密码错误！！') if $MASTER_PWD ne "$FORM{'pass'}";
&HEADER;
&DBM_INPORT(P);
	open(IN,"$USERDATA/$FORM{'plname'}.cgi")|| &error('              ','指定                          。');
	@PLVALS=<IN>;
	close(IN);
    foreach(@PLVALS){($NAME,$PLVALS2[0],$PLVALS2[1],$PLVALS2[2],$PLVALS2[3],$PLVALS2[4],$PLVALS2[5],$PLVALS2[6],$PLVALS2[7],$PLVALS2[8],$PLVALS2[9],$PLVALS2[10],$PLVALS2[11],$PLVALS2[12],$PLVALS2[13],$PLVALS2[14],$PLVALS2[15],$PLVALS2[16],$PLVALS2[17],$PLVALS2[18],$PLVALS2[19],$PLVALS2[20],$PLVALS2[21],$PLVALS2[22],$PLVALS2[23],$PLVALS2[24],$PLVALS2[25],$PLVALS2[26],$PLVALS2[27],$PLVALS2[28],$PLVALS2[29],$PLVALS2[30])=split(/<>/);
    &ERROR('      ！！') if $NAME ne "$FORM{'plname'}";
}

 @VALS = split(/\s/,$P{"$FORM{'plname'}"});

print << "-----END-----";
	<script language="JavaScript">
		function syuuhuku(nm){
			fm1.plname.value=nm;
			fm1.sbm1.click();
		}
		
	</script>

<table width=100% height=100%><tr><td align=center>
<table cellspacing=2 cellpadding=3 bgcolor="#909090" style="font-size:16px;" border=1>

<tr><td bgcolor=#404040 colspan=35>

<form action=$SCRIPTNM method=POST name=fm1 style="visibility:hidden;">
	<input type=hidden name="cmd" value=SYUUHUKU>
	<input type=hidden name="plname">
	<input type=hidden name="pass" value="$FORM{'pass'}">
	<input type=submit name="sbm1">
</td></tr>
<tr><td bgcolor=#404040 colspan=35><b>国家资料修改</b></td></tr>
<tr><td>编号</td><td>$c </td><td>名前</td><td>阶级</td><td>战历</td><td>PASS</td><td>MS型</td><td>成长</td><td>所属国</td><td>国内</td><td>发言</td><td>资金</td><td>武器</td><td>\预\备1</td><td>\预\备2</td><td>性格</td><td>色</td><td>武器经验</td><td>H P</td><td>MAXHP</td><td>E N</td><td>MAXEN</td><td>攻击力</td><td>防御力</td><td>敏捷度</td><td>命中率</td><td>改造回数</td><td>熟练</td><td>修理状态</td><td>时间</td><td>画像</td><td>部队</td><td>等级</td><td>经验</td><td>修正</td></tr>
	
<tr><td>?  /td><td>$c </td><td>

</td><td>
<input type=text name="para0" value="$PLVALS2[0]"></td><td><input type=text name="para1" value="$PLVALS2[1]"></td><td><input type=text name="para2" value="$PLVALS2[2]"></td><td><input type=text name="para3" value="$PLVALS2[3]"></td><td><input type=text name="para4" value="$PLVALS2[4]"></td><td><input type=text name="para5" value="$PLVALS2[5]"></td><td><input type=text name="para6" value="$PLVALS2[6]"></td><td><input type=text name="para7" value="$PLVALS2[7]"></td><td><input type=text name="para8" value="$PLVALS2[8]"></td><td><input type=text name="para9" value="$PLVALS2[9]"></td><td><input type=text name="para10" value="$PLVALS2[10]"></td>
<td><input type=text name="para11" value="$PLVALS2[11]"></td><td><input type=text name="para12" value="$PLVALS2[12]"></td><td><input type=text name="para13" value="$PLVALS2[13]"></td><td><input type=text name="para14" value="$PLVALS2[14]"></td><td><input type=text name="para15" value="$PLVALS2[15]"></td><td><input type=text name="para16" value="$PLVALS2[16]"></td><td><input type=text name="para17" value="$PLVALS2[17]"></td><td><input type=text name="para18" value="$PLVALS2[18]"></td><td><input type=text name="para19" value="$PLVALS2[19]"></td><td><input type=text name="para20" value="$PLVALS2[20]"></td>
<td><input type=text name="para21" value="$PLVALS2[21]"></td><td><input type=text name="para22" value="$PLVALS2[22]"></td><td><input type=text name="para23" value="$PLVALS2[23]"></td><td><input type=text name="para24" value="$PLVALS2[24]"></td><td><input type=text name="para25" value="$PLVALS2[25]"></td><td><input type=text name="para26" value="$PLVALS2[26]"></td><td><input type=text name="para27" value="$PLVALS2[27]"></td><td><input type=text name="para28" value="$PLVALS2[28]"></td><td><input type=text name="para29" value="$PLVALS2[29]"></td><td><input type=text name="para30" value="$PLVALS2[30]">
</td></form><td>↓</td></tr>
        
-----END-----

print "<tr><td>☆</td><td>$c </td><td>$FORM{'plname'}</td><td>$VALS[0]</td><td>$VALS[1]</td><td>$VALS[2]</td><td>$VALS[3]</td><td>$VALS[4]</td><td>$VALS[5]</td><td>$VALS[6]</td><td>$VALS[7]</td><td>$VALS[8]</td><td>$VALS[9]</td><td>$VALS[10]</td><td>$VALS[11]</td><td>$VALS[12]</td><td>$VALS[13]</td><td>$VALS[14]</td><td>$VALS[15]</td><td>$VALS[16]</td><td>$VALS[17]</td><td>$VALS[18]</td><td>$VALS[19]</td><td>$VALS[20]</td><td>$VALS[21]</td><td>$VALS[22]</td><td>$VALS[23]</td><td>$VALS[24]</td><td>$VALS[25]</td><td>$VALS[26]</td><td>$VALS[27]</td><td>$VALS[28]</td><td>$VALS[29]</td><td>$VALS[30]</td><td>
<a href=javascript:syuuhuku(\"$FORM{plname}\")>?  /a></td></tr>";


print << "-----END-----";

<form action=$SCRIPTNM method=POST>
<input type=hidden name="cmd" value="DATAUP2">
<input type=hidden name="pass" value=\"$FORM{'pass'}\"><tr><td colspan=35>
<input type=submit value=返回 class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
</td></tr></table>
-----END-----
&FOOTER;
print "</td></tr></table></form></body>";
}

sub TYOUSEI2{
&LOCK;
	dbmopen (%P,"$DBM_P",0666);
		@VALS = split(/\s/,$P{"$FORM{'plname'}"});
                $VALS[0]=$FORM{'para0'};
                $VALS[1]=$FORM{'para1'};
                $VALS[2]=$FORM{'para2'};
                $VALS[3]=$FORM{'para3'};
                $VALS[4]=$FORM{'para4'};
                $VALS[5]=$FORM{'para5'};
                $VALS[6]=$FORM{'para6'};
                $VALS[7]=$FORM{'para7'};
                $VALS[8]=$FORM{'para8'};
                $VALS[9]=$FORM{'para9'};
                $VALS[10]=$FORM{'para10'};
                $VALS[11]=$FORM{'para11'};
                $VALS[12]=$FORM{'para12'};
                $VALS[13]=$FORM{'para13'};
                $VALS[14]=$FORM{'para14'};
                $VALS[15]=$FORM{'para15'};
                $VALS[16]=$FORM{'para16'};
                $VALS[17]=$FORM{'para17'};
                $VALS[18]=$FORM{'para18'};
                $VALS[19]=$FORM{'para19'};
                $VALS[20]=$FORM{'para20'};
                $VALS[21]=$FORM{'para21'};
                $VALS[22]=$FORM{'para22'};
                $VALS[23]=$FORM{'para23'};
                $VALS[24]=$FORM{'para24'};
                $VALS[25]=$FORM{'para25'};
                $VALS[26]=$FORM{'para26'};
                $VALS[27]=$FORM{'para27'};
                $VALS[28]=$FORM{'para28'};
                $VALS[29]=$FORM{'para29'};
                $VALS[30]=$FORM{'para30'};
		$P{"$FORM{'plname'}"}="@VALS";
	dbmclose %P;
&UNLOCK;
}

sub BACKUP2{
&ERROR('密码错误！！') if $MASTER_PWD ne "$FORM{'pass'}";
&HEADER;
&DBM_INPORT(P);
print << "-----END-----";

<table width=100% height=100%><tr><td align=center>
<table cellspacing=2 cellpadding=3 bgcolor="#909090" style="font-size:16px;" border=1>
<tr><td bgcolor=#404040><b>档案导出</b></td></tr>
<tr><td><font color=BLUE>错误警告</font></td></tr>

-----END-----
while (my($key,$val) = each %P){
@VALS = split(/\s/,$val);$ET++;

$VALS="$key<>$VALS[0]<>$VALS[1]<>$VALS[2]<>$VALS[3]<>$VALS[4]<>$VALS[5]<>$VALS[6]<>$VALS[7]<>$VALS[8]<>$VALS[9]<>$VALS[10]<>$VALS[11]<>$VALS[12]<>$VALS[13]<>$VALS[14]<>$VALS[15]<>$VALS[16]<>$VALS[17]<>$VALS[18]<>$VALS[19]<>$VALS[20]<>$VALS[21]<>$VALS[22]<>$VALS[23]<>$VALS[24]<>$VALS[25]<>$VALS[26]<>$VALS[27]<>$VALS[28]<>$VALS[29]<>$VALS[30]<>\n";
        if(!open(OUT,">$USERDATA/$key.cgi")){ &ERROR('UserData Directry open error'); }
	print OUT $VALS;
	close(OUT);
        chmod(0666,"$USERDATA/$key.cgi");

}

print << "-----END-----";

<form action=$SCRIPTNM method=POST>
<input type=hidden name="cmd" value="MAINTE2">
<input type=hidden name="pass" value=\"$FORM{'pass'}\"><tr><td>
<input type=submit value=返回 class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
</td></tr></table>
-----END-----
&FOOTER;
print "</td></tr></table></form></body>";
}

sub DATAUP2{
&ERROR('密码错误！！') if $MASTER_PWD ne "$FORM{'pass'}";
&HEADER2;
&DBM_INPORT(P);
print << "-----END-----";
	<script language="JavaScript">
		function hukugen(nm){
			fm1.plname.value=nm;
			fm1.sbm1.click();
		}
		
	</script>
	<form action=$SCRIPTNM method=POST name=fm1 style="position:absolute;visibility:hidden;">
	<input type=hidden name="cmd" value=HUKUGEN>
	<input type=hidden name="plname">
	<input type=hidden name="pass" value="$FORM{'pass'}">
	<input type=submit name="sbm1">

        </form>
<table width=100% height=100%><tr><td align=left>
《检索机能\:<a href="http://www12.big.or.jp/~kazu777/">kazu777</a>》
<form onSubmit="return seek_str(this.strings.value);">
输入要搜索的内容。
<input name=strings type=text size=15 onChange="n = 0;">
<input type=submit value="复原" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
</form>

	<form action=$SCRIPTNM method=POST>
	ID直接入力<input type="text" name="plname" SIZE="20">
	<input type=hidden name="cmd" value=HUKUGEN>
	<input type=hidden name="pass" value="$FORM{'pass'}">
	<input type=submit value="确定" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
    </form>

<table cellspacing=2 cellpadding=3 bgcolor="#909090" style="font-size:16px;" border=1>
<tr><td bgcolor=#404040 colspan=35><b>帐号选择</b></td></tr>
<tr><td>编号</td><td>$c </td><td>帐号</td><td>选择</td></tr>


-----END-----
while (my($key,$val) = each %P){
@VALS = split(/\s/,$val);$ET++;
print "<tr><td>$ET</td><td>$c </td><td>$key</td>
<td><a href=javascript:hukugen(\"$key\")>复原</a></td></tr>";
}

print << "-----END-----";

<form action=$SCRIPTNM method=POST>
<input type=hidden name="cmd" value="MAINTENANCE2">
<input type=hidden name="pass" value=\"$FORM{'pass'}\"><tr><td colspan=35>
<input type=submit value=返回 class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
</td></tr></table>
-----END-----
&FOOTER;
print "</td></tr></table></form></body>";
}

sub COUNTRY2{
&ERROR('密码错误！！') if $MASTER_PWD ne "$FORM{'pass'}";
&HEADER;
&DBM_INPORT(C);
print << "-----END-----";
	<script language="JavaScript">
		function hensyu(nm){
			fm1.cname.value=nm;
			fm1.sbm1.click();
		}
		
	</script>
	<form action=$SCRIPTNM method=POST name=fm1 style="position:absolute;visibility:hidden;">
	<input type=hidden name="cmd" value=HENSYU>
	<input type=hidden name="cname">
	<input type=hidden name="pass" value="$FORM{'pass'}">
	<input type=submit name="sbm1">
        </form>
<table width=100% height=100%><tr><td align=center>
<table cellspacing=2 cellpadding=3 bgcolor="#909090" style="font-size:16px;" border=1>
<tr><td bgcolor=#404040 colspan=17><b>国家资料修改</b></td></tr>
<tr><td>编号</td><td>$c </td><td>国名</td><td>颜色</td><td>\予\算</td><td>部队１</td><td>部队２</td><td>部队３</td><td>作战名</td><td>目标国</td><td>作战时间</td><td>部队１目标国</td><td>部队２目标国</td><td>部队３目标国</td><td>要塞（HP）</td><td>要塞名称</td><td>选择</td></tr>

-----END-----
while (my($key,$val) = each %C){
@VALS = split(/\s/,$val);$ET++;
print "<tr><td>$ET</td><td>$c </td><td>$key</td><td bgcolor=$VALS[0]>$VALS[0]</td><td>$VALS[1]</td><td>$VALS[2]</td><td>$VALS[3]</td><td>$VALS[4]</td><td>$VALS[5]</td><td>$VALS[6]</td><td>$VALS[7]</td><td>$VALS[8]</td><td>$VALS[9]</td><td>$VALS[10]</td><td>$VALS[11]</td><td>$VALS[12]</td><td><a href=\"javascript:hensyu('$key')\">修正</a></td></tr>";
}

print << "-----END-----";

<form action=$SCRIPTNM method=POST>
<input type=hidden name="cmd" value="MAINTE2">
<input type=hidden name="pass" value=\"$FORM{'pass'}\"><tr><td colspan=17>
<input type=submit value=返回 class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
</td></tr></table>
-----END-----
&FOOTER;
print "</td></tr></table></form></body>";
}

sub HENSYU2{
&ERROR('密码错误！！') if $MASTER_PWD ne "$FORM{'pass'}";
&HEADER;
&DBM_INPORT(C);

@VALS = split(/\s/,$C{"$FORM{'cname'}"});
print << "-----END-----";
	<script language="JavaScript">
		function kaizan(nm){
			fm1.cname.value=nm;
			fm1.sbm1.click();
		}
		
	</script>

<table width=100% height=100%><tr><td align=center>
<table cellspacing=2 cellpadding=3 bgcolor="#909090" style="font-size:16px;" border=1>

<tr><td bgcolor=#404040 colspan=35>

<form action=$SCRIPTNM method=POST name=fm1 style="visibility:hidden;">
	<input type=hidden name="cmd" value=KAIZAN>
	<input type=hidden name="cname">
	<input type=hidden name="pass" value="$FORM{'pass'}">
	<input type=submit name="sbm1">
</td><td>
<tr><td bgcolor=#404040 colspan=17><b>国家资料修改</b></td></tr>
<tr><td>编号</td><td>$c </td><td>国名</td><td>颜色</td><td>\予\算</td><td>部队１</td><td>部队２</td><td>部队３</td><td>作战名</td><td>目标国</td><td>作战时间</td><td>部队１目标国</td><td>部队２目标国</td><td>部队３目标国</td><td>要塞（HP）</td><td>要塞名称</td><td>选择</td></tr>
	
<tr><td>NO.</td><td>$c </td><td>

</td><td>
<input type=text name="para0" value="$VALS[0]"></td><td><input type=text name="para1" value="$VALS[1]"></td><td><input type=text name="para2" value="$VALS[2]"></td><td><input type=text name="para3" value="$VALS[3]"></td><td><input type=text name="para4" value="$VALS[4]"></td><td><input type=text name="para5" value="$VALS[5]"></td><td><input type=text name="para6" value="$VALS[6]"></td><td><input type=text name="para7" value="$VALS[7]"></td><td><input type=text name="para8" value="$VALS[8]"></td><td><input type=text name="para9" value="$VALS[9]"></td><td><input type=text name="para10" value="$VALS[10]"></td>
<td><input type=text name="para11" value="$VALS[11]"></td><td><input type=text name="para12" value="$VALS[12]"></td>
</td></form><td>↓</td></tr>
        
-----END-----

print "<tr><td>☆</td><td>$c </td><td>$FORM{'cname'}</td><td bgcolor=$VALS[0]>$VALS[0]</td><td>$VALS[1]</td><td>$VALS[2]</td><td>$VALS[3]</td><td>$VALS[4]</td><td>$VALS[5]</td><td>$VALS[6]</td><td>$VALS[7]</td><td>$VALS[8]</td><td>$VALS[9]</td><td>$VALS[10]</td><td>$VALS[11]</td><td>$VALS[12]</td><td><a href=\"javascript:kaizan('$FORM{'cname'}')\">确定</a></td></tr>";


print << "-----END-----";

<form action=$SCRIPTNM method=POST>
<input type=hidden name="cmd" value="COUNTRY">
<input type=hidden name="pass" value=\"$FORM{'pass'}\"><tr><td colspan=17>
<input type=submit value=返回 class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
</td></tr></table>
-----END-----
&FOOTER;
print "</td></tr></table></form></body>";
}

sub KAIZAN2{
&LOCK;
	dbmopen (%C,"$DBM_C",0666);
		@VALS = split(/\s/,$C{"$FORM{'cname'}"});
                $VALS[0]=$FORM{'para0'};
                $VALS[1]=$FORM{'para1'};
                $VALS[2]=$FORM{'para2'};
                $VALS[3]=$FORM{'para3'};
                $VALS[4]=$FORM{'para4'};
                $VALS[5]=$FORM{'para5'};
                $VALS[6]=$FORM{'para6'};
                $VALS[7]=$FORM{'para7'};
                $VALS[8]=$FORM{'para8'};
                $VALS[9]=$FORM{'para9'};
                $VALS[10]=$FORM{'para10'};
                $VALS[11]=$FORM{'para11'};
                $VALS[12]=$FORM{'para12'};
		$C{"$FORM{'cname'}"}="@VALS";
	dbmclose %C;
&UNLOCK;
}

sub COOKIES2{

&HEADER2;
&DBM_INPORT(P);
print << "-----END-----";
	<script language="JavaScript">
		function del(nm){
			fm1.plname.value=nm;
			fm1.sbm1.click();
                        alert('删除目前的资料吗？');
		}
		
	</script>
	<form action=$SCRIPTNM method=POST name=fm1 style="position:absolute;visibility:hidden;">
	<input type=hidden name="cmd" value=DEL>
	<input type=hidden name="plname">
	<input type=hidden name="pass" value="$FORM{'pass'}">
	<input type=submit name="sbm1">
        </form>
<table width=100% height=100%><tr><td align=center>
《检索机能\:<a href="http://www12.big.or.jp/~kazu777/">kazu777</a>》
<form onSubmit="return seek_str(this.strings.value);">
输入要搜索的内容。
<input name=strings type=text size=15 onChange="n = 0;">
<input type=submit value="复原" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
</form>
<table cellspacing=2 cellpadding=3 bgcolor="#909090" style="font-size:16px;" border=1>
<tr><td bgcolor=#404040 colspan=5><center><b>削除期限</b></center></td></tr>
<tr><td>编号</td><td>帐号</td><td>削除期限</td><td>最後登录时间</td><td>　</td></tr>

-----END-----
$i=0;@tmp1 =();
while (my($key,$val) = each %P){
@VALS = split(/\s/,$val);
push(@tmp1, $VALS[26]);
$PNAME[$i]=$key;

$PLIMIT[$i]=int(($COOKIE_KEEP*24*60*60-(time-$VALS[26]))/(24*60*60));
$PTIME[$i]=$VALS[26];

$i++;
}

@PNAME = @PNAME[sort {$tmp1[$a] <=> $tmp1[$b]} 0 .. $#tmp1];
@PLIMIT = @PLIMIT[sort {$tmp1[$a] <=> $tmp1[$b]} 0 .. $#tmp1];
@PTIME = @PTIME[sort {$tmp1[$a] <=> $tmp1[$b]} 0 .. $#tmp1];

$j=0;$count=$i-1;
foreach(0..$count) {
     $k=$j+1;
print "<tr><td>$k</td><td><font>$PNAME[$j]</font></td><td><font color=BLACK>【$PLIMIT[$j]日】</font></td>";
print "<td>".&DATE_DECORD($PTIME[$j]);
print "</td><td><a href=\"javascript:del('$PNAME[$j]')\">削除</a></td>";

print "</tr>";
$j++;
}

print << "-----END-----";

<form action=$SCRIPTNM method=POST>
<input type=hidden name="cmd" value="MAINTE2">
<input type=hidden name="pass" value=\"$FORM{'pass'}\"><tr><td colspan=5>
<input type=submit value=返回 class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
</td></tr></table>
-----END-----
&FOOTER;
print "</td></tr></table></form></body>";
}

sub DEL2{
	&ERROR('密码错误！！') if $MASTER_PWD ne "$FORM{'pass'}";
&LOCK;
	dbmopen (%P,"$DBM_P",0666);
		delete $P{"$FORM{'plname'}"};
	dbmclose %H;
&UNLOCK;
}

sub HEADER2 {
	$BG_MAIN="bgcolor=\"$BG_MAIN\"" if $BG_MAIN !~ /\./;
	$BG_MAIN="background=\"$BG_MAIN\"" if $BG_MAIN =~ /\./;
	print "Content-type: text/html\n\n";
	print << "	-----END-----";
	<!DOCTYPE HTML PUBLIC -//IETF//DTD HTML//EN>
	<html><head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
	<title>ENDLESS BATTLE</title>
<SCRIPT LANGUAGE="JavaScript">
<!--
var Nsc4 = (document.layers);
var Ie4 = (document.all);

var win = this;
var n   = 0;

function seek_str(str) {
var txt, i, found;
  if (str == ""){
    alert("检查的文字不在我们的  围之内");
    return false;
  }
  if (Nsc4) {
    if (!win.find(str)){
      while(win.find(str, false, true)){
        n++;
      }
    }else{
      n++;
    }
    if (n == 0){alert(str + "太多日文番不出来。");}
  }
  if (Ie4) {
    txt = win.document.body.createTextRange();
    for (i = 0; i <= n && (found = txt.findText(str)) != false; i++) {
      txt.moveStart("character", 1);
      txt.moveEnd("textedit");
    }
    if (found) {
      txt.moveStart("character", -1);
      txt.findText(str);
      txt.select();
      txt.scrollIntoView();
      n++;
    }else{
      if (n > 0) {
        n = 0;
        seek_str(str);
      }else{
        alert(str + "太多日文番不出来。");
      }
    }
  }
  return false;
}
//-->
</script>
        </head>
	<body $BG_MAIN text="$FONT_COLOR" style=\"margin:0px 0px 0px 0px;\" oncontextmenu="return false;">
	-----END-----
}
