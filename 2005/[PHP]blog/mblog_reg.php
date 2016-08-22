<?
// Bo-Blog
// A Blog System based on PHP and text database
// Author: Bob Shen
// Official Site: http://www.bo-blog.com
// Email: bobshen@gmail.com
// All Rights Reserved.
// 版权所有，任何修改版权后使用传播之行为皆不允许

$tf="mblog_reg.php";
require("global.php");
require_once("blog/language/$blogadminlang/adminre.lang.php"); //引入语言包

$add_title=" - $langarg[0]";

require("header.php");

if (empty($action)) $action="doreg";

if ($action=="modreg" && ($guest_login!=1 && $nowuserid==$username)) {
msg_box($langerror,"$langerrornotlogin<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
require("footer.php");
exit;
}

if ($action=="modreg") {
	unset ($tmp);
	$user=$nowuserid;
	$idfile=getinitial($user);
	$tmp=@file("$diruser/$idfile.php");
	for ($i=0; $i<count($tmp); $i++) {
		$cur=explode("|", $tmp[$i]);
		if ($user==$cur[1]) {
			list ($unuse, $regid, $regpwd3, $regemail2, $reghomepage2, $regcontype2, $regconnum2, $regps2, $regip, $regt, $replies, $regavatar2)=$cur;
			$changline=$i;
			break;
		}
	}
	if (empty($regpwd)) {$pwdnochange=1;} //此时不改密码
}
if ($action=="doreg") {
if (empty($regid) || strlen($regid)<3 || namequalified($regid)==0) {
msg_box($langerror,"$langarg[1]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
require("footer.php");
exit;
}

$regid=str_replace("　","", $regid);
$regid=trim($regid);
if (isregistered($regid)==1) {
msg_box($langerror,"$langarg[2]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
require("footer.php");
exit;
}
if (checksensitive($regid)) {
msg_box($langerror,"$langarg[3]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
require("footer.php");
exit;
}

}


if (emailqualified ($regemail)==0) {
msg_box($langerror,"$langarg[4]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
require("footer.php");
exit;
}

if ($pwdnochange!=1) {
if (pswqualified ($regpwd)==0) {
msg_box($langerror,"$langarg[5]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
require("footer.php");
exit;
}
if ($regpwd!=$regpwd2) {
msg_box($langerror,"$langarg[6]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
require("footer.php");
exit;
}
}

$regpage=safe_convert($regpage);
$regid=safe_convert($regid);
$regcontype=safe_convert($regcontype);
$regconnum=safe_convert($regconnum);
$regps=safe_convert($regps);

$savefile="$diruser/".getinitial($regid).".php";

if ($action=="doreg") {
$regtime=time();
$regpwd=md5($regpwd);
$new1="<?die();?>|$regid|$regtime|||||\n";
$new2="<?die();?>|$regid|$regpwd|$regemail|$regpage|$regcontype|$regconnum|$regps|$ip|$regtime|0|$regavatar|0|0|0|0||||||\n";

writetofile ("$diruser/allids.php", $new1.@readfromfile("$diruser/allids.php"));
writetofile ($savefile, $new2.@readfromfile($savefile));

updateregusernum(1);

msg_box($langsuccess,"$langarg[7]<br><ul><li><a href=login.php>$langnowlogin</a></li></ul>");
require("footer.php");
exit;
} 
else {
if ($pwdnochange==1) {$regpwd=$regpwd3;}
else {$regpwd=md5($regpwd);}
$new2="<?die();?>|$regid|$regpwd|$regemail|$regpage|$regcontype|$regconnum|$regps|$ip|$regt|$replies|$regavatar|0|0|0|0||||||\n";
$tmp[$changline]=$new2;
$ato=implode("",$tmp);
writetofile("$diruser/$idfile.php",$ato);
msg_box($langsuccess,"$langarg[8]<br><ul><li><a href=login.php>$langnowlogin</a></li></ul><br><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
require("footer.php");
exit;

}


exit;
?>