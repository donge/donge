<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$blogadminlang/adminmt.lang.php"); //引入语言包

$tf="admin_cp.php?job=maintain";

if (empty($action)) $action="readymain";

if ($action=="readymain") {	
	print <<< eot
		<table cellpadding=0 cellspacing=0 align=center width='95%' bgcolor='#000000'>
		<tr><td>
		<table cellpadding=5 cellspacing=1 width='100%'>
		<tr bgcolor='#E9F2FC'><td><font color="#000000">$langadmt[0]</font></td></tr>
		<tr bgcolor='#FFFFFF'><td>$langadmt[1]<br><BR>$langadmt[2]<BR>$langadmt[3]</td></tr><form action=$tf method=post>
		<tr bgcolor='#FFFFFF'><td><input name=action type='hidden'  maxlength=20 size=20 value="domain"> </td></tr>
		<tr bgcolor='#FFFFFF'><td align=center><input type=submit value=$langadmt[4]> 
		</td></tr></form>
		</table>
		</td></tr>
		</table>
eot;
require ("footer.php");
exit;
}

if ($action=="domain") {
my_set_time_limit(0);
$allrenum=0;
echo "$langadmt[3]<br><br>";
echo "$langadmt[5]<br>";
unset($tmp);
$tmp=@file("$dirblog/list.php");
$allfn=count($tmp);
for ($i=0; $i<count($tmp); $i++) {
$de=explode("|",$tmp[$i]);
if (file_exists("$dirblog/$de[1].rep")) {
unset($latmp);
$latmp=file("$dirblog/$de[1].rep");
$de[5]=count($latmp);
$allrenum+=$de[5];
$tmp[$i]=implode("|", $de);
}
}
writetofile ("$dirblog/list.php", implode("",$tmp));
unset ($tmp);
$tmp=@file("$diruser/allids.php");
$allusernum=count($tmp);
unset ($tmp);
$tmp=countvisit();
$todaystamp=date("Ymd");
$newcount="<?die();?>|".($tmp[0]+1000000000)."|".($allfn+1000000000)."|".($allrenum+1000000000)."|".($tmp[3]+1000000000)."|".$todaystamp."|".($allusernum+1000000000)."|";
writetofile("$dirblog/counter.now.php",$newcount);

$ffile="$dirblog/list.php";  
$ffile2="$dirblog/calrec.txt";
$all=@file($ffile);
for ($i=0; $i<count($all);$i++) {
	$latest=explode("|",$all[$i]);
	$latest[3]=mktimezone($latest[3]);
	$time=date("Ymd",$latest[3]);
	if (@!eregi($time, $out)) $out.=".$time";
}
writetofile($ffile2,$out);
@unlink("$dirblog/cache_calendar.php");

echo "$langadmt[6]<br><br>";

my_set_time_limit(30);
msg_box($langsuccess,"$langadmt[7]<br><ul><li><a href= index.php>$langbacktoindex</a></li></ul>");
require("footer.php");
exit;
}



if ($action=="readycache") {	
	print <<< eot
		<table cellpadding=0 cellspacing=0 align=center width='95%' bgcolor='#000000'>
		<tr><td>
		<table cellpadding=5 cellspacing=1 width='100%'>
		<tr bgcolor='#E9F2FC'><td><font color="#000000">$langadmt[8]</font></td></tr>
		<tr bgcolor='#FFFFFF'><td>$langadmt[1]<br><BR>$langadmt[9]<br>$langadmt[3]</td></tr><form action=$tf method=post>
		<tr bgcolor='#FFFFFF'><td><input name=action type='hidden'  maxlength=20 size=20 value="docache"> </td></tr>
		<tr bgcolor='#FFFFFF'><td align=center><input type=submit value=$langadmt[4]> 
		</td></tr></form>
		</table>
		</td></tr>
		</table>
eot;
require ("footer.php");
exit;
}

if ($action=="docache") {	
updatenewestart ();
updatenewestrep ();
updatelinks();
if ($handle = opendir('temp')) {
    while (false !== ($file = readdir($handle))) {
        if ($file != "." && $file != "..") {
            @unlink ("temp/$file");
        }
    }
    closedir($handle);
}

msg_box($langsuccess,"$langadmt[7]<br><ul><li><a href= index.php>$langbacktoindex</a></li></ul>");
require("footer.php");
exit;
}




if ($action=='loseweight') {
	print <<< eot
		<table cellpadding=0 cellspacing=0 align=center width='95%' bgcolor='#000000'>
		<tr><td>
		<table cellpadding=5 cellspacing=1 width='100%'>
		<tr bgcolor='#E9F2FC'><td><font color="#000000">$langadmt[18]</font></td></tr>
		<tr bgcolor='#FFFFFF'><td>$langadmt[1]<br><BR>$langadmt[19]</td></tr><form action=$tf method=post>
		<tr bgcolor='#FFFFFF'><td><input name=action type='hidden'  maxlength=20 size=20 value="doloseweight"> </td></tr>
		<tr bgcolor='#FFFFFF'><td align=center><input type=submit value=$langadmt[4]> 
		</td></tr></form>
		</table>
		</td></tr>
		</table>
eot;
require ("footer.php");
exit;
}

if ($action=='doloseweight') {
if (file_exists("$dirblog/replies.backup.php")) $former=@readfromfile("$dirblog/replies.backup.php");
$presentrep=@readfromfile("$dirblog/replies.php");
writetofile ("$dirblog/replies.backup.php", $presentrep.$former);

$presentreparray=@yafile("$dirblog/replies.php");
$putarray=array_slice($presentreparray, 0, 50);
writetofile ("$dirblog/replies.php", @implode("",$putarray));

msg_box($langsuccess,"$langadmt[20]<br><ul><li><a href= index.php target='_parent'>$langbacktoindex</a></li></ul>");
require("footer.php");
exit;
}

if ($action=="checkenv") {
	print <<< eot
	<table cellpadding=0 cellspacing=0 align=center width='95%' bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 width='100%'>
	<tr bgcolor='#E9F2FC'><td><font color="#000000">$langadmt[13]</font></td></tr>
	<tr bgcolor='#FFFFFF'><td>$langadmt[1]<br><BR>$langadmt[14]</td></tr><form action=$tf method=post>
	<input name=action type='hidden'  maxlength=20 size=20 value="docheckenv"> 
	<tr bgcolor='#FFFFFF'><td align=center><input type=submit value=$langadmt[4]> 
	</td></tr></form>
	</table>
	</td></tr>
	</table>
eot;
require ("footer.php");
exit;
}

if ($action=="docheckenv") {
	if (function_exists('iconv')) { //检测iconv函数
		$iconv_status="on";
		$dis1=$langadmt[15];
	} else {
		$iconv_status="off";
		$dis1="$langadmt[16] Encode Convert";
	}	
	@mkdir("blog/testdir", 0777);
	$testa=rename("blog/testdir", "blog/testdir2");
	if (!$testa) { //检测是否允许重命名
		$rename_status="off";
		$dis2="$langadmt[16] Rename Data Dir.";
	} else {
		$rename_status="on";
		$dis2=$langadmt[15];
		@rmdir ("blog/testdir2");
	}	
	if ($testhandle = opendir('blog')) {
		$testfile = readdir($testhandle);
		if ($testfile) {
			$readdir_status="on";
			$dis3=$langadmt[15];
		}
		else {
			$readdir_status="off";
			$dis3="$langadmt[16] Uploaded Files Admin; Thumbnail Tool";
		}
	}
	else  {
		$readdir_status="off";
		$dis3="$langadmt[16] Uploaded Files Admin";
	}
	if (function_exists('imagecreate')) { //检测gd库
		$gd_status="on";
		$dis4=$langadmt[15];
	} else {
		$gd_status="off";
		$dis4="$langadmt[16]  Thumbnail Tool";
	}	

	print <<< eot
	<table cellpadding=0 cellspacing=0 align=center width='95%' bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 width='100%'>
	<tr bgcolor='#E9F2FC'><td><font color="#000000">$langadmt[13]</font></td></tr>
	<tr bgcolor='#FFFFFF'><td>$langadmt[17]<br><BR>
	<b>Library - iconv</b> &nbsp; $dis1<br>
	<b>Function - rename</b> &nbsp; $dis2<br>
	<b>Function - readdir</b> &nbsp; $dis3<br>
	<b>Library - GD</b> &nbsp; $dis4<br>
	</td></tr>
	</table>
	</td></tr>
	</table>
eot;
writetofile ("blog/env.php", "<?\$iconv_status=\"$iconv_status\";\n\$rename_status=\"$rename_status\";\n\$readdir_status=\"$readdir_status\";\n\$gd_status=\"$gd_status\";?>");
require ("footer.php");
exit;
}

if ($action=="recacheemots") {	
$parts['emotnum']=16;
$handle=opendir("img/emot");
while ($file = readdir($handle)) {
if ($file!="." && $file!=".." && strstr($file, '.gif')) {
	$filename=str_replace('.gif', '', $file);
	$getline1[]="<a href=\"javascript: ginsert('[emot]{$filename}[/emot]');\"><img src=\"img/emot/{$filename}.gif\" border=\"0\" alt=\"\"/></a>";
	$getline2[]="<a href=\"javascript: minsert('[emot]{$filename}[/emot]');\"><img src=\"img/emot/{$filename}.gif\" border=\"0\" alt=\"\"/></a>";
}
}
$countall=count($getline1);
asort($getline1);
asort($getline2);
$desh1=array_chunk($getline1, $parts['emotnum']);
for ($i=0; $i<sizeof($desh1); $i++) {
	$ppartsall1[]=implode("", $desh1[$i]);
}
$desh2=array_chunk($getline2, $parts['emotnum']);
for ($i=0; $i<sizeof($desh2); $i++) {
	$ppartsall2[]=implode("", $desh2[$i]);
}

$partsall1=implode("<br/>", $ppartsall1);
$partsall2=implode("<br/>", $ppartsall2);
$outputroll="<?\n\$commentemots=<<<eot\n$partsall2\neot;\n\$guestemots=<<<eot\n$partsall1\neot;\n?>";
writetofile ("blog/emotcache.php", $outputroll);
msg_box($langsuccess,"$langadmt[21]<br><ul><li><a href= index.php target='_parent'>$langbacktoindex</a></li></ul>");
require("footer.php");
exit;
}


exit;
?>