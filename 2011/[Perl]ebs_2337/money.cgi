#!/usr/bin/perl
#ver.2
#����
$SCRIPTNM="money.cgi";               #��������
$KRATE="1";                          #������
#
#��ť����
#
#����Ҫ�ĵط���������Ĵ��롣
#
#<form action=money.cgi method=POST>
#<input type=hidden name="cmd" value="MAINTE">
#<input type=hidden name="medal" value="$QUERY{'medal'}">
#<input type=submit value=���� $STYLE_B2></form>
#######################################################################




require 'ebs_sub1.cgi';
require 'ec_config.pl';

&ERROR('�벻Ҫֱ�ӴӴ˵�ַ����','��ȫ�����������ʵ���ҳ����') if $ENV{'HTTP_REFERER'} !~ m/^$THIS_DIR/ && $DIRECT_LINK && $SUB ne 'MY_LIST' && $SUB ne 'C_LIST';

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
		&nbsp;ѫ �� �� �� ��</td></tr>
                <tr><td $center><b>�û���</b></td>
		<td><input type=hidden name="plname" value="$COOKIE{'pname'}" style="height:21px; color:#ffffff; font-size:16px; background:#000000; border:1 inset #c0c0c0;">$COOKIE{'pname'}
                <input type=hidden name="medal" value="$FORM{'medal'}">
		<tr><td align=center><b>����</b></td>
		<td><input type=pass name="pass" value="" style="height:21px; color:#ffffff; font-size:16px; background:#000000; border:1 inset #c0c0c0;">
		<input type=submit value=Login $STYLE_B2>
		</td></tr></form></table>
	<form action=e_casino.cgi method=POST>
	<input type=submit value=���� $STYLE_B2>
        <input type=hidden name="medal" value="$FORM{'medal'}">
	</form>
	</td></tr></table>

	-----END-----
}

sub SYUSEI2{
&ERROR('�û���������󣡣�') if $FORM{'plname'} eq '';
&ERROR('������󣡣�') if $FORM{'pass'} eq '';

&DBM_INPORT(P);

@VALS = split(/\s/,$P{"$FORM{'plname'}"});
&ERROR('������󣡣�') if crypt ($FORM{'pass'},eb) ne "$VALS[2]";

&HEADER;

$KANKIN="$VALS[8]";
$GOLD="$FORM{'medal'}"-$START_MEDAL;
if($GOLD < 0){$GOLD=0;}
$SILVER=int($GOLD*$KRATE);
$KANKIN+=$SILVER;
print << "-----END-----";
	<script language="JavaScript">
		function tyousei(nm){
                        alert("$GOLD ѫ�±���");
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
<tr><td $center colspan=35><b>ѫ �� �� ��</b></td></tr>
<tr><td>����</td><td>�ʽ�</td><td>����</td></tr>

<tr><td>��</td><td>$GOLD �� $KRATE = <font color=RED>$SILVER</font></td><td><marquee>�����������������</marquee></td></tr>

-----END-----

print "<tr><td>$FORM{'plname'}</td><td>$VALS[8]</td><td><a href=\"javascript:tyousei('$FORM{'plname'}')\">����</a></td></tr>";


print << "-----END-----";

<form action=$SCRIPTNM method=POST>
<input type=hidden name="cmd" value="MAINTE">
<input type=hidden name="pass" value=\"$FORM{'pass'}\"><tr><td $center colspan=35>
<input type=hidden name="medal" value="$FORM{'medal'}">
<input type=submit value=���� $STYLE_B2>
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

