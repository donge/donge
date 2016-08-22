<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$blogadminlang/admincg.lang.php"); //引入语言包
$tf="admin_cp.php?job=config";

if (empty($action)) $action="change";

if ($action=="change") {	
if ($allowvisitorreply==1) $checksta1="checked";
else $checksta2="checked";
if ($allowfullcode==1) $checksta3="checked";
else $checksta4="checked";
if ($fulltimemode==1) $checksta5="checked";
else $checksta6="checked";
if ($validation==1) $checksta7="checked";
else $checksta8="checked";
if ($censorship==1) $checksta11="checked";
else $checksta12="checked";
if ($showprocesstime==1) $checksta13="checked";
else $checksta14="checked";
if ($allowreplyfull==1) $checksta17="checked";
else $checksta18="checked";
if ($htmlmode==1) $checksta19="checked";
else $checksta20="checked";
if ($autoaddlink==1) $checksta21="checked";
else $checksta22="checked";
if ($showannounce==1) $checksta23="checked";
else $checksta24="checked";
if ($alwaysuselist==1) $checksta27="checked";
else $checksta28="checked";
if ($allowreg==1) $checksta29="checked";
else $checksta30="checked";
if ($usegzip==1) $checksta31="checked";
else $checksta32="checked";
if ($opengallery==1) $checksta33="checked";
else $checksta34="checked";
if ($rolllinks==1) $checksta35="checked";
else $checksta35="";
if ($fixmozillabug==1) $checksta37="checked";
else $checksta38="checked";
if ($selflinkstatus==1) $checksta43="selected";
elseif ($selflinkstatus==2) $checksta44="selected";
else $checksta45="selected";
if ($showgravatar==1) $checksta47="checked";
else $checksta48="checked";
if ($securedlogin==1) $checksta49="checked";
else $checksta50="checked";
if ($protectemailaddress==1) $checksta51="checked";
else $checksta52="checked";
if ($adminreadcount==0) $checksta53="checked";
else $checksta54="checked";
if ($autoshortenurl==1) $checksta55="checked";
else $checksta56="checked";

print <<< eot
		<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
		<tr><td>
		<table cellpadding=5 cellspacing=1 align=center width='100%'>
		<tr bgcolor=#47637E><td colspan=2><font color="#FFFFFF">$langadcon[0]</font></td></tr><form action=$tf method=post>
		<tr bgcolor='#FFFFFF'><td colspan=2 align=center>$langadcc[0]</td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%>$langadcon[2] </td><td><input name=weburl2 type='text'  value="$weburl" size=20> $langadcon[3] </td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%>logo：</td><td><input name=logofile2 value="$logofile"  size=20></td></tr>

		<tr bgcolor='#FFFFFF'><td colspan=2 align=center>$langadcc[1]</td></tr>
		<tr bgcolor='#FFFFFF'><td> $langadcon[86] </td><td><input name=securedlogin2 type=radio value=1 $checksta49>$langadcs[0] <input name=securedlogin2 type=radio value=0 $checksta50>$langadcs[1] $langadcon[87] </td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%> $langadcon[4] </td><td><input name=maxlength2 value="$maxlength" size=20> B </td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%> $langadcon[5] </td><td><input name=artperpage2 value="$artperpage" size=20></td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%> $langadcon[6] </td><td><input name=columnstring2 value="$columnstring" size=20>  $langadcon[7]</td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%> $langadcon[8] </td><td>  <input name=onlinetime2 value="$onlinetime" size=20> Sec. </td></tr>
		<tr bgcolor='#FFFFFF'><td> $langadcon[9] </td><td><input name=usegzip2 type=radio value=1 $checksta31>$langadcs[0] <input name=usegzip2 type=radio value=0 $checksta32>$langadcs[1] </td></tr>
		<tr bgcolor='#FFFFFF'><td> $langadcon[10] </td><td><input name=censorship2 type=radio value=1 $checksta11>$langadcs[0] <input name=censorship2 type=radio value=0 $checksta12>$langadcs[1] <a href=admin_cp.php?job=ban target=_blank>$langadcon[11]</a></td></tr>
		<tr bgcolor='#FFFFFF'><td> $langadcon[12] </td><td><input name=htmlmode2 type=radio value=1 $checksta19>$langadcs[0] <input name=htmlmode2 type=radio value=0 $checksta20>$langadcs[1]</td></tr>
		<tr bgcolor='#FFFFFF'><td> $langadcon[13] </td><td><input name=allowfullcode2 type=radio value=1 $checksta3>$langadcs[0] <input name=allowfullcode2 type=radio value=0 $checksta4>$langadcs[1] </td></tr>
		<tr bgcolor='#FFFFFF'><td> 管理员阅读不计数 </td><td><input name=adminreadcount2 type=radio value=0 $checksta53>$langadcs[2] <input name=adminreadcount2 type=radio value=1 $checksta54>$langadcs[3] </td></tr>
		<tr bgcolor='#FFFFFF'><td> 自动缩略长URL </td><td><input name=autoshortenurl2 type=radio value=1 $checksta55>$langadcs[2] <input name=autoshortenurl2 type=radio value=0 $checksta56>$langadcs[3] </td></tr>

		<tr bgcolor='#FFFFFF'><td colspan=2 align=center>$langadcc[2]</td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%> $langadcon[14] </td><td><input name=extractlength2 value="$extractlength" size=20> B </td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%> $langadcon[15] </td><td><input name=extractperpage2 value="$extractperpage" size=20> $langadcon[69]</td></tr>
		<tr bgcolor='#FFFFFF'><td> $langadcon[16] </td><td><input name=alwaysuselist2 type=radio value=1 $checksta27>$langadcon[17] <input name=alwaysuselist2 type=radio value=0 $checksta28>$langadcon[18] </td></tr>	
		
		<tr bgcolor='#FFFFFF'><td colspan=2 align=center>$langadcc[3]</td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%> $langadcon[19] </td><td><input name=howmanynewart2 value="$howmanynewart" size=20></td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%> $langadcon[23] </td><td><input name=artwordy2 value="$artwordy" size=20> B </td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%> $langadcon[24] </td><td><input name=repwordy2 value="$repwordy" size=20> B </td></tr>
		<tr bgcolor='#FFFFFF'><td> $langadcon[25] </td><td><input name=fulltimemode2 type=radio value=1 $checksta5>$langadcs[2] <input name=fulltimemode2 type=radio value=0 $checksta6>$langadcs[3] </td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%> $langadcon[26] </td><td><input name=maxlinks2 value="$maxlinks" size=20> $langadcon[27]<input type=checkbox name=rolllinks2 value=1 $checksta35> $langadcon[28]</td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%> $langadcon[67] </td><td><input type=text name=archivenum2 value="$archivenum" size=3> $langadcon[68]</td></tr>
			
		<tr bgcolor='#FFFFFF'><td colspan=2 align=center>$langadcc[4]</td></tr>
		<tr bgcolor='#FFFFFF'><td> $langadcon[29] </td><td><input name=allowvisitorreply2 type=radio value=1 $checksta1>$langadcs[0] <input name=allowvisitorreply2 type=radio value=0 $checksta2>$langadcs[1] </td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%> $langadcon[82] </td><td><input name=minpostinterval2 value="$minpostinterval" size=10> Sec.</td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%> $langadcon[30] </td><td><input name=guestperpage2 value="$guestperpage" size=20></td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%> $langadcon[31] </td><td><input name=repperpage2 value="$repperpage" size=20></td></tr>
		<tr bgcolor='#FFFFFF'><td> $langadcon[32] </td><td><input name=allowreplyfull2 type=radio value=1 $checksta17>$langadcs[0] <input name=allowreplyfull2 type=radio value=0 $checksta18>$langadcs[1] ($langadcon[33])</td></tr>
		<tr bgcolor='#FFFFFF'><td> $langadcon[34] </td><td><input name=allowreg2 type=radio value=1 $checksta29>$langadcs[0] <input name=allowreg2 type=radio value=0 $checksta30>$langadcs[1] </td></tr>
		<tr bgcolor='#FFFFFF'><td> $langadcon[80] </td><td><input name=showgravatar2 type=radio value=1 $checksta47>$langadcs[0] <input name=showgravatar2 type=radio value=0 $checksta48>$langadcs[1]</td></tr>
		<tr bgcolor='#FFFFFF'><td> $langadcon[81] </td><td><input name=protectemailaddress2 type=radio value=1 $checksta51>$langadcs[0] <input name=protectemailaddress2 type=radio value=0 $checksta52>$langadcs[1]</td></tr>

		<tr bgcolor='#FFFFFF'><td colspan=2 align=center>$langadcc[6]</td></tr>
		<tr bgcolor='#FFFFFF'><td> $langadcon[70] </td><td><input name=searchinterval2 type=text value=$searchinterval>s <a href=admin_cp.php?job=ban target=_blank>$langadcon[75]</td></tr>
		
		<tr bgcolor='#FFFFFF'><td colspan=2 align=center>$langadcc[7]</td></tr>
		<tr bgcolor='#FFFFFF'><td> $langadcon[37] </td><td><input name=opengallery2 type=radio value=1 $checksta33>$langadcs[2] <input name=opengallery2 type=radio value=0 $checksta34>$langadcs[3]</td></tr>
		<tr bgcolor='#FFFFFF'><td> $langadcon[83] </td><td><input name=gal_perrow2 type=text value='$gal_perrow'></tr>
		<tr bgcolor='#FFFFFF'><td> $langadcon[84] </td><td><input name=gal_picperrow2 type=text value='$gal_picperrow'></tr>
		<tr bgcolor='#FFFFFF'><td> $langadcon[85] </td><td><input name=gal_picperpage2 type=text value='$gal_picperpage'></tr>

		<tr bgcolor='#FFFFFF'><td colspan=2 align=center>$langadcc[5]</td></tr>
		<tr bgcolor='#FFFFFF'><td> $langadcon[35] </td><td><input name=showprocesstime2 type=radio value=1 $checksta13>$langadcs[2] <input name=showprocesstime2 type=radio value=0 $checksta14>$langadcs[3] </td></tr>
		<tr bgcolor='#FFFFFF'><td> $langadcon[36] </td><td><input name=showannounce2 type=radio value=1 $checksta23>$langadcs[0] <input name=showannounce2 type=radio value=0 $checksta24>$langadcs[1]</td></tr>
		<tr bgcolor='#FFFFFF'><td> $langadcon[38] </td><td><input name=autoaddlink2 type=radio value=1 $checksta21>$langadcs[0] <input name=autoaddlink2 type=radio value=0 $checksta22>$langadcs[1] </td></tr>
		<tr bgcolor='#FFFFFF'><td> $langadcon[39] </td><td><input name=validation2 type=radio value=1 $checksta7>$langadcs[0] <input name=validation2 type=radio value=0 $checksta8>$langadcs[1] </td></tr>
		<tr bgcolor='#FFFFFF'><td> $langadcon[57] </td><td><input name=fixmozillabug2 type=radio value=1 $checksta37>$langadcs[0] <input name=fixmozillabug2 type=radio value=0 $checksta38>$langadcs[1] </td></tr>
		<tr bgcolor='#FFFFFF'><td> $langadcon[76] </td><td><select name=selflinkstatus2><option value=1  $checksta43>$langadcon[77]</option><option value=2 $checksta44>$langadcon[78]</option><option value=3 $checksta45>$langadcon[79]</option></select></td></tr>

		<input type=hidden name=action value=dochange>
		<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
		</td></tr></form>
		</table>
		</td></tr>
		</table>
eot;
require ("footer.php");
exit;
}

if ($action=="dochange") {
if (empty($timezone)) $timezone=0;
$newest="<? \n require_once(\"blog/dirconfig.php\");\n\$weburl=\"$weburl2\";\n\$logofile=\"$logofile2\";\n\$maxlength=$maxlength2;\n\$allowvisitorreply=$allowvisitorreply2;\n\$allowfullcode=$allowfullcode2;\n\$extractlength=$extractlength2;\n\$howmanynewart=$howmanynewart2;\n\$artperpage=$artperpage2;\n\$columnstring=\"$columnstring2\";\n\$fulltimemode=$fulltimemode2;\n\$validation=$validation2;\n\$censorship=$censorship2;\n\$showprocesstime=$showprocesstime2;\n\$repperpage=$repperpage2;\n\$showonline=$showonline2;\n\$onlinetime=$onlinetime2;\n\$allowreplyfull=$allowreplyfull2;\n\$timezone=$timezone;\n\$htmlmode=$htmlmode2;\n\$extractperpage=$extractperpage2;\n\$guestperpage=$guestperpage2;\n\$autoaddlink=$autoaddlink2;\n\$showannounce=$showannounce2;\n\$maxlinks=$maxlinks2;\n\$artwordy=$artwordy2;\n\$repwordy=$repwordy2;\n\$alwaysuselist=$alwaysuselist2;\n\$allowreg=$allowreg2;\n\$usegzip=$usegzip2;\n\$opengallery=$opengallery2;\n\$rolllinks=$rolllinks2;\n\$fixmozillabug=$fixmozillabug2;\n\$bloglang=\"$bloglang\";\n\$blogadminlang=\"$blogadminlang\";\n\$extracate=\"$extracate\";\n\$archivenum=$archivenum2;\n\$advancesearch=$advancesearch2;\n\$searchinterval=$searchinterval2;\n\$selflinkstatus=$selflinkstatus2;\n\$showgravatar=$showgravatar2;\n\$gal_picperrow=$gal_picperrow2;\n\$gal_picperpage=$gal_picperpage2;\n\$gal_perrow=$gal_perrow2;\n\$securedlogin=$securedlogin2;\n\$protectemailaddress=$protectemailaddress2;\n\$minpostinterval=$minpostinterval2;\n\$adminreadcount=$adminreadcount2;\n\$autoshortenurl=$autoshortenurl2;\n";
if (!empty($catsequence)) $newest.="\$catsequence=\"$catsequence\";\n";
if (!empty($myframe)) $newest.="\$myframe=\"$myframe\";\n";

if ($howmanynewart2!=$howmanynewart) {
	$howmanynewart=$howmanynewart2;
	updatenewestart();
	updatenewestrep ();
	updatenewesttb();
}

$newest=eregi_replace("=;", "=0;", $newest);
writetofile("blog/mblogcon.php", $newest);
msg_box($langsuccess,"$langadcon[56]<br><ul><li><a href= index.php>$langbacktoindex</a></li></ul><br><ul><li><a href=$tf>$langcontinue</a></li></ul>");
require("footer.php");
exit;
}

if ($action=="admintem") {
if (!file_exists("blog/tems.php")) die("<p align=center> <font color=red size=5>Error When Opening Template Directory. There's NO template at all!");

$alltems=@file("blog/tems.php");
$putblogtem.="<table width=95% align=center bgcolor=#B0C4D7 cellpadding=0 cellspacing=0><tr><td><table width=100% cellpadding=4 cellspacing=1>";
for ($i=0; $i<count($alltems); $i++) {
	$tmp=explode("|",$alltems[$i]);
	$putblogtem.="<tr bgcolor=#FFFFFF><td align=center><a href=index.php?tem=$tmp[2] target=_blank><img border=0 src=blog/template/temthumbs/$tmp[5]></a></td><td><INPUT type=radio value=$tmp[2] name=blogtem2> <font color=red><b>$tmp[1]</b></font> $langadcon[43] $tmp[3]<br>　　$tmp[4]<br>　　<a href=$tf&action=deltem&temid=$i> $langadcon[44] </a></td></tr>";
}
$putblogtem.="</table></table>";
if (!is_dir("blog/template/$blogtem")) $blogtem='default';
	@include ("blog/template/$blogtem/temname.txt");
	print <<< eot
		<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
		<tr><td>
		<table cellpadding=5 cellspacing=1 align=center width='100%'>
		<tr bgcolor=#47637E><td colspan=2><font color="#FFFFFF">$langadcon[41] $temname </font></td></tr><form action=$tf method=post>
		<tr bgcolor='#FFFFFF'><td colspan=2> $langadcon[42] </td></tr>
		<tr bgcolor='#FFFFFF'><td colspan=2>
		$putblogtem
		</td></tr>
		<input type=hidden name=action value=domodtem>
		<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
		</td></tr></form>
		<tr bgcolor='#FFFFFF'><td colspan=2>$langadcon[45]</td></tr>	
		<tr bgcolor='#FFFFFF'><td colspan=2 align=center>$langadcon[46]<br>
		<form action=$tf method=post><input type=hidden name=action value=addtem>
		<input type=text name=newtemname size=20> <input type=submit value=$langsubmit></form><br>		
		</td></tr>
		</table>
		</td></tr>
		</table>
eot;
	require("footer.php");
	exit;

}


if ($action=="domodtem") {
	if (empty($blogtem2)) $chpa=0;
	else $chpa=1;
	if (!foundtem($blogtem2) && $chpa<>0) {
	msg_box($langerror,"<br>$langadcon[47]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}

	if ($chpa==0) {
	msg_box($langsuccess,"<br>$langadcon[48]<br><ul><li><a href=mblog_change.php>$langback</a></li></ul>");
	exit;
	}
	$aatt=explode("|",$usertemp);
	$aatt[6]=$blogtem2;
	$atmp=implode("|",$aatt);
	writetofile("$diruser/userid.php", "$atmp");
	@unlink("$dirblog/cache_calendar.php");
	msg_box($langsuccess,"$langadcon[49]<br><ul><li><a href= index.php>$langbacktoindex</a></li></ul><br><ul><li><a href=$tf&action=admintem>$langback</a></li></ul>");
	require("footer.php");
	exit;
}


if ($action=="addtem") {
if ((!$newtemname) || !file_exists("blog/template/$newtemname/installinfo.txt")) {
	msg_box($langerror,"$langadcon[50]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
	exit;
}

require ("blog/template/$newtemname/installinfo.txt");
$newest="<?die();?".">|{$thistemname}|{$newtemname}|{$thisauthor}|{$thisdesc}|{$thisthumb}|\n";
$tmp=@readfromfile("blog/tems.php");
writetofile("blog/tems.php", $tmp.$newest);
msg_box($langsuccess,"$langadcon[51]<br><ul><li><a href=$tf&action=admintem>$langback</a></li></ul>");
require("footer.php");
exit;
}



if ($action=="deltem") {
	if ($temid=="") {
	msg_box($langerror,"$langadcon[52]<br><ul><li><a href=$tf&action=admintem>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}
	unset($tmp);
	$tmp=@file("blog/tems.php");
	if ($temid>=count($tmp)) {
	msg_box($langerror,"$langadcon[53]<br><ul><li><a href=$tf&action=admintem>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}
	$checktem=explode("|", $tmp[$temid]);
	if ($blogtem==$checktem[2]) {
	msg_box($langerror,"$langadcon[54]<br><ul><li><a href=$tf&action=admintem>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}	
	$tmp[$temid]= "";
	$tt=implode("",$tmp);
	writetofile("blog/tems.php",$tt);
	msg_box($langsuccess,"$langadcon[55]<br><ul><li><a href= $tf&action=admintem>$langcontinue</a></li></ul><br><ul><li><a href=$tf>$langback</a></li></ul>");
	require("footer.php");
	exit;

}

if ($action=="setlang") {
	$alllangs=@file("blog/langlist.php");
	for ($i=0; $i<count($alllangs); $i++) {
		$thislang=@explode("|", $alllangs[$i]);
		if ($thislang[1]==$bloglang) $means='selected';
		else $means='';
		if ($thislang[1]==$blogadminlang) $means2='selected';
		else $means2='';
		$langtb.="<option value='$thislang[1]' {$means}>$thislang[2]</option>";
		$langtb2.="<option value='$thislang[1]' {$means2}>$thislang[2]</option>";
	}
	print <<< eot
		<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
		<tr><td>
		<table cellpadding=5 cellspacing=1 align=center width='100%'>
		<tr bgcolor=#47637E><td><font color="#FFFFFF">Set Default Language Pack (Front End)</font></td></tr><form action=$tf method=post>
		<tr bgcolor='#FFFFFF'><td><select name='tarlang'> $langtb </select><input type='hidden' name='action' value='dosetlang'></td></tr>
		<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
		</td></tr></form>
		</td></tr>
		</table>
		</td></tr>
		</table><br>
		<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
		<tr><td>
		<table cellpadding=5 cellspacing=1 align=center width='100%'>
		<tr bgcolor=#47637E><td><font color="#FFFFFF">Set Default Language Pack (Admin Center)</font></td></tr><form action=$tf method=post>
		<tr bgcolor='#FFFFFF'><td><select name='tarlang'> $langtb2 </select><input type='hidden' name='action' value='dosetadminlang'><br>
		Attention: Some language pack does not cover the ADMIN CENTER. In such a case the system language pack (ZH-CN) will be loaded. </td></tr>
		<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
		</td></tr></form>
		</td></tr>
		</table>
		</td></tr>
		</table>
eot;
	require("footer.php");
	exit;
}

if ($action=="dosetlang") {
$newest=@file("blog/mblogcon.php");
$allthese=count($newest);
for ($i=0; $i<$allthese; $i++) {
	if (eregi("bloglang=", $newest[$i])) {
		$newest[$i]="\$bloglang=\"$tarlang\";\n";
		$saved=1;
		break;
	}
}
if ($saved!=1) {
	$newest[$allthese]="\$bloglang=\"$tarlang\";\n";
}
$newestp=eregi_replace("=;", "=0;", @implode("", $newest));

writetofile("blog/mblogcon.php", $newestp);



msg_box($langsuccess,"$langadcon[56]<br><ul><li><a href= index.php>$langbacktoindex</a></li></ul><br>");
require("footer.php");
exit;
}

if ($action=="dosetadminlang") {
$newest=@file("blog/mblogcon.php");
$allthese=count($newest);
for ($i=0; $i<$allthese; $i++) {
	if (eregi("blogadminlang=", $newest[$i])) {
		$newest[$i]="\$blogadminlang=\"$tarlang\";\n";
		$saved=1;
		break;
	}
}
if ($saved!=1) {
	$newest[$allthese]="\$blogadminlang=\"$tarlang\";\n";
}
$newestp=eregi_replace("=;", "=0;", @implode("", $newest));

writetofile("blog/mblogcon.php", $newestp);

//开始同步编辑器的语言
if (file_exists("blog/language/$tarlang/admined.lang.php")) {
	$admineds=readfromfile("blog/language/$tarlang/admined.lang.php");
	writetofile("htmlarea/popups/poplang.php", $admineds);
	include_once ("blog/language/$tarlang/admined.lang.php");
	$ccedit=readfromfile("include/module.js.tpl");
	$ccedit=str_replace("__&&langaet[1]&&__", $langaer[0], $ccedit);
	writetofile ("img/module.js",$ccedit);
}
if (file_exists("blog/language/$tarlang/adminjs.php")) {
	$adminjs=readfromfile("blog/language/$tarlang/adminjs.php");
	writetofile ("htmlarea/lang/gb.js", $adminjs);
}

msg_box($langsuccess,"$langadcon[56]<br><ul><li><a href='admin.php' target='_parent'>Refresh Admin Center</a></li></ul><ul><li><a href=index.php>$langbacktoindex</a></li></ul><br>");
require("footer.php");
exit;
}

if ($action=="adminlang") {
$alllangs=@file("blog/langlist.php");
for ($i=0; $i<count($alllangs); $i++) {
	$tmp=explode("|",$alllangs[$i]);
	if ($tmp[1]!='zh_cn') $putlangs.="<option value='$i'>$tmp[2]</option>";
	else $putlangs.="<option value=''>$tmp[2] {$langadcon[59]}</option>";
}
	print <<< eot
		<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
		<tr><td>
		<table cellpadding=5 cellspacing=1 align=center width='100%'>
		<tr bgcolor='#47637E'><td colspan=2><font color="#FFFFFF">$langadcon[62]</font></td></tr>	
		<tr bgcolor='#FFFFFF'><td colspan=2><form action=$tf method=post><input type=hidden name=action value=doaddlang>
		$langadcon[63] <input type=text name='tarlang' size=20> <br> $langadcon[64] <input type=text name='tarlangname' size=20> <input type=submit value=$langsubmit></form>		
		</td></tr>
		<tr bgcolor=#47637E><td colspan=2><font color="#FFFFFF">$langadcon[60]</font></td></tr><form action=$tf method=post>
		<tr bgcolor='#FFFFFF'><td> $langadcon[61] </td>
		<td><select name='tarlang'> $putlangs </select></td></tr>
		<input type=hidden name=action value=dodellang>
		<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
		</td></tr></form>
		</table>
		</td></tr>
		</table>
eot;
	require("footer.php");
	exit;
}

if ($action=="dodellang") {
$alllangs=@file("blog/langlist.php");
if ($tarlang!='') $alllangs[$tarlang]='';
$put=implode("", $alllangs);
writetofile("blog/langlist.php", $put);
msg_box($langsuccess,"$langadcon[58]<br><ul><li><a href= index.php>$langbacktoindex</a></li></ul><br><ul><li><a href=$tf&action=adminlang>$langcontinue</a></li></ul>");
require("footer.php");
exit;
}

if ($action=="doaddlang") {
if (!$tarlang || !is_dir("blog/language/$tarlang")) {
msg_box($langerror,"$langadcon[65]<br><ul><li><a href=$tf&action=adminlang>$langback</a></li></ul>");
require("footer.php");
exit;
}	
if (!$tarlangname) {
msg_box($langerror,"$langadcon[66]<br><ul><li><a href=$tf&action=adminlang>$langback</a></li></ul>");
require("footer.php");
exit;
}	

$added="<?die();?>|$tarlang|$tarlangname|\n";
writetofile("blog/langlist.php", $added.readfromfile("blog/langlist.php"));
msg_box($langsuccess,"$langadcon[58]<br><ul><li><a href= index.php>$langbacktoindex</a></li></ul><br><ul><li><a href=$tf&action=adminlang>$langcontinue</a></li></ul>");
require("footer.php");
exit;
}

?>