<?
// Bo-Blog
// A Blog System based on PHP and text database
// Author: Bob Shen
// Official Site: http://www.bo-blog.com
// Email: bobshen@gmail.com
// All Rights Reserved.
// 版权所有，任何修改版权后使用传播之行为皆不允许

$tf="mblog_reply.php";
require("global.php");
checkpermit ('AddComment');
require_once("blog/language/$blogadminlang/adminre.lang.php"); //引入语言包

$add_title=" - $langarp[0]";

if ($login_status==0 && $allowvisitorreply==0) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langarp[1]<br><ul><li><a href=login.php>$langnowlogin</a></li></ul><br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
	exit;
}

if ($login_status==0 && $_COOKIE['boblogjustpost']==1) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langerroroverpost<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
	exit;
}

if (checkip($ip)) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langarp[2]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
	exit;
}

$replyid2=$replyid;
list ($replyid, $replytimex)=@explode(':', $replyid2);

if (empty($action)) $action="doreply";

if ( empty($articleid) || (($replyid=="") && ($action!='doreply') && ($action!='delallreply') && ($action!='dodelallreply')) ) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langarp[3]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
	exit;
}

if ($login_status==0 && $action!="doreply") {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langarp[15]<br><ul><li><a href=login.php>$langnowlogin</a></li></ul><br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
	exit;
}


if ($action=="doreply") {
	$replyauthor=str_replace("　","", $replyauthor);
	$replyauthor=trim($replyauthor);
	if (empty($replyauthor) || namequalified($replyauthor)==0 || ($login_status==0 && strtolower($replyauthor)==strtolower($username))) {
	$go="<back>";
	require("header.php");	msg_box($langerror,"$langerrorfor<br>$langarp[4]<br>$langarp[5]<br>$langerrordanger<br>$langarp[6]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}
	if ($nowuserid!=$replyauthor && isregistered($replyauthor)==1 && $login_status!=1) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langerrorfor<br>$langarp[7]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}

	if (((empty($codec)) || (md5($codec)<>$ccodec))&&($validation==1)) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langerrorfor<br>$langarp[8]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}
	$replycontent=trim($icontent);
	if (empty($replycontent) || contentqualified($replycontent)==0 ) {
	$go="<back>";
	require("header.php");
msg_box($langerror,"$langerrorfor<br>$langarp[9]<br>$langarp[10]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}

	if ($censorship==1 && checksensitive($replycontent)) {
	$go="<back>";
	require("header.php");	
	msg_box($langerror,"$langerrorfor<br>$langarp[11]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}

	unset ($all);
	$isfound=0;
	$all=@file("$dirblog/list.php");
	for ($i=0; $i<count($all);$i++) {
	$latest=explode("|",$all[$i]);
	$id=$latest[1];
	if ($id==$articleid) {
	if ($latest[9]==1 || $latest[9]==2) die ("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"></head><body>$langarp[12]");
	if (file_exists("blog/sticky.php")) require("blog/sticky.php");
	$latest[5]=$latest[5]+1;
	if ($sticky==$all[$i]) $needchangeinsticky=1;
	$all[$i]=implode("|", $latest);

	if ($needchangeinsticky==1) writetofile("blog/sticky.php", "<?\n\$sticky=\"$all[$i]\";\n\$announce=\"$announce\";");

	$curtitle=$latest[2];
	$curid=$latest[1];
	$isfound=1;
	break;
	}
	}

	if ($isfound<>1){
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langarp[3]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}
	
	$all1=implode("", $all);

	$replyauthor=safe_convert($replyauthor);
	$remreplyauthor=$replyauthor;
	if ($replyemail!="") 	$replyauthor.="θθ".safe_convert($replyemail);
	$replycontent=safe_convert($replycontent);
	$simplecontent=preg_replace("/\[(.+?)\]/is", "", $replycontent);
	$simplecontent=preg_replace("/<(.+?)>/is", "", $simplecontent);
	$simplecontent=preg_replace("/&(.+?);/is", "", $simplecontent);
	
	if ($closeubbonce==1) $replycontent=filter_ubb($replycontent);

	$curexcerpt=msubstr($simplecontent,0,20);
	$timestamp=time();
	$areply=@readfromfile("$dirblog/$articleid.rpl");
	writetofile("$dirblog/$articleid.rpl",$replycontent."\n|rep|\n".$areply);
	writetofile("$dirblog/list.php",$all1);
	updaterenum(1);
	
	
	if ($login_status==1) $con=1; 
	elseif ($guest_login==1) {$con=2; reguserart($replyauthor, 1);}
	else $con=0;
	$newest="<?die();?".">||$replyauthor|$timestamp|$con|$ip|\n";
	$allre=@readfromfile("$dirblog/$articleid.rep");
	writetofile("$dirblog/$articleid.rep",$newest.$allre);
	updatenewestart();

	$curre="<?die();?".">|$curid|$curtitle|$timestamp|$curexcerpt|\n";
	$allrere=@readfromfile("$dirblog/replies.php");
	writetofile("$dirblog/replies.php",$curre.$allrere);
	updatenewestrep();
	if ($isremember==1) setcookie("remembered", $remreplyauthor.">".$replyemail,time()+3600*24*30);
	else setcookie("remembered", "", time()-3600);
	if ($login_status==0) setcookie("boblogjustpost", "1", time()+$minpostinterval);

	$go="index.php?job=art&articleid=$articleid";
	require("header.php");
	msg_box($langsuccess,"$langarp[13]<br><ul><li><a href= index.php?job=art&articleid=$articleid>$langarp[14]</a></li></ul><br><ul><li><a href= index.php>$langbacktoindex</a></li></ul>");
	require("footer.php");
	exit;
}

if ($action=="delreply") {
	unset ($all);
	$isfound=0;
	$all=@file("$dirblog/list.php");
	for ($i=0; $i<count($all);$i++) {
	$latest=explode("|",$all[$i]);
	$id=$latest[1];
	if ($id==$articleid) {
	$articletitle=$latest[2];
	$isfound=1;
	break;
	}
	}
	if ($isfound<>1) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langarp[3]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}

	require("header.php");
	msg_box($langconfirm, getstr($articletitle, $langarp[16])."<br><ul><li><a href=$tf?action=dodelreply&articleid=$articleid&replyid=$replyid2>$langsure</a></li></ul><br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
}

if ($action=="dodelreply") {
	unset ($all);
	$isfound=0;
	$all=@file("$dirblog/list.php");
	for ($i=0; $i<count($all);$i++) {
	$latest=explode("|",$all[$i]);
	if ($latest[1]==$articleid) {
	if (file_exists("blog/sticky.php")) require("blog/sticky.php");
	$articletitle=$latest[2];
	$isfound=1;
	$latest[5]=$latest[5]-1;
	if ($sticky==$all[$i]) $needchangeinsticky=1;
	$all[$i]=implode("|", $latest);
	

	if ($needchangeinsticky==1) writetofile("blog/sticky.php", "<?\n\$sticky=\"$all[$i]\";\n\$announce=\"$announce\";");

	break;
	}
	}
	if ($isfound<>1) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langarp[3]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	$all1=implode("",$all);	
	writetofile("$dirblog/list.php",$all1);

	unset ($all);
	$all=@file("$dirblog/$articleid.rep");
/*	if ($replydisplayorder==1) {
		$all=array_reverse($all);
	}
*/
	for ($i=$replyid; $i<count($all);$i++) {
	$pptmp=explode("|",$all[$i]);
	if ($pptmp[3]==$replytimex) {
		$replyid=$i;
		if ($pptmp[4]==2) {
			$replyauthor=$pptmp[2];
			reguserart($replyauthor, -1);
		}
	break;
	}
	}
/*	if ($replydisplayorder==1) {
		$all=array_reverse($all);
	}
*/
	$all[$replyid]="";
	$all1=implode("",$all);	
	if ($all1=="") 	unlink ("$dirblog/$articleid.rep");
	else writetofile("$dirblog/$articleid.rep",$all1);	

	$tmpreply=@explode("\n|rep|\n", @readfromfile("$dirblog/$articleid.rpl"));
/*	if ($replydisplayorder==1) {
		$tmpreply=array_reverse($tmpreply);
	}
*/
	$tmpreply[$replyid]="";
	for ($i=0; $i<count($tmpreply); $i++) {
		if ($tmpreply[$i]!="") {
			$tmpreply2[]=$tmpreply[$i];
		}
	}
/*	if ($replydisplayorder==1) {
		$tmpreply2=array_reverse($tmpreply2);
	}
*/
	$areply=@implode("\n|rep|\n", $tmpreply2);
	writetofile("$dirblog/$articleid.rpl", $areply);


	unset ($all);
	$all=@file("$dirblog/replies.php");
	for ($i=0; $i<count($all);$i++) {
		$latest=explode("|",$all[$i]);
		$id=$latest[1];
		$reptime=$latest[3];
		if ($id==$articleid && $reptime==$replytimex) {
		$all[$i]="";
		$replyfound=1;
		break;
		}
	}
	if ($replyfound==1) {
		$allreplies=implode("",$all);
		writetofile("$dirblog/replies.php",$allreplies);	
	}
	updaterenum(-1);	
	updatenewestart();
	updatenewestrep();

	$go="index.php?job=art&articleid=$articleid";
	require("header.php");
	msg_box($langsuccess,"$langarp[17]<br><ul><li><a href=index.php?job=art&articleid=$articleid>$langback</a></li></ul>");
	require("footer.php");
	exit;
}



if ($action=="delallreply") {
	unset ($all);
	$isfound=0;
	$all=@file("$dirblog/list.php");
	for ($i=0; $i<count($all);$i++) {
	$latest=explode("|",$all[$i]);
	$id=$latest[1];
	if ($id==$articleid) {
	$articletitle=$latest[2];
	$isfound=1;
	break;
	}
	}
	if ($isfound<>1) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langarp[3]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
	exit;
	}

	require("header.php");
	msg_box($langconfirm, getstr($articletitle, $langarp[18])."<br><ul><li><a href=$tf?action=dodelallreply&articleid=$articleid>$langsure</a></li></ul><br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	require("footer.php");
}

if ($action=="dodelallreply") {
	unset ($all);
	$isfound=0;
	$all=@file("$dirblog/list.php");
	for ($i=0; $i<count($all);$i++) {
	$latest=explode("|",$all[$i]);
	$id=$latest[1];
	if ($id==$articleid) {
	if (file_exists("blog/sticky.php")) require("blog/sticky.php");
	$articletitle=$latest[2];
	$isfound=1;
	$trenum=$latest[5];
	$latest[5]=0;
	if ($sticky==$all[$i]) $needchangeinsticky=1;
	$all[$i]=implode("|", $latest);

	if ($needchangeinsticky==1) writetofile("blog/sticky.php", "<?\n\$sticky=\"$all[$i]\";\n\$announce=\"$announce\";");
	break;
	}
	}
	if ($isfound<>1) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langarp[3]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
	}
	$all1=implode("",$all);	
	writetofile("$dirblog/list.php",$all1);
	updatenewestart();
	updatenewestrep();


	if (!file_exists("$dirblog/$articleid.rep")) {
	$go="index.php?job=art&articleid=$articleid";
	require("header.php");
	msg_box($langsuccess,"$langarp[19]<br><ul><li><a href=index.php?job=art&articleid=$articleid>$langback</a></li></ul>");
	require("footer.php");

	exit;
	} else {
		@unlink ("$dirblog/$articleid.rep");
		@unlink ("$dirblog/$articleid.rpl");

		updaterenum(-$trenum);

		unset ($all);
		$all=@file("$dirblog/replies.php");
		for ($i=0; $i<count($all);$i++) {
		$latest=explode("|",$all[$i]);
		$id=$latest[1];
		if ($id==$articleid) {
		$all[$i]="";
		$replyfound=1;
		}
		}
		if ($replyfound==1) {
			$allreplies=implode("",$all);
			writetofile("$dirblog/replies.php",$allreplies);	
			updatenewestrep () ;
		}
		$go="index.php?job=art&articleid=$articleid";
		require("header.php");
		msg_box($langsuccess,"$langarp[19]<br><ul><li><a href=index.php?job=art&articleid=$articleid>$langback</a></li></ul>");
		require("footer.php");
		exit;
	}
}

if ($action=="addadminreply") {
	unset ($all);
	$all=@file("$dirblog/$articleid.rep");
	for ($i=$replyid; $i<count($all);$i++) {
	$pptmp=explode("|",$all[$i]);
	if ($pptmp[3]==$replytimex) {
		$replyid=$i;
		break;
	}
	}
	if ($pptmp[6]=='y') {
		$oldadminrep=safe_invert($pptmp[8]);
		$oldadminrepauthor=trim($pptmp[9]);
		if ($nowuserid!=$oldadminrepauthor && $nowuserid!=$username) {
			$go="<back>";
			require("header.php");
			msg_box($langerror,"$langarp[26]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
			exit;
		}
	}
	$replytime=date($langdatefomat,mktimezone($replytimex));

	$tmpreply=@explode("\n|rep|\n", @readfromfile("$dirblog/$articleid.rpl"));
	$reporigin=decode($tmpreply[$replyid], 'small');
	$replyid2=$replyid.':'.$replytimex;

	require("header.php");
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
  editor = new HTMLArea("adminreplycontent");

  editor.generate();
  return false;
}
</script>
<body onload="initEditor()">
eot;
print <<< eot
<table width="550" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="18" bgcolor="#EEEEEE">$langarp[20]</td>
  </tr>
</table>
<table width="500" border="0" align="center" cellpadding="5" cellspacing="0">
  <tr> 
    <td height="22" valign="top">$langarp[21] $pptmp[2] $langarp[22] $replytime<br>
	$langarp[23]<br> $reporigin<br>
      <form name="form" method="post" action="mblog_reply.php">     　　　 
          <textarea name="adminreplycontent" id="adminreplycontent" cols="80" rows="20" wrap="VIRTUAL">$oldadminrep</textarea>
          <input name="replyid" type="hidden" value="$replyid2" ><input name="action" type="hidden" value="doaddadminreply"> <input name="articleid" type="hidden" value="$articleid"> 　　　
          <input type="submit" value="$langsubmit">  <input  type="reset" value="$langreset">
        </p>
      </form>
  </tr>
</table>
eot;
	require("footer.php");
}

if ($action=="doaddadminreply") {
	unset ($all);
	$all=@file("$dirblog/$articleid.rep");
	for ($i=$replyid; $i<count($all);$i++) {
	$pptmp=explode("|",$all[$i]);
	if ($pptmp[3]==$replytimex) {
		$replyid=$i;
		break;
	}
	}
	$pptmp[7]=mktime();
	$pptmp[8]=minor_safe_convert($adminreplycontent);
	$oldadminrepauthor=trim($pptmp[9]);
	if ($pptmp[6]=='y' && $nowuserid!=$oldadminrepauthor && $nowuserid!=$username) {
		$go="<back>";
		require("header.php");
		msg_box($langerror,"$langarp[26]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
		exit;
	}
	$pptmp[6]='y';
	$pptmp[9]=$nowuserid;
	$pptmp[10]="\n";
	$all[$replyid]=@implode('|', $pptmp);
	writetofile ("$dirblog/$articleid.rep", implode('', $all));
	$go="index.php?job=art&articleid=$articleid#comment";
	require("header.php");
	msg_box($langsuccess,"$langarp[24]<br><ul><li><a href=index.php?job=art&articleid=$articleid#comment>$langback</a></li></ul>");
	require("footer.php");
	exit;
}
	
if ($action=="deladminreply") {
	unset ($all);
	$all=@file("$dirblog/$articleid.rep");
	for ($i=$replyid; $i<count($all);$i++) {
	$pptmp=explode("|",$all[$i]);
	if ($pptmp[3]==$replytimex) {
		$replyid=$i;
		break;
	}
	}
	$oldadminrepauthor=trim($pptmp[9]);
	if ($nowuserid!=$oldadminrepauthor && $nowuserid!=$username) {
		$go="<back>";
		require("header.php");
		msg_box($langerror,"$langarp[26]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
		exit;
	}
	$all[$replyid]="$pptmp[0]|$pptmp[1]|$pptmp[2]|$pptmp[3]|$pptmp[4]|$pptmp[5]|\n";
	writetofile ("$dirblog/$articleid.rep", implode('', $all));
	$go="index.php?job=art&articleid=$articleid#comment";
	require("header.php");
	msg_box($langsuccess,"$langarp[25]<br><ul><li><a href=index.php?job=art&articleid=$articleid#comment>$langback</a></li></ul>");
	require("footer.php");
	exit;
}
?>