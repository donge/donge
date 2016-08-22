<?
if (inwork!=1) {die ("Not allowed to acess this file.");} //防止被单独运行
require_once("blog/language/$bloglang/main.lang.php"); //引入语言包

	$isfound=0;
	if (empty($articleid)) $isfound=0;
	else {
	unset ($allfiles);
	$allfiles=file("$dirblog/list.php");
	for ($i=0; $i<count($allfiles);$i++) {
	$latest=explode("|",$allfiles[$i]);
	$id=$latest[1];
	if ($id==$articleid) {
	$articlereplys=$latest[5];
	$articlename=$latest[2];
	$isfound=1;
	break;
	}
}	
}
if ($isfound<>1) {
	wronginfo($langerrornoart);
} else {
	if ($articlereplys==0 || !file_exists("$dirblog/$articleid.rep")) {
		$reply=$langmain[20]; $replyinfo=$langmain[21];
		$t -> set_file("rebody", "blog/template/$tem/reply.htm");
		$t->set_var(array("reply"=>$reply, "replyinfo"=>$replyinfo));
		$t->parse("mainbodyout","rebody",true);
	}
	else {
		unset ($tmp);
		$tmp=file("$dirblog/$articleid.rep");
		$areply=@readfromfile("$dirblog/$articleid.rpl");
		$tmpreply=@explode("\n|rep|", $areply);
/*		if ($replydisplayorder==1) {
			$tmp=array_reverse($tmp);
			$tmpreply=array_reverse($tmpreply);
		}
*/
		for ($i=0; $i<count($tmp);$i++) {
			$rep=explode("|",$tmp[$i]);
			$replyauthorandemail=@explode("θθ", $rep[2]);
			$replyauthor=trim($replyauthorandemail[0]);
			if (!empty($replyauthorandemail[1])) $replyauthor="<a href=\"mailto:$replyauthorandemail[1]\" title='$langmain[24]'>$replyauthor</a>";
			$replyid=$i;
			$replyid2=$i.":".$rep[3];
			$week=date("w", $rep[3]);
			$weekday=$langweekfull;
			$replytime=date($langdatefomat, ($rep[3]+$timezone*3600)).$weekday[$week];
			$reply=getreply($tmpreply[$replyid]);
			//2004-11-27 增加管理员回复
			if ($rep[6]=="y") {
				$adminreplytime=date($langdatefomat, mktimezone($rep[7]));
				$adminreplycontent=decode($rep[8], 'full');
				if ($isowner==1) $deladminreply=" [<a href=\"mblog_reply.php?action=deladminreply&amp;replyid=$replyid2&amp;articleid=$articleid\">$langmain[8]</a>] [<a href=\"mblog_reply.php?action=addadminreply&amp;replyid=$replyid2&amp;articleid=$articleid\">$langmain[33]</a>]";
				$adminreplywords="$owner ".getstr($adminreplytime, $langmain[31])." $deladminreply";
				$reply.=multi_str_replace(array("{chr1}"=>$adminreplywords, "{chr2}"=>$adminreplycontent), $parts['adminreply']);
			}
			//管理员回复结束
			if ($i==count($tmp)-1) $reply.="<br/><br/><div align=\"right\">".getstr("<strong> $articlename </strong>", $langmain[28])." [<a href=\"index.php?job=art&amp;articleid=$articleid\">$langmain[29]</a>]</div>";
			$replyinfo=$replyauthor.getstr($replytime, $langmain[26]);
			if ($isowner==1) $delreply="[<a href=\"mblog_reply.php?action=delreply&amp;replyid=$replyid2&amp;articleid=$articleid\">$langmain[8]</a>]  [<a href=\"mblog_reply.php?action=addadminreply&amp;replyid=$replyid2&amp;articleid=$articleid\">$langmain[32]</a>]";
			$t -> set_file("rebody", "blog/template/$tem/reply.htm");
			$t->set_var(array("replyinfo"=>$replyinfo, "reply"=>$reply, "delreply"=>$delreply,));
			$t->parse("mainbodyout","rebody",true);
		}
	}	
}
?>