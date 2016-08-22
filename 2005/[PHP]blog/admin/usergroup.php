<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$blogadminlang/adminmt.lang.php"); //引入语言包

$tf="admin_cp.php?job=usergroup";


if (empty($action))  {

/*$allpermits=array ('ViewUserDetail','ViewUserList','ViewStat','ViewGallery','ViewPic','BasicSearch','AdvancedSearch','ViewLinks','AddGuestbook','AddComment','AdvancedUBB');
*/
echo "<div align=center>$langwarn</div>";
$datagroups=@file("$diruser/groupsetting.php");
for ($i=0; $i<count($datagroups); $i++) {
	list ($unuse, $groupnum[$i])=@explode("|", $datagroups[$i]);
	unset ($contentss);
	$contentss=str_replace ("<", "&lt;", safe_invert(readfromfile("$diruser/groupcache_{$groupnum[$i]}.php")));
print <<< eot
	<table cellpadding=0 cellspacing=0 align=center width='95%' bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 width='100%'><form action='$tf' method=post>
	<tr bgcolor='#E9F2FC'><td><font color="#000000">$langaug[0] $langaug[1] $groupnum[$i]</font></td></tr>
	<tr bgcolor='#FFFFFF'><td><textarea name="contentss" rows=15 cols=80>$contentss</textarea></td></tr><input type=hidden name=action value=save><input type=hidden name=groupnum value=$groupnum[$i]>
	<tr bgcolor='#FFFFFF'><td align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
	</td></tr></form>
	</table>
	</td></tr>
	</table>
	<br>
eot;
}

$lll=max($groupnum)+1;
print <<< eot
	<table cellpadding=0 cellspacing=0 align=center width='95%' bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 width='100%'><form action='$tf' method=post>
	<tr bgcolor='#E9F2FC'><td><font color="#000000">$langaug[2]</font></td></tr>
	<tr bgcolor='#FFFFFF'><td><textarea name="contentss" rows=15 cols=80>&lt;?\n\$grouppermit['GroupName']='New Group';</textarea></td></tr><input type=hidden name=action value=add><input type=hidden name=groupnum value=$lll>
	<tr bgcolor='#FFFFFF'><td align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
	</td></tr></form>
	</table>
	</td></tr>
	</table>
	<br>
eot;
}

if ($action=="add") {
	$contentss=@str_replace("&lt;", "<", $contentss);
	$datagroups=@file("$diruser/groupsetting.php");
	$datagroups[]="<?die();?>|$groupnum|\n";
	writetofile("$diruser/groupsetting.php", implode("", $datagroups));
	writetofile("$diruser/groupcache_$groupnum.php", stripslashes($contentss));
	msg_box($langsuccess,"$langaug[3]<ul><li><a href=$tf>$langcontinue</a></li></ul><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
	require("footer.php");
	exit;
}

if ($action=="save") {
	$contentss=@str_replace("&lt;", "<", $contentss);
	writetofile("$diruser/groupcache_$groupnum.php", stripslashes($contentss));
	msg_box($langsuccess,"$langaug[4]<ul><li><a href=$tf>$langcontinue</a></li></ul><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
	require("footer.php");
	exit;
}

exit;
?>