<?
chdir ("..");
$wapinfo="1.5";
$perpageword=300;

require("global.php");
print_wap_header();


if (!$job) {
print <<< eot
</p>
<p align="center"><small>$blogdc</small><br/>
<img src="ball.gif" alt="·"/><a href="index.php?job=browse">日志浏览</a><br/>
<img src="ball.gif" alt="·"/><a href="index.php?job=seecate">分类查看</a><br/>
<img src="ball.gif" alt="·"/><a href="index.php?job=info">日志信息</a><br/>
<img src="ball.gif" alt="·"/><a href="index.php?job=add">添加日志</a><br/>
eot;
}

elseif ($job=='browse') {
if ($cat=="") {
	$tar="list.php";
} else {
	$cat=basename($cat);
	if (file_exists("$dirblog/$cat.php")) $tar="$cat.php";
	else $tar="list.php";
}
if ($page<=0) $page=1;
$all=@yafile("$dirblog/$tar");
$icount=count($all);
$lastpage=floor(($icount-1)/5)+1;
if ($page>$lastpage) $page=$lastpage;

$start=($page-1)*5;
if (($start+5-1)<$icount) {$end=$start+5;}
else $end=$icount;
if ($page!=$lastpage) $nextaddr=" | <a href=\"index.php?job=browse&amp;page=".($page+1)."&amp;cat=$cat\">[下页]</a>";
if ($page!=1) $lastaddr="<a href=\"index.php?job=browse&amp;page=".($page-1)."&amp;cat=$cat\">[上页]</a> | ";
$jumpaddr="分页：$page/$lastpage 转到<input name=\"page\" />页<br/>";
echo "点击R可直接查看评论<br/>";
for ($i=$start; $i<$end; $i++) {
$tmp=explode("|", $all[$i]);
$tmp[2]=msubstr(eregi_replace("&nbsp;","",$tmp[2]), 0, 18);
$linkaddr="index.php?job=read&amp;id=$tmp[1]&amp;bp=$page";
$replyaddr="index.php?job=seereply&amp;id=$tmp[1]&amp;bp=$page";
$tmp[3]=date("Y-n-j",($tmp[3]+$timezone*3600));
print <<< eot
<img src="ball.gif" alt="·"/><a href='$linkaddr'>$tmp[2]</a>($tmp[3])  [<a href="$replyaddr">R</a>]<br/>
eot;
}
print <<< eot
</p>
<p align="right">
<br/>$jumpaddr
<anchor>
[确定]
<go href="index.php?job=browse&amp;cat=$cat" method="post">
<postfield name="page" value="$(page)"/>
</go>
</anchor>
</p>
<p align="center">

<br/>$lastaddr <a href="index.php">[返回]</a> $nextaddr
eot;
}

elseif ($job=='seecate') {
	$navall=@file("$dirblog/cat.php");
	for ($i=0;$i<count($navall); $i++) {
		$navtmp=explode("|",$navall[$i]);
		$navt2=$navtmp[1];
		$categories[$navt2]=$navtmp[2];
		$catnav.="<img src=\"ball.gif\" alt=\"·\"/><a href=\"index.php?job=browse&amp;cat=$navt2\">$navtmp[2]</a><br/>";
	}
print <<< eot
</p>
<p align="left">
所有分类列表<br/>
$catnav
</p>
<p align="center">
<a href="index.php">[返回]</a>
eot;
}

elseif ($job=='info') {
list  ($visit, $articlenum, $reply_single, $todayvisit, $regusers) = countvisit(1);
print <<< eot
</p>
<p align="left">
<img src="ball.gif" alt="·"/>博客主人： $username<br/>
<img src="ball.gif" alt="·"/>访问总量： $visit<br/>
<img src="ball.gif" alt="·"/>日志总数： $articlenum<br/>
<img src="ball.gif" alt="·"/>回复总数： $reply_single<br/>
<img src="ball.gif" alt="·"/>今日访问： $todayvisit<br/>
<img src="ball.gif" alt="·"/>注册用户： $regusers<br/>
</p>
<p align="center">
<a href="index.php">[返回]</a>
eot;
}

elseif ($job=='add') {
	$all=@file("$dirblog/cat.php");
	$putcats="<select name='cat'>";
	for ($i=0;$i<count($all); $i++) {
		$tmp=explode("|",$all[$i]);
		$putcats.="<option value='$tmp[1]'>$tmp[2]</option>";
	}
	$putcats.="</select>";
print <<< eot
</p>
<p align="left">
用户名： <input name="username" value="$username"/><br/>
密码： <input name="password"/><br/>
标题： <input name="entrytitle"/><br/>
内容： <input name="entrycontent"/><br/>
分类： $putcats <br/>
天气： <select name="weathertoday"><option value="">不指定</option><option value="w_sunny">晴</option><option value="w_overcast">阴</option><option value="w_cloudy">多云</option><option value="w_rainy">雨</option><option value="w_night">夜晚</option><option value="w_snowy">雪</option><option value="w_thunder">雷阵雨</option></select><br/>
属性： <select name="ishidden"><option value="0">公开</option><option value="1">隐藏</option><option value="2">锁定</option><option value="3">仅注册用户可见</option></select><br/>
<anchor>
[发表]
<go href="index.php?job=addentry" method="post" accept-charset="UTF-8">
<postfield name="username" value="$(username)"/>
<postfield name="password" value="$(password)"/>
<postfield name="entrytitle" value="$(entrytitle)"/>
<postfield name="entrycontent" value="$(entrycontent)"/>
<postfield name="weathertoday" value="$(weathertoday)"/>
<postfield name="ishidden" value="$(ishidden)"/>
<postfield name="cat" value="$(cat)"/>
</go>
</anchor>
</p>
<p align="center">
<a href="index.php">[返回]</a>
eot;
}

elseif ($job=='addentry') {
if (empty($password) || md5($password)!=$userpassword) {
print <<< eot
对不起，您输入的密码不正确！
</p>
<p align="center">
<a href="index.php?job=add">[返回]</a>
eot;
}
elseif (empty($entrytitle) || empty($entrycontent)) {
print <<< eot
对不起，您没有填写标题或者内容！
</p>
<p align="center">
<a href="index.php?job=add">[返回]</a>
eot;
}
else {
	$title=stripslashes(safe_convert($entrytitle));
	$icontent=safe_convert($entrycontent);
	$timestamp=time();
	$aco=date("Ymd_His");
	$bco=date("Ymd");
	$allrec=@readfromfile("$dirblog/calrec.txt");
	if (@!ereg($bco, $allrec)) {
		$allrec.=".$bco";
		writetofile("$dirblog/calrec.txt",$allrec);
	}
	$aco="a_".$aco;
	updateartnum(1);
	$newest="<?die();?".">|$aco|$title|$timestamp|$cat|0|$weathertoday|1|0|$ishidden|\n";
	$newestappend="<θθθ>0|";  
	writetofile("$dirblog/$aco.art",$icontent.$newestappend);
	$tmp11=$newest.@readfromfile("$dirblog/list.php");
	$tmp12=$newest.@readfromfile("$dirblog/$cat.php");
	writetofile("$dirblog/list.php",$tmp11);
	writetofile("$dirblog/$cat.php",$tmp12);
	updatenewestart();
print <<< eot
成功发表了一篇日志！
</p>
<p align="center">
<a href="index.php?job=browse">[返回]</a>
eot;
}
}

elseif ($job=="read") {
echo "</p>";
$backaddr="index.php?job=browse&amp;page=$bp";
$replyaddr="index.php?job=reply&amp;id=$id&amp;page=$bp";
$seereplyaddr="index.php?job=seereply&amp;id=$id&amp;page=$bp";
if (!empty($id)) {
	$tmp=locatedata("$dirblog/list.php", $id);
	if (!$tmp) return;
	if ($tmp[9]==1 || $tmp[9]==3) {
		echo "<p align=\"center\">隐藏或者有所限制的日志，不开放WAP浏览！";
		echo " <br /><a href=\"$backaddr\">[返回]</a><br/>";
	}	else {
		$tmp[3]=date("Y-n-j",($tmp[3]+$timezone*3600));
		$strw=@explode("<θθθ>",readfromfile("$dirblog/{$tmp[1]}.art"));
		$str=preg_replace("/\[hide\](.+?)\[\/hide\]/is","==隐藏内容==",stripslashes($strw[0])); 
		$str=preg_replace("/\[admin\](.+?)\[\/admin\]/is","==隐藏内容==",$str); 
		$str=preg_replace("/\[(.+?)\]/is", "", $str);
		$str=strip_tags ($str, "<br>");
		$str=ereg_replace("<br>",'θ',$str); 
		$str=ereg_replace("<br />",'θ',$str); 
		$str=preg_replace("/&(.+?);/is", "", $str);
		if (empty($page)) $page=1;
		list($str, $lens)=msubstr($str, ($page-1)*$perpageword, $perpageword, 2);
		$str=ereg_replace('θ', "<br />",$str); 
		$totalpages=floor($lens/$perpageword)+1;
		$pageline="--文内分页 $page/$totalpages";
		for ($i=1; $i<=$totalpages; $i++) {
			$pageline.=" <a href=\"index.php?job=read&amp;id=$id&amp;page=$i\">[$i]</a> ";
		}
echo<<<eot
<p align="center"><b>$tmp[2]</b><br/></p>
<p align="left">
eot;
		echo $str;
		echo " <br />$pageline<br /><a href=\"$seereplyaddr\">[查看回复]</a> <a href=\"$replyaddr\">[添加回复]</a> <br/><a href=\"$backaddr\">[返回]</a><br/>";
	}
} else {
	echo "<p align=\"center\">不存在的日志id！";
	echo " <br /><a href=\"$backaddr\">[返回]</a><br/>";
}
}

elseif ($job=="seereply") {
	echo "</p>";
	$backaddr="index.php?job=browse&amp;page=$bp";
	$replyaddr="index.php?job=reply&amp;id=$id&amp;page=$bp";
	if (!empty($id)) {
		$tmp=locatedata("$dirblog/list.php", $id);
		if (!$tmp) return;
		if ($tmp[9]==1 || $tmp[9]==3) {
			echo "<p align=\"center\">隐藏或者有所限制的日志，不开放WAP浏览！";
			echo " <br /><a href=\"$backaddr\">[返回]</a><br/>";
		}	else {
			if ($tmp[5]==0 || !file_exists("$dirblog/$id.rep")) {
				echo "<p align=\"center\">暂时还没有对这篇日志的评论！点击添加回复进行评论。";
			} else {
				unset ($stmp);
				$stmp=@file("$dirblog/$id.rep");
				$areply=@readfromfile("$dirblog/$id.rpl");
				$tmpreply=@explode("\n|rep|", $areply);
				$countreps=min ($tmp[5], 5);
				for ($i=0; $i<$countreps;$i++) {
					$rep=explode("|",$stmp[$i]);
					$replyauthorandemail=@explode("θθ", $rep[2]);
					$replyauthor=trim($replyauthorandemail[0]);
					$rep[3]=mktimezone($rep[3]);
					$replytime=date($langdatefomat, $rep[3]);
					$reply=preg_replace("/\[(.+?)\]/is", "", stripslashes(getreply($tmpreply[$i])));
					$reply=strip_tags ($reply, "<br>");
					$reply=ereg_replace("<br>",'<br />',$reply); 
					$reply=preg_replace("/&(.+?);/is", "", $reply);
					$replybody.="<b>".($i+1).". $replyauthor 评论</b><br/><small>[$replytime]</small><br/>$reply<br/>";
					//2005-2-13 增加管理员回复
					if ($rep[6]=="y") {
						$adminreplytime=date($langdatefomat, mktimezone($rep[7]));
						$adminreplycontent=preg_replace("/\[(.+?)\]/is", "", stripslashes($rep[8]));
						$adminreplycontent=strip_tags ($adminreplycontent, "<br>");
						$adminreplycontent=ereg_replace("<br>",'<br />',$adminreplycontent); 
						$adminreplycontent=preg_replace("/&(.+?);/is", "", $adminreplycontent);
						$replybody.="<b>{$username} 回复</b><br/><small>[$adminreplytime]</small><br/>$adminreplycontent<br/>";
					}
					//管理员回复结束
				}


				echo "<p align=\"center\">最新5篇评论</p><p align=\"left\">$replybody";
			}
			if ($tmp[9]==2) echo "<br/>本文已锁定，不能评论！</p><p align=\"center\"><a href=\"$backaddr\">[返回]</a>";
			else echo "</p><p align=\"center\"><a href=\"$replyaddr\">[添加回复]</a> <a href=\"$backaddr\">[返回]</a>";
		}
	} else {
		echo "<p align=\"center\">不存在的日志id！";
		echo " <br /><a href=\"$backaddr\">[返回]</a><br/>";
	}
}


elseif ($job=="reply") {
	echo "</p>";
	$backaddr="index.php?job=browse&amp;page=$bp";
	if (!empty($id)) {
		$tmp=locatedata("$dirblog/list.php", $id);
		if (!$tmp) return;
		if ($tmp[9]==1 || $tmp[9]==2) {
			echo "<p align=\"center\">该日志隐藏或锁定，不能回复！";
			echo " <br /><a href=\"$backaddr\">[返回]</a><br/>";
		}	else {
			print <<< eot
<p align="center">添加回复</p>
<p align="left">
昵称： <input name="replyauthor"/><br/>
密码： <input name="replypassword"/> (未注册则可不填)<br/>
内容： <input name="replycontent"/><br/>
<anchor>
[送出]
<go href="index.php?job=addreply" method="post" accept-charset="UTF-8">
<postfield name="replyauthor" value="$(replyauthor)"/>
<postfield name="replypassword" value="$(replypassword)"/>
<postfield name="replycontent" value="$(replycontent)"/>
<postfield name="id" value="$id"/>
</go>
</anchor>
</p>
<p align="center">
<a href="$backaddr">[返回]</a>
eot;
		}
	} else {
		echo "<p align=\"center\">不存在的日志id！";
		echo " <br /><a href=\"$backaddr\">[返回]</a><br/>";
	}
}

elseif ($job=="addreply") {
echo "</p>";
$backaddr="index.php?job=browse";
$replyauthor=str_replace("　","", trim($replyauthor));
if (!empty($id)) {
	$tmp=locatedata("$dirblog/list.php", $id);
	if (!$tmp) exit();
	if ($tmp[9]==1 || $tmp[9]==2) {
		echo "<p align=\"center\">该日志隐藏或锁定，不能回复！";
		$notok=1;
	}	else {
		if (empty($replyauthor)) {
			echo "<p align=\"center\">未填写昵称！";
			$notok=1;
		} elseif ($replyauthor==$username && md5($replypassword)<>$userpassword) {
			echo "<p align=\"center\">密码不正确！";
			$notok=1;
		} elseif ($replyauthor==$username && md5($replypassword)==$userpassword) {
			$notok=0;
			$con=1;
		} elseif (isregistered($replyauthor)) {
			$idfile=getinitial($replyauthor);
			$tmp=@file("$diruser/$idfile.php");
			for ($i=0; $i<count($tmp);$i++) {
				$tk=explode("|",$tmp[$i]);
				if (strtolower($tk[1])==strtolower($replyauthor)) {
					$correctpassword=$tk[2];
					break;
				}
			}
			if (md5($replypassword)<>$correctpassword) {
				$notok=0;
				$con=0;
			} else {
				$notok=0;
				$con=2;
			}
		} else {
				$notok=0;
				$con=0;
		}
	}
	$replycontent=trim($replycontent);
	if ($replycontent=='') {
		echo "<p align=\"center\">未填写内容！";
		$notok=1;
	}

	if ($notok!=1) {
		unset ($all);
		$all=@file("$dirblog/list.php");
		for ($i=0; $i<count($all);$i++) {
			$latest=explode("|",$all[$i]);
			if ($latest[1]==$id) {
				if (file_exists("blog/sticky.php")) require("blog/sticky.php");
				if ($sticky==$all[$i]) $needchangeinsticky=1;
				$latest[5]=$latest[5]+1;
				$all[$i]=implode("|", $latest);
				if ($needchangeinsticky==1) writetofile("blog/sticky.php", "<?\n\$sticky=\"$all[$i]\";\n\$announce=\"$announce\";");
				$curtitle=$latest[2];
				$curid=$latest[1];
				break;
			}
		}
		$all1=implode("", $all);
		$replyauthor=safe_convert($replyauthor);
		$replycontent=safe_convert($replycontent);
		$simplecontent=preg_replace("/\[(.+?)\]/is", "", $replycontent);
		$simplecontent=preg_replace("/<(.+?)>/is", "", $simplecontent);
		$simplecontent=preg_replace("/&(.+?);/is", "", $simplecontent);
		$curexcerpt=msubstr($simplecontent,0,20);
		$timestamp=time();
		$areply=@readfromfile("$dirblog/$id.rpl");
		writetofile("$dirblog/$id.rpl",$replycontent."\n|rep|\n".$areply);
		writetofile("$dirblog/list.php",$all1);
		updaterenum(1);

		$newest="<?die();?".">||$replyauthor|$timestamp|$con|wap|\n";
		$allre=@readfromfile("$dirblog/$id.rep");
		writetofile("$dirblog/$id.rep",$newest.$allre);
		updatenewestart();
		$curre="<?die();?".">|$curid|$curtitle|$timestamp|$curexcerpt|\n";
		$allrere=@readfromfile("$dirblog/replies.php");
		writetofile("$dirblog/replies.php",$curre.$allrere);
		updatenewestrep();
		echo "<p align=\"center\">评论发布成功！";
	}
} else {
	echo "<p align=\"center\">不存在的日志id！";
}
echo " <br /><a href=\"$backaddr\">[返回]</a><br/>";
}

print_wap_footer();


function print_wap_header () {
global $blogname;
header("Content-type: text/vnd.wap.wml");
echo '<?xml version="1.0" encoding="UTF-8" ?>';
print <<< eot
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<card id="Bo-Blog" title="$blogname">
<p align="center"><b>$blogname@WAP</b><br/></p>
<p align="left">
eot;
}

function print_wap_footer() {
global $versioninfo, $wapinfo;
print <<< eot
</p>
<p align="right"><small>$versioninfo<br/>Wap组件版本 $wapinfo</small></p>
</card>
</wml>
eot;
}
?>