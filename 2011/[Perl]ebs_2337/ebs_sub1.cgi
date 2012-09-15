use AnyDBM_File;
use Fcntl;
require 'config.cgi';
$VER=' 1.24X';
$MAIN_SCRIPT = 'ebs.cgi';
$HASH_DATA = '_hash.data';
# $STYLE_B1='style="font-family: Tahoma, Helvetica; font-size: 9pt; text-decoration: none; border: 1px #ffffff solid; padding-top: 0px; height: 18px"';
$STYLE_B1='style="BORDER-RIGHT: #fedede 1px outset; BORDER-TOP: #fedede 1px outset; FONT-SIZE: 12px; BACKGROUND: #aa5b7d; BORDER-LEFT: #fedede 1px outset; CURSOR: hand; COLOR: #ffdede; BORDER-BOTTOM: #fedede 1px outset; HEIGHT: 16px"';
# $STYLE_B2='onMouseOver=\"style.color='#000000';style.background='#adff2f';\" onMouseOut=\"this.style.color='#adff2f';style.background='#00550c';\"';
$STYLE_L = "style=\"height:21px; color:#00ff00; font-size:12px; background:#000000; border:1 solid white; border-style:solid;\"";
$DATE=time;
$NONE_NATIONALITY="流浪者";


$DBM_P="$LOG_FOLDER/$DB_ID1";
$DBM_C="$LOG_FOLDER/$DB_ID2";
$DBM_H="$LOG_FOLDER/$DB_ID3";
$DBM_L="$LOG_FOLDER/$DB_ID4";
@TIME = localtime(time);
#foreach (@MAINTE_TIME){if ($TIME[2] == $_) {&ERROR('规限时间中');exit;}}

#if ($ENV{'HTTP_USER_AGENT'} !~ m/MSIE/i){&ERROR('只有微软IE专用');exit;}

if ($ENV{'REQUEST_METHOD'} eq "POST") {
	read(STDIN, $QUERY_DATA, $ENV{'CONTENT_LENGTH'});@pairs = split(/&/,$QUERY_DATA);
	foreach (@pairs) {
		($key, $value) = split(/=/, $_);
		$value =~ tr/+/ /;$value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
		$value =~ s/</&lt;/g;$value =~ s/>/&gt;/g;$value =~ s/\n//g;$value =~ s/\s//g;
		$value =~ s/\,//g;$value =~ s/=/3/g;$value =~ s/&/1/g;
		#&jcode'convert(*value,'sjis');
		$FORM{$key} = $value;
	}
	$FORM{'cmd'} && ($SUB="$FORM{'cmd'}");
}elsif($ENV{'QUERY_STRING'}){$SUB="$ENV{'QUERY_STRING'}";}

sub HEADER {
	print "Content-type: text/html\n\n";
	print << "	-----END-----";
	<html><head>
<meta http-equiv="Content-Language" content="zh-tw">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>$THIS_Title</title></head>
<LINK href=miuler.css type=text/css rel=stylesheet>
<script>
var list = new Array;
list[0] = new Array('bg1.jpg');

var i=Math.floor(Math.random() * list.length);
document.write("<body background=$IMG_FOLDER4/" + list[i][0] + ">");
</script>
<script>
<!--
function winopen(){
var targeturl="$THIS_DIR"
newwin=window.open("","","scrollbars")
if (document.all){
newwin.moveTo(0,0)
newwin.resizeTo(screen.width,screen.height)
}
newwin.location=targeturl
}
//-->
</script>
<body bgproperties="fixed" text=#FFFFFF topmargin=0 oncontextmenu="return false;">
<style type="text/css">
<!--
#master {position:absolute; width: 200px; top: 10px; left: -145px; z-index:2; visibility:visible;}
#menu	{position:absolute; width: 18px; top: 0px; left: 145px; z-index:5; visibility:visible;}
#top	{position:absolute; width: 145px; top: 0px; left: 0px; z-index:5; visibility:visible;}
#screen {position:absolute; width: 145px; top: 6px; left: 0px; z-index:5; visibility:visible;}
#screenlinks	{position:absolute; width: 145px; top: 6px; left: 0px; z-index:5; visibility:visible;}
-->
</style>
<script language = "javascript">
<!--
var ie = document.all ? 1 : 0
var ns = document.layers ? 1 : 0
var master = new Object("element")
master.curLeft = -145;	master.curTop = 10;
master.gapLeft = 0;		master.gapTop = 0;
master.timer = null;
function moveAlong(layerName, paceLeft, paceTop, fromLeft, fromTop){
clearTimeout(eval(layerName).timer)
if(eval(layerName).curLeft != fromLeft){
if((Math.max(eval(layerName).curLeft, fromLeft) - Math.min(eval(layerName).curLeft, fromLeft)) < paceLeft){eval(layerName).curLeft = fromLeft}
else if(eval(layerName).curLeft < fromLeft){eval(layerName).curLeft = eval(layerName).curLeft + paceLeft}
else if(eval(layerName).curLeft > fromLeft){eval(layerName).curLeft = eval(layerName).curLeft - paceLeft}
if(ie){document.all[layerName].style.left = eval(layerName).curLeft}
if(ns){document[layerName].left = eval(layerName).curLeft}
}
if(eval(layerName).curTop != fromTop){
if((Math.max(eval(layerName).curTop, fromTop) - Math.min(eval(layerName).curTop, fromTop)) < paceTop){eval(layerName).curTop = fromTop}
else if(eval(layerName).curTop < fromTop){eval(layerName).curTop = eval(layerName).curTop + paceTop}
else if(eval(layerName).curTop > fromTop){eval(layerName).curTop = eval(layerName).curTop - paceTop}
if(ie){document.all[layerName].style.top = eval(layerName).curTop}
if(ns){document[layerName].top = eval(layerName).curTop}
}
eval(layerName).timer=setTimeout('moveAlong("'+layerName+'",'+paceLeft+','+paceTop+','+fromLeft+','+fromTop+')',30)
}
function setPace(layerName, fromLeft, fromTop, motionSpeed){
eval(layerName).gapLeft = (Math.max(eval(layerName).curLeft, fromLeft) - Math.min(eval(layerName).curLeft, fromLeft))/motionSpeed
eval(layerName).gapTop = (Math.max(eval(layerName).curTop, fromTop) - Math.min(eval(layerName).curTop, fromTop))/motionSpeed
moveAlong(layerName, eval(layerName).gapLeft, eval(layerName).gapTop, fromLeft, fromTop)
}
var expandState = 0
function expand(){
if(expandState == 0){setPace("master", 0, 10, 10); if(ie){document.menutop.src = "$IMG_FOLDER4/menu.gif"}; expandState = 1;}
else{setPace("master", -145, 10, 10); if(ie){document.menutop.src = "$IMG_FOLDER4/menu.gif"}; expandState = 0;}
}
//-->
</script>
	-----END-----
}

sub HEADER2 {
	print "Content-type: text/html\n\n";
	print << "	-----END-----";
	<html><head>
<meta http-equiv="Content-Language" content="zh-tw">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<title>$THIS_Title</title></head>
<LINK href=miuler.css type=text/css rel=stylesheet>
<body text=#FFFFFF bgcolor=#000000 topmargin=0 oncontextmenu="return false;">
	-----END-----
}

sub FOOTER	{
#以下记号关系到版权问题，请不要改变！
	print << "	-----END-----";
<br>
<center>Special Thanks :MASIMARO&ltb</a>版本$VER  官方网站:<a href="http://www.ngcoms.net/" target=_blank>NET GAME.</a>中文化改造:<a href=\http://www.verytown.com/\ target=_blank>高达在线</a>

	-----END-----
	print "<br>站長 <a href=$THIS_DIR target=_blank>$OWNER_NAME </a></center>" if $OWNER_NAME;
       print "<center>";

	print "</span>";
}

sub DBM_INPORT {
	$DBM = "DBM_$_[0]";
	$HASH=$_[0];
	tie %NOTE,AnyDBM_File,"$$DBM",O_RDONLY,0666;
		%$HASH=%NOTE;
	untie %NOTE;
}
sub DBM_CONVERT {
	$DBM = "DBM_$_[0]";
	$DBM_TYPE1="$_[0]L_VALUES";
	$DBM_KEY1="$_[1]";

	($DBM_TYPE2="$_[2]_VALUES",$DBM_KEY2="$_[3]") if $_[2];

	tie %NOTE,AnyDBM_File,"$$DBM",O_RDONLY,0666;
		@$DBM_TYPE1 = split(/\s/,$NOTE{"$DBM_KEY1"});
		@$DBM_TYPE2 = split(/\s/,$NOTE{"$DBM_KEY2"}) if $_[2];
	untie %NOTE;
}

sub REPAIR {
	my $DatHp=$Result=0;
	my $REPType = "$_[0]_VALUES";
	my $money=int $$REPType[0]/10;
	my ($DatHp,$Result) = split(/\!/,$$REPType[1]);
	$$REPType[15]+=int(($DATE-$DatHp)*$HP_REPAIR);
	if($$REPType[15] >= $$REPType[16]){
		$$REPType[15]=$$REPType[16];$$REPType[25]=0 if $$REPType[25] == 1;
	}
	$$REPType[17]+=int(($DATE-$DatHp)*$EN_REPAIR);
	if($$REPType[17] >= $$REPType[18]){$$REPType[17]=$$REPType[18];}
$$REPType[8]+=int(($DATE-$DatHp)*$money)*$GET_RANK;$$REPType[8]=$MAX_MONEY if $$REPType[8]>$MAX_MONEY;
}

sub RANK{
my $r=int $_[0]/10;
my $K_C=('#808080','#8000ff','#8000ff','#a000e5','#00518b','#00518b','#0470a5','#0470a5','#559494','#559494','#80b280','#80b280','#80b280','#2a980b','#2a980b','#2a980b','#c0c54d','#c0c54d','#c0c54d','#c0c54d','#d27880','#d27880')[$r];

my $K_N=('平民','新兵','士兵','二等兵','一等兵','上等兵','特等兵','兵長','二等准尉','一等准尉','少尉','中尉','大尉','少校','中校','上校','准将','少将','中将','上将','一級上将','元帅')[$r];

	my $kaikyu="<font color=$K_C>$K_N</font>";
	if ($_[2] == -3){$kaikyu='';}
	if ($_[2] == 1){$kaikyu='<font color=#f7e957>皇帝</font>';}
	if ($_[2] == -1){$kaikyu.='<font color=#f7e957>（司令）</font>';}
	if ($_[1] eq '流浪者' || !$_[1]){$kaikyu='';}
	return $kaikyu;
}
sub STATUS_CONVERT{
	$_[1] eq 's' && do {
		my $c=int $_[0]/1;
		my $C_C=(	'#5000CC','#8000ff','#8000ff','#8000ff','#8000ff','#8000ff','#a000e5','#a000e5','#a000e5','#a000e5','#a000e5','#bf00cc','#bf00cc','#bf00cc','#bf00cc','#bf00cc','#df00a6','#ff0080','#ff0080','#ff0080','#ff0080','#ff0080','#ff0080','#f7e957','#f7e957','#f7e957','#f7e957','#f7e957',
					'#f7e957','#f7e957','#f7e957','#f7e957','#f7e957','#f7e957','#f7e957','#f7e957','#f7e957','#f7e957','#ff0080','#ff0080','#ff0080','#ff0080','#ff0080','#ff0080','#ff0080','#00ff00','#00ff00','#00ff00','#00ff00','#00ff00','#00ff00')[$c];
		my $C_R=('0','2','4','6','8','10','12','14','16','18','20','22','24','26','28','30','32','34','36','38','40','42','44','46','48','50','52','54','56','58','60','62','64','66','68','70','72','74','76','78','80','82','84','86','88','90','92','94','96','98','100')[$c];
	return "<b style=\"color:$C_C;\">$C_R</b>";
	last STATUS_CONVERT;
	};
	$_[1] eq 't' && do {
		my $c=$_[0];
		my $C_C=('#ffffff','#ff0080','#f7e957','#bf00cc','#8000ff')[$c];
		my $C_R=('普通','攻击','防御','敏捷','命中')[$c];
	return "<font face=\"Verdana\" color=$C_C>$C_R</font>";
	last STATUS_CONVERT;
	};
	$_[1] eq 'c' && do {
		my $c=$_[0];
		my $C_C=('#e20a16','#0470a5','#ffffff','#eaaaaa','#a4aaf9','#8025da','#dc143c','#332211','#00ff00')[$c];
		my $C_R=('热血','懦弱','普通','激情','冷静','冷酷','觉醒','强化人','New Type')[$c];
	return "<font face=\"Verdana\" color=$C_C>$C_R</font>";
	last STATUS_CONVERT;
	};
	$_[1] eq 'j' && do {
		my $c=$_[0]/100;$c=10 if $c > 10;
		my $C_C=(	'#5000CC','#8000ff','#a000e5','#bf00cc','#df00a6','#ff0080','#f7e957',
					'#f7e957','#f7e957','#ff0080','#ff0080')[$c];
		my $C_R=('F','E','D','C','B','A','S','SS','SSS','ACE','NT')[$c];
	return "<font face=\"Verdana\" color=$C_C>$C_R</font>";
	last STATUS_CONVERT;
	};

}
sub DATE_DECORD	{
	my @lt = localtime($_[0]);
	$lt[4]++;
	$lt[2] = sprintf("%02d", $lt[2]);
	$lt[1] = sprintf("%02d", $lt[1]);
	return "$lt[4]月$lt[3]日 ($lt[2]:$lt[1])";
}
sub ERROR		{
	&HEADER;
	print "<script language=\"JavaScript\">\nalert('$_[0]\\n$_[1]')\;\n\n</script>";
#	&FOOTER;
	exit;
}
sub LOCK 	{open (LOCK, "eb.lock");flock(LOCK,2);}
sub UNLOCK  {flock(LOCK,8);close(LOCK);}

sub JScfm {
	$fct=$_[0];
	$msg=$_[1];
	print << "	END_OF_HTML";
	<script language="JavaScript">
	<!--
	function $fct (){
		if (confirm('$msg') == true){return true;}else{return false}
	}
	//-->
	</script>
	END_OF_HTML
}
sub LOGIN_CHECK{
my($char_name, $timer1, $timer2, @char_value, $login_flg, @log_data, %L_buff);
$char_name = $_[0];

$timer1 = 5; #分指定（战斗时间已经过分）
$timer2 = 10; #分指定（时间经过分）

if(!defined %P){ &DBM_INPORT(P); }

@char_value = split(/\s/,$P{"$char_name"});
if($char_value[26] >= time - $timer1 * 60){ $login_flg = 1; }
else{ $login_flg = 0; }

if($login_flg == 0){
if(!defined %L){ &DBM_INPORT(L); }
%L_buff = %L;
foreach $login_time (sort {$b <=> $a} keys %L_buff){

if($login_time < time - $timer2 * 60){ last; }
@log_data=split(/!/, $L_buff{"$login_time"});
if($log_data[0] eq $char_name){ $login_flg = 1;}
}
}
return $login_flg;
}
1;
