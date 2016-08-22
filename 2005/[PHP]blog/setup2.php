<?
// Bo-Blog
// A Blog System based on PHP and text database
// Author: Bob Shen
// Official Site: http://www.bo-blog.com
// Email: bobshen@gmail.com
// All Rights Reserved.
// 版权所有，任何修改版权后使用传播之行为皆不允许

//安装程序

@extract($_SERVER, EXTR_SKIP); 
@extract($_COOKIE, EXTR_SKIP); 
@extract($_SESSION, EXTR_SKIP); 
@extract($_POST, EXTR_SKIP); 
@extract($_FILES, EXTR_SKIP); 
@extract($_GET, EXTR_SKIP); 
@extract($_ENV, EXTR_SKIP); 

error_reporting(E_ERROR | E_WARNING | E_PARSE);

$thisprog="setup2.php";

$error[0]="环境检测的结果显示，您的空间并不完全适合安装本程序，或者您的设置有误。如果继续安装，可能导致程序不可正常使用。<br>環境檢測的結果顯示，您的伺服器並不完全適合安裝本程式，或者您的設置有誤。如果繼續安裝，可能導致程式不可正常使用。<br>Check result shows that the configuration of your server or your settings may cause the program to run in an unwanted way. If you continue the installation, the program may work abnormally.";
$error[1]="我知道了 | 我知道了 | I have read this";
$error[2]="确定 | 確認 | Submit";
$error[3]="继续 | 繼續 | Continue";

if (!$step) {
	$checkdisplaycn=array("PHP版本高于4.1.0", "支持COOKIE", "全局变量", "文件夹 blog/ 属性", "文件夹 up/ 属性", "文件夹 tblog/ 属性", "文件夹 temp/ 属性", "文件夹 drafts/ 属性", "文件夹 p/ 属性", "没有运行在安全模式下");
	$checkdisplaytw=array("PHP版本高於4.1.0", "支援COOKIE", "全局變數", "資料夾 blog/ 權限", "資料夾 up/ 權限", "資料夾 tblog/ 權限", "資料夾 temp/ 權限", "資料夾 drafts/ 權限", "資料夾 p/ 權限", "沒有運行在安全模式下");
	$checkdisplayen=array("PHP version higher than 4.1.0", "COOKIE Enabled", "Global Variables", "DIR blog/ writable", "DIR up/ writable", "DIR tblog/ writable", "DIR temp/ writable", "DIR drafts/ writable", "DIR p/ writable", "Not Running in PHP Safe Mode");
	
	$yourphp=PHP_VERSION;
	if ($yourphp<"4.1.0")  $checkitem[0]=0; 
	else $checkitem[0]=1;
	if (isset($_COOKIE)) $checkitem[1]=1; 
	else $checkitem[1]=0;
	if (isset($_GET)) $checkitem[2]=1; 
	else $checkitem[2]=0;
	list ($checkitem[3], $checkitem[4], $checkitem[5], $checkitem[6], $checkitem[7], $checkitem[8])=test_writable(array('blog', 'up', 'tblog', 'temp', 'drafts', 'p'));
	if (@ini_get('safe_mode') == 1) $checkitem[9]=0;
	else $checkitem[9]=1;

	for ($i=0; $i<count($checkdisplaycn); $i++) {
		$echoprint.="$checkdisplaycn[$i] <br>$checkdisplaytw[$i] &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;";
		if ($checkitem[$i]==1) $echoprint.="<b><font color=green>Passed</font></b><br>";
		else $echoprint.="<b><font color=red>Failed</font></b><br>";
		$echoprint.="$checkdisplayen[$i]<br><br>";
	}
	
	$echoprint.="<form action='$thisprog' method=post><input type=hidden name=step value=2>";
	if (in_array (0, $checkitem)) $echoprint.="<b>{$error[0]}</b><br><input type=checkbox name=continue value=1>{$error[1]}<br>";
	else $echoprint.="<input type=hidden name=continue value=1>";
	$echoprint.="<div align=center><input type=submit value='{$error[3]}'></div>";

	create_box ("环境检测 | 環境檢測 | Environment Check", $echoprint, 1);

}


function test_writable ($array) {
	for ($i=0; $i<count($array); $i++) {
		$fp=@fopen("{$array[$i]}/test.php","w");
		if ($fp) $out[]=1;
		else $out[]=0;
	}
	return $out;
}

function create_box ($title, $mainbody, $step) {
	$totalsteps=6;
@header("Content-Type: text/html; charset=utf-8");
print <<<eot
<html>
<head>
<title>Bo-Blog 安装程序 | Bo-Blog 安裝程式 | Bo-Blog Installation</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
<!--
td,body,input,select {
	font-family: "Tahoma";
	font-size: 9pt;
	color: #000000;
	text-decoration: none;
}
body {
	background-color: #FFFFFF;
a {
	font-family: "Tahoma";
	font-size: 9pt;
	color: #000000;
	text-decoration: none;
}
-->
</style>
</head>
<body>
<table width=90% align=center cellpadding=3 cellspacing=1 style="border: 1px solid #CCCCCC";><tr><td align=center>Bo-Blog 安装程序 | Bo-Blog 安裝程式 | Bo-Blog Installation</td></tr></table><br>
eot;
	echo "<table width=90% align=center cellpadding=3 cellspacing=1><tr><td bgcolor=#EEEEEE><b>$title</b></td></tr>";
	echo "<tr><td bgcolor=#FFFFFF height=120 valign=middle>$mainbody</td></tr>";
	echo "<tr><td bgcolor=#EEEEEE align=right>步骤 | 步驟 | Step <b>{$step}/</b>{$totalsteps}</td></tr></table>";
	echo "</body></html>";
}

