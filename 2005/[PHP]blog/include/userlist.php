<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$bloglang/list.lang.php"); //引入语言包

checkpermit ('ViewUserList');

unset($tmp);
if (file_exists("$diruser/allids.php")) {
	$tmp=file("$diruser/allids.php");
	if ($sorts=="reverse") $tmp=array_reverse($tmp);
	$mi=count($tmp);
//分页开始
unset ($pagexia, $pageshang, $pagezuihou, $pagediyi, $pagexiangxi, $pagexianzai);
$mi=count($tmp);
$start=($page-1)*$artperpage;
if (($start+$artperpage-1)<$mi) {$end=$start+$artperpage;}
else $end=$mi;
$lastpage=floor(($mi-1)/$artperpage)+1;
if ($page<>1) $pageshang=" <a href=\"index.php?job=userlist&amp;sorts=$sorts&amp;page=".strval($page-1)."\">$directarrow[0]</a> "; 
if ($page<>$lastpage) $pagexia= " <a href=\"index.php?job=userlist&amp;sorts=$sorts&amp;page=".strval($page+1)."\">$directarrow[1]</a>";
$pagediyi= " <a href=\"index.php?job=userlist&amp;sorts=$sorts&amp;page=1\">$directarrow[2]</a>";
$pagezuihou= " <a href=\"index.php?job=userlist&amp;sorts=$sorts&amp;page=$lastpage\">$directarrow[3]</a>";
for ($i=$page; $i<$page+4; $i++) {
	if ($i<=$lastpage) $pagexiangxi.=" <a href=\"index.php?job=userlist&amp;sorts=$sorts&amp;page=$i\">$i</a> ";
	else break;
}
$pagexianzai="$langlist[0] ".$page."/".$lastpage;
//分页结束
	
for ($i=$start; $i<$end; $i++) {
	$tk=explode("|",$tmp[$i]);
	$tk[2]=date("Y-n-j",$tk[2]);
	$listname.="<tr align=\"center\"  bgcolor=\"$color1\"><td>$tk[1]</td><td>$tk[2]</td><td><a href=\"profile.php?job=regprofile&amp;user=".urlencode($tk[1])."\" target=\"_blank\">$langlist[46]</a></td></tr>";
}
}
$regitime=date("Y-n-j",mktimezone($regitime));
if ($page==$lastpage || ($page==1 && empty($mi))) $listname.="<tr align=\"center\" bgcolor=\"$color1\"><td>$owner</td><td>$regitime</td><td><a href=\"profile.php\" target=\"_blank\">$langlist[46]</a></td></tr>";

$showup="<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" align=\"right\"><tr><td bgcolor=\"$border\"><table width=\"100%\"  cellpadding=\"4\" cellspacing=\"1\"><tr align=\"center\"><td bgcolor=\"$color2\" width=\"20%\"><span style=\"color: $font2\">$langlist[32]</span></td><td  bgcolor=\"$color2\"><span style=\"color: $font2\">$langlist[47]</span></td><td  bgcolor=\"$color2\"><span style=\"color: $font2\">$langlist[46]</span></td></tr>".$listname."</table></td></tr>";

if ($sorts=="reverse") $otherwise="<a href='index.php?job=userlist'>$langlist[48]</a>";
else $otherwise="<a href='index.php?job=userlist&amp;sorts=reverse'>$langlist[49]</a>";

$showup.="<tr><td><div align=\"right\">$pagexianzai $pagediyi $pageshang $pagexiangxi $pagexia $pagezuihou $otherwise</div></td></tr></table>";
$t -> set_file("mainbody", "blog/template/$tem/reply.htm");
$t->set_var(array("replyinfo"=>$langlist[50], "reply"=>$showup,));
$t->parse("mainbodyout","mainbody",true);
?>