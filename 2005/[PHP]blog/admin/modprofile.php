<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$blogadminlang/adminmt.lang.php"); //引入语言包

$tf="admin_cp.php?job=modprofile";

if (empty($action)) $action="modprofile";


if ($action=="modprofile") {
	if (file_exists("$diruser/userid.ext"))  {	list($unuse,$usericon,$userfrom,$userhomepage,$userborn,$usergender,$userintro,$userqq, $usermsn, $usercraft, $userphone, $userspeciality)=explode("|",readfromfile("$diruser/userid.ext"));
	$userspeciality=safe_invert($userspeciality);
	$userintro=safe_invert($userintro);
	}
	else $usericon="icon1.jpg";
	$alltems=@file("blog/icons.txt");
	for ($i=0; $i<count($alltems); $i++) {
		$allicon.="<option value=$alltems[$i]>$alltems[$i]</option>";
	}
	if ($usergender=="m") $select_m="selected";
	elseif ($usergender=="f") $select_f="selected";
	else $select_n="selected";
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
	  editor = new HTMLArea("userintro");

	  editor.generate();
	  return false;
	}
	</script>
	<body onload="initEditor()">
eot;
	print <<< eot
	<script language="javascript">
   function showicon(){
    iconarea.innerHTML="<img src=img/icons/"+document.pro.usericon.options[document.pro.usericon.selectedIndex].value+">";
	}
	</script>
		<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
		<tr><td>
		<table cellpadding=5 cellspacing=1 align=center width='100%'>
		<tr bgcolor=#47637E><td colspan=2><font color="#FFFFFF">$langapf[0] </font></td></tr><form action=$tf method=post name=pro>
		<tr bgcolor='#FFFFFF'><td colspan=2></td></tr>
		<tr bgcolor='#FFFFFF'><td>$langapf[1]</td><td><table width=120><tr><td><div id="iconarea"><img src="img/icons/$usericon"></div></td><td valign=top><select name="usericon" onChange="showicon()"><option checked value="$usericon">$langapf[2]</option>
		$allicon	</select></td></tr></table></td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%>$langapf[3]</td><td><input name=userhomepage value='$userhomepage'  maxlength=30 size=30></td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%>$langapf[4]</td><td><input name=userfrom value='$userfrom' maxlength=10 size=10> </td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%>$langapf[5]</td><td><input name=userborn value="$userborn" maxlength=10 size=10> $langapf[6]</td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%> $langapf[7]</td><td><select name=usergender><option  value=n  $select_n>$langapf[8]</option><option value=m $select_m>$langapf[9]</option><option value=f $select_f>$langapf[10]</option></select> </td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%>QQ</td><td><input name=userqq value="$userqq" maxlength=15 size=15></td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%>MSN</td><td><input name=usermsn value="$usermsn" maxlength=85 size=25></td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%>$langapf[13]</td><td><input name=usercraft value="$usercraft" maxlength=50 size=15></td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%>$langapf[14]</td><td><input name=userphone value="$userphone" maxlength=35 size=15></td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%>$langapf[15]</td><td><textarea name=userspeciality rows=3 cols=30>$userspeciality</textarea></td></tr>
		<tr bgcolor='#FFFFFF'><td width=20%>$langapf[11]</td><td><textarea name=userintro id=userintro rows=11 cols=65>$userintro</textarea></td></tr>
		<input type=hidden name=action value=domodprofile>
		<tr bgcolor='#FFFFFF'><td colspan=2 align=center><input type=submit value=$langsubmit>  <input type='reset' value=$langreset>
		</td></tr></form>
		</table>
		</td></tr>
		</table>
eot;
require ("footer.php");
exit;
}

if ($action=="domodprofile") {


	$userfrom=safe_convert($userfrom);
	$userhomepage=safe_convert($userhomepage);
	$userborn=safe_convert($userborn);
	$userintro=minor_safe_convert($userintro);

	$newest="<?die();?".">|$usericon|$userfrom|$userhomepage|$userborn|$usergender|$userintro|$userqq|$usermsn|$usercraft|$userphone|$userspeciality|\n";

	writetofile("$diruser/userid.ext", "$newest");
	msg_box($langsuccess,"$langapf[12]<br><ul><li><a href= index.php>$langbacktoindex</a></li></ul><br><ul><li><a href=admin_cp.php?job=change>$langcontinue</a></li></ul>");
	require("footer.php");
	exit;


}

?>