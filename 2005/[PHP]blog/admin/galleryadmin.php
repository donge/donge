<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$blogadminlang/admingl.lang.php"); //引入语言包

$tf="admin_cp.php?job=galleryadmin";

if (empty($action)) $action="des";

if ($action=="des") {
$dirhandle=opendir('gallery');
while (false !== ($file = readdir($dirhandle))) {
	if (is_dir("gallery/$file") && $file!="." && $file!="..") {
		$dirname[]=$file;
		@include("gallery/$file/gallery_nfo.php");
		if (empty($gallery_name)) $galname[]=$langadgl[0];
		else $galname[]=stripslashes($gallery_name);
		$gallery_name="";	
		if (empty($gallery_description)) $galdes[]=$langadgl[1];
		else $galdes[]=stripslashes($gallery_description);
		$gallery_description="";
	}
}
for ($i=0; $i<count($dirname); $i++) {
	$out2.="<tr bgcolor=#FFFFFF><td>$dirname[$i]</td><td>$galname[$i]</td><td>$galdes[$i]</td><td><a href=$tf&action=change&id=$dirname[$i]>$langadgl[2]</a></td><td><a href=$tf&action=editdes&id=$dirname[$i]>$langadgl[2]</a></td></tr>"; 
}
print <<< eot
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 align=center width='100%'>
	<tr bgcolor=#47637E><td colspan=5><font color="#FFFFFF">$langadgl[3]</font></td></tr>
	<tr align=center bgcolor=#FFFFFF><td  width=15%>$langadgl[4]</td><td bgcolor=#FFFFFF width=25%>$langadgl[5]</td><td bgcolor=#FFFFFF width=40%>$langadgl[6]</td><td bgcolor=#FFFFFF width=10%>$langadgl[7]</td><td bgcolor=#FFFFFF width=10%>$langadgl[8]</td></tr>
$out2
	<tr bgcolor=#EEEEEE><td colspan=5><font color="#000000">$langadgl[9]</font></td></tr></table></table>
eot;
}


if ($action=="change") {	
if ($id=="" || !file_exists("gallery/$id") || !is_dir("gallery/$id")) {
msg_box($langerror,"$langadgl[10]<br><ul><li><a href=$tf>$langback</a></li></ul>");
require("footer.php");
exit;
}
@include("gallery/$id/gallery_nfo.php");
if (empty($gallery_name)) $galname=stripslashes($langadgl[0]);
else $galname=stripslashes($gallery_name);
if (empty($gallery_description)) $galdes="";
else $galdes=stripslashes($gallery_description);
print <<< eot
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td><form action=$tf&action=dochange method=post>
	<table cellpadding=5 cellspacing=1 align=center width='100%'>
	<tr bgcolor=#47637E><td colspan=2><font color="#FFFFFF">$langadgl[11]</font></td></tr>
	<tr align=center bgcolor=#FFFFFF><td  width=25%>$langadgl[4]</td><td bgcolor=#FFFFFF>$id <input type=hidden name=id value=$id></td></tr>
	<tr align=center bgcolor=#FFFFFF><td  width=25%>$langadgl[5]</td><td bgcolor=#FFFFFF><input type=text name=newgalname value="$galname" size=60></td></tr>
	<tr align=center bgcolor=#FFFFFF><td  width=25%>$langadgl[6]</td><td bgcolor=#FFFFFF><input type=text name=newgaldes value="$galdes" size=60></td></tr>
	<tr bgcolor=#FFFFFF><td colspan=2 align=center><input type=submit value="$langsubmit"> <input type=reset value="$langreset"></td></tr></form>
</table></table>
eot;
}

if ($action=="dochange") {	
if ($id=="" || !file_exists("gallery/$id") || !is_dir("gallery/$id")) {
msg_box($langerror,"$langadgl[10]<br><ul><li><a href=$tf>$langback</a></li></ul>");
require("footer.php");
exit;
}
$newgalname=str_replace('"', '', $newgalname);
$newgaldes=str_replace('"', '', $newgaldes);
writetofile("gallery/$id/gallery_nfo.php", "<?\n\$gallery_name = \"$newgalname\";\n\$gallery_description = \"$newgaldes\";\n?>");
msg_box($langsuccess,"$langadgl[12]<br><ul><li><a href=$tf>$langback</a></li></ul>");
require("footer.php");
exit;
}

if ($action=="thumbs") {
$dirhandle=opendir('gallery');
while (false !== ($file = readdir($dirhandle))) {
	if (is_dir("gallery/$file") && $file!="." && $file!="..") {
		$dirname[]=$file;
		@include("gallery/$file/gallery_nfo.php");
		if (empty($gallery_name)) $galname[]=$langadgl[0];
		else $galname[]=$gallery_name;
		$gallery_name="";	
	}
}
for ($i=0; $i<count($dirname); $i++) {
	$out2.="<tr bgcolor=#FFFFFF><td>$dirname[$i]</td><td>$galname[$i]</td><td><a href=$tf&action=dothumbs&id=$dirname[$i]>$langadgl[13]</a></td></tr>"; 
}
print <<< eot
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 align=center width='100%'>
	<tr bgcolor=#47637E><td colspan=3><font color="#FFFFFF">$langadgl[14]</font></td></tr>
	<tr align=center bgcolor=#FFFFFF><td  width=15%>$langadgl[4]</td><td bgcolor=#FFFFFF width=60%>$langadgl[5]</td><td bgcolor=#FFFFFF width=25%>$langadgl[15]</td></tr>
$out2
	<tr bgcolor=#EEEEEE><td colspan=3><font color="#000000">$langadgl[16]</font></td></tr></table></table>
eot;
}


if ($action=="editdes") {
if ($readdir_status=="off") {
	msg_box($langerror,"$langerrornotsupport <br>Function: readdir()<br><ul><li><a href=$tf>$langback</a></li></ul>");
	require("footer.php");
exit;
}
$ghandle=opendir("gallery/$id");
while (false !== ($file = readdir($ghandle))) {
	if ($file!="." && $file!=".." && !is_dir ('gallery/'.$file) && !ereg('_thb_',$file) && strrchr($file,'.')!='.php') {
		$all_files[]=$file;
	}
}
closedir($ghandle);
$alldes=@readfromfile("gallery/$id/gallery_des.php");
for ($i=0; $i<count($all_files); $i++) {
	$signal="<?die();?>*{$all_files[$i]}*";
	$parts=@explode($signal, $alldes);
	if (empty($parts[1])) $all_des[$i]="";
	else {
		$nextid=strpos($parts[1], '*');
		if ($nextid === false) {
			$all_des[$i]="";
		} else {
			$all_des[$i]=stripslashes(substr($parts[1], 0, $nextid));
		}
	}
	$putedit.="<tr bgcolor=#FFFFFF><td><input type=hidden name=picfilename[{$i}] value='{$all_files[$i]}'><a href='gallery/$id/{$all_files[$i]}' target=_blank>{$all_files[$i]}</a></td><td><input type=text name=picdes[{$i}] value=\"{$all_des[$i]}\" size=45></td></tr>\n";
}


print <<< eot
	<table cellpadding=0 cellspacing=0 align=center width=95% bgcolor='#000000'>
	<tr><td>
	<table cellpadding=5 cellspacing=1 align=center width='100%'>
	<tr bgcolor=#47637E><td colspan=5><font color="#FFFFFF">$langadgl[17]</font></td></tr>
	<form action=$tf&action=savedes method=post>	
	<tr align=center bgcolor=#FFFFFF><td  width=15%>$langadgl[18]</td><td bgcolor=#FFFFFF>$langadgl[19]</td></tr>
	$putedit
	<tr bgcolor=#FFFFFF><td colspan=5 align=center><input type=submit value=$langsubmit>  <input type=reset value=$langreset></td></tr>
	<input type=hidden name=id value="$id">
	</form>
	</table></table>
eot;
}


if ($action=="savedes") {
	for ($i=0; $i<count($picfilename); $i++) {
		$saveto.="<?die();?>*{$picfilename[$i]}*".safe_convert($picdes[$i])."*\n";
	}
	writetofile("gallery/$id/gallery_des.php", $saveto);
	msg_box($langsuccess,"$langadgl[20]<br><ul><li><a href=$tf>$langback</a></li></ul>");
	require("footer.php");
	exit;
}


if ($action=="dothumbs") {
if ($gd_status!="on" || $readdir_status=="off") {
msg_box($langerror,"$langerrornotsupport<br>Library: GD; Funtion: readdir()<br><ul><li><a href=$tf>$langback</a></li></ul>");
require("footer.php");
exit;
}
if ($id=="" || !file_exists("gallery/$id") || !is_dir("gallery/$id")) {
msg_box($langerror,"$langadgl[10]<br><ul><li><a href=$tf>$langback</a></li></ul>");
require("footer.php");
exit;
}

$dirhandle=opendir("gallery/$id");
$made=0;
while (false !== ($file = readdir($dirhandle))) {
	if (!is_dir("gallery/$id/$file") && $file!="." && $file!=".." && !eregi("_thb_", $file)) {
		$todolist[]="$file";
	}
}
for ($i=0;$i<count($todolist); $i++) {
		$file=$todolist[$i];
		$skipthis=0;
		@list($width, $height, $type) = @getimagesize("gallery/$id/$file");
		if ($type==2) @$image=imagecreatefromjpeg("gallery/$id/$file"); 
		elseif ($type==1) @$image=imagecreatefromgif("gallery/$id/$file"); 
		elseif ($type==3) @$image=imagecreatefrompng("gallery/$id/$file"); 
		else $skipthis=1;
			if ($skipthis==0) {
				$thumbname="gallery/$id/_thb_".$file;
				if (file_exists($thumbname)) @unlink($thumbname);
				$image_x=imagesx($image); 
				$image_y=imagesy($image); 
				if (max($image_x, $image_y)>100) { 
					if($image_x==$image_y){ 
						$x=100; 
						$y=0; 
					} 
					else if($image_x>$image_y){ 
						$x=100; 
						$y=intval(100*$image_y/$image_x); 
					} 
					else{ 
						$y=100; 
						$x=intval(100*$image_x/$image_y); 
					} 
					if ($type==2) $image1=imagecreatetruecolor($x,$y); 
					else $image1=imagecreate($x,$y); 
					imagecopyresized($image1,$image,0,0,0,0,$x,$y,$image_x,$image_y); 
					imagejpeg($image1,$thumbname); 
					$made+=1;
				}
				else @copy ("gallery/$id/$file", $thumbname);
		}
}
msg_box($langsuccess,"$langadgl[21] {$made}<br><ul><li><a href=$tf&action=thumbs>$langback</a></li></ul>");
require("footer.php");
exit;
}


?>