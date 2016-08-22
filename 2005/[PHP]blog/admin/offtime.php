<?
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$blogadminlang/admincp.lang.php"); //引入语言包

$tf="admin_cp.php?job=offtime";


if (empty($action))  {
if (empty ($offtime)) $offtime="0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0-0";
$allofftime=explode("-", $offtime);

function buttongen ($value) {
	global $langafs;
	if ($value==1) {
		return "<option value=0>$langafs[20]</option><option value=1 selected>$langafs[21]</option>";
	} else {
		return "<option value=0 selected>$langafs[20]</option><option value=1>$langafs[21]</option>";
	}
}

for ($i=0; $i<sizeof($allofftime); $i++) {
	$desi=$i.":00 - ".($i+1).":00";
	$putfr.="<tr bgcolor=#FFFFFF><td>$desi</td><td><select name=allofftime[{$i}]>".buttongen($allofftime[$i])." </select></td></tr>\n";
}

if ($closeblognow==1) $checksta1='checked';
else $checksta2="checked";
print <<< eot
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 align=center width='100%'>
	<tr bgcolor=#47637E><td colspan=5><font color="#FFFFFF">$langafs[25]</font></td></tr>
	<form action=$tf&action=save2 method=post>	
	<tr align=center bgcolor=#FFFFFF><td><input type=radio name='closeblognow2' value=0 $checksta2>$langafs[20]  <input type=radio name='closeblognow2' value=1 $checksta1>$langafs[21]</td></tr>
	<tr bgcolor=#FFFFFF><td colspan=5 align=center><input type=submit value=$langsubmit>  <input type=reset value=$langreset></td></tr>
	</form>
	</table></table><br>
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 align=center width='100%'>
	<tr bgcolor=#47637E><td colspan=5><font color="#FFFFFF">$langafs[22]</font></td></tr>
	<form action=$tf&action=save method=post>	
	<tr align=center bgcolor=#FFFFFF><td  width=50%>$langafs[23]</td><td bgcolor=#FFFFFF>$langafs[24]</td></tr>
	$putfr
	<tr bgcolor=#FFFFFF><td colspan=5 align=center><input type=submit value=$langsubmit>  <input type=reset value=$langreset></td></tr>
	</form>
	</table></table>
	<div align=right>$langafs[26]</div>
eot;
	require("footer.php");
}

if ($action=="save") {
$mynew=@implode("-", $allofftime);
$newest=@file("blog/mblogcon.php");
$allthese=count($newest);
for ($i=0; $i<$allthese; $i++) {
	if (eregi("offtime=", $newest[$i])) {
		$newest[$i]="\$offtime=\"".$mynew."\";\n";
		$saved=1;
		break;
	}
}
if ($saved!=1) {
	$newest[$allthese]="\$offtime=\"".$mynew."\";\n";
}
$newestp=eregi_replace("=;", "=0;", @implode("", $newest));

writetofile("blog/mblogcon.php", $newestp);

msg_box($langsuccess,"<ul><li><a href=$tf>$langcontinue</a></li></ul>");
require("footer.php");
exit;
}

if ($action=="save2") {
$newest=@file("blog/mblogcon.php");
$allthese=count($newest);
for ($i=0; $i<$allthese; $i++) {
	if (eregi("closeblognow=", $newest[$i])) {
		$newest[$i]="\$closeblognow=$closeblognow2;\n";
		$saved=1;
		break;
	}
}
if ($saved!=1) {
	$newest[$allthese]="\$closeblognow=$closeblognow2;\n";
}	
$newestp=eregi_replace("=;", "=0;", @implode("", $newest));
writetofile("blog/mblogcon.php", $newestp);
msg_box($langsuccess,"<ul><li><a href=$tf>$langcontinue</a></li></ul>");
require("footer.php");
exit;
}

exit;
?>