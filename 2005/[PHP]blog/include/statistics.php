<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$bloglang/list.lang.php"); //引入语言包

checkpermit ('ViewStat');

$crtime=date($langdatefomat, $regitime);
$the_current_time=mktimezone(time());
$days=floor(($the_current_time-$regitime)/(24*60*60));

if ($days==0) $days=1;

$av_art=floor($articlenum/$days);
if ($av_art==0) $av_art="&lt;1";

$av_rep=floor($reply_single/$days);
if ($av_rep==0) $av_rep="&lt;1";

$av_reg=floor($regusers/$days);
if ($av_reg==0) $av_reg="&lt;1";

$av_vis=floor($visit/$days);
if ($av_vis==0) $av_vis="&lt;1";

if (!file_exists("$dirblog/counter.backup.php")) $putgraph="<tr><td align=\"center\">No History Data</td></tr>";
else {
	$stathistory_all=@yafile("$dirblog/counter.backup.php");
	$stathistory_all=array_slice($stathistory_all,0,20);
	$thesedays=min(sizeof($stathistory_all), 20);
	$ruler=0;
	for ($i=0; $i<$thesedays; $i++) {
		$tmpdata=substr($stathistory_all[$i], 44, 10);
		$tmpdata2=substr($stathistory_all[$i], 55, 8);
		$vis_his[$i]=$tmpdata-1000000000;
		$ruler=max($vis_his[$i],$ruler);
		$day_his[$i]=substr($tmpdata2,0,4).'-'.substr($tmpdata2,4,2).'-'.substr($tmpdata2,6);
	}
	for ($i=0; $i<$thesedays; $i++) {
		$putgraph.="<tr><td width=\"120\">".$day_his[$i]."</td><td>".statgraphic($vis_his[$i], $ruler)."</td></tr>";
	}
}

if (!file_exists("blog/online.php")) $putonline="<tr><td align=\"center\">No Online Data</td></tr>";
else {
	$nowonline=array_slice($nowonline,0,20);
	$theseonline=min(sizeof($nowonline), 20);
	for ($i=0; $i<$theseonline; $i++) {
		$tmpdata=explode("||", $nowonline[$i]);
		if ($login_status!=1) {
			$fullip=@explode(".", $tmpdata[1]);
			$tmpdata[1]=$fullip[0].'.'.$fullip[1].'.'.'*.*';
		}
		$putonline.="<tr><td>".$tmpdata[1]."</td><td>".date($langdatefomat,mktimezone($tmpdata[2]))."</td></tr>";
	}
}

function statgraphic($visitnum, $ruler) {
	if ($ruler==0) $ruler=1;
	$width=floor(($visitnum/$ruler)*90)."%";
	if ($width=="0%") $width="1%";
	$out="<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" height=\"10\"><tr><td width=\"$width\" background=\"img/bar.gif\" style=\"background-repeat: repeat-x;\">&nbsp;</td><td align=\"right\">$visitnum</td></tr></table>";
	return $out;
}

$showstat=<<<eot
<br/><table width="90%" cellpadding="3" cellspacing="0" style="border: $color2 1px solid; background-color: $color1; color: $font1" align="center">
<tr><td align="center">
$langstat[0]
</td></tr></table>
<table width="100%" cellpadding="0" cellspacing="0">
<tr><td width="120">$langstat[1]</td><td colspan="3">$blogname</td></tr>
<tr><td width="120">$langstat[2]</td><td colspan="3">$owner</td></tr>
<tr><td width="120">$langstat[3]</td><td>$crtime</td><td width="120">$langstat[4]</td><td>$days $langstat[5]</td></tr>
<tr><td width="120">$langstat[6]</td><td>$articlenum</td><td width="120">$langstat[7]</td><td>$av_art</td></tr>
<tr><td width="120">$langstat[8]</td><td>$reply_single</td><td width="120">$langstat[7]</td><td>$av_rep</td></tr>
<tr><td width="120">$langstat[9]</td><td>$regusers</td><td width="120">$langstat[7]</td><td>$av_reg</td></tr>
</table>

<br/><table width="90%" cellpadding="3" cellspacing="0" style="border: $color2 1px solid; background-color: $color1; color: $font1" align="center">
<tr><td align="center">
$langstat[10]
</td></tr></table>
<table width="100%" cellpadding="0" cellspacing="0">
<tr><td width="120">$langstat[11]</td><td>$visit</td><td width="120">$langstat[7]</td><td>$av_vis</td></tr>
<tr><td width="120">$langstat[12]</td><td colspan="3">$todayvisit</td></tr>
</table>

<br/><table width="90%" cellpadding="3" cellspacing="0" style="border: $color2 1px solid; background-color: $color1; color: $font1" align="center">
<tr><td align="center">
$langstat[13]
</td></tr></table>
<table width="100%" cellpadding="0" cellspacing="0">
$putgraph
</table>

<br/><table width="90%" cellpadding="3" cellspacing="0" style="border: $color2 1px solid; background-color: $color1; color: $font1" align="center">
<tr><td align="center">
$langstat[14]
</td></tr></table>
<table width="100%" cellpadding="0" cellspacing="0">
<tr><td>$langstat[15]</td><td>$langstat[16]</td></tr>
$putonline
</table>
<div align="right">$langstat[17] $total_online</div>

<br/>
eot;
$t -> set_file("mainbody", "blog/template/$tem/reply.htm");
$t->set_var(array("replyinfo"=>$langstat[18], "reply"=>$showstat,));
$t->parse("mainbodyout","mainbody",true);

