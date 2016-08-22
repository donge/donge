<?
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$blogadminlang/adminmt.lang.php"); //引入语言包

$tf="admin_cp.php?job=admindrafts";

if (empty($action)) $action='admindraft';
if ($action=="admindraft") {
if (file_exists("drafts/index.php")) $draftlist=@file("drafts/index.php");

for ($i=0; $i<count($draftlist); $i++) {
	list($unused, $draft_time, $draft_con)=@explode("|", $draftlist[$i]);
	$draft_time_readable=date($langdatefomat, $draft_time);	
	$outbg.="<tr align=center><td bgcolor=#FFFFFF valign=top  width=150>$draft_time_readable</td><td bgcolor=#FFFFFF valign=top align=left>$draft_con</td><td bgcolor=#FFFFFF valign=top width=45><a href=\"mblog_edit.php?action=write&draft=$draft_time\">$langadf[0]</a></td><td bgcolor=#FFFFFF valign=top align=center width=45><a href=\"$tf&action=deldraft&draftid=$i\">$langadf[1]</a></td></tr>";
}
print <<< eot
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 align=center width='100%'>
	<tr align=center><td bgcolor=#47637E colspan=4><font color="#FFFFFF">$langadf[2]</font></td></tr>
	<tr align=center><td bgcolor=#FFFFFF width=150>$langadf[3]</td><td bgcolor=#FFFFFF>$langadf[4]</td><td bgcolor=#FFFFFF width=40>$langadf[0]</td><td bgcolor=#FFFFFF width=40>$langadf[1]</td></tr>
	$outbg
	</table></table><br>
	<table cellpadding=0 cellspacing=0 align=center width=95%><tr><td>
	<a href="mblog_edit.php?action=write">$langadf[5]</a>
	</td></tr></table>

eot;
require("footer.php");
}


if ($action=="deldraft") {	
$draftlist=@file("drafts/index.php");
list($unused, $draft_time, $draft_con)=@explode("|", $draftlist[$draftid]);
$draftlist[$draftid]='';
$allsave=implode('', $draftlist);
if ($allsave=='') @unlink("drafts/index.php");
else writetofile("drafts/index.php", $allsave);
@unlink("drafts/$draft_time.php");
msg_box($langsuccess,"$langadf[6] <br><ul><li><a href=$tf>$langback</a></li></ul>");
require("footer.php");
exit;

}
?>