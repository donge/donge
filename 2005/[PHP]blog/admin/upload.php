<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$blogadminlang/adminmt.lang.php"); //引入语言包

$tf="admin_cp.php?job=upload";

if (empty($action)) $action="up";

if ($action=="up") {	
	print <<< eot
		<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
		<tr><td>
		<table cellpadding=5 cellspacing=1 align=center width='100%'>
		<tr bgcolor='#47637E'><td colspan=2><font color="#FFFFFF">$langaul[0]</font></td></tr><form enctype="multipart/form-data" action=$tf method="post"> 
		<tr bgcolor='#FFFFFF'><td colspan=2></td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%>$langaul[1]</td><td><input name="destination" type="file"></td></tr>
		<tr bgcolor='#FFFFFF'><td width=20% valign=top>$langaul[14]</td><td><input type=radio name="renamemethod" value="0" checked>$langaul[15] [1081344762.jpg] <br><input type=radio name="renamemethod" value="1">$langaul[16] [20050101_153000.jpg] <br><input type=radio name="renamemethod" value="2">$langaul[17] [pic.jpg] <br><input type=radio name="renamemethod" value="3">$langaul[18] <input type=text size=25 name="renameto" value=""> &nbsp; $langaul[19]</td></tr>
		<tr bgcolor='#FFFFFF'><td width=20% valign=top>$langaul[20]</td><td><input type=radio name="ifrename" value="1" checked>$langaul[21]<br><input type=radio name="ifrename" value="0">$langaul[22]<br><input type=radio name="ifrename" value="2">$langaul[23]</td></tr>	<input type=hidden name=action value=doup>
		<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langaul[2]>
		</td></tr></form>
		</table>
		</td></tr>
		</table>
eot;
require ("footer.php");
exit;
}

if ($action=="doup") {

	if (empty($destination))  {
	msg_box($langerror,"$langaul[3]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
$upload_file=$_FILES['destination']['tmp_name'];
$upload_filename=$_FILES['destination']['name'];
$upload_filesize=$_FILES['destination']['size'];
$ext = strtolower(strrchr($upload_filename,'.'));

if ( ($renamemethod==2 && strstr(urlencode($upload_filename), '%')) || ($renamemethod==3 && strstr(urlencode($renameto), '%')) || ($renamemethod==3 && empty($renameto)) ) {
	msg_box($langerror,"$langaul[24]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
}

if ($renamemethod==0) $newfilename=time()."$ext";
elseif ($renamemethod==1) $newfilename=date("Ymd_His")."$ext";
elseif ($renamemethod==2) $newfilename=$upload_filename;
elseif ($renamemethod==3) $newfilename=$renameto."$ext";;

if (file_exists("up/$newfilename")) {
	if ($ifrename==0) {
		msg_box($langerror,"$langaul[25]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
		exit;
	} elseif ($ifrename==1) $newfilename=time().'_'.$newfilename;
	else @unlink("up/$newfilename");
}


$imgext=array (".jpg",".gif",".jpeg",".bmp",".png",".jpe");
if ($htmlmode==0) {
if (@in_array($ext, $imgext)) $jiashang="[img align=M]".$updir."/$newfilename"."[/img]";
else if ($ext==".swf") $jiashang="[swf width=400 height=100]"."$updir/".$newfilename."[/swf]";
else if ($ext==".rm" || $ext==".ra") $jiashang="[real width=400 height=100]"."$updir/".$newfilename."[/real]";
else if ($ext==".wma" || $ext==".mp3") $jiashang="[wmp width=400 height=100]"."$updir/".$newfilename."[/wmp]";
else $jiashang="[url]"."$updir/".$newfilename."[/url]";
}
else {
$jiashang="$updir"."/$newfilename";
}

@move_uploaded_file ($upload_file,"$updir/$newfilename"); 
print <<< eot
<script language=javascript>
function copyText(obj) {
var rng = document.body.createTextRange();
rng.moveToElementText(obj);
rng.scrollIntoView();
rng.select();
rng.execCommand("Copy");
rng.collapse(false);
}
</script>
eot;
msg_box($langsuccess,"$langaul[4] Name: $upload_filename  Size: $upload_filesize B<br>$langaul[5]<span id=codest>$jiashang</span> (<a href=# onClick='copyText(document.all.codest)'><b>$langaul[6] </b></a>)<ul><li><a href=$tf>$langcontinue</a></li></ul>");
require("footer.php");
exit;
}


if ($action=="adminups") {
if ($readdir_status=="off") {
	echo "<br>$langerrornotsupport<br>[Function] ReadDir<br><a href='admin_cp.php?job=maintain&action=checkenv'>$langaul[7]</a><br>";
require("footer.php");
exit;
}
	
$handle=opendir($updir);
while ($file = readdir($handle)) {
if ($file!="." && $file!="..") {
	$filename[]=$file;
	$filetime[]=date("Y-n-j",filectime($updir."/".$file));
	$filesize[]=filesize($updir."/".$file);
}
}
closedir($handle); 
for ($i=0; $i<count($filename); $i++) {
	$outbg.="<tr align=center><td bgcolor=#FFFFFF><a href=$updir/$filename[$i] target=_blank>$filename[$i]</a></td><td bgcolor=#FFFFFF>$filetime[$i]</td><td bgcolor=#FFFFFF>$filesize[$i]</td><td bgcolor=#FFFFFF><a href=$tf&action=delup&filename=$filename[$i]>$langaul[8]</td></tr>";
}
print <<< eot
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 align=center width='100%'>
	<tr bgcolor=#47637E><td colspan=4><font color="#FFFFFF">$langaul[9]</font></td></tr>
	<tr align=center><td bgcolor=#FFFFFF>$langaul[10]</td><td bgcolor=#FFFFFF>$langaul[11]</td><td bgcolor=#FFFFFF>$langaul[12]</td><td bgcolor=#FFFFFF>$langaul[9]</td></tr>
$outbg
	</table></table>
eot;
}


if ($action=="delup") {
$filename=basename($filename);
if ($filename!="" && file_exists("$updir/$filename")) @unlink ("$updir/$filename");
msg_box($langsuccess,"$langaul[13]  Name: $filename <br><ul><li><a href=$tf&action=adminups>$langbacktoindex</a></li></ul>");
require("footer.php");
exit;

}
?>