<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$blogadminlang/adminmt.lang.php"); //引入语言包

$tf="admin_cp.php?job=useradmin";
 if (!$action) $action='moduser';

if ($action=='moduser') {
unset($tmp);
if (empty($sort)) $sort=1;
if (file_exists("$diruser/allids.php")) {
	$tmp=@yafile("$diruser/allids.php");
	if ($sort==1) sort($tmp);
	elseif ($sort==2) $tmp=array_reverse($tmp);
	elseif ($sort==3) rsort($tmp);
	$mi=count($tmp);
//分页开始
if (empty($page)) $page=1;

unset ($pagexia, $pageshang, $pagezuihou, $pagediyi, $pagexiangxi, $pagexianzai);
$mi=count($tmp);
$start=($page-1)*$artperpage;
if (($start+$artperpage-1)<$mi) {$end=$start+$artperpage;}
else $end=$mi;
$lastpage=floor(($mi-1)/$artperpage)+1;
if ($page<>1) $pageshang=" <a href=\"$tf&sort=$sort&page=".strval($page-1)."\">$directarrow[0]</a> "; 
if ($page<>$lastpage) $pagexia= " <a href=\"$tf&sort=$sort&page=".strval($page+1)."\">$directarrow[1]</a>";
$pagediyi= " <a href=\"$tf&sort=$sort&page=1\">$directarrow[2]</a>";
$pagezuihou= " <a href=\"$tf&sort=$sort&page=$lastpage\">$directarrow[3]</a>";
for ($i=$page; $i<$page+4; $i++) {
	if ($i<=$lastpage) $pagexiangxi.=" <a href=\"$tf&sort=$sort&page=$i\">$i</a> ";
	else break;
}
$pagexianzai=$langaau[14].$page."/".$lastpage;
//分页结束
	
for ($i=$start; $i<$end; $i++) {
	$tk=explode("|",$tmp[$i]);
	$tk[2]=date("Y-n-j",$tk[2]);
	$listname.="<tr align=\"center\"  bgcolor=\"#FFFFFF\"><td>$tk[1]</td><td>$tk[2]</td><td><a href=\"profile.php?job=regprofile&user=".urlencode($tk[1])."\" target=\"_blank\">$langaau[15]</a></td><td><a href=\"$tf&action=deluser&user=".urlencode($tk[1])."\">$langaau[8]</a></td><td><a href=\"$tf&action=edituser&user=".urlencode($tk[1])."\" target=\"_blank\">$langaau[21]</a></td></tr>";
}
}
$regitime=date("Y-n-j",mktimezone($regitime));

$showup="<table width=\"95%\" cellpadding=\"0\" cellspacing=\"0\" align=center><tr><td bgcolor=\"#000000\"><table width=\"100%\"  cellpadding=\"4\" cellspacing=\"1\"><tr align=\"center\"><td bgcolor=\"#E9F2FC\" width=\"20%\"><span style=\"color: #000000\">$langaau[4]</span></td><td  bgcolor=\"#E9F2FC\"><span style=\"color: #000000\">$langaau[5]</span></td><td  bgcolor=\"#E9F2FC\"><span style=\"color: #000000\">$langaau[15]</span></td><td  bgcolor=\"#E9F2FC\"><span style=\"color: #000000\">$langaau[8]</span></td><td  bgcolor=\"#E9F2FC\"><span style=\"color: #000000\">$langaau[21]</span></td></tr>".$listname."</table></td></tr>";

$showup.="<tr><td><div align=\"right\">$pagexianzai $pagediyi $pageshang $pagexiangxi $pagexia $pagezuihou <br> $langaau[16] <a href='$tf&sort=1'>$langaau[17]</a> | <a href='$tf&sort=3'>$langaau[18]</a> | <a href='$tf&sort=2'>$langaau[19]</a>  | <a href='$tf&sort=4'>$langaau[20]</a></div></td></tr></table>";

if ($extra_admin) {
	$extraadmins=implode(",", $extra_admin);
}
	 print <<< eot
	<table cellpadding=0 cellspacing=0 align=center width='95%' bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 width='100%'><form action=$tf method=post>
	<tr bgcolor='#E9F2FC'><td colspan=2><font color="#000000">$langaau[0]</font></td></tr>
	<tr bgcolor='#FFFFFF'><td width=28%>$langaau[1]</td><td><input type=text name="user"  ></td></tr><input type=hidden name=action value=chooseuser>
	<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
	</td></tr></form>
	</table>
	</td></tr>
	</table>
	<br>
	$showup
	<br><table cellpadding=0 cellspacing=0 align=center width='95%' bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 width='100%'><form action=$tf method=post>
	<tr bgcolor='#E9F2FC'><td><font color="#000000">$langaau[28]</font></td></tr>
	<tr bgcolor='#FFFFFF'><td><TEXTAREA NAME="extraadmins" ROWS="3" COLS="80">$extraadmins</TEXTAREA><br>
	$langaau[29]</td></tr><input type=hidden name=action value=setextraadmin>
	<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
	</td></tr></form>
	</table>
	</td></tr>
	</table>

	
eot;
	require("footer.php");
	exit();
}

if ($action=='chooseuser') {
if (empty($user)) {
msg_box($langerror,"$langaau[2]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
require("footer.php");
exit;
}

$idfile=getinitial($user);
if (!file_exists("$diruser/$idfile.php")) $isfound=0;
else {	
	$tmp=@file("$diruser/$idfile.php");
	for ($i=0; $i<count($tmp); $i++) {
		$cur=explode("|", $tmp[$i]);
		if ($user==$cur[1]) {
			$isfound=1;
			list ($unuse, $user_name, $unuse, $email, $homepage, $contype, $connum, $ps, $unuse, $regt, $replies, $avatar)=$cur;
			$regt=date("Y-n-j",$regt);
			if (empty($homepage)) $homepage="#";
			else if (!eregi("http://", $homepage)) $homepage="http://".$homepage;
			if (empty($connum)) $contype="N/A";
			break;
		}
	}
}
if ($isfound==0) {
msg_box($langerror,"$langaau[2]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
require("footer.php");
exit;
}
else {
msg_box($langaau[22],"$langaau[4] {$user_name} $langaau[5] {$regt}  $langaau[6] {$replies} <ul><li><a href='profile.php?job=regprofile&user=".urlencode($user_name)."' target=_blank>$langaau[15]</a></li></ul><ul><li><a href='$tf&action=deluser&user=".urlencode($user_name)."'>$langaau[8]</a></li></ul><ul><li><a href='$tf&action=edituser&user=".urlencode($user_name)."'>$langaau[21]</a></li></ul><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
require("footer.php");
exit;
}

}

if ($action=='deluser') {
if (empty($user)) {
msg_box($langerror,"$langaau[2]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
require("footer.php");
exit;
}

$idfile=getinitial($user);
if (!file_exists("$diruser/$idfile.php")) $isfound=0;
else {	
	$tmp=@file("$diruser/$idfile.php");
	for ($i=0; $i<count($tmp); $i++) {
		$cur=explode("|", $tmp[$i]);
		if ($user==$cur[1]) {
			$isfound=1;
			list ($unuse, $user_name, $unuse, $email, $homepage, $contype, $connum, $ps, $unuse, $regt, $replies, $avatar, $usgr)=$cur;
			$regt=date("Y-n-j",$regt);
			if (empty($homepage)) $homepage="#";
			else if (!eregi("http://", $homepage)) $homepage="http://".$homepage;
			if (empty($connum)) $contype="N/A";
			break;
		}
	}
}
if ($isfound==0) {
msg_box($langerror,"$langaau[2]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
require("footer.php");
exit;
}
else {
msg_box($langconfirm,"$langaau[3]  <br>$langaau[4] {$user_name} $langaau[5] {$regt}  $langaau[6] {$replies} <ul><li><a href='$tf&action=dodeluser&user=".urlencode($user_name)."'>$langsure</a></li></ul><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
require("footer.php");
exit;
}

}

if ($action=='dodeluser') {
$idfile=getinitial($user);
$tmp=@file("$diruser/$idfile.php");
for ($i=0; $i<count($tmp); $i++) {
	$cur=explode("|", $tmp[$i]);
	if ($user==$cur[1]) {
		$tmp[$i]="";
		break;
	}
}
$all1=implode("", $tmp);
writetofile("$diruser/$idfile.php", $all1);

unset($tmp, $all1);
$tmp=@file("$diruser/allids.php");
for ($i=0; $i<count($tmp); $i++) {
	$cur=explode("|", $tmp[$i]);
	if ($user==$cur[1]) {
		$tmp[$i]="";
		$disusd=$cur[1];
		break;
	}
}
$all1=implode("", $tmp);
writetofile("$diruser/allids.php", $all1);
updateregusernum (-1);
msg_box($langsuccess,"$langaau[7] {$disusd}。<ul><li><a href=$tf>$langcontinue</a></li></ul><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
require("footer.php");
exit;
}

if ($action=='edituser') {
if (empty($user)) {
msg_box($langerror,"$langaau[2]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
require("footer.php");
exit;
}

$idfile=getinitial($user);
if (!file_exists("$diruser/$idfile.php")) $isfound=0;
else {	
	$tmp=@file("$diruser/$idfile.php");
	for ($i=0; $i<count($tmp); $i++) {
		$cur=explode("|", $tmp[$i]);
		if ($user==$cur[1]) {
			$isfound=1;
			list ($unuse, $user_name, $unuse, $email, $homepage, $contype, $connum, $ps, $unuse, $regt, $replies, $avatar, $usgr)=$cur;
			break;
		}
	}
}
if ($isfound==0) {
msg_box($langerror,"$langaau[2]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
require("footer.php");
exit;
}
else {
msg_box($langaau[21],"<form action=$tf method=post name=sda id=sda><input type=hidden name=action value=doedituser><input type=hidden name=user value=$user_name>{$user_name}<br> $langaau[23] <input type=text name=newgroup value=$usgr><br>  $langaau[24] <input type=text name=newpass value=''>  $langaau[25]<ul><li><a href='javascript: document.sda.submit();'>$langaau[26]</a></li></ul><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul></form>");
require("footer.php");
exit;
}
}


if ($action=='doedituser') {
if (empty($user)) {
msg_box($langerror,"$langaau[2]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
require("footer.php");
exit;
}

$idfile=getinitial($user);
if (!file_exists("$diruser/$idfile.php")) $isfound=0;
else {	
	$tmp=@file("$diruser/$idfile.php");
	for ($i=0; $i<count($tmp); $i++) {
		$cur=explode("|", $tmp[$i]);
		if ($user==$cur[1]) {
			$isfound=1;
			if (!empty($newpass)) $cur[2]=md5($newpass);
			if ($newgroup!="")  $cur[12]=$newgroup;
			$tmp[$i]=implode('|',$cur);
			break;
		}
	}
}
if ($isfound==0) {
msg_box($langerror,"$langaau[2]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
require("footer.php");
exit;
}
else {
writetofile ("$diruser/$idfile.php", implode('', $tmp));
msg_box($langsuccess,"$langaau[27]<ul><li><a href=$tf>$langcontinue</a></li></ul><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
require("footer.php");
exit;
}
}

if ($action=='setextraadmin') {
	$extraadmins=str_replace("," , "\", \"", $extraadmins);
	$extraadmins2="<? \$extra_admin=array(\"$extraadmins\");?>";
	writetofile ("$diruser/extra_admin.php", $extraadmins2);
	msg_box($langsuccess,"$langaau[30]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
	exit;
}



	