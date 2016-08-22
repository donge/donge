<?
// Bo-Blog
// A Blog System based on PHP and text database
// Author: Bob Shen
// Official Site: http://www.bo-blog.com
// Email: bobshen@gmail.com
// All Rights Reserved.
// 版权所有，任何修改版权后使用传播之行为皆不允许

require("global.php");


require_once ("blog/template/$blogtem/colorsheme.txt");
require_once ("blog/language/$bloglang/profile.lang.php"); //引入语言包

@header("Content-Type: text/html; charset=utf-8");


if (!$job) {
if (file_exists("$diruser/userid.ext"))  {	list($unuse,$usericon,$userfrom,$userhomepage,$userborn,$usergender,$userintro,$userqq, $usermsn, $usercraft, $userphone, $userspeciality)=explode("|",readfromfile("$diruser/userid.ext"));
} else $usericon="icon1.jpg";
if ($usergender=="m") $genderplus="♂";
if ($usergender=="f") $genderplus="♀";
$zodiac=getzodiac($userborn);
$userintro=decode($userintro,'small');
$userspeciality=decode($userspeciality,'small');
if ($protectemailaddress==1) $useremail=emailconvert($useremail);

print <<< eot
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
td, a{
	font-family: "Tahoma";	font-size: 9pt; text-decoration: none; color: $font1;
}
</style>
<title>$username</title>
</html>
<body bgcolor=$bgcolor>
<table width=700 align=center cellpadding=0 cellspacing=0 bgcolor=$border><tr><td>
<table width=100% align=center cellpadding=0 cellspacing=1><tr bgcolor=$color2><td colspan=2 align=center height=34><font color=$font2>$langpro[0]</font></td></tr>
<tr><td bgcolor=$color1 valign=top align=center width=10%><img src="img/icons/$usericon"></td>
<td bgcolor=$color1 valign=center align=center>
<table width=100% cellpadding=3><tr><td width=10%><strong>$langpro[1]</strong></td><td>$username <strong>$genderplus</strong></td></tr></table>
<hr size=1 width=100% color=$border>
<table width=100% cellpadding=3><tr><td width=10%><strong>$langpro[2]</strong></td><td width=40%>$userfrom</td><td width=10%><strong>$langpro[3]</strong></td><td width=40%>$zodiac</td></tr></table>
<hr size=1 width=100% color=$border>
<table width=100% cellpadding=3><tr><td width=10%><strong>$langpro[4]</strong></td><td width=40%><a href="mailto:$useremail">$langpro[5]</a></td><td width=10%><strong>$langpro[6]</strong></td><td width=40%><a href=$userhomepage target=_blank>$langpro[7]</a></td></tr></table>
<hr size=1 width=100% color=$border>
<table width=100% cellpadding=3><tr><td width=10%><strong>QQ</strong></td><td width=40%>$userqq</td><td width=10%><strong>MSN</strong></td><td width=40%>$usermsn</td></tr></table><hr size=1 width=100% color=$border>
<table width=100% cellpadding=3><tr><td width=10%><strong>$langpro[70]</strong></td><td width=40%>$usercraft</td><td width=10%><strong>$langpro[71]</strong></td><td width=40%>$userphone</td></tr></table>
<hr size=1 width=100% color=$border>
<table width=100% cellpadding=3><tr><td width=10% valign=top><strong>$langpro[72]</strong></td><td>$userspeciality</td></tr></table>
<hr size=1 width=100% color=$border>
<table width=100% cellpadding=3><tr><td width=10% valign=top><strong>$langpro[8]</strong></td><td>$userintro</td></tr></table>
<hr size=1 width=100% color=$border>
<table width=100% cellpadding=3><tr><td align=right><strong><a href=index.php>$langpro[9]</a></strong></td></tr></table>
</td></tr></table>
</table>
eot;
exit;

}

if ($job=="link") { 
if ($selflinkstatus==3) {
	$go="<back>";
	require ("header.php");
	msg_box($langerror,"$langpro[73]<br><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
	require("footer.php");
	exit;
}

if ($selflinkstatus==1) {
	$logolinksshow="<tr bgcolor='$color1'><td width=20%><font color=\"$font1\">logo：</font></td><td><input name=newlogo  maxlength=80 size=30> $langpro[21]</td></tr>";
} else {
	$logolinksshow="<tr bgcolor='$color1'><td width=20%><font color=\"$font1\">logo：</font></td><td><input name=newlogo type=hidden value=''> $langpro[74]</td></tr>";
}

$tmplinksh=getstr($blogname,$langpro[10]);
print <<< eot
<style type="text/css">
td, a{
	font-family: "Tahoma";	font-size: 9pt; text-decoration: none; color: $font1;
}
</style>
<title>$tmplinksh</title>
</html>
<body bgcolor=$bgcolor>
<table width=700 align=center cellpadding=0 cellspacing=0 bgcolor=$border><tr><td>
<table width=100% align=center cellpadding=4 cellspacing=1><tr bgcolor=$color2><td align=center ><font color=$font2>$langpro[11]</font></td></tr>
<tr><td bgcolor=$color1><font color=$font1><br>&lt;a href="$weburl" target="_blank" title="$blogdc"&gt; $blogname&lt;/a&gt; 
</td></tr><tr bgcolor=$color2><td align=center ><font color=$font2>$langpro[12]</font></td></tr>
<tr><td bgcolor=$color1><font color=$font1><br>&lt;a href="$weburl" target="_blank"&gt;&lt;img src="$logofile" alt="$blogname - $blogdc"&gt;&lt;/a&gt; 
</td></tr><tr bgcolor=$color2><td align=center ><font color=$font2>$langpro[13]</font></td></tr>
<tr><td bgcolor=$color1><font color=$font1>$langpro[14] (<a href="mailto:$useremail">$langpro[15]</a> <a href=index.php?job=guestbook>$langpro[16]</a>)  $langpro[17]
<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='$border'>
<tr><td>
<table cellpadding=5 cellspacing=1 align=center width='100%'>
<tr bgcolor=$color1><td colspan=2><font color="$font1">$langpro[18]</font></td></tr><form action="admin_cp.php?job=change" method=post>
<tr bgcolor='$color1'><td width=20%><font color="$font1">$langpro[19]</font></td><td><input name=newname  maxlength=30 size=30></td></tr>
<tr bgcolor='$color1'><td width=20%><font color="$font1">$langpro[20]</font></td><td><input name=newurl  maxlength=70 size=30></td></tr>
$logolinksshow
<input type=hidden name=action value=selflink>
<tr bgcolor='$color1'><td colspan=2 align=center><input type=submit value=$langpro[22]>  <input type='reset' value=$langpro[23]>
</td></tr></form>
</table>
</td></tr>
</table>
</td></tr></table>
</table>

eot;
exit;

}


if ($job=="ubbhelp") { 
print <<< eot
<style type="text/css">
td, a{
	font-family: "Tahoma";	font-size: 9pt; text-decoration: none; color: $font1;
}
</style>
<title>{$blogname} - $langpro[24]</title>
</html>
<body bgcolor=$bgcolor>
<table width=700 align=center cellpadding=0 cellspacing=0 bgcolor=$border><tr><td>
<table width=100% align=center cellpadding=4 cellspacing=1><tr bgcolor=$color2><td align=center ><font color=$font2>$langpro[25]</font></td></tr>
<tr><td bgcolor=$color1>
	


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="50%">$langpro[26]</td>
    <td width="50%">$langpro[27]</td>
  </tr>
  <tr>
    <td>[u]{$langpro[28]}[/u]</td>
    <td>$langpro[29]</td>
  </tr>
  <tr>
    <td>[i]{$langpro[28]}[/i]</td>
    <td>$langpro[30]</td>
  </tr>
  <tr>
    <td>[b]{$langpro[28]}[/b]</td>
    <td>$langpro[31]</td>
  </tr>
  <tr>
    <td>[strike]{$langpro[28]}[/strike]</td>
    <td>$langpro[32]</td>
  </tr>
  <tr>
    <td>[email]{$langpro[33]}[/email]</td>
    <td>$langpro[34]</td>
  </tr>
  <tr>
    <td>[url]{$langpro[35]}[/url]</td>
    <td>$langpro[36]</td>
  </tr>
  <tr>
    <td>[url={$langpro[35]}]{$langpro[28]}[/url]</td>
    <td>$langpro[37]</td>
  </tr>
  <tr>
    <td>[color={$langpro[38]}]{$langpro[28]}[/color]</td>
    <td>$langpro[39]</td>
  </tr>
  <tr>
    <td>[size={$langpro[40]}]{$langpro[28]}[/size]</td>
    <td>$langpro[41]</td>
  </tr>
  <tr>
    <td>[font={$langpro[42]}]{$langpro[28]}[/font]</td>
    <td>$langpro[43]</td>
  </tr>
  <tr>
    <td>[sub]{$langpro[28]}[/sub]</td>
    <td>$langpro[44]</td>
  </tr>
  <tr>
    <td>[sup]{$langpro[28]}[/sup]</td>
    <td>$langpro[45]</td>
  </tr>
  <tr>
    <td>[quote]{$langpro[28]}[/quote]</td>
    <td>$langpro[46]</td>
  </tr>
  <tr>
    <td>[hr]</td>
    <td>$langpro[47]</td>
  </tr>
</table>

</td></tr><tr bgcolor=$color2><td align=center ><font color=$font2>$langpro[48]</font></td></tr>
<tr><td bgcolor=$color1>



<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="50%">$langpro[26]</td>
    <td width="50%">$langpro[27]</td>
  </tr>
  <tr>
    <td>[p]{$langpro[28]}[/p]</td>
    <td>$langpro[49]</td>
  </tr>
  <tr>
    <td>[left]{$langpro[28]}[/left]</td>
    <td>$langpro[50]</td>
  </tr>
  <tr>
    <td>[center]{$langpro[28]}[/center]</td>
    <td>$langpro[51]</td>
  </tr>
  <tr>
    <td>[right]{$langpro[28]}[/right]</td>
    <td>$langpro[52]</td>
  </tr>
  <tr>
    <td>[img align={$langpro[53]}]{$langpro[54]}[/img]</td>
    <td>$langpro[55]</td>
  </tr>
  <tr>
    <td>[img align={$langpro[53]} height={$langpro[56]} width={$langpro[57]}]{$langpro[54]}[/img]</td>
    <td>$langpro[58]</td>
  </tr>
  <tr>
    <td>[wmp width={$langpro[57]} height={$langpro[56]}]{$langpro[63]}[/wmp]</td>
    <td>$langpro[59]</td>
  </tr>
  <tr>
    <td>[real width={$langpro[57]} height={$langpro[56]}]{$langpro[64]}[/real]</td>
    <td>$langpro[60]</td>
  </tr>
  <tr>
    <td>[flash width={$langpro[57]} height={$langpro[56]}]{$langpro[65]}[/flash]</td>
    <td>$langpro[61]</td>
  </tr>
   <tr>
   <td>[code]{$langpro[28]}[/code]</td>
    <td>$langpro[62]</td>
  </tr>
</table>


</td></tr></table>
</table>

eot;

exit;

}

if ($job==regprofile) {
checkpermit ('ViewUserDetail');

if (empty($user)) {
	die ("Powered by Bo-Blog.");
} 

if ($user==$username) {
	@header("Location: profile.php");
	exit();
}

$idfile=getinitial($user);
if (!file_exists("$diruser/$idfile.php")) $isfound=0;
else {	
	$tmp=@file("$diruser/$idfile.php");
	for ($i=0; $i<count($tmp); $i++) {
		$cur=explode("|", $tmp[$i]);
		if ($user==$cur[1]) {
			$isfound=1;
			list ($unuse, $user_name, $unuse, $email, $homepage, $contype, $connum, $ps, $unuse, $regt, $replies, $avatar)=$cur;
			$regt=date("Y-n-j",$regt);
			if (empty($homepage)) $homepage="#";
			else if (!eregi("http://", $homepage)) $homepage="http://".$homepage;
			if (empty($connum)) $contype=$langpro[66];
			break;
		}
	}
}
if ($isfound==0) die("No Such A User.");
if ($protectemailaddress==1) $email=emailconvert($email);

@header("Content-Type: text/html; charset=utf-8");

print <<< eot
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
td, a{
	font-family: "Tahoma";	font-size: 9pt; text-decoration: none; color: $font1;
}
</style>
<title>$user_name</title>
</html>
<body bgcolor=$bgcolor>
<table width=700 align=center cellpadding=0 cellspacing=0 bgcolor=$border><tr><td>
<table width=100% align=center cellpadding=0 cellspacing=1><tr bgcolor=$color2><td align=center height=34><font color=$font2><img src=img/avatars/$avatar.gif> $user_name </font></td></tr>
<tr><td bgcolor=$color1 valign=center align=center>
<table width=100% cellpadding=3><tr><td width=10%><strong>$langpro[1]</strong></td><td width=40%>$user_name </td><td width=10%><strong>$langpro[67]</strong></td><td width=40%>$regt</td></tr></table>
<hr size=1 width=100% color=$border>
<table width=100% cellpadding=3><tr><td width=10%><strong>$langpro[4]</strong></td><td width=40%><a href="mailto:$email">$langpro[5]</a></td><td width=10%><strong>$langpro[6]</strong></td><td width=40%><a href=$homepage target=_blank>$langpro[7]</a></td></tr></table>
<hr size=1 width=100% color=$border>
<table width=100% cellpadding=3><tr><td width=10%><strong>$langpro[68]</strong></td><td width=40%>$contype  $connum</td><td width=10%><strong>$langpro[69]</strong></td><td width=40%>$replies </td></tr></table>
<hr size=1 width=100% color=$border>
<table width=100% cellpadding=3><tr><td width=10% valign=top><strong>$langpro[8]</strong></td><td>$ps</td></tr></table>
</table>
eot;
exit;

}
?>