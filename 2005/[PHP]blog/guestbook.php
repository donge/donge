<?
// Bo-Blog
// A Blog System based on PHP and text database
// Author: Bob Shen
// Official Site: http://www.bo-blog.com
// Email: bobshen@gmail.com
// All Rights Reserved.
// 版权所有，任何修改版权后使用传播之行为皆不允许

$tf="guestbook.php";
require("global.php");
checkpermit ('AddGuestbook');
require_once("blog/language/$blogadminlang/admingb.lang.php"); //引入语言包

$add_title=" - $langagb[0]";

if (empty($action)) $action='add';

if ($login_status==0 && $_COOKIE['boblogjustpost']==1) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langerroroverpost<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
	exit;
}

if ($action=="add") {//添加留言
if ($login_status==0 && $allowvisitorreply==0) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langagb[1]<br><ul><li><a href=login.php>{$langnowlogin}</a></li></ul><br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
	exit;
}

if (checkip($ip)) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langagb[2]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
	exit;
}
if (($censorship==1 && checksensitive($gmessage)) || $gmessage=="" || contentqualified($gmessage)==0) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langagb[3]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
}

$gname=str_replace("　","", $gname);
	if (empty($gname)  || ($login_status==0 && strtolower(trim($gname))==strtolower($username))) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langagb[4]<br>$langagb[5]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
}
if ($nowuserid!=$gname && isregistered($gname)==1 && $login_status!=1 && $guest_login==1) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langagb[6]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
}

if ($validation==1 && (md5($codec)<>$ccodec)) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langagb[20]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
}


$gname=safe_convert($gname);
$gemail=safe_convert($gemail);
$ghomepage=safe_convert($ghomepage);
$gmessage=safe_convert($gmessage);
if ($closeubbonce==1) $gmessage=filter_ubb($gmessage);
$gshijian=time();
if ($grestrict==1) $grestrct_filtered=1;
else $grestrct_filtered=0;
$grestrict=$grestrct_filtered; //以上三行于2005-3-26紧急修补安全漏洞
$gcontent=$gname."|".$gshijian."|".$gemail."|".$ghomepage."|".$gmessage."|".$ip."|".$grestrict."|no|||";
writetofile("$dirblog/guestdata.php", $gcontent."\n".(@readfromfile("$dirblog/guestdata.php")));
if ($login_status==0) setcookie("boblogjustpost", "1", time()+$minpostinterval);

$go="index.php?job=guestbook";
require("header.php");
msg_box($langsuccess,"$langagb[7]<br><ul><li><a href= index.php?job=guestbook>$langback</a></li></ul><br><ul><li><a href= index.php>$langbacktoindex</a></li></ul>");
require("footer.php");
exit;
}

if ($action=="reply" || $action=="addreply"|| $action=="del" || $action=="remove") {
if ($login_status==0) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langagb[8]<br><ul><li><a href=login.php>$langnowlogin</a></li></ul><br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
}
if (($id=="") ) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langagb[9]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
}
$all=@yafile("$dirblog/guestdata.php");
$show=@explode("|", $all[$id]); 
list ($gname, $gsubtime, $gemail, $ghomepage, $gsubmessage, $gip, $grestrict, $gis_replied, $greplytime, $greplymessage, $greplyauthor)=$show;
$greplyauthor=trim($greplyauthor);
if (empty($greplyauthor)) $greplyauthor=$username;
}


if ($action=="reply") {//回复留言
if ($gis_replied=="yes" && $nowuserid!=$greplyauthor && $nowuserid!=$username) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langagb[21]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
}

$greplymessage=safe_invert($greplymessage);
if (strlen($gsubtime)==10) { //兼容新老时间数据
	$gsubtime=mktimezone($gsubtime);
	$gsubtime=date($langdatefomat, $gsubtime);
}
require("header.php");
if ($htmlmode==1) print<<<eot
<style type="text/css">
@import url(htmlarea/htmlarea.css);
</style>
<script type="text/javascript">
_editor_url = "htmlarea"; // omit the final slash 
</script> 
<!-- load the main HTMLArea files -->
<script type="text/javascript" src="htmlarea/htmlarea.js"></script>
<script type="text/javascript" src="htmlarea/lang/gb.js"></script>
<script type="text/javascript" src="htmlarea/dialog.js"></script>
<script type="text/javascript" src="htmlarea/popupwin.js"></script>
<script type="text/javascript">
var editor = null;
function initEditor() {
  editor = new HTMLArea("replymessage");

  editor.generate();
  return false;
}
</script>
<body onload="initEditor()">
eot;
print <<< eot
<table width="550" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="18" bgcolor="#EEEEEE">$langagb[10]</td>
  </tr>
</table>
<table width="500" border="0" align="center" cellpadding="5" cellspacing="0">
  <tr> 
    <td height="22" valign="top">$langagb[11] $gname $langagb[12] $gsubtime<br>$langagb[13]<br>
      $gsubmessage 
      <form name="form" method="post" action="$tf?action=addreply">
        <p>$langagb[14]<br>
          　　　 
          <textarea name="replymessage" id="replymessage" cols="80" rows="20" wrap="VIRTUAL" >$greplymessage</textarea>
          <font color="#FF0000">*<br>
<input name="id" type="hidden" value="$id" > 　　　
<input name="pagenum" type="hidden" value="$pagenum" > 　　　

          <input type="submit" value="$langsubmit" >
          </font> 
          <input  type="reset" value="$langreset">
          <br>
        </p>
      </form>
  </tr>
</table>
eot;
require("footer.php");
}

if ($action=="addreply") {//添加回复
if ($gis_replied=="yes" && $nowuserid!=$greplyauthor && $nowuserid!=$username) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langagb[21]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
}
if (($replymessage=="") ) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langagb[15]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
}
$replymessage=minor_safe_convert($replymessage);
$replytime=time();
$all[$id]=$gname."|".$gsubtime."|".$gemail."|".$ghomepage."|".$gsubmessage."|".$gip."|".$grestrict."|yes|".$replytime."|".$replymessage."|".$nowuserid."\n";
$contents=implode('', $all);


writetofile("$dirblog/guestdata.php", $contents);
$go="index.php?job=guestbook&page=$pagenum";
require("header.php");
msg_box($langsuccess,"$langagb[16]<br><ul><li><a href= index.php?job=guestbook&page=$pagenum>$langback</a></li></ul><br><ul><li><a href= index.php>$langbacktoindex</a></li></ul>");
require("footer.php");
exit;
}

if ($action=="del") {//删除留言
if ($nowuserid!=$username) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langagb[22]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
}
if (strlen($gsubtime)==10) { //兼容新老时间数据
	$gsubtime=mktimezone($gsubtime);
	$gsubtime=date($langdatefomat, $gsubtime);
}
require("header.php");
print <<< eot
<table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="18" bgcolor="#EEEEEE">$langagb[17]</td>
  </tr>
</table>
<table width="500" border="0" align="center" cellpadding="5" cellspacing="0">
  <tr> 
    <td height="22" valign="top">$langagb[11] $gname $langagb[12] $gsubtime<br>$langagb[13]<br>
      $gsubmessage 
        <br>$langagb[18]<br>
      <form  method="post" action="$tf?action=remove">
        <p>
		   <input name="action" type="hidden" value="remove" > 
		   <input name="id" type="hidden" value="$id" >　　　 
          <input name="pagenum" type="hidden" value="$pagenum" > 　　　
		<input name="submit" type="submit" value="$langsure">
            <br>
        </p>
      </form>
</td>
  </tr>
</table>
eot;
}

if ($action=="remove") {//删除留言
if ($nowuserid!=$username) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langagb[22]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
}

$all[$id]="";
$contents=implode('', $all);
if ($contents=="") @unlink("$dirblog/guestdata.php");
else writetofile("$dirblog/guestdata.php", $contents);
	$go="index.php?job=guestbook&page=$pagenum";
	require("header.php");
msg_box($langsuccess,"$langagb[19]<br><ul><li><a href= index.php?job=guestbook&page=$pagenum>$langback</a></li></ul><br><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
require("footer.php");
exit;
}

?>