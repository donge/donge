<?
// Bo-Blog
// A Blog System based on PHP and text database
// Author: Bob Shen
// Official Site: http://www.bo-blog.com
// Email: bobshen@gmail.com
// All Rights Reserved.
// 版权所有，任何修改版权后使用传播之行为皆不允许


require("global.php");
require_once("blog/language/$bloglang/search.lang.php"); //引入语言包

$searchvolume=300;

if ($_COOKIE['lastsearchinboblog']==1) {
	$go="<back>";
	require ("header.php");
	$err=getstr($searchinterval, $langsearch[0]);
	msg_box($langerror,"$err<br><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
	require("footer.php");
	exit();
}

if ($advancesearch==2 && $guest_login!=1 && $login_status!=1) {
	$go="<back>";
	require ("header.php");
	msg_box($langerror,"$langsearch[1]<br><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
	require("footer.php");
	exit();
}
if ($advancesearch==3 && $login_status!=1) {
	$go="<back>";
	require ("header.php");
	msg_box($langerror,"$langsearch[2]<br><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
	require("footer.php");
	exit();
}


$keywords=trim($keywords);
$keywords=str_replace('　', '', $keywords);
$keywords=safe_convert($keywords);

if (strlen($keywords)<=3 || checksensitive($keywords) || checkbansearch($keywords))  {
	$go="<back>";
	require ("header.php");
	msg_box($langerror,"$langsearch[3]<br><ul><li><a href=index.php>$langbacktoindex</a></li></ul>");
	require("footer.php");
	exit();
}

if ($guest_login==1 || $login_status==1) {
	$usersearchfile=md5($nowuserid."|".$keywords).".php";
}
else {
	$usersearchfile=md5($ip."|".$keywords).".php";
}

list  ($visit, $articlenum, $reply_single, $todayvisit, $regusers) = countvisit(1);

if (file_exists ("temp/$usersearchfile")) {
	$result=@explode("θscθ", @readfromfile("temp/$usersearchfile"));
	$oldresult=$result[3];
	if ($result[1]==($articlenum-1)) echo "<META HTTP-EQUIV='Refresh' CONTENT='0;URL=index.php?job=showsearch&mode=shre&f=$usersearchfile'>Searching";
	else $resultshow=dosearch ($keywords, $result[1]);
}
else $resultshow=dosearch ($keywords, 0);

@setcookie("lastsearchinboblog","1",time()+$searchinterval);

writetofile ("temp/$usersearchfile",  "<?die();?>θscθ".($resultshow[0])."θscθ".$keywords."θscθ".$resultshow[1].$oldresult);

echo "<META HTTP-EQUIV='Refresh' CONTENT='0;URL=index.php?job=showsearch&mode=shre&f=$usersearchfile'>Searching";

exit();


function dosearch ($keywords, $initid) {
	global $dirblog, $method, $cat, $timeperiod, $range, $searchvolume;
	$cutime=time();
	$timesearch=array ($cutime, 31536000, 15768000, 7884000, 2628000, 1209600, 604800);
	if (in_array('bt', $range)) $needsrtitl=1;
	if (in_array('nr', $range)) $needsrcont=1;
	$allfiles=@yafile("$dirblog/list.php");	
	$founded=0;
	for ($i=$initid; $i<count($allfiles); $i++) {
		if ($founded>=$searchvolume) break;
		$tmp=@explode("|", $allfiles[$i]);
		if ((($cutime-$tmp[3])>$timesearch[$timeperiod]) || ($cat!='' && $tmp[4]!=$cat) || ($tmp[9]==1)) continue;
		if ($needsrtitl==1) {
			if (strpos(strtolower($tmp[2]) , strtolower($keywords))!== false) {
				$results[]=$allfiles[$i];
				$founded+=1;
			}
			elseif ($needsrcont==1) {
				$tempcont=@readfromfile ("$dirblog/{$tmp[1]}.art");
				if (strpos(strtolower($tempcont), strtolower($keywords))!== false) {
					$results[]=$allfiles[$i];
					$founded+=1;	
				}
				unset($tempcont);
			}
			else {
			}
		} else {
			if ($needsrcont==1)  {
				$tempcont=@readfromfile ("$dirblog/{$tmp[1]}.art");
				if (strpos(strtolower($tempcont), strtolower($keywords))!== false) {
					$results[]=$allfiles[$i];
					$founded+=1;
				}
				unset($tempcont);
			}
		}
	}
	$array2=@implode("", $results);
	$array1=$i;
	return array ($array1, $array2);
}
