#!perl.exe
#!/.../perl
#######################################################################
#     	          好易环境变量探针 2.80				      #
#hiecho.cgi  							      #
#Version: 2.80
## 最近更新： 9/23/99                                                       #
## 最近更新： 1/20/99
##  Email为:  hoyi@email.com           
## 全易因特网软件    http://www.or.com.cn/
## 好易CGI工厂       http://hoyi.yeah.net/				      #
## 脚本说明: 本脚本会以中文方式显示所有环境变量。 		      #
## 使用方法：本脚本一定要放在充许CGI执行的目录中，而且一定要将它的属性 #
## 设置成可以执行(755)。						      #
## 如：chmod 755							      #
## 以使之可以在WEB服务器上执行。					      #
## 示例：perl.webprovider.com/hiecho.cgi			      # 
##      linux.cqi.com.cn/~hoyi/hiecho.cgi         		      #
#######################################################################
##    好易环境变量探针 2.80 					##
##    版权属于(1998)全易因特网软件、好易CGI工厂	     
#######################################################################
##                          本程序为免费软件                       
##                         本程序作者为: 华炼                      
##		         作者Email为:  hoyi@email.com  
##                   好易CGI工厂  http://hoyi.yeah.net	    
##                   全易因特网软件  http://www.or.com.cn/       
##                 全面强劲的功能 易于使用的特性 完全中文界面  
##                        尽在全易因特网软件
##			    提供定制CGI服务
##                你可以任意修改本程序, 但要求你保留以上信息!
#######################################################################
#本工作室保留对本软体之更改与订正之权利.
#任何人包括已取得授权之使用者有执行本软体所需之设定或美化外观所需之更改
#以外,可以任意修改.复制.传播本软体之任一部份. 如有违反著作权法之规定,本
#工作室自动保留追诉之权利.
#本段著作权申明不得删除, 包括已取得使用授权者.
#######################################################################
##版本历史
##2.80 目前能正确设置目录。
##2.70 可以检测一些系统相关信息，如邮件地址及PERL位置/操作系统类型
##2.50 18/9/98 加入对windows类如iis2.0~4.0的环境测试转换。
##	          识别IIS环境变量：SERVER_PORT_SECURE （译法可能不确切）
##1.80 11/9/98  将变量变换成中文名字。
#首先，打印出HTTP头信息
print "Content-type: text/html\n\n";

@env_var_hoyi = keys (%ENV);

#检查邮件功能打开
$check_mailprog=1;
#测试时用的收信地址
$rto='hoyi@371.net';
$rfrom=$rto;

#这里是版本代号。

#($hiecho'version = '$Revision: 2.8 $') =~ s/[^.\d]//g;
#$version= $hiecho'version;
$version="2.80";
$softname="好易环境变量探针";

$envtext_head= <<HOYIEOF;
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<TITLE>$softname   $version</TITLE>
</HEAD>
<BODY bgcolor=oldlace>
<p align="center"><font face="楷体_GB2312" SIZE="5" COLOR="#990030">
<b>$softname<font face=arial>$version</font></b></font> </font>
<strong><a href="http://www.or.com.cn"><font face="Arial" color="#990030">www.or.com.cn</font></a>
&nbsp;&nbsp;<a href="http://hoyi.yeah.net"><font face="Arial" color="#990030">hoyi.yeah.net</font></a></strong></small>
</center><p>
HOYIEOF

&sayecho;
sub sayecho
{
	$tempfilename=__FILE__;
	if ($tempfilename=~/\\/) { $tempfilename=~ s/\\/\//g;}
	if ($tempfilename)
           {
	$dir=substr($tempfilename,0,rindex($tempfilename,"/"));
	}
	else
	 {
	$dir=substr($ENV{'PATH_TRANSLATED'},0,rindex($ENV{'PATH_TRANSLATED'},"\\"));
	$dir=~ s/\\/\//g;
	}
$fullurl= "http://$ENV{'SERVER_NAME'}$ENV{'SCRIPT_NAME'}";
$url=substr($fullurl,0,rindex($fullurl,"/"));
$temptimes=times;
$starttime=localtime($^T);
#$tempgetlogin=getlogin;

if ($^=~/unix/i || $check_mailprog) {

$mail_prog='/usr/lib/sendmail';
if (!(-e $mail_prog)) {$mail_prog='/bin/sendmail';} 
if (!(-e $mail_prog)) {$mail_prog='/usr/sbin/sendmail';};
if (!(-e $mail_prog)) {$mail_prog='perlmail';}; 
if (!(-e $mail_prog)) {$mail_prog="邮件程序不存在，请用其他方法发送程序！";};

$mailprog_text=<<EOFHOYI
<tr>
<td width="160" bgcolor="#CACAFF"><font color="#408080"><strong>邮件系统路径</strong></font></td>
<td width="360" bgcolor="#CACAFF">$mail_prog</td>
</tr>
EOFHOYI

}

$envtext_tab.= <<EOFXX;
<table border="0" width="520">
<tr>
<td width="160" bgcolor="#CACAFF"><font color="#408080"><strong><font size="3">当前目录绝对位置</font>
</strong></font></td>
<td width="360" bgcolor="#CACAFF"><font color="408080" size="3"><strong><u>$dir</u></strong></font></td>
</tr>
<tr>
<td width="160" bgcolor="#CACAFF"><font color="#408080"><strong><font size="3">当前目录的URL地址</font>
<font size="4"> </font></strong></font></td>
<td width="360" bgcolor="#CACAFF"><font color="408080" size="3"><strong><a href="$url">$url</a></strong></font></td>
</tr>
<tr>
<td width="160" bgcolor="#CACAFF"><font color="#408080"><strong><font size="3">当前程序的URL地址</font>
</strong></font></td>
<td width="360" bgcolor="#CACAFF"><font color="408080" size="3"><strong><a href="$fullurl">$fullurl</a></strong></font></td>
</tr>
<tr>
<td width="160" bgcolor="#CACAFF"><font color="#408080"><strong>Perl 版本 </strong></font></td> <td width="360" bgcolor="#CACAFF">$]</td>
</tr>
<tr>
<td width="160" bgcolor="#CACAFF"><font color="#408080"><strong>当前操作系统 </strong></font></td>
<td width="360" bgcolor="#CACAFF">$^O</td>
</tr>
<tr>
<td width="160" bgcolor="#CACAFF"><font color="#408080"><strong>程序开始运行时间 </strong></font></td>
<td width="360" bgcolor="#CACAFF">$starttime</td>
</tr>
<tr>
<td width="160" bgcolor="#CACAFF"><font color="#408080"><strong>运行消耗时间 </strong></font></td>
<td width="360" bgcolor="#CACAFF">$temptimes\t毫秒</td>
</tr>
$mailprog_text
<tr>
<td width="160" bgcolor="#CACAFF"><font color="#408080"><strong>北京时间</strong></font></td>
<td width="360" bgcolor="#CACAFF"><a href="http://hoyi.yeah.net" target="_blank"><img
SRC="http://www.ruian.com/cgi-bin/FreeCount.cgi?df=site188.dat&amp;display=date|timezone=GMT+0800|dd=D|ft=1|tr=T|trgb=000000|srgb=00ff00|prgb=993300"
alt="好易CGI工厂" border="0" width="70" height="13"><img
SRC="http://www.ruian.com/cgi-bin/FreeCount.cgi?df=site188.dat&amp;display=clock|timezone=GMT+0800|dd=D|ft=1|tr=T|trgb=000000|srgb=00ff00|prgb=993300"
alt="好易CGI工厂" border="0" width="57" height="13"></a></td>
</tr>
</TABLE>

EOFXX

foreach $environment_variable (sort @env_var_hoyi)
    {
	$cenv_var_hoyi=$environment_variable;
	$cenv_var_hoyi=~s/_INFO/信息/g;
	$cenv_var_hoyi=~s/_TRANSLATED/转换设置/g;
	$cenv_var_hoyi=~s/CONTENT_LENGTH/输出文本长度/g;
	$cenv_var_hoyi=~s/COMPUTERNAME/服务器计算机名称/g;
	$cenv_var_hoyi=~s/DOCUMENT_ROOT/服务器文档根目录/g;
	$cenv_var_hoyi=~s/DOCUMENT_/脚本文件/g;
	$cenv_var_hoyi=~s/GATEWAY_INTERFACE/(CGI通用网关接口)版本/g;
	$cenv_var_hoyi=~s/HTTP_ACCEPT_ENCODING/客户机能接受的编码形式/g;
	$cenv_var_hoyi=~s/HTTP_ACCEPT_CHARSET/客户机能接受的语言代码设置/g;
	$cenv_var_hoyi=~s/HTTP_ACCEPT_LANGUAGE/客户机能接受的语言类型/g;
	$cenv_var_hoyi=~s/HTTP_ACCEPT/客户机可以接受的文件类型/g;
	$cenv_var_hoyi=~s/HTTP_CONNECTION/Http当前连接状态/g;
	$cenv_var_hoyi=~s/HTTP_HOST/服务器主机域名/g;
	$cenv_var_hoyi=~s/HTTP_REFERER/调用当前脚本的URL地址/g;
	$cenv_var_hoyi=~s/HTTP_USER_AGENT/用户的系统配置信息/g;
	$cenv_var_hoyi=~s/NUMBER_OF_PROCESSORS/服务器使用CPU数量/g;
	$cenv_var_hoyi=~s/PATH/路径/g;
	$cenv_var_hoyi=~s/QUERY_STRING/请求字符串/g;
	$cenv_var_hoyi=~s/REMOTE_ADDR/客户机的IP地址/g;
	$cenv_var_hoyi=~s/REMOTE_HOST/客户机的名称/g;
	$cenv_var_hoyi=~s/REMOTE_PORT/客户机的请求端口/g;
	$cenv_var_hoyi=~s/REQUEST_METHOD/客户机的请求方法/g;
	$cenv_var_hoyi=~s/REQUEST_URI/客户机的请求URL信息/g;
	$cenv_var_hoyi=~s/SCRIPT_FILENAME/脚本文件的绝对路径名/g;
	$cenv_var_hoyi=~s/SCRIPT_NAME/脚本文件调用URL地址/g;
	$cenv_var_hoyi=~s/SERVER_ADMIN/服务器网络管理员/g;
	$cenv_var_hoyi=~s/SERVER_NAME/服务器域名/g;
	$cenv_var_hoyi=~s/SERVER_PORT_SECURE/接受Http请求的服务器安全、加密端口/g;
	$cenv_var_hoyi=~s/SERVER_PORT/接受Http请求的服务器端口/g;
	$cenv_var_hoyi=~s/SERVER_PROTOCOL/服务器访问协议/g;
	$cenv_var_hoyi=~s/SERVER_SOFTWARE/服务器软件的名称及版本/g;
	$cenv_var_hoyi=~s/REMOTE_USER/用户名字信息/g;
	$cenv_var_hoyi=~s/URI/URL地址信息/g;
	$cenv_var_hoyi=~s/NAME/名字信息/g;
	$cenv_var_hoyi=~s/SCRIPT_/脚本文件/g;
	$cenv_var_hoyi=~s/OS/操作系统/g;
	$cenv_var_hoyi=~s/PROCESSOR_ARCHITECTURE/CPU类型/g;
	$cenv_var_hoyi=~s/PROCESSOR_IDENTIFIER/CPU编号标识/g;
	$cenv_var_hoyi=~s/PROCESSOR_LEVEL/CPU生产级别/g;
	$cenv_var_hoyi=~s/PROCESSOR_REVISION/CPU生产版本/g;
	$cenv_var_hoyi=~s/WINDIR/Windows目录/g;
 	$cenv_var_hoyi=~s/SYSTEMROOT/系统启动目录/g;
	$cenv_var_hoyi=~s/SYSTEMDRIVE/系统硬盘/g;
	$cenv_var_hoyi=~s/COMSPEC/环境变量解释器/g;
	$cenv_var_hoyi=~s/USERPROFILE/用户方案文件/g;
	$cenv_var_hoyi=~s/LOCAL_ADDR/主机IP地址/g;
	$cenv_var_hoyi=~s/HTTPS/安全服务器使用状态/g;

$spaceit=" " x (35-length($cenv_var_hoyi));
$cenv_var_hoyi=$cenv_var_hoyi.$spaceit;
$envtext_var.= "</font><font color=408080 face=arial><span style=\"font-size: 9pt\">$cenv_var_hoyi<strong>";
$envtext_var.= "<br><font color=408080><u>\"\$ENV{\'$environment_variable\'}\"</strong></font></u>";
$envtext_var.= "<font color=990033><strong><u> = $ENV{$environment_variable}</u>;</strong></font></span><BR>\n";

    }
$envtext2.= "\n<p align=center><a href=\"http://view.gznet.com/cgi-bin/rl_views.cgi?UID=10003631\" target=\"stat\"><img src=\"http://refer.gznet.com/cgi-bin/rl_refer2.cgi?UID=10003631&amp;refer=http://www.or.com.cn/home.html#noscript\" border=\"0\" alt=\"访问站点分析\"></a>";
$envtext2.= "<a href=\"http://www.or.com.cn/\" target=\"_blank\"><img src=\"http://online.mirabilis.com/scripts/online.dll?icq=18634452&amp;img=5\" width=\"18\" height=\"18\" ALT=\"hoYI在线吗？\" border=\"0\"></a>";
$envtext2.= "\n<script>";
$envtext2.= "\ndocument.write(\"<a href=http://best.netease.com/cgi-bin/view/viewbasic.cgi?hoyi target=_blank><img src=http://best.netease.com/cgi-bin/log.cgi?user=hoyi&refer=\"+escape(document.referrer)+\"&cur=\"+escape(document.URL)+\" width=15 height=15 border=0 alt=网易排行榜></a>\")";
$envtext2.= "\n</script>";
$envtext2.= "\n<a href=\"http://www.or.com.cn\"><img src=\"http://hoyi.yeah.net/hoyilogo.gif\" width=\"88\" height=\"31\" border=\"0\" alt=\"好易CGI工厂\"></a>";
$envtext2.= "</center></BODY></HTML>";
$envtext=$envtext_head.$envtext_tab.$envtext_var.$envtext2;
print $envtext;
$envtext_mail=$envtext_var;

$perlver=$];
$perlos=$^O;
$perlstart=$^T;
$perltimes=times;

$envtext_head= <<HOYIEOF;

下面这些数据是由  〈$softname$version〉 测试你使用主机的有关信息：

当前目录绝对位置                   $dir
当前目录的URL地址                  $url
当前程序的URL地址                  $fullurl
Perl 版本                          $perlver
当前操作系统                       $perlos
程序开始运行时间                   $perlstart
运行消耗时间                       $perltimes 毫秒 
邮件系统路径                       $mail_prog

HOYIEOF

$envtext_mail=~ s/楷体_GB2312//g;
$envtext_mail=~s/\<.[\w\s=\-_;"#:\/\.?]*\>//g;
$envtext_mail=~s/&nbsp;//g;
$envtext_mail=~ s/[\r\n]{2,}/\n/g;
$envtext_mail=~ s/[\s]{1-3}//g;

$envtext_mail=$envtext_head.$envtext_mail;
##print "<pre>",$envtext_mail,"</pre>";

##如果存在邮件程序，就发送一个邮件给测试者。
if ((-e $mail_prog) && ($check_mailprog))  { &send_mailprog; };

}

sub send_mailprog {
    $rsubject="邮件系统存在于$mail_prog，可以发信！";
    open (MAIL,  "|$mail_prog -t");
    print MAIL "To: $rto\n";
    print MAIL "From: $rfrom\n";
    print MAIL "Subject: $rsubject\n\n";
    print MAIL "$rsubject";
    print MAIL "$envtext_mail";
    close (MAIL);
    $mail_prog.="\tHaha,邮件已成功发出！";
 }

exit 0;