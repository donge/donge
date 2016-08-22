<?php
//日历部分由Bob Shen完全重写于2004-10-24-14:40
@error_reporting(E_ERROR | E_WARNING | E_PARSE);
if (inwork!=1) {die ("Access Denied.");} //防止被单独运行

$reversedtime=mktimezone(time());
if (empty($y) || empty($m) || !is_numeric($y) || !is_numeric($m) || !checkdate($m, 1, $y)) { //2005-1-28修补漏洞
	$y=date("Y",$reversedtime);
	$m=date("n",$reversedtime);
}

if($m<12) {
	$nm=$m+1;
	$ny=$y;
} else {
	$nm=1;
	$ny=$y+1;
}
if($m<10) $ssm="0".$m;
else $ssm=$m;
if($m>1) {
	$lm=$m-1;
	$ly=$y;
} else {
	$lm=12;
	$ly=$y-1;
}

$allrec=@readfromfile($clfile);
$pregstr='/'.$y.$ssm."[0-9][0-9]".'/';
preg_match_all ($pregstr, $allrec, $thismonths);
$allthismonths=$thismonths[0];

$widthoftable=$calendarwidth; //表格总宽 七的倍数

$today_y=date("Y",$reversedtime);
$today_m=date("n",$reversedtime);
$today_d=date("j",$reversedtime);

$lastdate_resource=array ("", 31,28,31,30,31,30,31,31,30,31,30,31); //月份天数

function monthly ($month,$year) {
	global $lastdate_resource;
	$firstdate=mktime(0, 0, 0, $month, 1, $year);
	$first_day=date("w", $firstdate);
	$lastdate=$lastdate_resource[$month];
	if ($year%4==0 && $month==2) $lastdate+=1; //闰月
	$last_day=date("w", mktime (0,0,0,$month,$lastdate,$year));
	$end_blank=6-$last_day; //需要补全的星期
	$padstart=$first_day+$lastdate; //头部补足后数组长度
	$padend=$padstart+$end_blank; //尾部补足后数组长度
	$all_date=range(1, $lastdate);
	$all_date=array_pad ($all_date, -$padstart, '&nbsp;'); //用空值填补1日之前的空格
	$all_date=array_pad ($all_date, $padend, '&nbsp;'); //用空值填补最后日之后的空格
	return $all_date;
}

function makecalendar ($month, $year) {
	global $widthoftable, $m, $y, $nm, $ny, $lm, $ly, $directarrow, $ssm, $langmonthshort, $langyearshort, $langweekshort; //引入色彩和宽度变量
	global $today_y, $today_m, $today_d; //引入当天
	$all_date=monthly($month, $year);
	$weekline=count($all_date)/7; //周数
	$monthshow="<a href=\"index.php?m=$lm&amp;y=$ly\">$directarrow[0]</a>$langmonthshort<a href=\"index.php?m=$nm&amp;y=$ny\">$directarrow[1]</a>";
	$yearshow="<a href=\"index.php?m=$m&amp;y=".($y-1)."\">$directarrow[0]</a>$langyearshort<a href=\"index.php?m=".$m."&amp;y=".($y+1)."\">$directarrow[1]</a>";
	$everywidth=floor($widthoftable/7); //周数
	$width1=$everywidth*2;
	$width2=$everywidth*3;
	$chart="<table width='$widthoftable' cellpadding='0' cellspacing='0' align='center'><tr><td width='$width1' align='left'>$monthshow</td><td align='center' width='$width2'>$y - $ssm</td><td align='right' width='$width1'>$yearshow</td></tr></table>";
	$chart.="<table width='$widthoftable' cellpadding='0' cellspacing='0' align='center' class='calendarborder'><tr><td>"; //外围表格
	$chart.="<table width='100%' cellpadding='0' cellspacing='1'><tr align='center' class='calendartitle'><td>$langweekshort[0]</td><td>$langweekshort[1]</td><td>$langweekshort[2]</td><td>$langweekshort[3]</td><td>$langweekshort[4]</td><td>$langweekshort[5]</td><td>$langweekshort[6]</td></tr>"; //第一行
	for ($i=0; $i<$weekline; $i++) {
		$chart.="<tr class='calendar' align='center'>";
		for ($j=0; $j<7; $j++) {
			$currentdate=$all_date[$i*7+$j];
			if ($currentdate==$today_d && $month==$today_m && $year==$today_y) $chart.="<td class='riqi'>$currentdate</td>"; //当天
			else $chart.="<td>$currentdate</td>";	
		}
		$chart.="</tr>";
	}
	$chart.="</td></tr></table></td></tr></table>"; //外围表格结束
	return $chart;
}

$calendar=makecalendar($m, $y);

for ($i=0; $i<sizeof($allthismonths); $i++) {
	$match=$allthismonths[$i]%100;
	$calendar=str_replace(">$match</td>", "><a href=\"index.php?job=showday&amp;tar={$allthismonths[$i]}\"><u>{$match}</u></a></td>", $calendar);
}

?>

