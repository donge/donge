#!/usr/bin/perl
# 设定
$SCRIPTNM="ranking.cgi";           #EBS排行榜补丁文件名
$RANKNUM='20';                     #排行榜上榜人数
$maxsts="50";                      #机体性能既定值（NT）
$maxsts2="100";                    #机体性能最大值（NT5）
#
#_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

require 'ebs_sub1.cgi';


!$SUB && ($SUB='CHOICE');
&$SUB;


sub CHOICE		{&CHOICE2;}

sub RANKING             {&RANKING2;}
sub RANKING3            {&RANKING4;}
sub DENDOU              {&DENDOU2;}

sub CHOICE2{

	&HEADER;
	print << "	-----END-----";
	<form action=$SCRIPTNM method=POST name=choice>
	<input type=hidden name="cmd">
	<table width=100% height=100%><tr><td align=center>

	<table $center $tb_stl>
		<tr><td $center><b> 机 甲 封 神 榜 </b></td></tr>
		<tr><td><table $tb_stl>

        <tr $center><td width=50>大富翁</td>
        <td>拥有资金最多的用户</td>
        <td><input type=submit value="GO" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick="choice.cmd.value='RANKING'"></td>
        </tr>

        <tr $center><td>斗神坛</td>
        <td>综合战斗力最高之人</td>
        <td><input type=submit value="GO" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick="choice.cmd.value='RANKING3'"></td>
        </tr>

        <tr $center><td>强者榜</td>
        <td>机体性能最好的用户</td>
        <td><input type=submit value="GO" class=button2 onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\" onClick="choice.cmd.value='DENDOU'"></td>
        </tr>

	</table></td></tr></table></form>
	</td></tr></table>

	-----END-----

}

sub RANKING2{

&HEADER;
&DBM_INPORT(P);
print << "-----END-----";

<table width=100% height=100%><tr><td align=center>
<table $tb_stl>
<tr><td colspan=6 $center><b> 机 甲 封 神 榜</b></td></tr>
<tr $center><td>序 号</td><td>用 户 名</td><td>所 属 国</td><td>拥 有 资 金</td><td>机 体 名</td><td>图 像</td></tr>

-----END-----
$i=0;@tmp1 =();
while (my($key,$val) = each %P){
@VALS = split(/\s/,$val);
push(@tmp1, $VALS[8]);
$PNAME[$i]=$key;
if($VALS[5] eq ''){$PCOUNTRY[$i]="流浪者";}else{$PCOUNTRY[$i]="$VALS[5]";}
$PMONEY[$i]="$VALS[8]";
$MSNAME[$i]="$VALS[3]";
$MSGIF[$i]="$VALS[27]";
$i++;
}

@PNAME = @PNAME[sort {$tmp1[$b] <=> $tmp1[$a]} 0 .. $#tmp1];
@PCOUNTRY = @PCOUNTRY[sort {$tmp1[$b] <=> $tmp1[$a]} 0 .. $#tmp1];
@PMONEY = @PMONEY[sort {$tmp1[$b] <=> $tmp1[$a]} 0 .. $#tmp1];
@MSNAME = @MSNAME[sort {$tmp1[$b] <=> $tmp1[$a]} 0 .. $#tmp1];
@MSGIF = @MSGIF[sort {$tmp1[$b] <=> $tmp1[$a]} 0 .. $#tmp1];

$j=0;$count=$i-1;
foreach(0..$count) {
     if($j >= $RANKNUM) { last; }
     $k=$j+1;$size=$RANKNUM-$j;
print "<tr><td align=center>$k</td><td>$PNAME[$j]</td><td><font color=aqua>【$PCOUNTRY[$j]】</font></td><td><font color=RED size=$size>$PMONEY[$j]</font></td><td><font color=Fuchsia>$MSNAME[$j]</td><td><img src=\"$IMG_FOLDER2/$MSGIF[$j].gif\"></td></tr>";

$j++;
}

print << "-----END-----";
</table><center><table border=0 cellspacing=0>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="cmd" value="CHOICE"><tr><td>
<input type=submit class=buttonA value="" onmouseover="value='返回';" style="BACKGROUND-IMAGE: url(img/button2.jpg)" onClick=\"parent.Sub.location.replace(\'$SCRIPTNM?LOGO\');\" onmouseout="value='';" type=submit>
</tr></td></form></table></center>
-----END-----
}

sub RANKING4{

&HEADER;
&DBM_INPORT(P);
print << "-----END-----";

<table width=100% height=100%><tr><td $center>
<table $tb_stl>
<tr><td colspan=6 $center><b>机 甲 封 神 榜</b></td></tr>
<tr $center><td>序 号</td><td>用 户 名</td><td>所 属 国</td><td>综 合 战 斗 力 指 数</td><td>机 体 名</td><td>图 像</td></tr>

-----END-----
$i=0;@tmp1 =();
while (my($key,$val) = each %P){
@VALS = split(/\s/,$val);
$POINT=$VALS[16]+$VALS[18]+$VALS[19]*100+$VALS[20]*100+$VALS[21]*100+$VALS[22]*100;
push(@tmp1, $POINT);
$PNAME[$i]=$key;
if($VALS[5] eq ''){$PCOUNTRY[$i]="流浪者";}else{$PCOUNTRY[$i]="$VALS[5]";}
$PMONEY[$i]=$POINT;
$MSNAME[$i]="$VALS[3]";
$MSGIF[$i]="$VALS[27]";
$i++;
}

@PNAME = @PNAME[sort {$tmp1[$b] <=> $tmp1[$a]} 0 .. $#tmp1];
@PCOUNTRY = @PCOUNTRY[sort {$tmp1[$b] <=> $tmp1[$a]} 0 .. $#tmp1];
@PMONEY = @PMONEY[sort {$tmp1[$b] <=> $tmp1[$a]} 0 .. $#tmp1];
@MSNAME = @MSNAME[sort {$tmp1[$b] <=> $tmp1[$a]} 0 .. $#tmp1];
@MSGIF = @MSGIF[sort {$tmp1[$b] <=> $tmp1[$a]} 0 .. $#tmp1];

$j=0;$count=$i-1;
foreach(0..$count) {
     if($j >= $RANKNUM) { last; }
     $k=$j+1;$size=$RANKNUM-$j;
print "<tr><td align=center bgcolor=\"$VS_VALUES[13]\">$k</td><td bgcolor=\"$VS_VALUES[13]\">$PNAME[$j]</td><td bgcolor=\"$VS_VALUES[13]\"><font color=aqua>【$PCOUNTRY[$j]】</font></td><td bgcolor=\"$VS_VALUES[13]\"><font color=RED size=$size>$PMONEY[$j]</font></td><td bgcolor=\"$VS_VALUES[13]\"><font color=Fuchsia>$MSNAME[$j]</td><td bgcolor=\"$VS_VALUES[13]\"><img src=\"$IMG_FOLDER2/$MSGIF[$j].gif\"></td></tr>";

$j++;
}

print << "-----END-----";
</table><center><table border=0 cellspacing=0>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="cmd" value="CHOICE"><tr><td>
<input type=submit class=buttonA value="" onmouseover="value='返回';" style="BACKGROUND-IMAGE: url(img/button2.jpg)" onClick=\"parent.Sub.location.replace(\'$SCRIPTNM?LOGO\');\" onmouseout="value='';" type=submit>
</tr></td></form></table></center>

-----END-----
}

sub DENDOU2{

&HEADER;
&DBM_INPORT(P);
print << "-----END-----";

<table width=100% height=100%><tr><td $center>
<table $tb_stl>
<tr><td colspan=5 $center><b>机 甲 封 神 榜</b></td></tr>
<tr $center><td>用 户 名</td><td>所 属 国</td><td>机 体 性 能</td><td>机 体 名</td><td>图 像</td></tr>

-----END-----
while (my($key,$val) = each %P){
@VALS = split(/\s/,$val);
if($VALS[5] eq ''){$PCOUNTRY="流浪者";}else{$PCOUNTRY="$VALS[5]";}
     if($VALS[19] == $VALS[20] and $VALS[20] == $VALS[21] and $VALS[21] == $VALS[22] and $VALS[22] == $maxsts2){
print "<tr bgcolor=olive><td>$key</td><td><font color=aqua>【$PCOUNTRY】</font></td><td align=center><font color=RED><b>ALL NTMAX</b></font></td><td><font color=Fuchsia>$VALS[3]</td><td><img src=\"$IMG_FOLDER2/$VALS[27].gif\"></td></tr>";
     }elsif($VALS[19] >= $maxsts and $VALS[20] >= $maxsts and $VALS[21] >= $maxsts and $VALS[22] >= $maxsts){
print "<tr><td>$key</td><td><font color=aqua>【$PCOUNTRY】</font></td><td align=center><font color=RED><b>ALL NT</b></font></td><td><font color=Fuchsia>$VALS[3]</td><td><img src=\"$IMG_FOLDER2/$VALS[27].gif\"></td></tr>";

     }
}




print << "-----END-----";
</table><center><table border=0 cellspacing=0>
<form action=$SCRIPTNM method=POST>
<input type=hidden name="cmd" value="CHOICE"><tr><td>
<input type=submit class=buttonA value="" onmouseover="value='返回';" style="BACKGROUND-IMAGE: url(img/button2.jpg)" onClick=\"parent.Sub.location.replace(\'$SCRIPTNM?LOGO\');\" onmouseout="value='';" type=submit>
</tr></td></form></table></center>
-----END-----
}


