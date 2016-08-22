<?
// Bo-Blog
// A Blog System based on PHP and text database
// Author: Bob Shen
// Official Site: http://www.bo-blog.com
// Email: bobshen@gmail.com
// All Rights Reserved.
// 版权所有，任何修改版权后使用传播之行为皆不允许

$tf="mblog_edit.php";
require("global.php");
require_once("blog/language/$blogadminlang/admingb.lang.php"); //引入语言包

$add_title=" - $langaed[0]";

if ($login_status==0) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langerrornotlogin<br><ul><li><a href=login.php>$langnowlogin</a></li></ul><br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
	exit;
}


if (empty($action)) $action="edit";
include ('blog/emotcache.php');

if ($action=="write") {	
include ('blog/emotcache.php');
if ($draft) {
	list($unused, $draft_title, $draft_content, $draft_pl, $draft_tb)=@file("drafts/$draft.php");
	$draft_title=trim(stripslashes($draft_title));
	$draft_content=trim(safe_invert(stripslashes($draft_content)));
	$draft_pl=trim($draft_pl);
	$draft_tb=trim($draft_tb);
}
if (($htmlmode==1 && $closew!=1)|| $openw==1)	{
$emot="<tr bgcolor='#FFFFFF'><td width=15%>$langaed[1]</td><td>{$writeremots2}".readfromfile("include/emotions2.php")."</td></tr>";
$openw=1;
$toggle='<a href="mblog_edit.php?action=write&closew=1"><font color="#FFFFFF">['.$langaed[2].']</font></a>';
$closeubb="<input type='checkbox' name='closeubbonce' value='1'>$langaed[61]";
if (!empty($justblogiturl)) $justblogit="From: <a href=\"$justblogiturl\" target=\"_blank\">$justblogiturl</a><br/><br/>".safe_invert(safe_convert($justblogit));
}
else {
$editor="<tr bgcolor='#FFFFFF'><td width=15%>$langaed[3]</td><td>".readfromfile("include/editor.php")." </td></tr>";
$emot="<tr bgcolor='#FFFFFF'><td width=15%>$langaed[1]</td><td>{$writeremots1}".readfromfile("include/emotions.php")."</td></tr>";
$openw=0;
$toggle='<a href="mblog_edit.php?action=write&openw=1"><font color="#FFFFFF">['.$langaed[4].']</font></a>';
$closeubb="<input type='checkbox' name='closeubbonce' value='1'>$langaed[61]";
$closehtml="<input type='checkbox' name='closehtmlonce' value='1' checked>$langaed[62]";
if (!empty($justblogiturl)) $justblogit="From: [url=$justblogiturl]{$justblogiturl}[/url]\r".safe_invert(safe_convert($justblogit));
}

	$mycats=getcats();
	$yearlist=getyearlist(); $monthlist=getmonthlist(); $daylist=getdaylist(); $hourlist=gethourlist(); $minutelist=getminutelist(); $secondlist=getsecondlist();
	require("header.php");
print <<< eot
<script language=javascript src="img/module.js"></script> 
		<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
		<tr><td>
		<table cellpadding=5 cellspacing=1 align=center width='100%'>
		<tr bgcolor='#47637E'><td colspan=2><font color="#FFFFFF">$langaed[0]</font> $toggle</a></td></tr><form action=$tf method=post name=laform onsubmit="autocopy();">
		<tr bgcolor='#FFFFFF'><td width=15%>$langaed[68]</td><td><a href="admin_cp.php?job=admindrafts">$langaed[69]</a></td></tr>
		<tr bgcolor='#FFFFFF'><td width=15%>$langaed[5]</td><td><input name=title size=50 value='$draft_title'> </td></tr>
		$editor
		<tr bgcolor='#FFFFFF'><td width=15%>$langaed[6]</td><td><a href="#" onClick="javascript: window.open('admin_cp.php?job=upload', 'UPLOAD', 'width=760,height=250,resizable=0,scrollbars=no');" >$langaed[7]</a> $langaed[8]</td></tr>
		<tr bgcolor='#FFFFFF'><td width=15%>$langaed[63]</td><td><input name=plname size=50 value='$draft_pl'> $langaed[65]<br> $langaed[64]</td></tr>
		<tr bgcolor='#FFFFFF'><td width=15% valign=top>$langaed[9]<br><br>$closeubb<br>$closehtml </td><td><textarea name="icontent" id="icontent" rows=25 cols=100 onkeydown="submitshortcut();">{$justblogit}{$draft_content}</textarea></td></tr>
		<tr bgcolor='#FFFFFF'><td width=15%>$langaed[10]</td><td><textarea cols=95 rows=2 name=tburl>$draft_tb</textarea><br>$langaed[11]</td></tr>
		$emot
		<tr bgcolor='#FFFFFF'><td width=15%>$langaed[12]</td><td>$mycats</td></tr>
		<tr bgcolor='#FFFFFF'><td width=15%>$langaed[13]</td><td><select name="ishidden"><option value="0">$langaed[14]</option><option value="1">$langaed[15]</option><option value="2">$langaed[16]</option><option value="3">$langaed[67]</option></td></tr>
		<tr bgcolor='#FFFFFF'><td width=15%>$langaed[17]</td><td><select name="weathertoday"><option value="" selected>$langaed[18]</option><option value="w_sunny">$langaed[19]</option><option value="w_overcast">$langaed[20]</option><option value="w_cloudy">$langaed[21]</option><option value="w_rainy">$langaed[22]</option><option value="w_night">$langaed[60]</option><option value="w_thunder">$langaed[24]</option><option value="w_snowy">$langaed[23]</option></select></td></tr>
		<tr bgcolor='#FFFFFF'><td width=15%><input type=checkbox name=ifchangedate value=1>$langaed[25]</td><td>$yearlist $langaed[26] - $monthlist $langaed[27] - $daylist $langaed[28] - $hourlist $langaed[29] - $minutelist $langaed[30] - $secondlist $langaed[31] <br>$langaed[32]</td></tr>
		<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input name=isautocopy checked value=1 type=checkbox> $langaed[33]</td></tr>
eot;
print <<< eot
		<input type=hidden name=action value=dowrite><input type=hidden name=ifsavedraft id=ifsavedraft value=0><input type=hidden name=draftfilename value="$draft">
		<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value='$langsubmit' onclick="return copycheck();"> <input type=submit value='$langaed[70]' onclick="return savedraft();">  <input type='reset' value='$langreset'>
		</td></tr></form>
		</table>
		</td></tr>
		</table>
eot;
require ("footer.php");
exit;
}

if ($action=="dowrite") {
	if ($ifsavedraft==1) {
		if (!empty($draftfilename)) $draftname=$draftfilename;
		else $draftname=time();
		if ($closehtmlonce==1) {		$writetodraft="<?die();?>\n".safe_convert($title)."\n".safe_convert($icontent)."\n".safe_convert($plname)."\n".safe_convert($tburl);
		} else {		$writetodraft="<?die();?>\n".safe_convert($title)."\n".minor_safe_convert($icontent)."\n".safe_convert($plname)."\n".safe_convert($tburl);
		}
		writetofile ("drafts/$draftname.php", $writetodraft);
		$draftcontent=msubstr(strip_tags(minor_safe_convert($icontent)),0,50);
		$adddraft="<?die();?>|$draftname|$draftcontent|\n";
		if (empty($draftfilename)) writetofile ("drafts/index.php", $adddraft.@readfromfile("drafts/index.php"));
		else {
			$draftlist=@file("drafts/index.php");
			for ($i=0; $i<count($draftlist); $i++) {
				list($unused, $draft_time, $draft_con)=@explode("|", $draftlist[$i]);
				if ($draft_time==$draftfilename) {
					$draftlist[$i]=$adddraft;
					break;
				}
			}
			writetofile ("drafts/index.php", @implode('', $draftlist));
		}

		$go="mblog_edit.php?action=write&draft=$draftname";
		require("header.php");
		msg_box($langsuccess,"$langaed[71]<br><ul><li><a href=\"$go\">$langaed[72]</a></li><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
		exit;
	}
	if (empty($title) || blogdcqualified($title)==0) {
	$go="<back>";
		require("header.php");
msg_box($langerror,"$langerrorfor<br>$langaed[34]<br>$langerrordanger<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	if (empty($icontent)) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langerrorfor<br>$langaed[35]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	if ($cat=="") {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langerrorfor<br>$langaed[36]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	if ($ifchangedate==1 && !checkdate ($modmonth, $modday, $modyear)) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langerrorfor<br>$langaed[37]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}

	my_set_time_limit(0);
	$title=safe_convert($title);
	$title=stripslashes($title);
	if ($closehtmlonce==1) $icontent=safe_convert($icontent);
	else $icontent=minor_safe_convert($icontent);

	if ($closeubbonce==1) $icontent=filter_ubb($icontent);
	
	if ($ifchangedate!=1) {
	$timestamp=time();
	$aco=date("Ymd_His");
	$bco=date("Ymd");
	}
	else {
	$timestamp=mktime($modhour, $modminute, $modsecond, $modmonth, $modday, $modyear);
	$aco=date("Ymd_His", $timestamp);
	if (file_exists("$dirblog/a_"."$aco.art")) $aco.='_'.time();
	$bco=date("Ymd", $timestamp);
	}

	$aco="a_".$aco;
	$permanantlink=trim($plname);
	if (!empty($permanantlink)) {
		$plresult=buildpl($permanantlink, $aco);
		if ($plresult==0) {
			$go="<back>";
			require("header.php");
			msg_box($langerror,"$langerrorfor<br>$langaed[66]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
			exit;
		}
	}

	$allrec=@readfromfile("$dirblog/calrec.txt");
	if (@!ereg($bco, $allrec)) $allrec.=".$bco";
	writetofile("$dirblog/calrec.txt",$allrec);
	updateartnum(1);
	$newest="<?die();?".">|$aco|$title|$timestamp|$cat|0|$weathertoday|0|0|$ishidden|$permanantlink|$nowuserid|\n";  //2004-6-2增加数据段ishidden, 2004-12-20增加数据段permanantlink, 2005-5-14增加数据段author
	$newestappend="<θθθ>0|";  
	writetofile("$dirblog/$aco.art",$icontent.$newestappend); //2004-6-7开始文章内记录计数器
	if ($ifchangedate!=1) {
		$tmp11=$newest.@readfromfile("$dirblog/list.php");
		$tmp12=$newest.@readfromfile("$dirblog/$cat.php");
	}
	else {
		unset($all);
		$all=@file("$dirblog/list.php");
		$howmany1=count($all);
		$all[$howmany1]=$newest;

		arsort  ($all);
		$tmp11=implode("",$all);	

		unset($all);
		$all=@file("$dirblog/$cat.php");
		$howmany1=count($all);
		$all[$howmany1]=$newest;

		arsort  ($all);
		$tmp12=implode("",$all);	
	}	

	writetofile("$dirblog/list.php",$tmp11);
	writetofile("$dirblog/$cat.php",$tmp12);

	updatenewestart(2);

	my_set_time_limit(30);

	if (empty($tburl)) {
	$go="index.php?job=art&articleid=$aco";
	require("header.php");
	msg_box($langsuccess,"$langaed[38]<br><ul><li><a href= index.php?job=art&articleid=$aco>$langaed[39]</a></li></ul><br><ul><li><a href= index.php>$langbacktoindex</a></li></ul>");
	require("footer.php");
	exit;
	} else {
	$excerpt=msubstr(strip_tags($icontent), 0, 120)."..";
	require("header.php");
	$tburls=@explode(";", $tburl);
	for ($i=0; $i<count($tburls); $i++) {
		$montb=$i+1;
		$tball.="<form name='frmv{$i}' method=post action='$tburls[$i]' target='_blank'><input name='url' type=hidden value='$weburl/index.php?job=art&articleid=$aco'><input name='blog_name' type=hidden value='$blogname'><input name='title' type=hidden value='$title'><input name='excerpt' type=hidden value='$excerpt'>Trackback {$montb} : $tburls[$i] <input type=submit value='$langsubmit'></form>";
	}
	msg_box($langaed[40],"$langaed[41]<br>$tball<br><ul><li><a href= index.php?job=art&articleid=$aco>$langaed[43]</a></li></ul><br><ul><li><a href= index.php>$langaed[44]</a></li></ul>");
	require("footer.php");
	exit;
	}
}





if ($action=="edit") {
	if (empty($articleid)) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langaed[45]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	unset ($all);
	$isfound=0;
	$all=@file("$dirblog/list.php");
	for ($i=0; $i<count($all);$i++) {
	$latest=explode("|",$all[$i]);
	$id=$latest[1];
	if ($id==$articleid) {
	$article=getarticleforedit("$dirblog/$articleid.art");
	$articletitle=stripslashes($latest[2]);
	$isfound=1;
	$plname=trim($latest[10]);
	$blogauthor=trim($latest[11]);
	break;
	}
	}
	if ($isfound<>1) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langaed[45]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
if ($nowuserid!=$username && $nowuserid!=$blogauthor) {
	require("header.php");
	msg_box($langerror,"$langaed[73]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
}
if (($htmlmode==1 && $closew!=1)|| $openw==1)	{
$emot="<tr bgcolor='#FFFFFF'><td width=15%>$langaed[1]</td><td>{$writeremots2}".readfromfile("include/emotions2.php")."</td></tr>";
$openw=1;
$toggle='<a href="mblog_edit.php?articleid='.$articleid.'&closew=1"><font color="#FFFFFF">['.$langaed[2].']</font></a>';
$closeubb="<input type='checkbox' name='closeubbonce' value='1'>$langaed[61]";
}
else {
$editor="<tr bgcolor='#FFFFFF'><td width=15%>$langaed[3]</td><td>".readfromfile("include/editor.php")." </td></tr>";
$emot="<tr bgcolor='#FFFFFF'><td width=15%>$langaed[1]</td><td>{$writeremots1}".readfromfile("include/emotions.php")."</td></tr>";
$openw=0;
$toggle='<a href="mblog_edit.php?articleid='.$articleid.'&openw=1"><font color="#FFFFFF">['.$langaed[4].']</font></a>';
$closeubb="<input type='checkbox' name='closeubbonce' value='1'>$langaed[61]";
$closehtml="<input type='checkbox' name='closehtmlonce' value='1' checked>$langaed[62]";
}
$mycats=getcats("edit");
$yearlist=getyearlist(); $monthlist=getmonthlist(); $daylist=getdaylist(); $hourlist=gethourlist(); $minutelist=getminutelist(); $secondlist=getsecondlist();
require("header.php");

	print <<< eot
<script language=javascript src="img/module.js"></script> 
		<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
		<tr><td>
		<table cellpadding=5 cellspacing=1 align=center width='100%'>
		<tr bgcolor=#47637E><td colspan=2><font color="#FFFFFF">$langaed[46]</font>  $toggle</td></tr><form action=$tf method=post name=laform onsubmit="autocopy();">
		<tr bgcolor='#FFFFFF'><td colspan=2></td></tr>
		<tr bgcolor='#FFFFFF'><td width=15%>$langaed[5]</td><td><input name=title  size=50 value="$articletitle"></td></tr>
		$editor
		<tr bgcolor='#FFFFFF'><td width=15%>$langaed[6]</td><td><a href="#" onClick="javascript: window.open('admin_cp.php?job=upload', 'UPLOAD', 'width=760,height=250,resizable=0,scrollbars=no');" >$langaed[7]</a> $langaed[8]</td></tr>
		<tr bgcolor='#FFFFFF'><td width=15%>$langaed[63]</td><td><input name=plname value='$plname' size=50> $langaed[65]<br> $langaed[64]</td></tr>
		<tr bgcolor='#FFFFFF'><td width=15% valign=top>$langaed[9]<br><br>$closeubb<br>$closehtml </td><td><textarea  name="icontent"   id="icontent" rows=25 cols=100  onkeydown="submitshc();">$article</textarea></td></tr>
		$emot
		<tr bgcolor='#FFFFFF'><td width=15%>$langaed[12]</td><td>$mycats</td></tr>
		<tr bgcolor='#FFFFFF'><td width=15%>$langaed[13]</td><td><select name="ishidden"><option value="unchange">$langaed[47]</option><option value="0">$langaed[14]</option><option value="1">$langaed[15]</option><option value="2">$langaed[16]</option><option value="3">$langaed[67]</option></td></tr>
		<tr bgcolor='#FFFFFF'><td width=15%>$langaed[48]</td><td><select name="weathertoday"><option value="unchange" selected>$langaed[59]</option><option value="">$langaed[18]</option><option value="w_sunny">$langaed[19]</option><option value="w_overcast">$langaed[20]</option><option value="w_cloudy">$langaed[21]</option><option value="w_rainy">$langaed[22]</option><option value="w_night">$langaed[60]</option><option value="w_snowy">$langaed[23]</option><option value="w_thunder">$langaed[24]</option></select></td></tr>
		<tr bgcolor='#FFFFFF'><td width=15%><input type=checkbox name=ifchangedate value=1>$langaed[25]</td><td>$yearlist $langaed[26] - $monthlist $langaed[27] - $daylist $langaed[28] - $hourlist $langaed[29] - $minutelist $langaed[30] - $secondlist $langaed[31] <br>$langaed[49]</td></tr>
		<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input name=isautocopy checked value=1 type=checkbox> $langaed[33]</td></tr>

eot;
print <<< eot
		<input type=hidden name=action value=doedit><input type=hidden name=articleid value=$articleid>
		<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value='$langsubmit'>  <input type='reset' value='$langreset'>
		</td></tr></form>
		</table>
		</td></tr>
		</table>
eot;
require ("footer.php");
exit;

}


if ($action=="doedit") {
	if (empty($articleid)) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langaed[45]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	unset ($all);
	$isfound=0;
	$all=@file("$dirblog/list.php");
	for ($i=0; $i<count($all);$i++) {
	$latest=explode("|",$all[$i]);
	$id=$latest[1];
	if ($id==$articleid) {
	if (file_exists("blog/sticky.php")) require("blog/sticky.php");	@list($unused,$articleid,$title2,$articletime,$cat,$articlereplys,$weathertoday2,$aricleview,$tracknum,$ishidden2)=$latest;
	$plnameold=trim($latest[10]);
	$blogauthor=trim($latest[11]);
	if (empty($blogauthor)) $blogauthor=$nowuserid;
	$isfound=1;
	$curr=$i; //找到这篇文章在列表中的序数
	if ($sticky==$all[$i]) $needchangeinsticky=1;
	break;
	}
	}
	if ($isfound<>1) {
	require("header.php");
	$go="<back>";
	msg_box($langerror,"$langaed[45]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	if ($nowuserid!=$username && $nowuserid!=$blogauthor) {
		require("header.php");
		msg_box($langerror,"$langaed[73]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
		exit;
	}
	if (empty($title) || blogdcqualified($title)==0) {
	$go="<back>";
	require("header.php");	msg_box($langerror,"$langerrorfor<br>$langaed[34]<br>$langerrordanger<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	if (empty($icontent)) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langerrorfor<br>$langaed[35]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	if ($ifchangedate==1 && !checkdate ($modmonth, $modday, $modyear)) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langerrorfor<br>$langaed[37]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}

	$title=safe_convert(stripslashes($title));
	if ($closehtmlonce==1) $icontent=safe_convert($icontent);
	else $icontent=minor_safe_convert($icontent);

	$plname=trim($plname);
	if ($plname!=$plnameold) {
		if (!empty($plname)) {
			$plresult=buildpl($plname, $articleid);
			if ($plresult==0) {
				$go="<back>";
				require("header.php");
				msg_box($langerror,"$langerrorfor<br>$langaed[66]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
				exit;
			}
		}
		if (!empty($plnameold)) {
			@unlink ("p/{$plnameold}.php");
		}
	}

	if ($closeubbonce==1) $icontent=filter_ubb($icontent);
	else $icontent=filter_ubb_back($icontent);
	if (!ereg("w_", $weathertoday2)) $weathertoday2=""; //过滤旧版数据的换行
	if ($weathertoday=="unchange") $weathertoday=$weathertoday2;
	if ($ishidden=="unchange") $ishidden=$ishidden2; //04-06-02 增加的数据

	if ($catnew!="unchange") {//需要改分类
	$newest="<?die();?".">|$articleid|$title|$articletime|$catnew|$articlereplys|$weathertoday|$aricleview|$tracknum|$ishidden|$plname|$blogauthor|\n";
	} else {
	$newest="<?die();?".">|$articleid|$title|$articletime|$cat|$articlereplys|$weathertoday|$aricleview|$tracknum|$ishidden|$plname|$blogauthor|\n";
	} 
	$newestappend=getarticleforappend ("$dirblog/$articleid.art");
	writetofile("$dirblog/$articleid.art",$icontent."<θθθ>".$newestappend["append"]); //加上计数器

	$all[$curr]=$newest;
	$all1=implode("",$all);	
	writetofile("$dirblog/list.php",$all1);
	if ($curr<=$howmanynewart || $needchangeinsticky==1) updatenewestart(2); //仅当文章靠前或为置顶时才更新新记录的缓存
	if ($needchangeinsticky==1) writetofile("blog/sticky.php", "<?\n\$sticky=\"$newest\";\n\$announce=\"$announce\";");

	unset($all);
	$all=@file("$dirblog/$cat.php");
	for ($i=0; $i<count($all);$i++) {
	$latest=explode("|",$all[$i]);
	$id=$latest[1];
	if ($id==$articleid) {
	$curr=$i;
	break;
	}
	}
	if ($catnew!="unchange") {$all[$curr]="";}
	else $all[$curr]=$newest;
	$all1=implode("",$all);	
	writetofile("$dirblog/$cat.php",$all1);
	unset ($all);

	if ($catnew!="unchange") {//需要改分类
	unset($all);
	$all=@file("$dirblog/$catnew.php");
	$howmany1=count($all);
	$all[$howmany1]=$newest;

	
	arsort ($all);
	$all11=implode("",$all);	
	writetofile("$dirblog/$catnew.php",$all11);
	}

	if ($ifchangedate==1) { //更改时间
	$timestamp=mktime($modhour, $modminute, $modsecond, $modmonth, $modday, $modyear);
	$aco=date("Ymd_His", $timestamp);
	if (file_exists("$dirblog/a_"."$aco.art")) $aco.='_'.time();
	$bco=date("Ymd", $timestamp);
	$allrec=@readfromfile("$dirblog/calrec.txt");
	if (@!ereg($bco, $allrec)) $allrec.=".$bco";
	writetofile("$dirblog/calrec.txt",$allrec);
	@unlink("$dirblog/cache_calendar.php");
	$aco="a_".$aco;
	updateartnum(1);
	$newest="<?die();?".">|$aco|$title|$timestamp|$cat|$articlereplys|$weathertoday|0|$tracknum|$ishidden|$plname|$blogauthor|\n"; 
	
	@copy ("$dirblog/$articleid.art","$dirblog/$aco.art"); 
	if (file_exists("$dirblog/$articleid.rep")) @copy ("$dirblog/$articleid.rep","$dirblog/$aco.rep"); 
	if (file_exists("$dirblog/$articleid.rpl")) @copy ("$dirblog/$articleid.rpl","$dirblog/$aco.rpl"); 
	
	@unlink ("p/{$plname}.php");
	$plresult=buildpl($plname, $aco);	

	unset($all);
	$all=@file("$dirblog/list.php");
	$howmany1=count($all);
	$all[$howmany1]=$newest;

	arsort  ($all);
	$tmp11=implode("",$all);	

	unset($all);
	$all=@file("$dirblog/$cat.php");
	$howmany1=count($all);
	$all[$howmany1]=$newest;

	arsort  ($all);
	$tmp12=implode("",$all);	

	writetofile("$dirblog/list.php",$tmp11);
	writetofile("$dirblog/$cat.php",$tmp12);
	updateartnum(1);
	updaterenum($articlereplys);

	unset($all);
	$all=@readfromfile("$dirblog/replies.php");
	$allreplies=str_replace("<?die();?>|$articleid|", "<?die();?>|$aco|", $all);
	writetofile("$dirblog/replies.php",$allreplies);	
	updatenewestrep();

	@copy ("$dirtb/$articleid.tb","$dirtb/$aco.tb"); 
	
	$go="$tf?action=dodel&articleid=$articleid&perform=1";
	require("header.php");
	msg_box($langsuccess,"$langaed[50]<br><ul><li><a href='$tf?action=dodel&articleid=$articleid&perform=1'>$langaed[51]</a></li></ul>");
	require("footer.php");
	exit;
	}

	$go="index.php?job=art&articleid=$articleid";
	require("header.php");
	msg_box($langsuccess,"$langaed[52]<br><ul><li><a href= index.php?job=art&articleid=$articleid>$langaed[53]</a></li></ul><br><ul><li><a href= index.php>$langbacktoindex</a></li></ul>");
	require("footer.php");
	exit;
}


if ($action=="del") {
	if (empty($articleid)) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langaed[45]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	unset ($all);
	$isfound=0;
	$all=@file("$dirblog/list.php");
	for ($i=0; $i<count($all);$i++) {
	$latest=explode("|",$all[$i]);
	$id=$latest[1];
	if ($id==$articleid) {
	$articletitle=$latest[2];
	$blogauthor=trim($latest[11]);
	$isfound=1;
	break;
	}
	}
	if ($isfound<>1) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langaed[45]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	if ($nowuserid!=$username && $nowuserid!=$blogauthor) {
		require("header.php");
		msg_box($langerror,"$langaed[73]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
		exit;
	}
	require("header.php");
	msg_box($langconfirm,"$langaed[54] $articletitle {$langaed[55]} <br><ul><li><a href=$tf?action=dodel&articleid=$articleid>$langsure</a></li></ul><br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
}



if ($action=="dodel") {
	if (empty($articleid)) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langaed[45]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	unset ($all);
	$isfound=0;
	$all=@file("$dirblog/list.php");
	for ($i=0; $i<count($all);$i++) {
	$latest=explode("|",$all[$i]);
	$id=$latest[1];
	if ($id==$articleid) {
	if (file_exists("blog/sticky.php")) require("blog/sticky.php");
	if ($sticky==$all[$i]) {writetofile("blog/sticky.php", "<?\n\$sticky=\"\";\n\$announce=\"$announce\";");
	$needchangeinsticky=1;}

	$isfound=1;
	$plname=trim($latest[10]);
	$blogauthor=trim($latest[11]);
	$trenum=$latest[5];
	$cat=$latest[4];
	$curr=$i;
	break;
	}
	}
	if ($isfound<>1) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langaed[45]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	if ($nowuserid!=$username && $nowuserid!=$blogauthor) {
		require("header.php");
		msg_box($langerror,"$langaed[73]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
		exit;
	}
	$all[$curr]="";
	if ($curr!=0) $prerec=$all[$curr-1];
	$nextrec=$all[$curr+1];
	$tomatch=substr($articleid, 2,8);
	if (@!ereg($tomatch, $prerec) && @!ereg($tomatch, $nextrec)) {
		$calrec=@readfromfile("$dirblog/calrec.txt");
		$calrec=ereg_replace(".".$tomatch, "", $calrec);
		writetofile("$dirblog/calrec.txt", $calrec);
		@unlink("$dirblog/cache_calendar.php");
	}
	$all1=implode("",$all);	
	writetofile("$dirblog/list.php",$all1);	
	updateartnum(-1);
	if ($curr<=$howmanynewart || $needchangeinsticky==1) updatenewestart(2); //仅当文章靠前或为置顶时才更新新记录的缓存
	@unlink ("$dirblog/$articleid.art");
	if (file_exists("$dirblog/$articleid.rep")) {
		unset ($tmp);
		if (file_exists("$dirblog/$articleid.rpl")) unlink ("$dirblog/$articleid.rpl");
		updaterenum(-$trenum);
		unlink ("$dirblog/$articleid.rep");
		unset ($all);
		if ($perform!=1) {
			$all=@file("$dirblog/replies.php");
			for ($i=0; $i<count($all);$i++) {
				$latest=explode("|",$all[$i]);
				$id=$latest[1];
				if ($id==$articleid) {
					$all[$i]="";
					$replyfound=1;
				}
			}
			if ($replyfound==1) {
				$allreplies=implode("",$all);
				writetofile("$dirblog/replies.php",$allreplies);	
				updatenewestrep();
			}
		}
	}
	unset ($all);
	$all=@file("$dirblog/$cat.php");
	for ($i=0; $i<count($all);$i++) {
	$latest=explode("|",$all[$i]);
	$id=$latest[1];
	if ($id==$articleid) {
	$curr=$i;
	break;
	}
	}
	$all[$curr]="";
	$all1=implode("",$all);	
	writetofile("$dirblog/$cat.php",$all1);	

	if (file_exists("p/{$plname}.php") && $perform!=1) @unlink ("p/{$plname}.php");

if ($perform==1) {
	$go="index.php";
	require("header.php");
	msg_box($langsuccess,"$langaed[56]<br><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
	require("footer.php");
	exit;
}
	$go="index.php";
	require("header.php");
	msg_box($langsuccess,"$langaed[57]<br><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
	require("footer.php");
	exit;
}


if ($action=="deltb") {
	if (empty($articleid)) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langaed[45]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	unset ($all);
	$isfound=0;
	$all=@file("$dirblog/list.php");
	for ($i=0; $i<count($all);$i++) {
	$latest=explode("|",$all[$i]);
	$id=$latest[1];
	if ($id==$articleid) {
	if (file_exists("blog/sticky.php")) require("blog/sticky.php");
	if ($sticky==$all[$i]) $needchangeinsticky=1;
	$isfound=1;
	$tracknum=$latest[8];
	$latest[8]-=1;
	$curr=$i;
	$all[$curr]=implode("|", $latest);

	if ($needchangeinsticky==1) writetofile("blog/sticky.php", "<?\n\$sticky=\"".$all[$curr]."\";\n\$announce=\"$announce\";");
	break;
	}
	}
	if ($isfound<>1) {
	require("header.php");
	$go="<back>";
	msg_box($langerror,"$langaed[45]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	$dirtb="tblog";
	if ($tracknum!=0 && file_exists("$dirtb/$articleid.tb")) {
	unset ($tmp);
	$tmp=@file("$dirtb/$articleid.tb");
	$tbtmp=@explode("|", $tmp[$tbbid]);
	$tmp[$tbbid]="";
	}

	$all1=@implode("",$all);
	writetofile("$dirblog/list.php",$all1);	
	updatenewestart ();

	$all2=@implode("",$tmp);
	if ($all2=="") @unlink("$dirtb/$articleid.tb");
	else writetofile("$dirtb/$articleid.tb",$all2);	

	$alltbstmp=@yafile("$dirtb/tblist.php");
	for ($i=0; $i<count($alltbstmp); $i++) {
		if (strpos($alltbstmp[$i], $articleid) && strpos($alltbstmp[$i], $tbtmp[4])) {
			$alltbstmp[$i]="";
			break;
		}
	}
	$alltbstmps=@implode('', $alltbstmp);
	writetofile("$dirtb/tblist.php", $alltbstmps);
	updatenewesttb();

	$go="index.php";
	require("header.php");
	msg_box($langsuccess,"$langaed[58]<br><ul><li><a href= index.php>$langbacktoindex</a></li></ul>");
	require("footer.php");
	exit;
}

?>