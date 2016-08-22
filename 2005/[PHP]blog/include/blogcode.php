<?
function decode ($code, $mode, $antispam=0) {
global $updir, $autoaddlink, $htmlmode, $langcode, $login_status, $guest_login,$protectemailaddress;
$code=trim($code);
$code=ereg_replace("\n",'<br/>',$code); 
$code=ereg_replace("<br>",'<br/>',$code); 
$code=preg_replace("/\\t/is","  ",$code); 
$code=stripslashes($code);
$code=str_replace('[^upload^]', 'up' ,$code); //兼容老数据中的up文件夹
$code=str_replace('[separator]', '' ,$code);
$code=str_replace('&line;','|',$code);
$code=str_replace('&thita;','θ',$code);
$code=str_replace('&leftsign;','{ ',$code);
$code=str_replace('&rightsign;',' }',$code);
if (file_exists('blog/wordreplace.php')) {
	include('blog/wordreplace.php');
	while ($bag=each ($eachreplacer)) {
		$code=str_replace($bag['key'], $bag['value'], $code);
	}
}
if ($autoaddlink==1) $code=autourl($code); 
$code=preg_replace("/\[u\](.+?)\[\/u\]/is","<u>\\1</u>",$code); 
$code=preg_replace("/\[b\](.+?)\[\/b\]/is","<strong>\\1</strong>",$code); 
$code=preg_replace("/\[i\](.+?)\[\/i\]/is","<em>\\1</em>",$code); 
$code=preg_replace("/\[strike\](.+?)\[\/strike\]/is","<strike>\\1</strike>",$code); 
$code =str_replace('[hr]','<hr width="95%" />',$code);
$code=preg_replace("/\[ed\]([^t]*)\[\/ed\]/is","<a href=\"\\1\">\\1</a>",$code);
$code=preg_replace("/\[email\]([^\[]*)\[\/email\]/is", "<a href=\"mailto:\\1\">\\1</a>", $code); 
$code =preg_replace("/\[emot\]([^ ]+?)\[\/emot\]/is","<img src=\"img/emot/\\1.gif\" alt=\"Emotion\"/>",$code);
if ($antispam==0) {
	$code=preg_replace("/\[url\]([^\[]*)\[\/url\]/ise","'<a href=\"\\1\" target=\"_blank\">'.shortenurl('\\1').'</a>'",$code);
	$code=preg_replace("/\[url=([^\[]*)\]([^\[]*)\[\/url\]/is",	"<a href=\"\\1\" target=\"_blank\">\\2</a>", $code);
} else {
	$code=preg_replace("/\[url\]([^\[]*)\[\/url\]/ise","'<a href=\"\\1\" rel=\"nofollow\" target=\"_blank\">'.shortenurl('\\1').'</a>'",$code);
	$code=preg_replace("/\[url=([^\[]*)\]([^\[]*)\[\/url\]/is",	"<a href=\"\\1\" rel=\"nofollow\" target=\"_blank\">\\2</a>", $code);
}
$code=preg_replace("/\[color=(.+?)\](.+?)\[\/color\]/is","<span style=\"color: \\1\">\\2</span>",$code); 
$code=preg_replace_callback("/\[size=(.+?)\](.+?)\[\/size\]/is",'makefontsize', $code); 
$code=preg_replace("/\[font=(.+?)\](.+?)\[\/font\]/is","<span style=\"font-family: \\1\">\\2</span>",$code); 
$code=preg_replace("/\[sup\](.+?)\[\/sup\]/is","<sup>\\1</sup>",$code); 
$code=preg_replace("/\[sub\](.+?)\[\/sub\]/is","<sub>\\1</sub>",$code); 
$code=preg_replace("/\[quote\](.+?)\[\/quote\]/is","<table width=\"90%\" align=\"center\" cellpadding=\"4\" cellspacing=\"0\" ><tr><td>$langcode[2]<hr width=\"100%\" align=\"center\"/>\\1<hr width=\"100%\" align=\"center\"/></td></tr></table>", $code); 

if ($mode!="small") 
{
if ($login_status!=1 && $guest_login!=1) $code=preg_replace("/\[hide\](.+?)\[\/hide\]/is","<div align=\"center\"><hr width=\"100%\">$langcode[4]<hr width=\"100%\"></div>",$code); 
else $code=preg_replace("/\[hide\](.+?)\[\/hide\]/is","\\1",$code); 
if ($login_status!=1) $code=preg_replace("/\[admin\](.+?)\[\/admin\]/is","<div align=\"center\"><hr width=\"100%\">$langcode[5]<hr width=\"100%\"></div>",$code); 
else $code=preg_replace("/\[admin\](.+?)\[\/admin\]/is","\\1",$code); 
$code=str_replace('[p]','<p>',$code);
$code=str_replace('[/p]','</p>',$code);
$code=preg_replace("/\[p align=(.)\]/is","<p align=\"\\1\">",$code);
$code=preg_replace("/\[left\](.+?)\[\/left\]/is","<div align=\"left\">\\1</div>",$code); 
$code=preg_replace("/\[center\](.+?)\[\/center\]/is","<div align=\"center\">\\1</div>",$code); 
$code=preg_replace("/\[right\](.+?)\[\/right\]/is","<div align=\"right\">\\1</div>",$code); 
$code = preg_replace("/(\[url=)(\S+?)(\])(\[img align=L\])(\S+?)(\[\/img\])(\[\/url\])/is","<a target=\"_blank\" href=\"\\2\"><img src=\"\\5\" border=\"0\" align=\"left\" onload=\"if(this.width>450) {this.resized=true; this.width=450;}\" alt=\"Image\"/></a>",$code);
$code = preg_replace("/(\[url=)(\S+?)(\])(\[img align=M\])(\S+?)(\[\/img\])(\[\/url\])/is","<a target=\"_blank\" href=\"\\2\"><img src=\"\\5\" border=\"0\" onload=\"if(this.width>450) {this.resized=true; this.width=450;}\"  alt=\"Image\"/></a>",$code);
$code = preg_replace("/(\[url=)(\S+?)(\])(\[img align=R\])(\S+?)(\[\/img\])(\[\/url\])/is","<a target=\"_blank\" href=\"\\2\"><img src=\"\\5\" border=\"0\" align=\"right\" onload=\"if(this.width>450) {this.resized=true; this.width=450;}\"  alt=\"Image\"/></a>",$code);
$code = preg_replace("/(\[url=)(\S+?)(\])(\[img align=F\])(\S+?)(\[\/img\])(\[\/url\])/is","<a target=\"_blank\" href=\"\\2\"><img src=\"\\5\" border=\"0\" width=\"400\"  alt=\"Image\"/></a>",$code);

$code = preg_replace("/(\[img align=)(L|R)( height=)(.+?)( width=)(.+?)(\])(\S+?)(\[\/img\])/is","<a target=\"_blank\" href=\"\\8\"><img src=\"\\8\" border=\"0\" align=\"\\2\" height=\"\\4\" width=\"\\6\" alt=\"Image\"/></a>",$code);

$code=preg_replace("/\[img align=L\]\s*(\S+?)\s*\[\/img\]/is","<a href=\"\\1\" target=\"_blank\"><img src=\"\\1\" alt=\"$langcode[0]\" border=\"0\" align=\"left\" onload=\"if(this.width>450) {this.resized=true; this.width=450;}\"/></a>",$code);
$code=preg_replace("/\[img align=M\]\s*(\S+?)\s*\[\/img\]/is","<a href=\"\\1\" target=\"_blank\"><img src=\"\\1\" alt=\"$langcode[0]\" border=\"0\" onload=\"if(this.width>450) {this.resized=true; this.width=450;}\"/></a>",$code);
$code=preg_replace("/\[img align=R\]\s*(\S+?)\s*\[\/img\]/is","<a href=\"\\1\" target=\"_blank\"><img src=\"\\1\" alt=\"$langcode[0]\" border=\"0\" align=\"right\" onload=\"if(this.width>450) {this.resized=true; this.width=450;}\"/></a>",$code);
$code=preg_replace("/\[img align=F\]\s*(\S+?)\s*\[\/img\]/is","<a href=\"\\1\" target=\"_blank\"><img src=\"\\1\" alt=\"$langcode[0]\" border=\"0\" width=\"400\"/></a>",$code);

$code=preg_replace("/(\[swf width=)(.+?)( height=)(.+?)(\])(.+?)(\[\/swf\])/is","<a href=\"\\6\" target=_blank>$langcode[1]</a><br><OBJECT classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version==6,0,29,0\" width=\\2 height=\\4><PARAM NAME=PLAY VALUE=TRUE><PARAM NAME=LOOP VALUE=TRUE><PARAM NAME=MOVIE VALUE=\"\\6\"><PARAM NAME=QUALITY VALUE=HIGH><embed src=\"\\6\" quality=high pluginspage=\"http://www.macromedia.com/go/getflashplayer\" type=\"application/x-shockwave-flash\"></embed></OBJECT>",$code);
$code=preg_replace("/(\[wmp width=)(.+?)( height=)(.+?)(\])(.+?)(\[\/wmp\])/is", "<OBJECT ID=\"MediaPlayer\" width=\"\\2\" height=\"\\4\" CLASSID=\"CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6\" Standby=\"正在启动 Microsoft Windows Media Player...\"><param  name=AudioStream  value=-1>	<param  name=AutoSize  value=0> <param  name=AutoStart  value=0>	<param  name=AnimationAtStart  value=0><param  name=Balance  value=0><param  name=EnableContextMenu  value=0><param name=\"AllowChangeDisplaySize\" value=\"False\">	<param  name=url  value=\"\\6\"><param  name=ShowCaptioning  value=0><param  name=ShowAudioControls  value=1><param  name=ShowControls  value=1>	<param  name=ShowDisplay  value=0> <param  name=ShowStatusBar  value=-1> </OBJECT>", $code);
$code=preg_replace("/(\[real width=)(.+?)( height=)(.+?)(\])(.+?)(\[\/real\])/is", "<embed src=\"\\6\" type='audio/x-pn-realaudio-plugin' controls='imagewindow,StatusBar,ControlPanel' autostart=\"0\" width=\"\\2\" height=\"\\4\" ></embed>", $code);
$code=preg_replace("/\[code\](.+?)\[\/code\]/is", "<table width=\"90%\" align=\"center\" cellpadding=\"4\" cellspacing=\"0\"  style=\"font:Courier New;font-size:8pt\"><tr><td>$langcode[3]</td></tr><tr><td style=\"border:1px solid #CCCCCC; font-family: Courier New\">\\1</td></tr></table>", $code);
}
if ($protectemailaddress==1) $code=emailconvert($code);
return $code;
}


function autourl($messagetext) {   
  //-----Auto URL Converter-----------
    $urlSearchArray = array(
      "/([^]_a-z0-9-=\"'\/])((https?|ftp|mms|gopher|rtsp|pnm|news|telnet):\/\/|www\.)([^ \r\n\(\)\*\^\$!`\"'\|\[\]\{\}<>]*)/si",
      "/^((https?|ftp|mms|gopher|rtsp|pnm|news|telnet):\/\/|www\.)([^ \r\n\(\)\*\^\$!`\"'\|\[\]\{\};<>]*)/si"
    );
    $urlReplaceArray = array( 
     "\\1[url]\\2\\4[/url]",  
    "[url]\\1\\3[/url]" 
   );
	$text = preg_replace($urlSearchArray, $urlReplaceArray, $messagetext);
  return $text;
}

function makefontsize ($matches) {
$sizeitem=array (0, 8, 10, 12, 14, 18, 24, 36); 
return "<span style=\"font-size: ".$sizeitem[$matches[1]]."pt\">$matches[2]</span>";
}
?>
