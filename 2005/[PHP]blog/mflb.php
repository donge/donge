<?
require("global.php");
header("Content-type:application/xml");
echo '<?xml version="1.0" encoding="UTF-8" ?>';
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

$curtime1=getstr($blogname, $langlbin);
$curtime2=mktimezone(mktime());
print <<< eot
<item>
<link>$weburl/index.php</link>
<title>$curtime1</title> 
<author>$username</author>
<category>Latest</category>
<pubDate>$curtime2</pubDate> 
 <guid>$weburl/index.php</guid> 
<description>
<![CDATA[ 
	Index
	<br>   (<a href=$weburl/index.php target=_blank> $langwebbrowse </a>)
  ]]> 
</description>
</item>
eot;

$all=@file("$dirblog/latest.php");
for ($i=0; $i<count($all); $i++) {
$tmp=explode("|", $all[$i]);
$wrong="$weburl/index.php?job=art&amp;articleid=$tmp[1]";
$tmp[2]=eregi_replace("&nbsp;","",$tmp[2]);
$tmp[3]=mktimezone($tmp[3]);

print <<< eot
<item>
<link>$wrong</link>
<title>$tmp[2]</title> 
<author>$username</author>
<category>Latest</category>
<pubDate>$tmp[3]</pubDate> 
 <guid>$wrong</guid> 
<description>
<![CDATA[ 
	$tmp[2]
	<br>   (<a href=$wrong target=_blank> $langwebbrowse </a>)
  ]]> 
</description>
</item>
eot;
}

echo "</channel>
</rss>";
?>