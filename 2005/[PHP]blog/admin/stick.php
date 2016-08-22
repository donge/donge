<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$blogadminlang/adminmt.lang.php"); //引入语言包

$tf="admin_cp.php?job=stick";

if (empty($articleid)){
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langask[0]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
}

if (file_exists("blog/sticky.php")) require("blog/sticky.php");
$bsti=@explode("|",$sticky);
if ($articleid==$bsti[1]) {
$action="destick";
} else $action="dostick";

if ($action=="destick") {
	$newest="<?\n\$sticky=\"\";\n\$announce=\"$announce\";";
	writetofile("blog/sticky.php", $newest);
	updatenewestart (2);
	$go="index.php";
	require("header.php");
	msg_box($langsuccess,"$langask[1]<br><ul><li><a href= index.php>$langbacktoindex</a></li></ul><br><ul><li><a href=index.php?job=art&articleid=$articleid>$langask[2]</a></li></ul>");
	require("footer.php");
	exit;
}


if ($action=="dostick") {
	unset ($all);
	$isfound=0;
	$all=@file("$dirblog/list.php");
	for ($i=0; $i<count($all);$i++) {
	$latest=explode("|",$all[$i]);
	if ($latest[1]==$articleid) {
	$putsticky=$all[$i];
	$isfound=1;
	break;
	}
	}

	if ($isfound<>1){
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langask[0]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	$newest="<?\n\$sticky=\"$putsticky\";\n\$announce=\"$announce\";";
	writetofile("blog/sticky.php", $newest);
	updatenewestart (2);
	$go="index.php";
	require("header.php");
	msg_box($langsuccess,"$langask[3]<br><ul><li><a href= index.php>$langbacktoindex</a></li></ul><br><ul><li><a href=index.php?job=art&articleid=$articleid>$langask[4]</a></li></ul>");
	require("footer.php");
	exit;
}

?>