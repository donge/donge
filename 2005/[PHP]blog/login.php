<?
// Bo-Blog
// A Blog System based on PHP and text database
// Author: Bob Shen
// Official Site: http://www.bo-blog.com
// Email: bobshen@gmail.com
// All Rights Reserved.
// 版权所有，任何修改版权后使用传播之行为皆不允许

$tf="login.php";
require("global.php");
require_once("blog/language/$blogadminlang/admingb.lang.php"); //引入语言包

$add_title=" - $langali[0]";

if (empty($action)) $action="login";

if ($action=="login") {
require("header.php");

$username="";
$userpassword="";
if ($validation==1) {
	$codec=rand(1001, 9999);
	$ccodec=md5($codec);
	$codec=getvnimg($codec);
	$barvalidate="<tr bgcolor='#FFFFFF'><td>$langali[1]</td><td><input name=codec maxlength=4 size=4> $langali[2] <b>$codec </b><input type=hidden name=ccodec value=$ccodec></td></tr>";
}
	print <<< eot
		<table cellpadding=0 cellspacing=0 align=center width=760 bgcolor='#000000'>
		<tr><td>
		<table cellpadding=5 cellspacing=1 align=center width='100%'>
		<tr bgcolor='#47637E'><td colspan=2><font color="#FFFFFF">$langali[0] [{$langali[3]}] &nbsp; [<a href='index.php?job=register'><font color="#FFFFFF">{$langali[4]}</font></a>]</font></td></tr><form action=$tf method=post>
		<tr bgcolor='#FFFFFF'><td colspan=2></td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%>$langali[5]</td><td><input name=usrname maxlength=20 size=20></td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%>$langali[6]</td><td><input name=usrpassword type='password'  maxlength=20 size=20> </td></tr>
		$barvalidate
		<tr bgcolor='#FFFFFF'><td>$langali[7]</td><td><input type=radio value='31536000' name=secure>1 $langali[8]<input type=radio value='7776000' name=secure>3 $langali[9]<input type=radio value='2592000' name=secure checked>1 $langali[9]<input type=radio value='86400' name=secure>1 $langali[10] <input type=radio value='3600' name=secure>1 $langali[11]</td></tr>
		<input type=hidden name=action value=dologin>
		<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value='$langsubmit'>  <input type='reset' value='$langreset'>
		</td></tr></form>
		</table>
		</td></tr>
		</table>
eot;
require ("footer.php");
}


if ($action=="dologin") {

	if (empty($usrname)) {
	require("header.php");
	msg_box($langerror,"$langali[12]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	if (empty($usrpassword)) {
	require("header.php");
	msg_box($langerror,"$langali[13]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	if ($validation==1) {
	if ((empty($codec)) || (md5($codec)<>$ccodec)) {
	require("header.php");
	msg_box($langerror,"$langali[14]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	}

	$mcp=checkpass ($usrname, md5($usrpassword));
	if ($mcp==0 ) {	require("header.php");
msg_box($langerror,"$langali[15]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	} else {
	if (empty($secure)) $expire=31536000;
	else $expire=$secure;
	setcookie("nowuserid","",time()-3600);
	setcookie("nowuserpassword","",time()-3600);
	setcookie("nowuserid",$usrname,time()+$expire);
	setcookie("nowuserpassword",md5($usrpassword),time()+$expire);
	if ($mcp==1) {
		$adminplus="<br><ul><li><a href=admin.php target=_parent>$langali[16]</a></li></ul>";
		if ($securedlogin==1) {
			$securedcode=md5(getrandom().time());
			setcookie("nowsecuredcode",$securedcode,time()+$expire);
			$securewhole=explode("|",$usertemp);
			$securewhole[13]=$securedcode;
			writetofile("$diruser/userid.php", implode("|",$securewhole));
			unset($securewhole);
		}
	}
	$go="index.php";
	require("header.php");

	msg_box($langali[17],"<ul><li><a href=index.php target=_parent>$langali[18]</a></li></ul>$adminplus");
	require("footer.php");
	exit;
	}
}


if ($action=="logout") {
	setcookie("nowuserid","",time()-3600);
	setcookie("nowuserpassword","",time()-3600);
	setcookie("boblogtem","",time()-3600);
	$go="index.php";
	require("header.php");
	msg_box($langali[19],"<ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
	require("footer.php");
	exit;
}

?>

