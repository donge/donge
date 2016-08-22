<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$blogadminlang/adminbk.lang.php"); //引入语言包

$tf="admin_cp.php?job=back";

if (empty($action)) $action="back";

if ($action=="back") {	
	print <<< eot
		<table cellpadding=0 cellspacing=0 align=center width='95%' bgcolor='#000000'>
		<tr><td>
		<table cellpadding=5 cellspacing=1 width='100%'>
		<tr bgcolor='#E9F2FC'><td><font color="#000000">$langabk[0]</font></td></tr>
		<tr bgcolor='#FFFFFF'><td>$langabk[1]<br>$langabk[2]</td></tr><form action=$tf method=post>
		<tr bgcolor='#FFFFFF'><td><input name=backname type='text'  maxlength=20 size=20 value="backup"><input name=action type='hidden'  maxlength=20 size=20 value="step2"> </td></tr>
		<tr bgcolor='#FFFFFF'><td align=center><input type=submit value='$langabk[3]'> 
		</td></tr></form>
		</table>
		</td></tr>
		</table>
eot;
require ("footer.php");
exit;
}

if ($action=="step2") {
	if ($backname=="") {
	msg_box($langerror,"$langabk[4]<br><ul><li><a href=$tf>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}

my_set_time_limit(0);

echo "Creating Folders <br>";
@mkdir($backname, 0777);
echo "Folder Created (step:1/13)<br>";
echo "Creating Configuration Backup<br>";
$confile=array ("mblogcon.php", "banwords.php","banip.php","dirconfig.php","tems.php","wordreplace.php","sticky.php");
for ($i=0; $i<count($confile); $i++ ) { 
	if (file_exists("blog/$confile[$i]")) {
		$configs[]=@readfromfile("blog/$confile[$i]");
		$conseq[]=$confile[$i];
	}
}
$conout=@implode("|θ|", $configs);
$conseqout=@implode("\n", $conseq);
writetofile("$backname/config_back.php", $conout);
writetofile("$backname/config_seq.php", $conseqout);
echo "Configuration Backup Finished  (step:2/13)<br>";

echo "Creating Categories Backup<br>";
@copy ("$dirblog/cat.php", "$backname/cat.php");
@copy("$dirblog/redirection.php", "$backname/redirection.php");
echo "Categories Backup Finished (step:3/13)<br>";

echo "Creating Lists Backup<br>";
$catall=@file ("$dirblog/cat.php");
for ($i=0; $i<count($catall); $i++) {
	$ci=@explode("|", $catall[$i]);
	$catcu=$ci[1];
	$catoo[]=@readfromfile("$dirblog/$catcu.php");
}
$catout=@implode("|θ|", $catoo);
writetofile("$backname/cat_back.php", $catout);
echo "Lists Backup Finished (step:4/13)<br>";

echo "Creating Links Backup<br>";
@copy ("$dirblog/links.php", "$backname/links.php");
@copy ("$dirblog/waitinglinks.php", "$backname/waitinglinks.php");
echo "Links Backup Finished (step:5/13)<br>";

echo "Creating Calendar Backup<br>";
@copy ("$dirblog/calrec.txt", "$backname/calrec.txt");
echo "Calendar Backup Finished (step:6/13)<br>";

echo "Creating Entries Backup<br>";
@copy ("$dirblog/list.php", "$backname/list.php");
echo "Entries Backup Finished (step:7/13)<br>";

echo "Creating Reply List Backup<br>";
@copy ("$dirblog/replies.php", "$backname/replies.php");
@copy ("$dirblog/replies.backup.php", "$backname/replies.backup.php");

if (file_exists("$dirblog/replies.backup.php")) {
	$wholesome=@yafile("$dirblog/replies.backup.php");
	$tmp2=@file ("$dirblog/replies.php");
	$bttmp2=@array_merge($tmp2, $wholesome);
	$tmp=@array_unique ($bttmp2);
	writetofile ("$backname/replies.php", @implode("", $tmp));
}
echo "Reply List Backup Finished (step:8/13)<br>";

echo "Creating Counter Backup<br>";
@copy ("$dirblog/counter.now.php", "$backname/counter.now.php");
@copy ("$dirblog/counter.backup.php", "$backname/counter.backup.php");
echo "Counter Backup Finished (step:9/13)<br>";

echo "Program is now packing all your articles.<br>";
unset($tmp);
$tmp=@file ("$dirblog/list.php");
for ($i=0; $i<count($tmp); $i++) {
	$wah=@explode("|", $tmp[$i]);
	$rec[]=@readfromfile("$dirblog/$wah[1].art");
	$recseq[]=$wah[1];
}
$recout=@implode("|θ|", $rec);
$recseqcout=@implode("\n", $recseq);
writetofile("$backname/rec_back.php", $recout);
writetofile("$backname/rec_seq.php", $recseqcout);
echo "Package Created (step:10/13)<br>";

echo "Program is now packing all of the comments.<br>";
unset($tmp, $wah);
$tmp=@file ("$backname/replies.php");
$repseq=array();
for ($i=0; $i<count($tmp); $i++) {
	$wah=@explode("|", $tmp[$i]);
	if (!in_array($wah[1], $repseq)) {
	$repseq[]=$wah[1];
	$rep[]=@readfromfile("$dirblog/$wah[1].rpl");
	$repfiles[]=@readfromfile("$dirblog/$wah[1].rep");
	}
}
$repout=@implode("|θ|", $rep);
$repfilesout=@implode("|θ|", $repfiles);
$repseqcout=@implode("\n", $repseq);
writetofile("$backname/repfiles_back.php", $repfilesout);
writetofile("$backname/rep_back.php", $repout);
writetofile("$backname/rep_seq.php", $repseqcout);
echo "Package Created (step:11/13)<br>";

echo "Creating Guestbook Backup<br>";
@copy ("$dirblog/guestdata.php", "$backname/guestdata.php");
echo "Guestbook Backup Finished (step:12/13)<br>";

echo "Creating User Data Backup<br>";
@copy ("$diruser/allids.php", "$backname/allids.php");
@copy ("$diruser/userid.php", "$backname/userid.php");
@copy ("$diruser/userid.ext", "$backname/userid.ext");
$initfs=range(a,z);
for ($i=0; $i<26; $i++) {
	if (file_exists("$diruser/$initfs[$i].php")) {
		$userback[]=@readfromfile("$diruser/$initfs[$i].php");
		$userbackseq[]="$initfs[$i].php";
	}
}
if (file_exists("$diruser/#.php")) {
	$userback[]=@readfromfile("$diruser/#.php");
	$userbackseq[]="#.php";
}
if (file_exists("$diruser/hanzi.php")) {
	$userback[]=@readfromfile("$diruser/hanzi.php");
	$userbackseq[]="hanzi.php";
}	
if (sizeof($userback)!=0) {
	$userbackout=@implode("|θ|", $userback);
	$userbackseqout=@implode("\n", $userbackseq);
}
if (!empty($userbackout)) writetofile("$backname/userback.php", $userbackout);
if (!empty($userbackseqout)) writetofile("$backname/userbackseq.php", $userbackseqout);
echo "User Data Backup Finished (step:13/13)<br>";


$printwhileok=getstr($backname, $langabk[4]);
echo $printwhileok;

my_set_time_limit(30);

require("footer.php");
}

if ($action=="reback") {	
	print <<< eot
		<table cellpadding=0 cellspacing=0 align=center width='95%' bgcolor='#000000'>
		<tr><td>
		<table cellpadding=5 cellspacing=1 width='100%'>
		<tr bgcolor='#E9F2FC'><td><font color="#000000">$langabk[0]</font></td></tr>
		<tr bgcolor='#FFFFFF'><td>$langabk[5]<br><font color=red><b>$langabk[6]</b></font></td></tr><form action=$tf method=post>
		<tr bgcolor='#FFFFFF'><td>$langabk[7]<input name=backname type='text'  maxlength=20 size=20 value="backup"> </td></tr><input name=action type='hidden'  maxlength=20 size=20 value="step3"><tr bgcolor='#FFFFFF'><td>$langabk[8]<input name=blogbackto type='text'  maxlength=20 size=20 value=""> </td></tr><tr bgcolor='#FFFFFF'><td>$langabk[9]<input name=userbackto type='text'  maxlength=20 size=20 value=""> </td></tr>
		<tr bgcolor='#FFFFFF'><td align=center><input type=submit value='$langabk[10]'> 
		</td></tr></form>
		</table>
		</td></tr>
		</table>
eot;
require ("footer.php");
exit;
}

if ($action=="step3") {
	if ($blogbackto=="" || $backname=="" || $userbackto=="") {
	msg_box($langerror,"$langabk[4]<br><ul><li><a href=$tf?action=reback>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}

my_set_time_limit(0);

echo "Creating Folders <br>";
@mkdir($blogbackto, 0777);
@mkdir($userbackto, 0777);

echo "Folders Created - step:1/13<br>";

echo "Rolling Back Configuration<br>";
$confile=getarray ("$backname/config_seq.php");
$configs=getarray2 ("$backname/config_back.php");
for ($i=0; $i<count($confile); $i++ ) { 
writetofile("blog/$confile[$i]", $configs[$i]);
}
echo "Succeeded - step:2/13<br>";

echo "Rolling Back Categories<br>";
@copy ("$backname/cat.php", "$blogbackto/cat.php");
@copy("$backname/redirection.php", "$blogbackto/redirection.php");
echo "Succeeded -  step:3/13<br>";

echo "Rolling Back Category Lists<br>";
$catall=@file ("$backname/cat.php");
$catoo=getarray2("$backname/cat_back.php");
for ($i=0; $i<count($catall); $i++) {
	$ci=@explode("|", $catall[$i]);
	$catcu=$ci[1];
	writetofile("$blogbackto/$catcu.php", $catoo[$i]);
}
echo "Succeeded -  step:4/13<br>";

echo "Rolling Back Links<br>";
@copy ("$backname/links.php", "$blogbackto/links.php");
@copy ("$backname/waitinglinks.php", "$blogbackto/waitinglinks.php");
echo "Succeeded - step:5/13<br>";

echo "Rolling Back Calendars<br>";
@copy ("$backname/calrec.txt", "$blogbackto/calrec.txt");
echo "Succeeded - step:6/13<br>";

echo "Rolling Back Entries<br>";
@copy ("$backname/list.php", "$blogbackto/list.php");
echo "Succeeded -  step:7/13<br>";

echo "Rolling Back Reply Lists<br>";
@copy ("$backname/replies.php", "$blogbackto/replies.php");
@copy ("$backname/replies.backup.php", "$blogbackto/replies.backup.php");
echo "Succeeded - step:8/13<br>";

echo "Rolling Back Counter<br>";
@copy ("$backname/counter.now.php", "$blogbackto/counter.now.php");
@copy ("$backname/counter.backup.php", "$blogbackto/counter.backup.php");
echo "Succeeded - step:9/13<br>";

echo "Program is unpacking all your articles.<br>";
$recseq=getarray("$backname/rec_seq.php");
$rec=getarray2("$backname/rec_back.php");
for ($i=0; $i<count($recseq); $i++) {
writetofile("$blogbackto/$recseq[$i].art", $rec[$i]);
}
echo "Succeeded - step:10/13<br>";

echo "Program is unpacking all comments.<br>";
$repout=getarray2("$backname/rep_back.php");
$repfilesout=getarray2("$backname/repfiles_back.php");
$repseq=getarray("$backname/rep_seq.php");
for ($i=0; $i<count($repseq); $i++) {
writetofile("$blogbackto/$repseq[$i].rpl",@ereg_replace("\r", "\n",  $repout[$i]));
writetofile("$blogbackto/$repseq[$i].rep", $repfilesout[$i]);
}
echo "Succeeded - step:11/13<br>";

echo "Rolling Back Guestbook<br>";
@copy ("$backname/guestdata.php", "$blogbackto/guestdata.php");
echo "Succeeded - step:12/13<br>";

echo "Rolling Back User Data<br>";
$userbackseq=@getarray("$backname/userbackseq.php");
$userback=@getarray2("$backname/userback.php");
for ($i=0; $i<count($userbackseq); $i++) {
writetofile("$userbackto/$userbackseq[$i]", $userback[$i]);
}


@copy ("$backname/allids.php", "$userbackto/allids.php");
@copy ("$backname/userid.php", "$userbackto/userid.php");
@copy ("$backname/userid.ext", "$userbackto/userid.ext");
echo "Succeeded - step:13/13<br>";

writetofile ("blog/dirconfig.php", "<?\n\$dirblog=\"$blogbackto\";\n\$diruser=\"$userbackto\";");
$dirblog=$blogbackto;
$diruser=$userbackto;
updatenewestart ();
updatenewestrep ();

echo "$langabk[11]<br>";
@my_set_time_limit(30);
require("footer.php");
}

function  getarray($filename) {
$newarray=@explode("\n",@readfromfile($filename));
for ($i=0; $i<count($newarray); $i++) {
	$newarray[$i]=trim($newarray[$i]);
}
return $newarray;
}

function  getarray2($filename) {
$newarray=@explode("|θ|",@readfromfile($filename));
for ($i=0; $i<count($newarray); $i++) {
	$newarray[$i]=trim($newarray[$i]);
}
return $newarray;
}

exit;
?>