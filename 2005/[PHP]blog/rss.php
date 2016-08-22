<?
require("global.php");
header("Content-type:application/xml");
echo '<?xml version="1.0" encoding="UTF-8" ?'.'>';
print <<< eot
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns="http://purl.org/rss/1.0/">
<channel rdf:about="$weburl">
 <title>$blogname</title> 
  <link>$weburl/index.php</link> 
  <description>$blogdc</description> 
  <image rdf:resource="$logofile" /> 
<items>
<rdf:Seq>
<rdf:li resource="$webnurl" /> 
<rdf:li resource="$weburl/index.php" /> 
</rdf:Seq>
</items>
</channel>
<image rdf:about="$logofile">
<title>$blogname</title> 
<link>$wenurl</link> 
<url>$logofile</url> 
</image>
eot;
$all=@file("$dirblog/latest.php");
for ($i=0; $i<count($all); $i++) {
$tmp=explode("|", $all[$i]);
if ($tmp[9]==1 || $tmp[9]==3) $co=$langhidden;
else $co=getrsscontent("$dirblog/$tmp[1].art");
$wrong="$weburl/index.php?articleid=$tmp[1]";
$tmp[2]=eregi_replace("&nbsp;","",$tmp[2]);

print <<< eot
<item rdf:about='$wrong'>
<title>$tmp[2]</title> 
<link>$wrong</link> 
<description>
<![CDATA[ 
	$co
	<br>   (<a href=$wrong target=_blank> $langwebbrowse </a>)
  ]]> 
</description>
</item>
eot;
}
echo "</rdf:RDF>";
?>