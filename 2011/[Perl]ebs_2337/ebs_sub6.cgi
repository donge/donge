$to='l';$o=time;

#################################
#	���û�ע���¼		#
#	www.ltb.idv.tw	#
#################################
sub ENTRY2 {
	dbmopen (%P,"$DBM_P",0666);
	while (($Name,$Val) = each %P){
		@VALUES = split(/\s/,$Val);
		if ($VALUES[26] && ($VALUES[26] < time-(172800*$COOKIE_KEEP) && $VALUES[6]==0)||($VALUES[26] < time-172800 && !$VALUES[23])){
			delete $P{"$Name"};
		}else{$CountPl++;}
	}
		dbmclose %P;

### add reg time test 	
	$REGIP=$ENV{'REMOTE_ADDR'};$REGTIME=time;$regflag=1;
	&DBM_INPORT(L);
	$lc=0;
	foreach $t(sort {$b <=> $a} keys %L){$lc++;if ($lc <= $LOGIN_H){@lgn=split(/!/,$L{"$t"});
	if (($lgn[1]eq$REGIP)&&($REGTIME<=($t+$REGTIMELIM))&&$t&&$regflag){$regflag=0;}}}
	if ($regflag==0){&ERROR('�����ʲô�ǲ�����ɱ����ID�أ�!');}
### add reg time test end

	&DBM_INPORT(C);
	require "$LOG_FOLDER/$HASH_DATA";
	if ($CountPl >= $ENTRY_MAX){&ERROR('�����˵�¼�������޶�');}
	&HEADER2;
	print "���ip:$REGIP";
	print << "	-----END-----";
	<script language="JavaScript">
		function changeImg(){
			num=document.entry.imgSelect.selectedIndex;
			document.msImg.src="$IMG_FOLDER2/"+ num +".gif";
		}
		function checkRiyou (){
			if (document.entry.pname.value == '') {window.alert("�û���û������");return false
			}else if(document.entry.msname.value == '') {window.alert("������û������");return false
			}else if(document.entry.pass.value == '') {window.alert("���뻹û������");return false
			}else if(document.entry.pname.value.match('[&! =.,<>]') != null) {
				window.alert("��ʹ���˰�Ƿ��Ż����������뻻һ���ַ�");return false ;
			}else if(document.entry.msname.value.match('[&! =.,<>]') != null) {
				window.alert("��ʹ���˰�Ƿ��Ż����������뻻һ���ַ�");return false ;
			}else if(document.entry.pass.value.match('[&! =.,<>]') != null) {
				window.alert("��ʹ���˰�Ƿ��Ż����������뻻һ���ַ�");return false ;
			}else {if (confirm('��¼ȷ��') == true){return true;}else{return false}	}
		}
	</script>
	<style type="text/css">
		.td1{text-align:center;background-color:#909090;font-weight:bold;font-size:16px;color:#404040;}
	</style>
	<table width=100% height=100%><tr><td $center>
	<img src=$IMG_FOLDER4/reg.gif>
	</td></tr><tr><td $center>
	<form action=$MAIN_SCRIPT method=POST name=entry>
	<input type=hidden name=cmd value=KAKUNIN>
	<table $tb_stl>
	<tr><td>�û���</td>
	    <td><input type=text name=pname size=15 maxlength=10 $STYLE_L>
	    <font style="font-size:12px;">�������û���</font></td>
	<td $middle rowspan=7><img src=\"$IMG_FOLDER2/1.gif\" name=\"msImg\" height=140 width=114></td>
	</tr>
	<tr><td>������</td><td><input type=text name=msname size=15 maxlength=10 $STYLE_L> �����������</td></tr>
	<tr><td>�û�����</td><td><input type=password maxlength=8 name=pass size=15 $STYLE_L>
	    <font style="font-size:12px;">�û�����<font color=red><b>���</b></font>���8���ַ�</font></td></tr>
    <tr><td>ѡ��սʿ</td><td><select name=imgSelect $STYLE_L onChange=\"changeImg()\">
	-----END-----
	foreach (0..$ICON){
		print "<option value=\"$_\">&nbsp;ICON No.$_\n";
		}
	print << "	-----END-----";
	</select> <a href="$MAIN_SCRIPT?ICON" target="_blank"><font color=#FFFFFF size=2>սʿͼ��</font></a></td></tr>
	<tr><td>��������</td><td><select name=type $STYLE_L>
	<option value=1>&nbsp;����������&nbsp;<option value=2>����������<option value=3>�ر�������
	<option value=4>����������<option value=0>ƽ����</select></td></tr>
	<tr><td>�Ը� </td><td><select name=chara $STYLE_L>
	<option value=0>��Ѫ<br><option value=1>����<br><option value=2>ƽ��<br>
	<option value=3>����<br><option value=4>�侲<br><option value=5>���</select></td></tr>
	<tr><td>����</td><td><select name=w $STYLE_L>
	-----END-----
	while (my($wkey,$wvalue) =each %WEAPON_LIST) {
		if (length($wkey) == 1){my@w=split(/,/,$wvalue);print "<option value=$wkey>$w[0]\n" if $w[6] !=2 && $w[6] !=6 && $w[6] !=4;}
	}

	print "</select> <a href=\"$MAIN_SCRIPT?WEAPON\" target=\"_blank\"><font color=#FFFFFF size=2>��������</font></a></td></tr><tr><td>�� ɫ</td>";
	print "<td colspan=2><input type=radio name=cl value=#FFFFFF checked><font color=#FFFFFF>��</font>\n";
		$br=1;
		foreach (@COLOR){$br++;
			print "<input type=\"radio\" name=\"cl\" value=$_><font color=$_>��</font>\n";
		if ($br==10){print"<br>\n";$br=0;}
		}
	print "</td></tr><tr><td>����<td colspan=2>\n";
	print "<select size=1 name=\"kuni\" $STYLE_L>\n";
	while (($key,$value) =each %C) {print "<option value=$key>$key\n";}
	print "<option value=\"\">������";
	print << "	-----END-----";
		</select></td></tr>
			<tr><td colspan=3 align="center">
			<input type=submit value=��¼ class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick="return checkRiyou()">
			<input type=reset value=��� class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
		    </td></tr></table></td></tr><tr><td align=center>
	-----END-----
	&FOOTER;
	print "</td></tr></form></body>";
}

#################################
#	��֤����ȷ����¼	#
#	www.downlove.com	#
#################################
sub KAKUNIN2 {
	&LOCK;
	&DBM_INPORT(P);
	&UNLOCK;
	if($P{"$FORM{'pname'}"}){&ERROR('����û����Ѿ�����ʹ�ã���ѡ�������û���'); }
	if (!$FORM{'pname'} && !$FORM{'msname'} && !$FORM{'pass'}) { &ERROR('����ɱ���ѡ��'); }
	if (length($FORM{'pname'}) >= 30 or length($FORM{'msname'}) >= 30){&ERROR('�û������߻������Ƴ����涨����');}

### add 2nd count test
	dbmopen (%P,"$DBM_P",0666);
	while (($Name,$Val) = each %P){
		@VALUES = split(/\s/,$Val);
		if ($VALUES[26] && $VALUES[26] < time-(172800*$COOKIE_KEEP) && $VALUES[6]==0){
			delete $P{"$Name"};
		}else{$CountPl++;}
	}
	dbmclose %P;
	if ($CountPl >= $ENTRY_MAX){&ERROR('��¼��������');}
### add 2nd count test
### add reg time test 	
	$REGIP=$ENV{'REMOTE_ADDR'};$REGTIME=time;$regflag=1;
	&DBM_INPORT(L);
	$lc=0;
	foreach $t(sort {$b <=> $a} keys %L){$lc++;if ($lc <= $LOGIN_H){@lgn=split(/!/,$L{"$t"});
	if (($lgn[1]eq$REGIP)&&($REGTIME<=($t+$REGTIMELIM))&&$t&&$regflag){$regflag=0;}}}
	if ($regflag==0){&ERROR('ͬipע��ʱ����̫��!');}
### add reg time test end

	&HEADER2;
	print << "	-----END-----";
	<style type="text/css">
		.td1{text-align:center;background-color:#909090;font-weight:bold;font-size:16px;color:#404040;}
	</style>
	<script language="JavaScript">
	function checkEntry(){if(confirm('��¼��������ȷ�����') == true){return true;}else{return false}
	}
	</script>
	<table width=100% height=100%><tr><td $center>
	<img src=$IMG_FOLDER4/logo_wars.gif>
	</td></tr><tr><td $center>
	<table $tb_stl><tr><td style="font-size:16px;">�û���</td>
	<td style="font-size:16px;">$FORM{'pname'}���벻Ҫ�����ˣ�</td></tr>
	<tr><td>�û�����</td>
	<td style="font-size:16px;">$FORM{'pass'}���벻Ҫ�����ˣ�</td></tr>
	<tr><td>�� ��</td>
	<td style="font-size:16px;">$FORM{'kuni'}</td></tr>
	<tr><td style="font-size:16px;">ͷ ��</td>
	<td><img src=\"$IMG_FOLDER2/$FORM{'imgSelect'}.gif\"><font color=\"$FORM{'cl'}\">$FORM{'msname'}</font>
	</td></tr></table>
	<form action=$MAIN_SCRIPT method=POST target=\"_top\">
	<input type=hidden name=cmd value=RESIST>
	<input type=hidden name=pname value=$FORM{'pname'}>
	<input type=hidden name=msname value=$FORM{'msname'}>
	<input type=hidden name=msImg value=$FORM{'imgSelect'}>
	<input type=hidden name=pass value=$FORM{'pass'}>
	<input type=hidden name=kuni value=$FORM{'kuni'}>
	<input type=hidden name=type value=$FORM{'type'}>
	<input type=hidden name=w value=$FORM{'w'}>
	<input type=hidden name=chara value=$FORM{'chara'}>
	<input type=hidden name=cl value=$FORM{'cl'}>
	<p align=center><input type=submit value=��¼ class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick=\"return checkEntry()\">
	</form>
	<form action="$MAIN_SCRIPT?ENTRY" method=POST>
	<input type=submit value=����ע�� class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\"></form>
	</td></tr><tr><td $center>
	-----END-----
	&FOOTER;
	print "</td></tr></form></body>";
}
sub RESIST2 {

	### add 2nd count test
	dbmopen (%P,"$DBM_P",0666);
	while (($Name,$Val) = each %P){
		@VALUES = split(/\s/,$Val);
		if ($VALUES[26] && $VALUES[26] < time-(172800*$COOKIE_KEEP) && $VALUES[6]==0){
			delete $P{"$Name"};
		}else{$CountPl++;}
	}
	dbmclose %P;
	if ($CountPl >= $ENTRY_MAX){&ERROR('��¼��������');}
	### add 2nd count test

	### add reg time test 	
	$REGIP=$ENV{'REMOTE_ADDR'};
	$REGTIME=time;
	$regflag=1;
	&DBM_INPORT(L);
	$lc=0;
	foreach $t(sort {$b <=> $a} keys %L){
		$lc++;
		if ($lc <= $LOGIN_H){
			@lgn=split(/!/,$L{"$t"});
			if (($lgn[1]eq$REGIP)&&($REGTIME<=($t+$REGTIMELIM))&&$t&&$regflag)
			{$regflag=0;}
		}
	}
	if ($regflag==0){&ERROR('ͬipע��ʱ����̫��!');}
	### add reg time test end
	### add login date
	if ($ENV{'REMOTE_HOST'}){$host="$ENV{'REMOTE_HOST'}";}else{$ipad=pack('C4',split(/\./,$ENV{'REMOTE_ADDR'}));
		$host = gethostbyaddr($ipad,2);}
		$lc=0;
		dbmopen (%L,"$DBM_L",0666);
			foreach (sort {$b <=> $a} keys %L){$lc++;delete $L{"$_"} if $lc > $LOGIN_H;}
			$L{"$DATE"}="$FORM{'pname'}!$ENV{'REMOTE_ADDR'}!$host";
		dbmclose %L;
	### add end
	
	&DBM_INPORT(P);
	$npwd=crypt "$FORM{'pname'}",eb;
	if ($npwd ne "ebWuEq.c3dTqg"){
	if($P{"$FORM{'pname'}"}){&ERROR('�Ƿ�ע�᷽ʽ','����post�ı�������'); }}
	
	$ST5=(int(rand(10)+1)*100)+1000;$ST6=(int(rand(10))*5)+100;
	$ST1=int rand(5)+3;$ST2=int rand(5)+3;$ST3=int rand(5)+3;$ST4=int rand(5)+3;
		if ($FORM{'type'} == 1){$ST5+=2500;$ST1+=2;$ST6+=50;}
 elsif ($FORM{'type'} == 2){$ST5+=3000;$ST2+=2;$ST6+=40;}
 elsif ($FORM{'type'} == 3){$ST5+=2000;$ST3+=2;$ST6+=50;}
 elsif ($FORM{'type'} == 4){$ST5+=2500;$ST4+=2;$ST6+=60;}
 elsif ($FORM{'type'} == 0){$ST5+=2000;$ST6+=40;}
	&LOCK;
	$pwd=crypt "$FORM{'pass'}",eb;
	dbmopen (%PL,"$DBM_P",0666);
		$PL{"$FORM{'pname'}"} = ("1 $DATE $pwd $FORM{'msname'} $FORM{'type'} $FORM{'kuni'} 0 noComment 0 $FORM{'w'}!0   $FORM{'chara'} $FORM{'cl'} 0 $ST5 $ST5 $ST6 $ST6 $ST1 $ST2 $ST3 $ST4 0 0 0 $DATE $FORM{'msImg'}  1 0");
	dbmclose (%PL);
	&UNLOCK;
	SET_COOKIE:{
		my @gmt = gmtime(time + $COOKIE_KEEP*24*60*60);
		$gmt[0] = sprintf("%02d", $gmt[0]);	$gmt[1] = sprintf("%02d", $gmt[1]);
		$gmt[2] = sprintf("%02d", $gmt[2]);	$gmt[3] = sprintf("%02d", $gmt[3]);	$gmt[5] += 1900;
		$gmt[4] = ('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec')[$gmt[4]];
		$gmt[6] = ('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday')[$gmt[6]];
		my $date_gmt = "$gmt[6], $gmt[3]\-$gmt[4]\-$gmt[5] $gmt[2]:$gmt[1]:$gmt[0] GMT";
		my $cook = "pname:$FORM{'pname'},pass:$FORM{'pass'}";print "Set-Cookie: EB=$cook; expires=$date_gmt\n";
	}
	print "Location: $MAIN_SCRIPT" . "\n\n";


}
sub DELETE4 {
	&HEADER2;
	@pair = split(/;/, $ENV{'HTTP_COOKIE'});
		foreach (@pair) {my($key, $value) = split(/=/, $_);$DUMMY{$key} = $value;}
	@pairs = split(/,/, $DUMMY{EB});
		foreach (@pairs) {my($key, $value) = split(/:/, $_);$COOKIE{$key} = $value;}
	print << "	-----END-----";
	<script language="JavaScript">
		function checkRiyou (){
			if (document.del.pname.value == '') {window.alert("IDû������");return false
			}else if(document.del.pass.value == '') {window.alert("PASSû������");return false
			}else {if (confirm('��¼��ɾ��') == true){return true;}else{return false}	}
		}
	</script>
		<table width=100% height=100%><tr><td align=center>
		<table bgcolor=#000000 border=0 style="font-size:12px;">
			<tr><td colspan=2 bgcolor=#646464 align=center><img src=\"$IMG_FOLDER1/w.gif\"></td></tr>
			<tr><td colspan=2 bgcolor=#000000>��¼��ɾ��<br>
			��¼��ɾ�������޷��ָ�<br><br></td></tr>
			<tr><td align=right style="height:21px; color:#ffffff; font-size:16px;">����<br>����</td>
				<td style="height:21px; color:#ffffff; font-size:16px;">
					<form action=$MAIN_SCRIPT method=POST target=_top name=del onSubmit="return checkRiyou()">
					<input type=hidden name=cmd value=DELETE>
					<input type=text size=20 name=pname value="$COOKIE{'pname'}" $STYLE_L><br>
					<input type=password size=15 name=pass value="$COOKIE{'pass'}" $STYLE_L>
					</td></tr>
			<tr><td colspan=3><br><br>ȷ��ɾ����<div align=center>
				<input type=submit value=\"ɾ��\" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\"></div>
			</td></tr>

		</table>
	-----END-----
	&FOOTER;
	print "</td></tr></table></form></body>";
}
sub DELETE3{
	$FlagE=0;
	&LOCK;
		dbmopen (%P,"$DBM_P",0666);
			@PL_VALUES = split(/\s/,$P{"$FORM{'pname'}"});
			$FlagE=1 if !$P{"$FORM{'pname'}"};
			$FlagE=1 if crypt("$FORM{'pass'}",eb) ne "$PL_VALUES[2]" && $PL_VALUES[2] && $FORM{'pass'};
			delete $P{"$FORM{'pname'}"} if !$FlagE;
		dbmclose %P;
	&UNLOCK;
	&ERROR('Error',"COOKIE��������\�޷���������\\nɾ�������ж�") if $FlagE==1;
	SET_COOKIE:{
		my @gmt = gmtime(time + $COOKIE_KEEP*24*60*60);
		$gmt[0] = sprintf("%02d", $gmt[0]);	$gmt[1] = sprintf("%02d", $gmt[1]);
		$gmt[2] = sprintf("%02d", $gmt[2]);	$gmt[3] = sprintf("%02d", $gmt[3]);	$gmt[5] += 1900;
		$gmt[4] = ('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec')[$gmt[4]];
		$gmt[6] = ('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday')[$gmt[6]];
		my $date_gmt = "$gmt[6], $gmt[3]\-$gmt[4]\-$gmt[5] $gmt[2]:$gmt[1]:$gmt[0] GMT";
		my $cook = "";print "Set-Cookie: EB=$cook; expires=$date_gmt\n";
	}
	print "Location: $MAIN_SCRIPT" . "\n\n";


}

sub EXPORT2 {
$to='l';$o=time;


	&HEADER if !$FORM{'pname'} && !$FORM{'pass'};
	print << "	-----END-----" if !$FORM{'pname'} && !$FORM{'pass'};
	<script language="JavaScript">
		function checkRiyou (){
			if (document.del.pname.value == '') {window.alert("IDû������");return false
			}else if(document.del.pass.value == '') {window.alert("PASSû������");return false
			}else {if (confirm('OKȷ�����¼�Ӹ÷�����ɾ����ת�Ƽ�¼��ʼ\\n��ȷ����') == true){return true;}else{return false}	}
		}
	</script>
		<table width=100% height=100%><tr><td align=center>
		<table bgcolor=#000000 border=0 style="font-size:12px;">
			<tr><td colspan=2 bgcolor=#646464 align=center><img src=\"$IMG_FOLDER1/w.gif\"></td></tr>
			<tr><td colspan=2 bgcolor=#000000 align=center>
			<b style="font-size:20px;">Data Export Utility</b><br>
			���ڵ���ת�ƿ�ʼ���ڵ���ת���ᣬ��Ľ�Ǯ<br>
			�������Լ��ȼ�����Ϣ������ʧ��Ҫ��������׼��<br>
			�����ȷ��Ҫת�Ƶ���<br>
			���������������<br><br>
			<br></td></tr>
			<tr><td align=right style="height:21px; color:#ffffff; font-size:16px;">�û���<br>
					�û�����</td>
				<td style="height:21px; color:#ffffff; font-size:16px;">
					<form action=$MAIN_SCRIPT method=POST target=_top name=del onSubmit="return checkRiyou()">
					<input type=hidden name=cmd value=EXPORT>
					<input type=text size=20 name=pname value="" $STYLE_L><br>
					<input type=password size=15 name=pass value="" $STYLE_L>
					</td></tr>
			<tr><td colspan=3 align=center><br><br>���������ס��Щ��Ϣ<br>
				<input type=submit value=\"Export\" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
			</td></form></tr>

		</table></td></tr></table>

	-----END-----
if ($FORM{'pname'} && $FORM{'pass'} && $FORM{'cmd'}){
	&LOCK;
		dbmopen (%P,"$DBM_P",0666);
			@pass = split(/\s/,$P{"$FORM{'pname'}"});
			if (!$P{"$FORM{'pname'}"}){dbmclose %P;&UNLOCK;&ERROR('�û����������');}
			if ($pass[2] ne crypt("$FORM{'pass'}",eb)){dbmclose %P;&UNLOCK;&ERROR('�����������');}
			delete $P{"$FORM{'pname'}"};
		dbmclose %P;
	&UNLOCK;
	my @gmt = gmtime(time + $COOKIE_KEEP*24*60*60);
	$gmt[0] = sprintf("%02d", $gmt[0]);	$gmt[1] = sprintf("%02d", $gmt[1]);
	$gmt[2] = sprintf("%02d", $gmt[2]);	$gmt[3] = sprintf("%02d", $gmt[3]);	$gmt[5] += 1900;
	$gmt[4] = ('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec')[$gmt[4]];
	$gmt[6] = ('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday')[$gmt[6]];
	my $date_gmt = "$gmt[6], $gmt[3]\-$gmt[4]\-$gmt[5] $gmt[2]:$gmt[1]:$gmt[0] GMT";
	my $cook = "";print "Set-Cookie: EB=$cook; expires=$date_gmt\n";

	$pass1=crypt "$FORM{'pname'}",eb;
	$pass3="$pass[19]$pass[20]$pass[21]$pass[22]";
	$pass3=crypt "$pass3",eb;
	$pass4="$pass[16]$pass[18]";
	$pass4=crypt "$pass4",eb;
	$pass5="$pass[12]$pass[29]";
	$pass5=crypt "$pass5",eb;
	@ex=("$pass[12]","$pass[16]","$pass[18]","$pass[19]","$pass[20]","$pass[21]","$pass[22]","$pass[23]","$pass[24]","$pass[29]","$o");
	foreach (@ex){
		foreach $k(0..9){$to++;$_ =~ s/$k/$to/eg;}
	}
	$EX="$ex[0]!$ex[1]!$pass1!$ex[2]!$ex[3]!$pass3!$ex[4]!$ex[5]!$pass[2]!$ex[6]!$ex[7]!$ex[8]!$pass4!$ex[9]!$pass5!$ex[10]";
	&HEADER;
	print << "	-----END-----";
		<table width=100% height=100%><tr><td align=center>
		<table bgcolor=#000000 border=0 style="font-size:12px;">
			<tr><td bgcolor=#646464 align=center><img src=\"$IMG_FOLDER1/w.gif\"></td></tr>
			<tr><td bgcolor=#000000 align=center>
			<b style="font-size:20px;">Data Export Utility</b><br>
			<div align=left>&nbsp;&nbsp;��¼ɾ�������ת����������<br>
			������ʾ������Ļ������ֵ����<br>
			��һ�ֲ�©��ճ������ļ��°���<br>
			���Ʊ��棬����ת�Ʒǳ���Ҫ<br>

			</div>
			&nbsp;&nbsp;ת�Ƶ�������Ч����Ϊһ������<br>�������ʱ�޵�ת�Ƶ����п��ܱ�ϵͳ��Ϊ��Ч</div>
			<br></td></tr>
			<tr>
				<td style="height:21px; color:#ffffff; font-size:16px;">
					<textarea rows=5 cols=50>$EX</textarea>
					</td></tr>
		</table>
	-----END-----
	&FOOTER;
	print "</td></tr></table></body>";

	}
}

sub INPORT2{
	&DBM_INPORT(P);
	@CountPl=keys %P;
	$Count=@CountPl;
	if ($Count >= $ENTRY_MAX){&ERROR('������¼�����޶�');}
	&HEADER;
	require "$LOG_FOLDER/$HASH_DATA";
	print << "	-----END-----";
	<script language="JavaScript">
		function checkRiyou (){
			if (document.del.pname.value == '') {window.alert("IDû������");return false
			}else if(document.del.pass.value == '') {window.alert("PASSû������");return false
			}else if(document.del.indata.value == '') {window.alert("����ֵ����û������");return false
			}else if(document.del.MsName.value == '') {window.alert("��������û������");return false
			}else {if (confirm('ת�ƻظ����Ͽ�ʼ\\n��ȷ����') == true){return true;}else{return false}	}
		}
	</script>
		<table width=100% height=100%><tr><td align=center>
		<table bgcolor=#000000 border=0 style="font-size:12px;">
			<tr><td colspan=2 bgcolor=#646464 align=center><img src=\"$IMG_FOLDER1/w.gif\"></td></tr>
			<tr><td colspan=2 bgcolor=#000000 align=center>
			<b style="font-size:20px;">Data Inport Utility</b><br>
			���ѡ���������������ط�ת�Ƶ��û���<br>
			����ע�����ԭ���Ľ�Ǯ���׼����Լ�������ת�����ǲ��ָܻ���<br>
			���µ�λ���������û����Լ�ת�ƴ���<br><br>
			<br></td></tr>
			<tr><td align=right style="height:21px; color:#ffffff; font-size:16px;" valign=top>�û���<br>
					�û�����<br><br>ת�ƴ���</td>
				<td style="height:21px; color:#ffffff; font-size:16px;">
					<form action=$MAIN_SCRIPT method=POST target=_top name=del onSubmit="return checkRiyou()">
					<input type=hidden name=cmd value=INPORT5>
					<input type=text size=20 name=pname value="" $STYLE_L><br>
					<input type=password size=15 name=pass value="" $STYLE_L><br>
					<textarea rows=5 cols=50 name=indata>$EX</textarea>
					</td></tr>
	-----END-----
	print "<script language=\"JavaScript\">\nfunction changeImg(){num=document.del.icon.value;document.msImg.src=\"$IMG_FOLDER2/\"+ num +\".gif\";}\n</script>";
	&JScfm(checkCustom,"�����������ã���ȷ����");
	print "<tr><td $BgColor colspan=2 style=\"font-size:16px;\"><b>��������</b><br><br>\n";
	print "&nbsp;&nbsp;ICON���<img src=\"$IMG_FOLDER2/1.gif\" name=\"msImg\"><br>\n";
	print "&nbsp;&nbsp;&nbsp;&nbsp;<select name=\"icon\" $STYLE_L onChange=\"changeImg()\">\n";
	foreach (0..$ICON){
		print "<option value=\"$_\"";
		print " selected\n"if $_ eq $PL_VALUES[27];
		print ">ICON No.$_\n";
	}
	print "</select><br>&nbsp;&nbsp;MS����<br>&nbsp;&nbsp;&nbsp;&nbsp;\n";
	print "<input type=text name=MsName size=30 maxlength=15 value=\"\" $STYLE_L><br>\n";
	print "&nbsp;&nbsp;�ɳ������<br>&nbsp;&nbsp;&nbsp;&nbsp;\n";
	print "<select name=MsType $STYLE_L>\n";
	print "<option value=1";print " selected"if $PL_VALUES[4] eq '1';print ">����������\n";
	print "<option value=2";print " selected"if $PL_VALUES[4] eq '2';print ">����������\n";
	print "<option value=3";print " selected"if $PL_VALUES[4] eq '3';print ">���ݶ�����\n";
	print "<option value=4";print " selected"if $PL_VALUES[4] eq '4';print ">����������\n";
	print "<option value=0";print " selected"if $PL_VALUES[4] eq '0';print ">ƽ����</select><br>\n";
	print "&nbsp;&nbsp;����<br>&nbsp;&nbsp;&nbsp;&nbsp;<select name=\"w\" $STYLE_L>";
	while (my($wkey,$wvalue) =each %WEAPON_LIST) {
		if (length($wkey) == 1){my@w=split(/,/,$wvalue);print "<option value=$wkey>$w[0]\n" if $w[6] !=2 && $w[6] !=6 && $w[6] !=4;}
	}

	print "</select><br>";
	print "&nbsp;&nbsp;��ɫ���<br>&nbsp;&nbsp;&nbsp;&nbsp;\n";
	$br=0;
		foreach (@COLOR){$br++;
			print "<input type=\"radio\" name=\"MsColor\" value=$_";
	        print " checked" if $br == 1;
	        print "><font color=$_>��</font>\n";
			if ($br%10==0){print"<br>&nbsp;&nbsp;&nbsp;&nbsp;\n";}
		}
	print << "	-----END-----";
			<tr><td colspan=3 align=center><br><br>���������ס��Щ����<br>
				<input type=submit value=\"ת��\" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
			</td></tr>

		</table>

	-----END-----
	&FOOTER;
	print "</td></tr></table></form></body>";


}
sub INPORT3{

	@pass=split(/\!/,$FORM{'indata'});
	&ERROR('�û�����') if $pass[2] ne crypt("$FORM{'pname'}",eb);
	&ERROR('�û������') if $pass[8] ne crypt("$FORM{'pass'}",eb);

	@in=("$pass[0]","$pass[1]","$pass[3]","$pass[4]","$pass[6]","$pass[7]","$pass[9]","$pass[10]","$pass[11]","$pass[13]","$pass[15]");
	foreach (@in){foreach $k(0..9){$to++;$_ =~ s/$to/$k/eg;}}
	$pass1="$in[3]$in[4]$in[5]$in[6]";
	$pass2="$in[1]$in[2]";
	$pass3="$in[0]$in[9]";
	&ERROR('�ָ�����ʧ��') if crypt ("$pass1",eb) ne "$pass[5]" || crypt("$pass2",eb) ne "$pass[12]" || crypt("$pass3",eb) ne "$pass[14]";
	$c=0;
	foreach (@in){
		if ($c==4 ||$c==5 ||$c==6 ||$c==7){&ERROR('�ָ�����ʧ��') if $_ < 0 || $_ > 50;}
		if ($c==10){&ERROR('�����ָ���Ч����') if $_ > time+(604800);}
		$c++;
	}

		&LOCK;
	$pwd=crypt "$FORM{'pass'}",eb;
	dbmopen (%PL,"$DBM_P",0666);
		if($PL{"$FORM{'pname'}"}){dbmclose (%PL);&UNLOCK;&ERROR('�Ѿ�����ͬ���û�������');}
		$PL{"$FORM{'pname'}"} = ("1 $DATE $pwd $FORM{'MsName'} $FORM{'MsType'}  0 noComment 0 $FORM{'w'}!0   $in[0] $FORM{'MsColor'} 0 $in[1] $in[1] $in[2] $in[2] $in[3] $in[4] $in[5] $in[6] $in[7] $in[8] 0 $DATE $FORM{'icon'}  $in[9] 0");
	dbmclose (%PL);
	&UNLOCK;
	SET_COOKIE:{
		my @gmt = gmtime(time + $COOKIE_KEEP*24*60*60);
		$gmt[0] = sprintf("%02d", $gmt[0]);	$gmt[1] = sprintf("%02d", $gmt[1]);
		$gmt[2] = sprintf("%02d", $gmt[2]);	$gmt[3] = sprintf("%02d", $gmt[3]);	$gmt[5] += 1900;
		$gmt[4] = ('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec')[$gmt[4]];
		$gmt[6] = ('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday')[$gmt[6]];
		my $date_gmt = "$gmt[6], $gmt[3]\-$gmt[4]\-$gmt[5] $gmt[2]:$gmt[1]:$gmt[0] GMT";
		my $cook = "pname:$FORM{'pname'},pass:$FORM{'pass'}";print "Set-Cookie: EB=$cook; expires=$date_gmt\n";
	}
	print "Location: $MAIN_SCRIPT" . "\n\n";

}


1;
