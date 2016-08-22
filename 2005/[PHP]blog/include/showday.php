<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$bloglang/main.lang.php"); //引入语言包

if (!$tar) {
	header ("location: index.php");
	exit();
}
unset($all);
$matches=0;
$all=@file("$dirblog/list.php");
for ($i=0;$i<count($all); $i++) {
	$latest=explode("|",$all[$i]);
	$btime=date("Ymd",mktimezone($latest[3]));
	if ($tar==$btime){
		$allfiles[]=$all[$i];	
		$matches+=1;
	}
}
if ($matches!=0) {
	$x=new listshow();
	$basic_url="index.php?job=showday&amp;tar=$tar";
	$outshown=$x->output_show ($basic_url, $allfiles);
	$t -> set_var("mainbodyout", $outshown);
}
else {
	$t -> set_file("mainbody", "blog/template/$tem/reply.htm");
	$t->set_var(array("replyinfo"=>$langerrornoday, "reply"=>$langerrornoday2,));
	$t->parse("mainbodyout","mainbody",true);
}
?>