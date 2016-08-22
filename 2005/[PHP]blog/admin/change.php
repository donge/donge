<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$blogadminlang/admin.lang.php"); //引入语言包

$tf="admin_cp.php?job=change";

if (empty($action)) $action="info";

if ($action=="info") {	
	list  ($visit, $articlenum, $reply_single, $todayvisit, $regusers) = countvisit(1);
	$copyrighttext=@readfromfile("blog/language/$blogadminlang/copyright.txt");
	$copyrighttext="<textarea rows=8 cols=60>$copyrighttext</textarea>";
	print <<< eot
		<table cellpadding=0 cellspacing=0 align=center width='95%' bgcolor='#000000'>
		<tr><td>
		<table cellpadding=5 cellspacing=1 width='100%' heoght=400>
		<tr bgcolor='#E9F2FC'><td><font color="#000000">$langad[0]</font></td></tr>
		<tr bgcolor='#FFFFFF'><td>$langad[1]<BR><BR>
		$langad[2] $versioninfo<BR>
		$langad[3]<BR>
		$langad[4] UTF-8<BR>
		$langad[5] Bob Shen <BR>
		$langad[6] <A HREF="#" target=_blank>CNHK</A> , <A HREF="http://www.iy114.com" target=_blank>Ghost</A> , <A HREF="http://www.lain1978.com" target=_blank>Lain</A> , <A HREF="http://blog.liu21st.com" target=_blank>Liu21st</A> , <a href="http://www.bmforum.com" target=_blank>msxcms</a> , <a href="http://stariver.org" target=_blank>Stariver</a> , <a href="http://www.ongod.org" target=_blank>xiaoyu</a> , <A HREF="http://wulicn.51.net" target=_blank>zxfhero</A> , <a href="http://www.91x.net" target=_blank>九州未来</a> , <A HREF="http://www.udchina.com" target=_blank>垃圾猫</A> ,  <A HREF="http://www.sinid.com" target=_blank>密码遗失</A> , <A HREF="http://jack35.no-ip.com/jack/"  target=_blank>黑傑克</A><BR>
		<!--$langad[7] <A HREF=""  target=_blank><font color=green><b></b></font></A><BR>-->
		$langad[8] <A HREF="http://www.bo-blog.com"  target=_blank>$langad[14] www.bo-blog.com</A>
		<BR>		</td></tr>
		
		<tr bgcolor='#FFFFFF'><td>$langad[9]<BR><BR>
		$langad[10] $visit <BR>
		$langad[11] $articlenum<BR>
		$langad[12] $reply_single<BR>
		$langad[64] $regusers<BR>
		<a href="$tf&action=phpinfo">$langad[13]</a><br></td></tr>
		
		<tr bgcolor='#FFFFFF'><td>$langad[67]<BR><BR>
		$copyrighttext
		<br></td></tr>
		
		</table>
		</td></tr>
		</table>
eot;
		require("footer.php");

}

if ($action=="modreg") {
	print <<< eot
		<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
		<tr><td>
		<table cellpadding=5 cellspacing=1 align=center width='100%'>
		<tr bgcolor=#47637E><td colspan=2><font color="#FFFFFF">$langad[15] (加*号为必填)</font></td></tr><form action=$tf method=post>
		<tr bgcolor='#FFFFFF'><td colspan=2></td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%>$langad[16]</td><td><input name=userpassword2 type='password'  size=20></td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%>$langad[20]</td><td><input name=repass type='password' size=20></td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%>*$langad[21]</td><td><input name=username2 value="$username" size=20> 
		<tr bgcolor='#FFFFFF'><td width=20%>*$langad[22]</td><td><input name=useremail2 value="$useremail" size=30></td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%>*$langad[23]</td><td><input name=blogname2 value="$blogname" size=20></td></tr>
		<tr bgcolor='#FFFFFF'><td>*$langad[24]</td><td><input name=blogdc2 value="$blogdc"  size=50> </td></tr>
		<input type=hidden name=action value=domodreg>
		<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
		</td></tr></form>
		</table>
		</td></tr>
		</table>
eot;
require ("footer.php");
exit;
}

if ($action=="domodreg") {

	if (!empty($userpassword2)) $chpa=1;
	if (!empty($userpassword2) && pswqualified($userpassword2)==0) {
	msg_box($langerror,"$langerrorfor<br>$langad[27]<br>$langerrordanger<br>$langerrorlength<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	if (($userpassword2<>$repass)){
	msg_box($langerror,"$langerrorfor<br>$langad[28]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	if (empty($useremail2) || emailqualified($useremail2)==0) {
	msg_box($langerror,"$langerrorfor<br>$langad[29]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}

	if (empty($username2) ) {
	msg_box($langerror,"$langerrorfor<br>$langad[30]<ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}


	if (empty($blogname2) || blogdcqualified($blogname2)==0 ) {
	msg_box($langerror,"$langerrorfor<br>$langad[31]<br>$langerrordanger<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	if (empty($blogdc2) || blogdcqualified($blogdc2)==0) {
	msg_box($langerror,"$langerrorfor<br>$langad[32]<br>$langerrordanger<br>$langerrorlength<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}

	$blogdc=safe_convert($blogdc2);
	if ($chpa==1) $userpassword=md5($userpassword2);

	$newest="<?die();?".">|$username2|$userpassword|$blogname2|$blogdc|$regitime|$blogtem|$useremail2|$category|none.gif|$regip|||unused1|unused2|unused3|unused4|unused5|\n";
	writetofile("$diruser/userid.php", $newest);
	msg_box($langsuccess,"$langad[34]<br><ul><li><a href= index.php>$langbacktoindex</a></li></ul><br><ul><li><a href=$tf>$langcontinue</a></li></ul>");
	require("footer.php");
	exit;
}


if ($action=="modlink") {
	if (file_exists("$dirblog/waitinglinks.php")) {
	unset($tmp);
	$tmp=file("$dirblog/waitinglinks.php");
	if (count($tmp)==0) $selflinks="<tr bgcolor=white><td>$langad[35]</td></tr>";
	for ($i=0; $i<count($tmp); $i++) {
		$tk=explode("|",$tmp[$i]);
		$tk[1]=stripslashes($tk[1]);
		if ($tk[3]=="pic") $tk[1].="<br><img src=\"$tk[4]\">";
		$selflinks.="<tr bgcolor=white><td width=20%>$tk[1]</td><td><a href=$tk[2] target=_blank>$tk[2]</a></td><td><a href='$tf&action=addselflink&no=$i'>$langad[36]</a></td><td><a href='$tf&action=addselflink&no=$i&onlytext=1'>$langad[65]</a></td><td><a href='$tf&action=delselflink&no=$i'>$langad[37]</a></td></tr>";
	}
}
else $selflinks="<tr bgcolor=white><td>$langad[35]</td></tr>";

if (file_exists("$dirblog/links.php")) {
	unset($tmp);
	$tmp=file("$dirblog/links.php");
	if (count($tmp)==0) $links="<tr bgcolor=white><td>$langad[38]</td></tr>";
	for ($i=0; $i<count($tmp); $i++) {
		$tk=explode("|",$tmp[$i]);
		$tk[1]=stripslashes($tk[1]);
		$links.="<tr bgcolor=white><td width=20%>$tk[1]</td><td width=60%>$tk[2]</td><td><a href=$tf&action=editlink&no=$i>$langad[39]</a></td><td><a href=$tf&action=dellink&no=$i>$langad[40]</a></td></tr>";
	}
}
else $links="<tr bgcolor=white><td>$langad[38]</td></tr>";
print <<< eot
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 align=center width='100%'>
	<tr bgcolor=#47637E><td colspan=2><font color="#FFFFFF">$langad[41]</font></td></tr><form action=$tf method=post>
	<tr bgcolor='#FFFFFF'><td width=20%>$langad[42]</td><td><input name=newname  size=30></td></tr>
	<tr bgcolor='#FFFFFF'><td width=20%>$langad[43]</td><td><input name=newurl  maxlength=70 size=30></td></tr>
	<tr bgcolor='#FFFFFF'><td width=20%>logo：</td><td><input name=newlogo  maxlength=80 size=30> $langad[44]</td></tr>
	<input type=hidden name=action value=addlink>
	<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
	</td></tr></form>
	</table>
	</td></tr>
	</table>
<br>
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 align=center width='100%'>
	<tr bgcolor=#47637E><td colspan=4><font color="#FFFFFF">$langad[45]</font></td></tr>
	$links
	</table>
	</td></tr>
	</table>
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td>
	<table cellpadding=1 cellspacing=1 align=center width='100%'>
	<tr bgcolor=#47637E><td colspan=6><font color="#FFFFFF">$langad[46]</font></td></tr>
	$selflinks
	</table>
	</td></tr>
	</table>
	
eot;
	require("footer.php");

}

if ($action=="addlink") {
	unset($tmp);
	$tmp=@readfromfile("$dirblog/links.php");
	$newname=safe_convert($newname);
	if (strpos($tmp, "|$newurl|"))  {
		msg_box($langerror,"$langad[18]<br><ul><li><a href=$tf&action=modlink>$langback</a></li></ul>");
		require("footer.php");
		exit;
	}

	if (!empty($newlogo)) 	writetofile("$dirblog/links.php", $tmp."<?die();?".">|$newname|$newurl|pic|$newlogo|\n");
	else writetofile("$dirblog/links.php", $tmp."<?die();?".">|$newname|$newurl|\n");
	updatelinks();
	msg_box($langsuccess,"$langad[47]<br><ul><li><a href= index.php>$langbacktoindex</a></li></ul><br><ul><li><a href=$tf&action=modlink>$langcontinue</a></li></ul>");
	require("footer.php");
	exit;
}


if ($action=="editlink") {
	if ($no=="") {
	msg_box($langerror,"$langad[48]<br><ul><li><a href=$tf&action=modlink>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}
	unset($tmp);
	$tmp=@file("$dirblog/links.php");
	if ($no>=count($tmp)) {
	msg_box($langerror,"$langad[49]<br><ul><li><a href=$tf&action=modlink>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}
	$atmp=explode("|",$tmp[$no]);
	if ($atmp[3]!="pic") $atmp[4]=""; 
	$atmp[1]=stripslashes($atmp[1]);
print<<<eot
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 align=center width='100%'>
	<tr bgcolor=#47637E><td colspan=2><font color="#FFFFFF">$langad[50]</font></td></tr><form action=$tf method=post>
	<tr bgcolor='#FFFFFF'><td width=20%>$langad[42]</td><td><input name=newname  value="$atmp[1]" size=30></td></tr>
	<tr bgcolor='#FFFFFF'><td width=20%>$langad[43]</td><td><input name=newurl value="$atmp[2]" maxlength=70 size=30></td></tr>
	<tr bgcolor='#FFFFFF'><td width=20%>logo：</td><td><input name=newlogo  maxlength=80 size=30 value='$atmp[4]'> $langad[44]</td></tr>
	<input type=hidden name=action value=doeditlink>
	<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
	</td></tr><input type=hidden name="no" value=$no>
	</form>
	</table>
	</td></tr>
	</table>
eot;
require("footer.php");
}


if ($action=="doeditlink") {
	if ($no=="") {
	msg_box($langerror,"$langad[48]<br><ul><li><a href=$tf&action=modlink>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}
	unset($tmp);
	$tmp=@file("$dirblog/links.php");
	if ($no>=count($tmp)) {
	msg_box($langerror,"$langad[49]<br><ul><li><a href=$tf&action=modlink>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}
	$newname=safe_convert($newname);
	if (empty($newlogo)) $tmp[$no]= "<?die();?".">|$newname|$newurl|\n";
	else $tmp[$no]= "<?die();?".">|$newname|$newurl|pic|$newlogo|\n";
	$tt=implode("",$tmp);
	writetofile("$dirblog/links.php",$tt);
	updatelinks();
	msg_box($langsuccess,"$langad[47]<br><ul><li><a href= index.php>$langbacktoindex</a></li></ul><br><ul><li><a href=$tf&action=modlink>$langcontinue</a></li></ul>");
	require("footer.php");
	exit;

}


if ($action=="dellink") {
	if ($no=="") {
	msg_box($langerror,"$langad[48]<br><ul><li><a href=$tf&action=modlink>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}
	unset($tmp);
	$tmp=@file("$dirblog/links.php");
	if ($no>=count($tmp)) {
	msg_box($langerror,"$langad[49]<br><ul><li><a href=$tf&action=modlink>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}
	$tmp[$no]= "";
	$tt=implode("",$tmp);
	writetofile("$dirblog/links.php",$tt);
	updatelinks();
	msg_box($langsuccess,"$langad[47]<br><ul><li><a href= index.php>$langbacktoindex</a></li></ul><br><ul><li><a href=$tf&action=modlink>$langback</a></li></ul>");
	require("footer.php");
	exit;

}

if ($action=="selflink") {
	if ($selflinkstatus==3) {
		$go="index.php";
		require ("header.php");
		msg_box($langerror,"$langad[68]<br><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
		require("footer.php");
		exit;
	}
	if ($selflinkstatus==1) $newlogo='';
	unset($tmp);
	$tmp=@readfromfile("$dirblog/links.php");
	if (strpos($tmp, "|$newurl|"))  {
		msg_box($langerror,"$langad[17]<br><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
		require("footer.php");
		exit;
	}

	unset($tmp);
	$tmp=@readfromfile("$dirblog/waitinglinks.php");
	if (strpos($tmp, "|$newurl|"))  {
		msg_box($langerror,"$langad[17]<br><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
		require("footer.php");
		exit;
	}

	$newname=safe_convert($newname);
	$newurl=safe_convert($newurl);
	$newlogo=safe_convert($newlogo);
	if (!empty($newlogo)) 	writetofile("$dirblog/waitinglinks.php", $tmp."<?die();?".">|$newname|$newurl|pic|$newlogo|\n");
	else writetofile("$dirblog/waitinglinks.php", $tmp."<?die();?".">|$newname|$newurl|\n");
	msg_box($langsuccess,"$langad[51]<br><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
	require("footer.php");
	exit;
}

if ($action=="addselflink") {
	if ($no=="") {
	msg_box($langerror,"$langad[48]<br><ul><li><a href=$tf&action=modlink>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}
	unset($tmp);
	$tmp=@file("$dirblog/waitinglinks.php");
	$toadd=$tmp[$no];
	$tmp[$no]="";
	writetofile("$dirblog/waitinglinks.php",implode("",$tmp));
	unset($tmp);
	$tmp=@readfromfile("$dirblog/links.php");
	if ($onlytext==1) {
		$text1=@explode("|",$toadd);
		$toadd="$text1[0]|$text1[1]|$text1[2]|\n";
	}
	writetofile("$dirblog/links.php",$tmp.$toadd);
	updatelinks();
	msg_box($langsuccess,"$langad[47]<br><ul><li><a href=index.php>$langbacktoindex</a></li></ul><br><ul><li><a href=$tf&action=modlink>$langback</a></li></ul>");
	require("footer.php");
	exit;
}

if ($action=="delselflink") {
	if ($no=="") {
	msg_box($langerror,"$langad[49]<br><ul><li><a href=$tf&action=modlink>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}
	unset($tmp);
	$tmp=@file("$dirblog/waitinglinks.php");
	$tmp[$no]="";
	writetofile("$dirblog/waitinglinks.php",implode("",$tmp));
	msg_box($langsuccess,"$langad[47]<br><ul><li><a href= index.php>$langbacktoindex</a></li></ul><br><ul><li><a href=$tf&action=modlink>$langback</a></li></ul>");
	require("footer.php");
	exit;

}



if ($action=="chpath") {
if ($rename_status=="off") {
	echo "<br>$langerrornotsupport<br>rename ()<a href='admin_cp.php?job=maintain&action=checkenv'>$langerrorrecheck</a><br>";
}
else {
print <<< eot
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 align=center width='100%'>
	<tr bgcolor='#47637E'><td colspan=2><font color="#FFFFFF">$langad[52]<br>$langad[53]</font></td></tr><form action=$tf method=post>
	<tr bgcolor='#FFFFFF'><td width=20%>$langad[54]</td><td><input type=text name=diruser2> $langad[55]</td></tr>
	<tr bgcolor='#FFFFFF'><td width=20%>$langad[56]</td><td><input type=text name=dirblog2> $langad[55]</td></tr>
	<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
	<input type=hidden name=action value=dochpath>
	</td></tr></form>
	</table>
	</td></tr>
	</table>
	</td></tr>
	</table>
eot;
}
require("footer.php");
}

if ($action=="dochpath") {
if (($diruser2=="" || $diruser2==$dirblog || $diruser2==$dirblog2 || $diruser2=="blog" || $diruser2==$updir)) {
msg_box($langerror,"$langad[57]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
require("footer.php");
exit;
}

if (($dirblog2=="" || $dirblog2==$diruser || $dirblog2==$diruser2 || $dirblog2=="blog" || $dirblog2==$updir)) {
msg_box($langerror,"$langad[57]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
require("footer.php");
exit;
}

$ifsucceed=@rename($dirblog, $dirblog2);
$ifsucceed=@rename($diruser, $diruser2);
if ($ifsucceed) {
writetofile("blog/dirconfig.php", "<?\n\$dirblog=\"$dirblog2\";\n\$diruser=\"$diruser2\";\n");
msg_box($langsuccess,"<ul><li><a href=$tf>$langback</a></li></ul><br><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
require("footer.php");
exit;
}
else { msg_box($langerror,"$langad[58]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
require("footer.php");
exit;
}
}


if ($action=="chtimezone") {
$nowtime=time();
$timeshow=date("Y-n-j-H:i", $nowtime);
print <<< eot
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 align=center width='100%'>
	<tr bgcolor=#47637E><td colspan=2><font color="#FFFFFF">$langad[59] $timeshow $langad[60]</font></td></tr><form action=$tf method=post>
	<tr bgcolor='#FFFFFF'><td width=20%>$langad[61]</td><td><select name=posorneg><option value="" selected>+</option><option value="-">-</option></select><input name=chhour type='text'  maxlength=6 size=20 value="0"> $langad[62]</td></tr>
	<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
	<input type=hidden name=action value=dochtimezone>
	</td></tr></form>
	</table>
	</td></tr>
	</table>
eot;
exit;
}

if ($action=="dochtimezone") {
$newest=@file("blog/mblogcon.php");
$allthese=count($newest);
for ($i=0; $i<$allthese; $i++) {
	if (eregi("timezone=", $newest[$i])) {
		$newest[$i]="\$timezone=".$posorneg.$chhour.";\n";
		$saved=1;
		break;
	}
}
if ($saved!=1) {
	$newest[$allthese]="\$timezone=".$posorneg.$chhour.";\n";
}
$newestp=eregi_replace("=;", "=0;", @implode("", $newest));

writetofile("blog/mblogcon.php", $newestp);

msg_box($langsuccess,"$langad[34]<br><ul><li><a href= 'admin_cp.php?job=maintain&action=domain'>$langad[66]</a></li></ul><br><ul><li><a href=$tf>$langcontinue</a></li></ul>");
require("footer.php");
exit;
}

if ($action=='phpinfo') {
	phpinfo();
	exit();
}

if ($action=='runphp') {
print <<< eot
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 align=center width='100%'>
	<tr bgcolor=#47637E><td colspan=2><font color="#FFFFFF">$langad[63]<br>$langwarn</font></td></tr><form action=$tf method=post>
	<tr bgcolor='#FFFFFF'><td colspan=2 align=center><textarea name=phpcommand rows=10 cols=80>&lt;?</textarea></td></tr>
	<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
	<input type=hidden name=action value=dorunphp>
	</td></tr></form>
	</table>
	</td></tr>
	</table>
eot;
exit;
}

if ($action=='dorunphp') {
$phpcommand=stripslashes($phpcommand); 
writetofile("run.php", $phpcommand);
@require("run.php");
@unlink("run.php");
exit;
}
?>