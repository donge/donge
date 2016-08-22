<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$blogadminlang/adminbk.lang.php"); //引入语言包

$tf="admin_cp.php?job=ban";

if (empty($action)) $action="mod";

if ($action=="mod") {
if (file_exists("blog/banip.php")) $allipbans=@readfromfile("blog/banip.php");
if (file_exists("blog/banwords.php")) $allsensitive=@readfromfile("blog/banwords.php");
if (file_exists("blog/bansearch.php")) $allbansearch=@readfromfile("blog/bansearch.php");
print <<< eot
<div align=center>$langwarn</div>
	<table cellpadding=0 cellspacing=0 align=center width='95%' bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 width='100%'><form action=$tf method=post>
	<tr bgcolor='#E9F2FC'><td colspan=2><font color="#000000">$langban[0]</font></td></tr>
	<tr bgcolor='#FFFFFF'><td width=20%>ip：</td><td><textarea name="ipbans" rows=15 cols=80>$allipbans</textarea></td></tr><input type=hidden name=action value=saveipbans>
	<tr bgcolor='#FFFFFF'><td colspan=2>$langban[1]</td></tr>
	<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
	</td></tr></form>
	</table>
	</td></tr>
	</table>
	
	<br>
		
	<table cellpadding=0 cellspacing=0 align=center width='95%' bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 width='100%'><form action=$tf method=post>
	<tr bgcolor='#E9F2FC'><td colspan=2><font color="#000000">$langban[2]</font></td></tr>
	<tr bgcolor='#FFFFFF'><td width=20%>$langban[3]</td><td><textarea name="sensitive" rows=15 cols=80>$allsensitive</textarea></td></tr><input type=hidden name=action value=savesensitive>
	<tr bgcolor='#FFFFFF'><td colspan=2>$langban[4]</td></tr>
	<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
	</td></tr></form>
	</table>
	</td></tr>
	</table>

	<br>
		
	<table cellpadding=0 cellspacing=0 align=center width='95%' bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 width='100%'><form action=$tf method=post>
	<tr bgcolor='#E9F2FC'><td colspan=2><font color="#000000">$langban[8]</font></td></tr>
	<tr bgcolor='#FFFFFF'><td width=20%>$langban[10]</td><td><textarea name="bansearch" rows=15 cols=80>$allbansearch</textarea></td></tr><input type=hidden name=action value=savebansearch>
	<tr bgcolor='#FFFFFF'><td colspan=2>$langban[9]</td></tr>
	<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
	</td></tr></form>
	</table>
	</td></tr>
	</table>
eot;
	require("footer.php");
}

if ($action=="saveipbans") {
$ipbans=@ereg_replace("\r", "", $ipbans);
$ipbans=@ereg_replace("\n", "", $ipbans);
$ipbans=@ereg_replace("，", ",", $ipbans);
if ($ipbans=="") @unlink("blog/banip.php");
else writetofile("blog/banip.php", $ipbans);
msg_box($langban[5],"$langban[6]<br><ul><li><a href=index.php>$langbacktoindex</a></li></ul><br><ul><li><a href=$tf>$langcontinue</a></li></ul>");
require("footer.php");
exit;
}

if ($action=="savesensitive") {
$sensitive=@ereg_replace("\r", "", $sensitive);
$sensitive=@ereg_replace("\n", "", $sensitive);
$sensitive=@ereg_replace("，", ",", $sensitive);
if ($sensitive=="") @unlink("blog/banwords.php");
else writetofile("blog/banwords.php", $sensitive);
msg_box($langban[5], "$langban[7]<br><ul><li><a href=index.php>$langbacktoindex</a></li></ul><br><ul><li><a href=$tf>$langcontinue</a></li></ul>");
require("footer.php");
exit;
}

if ($action=="savebansearch") {
$bansearch=@ereg_replace("\r", "", $bansearch);
$bansearch=@ereg_replace("\n", "", $bansearch);
$bansearch=@ereg_replace("，", ",", $bansearch);
if ($bansearch=="") @unlink("blog/bansearch.php");
else writetofile("blog/bansearch.php", $bansearch);
msg_box($langban[5], "$langban[11]<br><ul><li><a href=index.php>$langbacktoindex</a></li></ul><br><ul><li><a href=$tf>$langcontinue</a></li></ul>");
require("footer.php");
exit;
}
exit;
?>