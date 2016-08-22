<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$blogadminlang/admingl.lang.php"); //引入语言包

$tf="admin_cp.php?job=plugin";

if (empty($action)) $action="center";

if ($action=="center") {
if (file_exists("blog/pluginlist.php")) {
	$allplugins=@file("blog/pluginlist.php");
	$putblogplugin.="<table width=98% align=center bgcolor=#B0C4D7 cellpadding=0 cellspacing=0><tr><td><table width=100% cellpadding=4 cellspacing=1><tr bgcolor=#FFFFFF align=center ><td  width=180>$langadpl[0]</td><td width=90>$langadpl[1]</td><td width=32>$langadpl[2]</td><td>$langadpl[3]</td><td width=30>$langadpl[4]</td><td width=30>$langadpl[5]</td></tr>";
	for ($i=0; $i<count($allplugins); $i++) {
		$tmp=explode("|",$allplugins[$i]);
		$putblogplugin.="<tr bgcolor=#FFFFFF align=center><td align=center><a href=index.php?job=$tmp[1] target=_blank>$tmp[2]</a></td><td>$tmp[3]</td><td>$tmp[4]</td><td>$tmp[5]</td><td><a href='$tmp[6]'>$langadpl[4]</a></td><td><a href='$tf&action=del&id=$i'>$langadpl[5]</a></td></tr>";
	}
	$putblogplugin.="</table></table>";
}

print <<< eot
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 align=center width='100%'>
	<tr bgcolor=#47637E><td colspan=2><font color="#FFFFFF">$langadpl[6]</font></td></tr>
	<tr bgcolor='#FFFFFF'><td colspan=2>
	$putblogplugin
	</td></tr>
	<tr bgcolor='#FFFFFF'><td colspan=2 align=center>$langadpl[7]<br>
	<form action=$tf method=post><input type=hidden name=action value=add>
	$langadpl[8] <input type=text name=newname size=20> <input type=submit value=$langsubmit></form><br>		
	</td></tr>
	</table>
	</td></tr>
	</table>
eot;
	require("footer.php");
	exit;
}

if ($action=="add") {
if ((!$newname) || !file_exists("plugin/$newname/install.php")) {
	msg_box($langerror,"$langadpl[9]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
	exit;
}

require ("plugin/$newname/install.php");
if ($addintonavbar==1) {
	$pluginaddr="index.php?job=$pluginjob";
	$newest=@file("blog/mblogcon.php");
	$allthese=count($newest);
	for ($i=0; $i<$allthese; $i++) {
		if (eregi("pluginbar=", $newest[$i])) {
			$newest[$i]="\$pluginbar=\"".stripslashes($pluginbar)." | <a href='$pluginaddr' target='$plugintarget'>$pluginname</a>\";\n";
			$saved=1;
			break;
		}
	}
	if ($saved!=1) {
		$newest[$allthese]="\$pluginbar=\"".stripslashes($pluginbar)." | <a href='$pluginaddr' target='$plugintarget'>$pluginname</a>\";\n";
	}
	$newestp=eregi_replace("=;", "=0;", @implode("", $newest));
	writetofile("blog/mblogcon.php", $newestp);
}

$newest="<?die();?".">|{$pluginjob}|{$pluginname}|{$pluginauthor}|{$pluginver}|{$pluginintro}|{$pluginadmin}|{$addintonavbar}|{$plugintarget}|\n";
$tmp=@readfromfile("blog/pluginlist.php");
writetofile("blog/pluginlist.php", $newest.$tmp);
msg_box($langsuccess,"$langadpl[10]<br>{$pluginname} ($langadpl[1] {$pluginauthor}  $langadpl[2] {$pluginver})<ul><li><a href=$tf>$langback</a></li></ul>");
require("footer.php");
exit;
}

if ($action=="del") {
	if ($id=="") {
	msg_box($langerror,"$langadpl[11]<br><ul><li><a href=$tf>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}
	unset($tmp);
	$tmp=@file("blog/pluginlist.php");
	if ($id>=count($tmp)) {
	msg_box($langerror,"$langadpl[11]<br><ul><li><a href=$tf&action=admintem>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}
	$tmp[$id]="";
	$tmp=array_reverse($tmp);
	for ($i=0; $i<count($tmp); $i++) {
		$bark=@explode("|", $tmp[$i]);
		if ($bark[7]==1) {
			$newstep.=" | <a href='index.php?job={$bark[1]}' target='{$bark[8]}'>$bark[2]</a>";
			$webat=1;
		}
	}
	if ($webat==1) {
		$newest=@file("blog/mblogcon.php");
		$allthese=count($newest);
		for ($i=0; $i<$allthese; $i++) {
			if (eregi("pluginbar=", $newest[$i])) {
				$newest[$i]="\$pluginbar=\"{$newstep}\";\n";
				$saved=1;
				break;
			}
		}
		if ($saved!=1) {
			$newest[$allthese]="\$pluginbar=\"{$newstep}\";\n";
		}
	} else {
		$newest=@file("blog/mblogcon.php");
		$allthese=count($newest);
		for ($i=0; $i<$allthese; $i++) {
			if (eregi("pluginbar=", $newest[$i])) {
				$newest[$i]="";
				break;
			}
		}
	}
	$newestp=eregi_replace("=;", "=0;", @implode("", $newest));
	writetofile("blog/mblogcon.php", $newestp);
	$tt=implode("",$tmp);
	writetofile("blog/pluginlist.php",$tt);
	msg_box($langsuccess,"$langadpl[12]<br><ul><li><a href=$tf>$langback</a></li></ul>");
	require("footer.php");
	exit;

}


?>