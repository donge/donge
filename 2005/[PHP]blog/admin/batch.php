<?
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行
require_once("blog/language/$blogadminlang/admincp.lang.php"); //引入语言包

$tf="admin_cp.php?job=batch";
 if (!$action) $action='bstart';

if ($action=='bstart') {
unset($tmp);

if (file_exists("$dirblog/list.php")) {
	$tmp=@yafile("$dirblog/list.php");
	$mi=count($tmp);
//分页开始
if (empty($page)) $page=1;

unset ($pagexia, $pageshang, $pagezuihou, $pagediyi, $pagexiangxi, $pagexianzai);
$mi=count($tmp);
$start=($page-1)*$artperpage;
if (($start+$artperpage-1)<$mi) {$end=$start+$artperpage;}
else $end=$mi;
$lastpage=floor(($mi-1)/$artperpage)+1;
if ($page<>1) $pageshang=" <a href=\"$tf&page=".strval($page-1)."\">$directarrow[0]</a> "; 
if ($page<>$lastpage) $pagexia= " <a href=\"$tf&page=".strval($page+1)."\">$directarrow[1]</a>";
$pagediyi= " <a href=\"$tf&page=1\">$directarrow[2]</a>";
$pagezuihou= " <a href=\"$tf&page=$lastpage\">$directarrow[3]</a>";
for ($i=$page; $i<$page+5; $i++) {
	if ($i<=$lastpage) $pagexiangxi.=" <a href=\"$tf&page=$i\">$i</a> ";
	else break;
}
$pagexianzai=$langaau[14].$page."/".$lastpage;
//分页结束


$navall=@file("$dirblog/cat.php");
for ($i=0;$i<count($navall); $i++) {
	$navtmp=explode("|",$navall[$i]);
	$navt2=$navtmp[1];
	$categories[$navt2]=$navtmp[2];//获取分类数组
}

$ifhidden=array ($langabt[0], $langabt[1], $langabt[2]);
for ($i=$start; $i<$end; $i++) {
	$tk=explode("|",$tmp[$i]);
	$tk[3]=date("Y-n-j",$tk[3]);
	$tk[4]=$categories[$tk[4]];
	$tk[9]=$ifhidden[$tk[9]];
	$listname.="<tr align=\"center\"  bgcolor=\"#FFFFFF\"><td><input type=checkbox name='chditem[$i]' value='{$tk[1]}'></td><td align=left>$tk[2]</td><td>$tk[3]</td><td>$tk[4]</td><td>$tk[9]</td></tr>";
}
}

$showup="<form action=$tf method=post><table width=\"98%\" cellpadding=\"0\" cellspacing=\"0\" align=center><tr><td bgcolor=\"#000000\" colspan=2><table width=\"100%\"  cellpadding=\"4\" cellspacing=\"1\"><tr align=\"center\"><td bgcolor=\"#E9F2FC\" width=\"5\"></td><td  bgcolor=\"#E9F2FC\" width=50%><span style=\"color: #000000\">$langabt[3]</span></td><td  bgcolor=\"#E9F2FC\" width=15%><span style=\"color: #000000\">$langabt[4]</span></td><td  bgcolor=\"#E9F2FC\"><span style=\"color: #000000\">$langabt[5]</span></td><td  bgcolor=\"#E9F2FC\"><span style=\"color: #000000\">$langabt[6]</span></td></tr>".$listname."</table></td></tr>";
$getcats=getcats();
$showup.="<tr><td><input type=radio name='requestaction' value=del>$langabt[7] <input type=radio name='requestaction' value=chhidden>$langabt[8] <select name=\"ishidden\"><option value=0>$langabt[0]</option><option value=1>$langabt[1]</option><option value=2>$langabt[2]</option><option value=3>$langabt[13]</option></select> <input type=radio name='requestaction' value=move>$langabt[9] $getcats</td><td><div align=\"right\">$pagexianzai $pagediyi $pageshang $pagexiangxi $pagexia $pagezuihou </td></tr></table><br/><div align=center><input type=submit value='$langsubmit'> <input type=reset value='$langreset'><input type=hidden name=action value=second></form>";

print $showup;
require("footer.php");
exit();
}

if ($action=='second') {
if ($requestaction=='move' && $cat=='') {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langerrorfor<br>$langabt[10]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
}

if (empty($chditem)) {
	$go="<back>";
	require("header.php");
	msg_box($langerror,"$langerrorfor<br>$langabt[11]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
	exit;
}



$tmp=@yafile("$dirblog/list.php");
for ($i=0; $i<count($tmp); $i++) {
	$tk=explode("|",$tmp[$i]);
	if (in_array($tk[1], $chditem)) {
		switch ($requestaction) {
			case 'del':
				$oldcat[]=$tk[4];
				$tmp[$i]="";
				break;
			case 'move':
				$oldcat[]=$tk[4];
				$tk[4]=$cat;
				$tmp[$i]=implode("|", $tk);
				$newentries[]=$tmp[$i];
				break;
			case 'chhidden':
				$tk[9]=$ishidden;
				$tmp[$i]=implode("|", $tk);
				break;
		}
	}
}
$altogether=implode('', $tmp);
writetofile("$dirblog/list.php", $altogether);

if ($requestaction=='move' || $requestaction=='del') {
	$oldcat=array_unique($oldcat);
	for ($i=0; $i<sizeof($oldcat); $i++) {
		unset($tmp, $altogether);
		$tmp=@file("$dirblog/$oldcat[$i].php");
		for ($j=0; $j<count($tmp); $j++) {
			$tk=explode("|",$tmp[$j]);
			if (in_array($tk[1], $chditem)) {
				$tmp[$j]='';
			}
		}
		$altogether=implode('', $tmp);
		writetofile("$dirblog/$oldcat[$i].php", $altogether);
	}
}

if ($requestaction=='move') {
	unset($tmp);
	$tmp=@yafile("$dirblog/$cat.php");
	$tmp2=array_merge($tmp, $newentries);
	arsort ($tmp2);
	writetofile("$dirblog/$cat.php", implode('', $tmp2));
}

if ($requestaction=='del') {
	$num=count($chditem);
	updateartnum(-$num);
}

updatenewestart();
require("header.php");
msg_box($langerror,"$langsuccess<br>$langabt[12]<br><ul><li><a href=javascript:history.back(1)>$langback</a></li></ul>");
exit;

}
