sub MAINTENANCE{
	&HEADER2;
	print << "	-----END-----";
	
	<table width=100% height=100%><tr><td align=center>
		<table border=0 cellpadding=0 cellspacing=0 bgcolor="#909090" align=center
		 style="border:1px outset #909090;font-size:16px;">
		<form action=$MAIN_SCRIPT method=POST><input type=hidden name="cmd" value="MAINTE2">
		<tr><td style="background-color:#404040;font=16px" colspan=2 align=center>
		�����������</td></tr>
		<tr><td align=center><b style="color:#f13214;">PaSsWoRd</b></td>
		<td><input type=password name="pass" style="height:21px; color:#ffffff; font-size:16px; background:#000000; border:1 inset #c0c0c0;">
		<input type=submit value=Login class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
		</td></tr></form></table>
	<form action=$MAIN_SCRIPT method=POST>
	<input type=submit value=���� class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">&nbsp;&nbsp;
	<input type=button value="�߼��������" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick="parent.top.location.replace('master.cgi')">
	</form>
	</td></tr></table>

	-----END-----
}
sub MAINTENANCE2{
	&ERROR('��������ȷ�����룡') if $MASTER_PWD ne "$FORM{'pass'}";

	&HEADER;
	print << "	-----END-----";
	<form action=$MAIN_SCRIPT method=POST name=mainte>
	<input type=hidden name="cmd"><input type=hidden name="pass" value="$FORM{'pass'}">
	<table width=100% height=100%><tr><td align=center>

	<table class=font9 cellspacing=2 cellpadding=3 bgcolor="#909090">
		<tr><td bgcolor=#404040 colspan=3><b>����ѡ��</b></td></tr>
		<tr><td bgcolor=#404040 align=center>��ʷ��¼</td>
			<td style="border:1px solid #404040;font-size:12px;color:#000000;">��ȥ����ʮ����ʷ�¼��б�</td>
			<td style="border:1px solid #404040;"><input type=submit value="GO" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick="mainte.cmd.value='LGIN_RIREKI'"></td>
		</tr>

		<tr><td valign=top colspan=3 style="line-height:0px;">&nbsp;</td></tr>
		<tr><td bgcolor=#404040 align=center>�����ʦ����ȡ��</td>
			<td style="border:1px solid #404040;font-size:12px;color:#000000;">��������Ļ�ʦ����</td>
			<td style="border:1px solid #404040;"><input type=submit value="GO" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick="mainte.cmd.value='XPL_LIST';"></td>
		</tr>
		<tr><td bgcolor=#404040 align=center>�����������ȡ��</td>
			<td style="border:1px solid #404040;font-size:12px;color:#000000;">��������Ĺ�������</td>
			<td style="border:1px solid #404040;"><input type=submit value="GO" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick="mainte.cmd.value='XCO_LIST';"></td>
		</tr>
		<tr><td bgcolor=#404040 align=center>��ʦ����ɾ��</td>
			<td style="border:1px solid #404040;font-size:12px;color:#000000;">�����˶�����ע����ʱ<br>��ѡ����԰ѻ�ʦ����ɾ����������ʹ��</td>
			<td style="border:1px solid #404040;"><input type=submit value="GO" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick="mainte.cmd.value='PL_DEL';"></td>
		</tr>
		<tr><td bgcolor=#404040 align=center>��������ɾ��</td>
			<td style="border:1px solid #404040;font-size:12px;color:#000000;">�����˶���ע���������ʱ<br>��ѡ����԰ѹ���ɾ����������ʹ��</td>
			<td style="border:1px solid #404040;"><input type=submit value="GO" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick="mainte.cmd.value='CO_DEL';"></td>
		</tr>
		<tr><td valign=top colspan=3 style="line-height:0px;">&nbsp;</td></tr>
		<tr><td bgcolor=#404040 align=center>��ʷ��׫</td>
			<td style="border:1px solid #404040;font-size:12px;color:#000000;">��һ�Ѵ۸���ʷ��񫣺��</td>
			<td style="border:1px solid #404040;"><input type=submit value="GO" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick="mainte.cmd.value='HISTORY_EDIT';"></td>
		</tr>

	</table></form>
	<form action=$MAIN_SCRIPT method=POST>
	<input type=submit value=��� class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
	</form>
	</td></tr></table>

	-----END-----
}
sub LGIN_RIREKI2{
	&ERROR('��������ȷ�����룡') if $MASTER_PWD ne "$FORM{'pass'}";
	&HEADER;
	&DBM_INPORT(L);
	print << "	-----END-----";
	<table width=100% height=100%><tr><td align=center>
	<table cellspacing=2 cellpadding=3 bgcolor="#909090" style="font-size:16px;">
		<tr><td bgcolor=#404040 colspan=5><b>�����¼</b></td></tr>

	-----END-----

	foreach $t(sort {$b <=> $a} keys %L){$lc++;
		if ($lc <= $LOGIN_H){
			@lgn=split(/!/,$L{"$t"});
			print "<tr style=\"color:#000000;\"><td nowrap>$lc</td><td nowrap>".&DATE_DECORD($t);
			print "</td><td nowrap>$lgn[0]</td><td nowrap>$lgn[1]</td><td nowrap>$lgn[2]</td></tr>";

		}
	}
	print << "	-----END-----";
	<form action=$MAIN_SCRIPT method=POST>
	<input type=hidden name="cmd" value="MAINTE2">
	<input type=hidden name="pass" value=\"$FORM{'pass'}\"><tr><td colspan=5>
	<input type=submit value=��� class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
	</td></tr></table>
	-----END-----
	&FOOTER;
	print "</td></tr></table></form></body>";
}
sub XPL_LIST2{
	&ERROR('��������ȷ������') if $MASTER_PWD ne "$FORM{'pass'}";
	&HEADER;
	&DBM_INPORT(P);
print << "-----END-----";
	<script language="JavaScript">
		function syusei(nm){
			fm1.plname.value=nm;
			fm1.sbm1.click();
		}

	</script>
	<form action=$MAIN_SCRIPT method=POST name=fm1 style="position:absolute;visibility:hidden;">
	<input type=hidden name="cmd" value=SYUSEI>
	<input type=hidden name="plname">
	<input type=hidden name="pass" value="$FORM{'pass'}">
	<input type=submit name="sbm1">
	</form>
	<table width=100% height=100%><tr><td align=center>
	<table class=font9 cellspacing=3 cellpadding=3 bgcolor="#909090">
		<tr><td bgcolor=#404040 colspan=3><b>�����ʦ���ϳ��������</b></td></tr>
-----END-----
	while (my($key,$val) = each %P){
		@VALS = split(/\s/,$val);$ER='';
		$ER.= "&nbsp;[MSType Undefined]" if $VALS[4] eq '';
		$ER.= "&nbsp;[Weapon Undefined]" if $VALS[9] eq '';
		$ER.= "&nbsp;[Character Undefined]" if $VALS[12] eq '';
		$ER.= "&nbsp;[Color Undefined]" if $VALS[13] eq '';
		$ER.= "&nbsp;[HP Undefined]" if $VALS[16] eq '';
		$ER.= "&nbsp;[EN Undefined]" if $VALS[18] eq '';
		$ER.= "&nbsp;[AT Undefined]" if $VALS[19] eq '';
		$ER.= "&nbsp;[AT Incorrect]" if $VALS[19] > 50 || $VALS[19] < 0;
		$ER.= "&nbsp;[GD Undefined]" if $VALS[20] eq '';
		$ER.= "&nbsp;[GD Incorrect]" if $VALS[20] > 50 || $VALS[20] < 0;
		$ER.= "&nbsp;[SP Undefined]" if $VALS[21] eq '';
		$ER.= "&nbsp;[SP Incorrect]" if $VALS[21] > 50 || $VALS[21] < 0;
		$ER.= "&nbsp;[HIT Undefined]" if $VALS[22] eq '';
		$ER.= "&nbsp;[HIT Incorrect]" if $VALS[22] > 50 || $VALS[22] < 0;
		$ER.= "&nbsp;[EXP Incorrect]" if $VALS[30] < 0;
		if ($ER){$c++;$c = sprintf("%03d", $c);
			print "<tr><td nowrap>$c <b>$key</b></td><td nowrap>$ER</td><td><a href=\"javascript:syusei('$key')\">����</a></td></tr>";
		}
	}
print "<tr><td colspan=3><br><br>��������<br><br></td></tr>" if !$c;
print "<tr><td colspan=3 style=\"font-size:12px;color:#000000;\">δ���壨Undefined������Ŀ<br>����ȷ��Incorrect������ֵ����Ŀһ��<br>����������Щ���ݽ���ϵͳ�Զ�������
	<form action=$MAIN_SCRIPT method=POST>
	<input type=hidden name=\"cmd\" value=\"MAINTE2\">
	<input type=hidden name=\"pass\" value=\"$FORM{'pass'}\">
	<input type=submit value=��� class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
	</form>
</td></tr></table>";
	&FOOTER;
	print "</td></tr></table></body>";

}

sub SYUSEI2{
	dbmopen (%P,"$DBM_P",0666);
		@VALS = split(/\s/,$P{"$FORM{'plname'}"});
		$VALS[4]='0' if $VALS[4] eq '';
		$VALS[9]='a' if $VALS[9] eq '';
		$VALS[12]='0'  if $VALS[12] eq '';
		$VALS[13]='ffffff'  if $VALS[13] eq '';
		$VALS[16]='5000'  if $VALS[16] eq '';
		$VALS[18]='200'  if $VALS[18] eq '';
		$VALS[19]='5' if $VALS[19] eq '';$VALS[19]='50' if $VALS[19] > 50;$VALS[19]='0' if $VALS[19] < 0;
		$VALS[20]='5' if $VALS[20] eq '';$VALS[20]='50' if $VALS[20] > 50;$VALS[20]='0' if $VALS[20] < 0;
		$VALS[21]='5' if $VALS[21] eq '';$VALS[21]='50' if $VALS[21] > 50;$VALS[21]='0' if $VALS[21] < 0;
		$VALS[22]='5' if $VALS[22] eq '';$VALS[22]='50' if $VALS[22] > 50;$VALS[22]='0' if $VALS[22] < 0;
		$VALS[30]='0'  if $VALS[30] < 0;
		$P{"$FORM{'plname'}"}="@VALS";
	dbmclose %P;
}
sub XCO_LIST2 {
	&ERROR('��������ȷ�����룡') if $MASTER_PWD ne "$FORM{'pass'}";
	&HEADER;
	&DBM_INPORT(C);
print << "-----END-----";
	<script language="JavaScript">
		function syusei(nm){
			fm1.coname.value=nm;
			fm1.sbm1.click();
		}

	</script>
	<form action=$MAIN_SCRIPT method=POST name=fm1 style="position:absolute;visibility:hidden;">
	<input type=hidden name="cmd" value=CNSYUSEI>
	<input type=hidden name="coname">
	<input type=hidden name="pass" value="$FORM{'pass'}">
	<input type=submit name="sbm1">
	</form>
	<table width=100% height=100%><tr><td align=center>
	<table class=font9 cellspacing=3 cellpadding=3 bgcolor="#909090">
		<tr><td bgcolor=#404040 colspan=3><b>������������ѡ��</b></td></tr>
-----END-----
	while (my($key,$val) = each %C){
		@VALS = split(/\s/,$val);$ER='';
		$ER.= "&nbsp;[Color Undefined]" if $VALS[0] eq '';
		$ER.= "&nbsp;[Money Undefined]" if $VALS[1] eq '';
		$ER.= "&nbsp;[YOUSAI DATA Undefined]" if $VALS[11] eq '' || $VALS[12] eq '';
		if ($ER){$c++;$c = sprintf("%03d", $c);
			print "<tr><td nowrap>$c <b>$key</b></td><td nowrap>$ER</td><td><a href=\"javascript:syusei('$key')\">����</a></td></tr>";
		}
	}
print "<tr><td colspan=3><br><br>��������<br><br></td></tr>" if !$c;
print "<tr><td colspan=3 style=\"font-size:12px;color:#000000;\">δ���壨Undefined������Ŀ<br>����ȷ��Incorrect������ֵ����Ŀһ��<br>����������Щ���ݽ���ϵͳ�Զ�������
	<form action=$MAIN_SCRIPT method=POST>
	<input type=hidden name=\"cmd\" value=\"MAINTE2\">
	<input type=hidden name=\"pass\" value=\"$FORM{'pass'}\">
	<input type=submit value=��� class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
	</form></td></tr></table>";
	&FOOTER;
	print "</td></tr></table></body>";


}
sub CNSYUSEI2{
		dbmopen (%C,"$DBM_C",0666);
		@VALS = split(/\s/,$C{"$FORM{'coname'}"});
		$VALS[0]='ffffff' if $VALS[0] eq '';
		$VALS[1]='0' if $VALS[1] eq '';
		$VALS[11]="$YOUSAI_HP!$YOUSAI_HP!$DATE"  if $VALS[11] eq '';
		$VALS[12]="1!1!1!$FORM{'coname'}����Ҫ��"  if $VALS[12] eq '';
		$C{"$FORM{'coname'}"}="@VALS";
	dbmclose %C;
}

sub HISTORY_EDIT2{
	$c=0;
	&HEADER;
print << "-----END-----";
	<script language="JavaScript">
		function syusei(nm,his){
		com=prompt('��ʷ�ĸ���',his);
		if(com != null){
			if (com.length > 100){alert('��ʮ������'+com.length+'����');return false;}
			fm1.hiskey.value=nm;
			fm1.hisval.value=com;
			fm1.sbm1.click();
		}
		}

	</script>
	<form action=$MAIN_SCRIPT method=POST name=fm1 style="position:absolute;visibility:hidden;">
	<input type=hidden name="cmd" value=HISTORY_EDIT2>
	<input type=hidden name="hiskey">
	<input type=hidden name="hisval">
	<input type=hidden name="pass" value="$FORM{'pass'}">
	<input type=submit name="sbm1">
	</form>
	<table width=100% height=100%><tr><td align=center>
	<table class=font9 cellspacing=3 cellpadding=3 bgcolor="#909090">
		<tr><td bgcolor=#404040 colspan=3><b>��ս���ߵ���ʷ��׫</b></td></tr>
-----END-----
	dbmopen (%H,"$DBM_H",0666);
		foreach $Key (sort {$b <=> $a} keys %H){$c++;
			print "<tr><td style=\"color:#000000;\"><b>".&DATE_DECORD($Key)."</b></td><td>$H{$Key}</td><td><a href=\"javascript:syusei('$Key','$H{$Key}')\">����</a></td></tr>\n";
		}
	dbmclose %H;
print << "-----END-----";
	<form action=$MAIN_SCRIPT method=POST>
	<input type=hidden name=\"cmd\" value=\"MAINTE2\">
	<input type=hidden name=\"pass\" value=\"$FORM{'pass'}\"><tr><td colspan=3>
	<input type=submit value=��� class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
	</td></tr></form></table>

-----END-----
	&FOOTER;
	print "</td></tr></table></body>";
}
sub HISTORY_EDIT3{
	dbmopen (%H,"$DBM_H",0666);
		$H{"$FORM{'hiskey'}"}="$FORM{'hisval'}";
	dbmclose %H;
}
sub PL_DEL2{
	&HEADER;
	print << "	-----END-----";
	<script language="JavaScript">
		function checkRiyou (){
			if (document.del.pname.value == '') {window.alert("IDû������");return false
			}else if(document.del.pass.value == '') {window.alert("PASSû������");return false
			}else {if (confirm('����������¼\\n����ע����������Ὣ�޷��ָ�') == true){return true;}else{return false}	}
		}
	</script>
		<table width=100% height=100%><tr><td align=center>
		<table bgcolor="#909090" border=0 style="font-size:12px;">
			<tr><td colspan=2 bgcolor=#646464 align=center><img src=\"$IMG_FOLDER1/w.gif\"></td></tr>
			<tr><td colspan=2 style="color:#000000;">��¼�ߵ�idɾ��<br>
			ɾ��������¼�Ὣ�޷��ָ�<br><br></td></tr>
			<tr><td align=right style="height:21px; color:#ffffff; font-size:16px;">ָ��ɾ���Ķ���<br>
					������ר������</td>
				<td style="height:21px; color:#ffffff; font-size:16px;">
					<form action=$MAIN_SCRIPT method=POST target=_top name=del onSubmit="return checkRiyou()">
					<input type=hidden name=cmd value=PL_DEL2>
					<input type=text size=20 name=pname $STYLE_L><br>
					<input type=password size=15 name=pass $STYLE_L>
					</td></tr>
			<tr><td colspan=3 align=center>
				<input type=submit value=\"����\" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\"></div></form>
	<form action=$MAIN_SCRIPT method=POST>
	<input type=hidden name=\"cmd\" value=\"MAINTE2\">
	<input type=hidden name=\"pass\" value=\"$FORM{'pass'}\"><tr><td colspan=3>
	<input type=submit value=��� class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
	</td></tr>

		</table>
	-----END-----
	&FOOTER;
	print "</td></tr></table></form></body>";

}
sub PL_DEL3{
	&ERROR('��������ȷ�����룡') if $MASTER_PWD ne "$FORM{'pass'}";
	dbmopen (%P,"$DBM_P",0666);
		delete $P{"$FORM{'pname'}"};
	dbmclose %H;
}
### add for del co
sub CO_DEL2{
	&HEADER;
	print << "	-----END-----";
	<script language="JavaScript">
		function checkRiyou (){
			if (document.del.pname.value == '') {window.alert("IDû������");return false
			}else if(document.del.pass.value == '') {window.alert("PASSû������");return false
			}else {if (confirm('����������¼\\n����ע����������Ὣ�޷��ָ�') == true){return true;}else{return false}	}
		}
	</script>
		<table width=100% height=100%><tr><td align=center>
		<table bgcolor="#909090" border=0 style="font-size:12px;">
			<tr><td colspan=2 bgcolor=#646464 align=center><img src=\"$IMG_FOLDER1/w.gif\"></td></tr>
			<tr><td colspan=2 style="color:#000000;">����ɾ��<br>
			ɾ��������¼�Ὣ�޷��ָ�<br><br></td></tr>
			<tr><td align=right style="height:21px; color:#ffffff; font-size:16px;">ָ��ɾ���Ķ���<br>
					������ר������</td>
				<td style="height:21px; color:#ffffff; font-size:16px;">
					<form action=$MAIN_SCRIPT method=POST target=_top name=del onSubmit="return checkRiyou()">
					<input type=hidden name=cmd value=CO_DEL2>
					<input type=text size=20 name=cname $STYLE_L><br>
					<input type=password size=15 name=pass $STYLE_L>
					</td></tr>
			<tr><td colspan=3 align=center>
				<input type=submit value=\"����\" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\"></div></form>
	<form action=$MAIN_SCRIPT method=POST>
	<input type=hidden name=\"cmd\" value=\"MAINTE2\">
	<input type=hidden name=\"pass\" value=\"$FORM{'pass'}\"><tr><td colspan=3>
	<input type=submit value=��� class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
	</td></tr>

		</table>
	-----END-----
	&FOOTER;
	print "</td></tr></table></form></body>";

}
sub CO_DEL3{
	&ERROR('��������ȷ�����룡') if $MASTER_PWD ne "$FORM{'pass'}";
	dbmopen (%C,"$DBM_C",0666);
		delete $C{"$FORM{'cname'}"};
	dbmclose %C;
}
### add end

1;
