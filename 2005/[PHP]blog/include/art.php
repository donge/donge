<?
if (inwork!=1) {die ("Not allowed to acess this file.");} //防止被单独运行
require_once("blog/language/$bloglang/main.lang.php"); //引入语言包

	$isfound=0;
	if (empty($articleid)) $isfound=0;
	else {

	$latest=locatedata("$dirblog/list.php", $articleid);
	if ($latest) {
	$id=$latest[1];
	$articlereplys=$latest[5];
	$permanantlink=trim($latest[10]); //伪静态地址
	$blogauthor=trim($latest[11]);
	if (empty($blogauthor)) $blogauthor=$username; //作者
	if (!empty($permanantlink)) $permanantshow="<strong>$langmain[36]</strong> <a href=\"{$weburl}/p/{$permanantlink}.php\">".shortenurl("{$weburl}/p/{$permanantlink}.php")."</a>";
	else $permanantshow="<strong>$langmain[36]</strong> <a href=\"{$weburl}/index.php?job=art&amp;articleid={$articleid}\">".shortenurl("{$weburl}/index.php?job=art&amp;articleid={$articleid}")."</a>";
	$articlename=$latest[2];
	if ($latest[7]==1) $articlename=str_replace("{chr}", $langmain[34], $parts["mobile"]).$articlename; //手机
	$catidd=$latest[4];
	$tblinkshow="<strong>$langmain[37]</strong> <a href=\"{$weburl}/tb.php?tb_id={$latest[3]}\">".shortenurl("{$weburl}/tb.php?tb_id={$latest[3]}")."</a>";
	$latest[3]=mktimezone ($latest[3]);
	$week=date("w", $latest[3]);
	$weekday=$langweekfull;
	$articletime=date($langdatefomat,$latest[3]).$weekday[$week];
	$todayweather=$latest[6];
	$tracknum=$latest[8];
	$ishidden=$latest[9];
	if (empty($tracknum)) $tracknum=0;
	if (ereg("w_", $todayweather)) $articletime="<img src=\"{$location['weather']}/$todayweather.gif\" title=\"$langmain[1]\" />".$articletime; //天气
	$isfound=1;
	$foundindex=$i; //获得当前序号
	if (file_exists("blog/sticky.php")) require("blog/sticky.php");
	if (strpos($sticky, $articleid)) $quxiaozhiding=$langmain[5];
	else $quxiaozhiding=$langmain[4];
		if ($isowner==1) {
		$editurl=multi_str_replace(array("{url}"=>"mblog_edit.php?articleid=$articleid", "{chr}"=>$langmain[7]), $parts['editurl']);
		$delurl=multi_str_replace(array("{url}"=>"mblog_edit.php?articleid=$articleid&amp;action=del", "{chr}"=>$langmain[8]), $parts['delurl']);
		$noreplyurl=multi_str_replace(array("{url}"=>"mblog_reply.php?articleid=$articleid&amp;action=delallreply", "{chr}"=>$langmain[9]), $parts['noreplyurl']);
		$stickinfo=multi_str_replace(array("{url}"=>"admin_cp.php?job=stick&amp;articleid=$articleid", "{chr}"=>$quxiaozhiding), $parts['stickinfo']);
		} else {
		$editurl="";
		$delurl="";
		$noreplyurl="";
		$stickinfo="";
	}

}	
}
if ($isfound<>1) {
	wronginfo($langerrornoart);
} else {
$articlemall=getarticle("$dirblog/$id.art"); //得到数组
	$article=$articlemall["content"]; //得到内容
	list($articleviews, $nouse)=@explode("|", $articlemall["append"]); //得到计数器
	$articleviews=str_replace("{chr}", getstr($articleviews, $langmain[2]), $parts['articleviews']); //得到阅读次数
	if ($ishidden==1 && $login_status!=1) $article=str_replace("{chr}", $langmain[3], $parts['ishidden1']); //隐藏限制查看的内容
	if ($ishidden==3 && ($login_status!=1 && $guest_login!=1)) $article=str_replace("{chr}", $langmain[38], $parts['ishidden3']); //隐藏限制查看的内容
	$article="<span id=\"zoom\">".$article."</span>"; //大中小字体选项
	if (file_exists("catimg/".$latest[4].".gif")) $thiscatimg="<a href=\"index.php?job=showcat&amp;cat=$latest[4]\"><img src=\"catimg/".$latest[4].".gif\" border=\"0\" title=\"{$categories[$catidd]}\"  align=\"middle\"/></a>";
	else $thiscatimg="<img src=\"blog/template/".$tem."/noimg.gif\" title=\"{$categories[$catidd]}\"  align=\"middle\"/>";
	$thiscat="<a href=\"index.php?job=showcat&amp;cat=$latest[4]\">{$categories[$catidd]}</a>";
	if ($ishidden==1 || $ishidden==2) $reurl="$langmain[10]";
	elseif ($ishidden==3 &&  ($login_status!=1 && $guest_login!=1)) $reurl=$langmain[10];
	else $reurl=multi_str_replace(array("{url}"=>"index.php?job=art&amp;articleid={$articleid}#add", "{chr}"=>$langmain[11], "{num}"=>$articlereplys), $parts['reurl']);

	if ($latest[21]) {
		if (!empty($latest[25])) $linkaddr="p/{$latest[25]}.php";
		else $linkaddr="index.php?job=art&amp;articleid={$latest[21]}";
		$quicktoprevious="<a href=\"$linkaddr\">{$directarrow[0]}$langmain[14] ".msubstr($latest[22],0,40)."</a>";
	} else $quicktoprevious="&nbsp;";

	if ($latest[23]) {
		if (!empty($latest[26])) $linkaddr="p/{$latest[26]}.php";
		else $linkaddr="index.php?job=art&amp;articleid={$latest[23]}";
		$quicktonext="<a href=\"$linkaddr\">$langmain[15] ".msubstr($latest[24],0,40)."$directarrow[1]</a>";
	} else $quicktonext="&nbsp";

	$previousandnext=multi_str_replace(array("{url1}"=>$quicktoprevious, "{url2}"=>$quicktonext), $parts['previousandnext']);
	$seereply="<script type=\"text/javaScript\">function doZoom(size){		document.getElementById('zoom').style.fontSize=size+'px'}</script>$langmain[16]<a href=\"javascript:doZoom(16)\">$langmain[17]</a> <a href=\"javascript:doZoom(14)\">$langmain[18]</a> <a href=\"javascript:doZoom(12)\">$langmain[19]</a>"; //大中小字体的js
	$trackback=multi_str_replace(array("{url}"=>"index.php?job=seetb&amp;articleid=$articleid", "{chr}"=>$langmain[13], "{num}"=>$tracknum), $parts['trackback']);
	$t -> set_file("mainbody", "blog/template/$tem/article.htm");
	$t->set_var(array("articleid"=>$articleid, "articlereplys"=>$articlereplys, "seereply" =>$seereply, "articlename"=>$articlename, "articletime"=>$articletime, "article"=>$article, "editurl"=>$editurl, "delurl"=>$delurl, "noreplyurl"=>$noreplyurl, "newurl"=>$newurl, "reurl"=>$reurl, "thiscat"=>$thiscat,"previousandnext"=>$previousandnext,"stickinfo"=>$stickinfo,"thiscatimg"=>$thiscatimg, "trackback"=>$trackback,"articleviews"=>$articleviews, "permanantshow"=>$permanantshow, "tblinkshow"=>$tblinkshow, "blogauthor"=>$blogauthor,));
	$t->parse("mainbodyout","mainbody",true);

	//开始获取评论
	if ($articlereplys==0 || !file_exists("$dirblog/$articleid.rep")) {
		if ($ishidden==1 || $ishidden==2) {$reply=$langmain[20]; $replyinfo=$langmain[21];}
		else {$reply=$langmain[22]; $replyinfo=$langmain[21];}
		$t -> set_file("rebody", "blog/template/$tem/reply.htm");
		$t->set_var(array("reply"=>$reply, "replyinfo"=>$replyinfo));
		$t->parse("mainbodyout","rebody",true);
	}
	else {
		unset ($tmp);
		$tmp=@file("$dirblog/$articleid.rep");
		$areply=@readfromfile("$dirblog/$articleid.rpl");
		$tmpreply=@explode("\n|rep|", $areply);
		$counttmp=count($tmp);
		if($counttmp>$repperpage) {
			if (empty($repp)) $repp=1;
			$startrep=($repp-1)*$repperpage;
			$countreps=$startrep+$repperpage;
			$countreps=min($counttmp, $countreps);
			$lastrepp=floor(($counttmp-1)/$repperpage)+1;
			for ($o=1; $o<=$lastrepp; $o++) {
				if ($o!=$repp)	$morepre.=multi_str_replace(array("{url}"=>"index.php?job=art&amp;articleid=$articleid&amp;repp={$o}#comment", "{num}"=>$o), $parts['eachpage']);
				else $morepre.=str_replace("{num}", $o, $parts['currentpage']);
			}
			$morepre=str_replace("{chr}", $morepre, $parts['morepre']);
		}	else {
			$countreps=$counttmp;
			$startrep=0;
		}
		for ($i=$startrep; $i<$countreps;$i++) {
			unset($gravataraddr);
			$rep=explode("|",$tmp[$i]);
			$replyauthorandemail=@explode("θθ", $rep[2]);
			$replyauthor=trim($replyauthorandemail[0]);
			if (!empty($replyauthorandemail[1])) {
				$replyauthor="<a href=\"mailto:$replyauthorandemail[1]\" title=\"$langmain[24]\">$replyauthor</a>";
				$gravataraddr=$replyauthorandemail[1];
			}
			if ($rep[4]==1) {
				if ($replyauthor==$username) $gravataraddr=$useremail;
				else $gravataraddr=getregavatar($replyauthor,1);
				$replyauthor="<a href=\"profile.php?job=regprofile&amp;user=".urlencode($replyauthor)."\" target=\"_blank\" title=\"$langmain[25]\">$replyauthor</a>";
			}
			elseif ($rep[4]==2) {
				$gravataraddr=getregavatar($replyauthor,1);
				$replyauthor="<a href=\"profile.php?job=regprofile&amp;user=".urlencode($replyauthor)."\" target=\"_blank\" title=\"$langmain[25]\">$replyauthor</a>";
			} 
			if ($gravataraddr) {
				$defaultgravatar=urlencode("$weburl/img/gravatar.jpg");	$grav_url="http://www.gravatar.com/avatar.php?gravatar_id=".md5($gravataraddr)."&amp;default=$defaultgravatar";
				$gravatar="<a href=\"$grav_url\" target=\"_blank\"><img src=\"$grav_url\" title=\"Gravatar\" alt=\"Gravatar\" align=\"left\" width=\"40\" style=\"border: 1px solid #000\" /></a>";
			} else {
				$gravatar="";
			}
			$replyid=$i;
			$replyid2=$i.":".$rep[3];
			$rep[3]=mktimezone($rep[3]);
			$week=date("w", $rep[3]);
			$weekday=$langweekfull;
			$replytime=date($langdatefomat, $rep[3]).$weekday[$week];
			if ($rep[5]=='wap') $replyauthor=str_replace("{chr}", $langmain[35], $parts["mobile"]).$replyauthor; //手机
			if ($isowner==1) {$replyip=$rep[5]; $replyauthor.="($replyip)";}
			$reply=getreply($tmpreply[$replyid]);
			if ($showgravatar==1) {
				$reply=multi_str_replace(array("{chr1}"=>$reply, "{chr2}"=>$gravatar), $parts['gravatar']);
			}
			if ($protectemailaddress==1) $replyauthor=emailconvert($replyauthor);
			//2004-11-27 增加管理员回复
			if ($rep[6]=="y") {
				$adminreplytime=date($langdatefomat, mktimezone($rep[7]));
				$adminreplycontent=decode($rep[8], 'full');
				$adminreplyadmin=trim($rep[9]);
				if (empty($adminreplyadmin)) $adminreplyadmin=$username;
				if ($isowner==1) $deladminreply=" [<a href=\"mblog_reply.php?action=deladminreply&amp;replyid=$replyid2&amp;articleid=$articleid\">$langmain[8]</a>] [<a href=\"mblog_reply.php?action=addadminreply&amp;replyid=$replyid2&amp;articleid=$articleid\">$langmain[33]</a>]";
				$adminreplywords="$adminreplyadmin ".getstr($adminreplytime, $langmain[31])." $deladminreply";
				$reply.=multi_str_replace(array("{chr1}"=>$adminreplywords, "{chr2}"=>$adminreplycontent), $parts['adminreply']);
			}
			//管理员回复结束
			if ($i==($countreps-1)) $reply.=$morepre;
			$replyinfo=$replyauthor.getstr($replytime, $langmain[26]);
			if ($i==$startrep) $replyinfo="<a name=\"comment\"></a>".$replyinfo;  //回复开始处的锚链
			if ($isowner==1) $delreply=" [<a href=\"mblog_reply.php?action=delreply&amp;replyid=$replyid2&amp;articleid=$articleid\">$langmain[8]</a>]  [<a href=\"mblog_reply.php?action=addadminreply&amp;replyid=$replyid2&amp;articleid=$articleid\">$langmain[32]</a>]";
			$t -> set_file("rebody", "blog/template/$tem/reply.htm");
			$t->set_var(array("replyinfo"=>$replyinfo, "reply"=>$reply, "delreply"=>$delreply,));
			$t->parse("mainbodyout","rebody",true);
		}
	}	

//回复栏
if ($ishidden!=1 && $ishidden!=2) {
if ($login_status==1 || $guest_login==1) 	{
$arname=$nowuserid;
$ifdisabled="disabled=\"disabled\"";
$qrplus1="";
$qrplus2=" [<a href=\"login.php?action=logout\">$langreply[0]</a>] <input name=\"replyauthor\" type=\"hidden\" value=\"$nowuserid\" />";
}
else {
$arname=$remname;
$ifdisabled="";
if ($allowreg==1) {
	$qrplus1="&nbsp;&nbsp; <strong><a href=\"login.php\" title=\"$langreply[1]\">$langreply[2]</a> &nbsp; <a href=\"index.php?job=register\" title=\"$langreply[3]\">$langreply[4]</a></strong><br/>";
	$qrplus2="&nbsp;<input type=\"checkbox\" value=\"1\" name=\"isremember\" $remstatusshow />$langreply[5] <br/>$langreply[6]<br/><input name=\"replyemail\" maxlength=\"80\" size=\"40\" value=\"$rememail\" /> $langreply[7]";
} else {
	$qrplus1="&nbsp;&nbsp; <strong><a href=\"login.php\">$langreply[2]</a></strong><br/>";
	$qrplus2="&nbsp;<input type=\"checkbox\" value=\"1\" name=\"isremember\" $remstatusshow />$langreply[31] <br/>$langreply[6]<br/><input name=\"replyemail\" maxlength=\"80\" size=\"40\" value=\"$rememail\" /> $langreply[7]";
}
}
$codec=rand(1001, 9999);
$ccodec=md5($codec);
$codec=getvnimg($codec);
if ($validation==1) $validc="$langreply[8] <input name=\"codec\" type=\"text\" value=\"\" maxlength=\"4\" size=\"4\" /> $langreply[9] $codec <input name=\"ccodec\" type=\"hidden\" value=\"$ccodec\" />";
$ubbextension=<<<eot
<select name="colorsel" onchange="minsert('[color='+options[this.selectedIndex].value+'][/color]')"><option value="" selected>$langreply[17]</option><option style="color: blue" value="blue">$langreply[18]</option> <option style="color: orange" value="orange">$langreply[19]</option> <option style="color: crimson" value="crimson">$langreply[20]</option> <option style="color: red" value="red">$langreply[21]</option> <option style="color: green" value="green">$langreply[22]</option> <option style="color: deeppink" value="deeppink">$langreply[23]</option>  <option style="color: purple" value="purple">$langreply[24]</option> </select> <a href="javascript: minsert('[b] [/b]')"><img src="img/b.gif" title="$langreply[25]" alt="$langreply[25]" border="0"/></a> <a href="javascript: minsert('[i] [/i]')"><img src="img/i.gif" title="$langreply[26]" alt="$langreply[26]" border="0"/></a> <a href="javascript: minsert('[u] [/u]')"><img src="img/u.gif" title="$langreply[27]" alt="$langreply[27]" border="0"/></a> <a href="javascript: minsert('[url][/url]')"><img src="img/url.gif" title="$langreply[28]" alt="$langreply[28]" border="0"/></a> <a href="javascript: minsert('[hr]')"><img src="img/hr.gif" title="$langreply[29]" alt="$langreply[29]" border="0"/></a> <a href="javascript: minsert('[quote] [/quote]')"><img src="img/quote.gif" title="$langreply[30]" alt="$langreply[30]" border="0"/></a> <br/>
eot;
include ("blog/emotcache.php");
$emots="<br/>".$commentemots."<br/>";
$t -> set_file("addrebody", "blog/template/$tem/addreply.htm");
$t->set_var(array("arname"=>$arname, "ifdisabled"=>$ifdisabled, "qrplus1"=>$qrplus1, "qrplus2"=>$qrplus2, "validc"=>$validc,"articleid"=>$articleid, "langreply10"=>$langreply[10], "langreply11"=>$langreply[11], "langreply12"=>$langreply[12], "langreply13"=>$langreply[13], "langreply14"=>$langreply[14], "langreply15"=>$langreply[15], "langreply16"=>$langreply[16], "langreply17"=>$langreply[32], "ubbextension"=>$ubbextension, "emots"=>$emots, "articletitle"=>strip_tags($articlename)." - ", "arttburl"=>"rss2.php?logid=$articleid", "arttbchr"=>$langrss[2],));
$t->parse("mainbodyout","addrebody",true);
}
}
?>