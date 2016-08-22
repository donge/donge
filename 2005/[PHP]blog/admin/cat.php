<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$blogadminlang/adminct.lang.php"); //引入语言包

$tf="admin_cp.php?job=cat";


if (empty($action)) exit();

if ($action=="readynew") {
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
  editor = new HTMLArea("catdes");

  editor.generate();
  return false;
}
</script>
<body onload="initEditor()">
eot;
print <<< eot
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 align=center width='100%'>
	<tr bgcolor=#47637E><td colspan=2><font color="#FFFFFF">$langact[0]</font></td></tr><form action=$tf method=post><tr bgcolor='#FFFFFF'><td>
	<input name=action type=hidden value="newcatname">$langact[1] <input type=text name=catval maxlength=10><br><br> $langact[36] <textarea name=catdes id=catdes rows=20 cols=60></textarea> </td></tr>
	<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
	</td></tr></form>
	</table>
	</td></tr>
	</table>
	</td></tr>
	</table>
eot;
	require("footer.php");
}

if ($action=="modcat") {
	if (file_exists("$dirblog/cat.php")) {
	unset($tmp);
	$tmp=getcats();
print <<< eot
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 align=center width='100%'>
	<tr bgcolor=#47637E><td colspan=2><font color="#FFFFFF">$langact[2]</font></td></tr><form action=$tf method=post>
	<tr bgcolor='#FFFFFF'><td width=20%>$langact[3]</td><td>$tmp</td></tr>
	<input name=action type=hidden value="changecatproperty">
	<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langsubmit>
	</td></tr></form>
	</table>
	</td></tr>
	</table>
eot;
	require("footer.php");
	}
}

if ($action=="changecatproperty") {
	if ($cat=="") {
	msg_box($langerror,"$langerrorfor<br>$langact[7]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	unset($all);
	$all=@file("$dirblog/cat.php");
	for ($i=0;$i<count($all); $i++) {
		$tmp=explode("|",$all[$i]);
		if ($tmp[1]==$cat) {
			$catnameold=$tmp[2];
			$catdesold=safe_invert(stripslashes($tmp[3]));
			break;
		}
	}
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
  editor = new HTMLArea("catdes");

  editor.generate();
  return false;
}
</script>
<body onload="initEditor()">
eot;
print <<< eot
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 align=center width='100%'>
	<tr bgcolor=#47637E><td colspan=2><font color="#FFFFFF">$langact[2] - $catnameold</font></td></tr><form action=$tf method=post>	<input name=action type=hidden value="changecatname"><input name=cat type=hidden value="$cat">
	<tr bgcolor='#FFFFFF'><td>$langact[4]</td><td><input type=text name=catval value="$catnameold"></td></tr>
	<tr bgcolor='#FFFFFF'><td>$langact[36] </td><td> <textarea name=catdes id=catdes rows=20 cols=60>$catdesold</textarea> </td></tr>
	<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
eot;
require("footer.php");
}

if ($action=="readydel") {
	if (file_exists("$dirblog/cat.php")) {
	unset($tmp);
	$tmp=getcats();
	$tmp2=getcats("trans");
print <<< eot
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 align=center width='100%'>
	<tr bgcolor=#47637E><td colspan=2><font color="#FFFFFF">$langact[5]</font></td></tr><form action=$tf method=post>
	<tr bgcolor='#FFFFFF'><td width=20%>$langact[3]</td><td>$tmp</td></tr>
	<tr bgcolor='#FFFFFF'><td><input name=action type=hidden value="delcat">$langact[6] </td><td>$tmp2</td></tr>
	<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
	</td></tr></form>
	</table>
	</td></tr>
	</table>
eot;
	require("footer.php");
	}
}

if ($action=="changecatname") {
	unset($all);
	if ($cat=="") {	msg_box($langerror,"$langerrorfor<br>$langact[7]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	if (empty($catval)|| namequalified($catval)==0) {	msg_box($langerror,"$langerrorfor<br>$langact[8]<br>$langact[9]<br>$langact[10]<br>$langact[11]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	$newname=safe_convert($catval);
	$catdes=minor_safe_convert($catdes);
	$all=@file("$dirblog/cat.php");
	for ($i=0;$i<count($all); $i++) {
		$tmp=explode("|",$all[$i]);
		if ($tmp[1]==$cat) {
			$all[$i]="$tmp[0]|$tmp[1]|$newname|$catdes|\n";
			break;
		}
	}
	$all1=implode("",$all);
	writetofile("$dirblog/cat.php", $all1);
	msg_box($langsuccess,"$langact[12]<br><ul><li><a href= index.php>$langbacktoindex</a></li></ul><br><ul><li><a href=$tf&action=modcat>$langcontinue</a></li></ul>");
	require("footer.php");
	exit;
}


if ($action=="newcatname") {
	if ($catval=="" || namequalified($catval)==0) {	msg_box($langerror,"$langerrorfor<br>$langact[8]<br>$langact[9]<br>$langact[10]<br>$langact[11]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	$newname=safe_convert($catval);
	$catdes=minor_safe_convert($catdes);
	$all=@file("$dirblog/cat.php");
	$allall=implode("",$all);
	$maxcatnum=0;
	for ($i=0;$i<count($all); $i++) {
		$tmp=explode("|",$all[$i]);
		if ($tmp[1]>$maxcatnum) {
			$maxcatnum=$tmp[1];
		}
	}
	$maxcatnum+=1;
	unset($tmp);
	$tmp="<?exit();|$maxcatnum|$newname|$catdes|\n";
	writetofile("$dirblog/cat.php", $allall.$tmp);
	writetofile("$dirblog/$maxcatnum.php", "");
	if (!empty($catsequence)) {//同步分类顺序
		$tmpa=@file("blog/mblogcon.php");
		for ($i=0; $i<count($tmpa); $i++) {
			if (eregi("catsequence", $tmpa[$i])) {
				$tmpa[$i]="\$catsequence=\"$catsequence"."-".$maxcatnum."\";\n";
				break;
			}
		}
		$cto=implode("",$tmpa);
		writetofile("blog/mblogcon.php", $cto);
	}
	
	msg_box($langsuccess,"$langact[13]<br><ul><li><a href= index.php>$langbacktoindex</a></li></ul><br><ul><li><a href=$tf&action=modcat>$langcontinue</a></li></ul>");
	require("footer.php");
	exit;
}


if ($action=="delcat") {
	if ($cat=="" || $tocat=="") {	msg_box($langerror,"$langerrorfor<br>$langact[7]<br>$langact[14]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	msg_box($langconfirm,"$langact[15]<br><ul><li><a href=$tf&action=dodelcat&cat=$cat&tocat=$tocat>$langsure</a></li></ul><br><ul><li><a href=$tf&action=modcat>$langback</a></li></ul>");
	require("footer.php");
	exit;
}

if ($action=="dodelcat") {
	if ($cat=="" || $tocat=="") {	msg_box($langerror,"$langerrorfor<br>$langact[7]<br>$langact[14]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	if ($cat==$tocat) {	msg_box($langerror,"$langerrorfor<br>$langact[16]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	$all=@file("$dirblog/cat.php");
	for ($i=0;$i<count($all); $i++) {
		$tmp=explode("|",$all[$i]);
		if ($tmp[1]==$cat) {
			$all[$i]="";
			break;
		}
	}
	writetofile("$dirblog/cat.php", @implode("",$all));

	unset ($all);
	$all=@file("$dirblog/list.php");
	for ($i=0;$i<count($all); $i++) {
		$tmp=explode("|",$all[$i]);
		if ($tmp[4]==$cat) {
			if ($tocat!="remove") 
			{$tmp[4]=$tocat;
			$all[$i]=implode("|",$tmp);
			$appendtocat[]=$all[$i];
			} else {
			$all[$i]="";
			@unlink ("$dirblog/$tmp[1].art");
			@unlink ("$dirblog/$tmp[1].rep");
			@unlink ("$dirblog/$tmp[1].rpl");
			}
		}
	}
	writetofile("$dirblog/list.php", @implode("",$all));

	if ($tocat!="remove")  {
		$catgoto=@file("$dirblog/$tocat.php");
		$catgoto2=@array_merge($catgoto, $appendtocat);
		@arsort ($catgoto2);
		$all11=@implode("",$catgoto2);
		writetofile("$dirblog/$tocat.php",$all11);
	}

	@unlink("$dirblog/$cat.php");
	updatenewestart();
	$tmpa=@file("blog/mblogcon.php");
	for ($i=0; $i<count($tmpa); $i++) {
	if (eregi("catsequence", $tmpa[$i])) {
		$tmpa[$i]="";
		break;
	}
	}
	$cto=implode("",$tmpa);
	writetofile("blog/mblogcon.php", $cto);

	if (file_exists("blog/sticky.php")) require("blog/sticky.php");
	$bsti=@explode("|",$sticky);
	if ($cat==$bsti[4]) { //置顶若为删除的分类，则取消置顶
	 	$newest="<?\n\$sticky=\"\";\n\$announce=\"$announce\";";
		writetofile("blog/sticky.php", $newest);
	}

	msg_box($langsuccess,"$langact[17]<br>$langact[18]<br><ul><li><a href='admin_cp.php?job=maintain&action=domain'>$langact[19]</a></li></ul><br><ul><li><a href=$tf&action=modcat>$langcontinue</a></li></ul>");
	require("footer.php");
	exit;
}


if ($action=="sort") {
	$navall=@file("$dirblog/cat.php");
	for ($i=0;$i<count($navall); $i++) {
		$catnames=explode("|",$navall[$i]);
		$biao.=$catnames[1]." - ".$catnames[2]." " ;
		$biao1[]="<input size=2 maxlength=2 name=catseq".$i."> "; 
}
$biao2=implode(" - ",$biao1);

print <<< eot
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 align=center width='100%'>
	<tr bgcolor=#47637E><td><font color="#FFFFFF">$langact[20]</font></td></tr><form action=$tf&action=dosetseq method=post>
	<tr bgcolor='#FFFFFF'><td>$langact[21] $biao</td></tr>
	<tr bgcolor='#FFFFFF'><td>$langact[22]  <br>$biao2<br>$langact[23]</td></tr>
	<tr bgcolor='#FFFFFF'><td align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset> <input type='button' value='$langact[24]' onclick="window.location='$tf&action=resetsort'">
	</td></tr></form>
	</table>
	</td></tr>
	</table>
eot;
	require("footer.php");
}

if ($action=="dosetseq") {
	$navall=@file("$dirblog/cat.php");
	for ($i=0;$i<count($navall); $i++) {
		$tmp="catseq".$i;
		$biao1[]=$$tmp;
}
$desseq=implode("-",$biao1);
$tmpa=@file("blog/mblogcon.php");
for ($i=0; $i<count($tmpa); $i++) {
	if (eregi("catsequence", $tmpa[$i])) {
		$tmpa[$i]="\$catsequence=\"$desseq\";\n";
		$isfound=1;
		break;
	}
}
if ($isfound!=1) {
	$banum=count($tmpa);
	$tmpa[$banum]="\n\$catsequence=\"$desseq\";\n";
}
$cto=implode("",$tmpa);
writetofile("blog/mblogcon.php", $cto);
msg_box($langsuccess,"$langact[25]<br><ul><li><a href=$tf&action=sort>$langback</a></li></ul><br><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
require("footer.php");
exit;
}


if ($action=="resetsort") {
$tmpa=@file("blog/mblogcon.php");
for ($i=0; $i<count($tmpa); $i++) {
	if (eregi("catsequence", $tmpa[$i])) {
		$tmpa[$i]="";
		break;
	}
}
$cto=implode("",$tmpa);
writetofile("blog/mblogcon.php", $cto);
msg_box($langsuccess,"$langact[25]<br><ul><li><a href=$tf&action=sort>$langback</a></li></ul><br><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
require("footer.php");
exit;
}

if ($action=="redirect") {
if (file_exists("$dirblog/redirection.php")) {
	unset($tmp);
	$tmp=file("$dirblog/redirection.php");
	if (count($tmp)==0) $redirection="<tr bgcolor=white><td>$langact[26]</td></tr>";
	for ($i=0; $i<count($tmp); $i++) {
		$tk=explode("|",$tmp[$i]);
		$redirection.="<tr bgcolor=white><td width=20%>$tk[1]</td><td width=60%>$tk[2]</td><td><a href=$tf&action=editredirect&no=$i>$langact[27]</a></td><td><a href=$tf&action=delredirect&no=$i>$langact[28]</a></td></tr>";
	}
}
else $redirection="<tr bgcolor=white><td>$langact[26]</td></tr>";
print <<< eot
	<div align=center>$langact[29]</div>
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 align=center width='100%'>
	<tr bgcolor=#47637E><td colspan=2><font color="#FFFFFF">$langact[30]</font></td></tr><form action=$tf method=post>
	<tr bgcolor='#FFFFFF'><td width=20%>$langact[31]</td><td><input name=newname  maxlength=30 size=30></td></tr>
	<tr bgcolor='#FFFFFF'><td width=20%>$langact[32]</td><td><input name=newurl  maxlength=70 size=30></td></tr>
	<input type=hidden name=action value=addredirect>
	<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
	</td></tr></form>
	</table>
	</td></tr>
	</table>
<br>
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 align=center width='100%'>
	<tr bgcolor=#47637E><td colspan=4><font color="#FFFFFF">$langact[33]</font></td></tr>
	$redirection
	</table>
	</td></tr>
	</table>	
eot;
	require("footer.php");
}

if ($action=="addredirect") {
	unset($tmp);
	$tmp=@readfromfile("$dirblog/redirection.php");
	$newname=safe_convert($newname);
	writetofile ("$dirblog/redirection.php", $tmp."<?die();?".">|$newname|$newurl|\n");
	updateredirection();
	msg_box($langsuccess,"$langact[34]<br><ul><li><a href= index.php>$langbacktoindex</a></li></ul><br><ul><li><a href=$tf&action=redirect>$langcontinue</a></li></ul>");
	require("footer.php");
	exit;
}

if ($action=="editredirect") {
	if ($no=="") {
	msg_box($langerror,"$langact[35]<br><ul><li><a href=$tf&action=redirect>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}
	unset($tmp);
	$tmp=@file("$dirblog/redirection.php");
	$atmp=explode("|",$tmp[$no]);
print<<<eot
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 align=center width='100%'>
	<tr bgcolor=#47637E><td colspan=2><font color="#FFFFFF">$langact[33]</font></td></tr><form action=$tf method=post>
	<tr bgcolor='#FFFFFF'><td width=20%>$langact[31]</td><td><input name=newname  value=$atmp[1] maxlength=30 size=30></td></tr>
	<tr bgcolor='#FFFFFF'><td width=20%>$langact[32]</td><td><input name=newurl value='$atmp[2]' maxlength=70 size=30></td></tr>
	<input type=hidden name=action value=doeditredirect>
	<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
	</td></tr><input type=hidden name="no" value=$no>
	</form>
	</table>
	</td></tr>
	</table>
eot;
require("footer.php");
}

if ($action=="doeditredirect") {
	if ($no=="") {
	msg_box($langerror,"$langact[35]<br><ul><li><a href=$tf&action=redirect>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}
	unset($tmp);
	$tmp=@file("$dirblog/redirection.php");
	$newname=safe_convert($newname);
	$tmp[$no]= "<?die();?".">|$newname|$newurl|\n";
	$tt=implode("",$tmp);
	writetofile("$dirblog/redirection.php",$tt);
	updateredirection();
	msg_box($langsuccess,"$langact[34]<br><ul><li><a href= index.php>$langbacktoindex</a></li></ul><br><ul><li><a href=$tf&action=redirect>$langcontinue</a></li></ul>");
	require("footer.php");
	exit;
}


if ($action=="delredirect") {
	if ($no=="") {
	msg_box($langerror,"$langact[35]<br><ul><li><a href=$tf&action=redirect>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}
	unset($tmp);
	$tmp=@file("$dirblog/redirection.php");
	$tmp[$no]= "";
	$tt=implode("",$tmp);
	writetofile("$dirblog/redirection.php",$tt);
	updateredirection();
	msg_box($langsuccess,"$langact[34]<br><ul><li><a href= index.php>$langbacktoindex</a></li></ul><br><ul><li><a href=$tf&action=redirect>$langback</a></li></ul>");
	require("footer.php");
	exit;
}
