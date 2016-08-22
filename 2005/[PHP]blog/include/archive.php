<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$bloglang/main.lang.php"); //引入语言包
if (empty($ary) || empty($arm) || $arm<1 || $arm>12 || $ary>2100 || $ary<2000) {
	header ("location: index.php");
	exit();
}
unset($all);
$tar=$ary.'-'.$arm;
if ($arm!=1) $bounceout=$ary.'-'.($arm-1);
else $bounceout=($ary-1).'-12';
$matches=0;
$all=@file("$dirblog/list.php");
for ($i=0;$i<count($all); $i++) {
	$latest=explode("|",$all[$i]);
	$btime=date("Y-n",mktimezone($latest[3]));
	if ($btime==$tar){
		$allfiles[]=$all[$i];	
		$matches+=1;
	}
	if ($btime==$bounceout) break;
}

if ($matches!=0) {
	if ($alwaysuselist==0) {
		if ($golist=="") $listway=0;
		elseif ($golist==1) $listway=1;
		else $listway=0;
	} else {
		if ($golist=="") $listway=1;
		elseif ($golist==1) $listway=1;
		else $listway=0;
	}

	if ($listway==1) {
		$another_url="<a href=\"index.php?job=archive&amp;ary=$ary&amp;arm=$arm&amp;golist=0\">$langmain[27]</a>";
	}
	else  {
		$another_url="<a href=\"index.php?job=archive&amp;ary=$ary&amp;arm=$arm&amp;golist=1\">$langmain[6]</a>";
	}
	$x=new listshow();
	$basic_url="index.php?job=archive&amp;ary=$ary&amp;arm=$arm&amp;golist=$golist";
	$outshown=$x->output_show ($basic_url, $allfiles);
	$t -> set_var("mainbodyout", $outshown);

	
}
else {
	$t -> set_file("mainbody", "blog/template/$tem/reply.htm");
	$t->set_var(array("replyinfo"=>$langerrornoday, "reply"=>$langerrornoday2,));
	$t->parse("mainbodyout","mainbody",true);
}
?>