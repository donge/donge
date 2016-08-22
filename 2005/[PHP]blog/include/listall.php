<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$bloglang/main.lang.php"); //引入语言包

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
	$another_url="<a href=\"index.php?job=listall&amp;golist=0\">$langmain[27]</a>";
}
else  {
	$another_url="<a href=\"index.php?job=listall&amp;golist=1\">$langmain[6]</a>";
}

unset ($allfiles);
$allfiles=@file("$dirblog/list.php");

if (!empty($sticky)) { //置顶
$pinnedarray=array($sticky);
$plus_array=array_diff($allfiles, $pinnedarray);
$allfiles_new=array_merge($pinnedarray, $plus_array);
unset($allfiles);
$allfiles=$allfiles_new;
$hassticky=1;
}


$x=new listshow();
$basic_url="index.php?job=listall&amp;golist=$golist";
$outshown=$x->output_show ($basic_url, $allfiles, $another_url);
$t -> set_var("mainbodyout", $outshown);

?>