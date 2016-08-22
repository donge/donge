// 终止错误
window.onerror = stopError
// 终止脚本错误
function stopError()
{
return true;
}
// 获得参数
function getFrameVars() 
{ 
    var fVars     = new Object();       // Create new fVars object
    var nameVal   = "";                 // Holds array for a single name-value pair
    var inString  = location.search;    // Get query string from URL
    var separator = ",";                // Character used to separate multiple values 

   // 如果含有?字符串
	if (inString.charAt(0) == "?") 
    { 
        // 将?从字符串中去除
        inString = inString.substring(1, inString.length); 
        // Separates query string into name-value pairs. 
		keypairs = inString.split("&"); 
        // Loops through name-value pairs. 
        for (var i=0; i < keypairs.length; i++) 
		{ 
            // Splits name-value into array (nameVal[0]=name, nameVal[1]=value). 
            nameVal = keypairs[i].split("=");
            // Checks to see if name already exists 
			if (fVars[nameVal[0]]) 
            { 
			   fVars[nameVal[0]] += separator + nameVal[1]; 
            } 
            else 
            { 
               fVars[nameVal[0]] = nameVal[1]; 
            }
        } 
    } 
	return fVars; 
} 
FrameVars=getFrameVars();

//Read variables passed with the URL
//alert("\n\nid=" + FrameVars.id + "\n\ntable=" + FrameVars.table + "\n\nurl=" + FrameVars.url + "\n\nlocation.search=" +  location.search);

// ######################## 如果没有继承父页面，则自动最大化窗口
//if ( top.top_page_existed != 'yes' && window.location.href.indexOf("movie_") > 1 )	{
	//self.moveTo(0,0);
	//self.resizeTo(screen.availWidth,screen.availHeight);
	//window.focus();
//}

function ad_top()	{
	document.write('<!-- 顶部广告 开始 -->');
	document.write('<table width="765" cellspacing="0" cellpadding="0" align=center>');
	document.write('	<tr> ');
	document.write('	<td height="20" bgcolor="#EBFFD7" align=center>  ');
	document.write('	&nbsp;');
	document.write('<font color="#808080">');
	document.write('[<a href="#" class=a3>广告位置</a>]  ');
	document.write('[<a href="http://www.168101.com/?123" target="_blank" class=a3><font color=red>电影极品欣赏网</font></a>]  ');
	document.write('[<a href="#" class=a3>广告位置</a>]  ');
	document.write('[<a href="http://sms.10168.com/" target="_blank" class=a3><font color=red>手机铃声</font></a>]  ');
	
	document.write('[<a href="#" class=a3>广告位置</a>]  ');
	document.write('[<a href="http://www.dangdang.com/default.asp?from=P-1122651" target="_blank" class=a3><font color=red>当当商城</font></a>]  ');
	document.write('</font>');
	document.write('	</td>');
	document.write('	</tr>');
	document.write('</table>');
	document.write('<!-- 顶部广告 结束 -->');
}

function bottom_template()	{
	document.write('<table width="765" border=0 cellspacing=0 cellpadding=0 bgcolor="#ffffff" align=center>');
	document.write('<TR>');
	document.write('	<TD align=center>');
	document.write('<P>&nbsp;</P>');
	document.write('<hr>');

	document.write('	Copyright &copy; 2001 - 2009 &nbsp; www.10168.com &nbsp; All Rights Reserved <P>');
	document.write('极品网址 &nbsp; <a href=http://www.10168.com><font color=black>www.10168.com</font></a> &nbsp; 版权所有 &copy; 2001 - 2009 <P>');

	document.write('</td></tr><tr><td height="20" bgcolor="4d99e5" align=right>');
	document.write('<A href=\'javascript:window.external.addFavorite("http://www.10168.com/","极品网址 - www.10168.com 只收集最优秀的网址");\' class=a1>收藏本站</A>');
	document.write('&nbsp;</td></tr></table>');

}