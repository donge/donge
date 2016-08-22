<?
require("global.php");
header("Content-type:application/xml");
echo '<?xml version="1.0" encoding="UTF-8"'.' ?>';
$modtime=date("Y-n-j\TH:i:s\Z", filemtime("$dirblog/list.php"));
print <<< eot
<feed version="0.3" xml:lang="zh-cn" xmlns="http://purl.org/atom/ns#">
<title type="text/plain">
<![CDATA[ $blogname ]]> 
 </title>
 <tagline type="text/plain">
<![CDATA[ $blogdc  ]]> 
 </tagline>
<link rel="alternate" type="text/html" href="$weburl/index.php" title="Atom feed" /> 
<author>
<name>
<![CDATA[ $username ]]> 
</name>
<url>
<![CDATA[ $weburl/ ]]> 
</url>
<email>
<![CDATA[ $useremail  ]]> 
</email>
</author>
<id>
<![CDATA[ $weburl/atomfeed.php  ]]> 
</id>
<generator url="$weburl/" version="0.3">Blog Atom Feed</generator> 
<copyright type="text/plain" mode="escaped">
<![CDATA[ $versioninfo, All rights reserved.  ]]> 
</copyright>
<modified>$modtime</modified>
eot;

$all=@file("$dirblog/latest.php");
for ($i=0; $i<count($all); $i++) {
$tmp=explode("|", $all[$i]);
if ($tmp[9]==1 || $tmp[9]==3) {$co=$langhidden;
$co2=$langhidden;
}
else {$co=getrsscontent("$dirblog/$tmp[1].art");
$co2=msubstr($co,0,20)."...";
}
$wrong="$weburl/index.php?job=art&amp;articleid=$tmp[1]";
$tmp[2]=eregi_replace("&nbsp;","",$tmp[2]);
$tmp[3]=date("Y-n-j\TH:i:s\Z",($tmp[3]+$timezone*3600));

print <<< eot
<entry>
<title type="text/plain" mode="escaped">$tmp[2]</title>
<link rel="alternate" type="text/html" href="$wrong" title="Web Page" />
<link rel="source" type="text/html" href="$wrong" title="Web Page" /> 
<author>
<name>
<![CDATA[ $username ]]> 
</name>
<url>
<![CDATA[ $wrong ]]> 
</url>
<email>
<![CDATA[ $useremail  ]]> 
</email>
</author>
<id>
<![CDATA[ $wrong  ]]> 
</id>
<modified>$tmp[3]</modified> 
<issued>$tmp[3]</issued> 
<created>$tmp[3]</created> 
<summary type="text/plain" mode="escaped">
<![CDATA[ $co2 ]]> 
</summary>
<content type="text/html" mode="escaped">
<![CDATA[ $co  ]]> 
</content>
</entry>
eot;
}

echo "</feed>";
?>
