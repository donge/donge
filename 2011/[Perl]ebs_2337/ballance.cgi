#!/usr/bin/perl
$SCRIPTNM="ballance.cgi";
#####################################################################
require 'ebs_sub1.cgi';

&ERROR('�벻Ҫֱ�ӴӴ˵�ַ����','��ȫ�����������ʵ���ҳ����') if $ENV{'HTTP_REFERER'} !~ m/^$THIS_DIR/ && $DIRECT_LINK && $SUB ne 'MY_LIST' && $SUB ne 'C_LIST';

!$SUB && ($SUB='BALLANCE');
&$SUB;

sub BALLANCE{

        &HEADER;
        &DBM_INPORT(P);&DBM_INPORT(C);
        print << "        -----END-----";
        <table width=100% height=100%><tr><td $center>
        <table $tb_stl>
                <tr><td colspan=5 $center><b>�� �� ͼ</b></td></tr>

        -----END-----
        print "<tr><td $center>�� ��</td><td $center><font color=red>�� ˧</font></td><td colspan=2 $center>�� ��</td><td $center>�� ��</td></tr>";

        $i=0;
        while (my($key,$val) = each %C){
        @VALS = split(/\s/,$val);
        $CNAME[$i]=$key;
        $CCOLOR[$i]=$VALS[0];
        $i++;
        }
        $count=$i-1;$NONCOUNT=0;$METUBOU=0;
        while (my($key,$val) = each %P){
        @VALS = split(/\s/,$val);$ET++;
           $j=0;$kuni=0;
           foreach(0..$count) {

           if($VALS[5] eq "$CNAME[$j]"){$COUNTER[$j]++;$kuni=1;if($VALS[6]==1){$SOUSUI[$j]=$key;}}
           $j++;
           }
           if($VALS[5] eq ''){$NONCOUNT++;}elsif($kuni==0){$METUBOU++;}
        }
        $k=0;
        foreach(0..$count) {
        $BAR[$k]=$COUNTER[$k]*3;$WARIAI=int($COUNTER[$k]/$ET*100);
        if($SOUSUI[$k] eq ''){$SOUSUI[$k]="<font color=black>�� ��</font>";}
        if($COUNTER[$k] eq ''){$COUNTER[$k]="0";}
        print "<tr><td $center bgcolor=$CCOLOR[$k]><font color=BLACK>$CNAME[$k]</font></td><td $center>��$SOUSUI[$k]��</td><td><img src=\"$IMG_FOLDER1/hp.gif\" hspace=0 height=7 width=$BAR[$k]></td><td>$WARIAI%</td><td>$COUNTER[$k]��</td></tr>";
        $k++;
        }
        $NONBAR=$NONCOUNT*3;$NONWARIAI=int($NONCOUNT/$ET*100);
        $BOUBAR=$METUBOU*3;$BOUWARIAI=int($METUBOU/$ET*100);
        print "<tr><td $center>������</td><td $center>��</td><td><img src=\"$IMG_FOLDER1/zen.gif\" hspace=0 height=7 width=$NONBAR></td><td>$NONWARIAI%</td><td>$NONCOUNT��</td></tr>";
        print "<tr><td $center>�� ��</td><td $center>��</td><td><img src=\"$IMG_FOLDER1/dmg.gif\" hspace=0 height=7 width=$BOUBAR></td><td>$BOUWARIAI %</td><td>$METUBOU��</td></tr>";

        print << "        -----END-----";
        <tr><td colspan=5 $center>
        <form action=$SCRIPTNM method=POST>
        <input type=hidden name="cmd" value=BALLANCE2>
        <input type=submit value=����ͼ $STYLE_B2>
        </td></form>
        </tr></table>
        -----END-----
                &FOOTER;
        print "</td></tr></table></body>";
}

sub BALLANCE2{

        &HEADER;
        &DBM_INPORT(P);&DBM_INPORT(C);
        print << "        -----END-----";
        <table width=100% height=100%><tr><td $center>
        <table $tb_stl>
                <tr><td colspan=5 $center><b>�� �� ͼ</b></td></tr>

        -----END-----
        print "<tr><td $center>�� ��</td><td $center><font color=red>�� ˧</font></td><td colspan=2 $center>�� ��</td><td $center>�� �� �� ��</td></tr>";

        $i=0;
        while (my($key,$val) = each %C){
        @VALS = split(/\s/,$val);
        $CNAME[$i]=$key;
        $CCOLOR[$i]=$VALS[0];
        $i++;
        }
        $count=$i-1;$NONCOUNT=0;$METUBOU=0;
        while (my($key,$val) = each %P){
        @VALS = split(/\s/,$val);$ET++;
           $j=0;$kuni=0;
           foreach(0..$count) {

           if($VALS[5] eq "$CNAME[$j]"){$COUNTER[$j]+=($VALS[16]+$VALS[18]+$VALS[19]*100+$VALS[20]*100+$VALS[21]*100+$VALS[22]*100);$kuni=1;if($VALS[6]==1){$SOUSUI[$j]=$key;}}
           $j++;
           }
           if($VALS[5] eq ''){$NONCOUNT+=($VALS[16]+$VALS[18]+$VALS[19]*100+$VALS[20]*100+$VALS[21]*100+$VALS[22]*100);}elsif($kuni==0){$METUBOU+=($VALS[16]+$VALS[18]+$VALS[19]*100+$VALS[20]*100+$VALS[21]*100+$VALS[22]*100);}
        }
        $SOUGOU=$NONCOUNT+$METUBOU;
        $m=0;
        foreach(0..$count) {
           $SOUGOU+=$COUNTER[$m];$m++;
        }
        $ET=$SOUGOU;
        $k=0;
        foreach(0..$count) {
        $BAR[$k]=int($COUNTER[$k]/$ET*100)*3;$WARIAI=int($COUNTER[$k]/$ET*100);
        if($SOUSUI[$k] eq ''){$SOUSUI[$k]="<font color=black>�� ��</font>";}
        if($COUNTER[$k] eq ''){$COUNTER[$k]="0";}
        print "<tr><td align=center bgcolor=$CCOLOR[$k]><font color=black>$CNAME[$k]</font></td><td $center>��$SOUSUI[$k]��</td><td><img src=\"$IMG_FOLDER1/hp.gif\" hspace=0 height=7 width=$BAR[$k]></td><td>$WARIAI %</td><td>$COUNTER[$k]��</td></tr>";
        $k++;
        }
        $NONBAR=int($NONCOUNT/$ET*100)*3;$NONWARIAI=int($NONCOUNT/$ET*100);
        $BOUBAR=int($METUBOU/$ET*100)*3;$BOUWARIAI=int($METUBOU/$ET*100);
        print "<tr><td $center>������</td><td $center>��</td><td><img src=\"$IMG_FOLDER1/zen.gif\" hspace=0 height=7 width=$NONBAR></td><td>$NONWARIAI %</td><td>$NONCOUNT��</td></tr>";
        print "<tr><td $center>�� ��</td><td $center>��</td><td><img src=\"$IMG_FOLDER1/dmg.gif\" hspace=0 height=7 width=$BOUBAR></td><td>$BOUWARIAI %</td><td>$METUBOU��</td></tr>";

        print << "        -----END-----";
        <tr><td colspan=5 $center>
        <form action=$SCRIPTNM method=POST>
        <input type=hidden name="cmd" value=BALLANCE>
        <input type=submit value=����ͼ $STYLE_B2>
        </td></form>
        </tr></table>
        -----END-----
        &FOOTER;
        print "</td></tr></table></body>";
}
