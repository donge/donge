#!/usr/bin/perl
print "Content-type: text/html\n\n";
print <<EOF;
<html><head><SCRIPT>
document.cookie="EB="+"";
document.cookie="pname="+"";
document.cookie="pass="+"";
</SCRIPT></head><script>alert('����COOKIE�Ѿ���ɱ�����ˣ����Ѿ���ȫ�˳��ˣ���');history.back();window.close();</script>
EOF

	print << "	-----END-----";
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<body background=images/star_bg.jpg text=#dcdcdc link=#dcdcdc style=\"margin:0px 0px 0px 0px;\" oncontextmenu="return false;">
<LINK href=miuler.css type=text/css rel=stylesheet>
<br>
&FOOTER;
	-----END-----
	print "<center>��վ��ʽ������ ==> $OWNER_NAME</center>" if $OWNER_NAME;
	print "</span>";
	exit;;
