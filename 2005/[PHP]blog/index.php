<?
// Bo-Blog
// A Blog System based on PHP and text database
// Author: Bob Shen
// Official Site: http://www.bo-blog.com
// Email: bobshen@gmail.com
// All Rights Reserved.
// 版权所有，任何修改版权后使用传播之行为皆不允许

$begintime = getmicrotime();
$tf="index.php";
@header("Content-Type: text/html; charset=utf-8");

require("global.php");
include_once("include/template.php"); 
require_once("include/class.php");

//开关状态检查
if (isset($offtime)) {
	$offtimedetail=@explode('-', $offtime);
	$nowhour=date('G', mktimezone($timestamp));
}
if ($closeblognow==1 || $offtimedetail[$nowhour]==1)  {
	require ('header.php');
	msg_box($langerror,"<br/><br/><center>$langshutdown</center><br/><br/>");
	exit;
}
//开关状态检查结束

if ($usegzip==1) ob_start("ob_gzhandler"); 


if (empty($job)) $job="listall";
if ($job=="main") $job="listall";
if (!empty($tem)) {
	setcookie ("boblogtem", basename($tem));
}
else {
$tem=basename($_COOKIE['boblogtem']);
if (empty ($tem)) $tem=$blogtem;
}
if (!is_dir("blog/template/$tem") || !file_exists("blog/template/$tem/colorsheme.txt")) {
$tem='clean'; 
}

include ("blog/template/$tem/colorsheme.txt");
include ("include/parts.php");
if (file_exists("blog/template/$tem/parts.php")) include ("blog/template/$tem/parts.php");

$xml="<a href=\"rss.php\"><img border=\"0\" src=\"{$location['rss']}/rss100.png\" title=\"Get RSS Feed (Version 1.0)\" alt=\"Get RSS Feed (Version 1.0)\"/></a>";
$xml2="<a href=\"rss2.php\"><img border=\"0\" src=\"{$location['rss']}/rss2.png\" title=\"Get RSS Feed (Version 2.0)\" alt=\"Get RSS Feed (Version 2.0)\"/></a>";
$xml3="<a href=\"atomfeed.php\"><img border=\"0\" src=\"{$location['rss']}/atom03.png\" title=\"Get Atom Feed (Version 0.3)\" alt=\"Get Atom Feed (Version 0.3)\"/></a>";
$encodeinfo="<img border=\"0\" src=\"{$location['rss']}/utf-8.gif\" title=\"{$langfront[0]} UTF-8\" alt=\"{$langfront[0]} UTF-8\"/>";

list  ($visit, $articlenum, $reply_single, $todayvisit, $regusers) = countvisit(1);

if (!$page || !is_numeric($page)) $page=1;

$owner=$username;
if ($login_status==1) $isowner=1;
if ($isowner==1) {
	$newurl=" $columnstring <a href=\"mblog_edit.php?action=write\">$langfront[1]</a>";
	$adminurl="<a href=\"admin.php\">$langfront[2]</a>";
	} else {
	$newurl="";
	$adminurl="<a href=\"login.php\">$langfront[2]</a>";
	$remall=$_COOKIE['remembered'];
	if (!empty($remembered)) {
		$remstatusshow="checked=\"checked\"";
		list($remname,$rememail)=@explode(">",$remall);
		$remname=trim($remname);
		$rememail=trim($rememail);
	}
}

if ($guest_login==1) $newurl.=" $columnstring <a href=\"login.php?action=logout\">$langfront[3]</a>  $columnstring <a href=\"index.php?job=register&amp;modify=1\">$langfront[4]</a> ";
elseif ($login_status==1) {
	if ($nowuserid!=$username) $newurl.=" $columnstring <a href=\"index.php?job=register&amp;modify=1\">$langfront[4]</a> ";
	$newurl.=" $columnstring <a href=\"login.php?action=logout\">$langfront[3]</a>";
}
else {
	$newurl.=" $columnstring <a href=\"login.php\">$langfront[5]</a>";
	if ($allowreg==1) $newurl.=" $columnstring <a href=\"index.php?job=register\">$langfront[6]</a>";
}
$listall="\index.php?job=listall";

//Now getting the LATEST ENTRIES 
unset($tmp);
$tmp=@file("$dirblog/latest.php");
$nona=count($tmp);
for ($i=0; $i<$nona;$i++) {
	$latest=explode("|",$tmp[$i]);
	$articleidd=$latest[1];
	$articleviews=$latest[4];
	$articlereplys=$latest[5];
	$latest[2]=stripslashes($latest[2]);
	if (strlen($latest[2])>$artwordy) $articlename=msubstr($latest[2],0,$artwordy);  //截取字符处
	else $articlename=$latest[2];
	if ($articlename!=$latest[2]) $articlename.='...';
	if ($fulltimemode==1) $showtime=" (".date("Y-n-j",($latest[3]+$timezone*3600)).")";
	$permanantlink=trim($latest[10]); //伪静态地址
	if (!empty($permanantlink)) $allnew.="{$parts['listpic']} <a href=\"p/{$permanantlink}.php\" title=\"$latest[2]\">$articlename</a>$showtime<br/>";
	else $allnew.="{$parts['listpic']} <a href=\"$tf?job=art&amp;articleid=$articleidd\" title=\"$latest[2]\">$articlename</a>$showtime<br/>";
}


//Now getting the LATEST REPLIES
if (file_exists("$dirblog/latestreplies.php")) {
$tmp2=@file("$dirblog/latestreplies.php");
$nonab=count($tmp2);
//if ($nonab>=10) $nonab=10;
for ($i=0; $i<$nonab;$i++) {
	$latest=explode("|",$tmp2[$i]);
	if ($fulltimemode==1) $latest[3]=" (".date("Y-n-j",($latest[3]+$timezone*3600)).")";
	else $latest[3]="";
	$latest[4]=stripslashes($latest[4]);
	$latest[2]=stripslashes($latest[2]);
	$latest[3]=stripslashes($latest[3]);
	$latest[5]=trim(msubstr($latest[4],0,$repwordy)); //截取字符处
	if (strlen($latest[5])==0) $latest[5]=$langnocontent;
	elseif ($latest[5]!=$latest[4]) $latest[5].='...';
	$reoutput.="{$parts['listpic']} <a href=\"$tf?job=art&amp;articleid=$latest[1]#comment\" title=\"Re: $latest[2]\n$latest[4]...\">$latest[5]</a>$latest[3]<br/>";
}
$reoutput.="<br/>";
}


$navall=@file("$dirblog/cat.php");
$catnav="<a href=\"index.php\">$langfront[8]</a>";
$navbar=$catnav;

for ($i=0;$i<count($navall); $i++) {
$navtmp=explode("|",$navall[$i]);
$navt2=$navtmp[1];
$categories[$navt2]=$navtmp[2];//获取分类数组
$categorydes[$navt2]=$navtmp[3];//获取分类描述

$catdestmp=trim(strip_tags($navtmp[3]));
if (empty($catsequence)) {
	$catnav.=" $columnstring <a href=\"index.php?job=showcat&amp;cat=$navt2\" title=\"{$catdestmp}\">$navtmp[2]</a>";
	$catbar.=" {$parts['catbarstring1']} <a href=\"index.php?job=showcat&amp;cat=$navt2\" title=\"{$catdestmp}\">$navtmp[2]</a> {$parts['catbarstring']} ";
}
}

if (!empty($catsequence)) {
	$betucat=@explode("-",$catsequence);
	for ($i=0; $i<count($betucat); $i++) {
		$catdestmp=trim(strip_tags ($categorydes[$betucat[$i]]));
		$catnav.=" $columnstring <a href=\"index.php?job=showcat&amp;cat=$betucat[$i]\" title=\"{$catdestmp}\">".$categories[$betucat[$i]]."</a>";
		$catbar.=" {$parts['catbarstring1']} <a href=\"index.php?job=showcat&amp;cat=$betucat[$i]\" title=\"{$catdestmp}\">".$categories[$betucat[$i]]."</a> {$parts['catbarstring2']} ";
	}
} 


if (!empty($extracate)) {
	$catnav.=str_replace("|", $columnstring, $extracate); //载入转向分类链接
	$navbar.=str_replace("|", $columnstring, $extracate);
}
if (!empty($pluginbar)) {
	$catnav.=str_replace("|", $columnstring, $pluginbar); //自动载入插件链接
	$navbar.=str_replace("|", $columnstring, $pluginbar); //自动载入插件链接
}

if ($opengallery==1) {
$catnav.=" $columnstring <a href=\"index.php?job=gallery\">$langfront[9]</a>"; //相册
}

if ($login_status==1 || $allowvisitorreply==1) {
$catnav.=" $columnstring <a href=\"index.php?job=guestbook\">$langfront[10]</a>"; //留言本
}


$catnav.= $newurl;

//开始公告
if (file_exists("blog/sticky.php")) require("blog/sticky.php");
if ($showannounce==1 && !empty($announce)) {
	$fileannounce=@readfromfile("blog/template/$tem/announcement.htm");
	$announce=decode($announce,"full");
	if ($login_status==1) $announce.="<br/>[<a href=\"admin.php?start=announce\">{$langquickadmin[0]}</a>]";
	$announcebar=str_replace("{announce}", $announce, $fileannounce);
} else $announcebar="";
//结束公告


//TEMPLATE CLASS 模板类引入
include_once("include/template.php"); 
$t = new template("."); 

//模块载入部分
$job=basename($job); //2005-6-14　Urgent Security Fix
$alljobs=array ("listall","showcat","art","seereply","guestbook","showsearch","showday","seetb","listlinks", "register", "userlist", "gallery", "archive", "statistics"); 
if (!file_exists("include/$job.php")) {
	if (file_exists("plugin/$job/$job.php")) include ("plugin/$job/$job.php"); //是一个插件
	else include ("include/listall.php"); //过滤非法请求
} elseif (in_array($job, $alljobs)) include ("include/$job.php"); //引入请求所对应的文件
else include ("include/listall.php"); 



/////输出主体
if (!isset($thiswindowmode)) $thiswindowmode=1;
if (empty ($myframe)) $myframe="1-1-0-0-1-1-1-0-0-1-1-0-1-1";
$allframes=explode("-", $myframe);
$windowmode=array_search ($job, $alljobs);
if ($windowmode) $currentwindowmode=$allframes[$windowmode];
else $currentwindowmode=$thiswindowmode;

if ($currentwindowmode==1) { //完整模式
$clfile="$dirblog/calrec.txt";
include ("include/getcalendar.php");
$t -> set_file("index", "blog/template/$tem/index.htm"); 
unset($tmp);
if (file_exists("$dirblog/links.php")) {
	if (!empty($maxlinks)) {
	$tmp=file("$dirblog/links.php");
	shuffle($tmp);
	$minlinks=min(($maxlinks-1),count($tmp));
	$viewalllinks="<a href=\"index.php?job=listlinks\" title=\"$langfront[11]\">$langfront[12]</a>";
	for ($i=0; $i<$minlinks; $i++) {
		$tk=explode("|",$tmp[$i]);
		$tk[1]=stripslashes($tk[1]);
		if ($tk[3]!="pic") $textlinks.="<a href=\"$tk[2]\" target=\"_blank\">$tk[1]</a><br/>";
		else $piclinks.="<a href=\"$tk[2]\" target=\"_blank\"><img src=\"$tk[4]\" border=\"0\" alt=\"$tk[1]\" title=\"$tk[1]\"></a><br/>";
	}
$links=$textlinks.$piclinks;
} 
else {
	if ($rolllinks==1) {
		$links="<script type=\"text/javascript\" src=\"blog/rolllinks.js\"></script>";
		$viewalllinks="<a href=\"index.php?job=listlinks\" title=\"$langfront[11]\">$langfront[12]</a>";
	}
	else $links=@readfromfile($dirblog.'/linkcache.php');
}
if ($login_status==1) $adminlinktmp="<a href=\"admin.php?start=change:and:action:equals:modlink\" target=\"_blank\">$langquickadmin[1]</a>";
$links.="<div align=\"right\"><br/><a href=\"profile.php?job=link\" target=\"_blank\">$langfront[13]</a> $viewalllinks $adminlinktmp</div>";	
}

$icon=getusericon();
$icon="<a href=\"profile.php\" target=\"_blank\"><img src=\"img/icons/$icon\" border=\"0\" title=\"$langfront[14]\" alt=\"$langfront[14]\"/></a>";
$regusers="$langfront[15] $regusers <a href=\"index.php?job=userlist\">[{$langfront[16]}]</a>";

$currentonline="$langfront[17] {$total_online}";

$stat="<a href=\"index.php?job=statistics\">[{$langfront[18]}]</a>";

//归档部分开始
if (!empty($archivenum)) {
$basemonth=date('n');
$baseyear=date('Y');
for ($i=0; $i<$archivenum; $i++) {
	if ($basemonth==0) {
		$basemonth=12;
		$baseyear=$baseyear-1;
	} 
	$archiveshow[]="<a href=\"index.php?job=archive&amp;arm={$basemonth}&amp;ary={$baseyear}\">{$parts['listpic']} {$langmonthname[$basemonth]} $baseyear</a>";
	$basemonth-=1;
}
$archives=implode("<br/>", $archiveshow);
}

//最新引用开始
if (file_exists("tblog/latesttb.php")) {
$tmp3=@file("tblog/latesttb.php");
for ($i=0; $i<count($tmp3);$i++) {
	$latesttb=explode("|",$tmp3[$i]);
	$latesttb[2]=preg_replace("/\[(.+?)\]/is", "", stripslashes(strip_tags($latesttb[2])));
	$latesttb[2]=preg_replace("/&(.+?);/is", "", $latesttb[2]);
	$latesttb[2]=msubstr(trim($latesttb[2]),0,$repwordy).'...'; //截取字符处
	$tbshow.="{$parts['listpic']} <a href=\"index.php?job=seetb&amp;articleid=$latesttb[1]\">$latesttb[2]</a><br/>";
}
$tbshow.="<br/>";
}

}
else { //简洁模式
$t -> set_file("index", "blog/template/$tem/view.htm"); 
}
$t -> set_var(array("logofile"=>$logofile,"owner"=>$owner,"visitor"=>$visit,"articlenum"=>$articlenum, "reply"=>$reply_single, "calendar"=>$calendar,  "blogname"=>$blogname,"blogdc"=>$blogdc,  "userid"=>$userid, "allnew"=>$allnew,"links"=>$links,"seeurl"=>$seeurl, "adminurl"=>$adminurl,"listall"=>$listall, "addlink"=>$addlink, "xml"=>$xml,"xml2"=>$xml2,"xml3"=>$xml3,"visitorcounter"=>$visit,"icon"=>$icon, "catnav"=>$catnav, "newreply" =>$reoutput, "tbshow"=>$tbshow, "versioninfo"=>$versioninfo,"currentonline"=>$currentonline,"encodeinfo"=>$encodeinfo,"todayvisit"=>$todayvisit,"regusers"=>$regusers, "announcebar"=>$announcebar, "archives"=>$archives, "stat"=>$stat, "langindex0"=>$langindex[0],"langindex1"=>$langindex[1],"langindex2"=>$langindex[2],"langindex3"=>$langindex[3],"langindex4"=>$langindex[4],"langindex5"=>$langindex[5],"langindex6"=>$langindex[6],"langindex7"=>$langindex[7],"langindex8"=>$langindex[8],"langindex9"=>$langindex[9],"langindex10"=>$langindex[10],"langindex11"=>$langindex[11],"langindex12"=>$langindex[12],"langindex13"=>$langindex[13], "langindex14"=>$langindex[14], "langindex15"=>$langindex[15], "langindex16"=>$langindex[16], "weburl"=>$weburl."/", "catbar"=>$catbar, "navbar"=>$navbar,));

$t->parse("output", "index");
$t->p("output");
if ($showprocesstime==1) {
	$endtime =  getmicrotime();
	$usedtime=$endtime - $begintime;
	$spendtime= substr($usedtime, 0, 9);
	$spendtime='processed in '.$spendtime.'s';
	if ($usegzip==1) $gzipss=", Gzip enabled";
	echo "<div align=\"center\">{$readfilenum} reads, {$writefilenum} writes,  {$spendtime}{$gzipss}</div></body></html>";
}
else echo "</body></html>";

function wronginfo($info) {  //错误提示
	global $tem,$adminbox;
	$t = new template("."); 
	$t -> set_file("error", "blog/template/$tem/error.htm");
	$t->set_var(array("info"=>$info, "adminbox"=>$adminbox,));
	@header("Content-Type: text/html; charset=utf-8");
	$t->pparse("out","error");
	exit;
}

function getmicrotime() { //From PHP Manual
    list($usec, $sec) = explode(" ",microtime()); 
    return ((float)$usec + (float)$sec); 
} 

if ($usegzip==1) ob_end_flush();

?>