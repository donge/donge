<?
// Bo-Blog
// A Blog System based on PHP and text database
// Author: Bob Shen
// Official Site: http://www.bo-blog.com
// Email: bobshen@gmail.com
// All Rights Reserved.
// 版权所有，任何修改版权后使用传播之行为皆不允许
$opentb=1;
$dirtb="tblog";

require("global.php");

$isfound=0;
if (empty($tb_id)) $isfound=0;
else {
$tmpall=@file("$dirblog/list.php");
$countnum=count($tmpall);
$isfound=0;
for ($i=0; $i<$countnum; $i++) {
	$seid=explode("|",$tmpall[$i]);
	if ($seid[3]==$tb_id) {
		$arid=$seid[1];
		$isfound=1;
		$curri=$i;
		break;
	}
}
}

if ($isfound==0) {
header("Content-type:application/xml");
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?".">";
print <<<eot
<response>
<error>1</error>
<message>Invalid Trackback ID</message>
</response>
eot;
exit;
}

if (empty($excerpt)) {
header("Content-type:application/xml");
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?".">";
print <<<eot
<response>
<error>1</error>
<message>No Content Submitted</message>
</response>
eot;
exit;
}

if (empty($url) || !eregi("http://", $url)) {
header("Content-type:application/xml");
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?".">";
print <<<eot
<response>
<error>1</error>
<message>Invalid URI</message>
</response>
eot;
exit;
}

if ($c=="gb") {
	require ("include/mblog_iconv.php");
	$title=gb2utf ($title);
	$blog_name=gb2utf ($blog_name);
	$excerpt=gb2utf($excerpt);
}
elseif ($c=="big5") {
	require ("include/mblog_iconv.php");
	$title=big2utf ($title);
	$blog_name=big2utf ($blog_name);
	$excerpt=big2utf($excerpt);
}
else {}
$excerpt=preg_replace("/&(.+?);/is", "", $excerpt);
$link=strip_tags(safe_convert($url));
$title=strip_tags(safe_convert($title));
$description=strip_tags(safe_convert($excerpt));
$blog_name=strip_tags(safe_convert($blog_name));
if (checksensitive($description)) {
header("Content-type:application/xml");
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?".">";
print <<<eot
<response>
<error>1</error>
<message>Illeagal Words Found</message>
</response>
eot;
exit;
} 
$trackbacktime=time();

$toadd="<?die();?".">|$link|$blog_name|$title|$description|$trackbacktime|\n";
$isok=writetofile("$dirtb/$arid.tb", $toadd.@readfromfile("$dirtb/$arid.tb"));

$toadd2="<?die();?".">|$arid|$description|\n";
writetofile("$dirtb/tblist.php", $toadd2.@readfromfile("$dirtb/tblist.php"));
updatenewesttb();

//开始改变trackbacks总数
$seid[8]+=1;

//开始更新置顶

if (file_exists("blog/sticky.php")) include("blog/sticky.php");
if ($tmpall[$curri]==$sticky) $needchangeinsticky=1;

$tmpall[$curri]=implode("|",$seid);
$alltowr=implode("",$tmpall);
@copy ("$dirblog/list.php", "$dirblog/list.php.bak"); //自动备份重要的索引文件
writetofile("$dirblog/list.php", $alltowr);
$satmp=@file("$dirblog/list.php");
for ($i=0; $i<$howmanynewart; $i++) {
	$totmp1.=$satmp[$i];
}
writetofile("$dirblog/latest.php",$totmp1);

if ($needchangeinsticky==1) writetofile("blog/sticky.php", "<?\n\$sticky=\"".$tmpall[$curri]."\";\n\$announce=\"$announce\";");



if (!$isok) {
header("Content-type:application/xml");
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?".">";
print <<<eot
<response>
<error>1</error>
<message>Error in Writing Files</message>
</response>
eot;
exit;
} else {
header("Content-type:application/xml");
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?".">";
print <<<eot
<response>
<error>0</error>
</response>
eot;
exit;
}

