<script language="JScript" runAt="server">
// Check if file is called inside LBS
var inLBS;
if(inLBS!=true){
  Response.write("Invalid Call");
  Response.End();
}

//====== CLASS lbsUBB ========================================
// UBB Code Processer Class
//
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-04-19 18:43:45
//============================================================

</script>
<%

// Create this object directly when included
// Must be put inside <% quotes to be available to the output Page
var ubb=new lbsUBB();

%>
<script language="JScript" runAt="server">

function lbsUBB(){

  // Process UBBCode ///////////////////////////////////////////////////////////////////////
  // Flags(6 chars): Default "111111" bBasic, bAutoURL, bImage, bMedia, bSmilies, bTextBlock
  // 0 - Disable, 1 - Enable, 2 - Special
  this.toHTML = function(str, strFlags, baseURL, bLinkNoFollow, imageFolder, smiliesFolder){
    if(ScriptEngineMajorVersion<5 || ScriptEngineMajorVersion==5 && ScriptEngineMinorVersion<5){
      write('<div style="border: solid 1px #CC0000; text-align: center; background: #FFEEDD;color: #990000">ScriptEngine Version too low</div>');
      return str; 
    }

    if(!strFlags) strFlags="111111";
    strFlags=String(strFlags);
    if(strFlags.length!=6){ strFlags="000000";}

    if(!bLinkNoFollow) bLinkNoFollow=false;
    if(!baseURL) baseURL="";
    if(!imageFolder) imageFolder=theCache.settings["imageFolder"];
    if(!smiliesFolder) smiliesFolder=theCache.settings["smiliesFolder"];

    var bBasic=strFlags.charAt(0);
    var bAutoURL=strFlags.charAt(1);
    var bImage=strFlags.charAt(2);
    var bMedia=strFlags.charAt(3);
    var bSmilies=strFlags.charAt(4);
    var bTextBlock=strFlags.charAt(5);
    // Reverse the HTML Encode for New Line
    str=str.replace(/\<br \/\>/ig,"\n");
    str=str.replace(/\&nbsp;/ig,"$nbsp$");
    // Remove the content separator
    str=str.replace(/\[separator\]/ig,"");

    // Parse Text Blocks (Must do this before processing other UBB tags) ------------------------
    if(bTextBlock=="1"){
      str=this.formatQuote(str,baseURL);
      str=this.formatCode(str);
    }
    
    // Auto recognize URL String (Must do this first to prevent error) ------------------------
    if(bAutoURL=="1"){
      var re=/([^\=\]][\s]*?|^)(http|https|rstp|ftp|mms|ed2k):\/\/(.*?)(\>|\<|\&quot\;|\&gt\;|\&lt\;|\)|\(|$| )/igm;
      while ((arrMatch = re.exec(str)) != null){
        var strURL=arrMatch[2]+'://'+func.checkURL(arrMatch[3]);
        strURL=func.URLEncode(strURL);
        var newStr=arrMatch[1]+'<a href="'+strURL+'" title="'+strURL+'" target="_blank"'+ (bLinkNoFollow ? ' ref="nofollow"' : '') +'>'+strURL+'</a>'+arrMatch[4];
        str=str.replace(arrMatch[0],newStr);
        re.lastIndex+=newStr.length-arrMatch[0].length;
      }
    }

    // Process Normal UBB Tags --------------------------------
    if(bBasic=="1"){
     // URL
      var re=/\[url=([^<>]*?)\](.*?)\[\/url\]/ig;
      while ((arrMatch = re.exec(str)) != null){
        var strURL=func.checkURL(arrMatch[1]);
        var strTitle=arrMatch[2];
        if(strURL.indexOf("://")<0) strURL=baseURL+strURL;
        strURL=func.URLEncode(strURL);
        var newStr='<a href="'+strURL+'" title="'+strURL+'" target="_blank"'+ (bLinkNoFollow ? ' ref="nofollow"' : '') +'>'+strTitle+'</a>';
        str=str.replace(arrMatch[0],newStr);
        re.lastIndex+=newStr.length-arrMatch[0].length;
      }
      re=/\[url\]([^<>]*?)\[\/url\]/ig;
      while ((arrMatch = re.exec(str)) != null){
        var strURL=func.checkURL(arrMatch[1]);
        if(strURL.indexOf("://")<0) strURL=baseURL+strURL;
        strURL=func.URLEncode(strURL);
        var newStr='<a href="'+strURL+'" title="'+strURL+'" target="_blank"'+ (bLinkNoFollow ? ' ref="nofollow"' : '') +'>'+strURL+'</a>';
        str=str.replace(arrMatch[0],newStr);
        re.lastIndex+=newStr.length-arrMatch[0].length;
      }
      // File
      re=/\[file=([^<>]*?)\]([^<>]*?)\[\/file\]/ig;
      while ((arrMatch = re.exec(str)) != null){
        var strURL=func.checkURL(arrMatch[1]);
        if(strURL.indexOf("://")<0) strURL=baseURL+strURL;
        strURL=func.URLEncode(strURL);
        var strTitle=arrMatch[2];
        var newStr='<a href="'+strURL+'" title="'+strURL+'" target="_blank"><img src="'+baseURL+imageFolder+'/icon_file.gif" border="0" /> '+strTitle+'</a>';
        str=str.replace(arrMatch[0],newStr);
        re.lastIndex+=newStr.length-arrMatch[0].length;
      }
      // Font style
      str=str.replace(/\[align=(\w{4,6})\]([^\r]*?)\[\/align\]/ig,'<div align="$1">$2</div>');
      str=str.replace(/\[color=([\w\#]{3,10})\]([^\r]*?)\[\/color\]/ig,'<span style="color:$1">$2</span>');
      str=str.replace(/\[size=(\d{1,2})\]([^\r]*?)\[\/size\]/ig,'<span style="font-size:$1pt">$2</span>');
      str=str.replace(/\[font=([ \w\u3400-\u4DBF\u4E00-\u9FAF]{2,18})\]([^\r]*?)\[\/font\]/ig,'<span style="font-family:$1">$2</span>');
      str=str.replace(/\[i\]([^\r]*?)\[\/i\]/ig,"<i>$1</i>");
      str=str.replace(/\[b\]([^\r]*?)\[\/b\]/ig,"<b>$1</b>");
      str=str.replace(/\[u\]([^\r]*?)\[\/u\]/ig,"<u>$1</u>");
      str=str.replace(/\[s\]([^\r]*?)\[\/s\]/ig,"<s>$1</s>");
      str=str.replace(/\[sup\]([^\r]*?)\[\/sup\]/ig,"<sup>$1</sup>");
      str=str.replace(/\[sub\]([^\r]*?)\[\/sub\]/ig,"<sub>$1</sub>");
      str=str.replace(/\[hr\]/ig,'<hr>');
      // List
      str=this.formatList(str);
    }

    // Process IMG Tags --------------------------------
    if(bImage=="1"){
			re=/\[img\]([^<>]*?)\[\/img\]/ig;
      while ((arrMatch = re.exec(str)) != null){
        var strURL=func.checkURL(arrMatch[1]);
        if(strURL.indexOf("://")<0) strURL=baseURL+strURL;
        strURL=func.URLEncode(strURL);
        var newStr='<div style="width: 100%;overflow-x : auto;"><a href="'+strURL+'" target="_blank"><img src="'+strURL+'" alt="'+strURL+'" /></a></div>';
        str=str.replace(arrMatch[0],newStr);
        re.lastIndex+=newStr.length-arrMatch[0].length;
      }
			re=/\[img=(left|right|center)\]([^<>]*?)\[\/img\]/ig;
      while ((arrMatch = re.exec(str)) != null){
        var strAlign=arrMatch[1];
        var strURL=func.checkURL(arrMatch[2]);
        if(strURL.indexOf("://")<0) strURL=baseURL+strURL;
        strURL=func.URLEncode(strURL);
        var newStr="";
        if(strAlign=="center"){
          newStr='<center><a href="'+strURL+'" target="_blank"><img src="'+strURL+'" alt="'+strURL+'" /></a></center>';
        }else{
          newStr='<a href="'+strURL+'" target="_blank"><img src="'+strURL+'" alt="'+strURL+'" style="float: '+strAlign+';" /></a>';
        }
        str=str.replace(arrMatch[0],newStr);
        re.lastIndex+=newStr.length-arrMatch[0].length;
      }
			re=/\[img=(\d*|),(\d*|)(,left|,right|,center|,absmiddle|)\]([^<>]*?)\[\/img\]/ig;
      while ((arrMatch = re.exec(str)) != null){
        var strWidth=arrMatch[1];
        var strHeight=arrMatch[2];
        var strAlign=arrMatch[3].slice(1);
        var strURL=func.checkURL(arrMatch[4]);
        if(strURL.indexOf("://")<0) strURL=baseURL+strURL;
        strURL=func.URLEncode(strURL);
        var newStr="";
        if(strAlign=="center"){
          newStr='<center><a href="'+strURL+'" target="_blank"><img src="'+strURL+'" width="'+strWidth+'" height="'+strHeight+'" alt="'+strURL+'" /></a></center>';
        }else{
          newStr='<a href="'+strURL+'" target="_blank"><img src="'+strURL+'" width="'+strWidth+'" height="'+strHeight+'" style="float: '+strAlign+';" alt="'+strURL+'" /></a>';
        }
        str=str.replace(arrMatch[0],newStr);
        re.lastIndex+=newStr.length-arrMatch[0].length;
      }
    }else if(bImage=="2"){
			re=/\[img([^\]]*)\]([^<>]*?)\[\/img\]/ig;
      while ((arrMatch = re.exec(str)) != null){
        var strURL=func.checkURL(arrMatch[2]);
        if(strURL.indexOf("://")<0) strURL=baseURL+strURL;
        strURL=func.URLEncode(strURL);
        var newStr='<a href="'+strURL+'" target="_blank"><img src="'+imageFolder+'/icon_image.gif" alt="Image" /> '+strURL+'</a>';
        str=str.replace(arrMatch[0],newStr);
        re.lastIndex+=newStr.length-arrMatch[0].length;
      }
    }

    // Process Media Tags --------------------------------
    if(bMedia=="1"){
			re=/\[(swf|wmp|rm|qt)(=\d*?|)(,\d*?|)\]([^<>]*?)\[\/(swf|wmp|rm|qt)\]/ig;
      while ((arrMatch = re.exec(str)) != null){
        var strID="obj"+func.randomStr(4);
        var strType=arrMatch[1];
        var strWidth=arrMatch[2].slice(1);
        var strHeight=arrMatch[3].slice(1);
        if(strWidth.length==0) strWidth="400";
        if(strHeight.length==0) strHeight="300";
        var strURL=func.checkURL(arrMatch[4]);
        if(strURL.indexOf("://")<0) strURL=baseURL+strURL;
        strURL=func.URLEncode(strURL);
        var newStr='<div class="ubb-obj-div"><input id="bShow'+strID+'" type="hidden" value="-1" />';
        newStr+='<a href="javascript:ubbShowObj(\'' + strType + "','" + strID + "','" + strURL + "','" + strWidth + "','" + strHeight + '\');"><img src="'+baseURL+imageFolder+'/icon_media.gif" alt="Media" /> <b>'+lang["show_media"]+'</b></a>';
        newStr+='<div id="'+strID+'"><a href="'+strURL+'" target="_blank">' + strURL + "</a></div></div>";
        str=str.replace(arrMatch[0],newStr);
        re.lastIndex+=newStr.length-arrMatch[0].length;
      }
    }else if(bMedia=="2"){
			re=/\[(swf|wmp|rm|qt)([^\]]*)\]([^<>]*?)\[\/(swf|wmp|rm|qt)\]/ig;
      while ((arrMatch = re.exec(str)) != null){
        var strURL=func.checkURL(arrMatch[3]);
        if(strURL.indexOf("://")<0) strURL=baseURL+strURL;
        strURL=func.URLEncode(strURL);
        var newStr='<a href="'+strURL+'" target="_blank"><img src="'+imageFolder+'/icon_media.gif" alt="Media" /> '+strURL+'</a>';
        str=str.replace(arrMatch[0],newStr);
        re.lastIndex+=newStr.length-arrMatch[0].length;
      }
    }

    // Process Smilies --------------------------------
    if(bSmilies=="1"){
      for(var i=0;i<theCache.smilies.length;i++){
        // Use tmpStr to present code in alt attribute of img tag
        var tmpStr="_"+theCache.smilies[i].code.substr(0,1)+"_"+theCache.smilies[i].code.substr(1)+"_";
        var replaceStr='<img src="'+baseURL+smiliesFolder+'/'+theCache.smilies[i].image+'" border="0" alt="'+tmpStr+'" />';
        var intPos=0;
        while(str.indexOf(theCache.smilies[i].code)>-1){
          str=str.replace(theCache.smilies[i].code, replaceStr);
        }
        // Turn tmpStr into code string
        while(str.indexOf(tmpStr)>-1){
          str=str.replace(tmpStr,theCache.smilies[i].code);
        }
      }
    }

    // Bring Back HTML New Line <br /> and Spaces
    str=str.replace(/\n/g,"<br />");
    str=str.replace(/\$nbsp\$/g,"&nbsp;");

    return this.decUBB(str);
  }
  
  // Helper function for preserve ubbcodes ///////////////////////////////////
  this.encUBB=function(str){
    str=str.replace(/\[/g,"$[$");
    str=str.replace(/\]/g,"$]$");
    return str;
  }

  this.decUBB=function(str){
    str=str.replace(/\$\[\$/g,"[");
    str=str.replace(/\$\]\$/g,"]");
    return str;
  }
  
  // Process [quote] tag ////////////////////////////////////////////////////
  this.formatQuote=function(str, baseURL){
    str=str.replace(/\[quote\]/ig,"[quote=]");
    // Clean up string
    str=str.replace(/\[quote=/ig,"[quote=");
    str=str.replace(/\[\/quote\]/ig,"[/quote]");
    str=str.replace(/\n*\[quote=/ig,"[quote=");
    str=str.replace(/\n*\[\/quote\]/ig,"[/quote]");
    str=str.replace(/\[quote=([^]]*)]\n*/ig,"[quote=$1]");
    str=str.replace(/\[\/quote\]\n*/ig,"[/quote]");

    while(str.indexOf("[quote=", 0)>-1 && str.indexOf("[/quote]", 0)>-1){
      var intStart,intEnd;
      var strText="";
      var strAuthor="";
      var strResult="";
      var strSource=""
      intStart = str.indexOf("[quote=", 0) + 7;
      intEnd = str.indexOf("]",intStart);
      if(intStart>6 && intEnd>0){
        strAuthor = str.substr(intStart, intEnd-intStart);
      }
      intStart = intStart + strAuthor.length + 1;
      intEnd = str.indexOf("[/quote]",intStart);
      if(intEnd<=intStart) intEnd = intStart;
      if(intEnd>intStart){
        strText = str.substr(intStart, intEnd-intStart);
        var strAuthorText = strAuthor.replace(/\"/g, "");
        var quoteText = strAuthorText.length>1 ? lang["quote_from"] : lang["quote"];
        strResult = '<div class="quote"><div class="quote-title">'+quoteText+' <u>' + strAuthorText + '</u></div><div class="quote-content">' + this.toHTML(strText,"102201",baseURL) + "</div></div>";
      }
      intStart = str.indexOf("[quote=", 0);
      intEnd = str.indexOf("[/quote]", intStart) + 8;
      if(intEnd<=intStart+7) intEnd = intStart + strAuthor.length + 8;
      strSource = str.substr(intStart, intEnd-intStart);
      if(strResult!=""){
        str = str.replace(strSource, strResult);
      }else{
        str = str.replace(strSource, strSource.replace(/\[/g, "&#91;"));
      }
    }
    str=str.replace(/quote\=\\]/ig,"quote]");
    return str;
  }

  // Process [code] tag ///////////////////////////////////////////////////////
  this.formatCode=function(str){
    // Clean up string
    str=str.replace(/\[code\]/ig,"[code]");
    str=str.replace(/\[\/code\]/ig,"[/code]");
    str=str.replace(/\n\[code\]/ig,"[code]");
    str=str.replace(/\n\[\/code\]/ig,"[/code]");
    str=str.replace(/\[code\]\n/ig,"[code]");
    str=str.replace(/\[\/code\]\n/ig,"[/code]");

    while(str.indexOf("[code]", 0)>-1 && str.indexOf("[/code]", 0)>-1){
      var intStart,intEnd;
      var strText="";
      var strSource=""
      var strResult="";
      intStart = str.indexOf("[code]", 0) + 6;
      intEnd = str.indexOf("[/code]", intStart);
      if(intEnd<=intStart) intEnd = intStart;
      if(intEnd>intStart){
        strText = str.substr(intStart, intEnd-intStart);
        strResult = '<div class="code">'+ this.encUBB(strText.replace(/^ +/gm,"&nbsp;").replace(/\:\/\//g,"&#58;//")) + "</div>";
      }
      intStart = str.indexOf("[code]", 0);
      intEnd = str.indexOf("[/code]", intStart) + 7;
      if(intEnd<=intStart+6) intEnd = intStart + 7;
      strSource = str.substr(intStart, intEnd-intStart);
      if(strResult!=""){
        str = str.replace(strSource, strResult);
      }else{
        str = str.replace(strSource, strSource.replace(/\[/g, "&#91;"));
      }
    }
    return str;
  }
  
  // Process [list] tag ///////////////////////////////////////////////////
  this.formatList=function(str){
    str=str.replace(/\[list\]/ig,"[list=]");
    // Clean up string
    str=str.replace(/\[list=/ig,"[list=");
    str=str.replace(/\[\/list\]/ig,"[/list]");
    str=str.replace(/\n*\[list=/ig,"[list=");
    str=str.replace(/\n*\[\/list\]/ig,"[/list]");
    str=str.replace(/\[list=([^]]*)]\n*/ig,"[list=$1]");
    str=str.replace(/\[\/list\]\n*/ig,"[/list]");

    while(str.indexOf("[list=", 0)>-1 && str.indexOf("[/list]", 0)>-1){
      var intStart,intEnd;
      var strText="";
      var strStyle="";
      var strSource=""
      var strResult="";
      intStart = str.indexOf("[list=", 0) + 6;
      intEnd = str.indexOf("]",intStart);
      if(intStart>6 && intEnd>0){
        strStyle = str.substr(intStart, intEnd-intStart);
      }
      intStart = intStart + strStyle.length + 1;
      intEnd = str.indexOf("[/list]",intStart);
      if(intEnd<=intStart) intEnd = intStart;
      if(intEnd>intStart){
        strText = str.substr(intStart, intEnd-intStart);
        var strStyleText = strStyle=="" ? "" : ' style="list-style-type:'+strStyle.replace(/[^a-zA-Z\-]/g, "")+'"';
        strText=strText.replace(/^\[\*\](.*)(\n|)/igm,'<li>$1</li>');
        strResult='<ul class="ubb-list" '+strStyleText+'>'+strText+'</ul>';
      }
      intStart = str.indexOf("[list=", 0);
      intEnd = str.indexOf("[/list]", intStart) + 7;
      if(intEnd<=intStart+6) intEnd = intStart + strStyle.length + 7;
      strSource = str.substr(intStart, intEnd-intStart);
      if(strResult!=""){
        str = str.replace(strSource, strResult);
      }else{
        str = str.replace(strSource, strSource.replace(/\[/g, "&#91;"));
      }
    }
    str=str.replace(/list\=\]/ig,"list]");
    return str;
  }

}
</script>