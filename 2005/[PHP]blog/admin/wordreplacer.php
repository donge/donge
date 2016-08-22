<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$blogadminlang/adminct.lang.php"); //引入语言包

$tf="admin_cp.php?job=wordreplacer";


if (empty($action))  {
if (file_exists('blog/wordreplace.php')) {
	include ('blog/wordreplace.php');
	while ($bag=each ($eachreplacer)) {
		$allreplacers1[]=$bag['key'].'*'.$bag['value'];
	}
	$allreplacers=implode(',', $allreplacers1);
}

print <<< eot
<div align=center>$langwarn</div>
	<table cellpadding=0 cellspacing=0 align=center width='95%' bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 width='100%'><form action=$tf method=post>
	<tr bgcolor='#E9F2FC'><td colspan=2><font color="#000000">$langawr[0]</font></td></tr>
	<tr bgcolor='#FFFFFF'><td width=20%>$langawr[1]</td><td><textarea name="replacement" rows=5 cols=60>$allreplacers</textarea></td></tr><input type=hidden name=action value=save>
	<tr bgcolor='#FFFFFF'><td colspan=2>$langawr[2]<font color=red>$langawr[3]</font><br>$langawr[4]</td></tr>
	<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
	</td></tr></form>
	</table>
	</td></tr>
	</table>
eot;
	require("footer.php");
}

if ($action=="save") {
$replacement=@ereg_replace("\r", "", $replacement);
$replacement=@ereg_replace("\n", "", $replacement);
$can=@explode(',', $replacement);
for ($i=0; $i<count($can); $i++) {
	if (!empty($can[$i])) {
	$can2=@explode('*',$can[$i]);
	$reout.="\$eachreplacer['".trim($can2[0])."']='".trim($can2[1])."';\n";
}
}
if ($reout=="") @unlink("blog/wordreplace.php");
else writetofile("blog/wordreplace.php", "<?\n".$reout);
msg_box($langsuccess,"$langawr[5]<br><ul><li><a href= index.php>$langbacktoindex</a></li></ul><br><ul><li><a href=$tf>$langcontinue</a></li></ul>");
require("footer.php");
exit;
}
exit;
?>