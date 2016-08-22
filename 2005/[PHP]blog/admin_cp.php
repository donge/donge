<?
// Bo-Blog
// A Blog System based on PHP and text database
// Author: Bob Shen
// Official Site: http://www.bo-blog.com
// Email: bobshen@gmail.com
// All Rights Reserved.
// 版权所有，任何修改版权后使用传播之行为皆不允许

$tf="admin_cp.php";
require("global.php");
if ($job!="stick") require_once("header.php");

if ($login_status==0 && !($job=="change" && $action=="selflink")) {
	msg_box($langerror,"$langerrornotlogin <br><ul><li><a href=login.php>$langnowlogin</a></li></ul><br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
	exit;
}

if ($login_status==1 && $nowuserid!=$username && $job!="stick" && $job!="upload") {
	msg_box($langerror,"$langerroronlyadmin <br><ul><li><a href=login.php>$langnowlogin</a></li></ul><br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
	exit;
}



if (empty($job)) $job="change";
if (file_exists("admin/$job.php")) include("admin/$job.php");

?>