#!/usr/bin/perl
require 'ebs_sub1.cgi';
&ERROR('请不要直接从此地址进入','安全起见请从您访问的网页进入') if $ENV{'HTTP_REFERER'} !~ m/^$THIS_DIR/ && $DIRECT_LINK && $SUB ne 'MY_LIST' && $SUB ne 'C_LIST';

if ($BLACKCHECK && $SUB ne 'MY_LIST' && $SUB ne 'C_LIST') {
$addr = $ENV{'REMOTE_ADDR'};
$host = $ENV{'REMOTE_HOST'};
if (($host eq $addr) || ($host eq '')) {$host = gethostbyaddr(pack('C4',split(/\./,$addr)),2) || $addr;}
foreach (@DENYHOST) {
$_ =~ s#\~#.*#g;
if ($host =~ m#$_#i || $addr =~ m#$_#i) {$BLACKFLAG=1;}
}
if ($BLACKFLAG) {&ERROR('出入被禁止','因为你违反善良风俗、管理人拒绝让你进入。');}
}
!$SUB && ($SUB='TOP');
&$SUB;

sub LOGIN		{require 'ebs_sub2.cgi';&LOGIN2;}
sub MY_LIST		{require 'ebs_sub2.cgi';&MY_LIST2;}
sub LOG0		{require 'ebs_sub2.cgi';&LOG01;}
sub LOGO		{require 'ebs_sub2.cgi';&LOGO2;}
sub C_LIST		{require 'ebs_sub2.cgi';&C_LIST2;}
sub WEAPON		{require 'ebs_sub2.cgi';&WEAPON_LIST;}
sub ICON		{require 'ebs_sub2.cgi';&ICON_LIST;}
sub ICON2		{require 'ebs_sub2.cgi';&FACE_LIST;}

sub TOP 		{require 'ebs_sub3.cgi';&FRAME;}
sub MAIN_FRAME {require "./$LOG_FOLDER/_ex.data";require "./$LOG_FOLDER/$HASH_DATA";require 'ebs_sub3.cgi';&STATUS;} #-- 1
sub MAIN_FRAME 	{require "$LOG_FOLDER/$HASH_DATA";require 'ebs_sub3.cgi';&STATUS;}
sub LIST		{require 'ebs_sub3.cgi';&MY_LIST;}
sub CO_LIST		{require 'ebs_sub3.cgi';&CNTRY_LIST;}
sub CUSTOM {require "./$LOG_FOLDER/_ex.data";require "./$LOG_FOLDER/$HASH_DATA";require 'ebs_sub3.cgi';&CUSTOMIZE;&STATUS;}#-- 2
sub CUSTOM		{require "$LOG_FOLDER/$HASH_DATA";require 'ebs_sub3.cgi';&CUSTOMIZE;&STATUS;}

sub BATTLE_1	{require 'ebs_sub4.cgi';&BATTLE1;}
sub BATTLE_2	{require 'ebs_sub4.cgi';&BATTLE2;}

sub EQUIPMENT	{require 'ebs_sub5.cgi';&EQUIP;}
sub EX {require 'ebs_sub5.cgi';&WEX;}#-- 3
sub BOUGU {require 'ebs_sub5.cgi';&BOUGU2;}
sub CUSTOMING	{require 'ebs_sub5.cgi';&CUSTOMING2;}
sub HIS			{require 'ebs_sub5.cgi';&HISTORY;}
sub COM			{require 'ebs_sub5.cgi';&COMMENT;}
sub SPC			{require 'ebs_sub5.cgi';&SPECIAL;}
sub MISSION		{require 'ebs_sub5.cgi';&MISSION2;}
sub BOSS		{require 'ebs_sub5.cgi';&BOSS2;}
sub MAKE_C		{require 'ebs_sub5.cgi';&MAKE_C2;}
sub MAKE_T		{require 'ebs_sub5.cgi';&MAKE_T2;}
sub DEL_U		{require 'ebs_sub5.cgi';&DEL_U2;}
sub WAIRO		{require 'ebs_sub5.cgi';&WAIRO;}
sub DEL_UNIT {require 'ebs_sub5.cgi';&DEL_UNIT;}

sub KAKUNIN		{require 'ebs_sub6.cgi';&KAKUNIN2;}
sub RESIST		{require 'ebs_sub6.cgi';&RESIST2;}
#sub DELETE		{require 'ebs_sub6.cgi';&DELETE3;}
sub EXPORT		{require 'ebs_sub6.cgi';&EXPORT2;}
#sub INPORT5		{require 'ebs_sub6.cgi';&INPORT3;}
sub DECODE		{require 'ebs_sub6.cgi';&INPORT4;}
sub ENTRY		{require 'ebs_sub6.cgi';&ENTRY2;}
#sub DELETE2		{require 'ebs_sub6.cgi';&DELETE4;}
#sub EBINPORTCOOL		{require 'ebs_sub6.cgi';&INPORT2;}

sub MAINTE		{require 'ebs_sub7.cgi';&MAINTENANCE;}
sub MAINTE2		{require 'ebs_sub7.cgi';&MAINTENANCE2;}
sub LGIN_RIREKI	{require 'ebs_sub7.cgi';&LGIN_RIREKI2;}
sub XPL_LIST	{require 'ebs_sub7.cgi';&XPL_LIST2;}
sub XCO_LIST	{require 'ebs_sub7.cgi';&XCO_LIST2;}
sub HISTORY_EDIT{require 'ebs_sub7.cgi';&HISTORY_EDIT2;}
sub HISTORY_EDIT2{require 'ebs_sub7.cgi';&HISTORY_EDIT3;&HISTORY_EDIT2;}
sub SYUSEI		{require 'ebs_sub7.cgi';&SYUSEI2;&XPL_LIST2;}
sub CNSYUSEI	{require 'ebs_sub7.cgi';&CNSYUSEI2;&XCO_LIST2;}
sub PL_DEL		{require 'ebs_sub7.cgi';&PL_DEL2;}
sub PL_DEL2		{require 'ebs_sub7.cgi';&PL_DEL3;&MAINTENANCE2;}
sub CO_DEL		{require 'ebs_sub7.cgi';&CO_DEL2;}
sub CO_DEL2		{require 'ebs_sub7.cgi';&CO_DEL3;&MAINTENANCE2;}
sub MAKE_K {require 'ebs_sub5.cgi';&MAKE_K2;}
sub FACE {require 'ebs_sub5.cgi';&FACE_C;}
sub BANK_KK {require 'ebs_sub5.cgi';&BANK_kk;}
sub MAIN_FRAME {require "./$LOG_FOLDER/$HASH_DATA";require "./$LOG_FOLDER/_bougu.data";require 'ebs_sub3.cgi';&STATUS;}
sub CUSTOM {require "./$LOG_FOLDER/$HASH_DATA";require "./$LOG_FOLDER/_bougu.data";require 'ebs_sub3.cgi';&CUSTOMIZE;&STATUS;}

