<?
// Bo-Blog
// A Blog System based on PHP and text database
// Author: Bob Shen
// Official Site: http://www.bo-blog.com
// Email: bobshen@gmail.com
// All Rights Reserved.
// 版权所有，任何修改版权后使用传播之行为皆不允许

error_reporting(E_ERROR | E_WARNING | E_PARSE);
@set_magic_quotes_runtime (0);
define("inwork",1); //生成常数用于判断页面是否引用过global.php
$readfilenum=0;
$writefilenum=0;

$versioninfo="Powered by Bo-Blog V1.7.0108.2"; //勿修改
require_once("blog/mblogcon.php");
require_once("include/blogcode.php");


//Begin detect language pack
$bloglang=basename($bloglang);
$blogadminlang=basename($blogadminlang);
if (!$bloglang || !is_dir("blog/language/$bloglang") || !file_exists("blog/language/$bloglang/public.lang.php")) $bloglang='zh_cn';
require_once("blog/language/$bloglang/public.lang.php"); //引入语言包
if (!$blogadminlang || !is_dir("blog/language/$blogadminlang") || !file_exists("blog/language/$blogadminlang/admin.lang.php")) $blogadminlang='zh_cn';

//环境检测结果载入
@include_once("blog/env.php");



//提取页面和浏览器提交的变量
@extract($_SERVER, EXTR_SKIP); 
@extract($_SESSION, EXTR_SKIP); 
@extract($_POST, EXTR_SKIP); 
@extract($_FILES, EXTR_SKIP); 
@extract($_GET, EXTR_SKIP); 
@extract($_ENV, EXTR_SKIP); 
//提取完成

$updir='up';
$timestamp = mktime();


//得到ip地址
$ip=$_SERVER['REMOTE_ADDR'];
$ip1 = getenv('HTTP_X_FORWARDED_FOR');
if (($ip1 != "") && ($ip1 != "unknown")) $ip=$ip1;
//ip地址获取结束


//在线统计以及计数器防刷
$afilename="blog/online.php"; 
$online_id=@file($afilename); 
$nowtime=time(); 
$found=0;
for($i=0;$i<count($online_id);$i++){ 
    $oldip=explode("||",$online_id[$i]); 
    $hasonlinetime=$nowtime-$oldip[2]; 
	if ($ip!=$oldip[1] && $hasonlinetime<$onlinetime) $nowonline[]=$online_id[$i]; 
	if ($ip==$oldip[1]) $found=1;
	if($ip==$oldip[1] && $hasonline>$onlinetime) {$found=0;}
} 
$nowonline[]="<?die();?".">||".$ip."||".$nowtime."\n";
$total_online=@count($nowonline); 
writetofile($afilename, implode("", $nowonline));
if ($found==0) $forcount=1;
//在线统计和计数器防刷结束



//获取网主信息
if (file_exists("$diruser/userid.php")) $usertemp=@readfromfile("$diruser/userid.php"); 
list($unuse, $username, $userpassword, $blogname, $blogdc, $regitime, $blogtem, $useremail, $unuse2, $unuse3, $regip, $question, $answer, $securedcode, $unused2,$unused3,$unused4,$unused5)=explode("|",$usertemp);
$blogname=stripslashes($blogname);
//网主信息得到

if (file_exists("$diruser/extra_admin.php")) require_once ("$diruser/extra_admin.php"); 
else $extra_admin=''; //2005-6-11 21:51 Important Security Fix

//判断登陆状态
$nowuserid='';
$nowuserpassword='';
$login_status=0;
$guest_login=0;
if (!empty($_COOKIE['nowuserid']) && !empty ($_COOKIE['nowuserpassword'])) {
	if (checkpass($_COOKIE['nowuserid'],$_COOKIE['nowuserpassword'])==1) { //是日志主人
		if (($securedlogin==1 &&  ($securedcode==$_COOKIE['nowsecuredcode'])) || $securedlogin!=1) {
			$login_status=1;
			$nowuserid=$_COOKIE['nowuserid'];
			$nowuserpassword=$_COOKIE['nowuserpassword'];
			$guest_login=0;
		} else {
			$login_status=0;
			$guest_login=0;
			$nowusergroup=1;
		}
	} elseif (checkpass($_COOKIE['nowuserid'],$_COOKIE['nowuserpassword'])==2) { //是注册用户
		global $extra_admin;
		if (is_array($extra_admin)) {
			if (in_array($_COOKIE['nowuserid'], $extra_admin)) { //是副管理员
				$login_status=1;
				$guest_login=0;
			} else {
				$login_status=0;
				$guest_login=1;
			}
		} else {
			$login_status=0;
			$guest_login=1;
		}
		$nowuserid=$_COOKIE['nowuserid'];
		$nowuserpassword=$_COOKIE['nowuserpassword'];
		$nowusergroup=0;
	} else { //游客
		$login_status=0;
		$guest_login=0;
		$nowusergroup=1;
	}
} else { //游客
	$login_status=0;
	$guest_login=0;
	$nowusergroup=1;
}
get_user_permit($nowusergroup);
//登陆状态得到

//Mozilla Bug Fixation
//The Browsers like Mozilla Firefox, Netscape,etc cannot display Webdings Font correctly, and also Webdings Font may not be available in non-Windows OS.
//More info about this bug can be found at http://bugzilla.mozilla.org/show_bug.cgi?id=31538
//Also this configuration will determine whether to show a quick-jump input field in the page selecting part, which will not function at all in Firefox.
if ($fixmozillabug==1) {
	$agentname=$_SERVER["HTTP_USER_AGENT"];
	if (ereg("Mozilla",$agentname) && ereg("MSIE",$agentname)) {//It's IE
		$directarrow=array ("<span style=\"font-family: Webdings\">3</span>", "<span style=\"font-family: Webdings\">4</span>", "<span style=\"font-family: Webdings\">7</span>", "<span style=\"font-family: Webdings\">8</span>");
		$is_mozilla=0;
	} else {//Other Browsers, better to be cautious
		$directarrow=array (' &lsaquo; ', ' &rsaquo; ', ' &laquo; ', ' &raquo ');
		$is_mozilla=1;
	}
} else {
	$directarrow=array ("<span style=\"font-family: Webdings\">3</span>", "<span style=\"font-family: Webdings\">4</span>", "<span style=\"font-family: Webdings\">7</span>", "<span style=\"font-family: Webdings\">8</span>");
}
//Mozilla Bug Fixation Ends


function msg_box($title,$content) { //信息显示框
	global $blogtem, $go, $langgoto;
	require ("blog/template/$blogtem/colorsheme.txt");
	if (empty($border)) $border="#000000";
	if (empty($color2)) $color2="#B0C4D7";
	if (empty($font2)) $font2="#000000";
	if (empty($color1)) $color1="#FFFFFF";
	if (empty($font1)) $font1="#000000";
	if ($go) {
		if ($go!="<back>") $goshow="<br><div align=center>$langgoto[0] $go</div>";
		else $goshow="<br><div align=center>$langgoto[1]</div>";
	}
	echo "<br><br><br><table width=90% align=center cellpadding=0 cellspacing=0 bgcolor=$border> <tr><td><table cellspacing=1 cellpadding=4 width=100%><tr bgcolor=$color2><td><font color=$font2>$title</font></td></tr><tr bgcolor=$color1><td><font color=$font1>$content $goshow</font></td></tr></table></td></tr></table>";
}


function readfromfile($file_name) { //读取文件函数
global $readfilenum;
	if (file_exists($file_name)) {
		$filenum=fopen($file_name,"r");
		flock($filenum,LOCK_EX);
		$file_data=fread($filenum, filesize($file_name));
		rewind($filenum);
		fclose($filenum);
		$readfilenum+=1;
		return $file_data;
	}
}

function writetofile($file_name,$data,$method="w") { //写入文件函数
global $writefilenum;
	$filenum=fopen($file_name,$method);
	flock($filenum,LOCK_EX);
	$file_data=fwrite($filenum,$data);
	ftruncate($filenum,strlen($data));
	fclose($filenum);
	$writefilenum+=1;
	return $file_data;
}


function checkpass($userid,$password){ //检测密码和登陆状态
global $username,$userpassword, $diruser, $usrname, $nowuseremail,$nowuserhomepage,$nowusercontype,$nowuserconnum,$nowuserps,$nowuserregt, $securedlogin, $nowusergroup;
if (empty($userid) || empty($password)) return 0;
if ($password==$userpassword && strtolower($userid)==strtolower($username)) {
	$usrname=$username;
	return 1;
}
else {
	$idfile=getinitial($userid);
	$tmp=@file("$diruser/$idfile.php");
	$mi=count($tmp);
	for ($i=0; $i<$mi; $i++) {
		if (strpos(strtolower($tmp[$i]), strtolower("<?die();?>|$userid|"))!== false) {
			$tk=@explode("|",$tmp[$i]);
			if (strtolower($tk[1])==strtolower($userid) && $tk[2]==$password) {
				list ($unuse, $usrname, $unuse, $nowuseremail, $nowuserhomepage, $nowusercontype, $nowuserconnum, $nowuserps, $unuse, $nowuserregt, $unuse, $unuse, $nowusergroup)=$tk;
				return 2;
			} else return 0;
		}
	}
	return 0;
}
}


function safe_convert($d) { //危险词语过滤
	$d = htmlspecialchars($d);
//	$d = str_replace("\t","",$d);
	$d = str_replace("<","&lt;",$d);
	$d = str_replace(">","&gt;",$d);
	$d = str_replace("θ","&thita;",$d);
	$d = str_replace("javascript","j avascript",$d);
	$d = str_replace("vbscript","v bscript",$d);
	$d = str_replace("\r","<br>",$d);
	$d = str_replace("\n","",$d);
	$d = str_replace("|","&line;",$d);
	$d = str_replace("  "," &nbsp;",$d);
	$d = str_replace("{","&leftsign;",$d);
	$d = str_replace("}","&rightsign;",$d);
	return $d;
}


function minor_safe_convert($d) { //可视化发帖器过滤
//	$d = str_replace("\t","",$d);
	$d = str_replace("θ","&thita;",$d);
	$d = str_replace("\r","<br>",$d);
	$d = str_replace("\n","",$d);
	$d = str_replace("|","&line;",$d);
	$d = str_replace("  "," &nbsp;",$d);
	$d = str_replace("{","&leftsign;",$d);
	$d = str_replace("}","&rightsign;",$d);
	return $d;
}


function namequalified ($d) { //名称检测
	$d=trim($d);
	if (ereg("θ",$d)) return 0;
	$forbidden=preg_split('//', "$%^&*()~!{}:;/\<>+|'="."\"",-1, PREG_SPLIT_NO_EMPTY);
	for ($i=0; $i<count($forbidden); $i++) {
		if (strstr ($d,$forbidden[$i])) return 0;
	}
	return 1;
}

function pswqualified ($d) { //密码格式检测
	$d=trim($d);
	if (strlen($d)<4)  return 0;
	else return 1;
}

function emailqualified ($d) { //邮件检测
	$d=trim($d);
	if (strpos($d, '|')) return 0;
	if (strlen($d)>80) return 0;
	else return 1;
}

function blognamequalified ($d) { //blog名检测
	$d=trim($d);
	$tmp=0;
	for ($asc=1;$asc<=47;$asc++){ 
		if (strrpos($d,chr($asc))!==false) $tmp=1; 
	}
	for ($asc=58;$asc<=64;$asc++){ 
		if (strrpos($d,chr($asc))!==false) $tmp=1; 
	}
	for ($asc=91;$asc<=96;$asc++){ 
		if (strrpos($d,chr($asc))!==false) $tmp=1; 
	}
	for ($asc=123;$asc<=127;$asc++){ 
		if (strrpos($d,chr($asc))!==false) $tmp=1; 
	}
	if (strlen($d)>100) $tmp=1; 
	if ($tmp==0) return 1;
	else return 0;
}

function blogdcqualified ($d) { //描述语检测
	$d=trim($d);
	$tmp=0;
	if (strrpos($d,"|")!==false || strrpos($d,"<")!==false || strrpos($d,">")!==false) $tmp=1;
	if ($tmp==0) return 1;
	else return 0;
}

function qqualified ($d) { //安全提问检测
	$d=trim($d);
	$tmp=0;
	if (strrpos($d,"|")!==false || strrpos($d,"<")!==false || strrpos($d,">")!==false) $tmp=1;
	if (strlen($d)>20) $tmp=1; 
	if ($tmp==0) return 1;
	else return 0;
}


function foundtem ($blogtem) { //安全答案检测
	$fff=@file("blog/tems.php");
	for ($i=0;$i<count($fff);$i++) {
		$ffff=explode("|",$fff[$i]);
		if ($ffff[2]==$blogtem) {
			return true;
			break;
		}
	}
	return false;
}

function isregistered ($regid) { //检测用户名占用情况
	global $diruser,$username;
	if (strtolower($regid)==strtolower($username)) return 1;
	$allids=@file("$diruser/allids.php");
	for ($i=0; $i<count($allids); $i++) {
		$c=@explode("|", $allids[$i]);
		if (strtolower($c[1])==strtolower($regid) ) {
			return 1;
		}
	}
	return 0;
}


function updatenewestart ($method=1) { //更新最新文章
	global $dirblog,$howmanynewart;
	$tmp=@file("$dirblog/list.php");
	$totmp=@implode('', array_slice($tmp,0,$howmanynewart));
	@writetofile("$dirblog/latest.php",$totmp);
}

function updatenewestrep () { //更新最新评论
	global $dirblog, $howmanynewart;
	$tmp=@file("$dirblog/replies.php");
	$totmp=@implode('', array_slice($tmp,0,$howmanynewart));
	@writetofile("$dirblog/latestreplies.php",$totmp);
}

function updatenewesttb () { //更新最新引用
	global $howmanynewart;
	$tmp=@file("tblog/tblist.php");
	$totmp=@implode('', array_slice($tmp,0,$howmanynewart));
	@writetofile("tblog/latesttb.php",$totmp);
}

function contentqualified($d) { //内容格式
	global $maxlength;
	if (strlen($d)>$maxlength) return 0;
	else return 1;
}

function getarticle($handle) { //文章格式化
	global $allowfullcode, $login_status, $adminreadcount;
	if ($allowfullcode==1) $md="full";
	else $md="small";
	$all=@explode("<θθθ>",readfromfile($handle));
	if (trim($all[0])=="") die("Fail to load the article... It is probably because there are too many simultaneous requests for reading a single data file. Please refresh the current page. If you keep on getting this error, please contact the administrator.");
	$allout=decode($all[0], $md);
	$tmp=@explode("|", $all[1]);
	if ($login_status!=1 || $adminreadcount==1) $tmp[0]+=1;
	$all[1]=@implode("|",$tmp);
	$towrite=@implode("<θθθ>",$all);
	if ($login_status!=1 || $adminreadcount==1) writetofile ($handle, $towrite);
	return array ("content"=>$allout, "append"=>$all[1]);
}

function sgetarticle($handle) { //摘要格式化
	global $allowfullcode, $extractlength,$readfilenum;
	if ($allowfullcode==1) $md="full";
	else $md="small";
	$all=@explode("<θθθ>",@readfromfile($handle));
	if (!eregi("\[separator\]", $all[0]) && !eregi("<table", $all[0])) {
	$length=strlen($all[0]);
	if ($length>$extractlength) {
		$all[0]=msubstr($all[0], 0, $extractlength);
		if (strlen($all[0])<$length) {
			$all[0].="...";
			$unfinished=1;
		}
	}
	}
	elseif (eregi("\[separator\]", $all[0])) {
		$all[0]=preg_replace ("/\[separator\](.+)/is", "...", $all[0]);
		$unfinished=1;
	}
	$all[0]=decode($all[0], $md);
	return array ("content"=>$all[0], "append"=>$all[1], "is_all"=>$unfinished,);
}

function getarticleforedit ($handle){ //文章提取供编辑
	$all=@explode("<θθθ>",readfromfile($handle));
	$all[0]=safe_invert($all[0]);
	return $all[0];
}

function getarticleforappend ($handle){ //文章过滤附加信息
	$all=@explode("<θθθ>",readfromfile($handle));
	return array("content"=>$all[0], "append"=>$all[1]);
}

function safe_invert($d) { //转回字符
	global $htmlmode;
	if ($htmlmode==0) {
	$d = str_replace("<br>","\r",$d);
	$d = str_replace("&amp;","&",$d);
	} else {
		$d = str_replace("&","&amp;",$d);
	$d = str_replace("&amp;leftsign;","{",$d);
	$d = str_replace("&amp;rightsign;","}",$d);
	}
	$d = stripslashes($d);
	$d = str_replace("&line;","|",$d);
	$d = str_replace("&nbsp;"," ",$d);
	$d = str_replace("&leftsign;","{",$d);
	$d = str_replace("&rightsign;","}",$d);
	$d = str_replace("&thita;","θ",$d);
	return $d;
}


function getreply($all) { //读取回复
	global $allowreplyfull;
	if ($allowreplyfull==0) $all=decode($all, "small", 1);
	else $all=decode($all, "full");
	return $all;
}


function getrsscontent($handle) { //rss内容格式化
	global $weburl,$updir;
	$all=readfromfile($handle);
	$all =preg_replace("/<θθθ>(.+)/is","",$all);
	$all =preg_replace("/\[emot\]([^ ]+?)\[\/emot\]/is","<img src=$weburl"."/img/emot/\\1.gif>",$all);
	$all=str_replace("[^upload^]", $weburl."/".$updir ,$all);
	$all=decode($all, "full");
	return $all;
}


function getusericon() { //得到网主头像
	global $diruser;
	if (!file_exists("$diruser/userid.ext")) return "icon1.jpg";
	else {$a=explode("|", readfromfile("$diruser/userid.ext"));
	return $a[1];}
}

function getregavatar($user, $ava=0) { //得到注册用户头像
	global $diruser;
	$idfile=getinitial($user);
	$tmp=@file("$diruser/$idfile.php");
	$mi=count($tmp);
	for ($i=0; $i<$mi; $i++) {
		$tk=explode("|",$tmp[$i]);
		if ($tk[1]==$user) {
			if ($ava==0) return "<img align=\"middle\" src=\"img/avatars/{$tk[11]}.gif\" title=\"{$user}\" /> ";
			else return $tk[3];
		}
	}
}

function getcats($handle="write") { //得到类别列表
	global $dirblog, $langglobal;
	$all=@file("$dirblog/cat.php");
	if ($handle=="write") $put="<select name='cat'><option value='' selected='selected'>$langglobal[0]</option>";
	elseif ($handle=="trans") $put="<select name='tocat'>";
	else $put="<select name='catnew'><option value='unchange' selected='selected'>$langglobal[1]</option>";
	for ($i=0;$i<count($all); $i++) {
		$tmp=explode("|",$all[$i]);
		$put.="<option value='$tmp[1]'>$tmp[2]</option>";
	}
	if  ($handle=="trans") $put.="<option value='remove'>$langglobal[2]</option>";
	$put.="</select>";
	return $put;
}

function getzodiac($birthday) { //得到星座
global $langglobal;
if ($birthday=="") return "";
else {@list($y, $m, $d)=@explode("/",$birthday); 
	if ($m==1 && $d<=19) $y=1982; else $y=1981;
	    $yours=mktime(0,0,0,$m,$d,$y);
	    if ($yours>=348768000 && $yours<351360000) $n=$langglobal[3]; 
	    if ($yours>=351360000 && $yours<353952000) $n=$langglobal[4]; 
	    if ($yours>=353952000 && $yours<356544000) $n=$langglobal[5]; 
	    if ($yours>=356544000 && $yours<359222400) $n=$langglobal[6]; 
	    if ($yours>=359222400 && $yours<361987200) $n=$langglobal[7]; 
	    if ($yours>=361987200 && $yours<364665600) $n=$langglobal[8]; 
	    if ($yours>=364665600 && $yours<367344000) $n=$langglobal[9];  
	    if ($yours>=367344000 && $yours<370022400) $n=$langglobal[10]; 
	    if ($yours>=370022400 && $yours<372700800) $n=$langglobal[11]; 
	    if ($yours>=372700800 && $yours<375206400) $n=$langglobal[12]; 
	    if ($yours>=375206400 && $yours<377798400) $n=$langglobal[13];  
	    if ($yours>=377798400 && $yours<=380304000) $n=$langglobal[14]; 
	return $n;
}
}


function msubstr($str,$start,$end, $method=1) { //UTF字串截取
	preg_match_all("/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|\xe0[\xa0-\xbf][\x80-\xbf]|[\xe1-\xef][\x80-\xbf][\x80-\xbf]|\xf0[\x90-\xbf][\x80-\xbf][\x80-\xbf]|[\xf1-\xf7][\x80-\xbf][\x80-\xbf][\x80-\xbf]/", $str, $info);
	$lens=sizeof($info[0]);
	if ($method==1) return join("",array_slice($info[0],$start,$end));
	elseif ($method==2) return array(join("",array_slice($info[0],$start,$end)), $lens);
}


function getrandom(){ //随机数生成
for ($i=0; $i<4; $i++) {
if (($i%2)==1) $rand.=chr(rand(65,90));
else $rand.=chr(rand(97,122));
}
return $rand;
}

function checkip($ip) { //ip屏蔽检测
if (file_exists("blog/banip.php")) $bantmp=@explode(",", @readfromfile("blog/banip.php"));
for ($i=0; $i<count($bantmp); $i++) {
	$ip='a'.$ip;
	$bantmp[$i]='a'.trim($bantmp[$i]);
	if ($bantmp[$i]!="a" && @ereg(trim($bantmp[$i]), $ip)) {
		return true;
		break;
	}
}
}

function checksensitive($words) { //敏感字检测
if (file_exists("blog/banwords.php")) $bantmp=@explode(",", @readfromfile("blog/banwords.php"));
for ($i=0; $i<count($bantmp); $i++) {
	if ($bantmp[$i]!="" && @eregi(trim($bantmp[$i]), $words)) {
		return true;
		break;
	}
}
}

function checkbansearch($words) { //搜索无用字检测
if (file_exists("blog/bansearch.php")) $bantmp=@explode(",", @readfromfile("blog/bansearch.php"));
for ($i=0; $i<count($bantmp); $i++) {
	if ($bantmp[$i]!="" && @eregi(trim($bantmp[$i]), $words)) {
		return true;
		break;
	}
}
}

function getvnimg($codec) { //验证码图案生成
global $fixmozillabug, $is_mozilla;
$part[0]=substr($codec,0,1); 
$part[1]=substr($codec,1,1); 
$part[2]=substr($codec,2,1); 
$part[3]=substr($codec,3,1); 
$plus=date("n", time())*date("d",time())+date("Y",time());
if ($fixmozillabug==1 && $is_mozilla==0) {
	$csscom="background-image: url(img/validate/bg.gif); backgound-position: top; border:1px #B2B2B2 solid;";
} 
$out="<span style=\"width: 50px; height: 22px;  {$csscom}\">";
for ($i=0; $i<4;$i++) {
	$cnow=$part[$i];
	$out.="<img src=\"include/mblog_vn.php?n=".strval($plus+$cnow).chr(rand(65,90))."\" title=\"\" />";
}
$out.="</span>";
return $out;
}

function getinitial ($char) { //得到首字母
	$num=range(a,z);
	$char=urlencode($char);
	$f=strtolower(substr($char, 0, 1));
	if ($f=="%") {
		$init="hanzi";
	}
	elseif (in_array($f, $num)) {
		$init=$f;
	}
	else $init="#";
	return $init;
}

function getyearlist ($initial=1999, $end=2010, $name='modyear') { //年列表
	$cur=date("Y");
	$out="<select name=$name>";
	for ($i=$initial; $i<=$end; $i++) {
		if ($i==$cur) $out.="<option value=$i selected>$i</option>";
		else $out.="<option value=$i>$i</option>";
	}
	$out.="</select>";
return $out;
}

function getmonthlist ($name='modmonth') { //月列表
	$cur=date("n");
	$out="<select name=$name>";
	for ($i=1; $i<=12; $i++) {
		if ($i==$cur) $out.="<option value=$i selected>$i</option>";
		else $out.="<option value=$i>$i</option>";
	}
	$out.="</select>";
return $out;
}

function getdaylist ($name='modday') { //日列表
	$cur=date("j");
	$out="<select name=$name>";
	for ($i=1; $i<=31; $i++) {
		if ($i==$cur) $out.="<option value=$i selected>$i</option>";
		else $out.="<option value=$i>$i</option>";
	}
	$out.="</select>";
return $out;
}

function gethourlist ($name='modhour') { //小时列表
	$cur=date("H");
	$out="<select name=$name>";
	for ($i=0; $i<=23; $i++) {
		if ($i==$cur) $out.="<option value=$i selected>$i</option>";
		else $out.="<option value=$i>$i</option>";
	}
	$out.="</select>";
return $out;
}

function getminutelist ($name='modminute') { //分列表
	$cur=date("i");
	$out="<select name=$name>";
	for ($i=0; $i<=59; $i++) {
		if ($i==$cur) $out.="<option value=$i selected>$i</option>";
		else $out.="<option value=$i>$i</option>";
	}
	$out.="</select>";
return $out;
}

function getsecondlist ($name='modsecond') { //秒列表
	$cur=date("s");
	$out="<select name=$name>";
	for ($i=0; $i<=59; $i++) {
		if ($i==$cur) $out.="<option value=$i selected>$i</option>";
		else $out.="<option value=$i>$i</option>";
	}
	$out.="</select>";
return $out;
}

function	updatelinks() { //更新友情链接缓存
	global $dirblog;
	$tmp=@file("$dirblog/links.php");
	for ($i=0; $i<count($tmp); $i++) {
		$tk=explode("|",$tmp[$i]);
		$tk[1]=stripslashes($tk[1]);
		if ($tk[3]!="pic") $textlinks.="<a href=\"$tk[2]\" target=\"_blank\">$tk[1]</a><br/>";
		else $piclinks.="<a href=\"$tk[2]\" target=\"_blank\"><img src=\"$tk[4]\" border=\"0\" title=\"$tk[1]\"/></a><br/>";
	}
	$links=$textlinks.$piclinks;
	writetofile("$dirblog/linkcache.php", $links);
	$links=str_replace("'", "\'", $links);
	writetofile ("blog/rolllinks.js", "document.write ('<marquee direction=up height=180 onmouseover=\"this.stop();\" onmouseout=\"this.start();\" width=100% scrollamount=3>$links</marquee>');");
}

function my_set_time_limit($timelimit=0) { //自动设定时限函数，provided by 南北
if (function_exists('set_time_limit') == 1 && @ini_get('safe_mode') == 0) {
	@set_time_limit($timelimit);
}
}

function getstr( $str, $ostr) { //代入字符
	$out=str_replace ('::',$str,$ostr);
	return $out;
}

function yafile($filename,$method="rb") { //Yet Another File Function
  $handle=@fopen($filename,$method);
  @flock($handle,LOCK_SH);
  @$filedata=fread($handle,filesize($filename));
  @fclose($handle);
  $filedata=str_replace("\n","\n<θ:>",$filedata);
  $filedb=explode("<θ:>",$filedata);
  $count=count($filedb);
  if($filedb[$count-1]==''){unset($filedb[$count-1]);}
  return $filedb;
}

function locatedata($filename, $articleid, $context=1) { //快速定位函数
	$handle=@fopen($filename,"rb");
	@flock($handle,LOCK_SH);
	@$filedata=fread($handle,filesize($filename));
	@rewind($handle);
	@fclose($handle);
	$temp=@explode("<?die();?>|$articleid|",$filedata);
	if (empty($temp[1])) return false;
		if ($context==1) {
			$presave=strrchr($temp[0], '<');
		}
		$pos=strpos($temp[1], '<');
		if ($pos) {$tempall=$temp[1]; $temp[1]=substr($temp[1], 0, $pos);}
		if ($context==1) {
			$outgone=substr($tempall,($pos+1));
			$pos2=strpos($outgone, '<');
			if ($pos2) $outgone2=substr($outgone, 0, $pos2);
			else $outgone2=false;
		}
		$temp[1]="<?die();?>|$articleid|".$temp[1];
		$putstr=@explode("|", $temp[1]);
		if ($context==1) {
			if ($presave) {
				$alt=@explode('|', $presave);
				$putstr[21]=$alt[1];
				$putstr[22]=$alt[2];
				$putstr[25]=trim($alt[10]);
			}
			if ($outgone2) {
				$altt=@explode('|', $outgone2);
				$putstr[23]=$altt[1];
				$putstr[24]=$altt[2];
				$putstr[26]=trim($altt[10]);
			}
		return $putstr;
	}
}

function seekdata ($filename, $articleid, $wholelength, $filterlength, $charlength) { //查找定长文件中的数值
	$signal="<?die();?>|$articleid|";
	$handle=@fopen($filename,"rb");
	@flock($handle,LOCK_EX);
	while(!feof($handle)) {
		$lines++;
		$offsety=$wholelength*$lines;
		fseek($handle,$offsety);
		$thisline=fread($handle,$wholelength);
		$position=strpos($thisline,$signal);
		if($position!==false) {
			$result=substr($thisline,$position+$filterlength,$charlength);
			break;
		}
	}
	@fclose($handle);
	return $result;
}


function countvisit($num=1) { //计数器
	global $dirblog, $forcount;
	$handle=@fopen("$dirblog/counter.now.php","r+");
	@flock($handle,LOCK_EX);
	$aa=fread($handle,75);
	list ($nouse, $visit, $articlenum, $reply, $todayvisit, $todaystamp, $regusers)=explode('|', $aa);
	$nowstamp=date("Ymd");
	if ($todaystamp!=$nowstamp) { //更新日期
		$todaystamp=$nowstamp; //更新今日
		$todayvisit=1000000001;
		$forcount=1;
		$oldhandle="$dirblog/counter.backup.php";
		writetofile($oldhandle, "$aa\n".readfromfile($oldhandle));
	}
	if ($forcount==1) {
		rewind ($handle);
		fseek ($handle, 11);
		fputs($handle, ($visit+$num));
		rewind ($handle);
		fseek ($handle, 44);
		fputs($handle, ($todayvisit+$num).'|'.$todaystamp);
	}
	@fclose($handle);
	return array (($visit-1000000000), ($articlenum-1000000000), ($reply-1000000000), ($todayvisit-1000000000), ($regusers-1000000000));
}

function changedata ($filename, $articleid, $newdata, $wholelength, $filterlength, $charlength) {
	$signal="<?die();?>|$articleid|";
	$handle=@fopen($filename,"r+");
	@flock($handle,LOCK_EX);
	while(!feof($handle)) {
		$lines++;
		$offsety=$wholelength*$lines;
		fseek($handle,$offsety);
		$thisline=fread($handle,$wholelength);
		$position=strpos($thisline,$signal);
		if($position!==false) {
			fseek($handle,-($charlength+1),SEEK_CUR);
			$result=fputs($handle,$newdata);
			break;
		}
	}
	@fclose($handle);
	return $result;
}


function updateartnum ($num=1) { //更新文章数
	global $dirblog;
	$handle=@fopen("$dirblog/counter.now.php","r+");
	@flock($handle,LOCK_EX);
	$aa=fread($handle,75);
	list ($nouse, $visit, $articlenum, $reply, $todayvisit, $todaystamp, $regusers)=explode('|', $aa);
	rewind ($handle);
	fseek ($handle, 22);
	fputs($handle, ($articlenum+$num));
	@fclose($handle);
}


function updateregusernum ($num=1) { //更新用户数
	global $dirblog;
	$handle=@fopen("$dirblog/counter.now.php","r+");
	@flock($handle,LOCK_EX);
	$aa=fread($handle,75);
	list ($nouse, $visit, $articlenum, $reply, $todayvisit, $todaystamp, $regusers)=explode('|', $aa);
	rewind ($handle);
	fseek ($handle, 64);
	fputs($handle, ($regusers+$num));
	@fclose($handle);
}


function updaterenum ($num=1) { //更新回复数
	global $dirblog;
	$handle=@fopen("$dirblog/counter.now.php","r+");
	@flock($handle,LOCK_EX);
	$aa=fread($handle,75);
	list ($nouse, $visit, $articlenum, $reply, $todayvisit, $todaystamp, $regusers)=explode('|', $aa);
	rewind ($handle);
	fseek ($handle, 33);
	fputs($handle, ($reply+$num));
	@fclose($handle);
}


function	updateredirection() { //更新附加转向分类缓存
	global $dirblog;
	$tmp=@file("$dirblog/redirection.php");
	for ($i=0; $i<count($tmp); $i++) {
		$tk=explode("|",$tmp[$i]);
		$tk[1]=str_replace('"', '', stripslashes($tk[1]));
		$tk[2]=str_replace('"', '', stripslashes($tk[2]));
		$tk[1]=str_replace('\'', '', $tk[1]);
		$tk[2]=str_replace('\'', '', $tk[2]);
		$redirection.=" | <a href='$tk[2]' target='_blank'>$tk[1]</a>";
	}
	$newest=@file("blog/mblogcon.php");
	$allthese=count($newest);
	for ($i=0; $i<$allthese; $i++) {
		if (eregi("extracate=", $newest[$i])) {
			$newest[$i]="\$extracate=\"".$redirection."\";\n";
			$saved=1;
			break;
		}
	}
	if ($saved!=1) {
		$newest[$allthese]="\$extracate=\"".$redirection."\";\n";
	}
	$newestp=eregi_replace("=;", "=0;", @implode("", $newest));
	writetofile("blog/mblogcon.php", $newestp);
}

function reguserart ($user, $num) { //更新用户回文数
	global $diruser;
	$idfile=getinitial($user);
	$tmp=@file("$diruser/$idfile.php");
	$mi=count($tmp);
	for ($i=0; $i<$mi; $i++) {
		$tk=explode("|",$tmp[$i]);
		if ($tk[1]==$user) {
			$tk[10]+=$num;
			$tmp[$i]=implode("|",$tk);
			break;
		}
	}
	$totmp=implode("",$tmp);
	writetofile("$diruser/$idfile.php",$totmp);
}

function mktimezone ($time) { //时间校正
	global $timezone;
	$time+=$timezone*3600;
	return $time;
}

function filter_ubb ($content) { //转义ubb中的中括号
	$content=str_replace('[', '&#91;', $content);
	$content=str_replace(']', '&#93;', $content);
	$content=str_replace('&#91;separator&#93;', '[separator]', $content);
	$content=str_replace('&#91;emot&#93;', '[emot]', $content);
	$content=str_replace('&#91;/emot&#93;', '[/emot]', $content);
	return $content;
}

function filter_ubb_back ($content) { //将ubb中转义中括号反转
	$content=str_replace('&#91;', '[', $content);
	$content=str_replace('&#93;', ']', $content);
	return $content;
}

function buildpl ($plname, $id) { //生成伪静态地址
	$plname=urlencode($plname);
	if (strpos($plname, '%')) return 0; //含有不可接受的url字符
	elseif (file_exists("p/{$plname}.php")) return 0; //文件已存在
	else {
		@writetofile ("p/{$plname}.php", "<?\n\$plid='$id';\ninclude('../pl.php');?>");
		return 1;
	}
}

function multi_str_replace ($searchreplace, $subject) {
	while (list ($search, $replace) = each ($searchreplace)) {
		$subject=str_replace($search, $replace, $subject);
	}
	return $subject;
}

function emailconvert($addr) {
	global $login_status;
	if ($login_status==0) $addr=preg_replace("/@(.+?)\.(.+?)/is"," at \\1 dot \\2",$addr);
	return $addr;
}

function get_user_permit ($nowusergroup) {
	global $diruser, $grouppermit;
	if (file_exists("$diruser/groupcache_$nowusergroup.php")) include ("$diruser/groupcache_$nowusergroup.php");
	else include("$diruser/groupcache_1.php");
}

function checkpermit ($permitparse) {
	global $login_status, $grouppermit, $langerror, $langerrornopermit, $langbacktoindex, $langback, $blogname;
	if ($login_status==0 && $grouppermit[$permitparse]==0) {
		require ("header.php");
		msg_box($langerror, "$langerrornopermit<br><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
		require("footer.php");
		exit;
	}
}

function shortenurl ($url) {
	global $autoshortenurl;
	if ($autoshortenurl==0) return $url;
	$urllens=strlen($url);
	if ($urllens<=60) return $url;
	else {
		$url=str_replace('&amp;', '&', $url);
		$endstart=$urllens-27;
		$urlout=substr($url, 0, 25).'......'.substr($url, $endstart);
		$urlout=str_replace('&', '&amp;', $urlout);
		return $urlout;
	}
}