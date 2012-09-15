#!/usr/bin/perl

require "./ebs_sub1.cgi";
require "./$LOG_FOLDER/$HASH_DATA";

	
	print "Content-type: text/html\n\n";
	print << "	-----END-----";
	<!DOCTYPE HTML PUBLIC -//IETF//DTD HTML//EN>
<html>
<head>
<title>����Ԕ���Y���б�</title>
<meta http-equiv="Content-Type" ctent="text/html; charset=gb2312">
<style type="text/css">
<!--
td {  font-size: 12px; text-decorati: ne; background-color: #333333; color: #CCCCCC; padding-top: 5px; padding-right: 5px; padding-bottom: 5px; padding-left: 5px; border-style: inset; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px; margin-top: 5px; margin-right: 5px; margin-bottom: 5px; margin-left: 5px}
body {  font-size: 12px; text-decorati: ne; background-color: #333333; color: #FFFFFF}
table {  padding-top: 5px; padding-right: 5px; padding-bottom: 5px; padding-left: 5px; margin-top: 10px; margin-right: 10px; margin-bottom: 10px; margin-left: 10px; border-style: inset; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px}
hr {  background-color: #FFFFFF; margin-top: 10px; margin-right: 10px; margin-bottom: 10px; margin-left: 10px; border-style: dashed; border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-left-width: 1px}
.unnamed1 {  font-size: 36px; font-weight: 400; color: #FFFFFF; text-decorati: underline}
a {  font-size: 12px; color: #FFFFFF}
.unnamed2 {  font-size: 14px; color: #FFFFFF; text-decorati: underline}
-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<div align="center">
  <p><span class="unnamed1"> ��ȫ�����Y�ϱ� </span></p>
  <p>&nbsp;</p>
  </div>
	-----END-----
#$id, $lastchildid, $width, $left, $level, $block
@wep = [];
@result = [];

$wepcount = 0;
    foreach my $W_key (sort keys %WEAPON_LIST){
            $wepcount++;
            if (length($W_key)==1)
            {
                $originalwep = $wepcount;
            }
            push (@wep, [$W_key, $originalwep, split(/\,/,$WEAPON_LIST{"$W_key"})]);
    }
    $block = 0;
    getchildinfo(0, 0, 0);
    @sortedresult = sort {$a->[5] * 1000000+$a->[4] * 1000+$a->[1]<=> $b->[5] * 1000000+$b->[4] * 1000+$b->[1]} @result;
    my ($lastblock, $lastlevel, $nextleft, $space) = (0,1,0,0);
    print "<table width=\"750\" align=\"center\">\n    <tr>\n";
    for ($i = 1;$i<scalar @sortedresult-1;$i++)
        {
            if ($sortedresult[$i][5] != $lastblock)
            {
                $lastblock = $sortedresult[$i][5];
                $lastlevel = 0;
                $nextleft = 0;
                print "    </tr>\n</table>\n<hr>\n<table width=\"750\" align=\"center\">\n    <tr>\n";
            }
            elsif ($sortedresult[$i][4] != $lastlevel)
            {
                $lastlevel = $sortedresult[$i][4];
                $nextleft = 0;
                print "    </tr>\n    <tr>\n";
            }
            #write cell
            if ($sortedresult[$i][3] > $nextleft)
            {
                $space = $sortedresult[$i][3]-$nextleft;
                print "        <td colspan = $space nowrap></td>\n";
            }
            {
                print "        <td colspan = $sortedresult[$i][2] nowrap>";
		printweapon($sortedresult[$i][0]);
		print "</td>\n";
            }
            $nextleft=$sortedresult[$i][3]+$sortedresult[$i][2];
        }
    print "    </tr>\n</table>\n</html>";

sub getchildinfo
{
my ($childresult, $id, $lastchildid, $width, $left, $level) = (0, $_[0], 0, 0, $_[1], $_[2], $_[3]);
$childid = $id+1;

for ($childid = $id+1; $wep[$childid][0] =~ /^$wep[$id][0]/;)
      {
      $childresult = getchildinfo($childid, $left + $width, $level+1, $block);
      $width += $result[$childresult][2];
      $childid = $result[$childresult][1]+1;
      if ($id == 0)
        {
             $block++;
             $left = 0;
             $level = 0;
             $width = 0;
        }
      if ($childid > $wepcount)
          {last;}
      }
if ($width == 0)
     {$width = 1;}
$lastchildid = $childid-1;
push(@result, [$id, $lastchildid, $width, $left, $level, $block]);
return scalar @result-1;
}

sub printweapon
{
    my $id = $_[0];
    my $level = length($wep[$id][0]);
    my $originalwep = $wep[$id][1];
    my $orginalwepname=$wep[$originalwep][2];
	print "�������Q <span class=\"unnamed2\">$wep[$id][2]</span><br>";
	print "$orginalwepname��$level����";
	if ($wep[$id][3]*$wep[$id][5] >= 50000)
            {print "<br>�������� <b style=\"color:#FFFFFF;\">��NT</b>";}
	elsif ($wep[$id][3]*$wep[$id][5] >= 25000)
            {print "<br>�������� ".&STATUS_CONVERT(50,'s');}
        else
	    {print "<br>�������� ".&STATUS_CONVERT($wep[$id][3]*$wep[$id][5]/500, 's');}
	print "<br>�������� ".&STATUS_CONVERT($wep[$id][4]/4,'s');
	print "<br>���M�ţ� $wep[$id][6]";
	print "<br>�����Δ� $wep[$id][5]��";
	print "<br>�Ј��r�� $wep[$id][7]";
	print "<br>������Ч ";
	$texiao.='�C�w�p��,' if $wep[$id][9]==1;
	$texiao.='���Y����,' if $wep[$id][9]==2;
	$texiao.='��������,' if $wep[$id][9]==3;
	$texiao.='���R����,' if $wep[$id][9]==4;
	$texiao.='�߼����R,' if $wep[$id][9]==5;
	$texiao.='����΢������,' if $wep[$id][9]==6;
	$texiao.='����p��,' if $wep[$id][9]==8;

	$texiao='����{��,' if $wep[$id][9]==125378;	#�C�w�p��+���Y����
	$texiao='�����b��,' if $wep[$id][9]==35;	#�C�w�p��+��������
	$texiao='����b��,' if $wep[$id][9]==85;	#�C�w�p��+���Y����+��������
	$texiao='�تz�Y��,' if $wep[$id][9]==1246;

	$texiao.='���R����,' if $wep[$id][9]=~m/a/;
	$texiao.='�������R,������������,' if $wep[$id][9]=~m/b/;
	$texiao.='؞��,' if $wep[$id][9]=~m/c/;
	$texiao.='���X�p��,' if $wep[$id][9]=~m/d/;
	$texiao.='HP����,' if $wep[$id][9]=~m/e/;
	$texiao.='�Ա�,' if $wep[$id][9]=~m/f/;
	$texiao.='����,' if $wep[$id][9]=~m/g/;
	$texiao.='��������,' if $wep[$id][9]=~m/h/;
	$texiao='none' if !$texiao;
	print $texiao;$texiao='';

}

