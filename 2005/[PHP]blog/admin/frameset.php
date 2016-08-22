<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$blogadminlang/admincp.lang.php"); //引入语言包

$tf="admin_cp.php?job=frameset";


if (empty($action))  {
$alljobs=array ("main", "listall","showcat","art","seereply","guestbook","showsearch","showday","seetb","listlinks", "register", "userlist", "gallery", "archive", "statistics"); 
if (empty ($myframe)) $myframe="1-1-1-0-0-1-1-1-0-0-1-1-0-1-1";
$allframes=explode("-", $myframe);
$alljobdes=array ($langafs[0],$langafs[2],$langafs[3],$langafs[4],$langafs[5],$langafs[6],$langafs[7],$langafs[8],$langafs[9],$langafs[10],$langafs[11],$langafs[12],$langafs[13],$langafs[14]);

function buttongen ($value) {
	global $langafs;
	if ($value==1) {
		return "<option value=1 selected>$langafs[15]</option><option value=0>$langafs[16]</option>";
	} else {
		return "<option value=1>$langafs[15]</option><option value=0 selected>$langafs[16]</option>";
	}
}

for ($i=0; $i<sizeof($alljobdes); $i++) {
	$putfr.="<tr bgcolor=#FFFFFF><td><input type=hidden name=alljobs[{$i}] value='{$alljobs[$i]}'>{$alljobdes[$i]}</td><td><select name=allframes[{$i}]>".buttongen($allframes[$i])." </select></td></tr>\n";
}

print <<< eot
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 align=center width='100%'>
	<tr bgcolor=#47637E><td colspan=5><font color="#FFFFFF">$langafs[17]</font></td></tr>
	<form action=$tf&action=save method=post>	
	<tr align=center bgcolor=#FFFFFF><td  width=50%>$langafs[18]</td><td bgcolor=#FFFFFF>$langafs[19]</td></tr>
	$putfr
	<tr bgcolor=#FFFFFF><td colspan=5 align=center><input type=submit value=$langsubmit>  <input type=reset value=$langreset></td></tr>
	</form>
	</table></table>
eot;
	require("footer.php");
}

if ($action=="save") {
$myframenew=@implode("-", $allframes);
$newest=@file("blog/mblogcon.php");
$allthese=count($newest);
for ($i=0; $i<$allthese; $i++) {
	if (eregi("myframe=", $newest[$i])) {
		$newest[$i]="\$myframe=\"".$myframenew."\";\n";
		$saved=1;
		break;
	}
}
if ($saved!=1) {
	$newest[$allthese]="\$myframe=\"".$myframenew."\";\n";
}
$newestp=eregi_replace("=;", "=0;", @implode("", $newest));

writetofile("blog/mblogcon.php", $newestp);

msg_box($langsuccess,"$langad[34]<br><ul><li><a href=$tf>$langcontinue</a></li></ul>");
require("footer.php");
exit;
}

exit;
?>