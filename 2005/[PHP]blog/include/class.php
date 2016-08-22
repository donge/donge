<?
class listshow extends Template
{  // 摘要方式显示类

	function list_extract ($inputline) {
		global $langmain, $dirblog, $login_status, $guest_login, $categories, $tem, $langdatefomat, $articlereplys, $parts, $location, $username;
		list($unused, $articleid, $articlename, $week, $catidd, $articlereplys, $todayweather, $mpstatus, $tracknum, $ishidden, $permanantlink, $blogauthor)=@explode("|",$inputline);
		$permanantlink=trim($permanantlink); //伪静态地址
		$blogauthor=trim($blogauthor);
		if (empty($blogauthor)) $blogauthor=$username; //作者
		if (!empty($permanantlink)) $articlelinkaddr="p/{$permanantlink}.php";
		else $articlelinkaddr="index.php?job=art&amp;articleid=$articleid";
		$articlename="<a href=\"$articlelinkaddr\">$articlename</a>";
		if ($mpstatus==1) $articlename=str_replace("{chr}", $langmain[34], $parts["mobile"]).$articlename; //手机
		$week2=date("w", $week);
		$articletime=date($langdatefomat, mktimezone($week)).$langweekfull[$week2];
		if (empty($tracknum)) $tracknum=0;
		if (ereg("w_", $todayweather)) $articletime="<img src=\"{$location['weather']}/$todayweather.gif\" alt=\"$langmain[1]\"/>".$articletime; //天气
		$articlemall=sgetarticle("$dirblog/$articleid.art");
		$article=$articlemall["content"]; //得到内容
		list($articleviews, $nouse)=@explode("|", $articlemall["append"]); //得到计数器
		$articleviews=str_replace("{chr}", getstr($articleviews, $langmain[2]), $parts['articleviews']); //得到阅读次数
		if ($ishidden==1 && $login_status!=1) $article=str_replace("{chr}", $langmain[3], $parts['ishidden1']);
		if ($ishidden==3 && ($login_status!=1 && $guest_login!=1)) $article=str_replace("{chr}", $langmain[38], $parts['ishidden3']);
		if (file_exists("catimg/".$catidd.".gif")) $thiscatimg="<a href=\"index.php?job=showcat&amp;cat=$catidd\"><img src=\"catimg/".$catidd.".gif\" border=\"0\" alt=\"{$categories[$catidd]}\"  align=\"middle\"/></a>";
		else $thiscatimg="<img src=\"blog/template/".$tem."/noimg.gif\" alt=\"{$categories[$catidd]}\"/>";
		$thiscat="<a href=\"index.php?job=showcat&amp;cat=$catidd\">{$categories[$catidd]}</a>";
		$article=preg_replace("/\[([^ ]+)(.+)/is",	"", $article);
		if ($articlemall['is_all']==1) $seereply=multi_str_replace(array("{url}"=>$articlelinkaddr, "{chr}"=>$langmain[12]), $parts['readall']);
		else $seereply='&nbsp;';
		return (array($articleid, $articlename, $articletime, $tracknum, $article, $thiscat, $thiscatimg, $articleviews, $seereply, $blogauthor));
	}

	function list_list ($inputline) {
		global $langmain, $parts;
		$latest=explode("|",$inputline);
		list($unused, $articleid, $articlename, $week, $catidd, $articlereplys, $todayweather, $mpstatus, $tracknum, $ishidden, $permanantlink)=@explode("|",$inputline);
		if ($latest[7]==1) $articlename="<img src=\"img/mp.gif\" alt=\"$langmain[34]\"  border=\"0\"/>".$articlename; //手机
		$permanantlink=trim($latest[10]); //伪静态地址
		if (!empty($permanantlink)) $linkaddr="p/{$permanantlink}.php";
		else $linkaddr="index.php?job=art&amp;articleid=$articleid";
		$showtime=date("Y-n-j",mktimezone($latest[3]));
		$alllist="{$parts['listpic']} <a href=\"$linkaddr\">$articlename</a> ($showtime)<br/><br/>";
		return $alllist;
	}

	function make_pages ($basic_url, $pagenum) {
		global $page, $artperpage, $directarrow, $langmain, $parts;
		global $pagexianzai, $pagediyi, $pageshang, $pagexiangxi, $pagexia, $pagezuihou, $start, $end;
		$start=($page-1)*$artperpage;
		if (($start+$artperpage-1)<$pagenum) {$end=$start+$artperpage;}
		else $end=$pagenum;
		$lastpage=floor(($pagenum-1)/$artperpage)+1;
		if ($page<>1) $pageshang=" <a href=\"{$basic_url}&amp;page=".strval($page-1)."\">$directarrow[0]</a> "; 
		if ($page<>$lastpage) $pagexia= " <a href=\"{$basic_url}&amp;page=".strval($page+1)."\">$directarrow[1]</a>";
		$pagediyi= " <a href=\"{$basic_url}&amp;page=1\">$directarrow[2]</a>";
		$pagezuihou= " <a href=\"{$basic_url}&amp;page=$lastpage\">$directarrow[3]</a>";
		$firstindexpage=floor($page/$parts['pagevol'])*5+1;
		for ($i=$firstindexpage; $i<$firstindexpage+$parts['pagevol']; $i++) {
			if ($i<=$lastpage) {
				if ($i!=$page) $pagexiangxi.=multi_str_replace(array("{url}"=>"{$basic_url}&amp;page=$i", "{num}"=>$i), $parts['eachpage']);
				else $pagexiangxi.=str_replace("{num}", $i, $parts['currentpage']);
			}
			else break;
		}
		$pagexianzai="$langmain[0] ".$page."/".$lastpage;
	}

	function output_show ($basic_url, $allfiles) {
		global $isowner, $hassticky, $listway, $artperpage, $extractperpage, $langmain, $tem, $start, $end, $articlereplys, $pagexianzai, $pagediyi, $pageshang, $pagexiangxi, $pagexia, $pagezuihou, $is_mozilla, $fixmozillabug, $login_status, $guest_login, $another_url, $parts;
		//分页开始
		if ($listway==0) $artperpage=$extractperpage; //如果开启了非列表模式则每页显示的记录同首页
		$icount=count($allfiles);
		$this->make_pages ($basic_url, $icount);
		//分页结束
		if ($fixmozillabug==1 && $is_mozilla==0) { //仅在IE下显示快速跳转分页框
			$jumpinputtab="<input type=\"text\" name=\"jumptopage\" size=\"1\"  onKeyDown=\"javascript: if(window.event.keyCode == 13) window.location='{$basic_url}&amp;page='+this.value;\">";
		}
		if ($listway==1) { //列表方式工作
			for ($i=$start; $i<$end;$i++) {
				$alllist.=$this->list_list($allfiles[$i]);
			}
			$alllist.="<div align=\"right\">$pagexianzai $pagediyi $pageshang $pagexiangxi $pagexia $pagezuihou &nbsp; {$another_url} $jumpinputtab</div>"; //分页显示
			$this-> set_file("mainbody", "blog/template/$tem/list.htm");
			$this->set_var(array("articlenumbar"=>count($allfiles)." $langmain[30]", "alllist"=>$alllist, "newurl"=>$newurl,));
			$outshown=$this->parse("mainbodyout","mainbody");
		}
		else { //摘要方式工作
			for ($i=$start; $i<$end;$i++) {
				list ($articleid, $articlename, $articletime, $tracknum, $article, $thiscat, $thiscatimg, $articleviews, $seereply, $blogauthor)=$this->list_extract ($allfiles[$i]);
				if ($i==($end-1)) $pagesfinal="<br/><div align=\"right\">$pagexianzai $pagediyi $pageshang $pagexiangxi $pagexia $pagezuihou &nbsp; {$another_url}  $jumpinputtab</div>"; //在最后一篇记录后增加分页显示
				if ($i==0) {
					if ($hassticky==1) {
						$articlename="$articlename<strong> [$langmain[4]]</strong>";
						$quxiaozhiding=$langmain[5];
					}
					else $quxiaozhiding=$langmain[4];
				}
				else {
					$quxiaozhiding=$langmain[4];
				}
				if ($isowner==1) {
					$editurl=multi_str_replace(array("{url}"=>"mblog_edit.php?articleid=$articleid", "{chr}"=>$langmain[7]), $parts['editurl']);
					$delurl=multi_str_replace(array("{url}"=>"mblog_edit.php?articleid=$articleid&amp;action=del", "{chr}"=>$langmain[8]), $parts['delurl']);	$noreplyurl=multi_str_replace(array("{url}"=>"mblog_reply.php?articleid=$articleid&amp;action=delallreply", "{chr}"=>$langmain[9]), $parts['noreplyurl']);
					$stickinfo=multi_str_replace(array("{url}"=>"admin_cp.php?job=stick&amp;articleid=$articleid", "{chr}"=>$quxiaozhiding), $parts['stickinfo']);
				} else {
					$editurl="";
					$delurl="";
					$noreplyurl="";
					$stickinfo="";
				}
				if ($ishidden==1 || $ishidden==2) $reurl=$langmain[10];
				elseif ($ishidden==3 &&  ($login_status!=1 && $guest_login!=1)) $reurl=$langmain[10];
				else $reurl=multi_str_replace(array("{url}"=>"index.php?job=art&amp;articleid={$articleid}#add", "{chr}"=>$langmain[11], "{num}"=>$articlereplys), $parts['reurl']);
				$trackback=multi_str_replace(array("{url}"=>"index.php?job=seetb&amp;articleid=$articleid", "{chr}"=>$langmain[13], "{num}"=>$tracknum), $parts['trackback']);
				$this -> set_file("mainbody", "blog/template/$tem/main.htm");
				$this->set_var(array("articleid"=>$articleid, "articlereplys"=>$articlereplys, "seereply" =>$seereply, "articlename"=>$articlename, "articletime"=>$articletime, "article"=>$article, "userid"=>$userid, "editurl"=>$editurl, "delurl"=>$delurl, "noreplyurl"=>$noreplyurl, "newurl"=>$newurl, "reurl"=>$reurl, "thiscat"=>$thiscat,"previousandnext"=>$previousandnext,"stickinfo"=>$stickinfo,"thiscatimg"=>$thiscatimg, "trackback"=>$trackback,"pages"=>$pagesfinal,"articleviews"=>$articleviews, "blogauthor"=>$blogauthor,));
				$outshown.=$this->parse("mainbodyout","mainbody",true);
			}
		}
		return $outshown;
	}
}
