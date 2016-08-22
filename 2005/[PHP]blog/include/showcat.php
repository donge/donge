<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$bloglang/list.lang.php"); //引入语言包

$cat=basename($cat); //2005-1-28修补漏洞

if (!file_exists("$dirblog/$cat.php")) {
	wronginfo($langerrornocat);
}
unset ($allfiles);
$allfiles=@file("$dirblog/$cat.php");

$x=new listshow();
$icount=count($allfiles);
$basic_url="index.php?job=showcat&amp;cat=$cat";
$x->make_pages($basic_url, $icount);
for ($i=$start; $i<$end;$i++) {
	$alllist.=$x->list_list ($allfiles[$i]);
}
$alllist.="<div align=\"right\">$pagexianzai $pagediyi $pageshang $pagexiangxi $pagexia $pagezuihou</div>"; //分页显示

$articlenumbar=$categories[$cat]." (".count($allfiles)." $langlist[51]) ".multi_str_replace(array("{url}"=>"rss2.php?catid=$cat", "{chr}"=>$langlist[52]), $parts['showcatrss']);
$listdescription=decode($categorydes[$cat],'full');
$t = new template("."); 
$t -> set_file("mainbody", "blog/template/$tem/list.htm");
$t->set_var(array("articlenumbar"=>$articlenumbar, "alllist"=>$alllist, "newurl"=>$newurl, "listdescription"=>$listdescription,));
$t->parse("mainbodyout","mainbody");
?>