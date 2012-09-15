#!/usr/bin/perl
#??    
$HISTORY_DISPLAY='5'; #显示新闻数
require 'ebs_sub1.cgi';

&ERROR('请不要直接从此地址进入','安全起见请从您访问的网页进入') if $ENV{'HTTP_REFERER'} !~ m/^$THIS_DIR/ && $DIRECT_LINK && $SUB ne 'MY_LIST' && $SUB ne 'C_LIST';
!$SUB && ($SUB='HISTORY2');
&$SUB;

sub HISTORY2 {
	&HEADER;
	$c=0;
	dbmopen (%NOTE,"$DBM_H",0666);
		foreach $Key (sort {$b <=> $a} keys %NOTE){$c++;
			if ($c <= $HISTORY_DISPLAY){
				print "<table width=100%><tr><td bgcolor=666666><b>".&DATE_DECORD($Key)."</b></tr><tr><td bgcolor=ffffff><marquee><font color=000000>&nbsp;&nbsp;$NOTE{$Key}</marquee></td></tr><tr><td bgcolor=666666></tr>\n";
		}
}
	dbmclose %NOTE;

}

1;
