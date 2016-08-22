<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$blogadminlang/admincp.lang.php"); //引入语言包

$tf="admin_cp.php?job=announce";


if (empty($action))  {
if (file_exists("blog/sticky.php")) require("blog/sticky.php");
$announce=str_replace("&nbsp", " ", $announce);
$announce=safe_invert($announce);
if ($htmlmode==1) print<<<eot
<style type="text/css">
@import url(htmlarea/htmlarea.css);
</style>
<script type="text/javascript">
_editor_url = "htmlarea"; // omit the final slash 
</script> 
<!-- load the main HTMLArea files -->
<script type="text/javascript" src="htmlarea/htmlarea.js"></script>
<script type="text/javascript" src="htmlarea/lang/gb.js"></script>
<script type="text/javascript" src="htmlarea/dialog.js"></script>
<script type="text/javascript" src="htmlarea/popupwin.js"></script>
<script type="text/javascript">
var editor = null;
function initEditor() {
  editor = new HTMLArea("announceto");

  editor.generate();
  return false;
}
</script>
<body onload="initEditor()">
eot;
print <<< eot
<div align=center></div>
	<table cellpadding=0 cellspacing=0 align=center width='95%' bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 width='100%'><form action=$tf method=post>
	<tr bgcolor='#E9F2FC'><td colspan=2><font color="#000000">$langanc[0]   $langanc[1] $langanc[2]</font></td></tr>
	<tr bgcolor='#FFFFFF'><td colspan=2><textarea name="announceto" id="announceto" rows=25 cols=80>$announce</textarea></td></tr><input type=hidden name=action value=save>
	<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value='$langsubmit'>  <input type='reset' value='$langreset'>
	</td></tr></form>
	</table>
	</td></tr>
	</table>
eot;
	require("footer.php");
}

if ($action=="save") {
if (file_exists("blog/sticky.php")) require("blog/sticky.php");
$announceto=minor_safe_convert($announceto);
$announceto=str_replace("\"", "'",$announceto);
$announceto=str_replace("&amp;nbsp;", "&nbsp", $announceto);
writetofile("blog/sticky.php", "<?\n\$sticky=\"$sticky\";\n\$announce=\"$announceto\";");
msg_box($langanc[3],"$langanc[4]<br><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
require("footer.php");
exit;
}

exit;
?>