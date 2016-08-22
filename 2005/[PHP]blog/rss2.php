<?
require("global.php");
$howmanyrss=10;

header("Content-type:application/xml");
echo '<?xml version="1.0" encoding="UTF-8" ?>';
if ($logid) {
	$tmp=locatedata("$dirblog/list.php", $logid);
	if (!$tmp) exit();
	if ($tmp[9]==1 || $tmp[9]==3) $co=$langhidden;
	else $co=getrsscontent("$dirblog/$tmp[1].art");
	$wrong="$weburl/index.php?job=art&amp;articleid=$tmp[1]";
	$tmp[2]=eregi_replace("&nbsp;","",$tmp[2]);
	$tmp[3]=date("r",($tmp[3]+$timezone*3600));
print <<< eot
<rss version="2.0">
<channel>
 <title>$tmp[2] - $blogname</title> 
  <link>$weburl/index.php?job=art&amp;articleid=$logid</link> 
  <description>$tmp[2]</description> 
<language>zh-cn</language> 
  <copyright>$versioninfo</copyright>
  <image>
 <title>$blogname</title> 
 <url>$logofile</url>
 <link>$weburl</link>
 <description>$blogdc</description>
 </image>
<item>
<link>$wrong</link>
<title>$tmp[2]</title> 
<author>$username &lt;$useremail&gt;</author>
<category>$catdess</category>
<pubDate>$tmp[3]</pubDate> 
 <guid>$wrong</guid> 
<description>
<![CDATA[ 
	$co
	<br>   (<a href=$wrong target=_blank> $langwebbrowse </a>)
  ]]> 
</description>
</item>
eot;
	if ($tmp[5]!=0 && file_exists("$dirblog/$logid.rep")) {
		unset ($stmp);
		$stmp=@file("$dirblog/$logid.rep");
		$areply=@readfromfile("$dirblog/$logid.rpl");
		$tmpreply=@explode("\n|rep|", $areply);
		$countreps=min ($tmp[5], $repperpage);
		for ($i=0; $i<$countreps;$i++) {
			$rep=explode("|",$stmp[$i]);
			$replyauthorandemail=@explode("θθ", $rep[2]);
			$replyauthor=trim($replyauthorandemail[0]);
			if ($replyauthorandemail[1]=='') $replyauthorandemail[1]='unknown@unknown.com';
			$rep[3]=date("r", mktimezone($rep[3]));
			$replytime=date($langdatefomat, $rep[3]);
			$reply=stripslashes(getreply($tmpreply[$i]));
			if ($rep[6]=="y") {
				$adminreplytime=date($langdatefomat, mktimezone($rep[7]));
				$adminreplycontent=stripslashes($rep[8]);
				$adminreplycontent=ereg_replace("<br>",'<br />',$adminreplycontent);
				$reply.="<b>{$username} $langrss[0]</b>[$adminreplytime]<br/>$adminreplycontent";
			}
print <<< eot
<item>
<link>$wrong</link>
<title>$tmp[2] - $replyauthor $langrss[1]</title> 
<author>$replyauthor &lt;$replyauthorandemail[1]&gt;</author>
<category>$catdess</category>
<pubDate>$rep[3]</pubDate> 
 <guid>$wrong</guid> 
<description>
<![CDATA[ 
	$reply
	<br>   (<a href="$wrong#comment" target="_blank"> $langwebbrowse </a>)
  ]]> 
</description>
</item>
eot;
		}
	}
	echo "</channel>
</rss>";
	exit();
}
		
print <<< eot
<rss version="2.0">
<channel>
 <title>$blogname</title> 
  <link>$weburl/index.php</link> 
  <description>$blogdc</description> 
<language>zh-cn</language> 
  <copyright>$versioninfo</copyright>
  <image>
 <title>$blogname</title> 
 <url>$logofile</url>
 <link>$weburl</link>
 <description>$blogdc</description>
 </image>
eot;

$validcounter=0;
$all=@yafile("$dirblog/list.php");
for ($i=0; $i<count($all); $i++) {
$tmp=explode("|", $all[$i]);
if ($tmp[4]==$catid || $catid=='') {
	$validall[]=$all[$i];
	$validcounter+=1;
}
if ($validcounter==$howmanyrss) break;
}

if ($catid=='') $catdess=$blogname;
else {
	$navall=@file("$dirblog/cat.php");
	for ($i=0;$i<count($navall); $i++) {
		$navtmp=explode("|",$navall[$i]);
		$navt2=$navtmp[1];
		$categories[$navt2]=$navtmp[2];//获取分类数组
	}
	$catdess=$categories[$catid];
}


for ($i=0; $i<count($validall); $i++) {
$tmp=explode("|", $validall[$i]);
if ($tmp[9]==1 || $tmp[9]==3) $co=$langhidden;
else $co=getrsscontent("$dirblog/$tmp[1].art");
$wrong="$weburl/index.php?job=art&amp;articleid=$tmp[1]";
$tmp[2]=eregi_replace("&nbsp;","",$tmp[2]);
$tmp[3]=date("r",($tmp[3]+$timezone*3600));

print <<< eot
<item>
<link>$wrong</link>
<title>$tmp[2]</title> 
<author>$username &lt;$useremail&gt;</author>
<category>$catdess</category>
<pubDate>$tmp[3]</pubDate> 
 <guid>$wrong</guid> 
<description>
<![CDATA[ 
	$co
	<br>   (<a href=$wrong target=_blank> $langwebbrowse </a>)
  ]]> 
</description>
</item>
eot;
}

echo "</channel>
</rss>";
?>