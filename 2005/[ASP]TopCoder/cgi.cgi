#!perl.exe
#!/.../perl
#######################################################################
#     	          ���׻�������̽�� 2.80				      #
#hiecho.cgi  							      #
#Version: 2.80
## ������£� 9/23/99                                                       #
## ������£� 1/20/99
##  EmailΪ:  hoyi@email.com           
## ȫ�����������    http://www.or.com.cn/
## ����CGI����       http://hoyi.yeah.net/				      #
## �ű�˵��: ���ű��������ķ�ʽ��ʾ���л��������� 		      #
## ʹ�÷��������ű�һ��Ҫ���ڳ���CGIִ�е�Ŀ¼�У�����һ��Ҫ���������� #
## ���óɿ���ִ��(755)��						      #
## �磺chmod 755							      #
## ��ʹ֮������WEB��������ִ�С�					      #
## ʾ����perl.webprovider.com/hiecho.cgi			      # 
##      linux.cqi.com.cn/~hoyi/hiecho.cgi         		      #
#######################################################################
##    ���׻�������̽�� 2.80 					##
##    ��Ȩ����(1998)ȫ�����������������CGI����	     
#######################################################################
##                          ������Ϊ������                       
##                         ����������Ϊ: ����                      
##		         ����EmailΪ:  hoyi@email.com  
##                   ����CGI����  http://hoyi.yeah.net	    
##                   ȫ�����������  http://www.or.com.cn/       
##                 ȫ��ǿ���Ĺ��� ����ʹ�õ����� ��ȫ���Ľ���  
##                        ����ȫ�����������
##			    �ṩ����CGI����
##                ����������޸ı�����, ��Ҫ���㱣��������Ϣ!
#######################################################################
#�������ұ����Ա�����֮�����붩��֮Ȩ��.
#�κ��˰�����ȡ����Ȩ֮ʹ������ִ�б���������֮�趨�������������֮����
#����,���������޸�.����.����������֮��һ����. ����Υ������Ȩ��֮�涨,��
#�������Զ�����׷��֮Ȩ��.
#��������Ȩ��������ɾ��, ������ȡ��ʹ����Ȩ��.
#######################################################################
##�汾��ʷ
##2.80 Ŀǰ����ȷ����Ŀ¼��
##2.70 ���Լ��һЩϵͳ�����Ϣ�����ʼ���ַ��PERLλ��/����ϵͳ����
##2.50 18/9/98 �����windows����iis2.0~4.0�Ļ�������ת����
##	          ʶ��IIS����������SERVER_PORT_SECURE ���뷨���ܲ�ȷ�У�
##1.80 11/9/98  �������任���������֡�
#���ȣ���ӡ��HTTPͷ��Ϣ
print "Content-type: text/html\n\n";

@env_var_hoyi = keys (%ENV);

#����ʼ����ܴ�
$check_mailprog=1;
#����ʱ�õ����ŵ�ַ
$rto='hoyi@371.net';
$rfrom=$rto;

#�����ǰ汾���š�

#($hiecho'version = '$Revision: 2.8 $') =~ s/[^.\d]//g;
#$version= $hiecho'version;
$version="2.80";
$softname="���׻�������̽��";

$envtext_head= <<HOYIEOF;
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<TITLE>$softname   $version</TITLE>
</HEAD>
<BODY bgcolor=oldlace>
<p align="center"><font face="����_GB2312" SIZE="5" COLOR="#990030">
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
if (!(-e $mail_prog)) {$mail_prog="�ʼ����򲻴��ڣ����������������ͳ���";};

$mailprog_text=<<EOFHOYI
<tr>
<td width="160" bgcolor="#CACAFF"><font color="#408080"><strong>�ʼ�ϵͳ·��</strong></font></td>
<td width="360" bgcolor="#CACAFF">$mail_prog</td>
</tr>
EOFHOYI

}

$envtext_tab.= <<EOFXX;
<table border="0" width="520">
<tr>
<td width="160" bgcolor="#CACAFF"><font color="#408080"><strong><font size="3">��ǰĿ¼����λ��</font>
</strong></font></td>
<td width="360" bgcolor="#CACAFF"><font color="408080" size="3"><strong><u>$dir</u></strong></font></td>
</tr>
<tr>
<td width="160" bgcolor="#CACAFF"><font color="#408080"><strong><font size="3">��ǰĿ¼��URL��ַ</font>
<font size="4"> </font></strong></font></td>
<td width="360" bgcolor="#CACAFF"><font color="408080" size="3"><strong><a href="$url">$url</a></strong></font></td>
</tr>
<tr>
<td width="160" bgcolor="#CACAFF"><font color="#408080"><strong><font size="3">��ǰ�����URL��ַ</font>
</strong></font></td>
<td width="360" bgcolor="#CACAFF"><font color="408080" size="3"><strong><a href="$fullurl">$fullurl</a></strong></font></td>
</tr>
<tr>
<td width="160" bgcolor="#CACAFF"><font color="#408080"><strong>Perl �汾 </strong></font></td> <td width="360" bgcolor="#CACAFF">$]</td>
</tr>
<tr>
<td width="160" bgcolor="#CACAFF"><font color="#408080"><strong>��ǰ����ϵͳ </strong></font></td>
<td width="360" bgcolor="#CACAFF">$^O</td>
</tr>
<tr>
<td width="160" bgcolor="#CACAFF"><font color="#408080"><strong>����ʼ����ʱ�� </strong></font></td>
<td width="360" bgcolor="#CACAFF">$starttime</td>
</tr>
<tr>
<td width="160" bgcolor="#CACAFF"><font color="#408080"><strong>��������ʱ�� </strong></font></td>
<td width="360" bgcolor="#CACAFF">$temptimes\t����</td>
</tr>
$mailprog_text
<tr>
<td width="160" bgcolor="#CACAFF"><font color="#408080"><strong>����ʱ��</strong></font></td>
<td width="360" bgcolor="#CACAFF"><a href="http://hoyi.yeah.net" target="_blank"><img
SRC="http://www.ruian.com/cgi-bin/FreeCount.cgi?df=site188.dat&amp;display=date|timezone=GMT+0800|dd=D|ft=1|tr=T|trgb=000000|srgb=00ff00|prgb=993300"
alt="����CGI����" border="0" width="70" height="13"><img
SRC="http://www.ruian.com/cgi-bin/FreeCount.cgi?df=site188.dat&amp;display=clock|timezone=GMT+0800|dd=D|ft=1|tr=T|trgb=000000|srgb=00ff00|prgb=993300"
alt="����CGI����" border="0" width="57" height="13"></a></td>
</tr>
</TABLE>

EOFXX

foreach $environment_variable (sort @env_var_hoyi)
    {
	$cenv_var_hoyi=$environment_variable;
	$cenv_var_hoyi=~s/_INFO/��Ϣ/g;
	$cenv_var_hoyi=~s/_TRANSLATED/ת������/g;
	$cenv_var_hoyi=~s/CONTENT_LENGTH/����ı�����/g;
	$cenv_var_hoyi=~s/COMPUTERNAME/���������������/g;
	$cenv_var_hoyi=~s/DOCUMENT_ROOT/�������ĵ���Ŀ¼/g;
	$cenv_var_hoyi=~s/DOCUMENT_/�ű��ļ�/g;
	$cenv_var_hoyi=~s/GATEWAY_INTERFACE/(CGIͨ�����ؽӿ�)�汾/g;
	$cenv_var_hoyi=~s/HTTP_ACCEPT_ENCODING/�ͻ����ܽ��ܵı�����ʽ/g;
	$cenv_var_hoyi=~s/HTTP_ACCEPT_CHARSET/�ͻ����ܽ��ܵ����Դ�������/g;
	$cenv_var_hoyi=~s/HTTP_ACCEPT_LANGUAGE/�ͻ����ܽ��ܵ���������/g;
	$cenv_var_hoyi=~s/HTTP_ACCEPT/�ͻ������Խ��ܵ��ļ�����/g;
	$cenv_var_hoyi=~s/HTTP_CONNECTION/Http��ǰ����״̬/g;
	$cenv_var_hoyi=~s/HTTP_HOST/��������������/g;
	$cenv_var_hoyi=~s/HTTP_REFERER/���õ�ǰ�ű���URL��ַ/g;
	$cenv_var_hoyi=~s/HTTP_USER_AGENT/�û���ϵͳ������Ϣ/g;
	$cenv_var_hoyi=~s/NUMBER_OF_PROCESSORS/������ʹ��CPU����/g;
	$cenv_var_hoyi=~s/PATH/·��/g;
	$cenv_var_hoyi=~s/QUERY_STRING/�����ַ���/g;
	$cenv_var_hoyi=~s/REMOTE_ADDR/�ͻ�����IP��ַ/g;
	$cenv_var_hoyi=~s/REMOTE_HOST/�ͻ���������/g;
	$cenv_var_hoyi=~s/REMOTE_PORT/�ͻ���������˿�/g;
	$cenv_var_hoyi=~s/REQUEST_METHOD/�ͻ��������󷽷�/g;
	$cenv_var_hoyi=~s/REQUEST_URI/�ͻ���������URL��Ϣ/g;
	$cenv_var_hoyi=~s/SCRIPT_FILENAME/�ű��ļ��ľ���·����/g;
	$cenv_var_hoyi=~s/SCRIPT_NAME/�ű��ļ�����URL��ַ/g;
	$cenv_var_hoyi=~s/SERVER_ADMIN/�������������Ա/g;
	$cenv_var_hoyi=~s/SERVER_NAME/����������/g;
	$cenv_var_hoyi=~s/SERVER_PORT_SECURE/����Http����ķ�������ȫ�����ܶ˿�/g;
	$cenv_var_hoyi=~s/SERVER_PORT/����Http����ķ������˿�/g;
	$cenv_var_hoyi=~s/SERVER_PROTOCOL/����������Э��/g;
	$cenv_var_hoyi=~s/SERVER_SOFTWARE/��������������Ƽ��汾/g;
	$cenv_var_hoyi=~s/REMOTE_USER/�û�������Ϣ/g;
	$cenv_var_hoyi=~s/URI/URL��ַ��Ϣ/g;
	$cenv_var_hoyi=~s/NAME/������Ϣ/g;
	$cenv_var_hoyi=~s/SCRIPT_/�ű��ļ�/g;
	$cenv_var_hoyi=~s/OS/����ϵͳ/g;
	$cenv_var_hoyi=~s/PROCESSOR_ARCHITECTURE/CPU����/g;
	$cenv_var_hoyi=~s/PROCESSOR_IDENTIFIER/CPU��ű�ʶ/g;
	$cenv_var_hoyi=~s/PROCESSOR_LEVEL/CPU��������/g;
	$cenv_var_hoyi=~s/PROCESSOR_REVISION/CPU�����汾/g;
	$cenv_var_hoyi=~s/WINDIR/WindowsĿ¼/g;
 	$cenv_var_hoyi=~s/SYSTEMROOT/ϵͳ����Ŀ¼/g;
	$cenv_var_hoyi=~s/SYSTEMDRIVE/ϵͳӲ��/g;
	$cenv_var_hoyi=~s/COMSPEC/��������������/g;
	$cenv_var_hoyi=~s/USERPROFILE/�û������ļ�/g;
	$cenv_var_hoyi=~s/LOCAL_ADDR/����IP��ַ/g;
	$cenv_var_hoyi=~s/HTTPS/��ȫ������ʹ��״̬/g;

$spaceit=" " x (35-length($cenv_var_hoyi));
$cenv_var_hoyi=$cenv_var_hoyi.$spaceit;
$envtext_var.= "</font><font color=408080 face=arial><span style=\"font-size: 9pt\">$cenv_var_hoyi<strong>";
$envtext_var.= "<br><font color=408080><u>\"\$ENV{\'$environment_variable\'}\"</strong></font></u>";
$envtext_var.= "<font color=990033><strong><u> = $ENV{$environment_variable}</u>;</strong></font></span><BR>\n";

    }
$envtext2.= "\n<p align=center><a href=\"http://view.gznet.com/cgi-bin/rl_views.cgi?UID=10003631\" target=\"stat\"><img src=\"http://refer.gznet.com/cgi-bin/rl_refer2.cgi?UID=10003631&amp;refer=http://www.or.com.cn/home.html#noscript\" border=\"0\" alt=\"����վ�����\"></a>";
$envtext2.= "<a href=\"http://www.or.com.cn/\" target=\"_blank\"><img src=\"http://online.mirabilis.com/scripts/online.dll?icq=18634452&amp;img=5\" width=\"18\" height=\"18\" ALT=\"hoYI������\" border=\"0\"></a>";
$envtext2.= "\n<script>";
$envtext2.= "\ndocument.write(\"<a href=http://best.netease.com/cgi-bin/view/viewbasic.cgi?hoyi target=_blank><img src=http://best.netease.com/cgi-bin/log.cgi?user=hoyi&refer=\"+escape(document.referrer)+\"&cur=\"+escape(document.URL)+\" width=15 height=15 border=0 alt=�������а�></a>\")";
$envtext2.= "\n</script>";
$envtext2.= "\n<a href=\"http://www.or.com.cn\"><img src=\"http://hoyi.yeah.net/hoyilogo.gif\" width=\"88\" height=\"31\" border=\"0\" alt=\"����CGI����\"></a>";
$envtext2.= "</center></BODY></HTML>";
$envtext=$envtext_head.$envtext_tab.$envtext_var.$envtext2;
print $envtext;
$envtext_mail=$envtext_var;

$perlver=$];
$perlos=$^O;
$perlstart=$^T;
$perltimes=times;

$envtext_head= <<HOYIEOF;

������Щ��������  ��$softname$version�� ������ʹ���������й���Ϣ��

��ǰĿ¼����λ��                   $dir
��ǰĿ¼��URL��ַ                  $url
��ǰ�����URL��ַ                  $fullurl
Perl �汾                          $perlver
��ǰ����ϵͳ                       $perlos
����ʼ����ʱ��                   $perlstart
��������ʱ��                       $perltimes ���� 
�ʼ�ϵͳ·��                       $mail_prog

HOYIEOF

$envtext_mail=~ s/����_GB2312//g;
$envtext_mail=~s/\<.[\w\s=\-_;"#:\/\.?]*\>//g;
$envtext_mail=~s/&nbsp;//g;
$envtext_mail=~ s/[\r\n]{2,}/\n/g;
$envtext_mail=~ s/[\s]{1-3}//g;

$envtext_mail=$envtext_head.$envtext_mail;
##print "<pre>",$envtext_mail,"</pre>";

##��������ʼ����򣬾ͷ���һ���ʼ��������ߡ�
if ((-e $mail_prog) && ($check_mailprog))  { &send_mailprog; };

}

sub send_mailprog {
    $rsubject="�ʼ�ϵͳ������$mail_prog�����Է��ţ�";
    open (MAIL,  "|$mail_prog -t");
    print MAIL "To: $rto\n";
    print MAIL "From: $rfrom\n";
    print MAIL "Subject: $rsubject\n\n";
    print MAIL "$rsubject";
    print MAIL "$envtext_mail";
    close (MAIL);
    $mail_prog.="\tHaha,�ʼ��ѳɹ�������";
 }

exit 0;