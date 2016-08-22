<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
checkpermit ('ViewLinks');
require_once("blog/language/$bloglang/list.lang.php"); //引入语言包

unset($tmp);
if (file_exists("$dirblog/links.php")) {
	$tmp=file("$dirblog/links.php");
	$minlinks=count($tmp);
}
for ($i=0; $i<$minlinks; $i++) {
	$tk=explode("|",$tmp[$i]);
	$tk[1]=stripslashes($tk[1]);
	if ($tk[3]!="pic") $textlinks.="<a href=\"$tk[2]\" target=\"_blank\">$tk[1]</a><br/><br/>";
	else $piclinks.="<a href=\"$tk[2]\" target=\"_blank\"><img src=\"$tk[4]\" border=\"0\" alt=\"$tk[1]\"/></a><br/><br/>";
}
$showup="<table width=\"95%\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\"><tr><td bgcolor=\"$border\"><table width=\"100%\"  cellpadding=\"4\" cellspacing=\"1\"><tr><td bgcolor=\"$color2\"><span style=\"color: $font2\">$langlist[1]</span></td></tr><tr><td align=\"center\"  bgcolor=\"$color1\">$textlinks</td></tr><tr><td bgcolor=\"$color2\"><span style=\"color: $font2\">$langlist[2]</span></td></tr><tr><td align=\"center\" bgcolor=\"$color1\">$piclinks</td></tr><tr><td align=\"right\" bgcolor=\"$color2\"><a href=\"profile.php?job=link\" target=\"_blank\"><span style=\"color: $font2\">$langlist[3]</span></a></td></tr></table></td></tr></table>";
$t -> set_file("mainbody", "blog/template/$tem/reply.htm");
$t->set_var(array("replyinfo"=>$langlist[4], "reply"=>$showup,));
$t->parse("mainbodyout","mainbody",true);
?>