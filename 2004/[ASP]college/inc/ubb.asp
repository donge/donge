<%
' 【代码转化 ubb.asp】
Function Ubbcode(Strer)
 If Strer="" or isnull(Strer) then
                  Ubbcode=""
                  Exit Function
               End If
	Strer=replace(Strer,"<","&lt;")
  	Strer=replace(Strer,">","&gt;")
  	Strer=replace(Strer,CHR(32),"&nbsp")    '空格
 	Strer=replace(Strer,CHR(9),"&nbsp")    'table
 	Strer=replace(Strer,CHR(39),"&#39;")    '单引号
  	Strer=replace(Strer,CHR(34),"&quot;")    '双引号
	'换行
  	Strer=replace(Strer,"[br]","<br>")
 	 Strer=replace(Strer,"[BR]","<br>")
 	 Strer=replace(Strer,vbCrLf,"<br>")
  dim re,infoimgurl
  infoimgurl="images/info"
  Set re=new RegExp
  re.IgnoreCase =True
  re.Global=True
  re.Pattern="(javascript)"
  Strer=re.Replace(Strer,"&#106avascript")
  re.Pattern="(jscript:)"
  Strer=re.Replace(Strer,"&#106script:")
  re.Pattern="(js:)"
  Strer=re.Replace(Strer,"&#106s:")
  re.Pattern="(value)"
  Strer=re.Replace(Strer,"&#118alue")
  re.Pattern="(about:)"
  Strer=re.Replace(Strer,"about&#58")
  re.Pattern="(file:)"
  Strer=re.Replace(Strer,"file&#58")
  re.Pattern="(document.cookie)"
  Strer=re.Replace(Strer,"documents&#46cookie")
  re.Pattern="(vbscript:)"
  Strer=re.Replace(Strer,"&#118bscript:")
  re.Pattern="(vbs:)"
  Strer=re.Replace(Strer,"&#118bs:")
  re.Pattern="(on(mouse|exit|error|click|key))"
  Strer=re.Replace(Strer,"&#111n$2")
  re.Pattern="\[IMG\](http|https|ftp):\/\/(.[^\[]*)\[\/IMG\]"
  Strer=re.Replace(Strer,"<a href='http://$2' target=_blank><IMG SRC='http://$2' border=0 onload=""javascript:if(this.width>screen.width-500)this.width=screen.width-500""></a>")
  re.Pattern="\[upimg](.[^\[]*)\[\/upimg\]"
  Strer=re.Replace(Strer,"<a href='upimg/$1'  target=_blank><IMG  onload='javascript:if(this.width>screen.width-300)this.width=screen.width-300' align=center SRC='upimg/$1' border=0 alt=按此在新窗口浏览图片><a>")
  re.Pattern="\[DOWNLOAD=(.[^\[]*)\](.[^\[]*)\[\/DOWNLOAD\]"
  Strer=re.Replace(Strer,"<br><b>下载提供</b>：<img align=absmiddle src='images/info/download.gif' border=0 alt='$2'><a href='$2' target=_blank title=按此下载文件>$1<a><br>")
 ' 如果多媒体标签可以按以下转化
  re.Pattern="\[DIR=*([0-9]*),*([0-9]*)\](.[^\[]*)\[\/DIR]"
  Strer=re.Replace(Strer,"<object classid=clsid:166B1BCA-3F9C-11CF-8075-444553540000 codebase=http://download.macromedia.com/pub/shockwave/cabs/director/sw.cab#version=7,0,2,0 width=$1 height=$2><param name=src value=$3><embed src=$3 pluginspage=http://www.macromedia.com/shockwave/download/ width=$1 height=$2></embed></object>")
  re.Pattern="\[QT=*([0-9]*),*([0-9]*)\](.[^\[]*)\[\/QT]"
  Strer=re.Replace(Strer,"<embed src=$3 width=$1 height=$2 autoplay=true loop=false controller=true playeveryframe=false cache=false scale=TOFIT bgcolor=#ededed kioskmode=false targetcache=false pluginspage=http://www.apple.com/quicktime/>")
  re.Pattern="\[MP=*([0-9]*),*([0-9]*)\](.[^\[]*)\[\/MP]"
  Strer=re.Replace(Strer,"<object align=middle classid=CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95 class=OBJECT id=MediaPlayer width=$1 height=$2 ><param name=ShowStatusBar value=-1><param name=Filename value=$3><embed type=application/x-oleobject codebase=http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701 flename=mp src=$3  width=$1 height=$2></embed></object>")
  re.Pattern="\[RM=*([0-9]*),*([0-9]*)\](.[^\[]*)\[\/RM]"
  Strer=re.Replace(Strer,"<OBJECT classid=clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA class=OBJECT id=RAOCX width=$1 height=$2><PARAM NAME=SRC VALUE=$3><PARAM NAME=CONSOLE VALUE=Clip1><PARAM NAME=CONTROLS VALUE=imagewindow><PARAM NAME=AUTOSTART VALUE=true></OBJECT><br><OBJECT classid=CLSID:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA height=32 id=video2 width=$1><PARAM NAME=SRC VALUE=$3><PARAM NAME=AUTOSTART VALUE=-1><PARAM NAME=CONTROLS VALUE=controlpanel><PARAM NAME=CONSOLE VALUE=Clip1></OBJECT>")
  re.Pattern="(\[FLASH=*([0-9]*),*([0-9]*)\])(.[^\[]*)(\[\/FLASH\])"
  Strer= re.Replace(Strer,"<a href='$4' TARGET=_blank><IMG SRC='image/info/flash.gif' border=0 alt=点击开新窗口欣赏该FLASH动画! height=16 width=16>[全屏欣赏]</a><br><OBJECT codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0 classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 width=$2 height=$3><PARAM NAME=movie VALUE='$4'><PARAM NAME=quality VALUE=high><embed src='$4' quality=high pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width=$2 height=$3>$4</embed></OBJECT>")
  re.Pattern="(\[FLASH\])(http://.[^\[]*(.swf))(\[\/FLASH\])"
  strer= re.Replace(strer,"<a href=""$2"" TARGET=_blank><IMG SRC=image/info/flash.gif border=0 alt='点击开新窗口欣赏该FLASH动画!' height=16 width=16>[全屏欣赏]</a><br><OBJECT codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0 classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 width=500 height=400><PARAM NAME=movie VALUE=""$2""><PARAM NAME=quality VALUE=high><embed src=""$2"" quality=high pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width=500 height=400>$2</embed></OBJECT>")
  re.Pattern="(\[sound\])(.[^\[]*)(\[\/sound\])"
  strer=re.Replace(  strer,"<br><b>加有背景音乐：</b><img src=image/info/music.gif border=0 alt='$2'><a href=""$2"" target=_blank title=按此收听>按此收听<a><br><bgsound src=""$2"">")
 re.Pattern="\[DIR=*([0-9]*),*([0-9]*)\](.[^\[]*)\[\/DIR]"
  Strer = re.Replace(Strer,"<img align=absmiddle src='image/info/flash.gif'><a target=_blank href=$3>$3</a>")
  re.Pattern="\[QT=*([0-9]*),*([0-9]*)\](.[^\[]*)\[\/QT]"
  Strer = re.Replace(Strer,"<img align=absmiddle src='image/info/quicktime.gif'><a target=_blank href=$3>$3</a>")
  re.Pattern="\[MP=*([0-9]*),*([0-9]*)\](.[^\[]*)\[\/MP]"
  Strer = re.Replace(Strer,"<img align=absmiddle src='image/info/mediaplay.gif'><a target=_blank href=$3>$3</a>")
  re.Pattern="\[RM=*([0-9]*),*([0-9]*)\](.[^\[]*)\[\/RM]"
  Strer = re.Replace(Strer,"<img align=absmiddle src='image/info/realplay.gif'><a target=_blank href=$3>$3</a>")
  re.Pattern="(\[FLASH=*([0-9]*),*([0-9]*)\])(.[^\[]*)(\[\/FLASH\])"
   Strer = re.Replace(Strer,"<img align=absmiddle src='image/info/flash.gif'><a target=_blank href=$3>$3</a>")
  re.Pattern="(\[FLASH\])(http://.[^\[]*(.swf))(\[\/FLASH\])"
   Strer = re.Replace(Strer,"<img align=absmiddle src='image/info/flash.gif'><a target=_blank href=$3>$3</a>")
  re.Pattern="(\[URL\])(.[^\[]*)(\[\/URL\])"
  Strer= re.Replace(Strer,"<img align=absmiddle src='image/info/url.gif'><A HREF='$2' TARGET=_blank>$2</A>")
  re.Pattern="(\[URL=(.[^\[]*)\])(.[^\[]*)(\[\/URL\])"
  Strer= re.Replace(Strer,"<img align=absmiddle src='image/info/url.gif'><A HREF='$2' TARGET=_blank>$3</A>")
  re.Pattern="(\[EMAIL\])(\S+\@.[^\[]*)(\[\/EMAIL\])"
  Strer= re.Replace(Strer,"<img align=absmiddle src=image/info/email.gif><A HREF=""mailto:$2"">$2</A>")
  re.Pattern="(\[EMAIL=(\S+\@.[^\[]*)\])(.[^\[]*)(\[\/EMAIL\])"
  re.Pattern="\[align=(.[^\[]*)\](.[^\[]*)\[\/align\]"
  Strer=re.Replace(Strer,"<div align=$1>$2</div>")
  re.Pattern="\[align=(.[^\[]*)\](.*)\[\/align\]"
  Strer=re.Replace(Strer,"<div align=$1>$2</div>")
  re.Pattern="\[center\](.[^\[]*)\[\/center\]"
  Strer=re.Replace(Strer,"<div align=center>$1</div>")
  re.Pattern="\[QUOTE\](.*)\[\/QUOTE\]"
  Strer=re.Replace(Strer,"<table border=0 class=TableBody cellspacing=0 cellpadding=4 width='95%' bordercolorlight='#006600' bordercolordark='#006600' style='TABLE-LAYOUT: fixed' align=center><tr><td style='WORD-WRAP: break-word'>$1</td></tr></table>")
   re.Pattern="\[CODE\](.*)\[\/CODE\]"
  Strer=re.Replace(Strer,"<table border=0 class=TableBody cellspacing=0 cellpadding=4 width='95%' bordercolorlight='#006600' bordercolordark=#EEEEEE style='TABLE-LAYOUT: fixed' align=center><tr><td style='WORD-WRAP: break-word'>$1</td></tr></table>")
 
'自动识别网址
  re.Pattern = "^(http://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
  Strer = re.Replace(Strer,"<img align=absmiddle src='image/info/url.gif'><a target=_blank href=$1>$1</a>")
  re.Pattern = "(http://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)$"
  Strer = re.Replace(Strer,"<img align=absmiddle src='image/info/url.gif'><a target=_blank href=$1>$1</a>")
  re.Pattern = "([^>='])(http://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
  Strer = re.Replace(Strer,"$1<img align=absmiddle src='image/info/url.gif'><a target=_blank href=$2>$2</a>")
  re.Pattern = "^(ftp://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
  Strer = re.Replace(Strer,"<img align=absmiddle src='image/info/url.gif'><a target=_blank href=$1>$1</a>")
  re.Pattern = "(ftp://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)$"
  Strer = re.Replace(Strer,"<img align=absmiddle src='image/info/url.gif'><a target=_blank href=$1>$1</a>")
  re.Pattern = "[^>='](ftp://[A-Za-z0-9\.\/=\?%\-&_~`@':+!]+)"
  Strer = re.Replace(Strer,"<img align=absmiddle src='image/info/url.gif'><a target=_blank href=$1>$1</a>")
  re.Pattern = "^(rtsp://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
  Strer = re.Replace(Strer,"<img align=absmiddle src='image/info/url.gif'><a target=_blank href=$1>$1</a>")
  re.Pattern = "(rtsp://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)$"
  Strer = re.Replace(Strer,"<img align=absmiddle src='image/info/url.gif'><a target=_blank href=$1>$1</a>")
  re.Pattern = "[^>='](rtsp://[A-Za-z0-9\.\/=\?%\-&_~`@':+!]+)"
  Strer = re.Replace(Strer,"<img align=absmiddle src='image/info/url.gif'><a target=_blank href=$1>$1</a>")
  re.Pattern = "^(mms://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)"
  Strer = re.Replace(Strer,"<img align=absmiddle src='image/info/url.gif'><a target=_blank href=$1>$1</a>")
  re.Pattern = "(mms://[A-Za-z0-9\./=\?%\-&_~`@':+!]+)$"
  Strer = re.Replace(Strer,"<img align=absmiddle src='image/info/url.gif'><a target=_blank href=$1>$1</a>")

'字体处理  
  re.Pattern="\[fly\](.[^\[]*)\[\/fly\]"
  Strer=re.Replace(Strer,"<marquee width=90% behavior=alternate scrollamount=3>$1</marquee>")
  re.Pattern="\[move\](.[^\[]*)\[\/move\]"
  Strer=re.Replace(Strer,"<MARQUEE scrollamount=3>$1</marquee>")  
  re.Pattern="\[GLOW=*([0-9]*),*(#*[a-z0-9]*),*([0-9]*)\](.[^\[]*)\[\/GLOW]"
  Strer=re.Replace(Strer,"<Div width=$1 style=""filter:glow(color=$2, strength=$3)"">$4</table>")
  re.Pattern="\[SHADOW=*([0-9]*),*(#*[a-z0-9]*),*([0-9]*)\](.[^\[]*)\[\/SHADOW]"
  Strer=re.Replace(Strer,"<Div width=$1 style=""filter:shadow(color=$2, strength=$3)"">$4</div>")
  re.Pattern="\[i\](.[^\[]*)\[\/i\]"
  Strer=re.Replace(Strer,"<i>$1</i>")
  re.Pattern="\[u\](.[^\[]*)(\[\/u\])"
  Strer=re.Replace(Strer,"<u>$1</u>")
  re.Pattern="\[b\](.[^\[]*)(\[\/b\])"
  Strer=re.Replace(Strer,"<b>$1</b>")
  re.Pattern="\[color=(.[^\[]*)\](.[^\[]*)\[\/color\]"
  Strer=re.Replace(Strer,"<font color=$1>$2</font>")
  re.Pattern="\[face=(.[^\[]*)\](.[^\[]*)\[\/face\]"
  Strer=re.Replace(Strer,"<font face=$1>$2</font>")
  re.Pattern="\[size=([1-5])\](.[^\[]*)\[\/size\]"
  Strer=re.Replace(Strer,"<font size=$1>$2</font>")
set re=Nothing
' 转化完毕,返回结果
UbbCode=Strer
End Function
%>