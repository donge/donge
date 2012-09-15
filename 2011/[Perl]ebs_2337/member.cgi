#!/usr/bin/perl
$timer = "30";      #参加者表示时间
require 'ebs_sub1.cgi';

&ERROR('请不要直接从此地址进入','安全起见请从您访问的网页进入') if $ENV{'HTTP_REFERER'} !~ m/^$THIS_DIR/ && $DIRECT_LINK && $SUB ne 'MY_LIST' && $SUB ne 'C_LIST';
!$SUB && ($SUB='MEMBER');
&$SUB;

sub MEMBER{

	&HEADER;
	&DBM_INPORT(P);
	print << "	-----END-----";
	<table width=100% height=100%><tr><td align=center>
	<table cellspacing=2 cellpadding=3 bgcolor="#909090" style="font-size:16px;" border=1>
		<tr><td bgcolor=#404040 colspan=5><center><b>$timer分钟内参战情况</b></CENTER></td></tr>
		
	-----END-----
        $COUNT=1;
	while (my($key,$val) = each %P){
          @VALS = split(/\s/,$val);$ET++;
        if($VALS[5] eq''){$NATION="$NONE_NATIONALITY";}else{$NATION="$VALS[5]";}
                
		if ( $VALS[26] >= time-$timer*60){
			print "<tr style=\"color:#000000;\"><td nowrap>$COUNT</td><td nowrap>$key</td>";
			print "<td nowrap>【$NATION】所属</td><td nowrap>$VALS[3]机</td><td nowrap><img src=\"$IMG_FOLDER2/$VALS[27].gif\"></td></tr>";
		$COUNT++;
                }
	}
	print << "	-----END-----";
        <tr><td colspan=4>
	<form action=member.cgi method=POST>
	<input type=submit value=更新 class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">        
        </td><td></form>
	<form action=$MAIN_SCRIPT method=POST>
	<input type=submit value=返回 class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\">
	</td></tr></table>
	-----END-----
	&FOOTER;
	print "</td></tr></table></form></body>";
}
