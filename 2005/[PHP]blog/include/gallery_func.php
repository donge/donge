<?php
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
//require_once("blog/language/$bloglang/gallery.lang.php"); //引入语言包

function roam_gal ($dirgal) { //扫描得到所有的相册
	global $gal_dirname, $gal_name, $gal_desc;
	$totalgals=0;
	$ghandle=opendir($dirgal);
	while ($file = readdir($ghandle)) {
		if ($file!="." && $file!=".." && is_dir ($dirgal.'/'.$file)) {
			$totalgals+=1;
			$gal_dirname[]=$file;
			@include ($dirgal.'/'.$file.'/gallery_nfo.php');
			$gal_name[]=stripslashes($gallery_name);
			$gal_desc[]=stripslashes($gallery_description);
			unset ($gallery_name, $gallery_description);
		}
	}
	closedir($ghandle);
	return $totalgals;
}

function table_generate ($arrays, $perrow, $countall) {
	$rows=floor(($countall+$perrow-1) /$perrow); //感谢 Turbozv指出并修正BUG
	$eachwidth=floor(100/$perrow).'%';
	$out='<table width="100%" cellpadding="0" cellspacing="0">';
	$array_cur=0;
	for ($i=0; $i<$rows; $i++) {
		$out.='<tr align="center">';
		for ($j=0; $j<$perrow; $j++) {
			$out.="<td width='$eachwidth' valign='top'>".$arrays[$array_cur].'</td>';
			$array_cur+=1;
		}
		$out.='</tr>';
	}
	$out.='</table>';
	return $out;
}

function roam_folder ($dirgal) { //扫描得到相册文件夹下所有图片
	global $pic_name,$pic_name_encoded, $pic_des, $pic_thumb, $thumb_affix, $no_thumb;
	$totalpics=0;
	$pic_des_all=get_des ($dirgal);
	$ghandle=opendir($dirgal);
	while (false !== ($file = readdir($ghandle))) {
		if ($file!="." && $file!=".." && !is_dir ($dirgal.'/'.$file) && !ereg($thumb_affix,$file)) {
			if (identify_format(strrchr($file,'.'))) { 
				$totalpics+=1;
				$pic["name"][]=$file;
				$pic["name_encoded"][]=base64_encode($dirgal.'/'.$file);
				$pic["des"][]=pic_des($file, $pic_des_all);
				if (file_exists($dirgal.'/'.$thumb_affix.$file)) $pic["thumb"][]=$dirgal.'/'.$thumb_affix.$file;
				else $pic["thumb"][]=$no_thumb;
			}
		}
	}
	closedir($ghandle);
	if ($totalpics>0) array_multisort ($pic["name"], SORT_REGULAR, $pic["name_encoded"], SORT_REGULAR, $pic["des"], SORT_REGULAR, $pic["thumb"], SORT_REGULAR);
	$pic_name=$pic["name"];
	$pic_name_encoded=$pic["name_encoded"];
	$pic_des=$pic["des"];
	$pic_thumb=$pic["thumb"];
	return $totalpics;
}

function identify_format ($ext) { //判断有效图形文件
	global $cognitive_pic;
	if (in_array (strtolower($ext), $cognitive_pic)) return true;
	else return false;
}

function get_des ($dirgal) { //得到描述
	if (file_exists($dirgal.'/gallery_des.php')) $pu=readfromfile($dirgal.'/gallery_des.php');
	return $pu;
}

function pic_des($file, $pic_des_all) { //具体描述
	$signal="<?die();?>*$file*";
	$parts=@explode($signal, $pic_des_all);
	if (empty($parts[1])) return '';
	else {
		$nextid=strpos($parts[1], '*');
		if ($nextid === false) {
			return '';
		} else {
			$full=substr($parts[1], 0, $nextid);
			return stripslashes($full);
		}
	}
}

function get_context($trueurl) { //上一张和下一张
global $thumb_affix;
	$basedir=pathinfo ($trueurl);
	$ghandle=opendir($basedir["dirname"]);
	while (false !== ($file = readdir($ghandle))) {
		if ($file!="." && $file!=".." && !is_dir ($basedir["dirname"].'/'.$file) && !ereg($thumb_affix,$file) && identify_format(strrchr($file,'.')) ) {
			$all_files[]=$file;
		}
	}
	closedir($ghandle);
	sort($all_files);
	$id=array_search ($basedir["basename"], $all_files);
	$last=$all_files[$id-1];
	$next=$all_files[$id+1];
	return array($last, $next, $basedir["dirname"].'/');
}
