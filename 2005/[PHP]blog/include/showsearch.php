<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$bloglang/search.lang.php"); //引入语言包

$searchvolume=300;

if (empty($mode)) $mode="simple";

if ($mode=="simple") {
checkpermit ('BasicSearch');
if ($keywords=="") {
	echo "<META HTTP-EQUIV='Refresh' CONTENT='0;URL=index.php'>";
	exit();
}
unset($all);
$keywords=safe_convert($keywords);
$keywords=preg_quote($keywords); 
$matches=0;
$all=@file("$dirblog/list.php");
for ($i=0;$i<count($all); $i++) {
	$latest=explode("|",$all[$i]);
	$articlename=$latest[2];
	if (eregi($keywords, $articlename)) {
		$articlename=eregi_replace($keywords, "<span class='riqi'>$keywords</span>", $articlename);
		$articleidd=$latest[1];
		$articleviews=$latest[4];
		$articlereplys=$latest[5];
		$showtime=date("Y-n-j",($latest[3]+$timezone*3600));
		$allmatch.="· <a href=\"index.php?job=art&amp;articleid=$articleidd\">$articlename</a> ($showtime)<br/><br/>";
		$matches+=1;
	}
}
$allmatch2="$langsearch[4]<strong> ".stripslashes($keywords)." </strong><br/> ".$matches." $langsearch[5]<br/><br/>".$allmatch;
$t = new template("."); 
$t -> set_file("mainbody", "blog/template/$tem/list.htm");
$t->set_var(array("articlenum"=>$matches, "alllist"=>$allmatch2, "newurl"=>$newurl,));
$t->parse("mainbodyout","mainbody");
}


if ($mode=="advance" || $mode=="shre") {
checkpermit ('AdvancedSearch');
/*if ($advancesearch==2 && $guest_login!=1 && $login_status!=1) {
	$go="<back>";
	require ("header.php");
	msg_box($langerror,"$langsearch[1]<br><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
	require("footer.php");
	exit();
}
if ($advancesearch==3 && $login_status!=1) {
	$go="<back>";
	require ("header.php");
	msg_box($langerror,"$langsearch[2]<br><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
	require("footer.php");
	exit();
}*/
}

if ($mode=="advance") {
checkpermit ('AdvancedSearch');
$lei=getcats();

$bodytable=<<<eot
<form action="search.php" method="post">
<table width="100%"><tr valign="top"><td width="20%">$langsearch[6]</td><td><input type="text" name="keywords" size="25" maxlength="15"/><br/>$langsearch[7]</td></tr>
<tr valign="top"><td width="20%">$langsearch[8]</td><td>$lei $langsearch[9]</td></tr>
<tr valign="top"><td width="20%">$langsearch[10]</td><td><select name="timeperiod"><option selected="selected" value="0">$langsearch[11]</option><option value="1">$langsearch[12]</option><option value="2">$langsearch[13]</option><option value="3">$langsearch[14]</option><option value="4">$langsearch[15]</option><option value="5">$langsearch[16]</option><option value="6">$langsearch[17]</option></select></td></tr>
<tr valign="top"><td width="20%">$langsearch[18]</td><td><input type="checkbox" name="range[0]" checked="checked" value="bt"/>$langsearch[19]  <input type="checkbox" name="range[1]" value="nr"/>$langsearch[20]
</td></tr>
<tr valign="top"><td colspan="2">$langsearch[21]<br/>{$langsearch[22]}: $searchinterval $langsearch[23]</td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="$langsearch[24]"/>
</td></tr>
</table>
</form>
eot;
$t = new template("."); 
$t -> set_file("mainbody", "blog/template/$tem/reply.htm");
$t->set_var(array("replyinfo"=>$langsearch[25], "reply"=>$bodytable, ));
$t->parse("mainbodyout","mainbody");
}

if ($mode=="shre") {
checkpermit ('AdvancedSearch');
	if (!file_exists("temp/$f"))  {
	$go="<back>";
	require ("header.php");
	msg_box($langerror,"$langerror<br><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
	require("footer.php");
	exit();
}
	$allfiles=@file("temp/$f");
	$tm1st=@explode("θscθ", $allfiles[0]);
	$keywords=decode($tm1st[2],"small");
	$allfiles[0]=$tm1st[3];
	if (empty($allfiles[0])) unset($allfiles);
	$matches=count($allfiles);
	for ($i=0; $i<$matches; $i++) {
		$latest=explode("|",$allfiles[$i]);
		$articleid=$latest[1];
		$articlename=$latest[2];
		$latest[3]=mktimezone($latest[3]);
		$showtime=date("Y-n-j",$latest[3]);
		$alllist.="· <a href=\"$tf?job=art&amp;articleid=$articleid\" target=\"_blank\">$articlename</a> ($showtime)<br/><br/>";
	}
	$articlenumbar="$langsearch[26] <strong>".$keywords."</strong> $langsearch[27] <strong>$matches</strong>";
	if ($matches!=0) $listdescription=$langsearch[28];
	else $listdescription=$langsearch[29];
	$alllist.="<br/>".getstr($searchinterval, "$langsearch[0]");
	$t = new template("."); 
	$t -> set_file("mainbody", "blog/template/$tem/list.htm");
	$t->set_var(array("articlenumbar"=>$articlenumbar, "alllist"=>$alllist, "newurl"=>$newurl, "listdescription"=>$listdescription,));
	$t->parse("mainbodyout","mainbody");
}

?>