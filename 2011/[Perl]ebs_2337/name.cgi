#!/usr/bin/perl


$RANKNUM='10000';require 'ebs_sub1.cgi';!$SUB && ($SUB='RANKING');&$SUB;
sub RANKING             {&RANKING2;}
sub RANKING2{
&HEADER;
&DBM_INPORT(P);
print "<center><b>�������ʻ�˵��������ctrl+F���ҿ���������ڿ��������뱻����</b></center><br>";
print "<center><b>�������֤�ݻ����˿���֤����ȥbbs���ߡ�</b></center><br>";
print "<center><b>EZGame��Ebs&nbsp;&nbsp;����Ա��xiaoyu��д</b></center><br>";
print << "-----END-----";
<table width=100% height=100%><tr><td align=center>
<table cellspacing=2 cellpadding=3 bgcolor="#909090" style="font-size:16px;" border=1>
<tr><td bgcolor=#404040 colspan=6><center><b>�ʻ��б�</b></center></td></tr>
<tr><td>&nbsp</td><td>����</td><td>��������</td><td>����½ʱ��</td><td>��ʧЧ����</td></tr>
-----END-----
$i=0;@tmp1 =();
while (my($key,$val) = each %P){@VALS = split(/\s/,$val);$PNAME[$i]=$key;push(@tmp1, $VALS[26]);
if($VALS[5] eq ''){$PCOUNTRY[$i]="$NONE_NATIONALITY";}else{$PCOUNTRY[$i]="$VALS[5]";}
$PLOGINTIME[$i]=&DATE_DECORD($VALS[26]);$PLOGDAY[$i]=int(($COOKIE_KEEP*86400-(time-$VALS[26]))/86400);$PLOGHOUR[$i]=int((($COOKIE_KEEP*86400-(time-$VALS[26]))-($PLOGDAY[$i]*86400))/3600);$PLOGFLAG[$i]="$PLOGDAY[$i]��$PLOGHOUR[$i]Сʱ";$PLOGFLAG[$i]="��ʧЧ" if ($COOKIE_KEEP*86400-(time-$VALS[26]))<0;$i++;}
@PNAME = @PNAME[sort {$tmp1[$b] <=> $tmp1[$a]} 0 .. $#tmp1];@PCOUNTRY = @PCOUNTRY[sort {$tmp1[$b] <=> $tmp1[$a]} 0 .. $#tmp1];@PLOGINTIME = @PLOGINTIME[sort {$tmp1[$b] <=> $tmp1[$a]} 0 .. $#tmp1];@PLOGFLAG = @PLOGFLAG[sort {$tmp1[$b] <=> $tmp1[$a]} 0 .. $#tmp1];$j=0;$count=$i-1;
foreach(0..$count) {if($j >= $RANKNUM){last;}$k=$j+1;$size=$RANKNUM-$j;print "<tr><td>$k</td><td><font>$PNAME[$j]</font></td><td><font color=BLACK>��$PCOUNTRY[$j]��</font></td><td>$PLOGINTIME[$j]</td><td>$PLOGFLAG[$j]</td></tr>";$j++;}
print << "-----END-----";
<form action=name.cgi method=POST>
<input type=hidden name="cmd" value="CHOICE">
<tr><td colspan=6>
<input type=submit value=���� $STYLE_B2>
</td></tr></table>
-----END-----
&FOOTER;
print "</td></tr></table></form></body>";
}
