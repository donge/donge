<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$bloglang/list.lang.php"); //引入语言包
if (!empty($modify)) {
	$user=$nowuserid;
	if (empty($user) || !isregistered($user) || ($guest_login!=1 && $nowuserid==$username)) die ("No such a user. Or not logged in.");
	$idfile=getinitial($user);
	if (!file_exists("$diruser/$idfile.php")) $isfound=0;
	else {	
		$tmp=@file("$diruser/$idfile.php");
		for ($i=0; $i<count($tmp); $i++) {
			$cur=explode("|", $tmp[$i]);
			if ($user==$cur[1]) {
				$isfound=1;
				list ($unuse, $regid, $unuse, $regemail, $reghomepage, $regcontype, $regconnum, $regps, $unuse, $unuse, $unuse, $regavatar)=$cur;
				break;
			}
		}
	}
	if ($isfound==0) die("No Such A User.");
}

if ($allowreg==0 && empty($modify)) {
	$regmain="<br/><br/><span style='font-size:14px'>$langlist[23]</span><br/><br/>";
}
else {
	for ($i=1; $i<21; $i++) {
		if ($i<10) $allicon.="<option value=\"0".$i."\">$langlist[24] $i</option>";
		else  $allicon.="<option value=\"$i\">$langlist[24] $i</option>";
	}
	if (!empty($modify)) $words=array ("disabled=\"disabled\"", $langlist[25], $langlist[26],"modreg",$langlist[27]);
	else $words=array ("", $langlist[28], $langlist[29],"doreg",$langlist[30]);
	$regmain="<script type=\"text/javascript\" src=\"img/module.js\"></script><br/><form action=\"mblog_reg.php\" method=\"post\" name=\"pro\"><input type=\"hidden\" name=\"action\" value=\"$words[3]\"/><table width=\"100%\"><tr><td colspan=\"2\"><span style='font-size:14px'>".getstr($words[4],$langlist[31])."</span></td></tr>";
	$regmain.="<tr><td width=\"20%\">*{$langlist[32]}</td><td><input type=\"text\" name=\"regid\" maxlength=\"15\" size=\"25\" value=\"$regid\" $words[0]/></td></tr>";
	$regmain.="<tr><td width=\"20%\">*$words[1]</td><td><input type=\"password\" name=\"regpwd\" maxlength=\"15\" size=\"25\"/></td></tr>";
	$regmain.="<tr><td width=\"20%\">*$words[2]</td><td><input type=\"password\" name=\"regpwd2\" maxlength=\"15\" size=\"25\"/></td></tr>";
	$regmain.="<tr><td width=\"20%\">*{$langlist[33]}</td><td><input type=\"text\" name=\"regemail\" maxlength=\"25\" size=\"25\" value=\"$regemail\"/></td></tr>";
	$regmain.="<tr><td width=\"20%\">{$langlist[34]}</td><td><input type=\"text\" name=\"regpage\" maxlength=\"28\" size=\"25\" value=\"$reghomepage\"/></td></tr>";
	$regmain.="<tr><td width=\"20%\">{$langlist[35]}</td><td><select name=\"regcontype\"><option value='$langlist[37]'>$langlist[37]</option><option value='$langlist[36]'>$langlist[36]</option><option value='$langlist[38]'>$langlist[38]</option><option value='$langlist[39]'>$langlist[39]</option><option value='$langlist[40]'>$langlist[40]</option><option value='$langlist[41]'>$langlist[41]</option></select> <input type=\"text\" name=\"regconnum\" maxlength=\"65\" size=\"15\" value=\"$regconnum\"/></td></tr>";
	$regmain.="<tr><td width=\"20%\">$langlist[42]</td><td><input type=\"text\" name=\"regps\" maxlength=\"30\" size=\"36\" value=\"$regps\"/></td></tr>";
	$regmain.="<tr><td width=\"20%\">$langlist[43]</td><td><table width=\"100%\" cellpadding=\"0\"><tr><td width=\"20%\"><select name=\"regavatar\" onchange=\"showicon()\">$allicon</select></td><td align=\"left\"> <div id=\"iconarea\"><img src=\"img/avatars/01.gif\" alt=\"$langlist[43]\"/></div></td></tr></table></td></tr>";
	$regmain.="<tr><td colspan=\"2\" align=\"center\"><input type=\"submit\" value=\"$words[4]\"/> <input type=\"reset\"  value=\"$langlist[44]\"/></td></tr></table></form>";
	if (empty($modify)) $regmain.="<div align=\"left\">$langlist[45]</div>";

}
	
$t = new template("."); 
$t -> set_file("mainbody", "blog/template/$tem/reply.htm");
$t->set_var(array("replyinfo"=>$words[4], "reply"=>$regmain, ));
$t->parse("mainbodyout","mainbody");


?>