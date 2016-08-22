<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$bloglang/gbook.lang.php"); //引入语言包


$tf="guestbook.php";
$t -> set_file("gbbody", "blog/template/$tem/guestbook.htm");


if ($allowvisitorreply==1) {
$ubbextension=<<<eot
<script type="text/javascript" src="img/module.js"></script>
<select name="colorsel" onchange="ginsert('[color='+options[this.selectedIndex].value+'][/color]')"><option value="" selected>$langreply[17]</option><option style="color: blue" value="blue">$langreply[18]</option> <option style="color: orange" value="orange">$langreply[19]</option> <option style="color: crimson" value="crimson">$langreply[20]</option> <option style="color: red" value="red">$langreply[21]</option> <option style="color: green" value="green">$langreply[22]</option> <option style="color: deeppink" value="deeppink">$langreply[23]</option>  <option style="color: purple" value="purple">$langreply[24]</option> </select> <a href="javascript: ginsert('[b] [/b]')"><img src="img/b.gif" alt="$langreply[25]" border="0"/></a> <a href="javascript: ginsert('[i] [/i]')"><img src="img/i.gif" alt="$langreply[26]" border="0"/></a> <a href="javascript: ginsert('[u] [/u]')"><img src="img/u.gif" alt="$langreply[27]" border="0"/></a> <a href="javascript: ginsert('[url][/url]')"><img src="img/url.gif" alt="$langreply[28]" border="0"/></a> <a href="javascript: ginsert('[hr]')"><img src="img/hr.gif" alt="$langreply[29]" border="0"/></a> <a href="javascript: ginsert('[quote] [/quote]')"><img src="img/quote.gif" alt="$langreply[30]" border="0"/></a> <br/>
eot;
include ("blog/emotcache.php");
$emots="<br/>".$guestemots;
if ($validation==1) {
	$codec=rand(1001, 9999);
	$ccodec=md5($codec);
	$codec=getvnimg($codec);
	$validc="$langgb[24] <input name=\"codec\" type=\"text\" value=\"\" maxlength=\"4\" size=\"4\" /> $codec <input name=\"ccodec\" type=\"hidden\" value=\"$ccodec\" /><br/>";
}
$t -> set_block("gbbody", "submitform");
$t -> set_var(array("gbaction"=>"$tf?action=add", "gbname"=>$langgb[0], "nowuserid"=>$nowuserid, "gbpage"=>$langgb[1], "nowuserhomepage"=>$nowuserhomepage, "gbmail"=>$langgb[2], "nowuseremail"=>$nowuseremail, "gbcontent"=>$langgb[3], "gbonly"=>$langgb[4], "submit"=>$langgb[5], "clear"=>$langgb[6],"ubbextension"=>$ubbextension, "emots"=>$emots, "noubb"=>$langgb[23], "validation"=>$validc,)); 
$submitformpart=$t -> subst("submitform"); 

}

$firstid=($page-1)*$guestperpage;
unset($all);
$all=@yafile("$dirblog/guestdata.php");
if ($all!=0) {
$t -> set_block("gbbody", "gbmain", "{gbmains}");

if (($firstid+$guestperpage-1)>(count($all)-1)) {	$endid=count($all)-1;} else {$endid=$firstid+$guestperpage-1;}
for ($i=$firstid; $i<=$endid; $i++) {
	$id=$i;
	list ($gname, $gsubtime, $gemail, $ghomepage, $gsubmessage, $gip, $grestrict, $gis_replied, $greplytime, $greplymessage, $greplyauthor)=explode("|", $all[$i]); 
	if ($login_status==1) $gip2=" | ".$gip;
	if ($login_status==0) $gip=$langgb[7];
	if ($grestrict==1 && $login_status==0)  {$gemail=$langgb[7]; $ghomepage=$langgb[7];
	$gsubmessage="<strong>$langgb[8]</strong>";}
	$gsubmessage=decode($gsubmessage,"small",1);
	if ($gemail) {
		$defaultgravatar=urlencode("$weburl/img/gravatar.jpg");
		$grav_url="http://www.gravatar.com/avatar.php?gravatar_id=".md5($gemail)."&amp;default=$defaultgravatar";
		$gravatar="<a href=\"$grav_url\" target=\"_blank\"><img src=\"$grav_url\" alt=\"Gravatar\" align=\"left\" width=\"40\" style=\"border: 1px solid #000\" /></a>";
	} else {
		$gravatar='';
	}
	if ($protectemailaddress==1) $gemail=emailconvert($gemail);
	if ($showgravatar==1) {
		$gsubmessage=multi_str_replace(array("{chr1}"=>$gsubmessage, "{chr2}"=>$gravatar), $parts['gravatar']);
	}
	if ($gis_replied=="yes") {
		$greplymessage=decode($greplymessage,"full");
		if (strlen($greplytime)==10) { //兼容新老时间数据
		$greplytime=mktimezone($greplytime);
		$greplytime=date($langdatefomat, $greplytime);
		}
		if (trim($greplyauthor)=="") $greplyauthor=$owner;
		$replytimeinfo=$greplyauthor.' '.$langgb[9].$greplytime;
		$t -> set_var(array("replytimeinfo"=>$replytimeinfo, "greplymessage"=>$greplymessage, "ifshow"=>"block")); 
	} else {
		$t -> set_var(array("replytimeinfo"=>"", "greplymessage"=>"","ifshow"=>"none")); 
	}
	if (strlen($gsubtime)==10) { //兼容新老时间数据
		$gsubtime=mktimezone($gsubtime);
		$gsubtime=date($langdatefomat, $gsubtime);
	}
	$whoandwhen="$gname ($gsubtime{$gip2})";
	$altmail=getstr($gname,$langgb[10]);
	$altpage=getstr($gname,$langgb[11]);
	$urlreply="$tf?action=reply&amp;id=$id&amp;pagenum=$page";
	$altreply=$langgb[12];
	$urldel="$tf?action=del&amp;id=$id&amp;pagenum=$page";
	$altdel=$langgb[13];
	$t -> set_var(array("whoandwhen"=>$whoandwhen, "gemail"=>$gemail, "altmail"=>$altmail, "ghomepage"=>$ghomepage, "altpage"=>$altpage, "urlreply"=>$urlreply, "altreply"=>$altreply, "urldel"=>$urldel, "altdel"=>$altdel, "gip"=>$gip, "gsubmessage"=>$gsubmessage,"langgb01"=>$langgb[18],"langgb02"=>$langgb[19],"langgb03"=>$langgb[20], "langgb04"=>$langgb[21],"langgb05"=>$langgb[22], "gravatar"=>$gravatar, "grav_url"=>$grav_url));
	$gbmainpart.=$t->parse ("gbmains","gbmain",true);
	}
}

$totalpages=floor((count($all)-1)/$guestperpage)+1;
$currentpage=$page;
if ($currentpage<>1) {$glast="<a href=\"index.php?job=guestbook&amp;page=".strval($currentpage-1)."\">$langgb[14]</a>";}
else {$glast="";}
if ($currentpage<>$totalpages) $gnext="<a href=\"index.php?job=guestbook&amp;page=".strval($currentpage+1)."\">$langgb[15]</a>";
else {$gnext="";}
$pagepart1="$langgb[16] $currentpage/$totalpages";

$pagepart2=" $glast	$gnext ";
if ($fixmozillabug==1 && $is_mozilla==0) {
	$pagepart2.="<input type=\"text\" name=\"jumptopage\" size=\"1\"  onKeyDown=\"javascript: if(window.event.keyCode == 13) window.location='index.php?job=guestbook&page='+this.value;\">";
}
$gbtitle=getstr($owner, $langgb[17]);
$t -> set_block("gbbody", "gbfile");
$t->set_var(array("pagepart1"=>$pagepart1, "pagepart2"=>$pagepart2, "gbmainpart"=>$gbmainpart,"submitformpart"=>$submitformpart,"gbtitle"=>$gbtitle,));
$noall=$t->subst("gbfile");
$t->set_var(array("mainbodyout"=>$noall));