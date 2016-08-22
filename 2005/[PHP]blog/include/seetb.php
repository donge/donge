<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$bloglang/list.lang.php"); //引入语言包
require ("blog/tbconfig.php");
	$isfound=0;
	if (empty($articleid)) $isfound=0;
	else {
//	unset ($allfiles);
//	$allfiles=file("$dirblog/list.php");
//	$allfilescount=count($allfiles);
//	for ($i=0; $i<$allfilescount;$i++) {
//	$latest=explode("|",$allfiles[$i]);
	$latest=locatedata("$dirblog/list.php", $articleid);
	$id=$latest[1];
//	if ($id==$articleid) {
	$articlename=$latest[2];
	$tbid=$latest[3];
	$latest[3]=mktimezone($latest[3]);
	$week=date("w", $latest[3]);
	$weekday=$langweekfull;
	$articletime=date($langdatefomat, $latest[3]).$weekday[$week];
	$tracknum=$latest[8];
	if (empty($tracknum)) $tracknum=0;
	$isfound=1;
//	break;
//	}
//}	
}
if ($isfound<>1) {
	wronginfo($langerrornoart);
} else {
	$replyinfo=getstr($articlename, $langlist[5]);
	if ($iconv_status=="on") {
		$addresses="$langlist[6]<br/>&nbsp;&nbsp;$langlist[7] <span id='tbid'> $weburl"."/tb.php?tb_id=$tbid&amp;c=gb</span> [<a href='#' onclick='copyText(document.all.tbid)'>$langlist[8]</a>]<br/><br/>&nbsp;&nbsp;$langlist[9] <span id='tbid2'> $weburl"."/tb.php?tb_id=$tbid&amp;c=big5</span> [<a href='#' onclick='copyText(document.all.tbid2)'>$langlist[8]</a>]<br/><br/>&nbsp;&nbsp;$langlist[10] <span id='tbid3'> $weburl"."/tb.php?tb_id=$tbid</span> [<a href='#' onclick='copyText(document.all.tbid3)'>$langlist[8]</a>]<br/><br/>&nbsp;&nbsp;$langlist[11]";
	}
	else {
		$addresses="$langlist[12] <span id='tbid'> $weburl"."/tb.php?tb_id=$tbid</span> [<a href=# onClick='copyText(document.all.tbid)'>$langlist[8]</a>]<br/><br/>&nbsp;&nbsp;$langlist[13]";
	}
	$reply="&nbsp;&nbsp;$langlist[14] $articletime , ".getstr("<strong> $tracknum </strong>", $langlist[15])."<br/>&nbsp;&nbsp;<br/><script type='text/javascript'>function copyText(obj) {var rng = document.body.createTextRange();rng.moveToElementText(obj);rng.scrollIntoView();rng.select();rng.execCommand(\"Copy\");rng.collapse(false);}</script>&nbsp;&nbsp;".$addresses."<br/><br/><div align='center'><a href='index.php?job=art&amp;articleid=$articleid'>$langlist[16]</a></div>";
	$t -> set_file("rebody", "blog/template/$tem/reply.htm");
	$t->set_var(array("reply"=>$reply, "replyinfo"=>$replyinfo));
	$t->parse("mainbodyout","rebody",true);
}

if ($tracknum!=0 && file_exists("$dirtb/$articleid.tb")) {
		unset ($tmp,$reply);
		$tmp=@file("$dirtb/$articleid.tb");
		for ($i=0; $i<(count($tmp));$i++) {
			if ($i!=0) $reply.="<hr width='95%'>";
			list($unuse, $link,$blog_name,$title,$description,$trackbacktime)=@explode("|",$tmp[$i]);
			if (empty($blog_name)) $blog_name=$langlist[17];
			$description=str_replace("&lt;br&gt;","<br>",$description);
			if ($isowner==1)	 $blog_name.="(<a href='mblog_edit.php?action=deltb&amp;articleid=$articleid&amp;tbbid=$i'>$langlist[18]</a>)";
			$tbtime=date($langdatefomat, ($trackbacktime+$timezone*3600));
			$reply.="<table cellpadding='3' cellspacing='0' width='100%' bgcolor='$color2'><tr><td><span style='color: $font2'>$title [$tbtime]</span></td><td align='right'><span style='color: $font2'>$langlist[19]  $blog_name</span></td></tr></table>";
			$reply.="<table cellpadding='3' cellspacing='0' width='100%'><tr><td width='45' valign='top'>$langlist[20]</td><td>$description</td></tr><tr><td width='45'>$langlist[21]</td><td><a href='$link' target='_blank'>$link</a></td></tr></table><br/>";
		}
		$replyinfo=$langlist[22];
			$t -> set_file("rebody", "blog/template/$tem/reply.htm");
			$t->set_var(array("replyinfo"=>$replyinfo, "reply"=>$reply));
			$t->parse("mainbodyout","rebody",true);
}	
?>