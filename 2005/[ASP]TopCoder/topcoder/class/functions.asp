<script language="JScript" runAt="server">
// Check if file is called inside LBS
var inLBS;
if(inLBS!=true){
  Response.write("Invalid Call");
  Response.End();
}

//====== CLASS lbsFunc =======================================
// Global Function wrapper
//
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-06-17 14:42:53
//============================================================

function lbsFunc(){
  this.version = 1;

  // Process Request & Post Data function ---------------------
  this.getInput = function(){
    var input=new Array();
    var e=new Enumerator(Request.QueryString);
    for (;!e.atEnd();e.moveNext()){
      x=e.item();
      input[String(x).toLowerCase()]=String(Request.QueryString(x));
    }
    e=new Enumerator(Request.Form);
    for (;!e.atEnd();e.moveNext()){
      x=e.item();
      input[String(x).toLowerCase()]=String(Request.Form(x));
    }
    return input;
  }

  // HTMLEncode String -----------------------------------------
  this.HTMLEncode = function(str){
    if(str==undefined){ return ""; }
		str = str.replace(/\&/g, "&amp;");
		str = str.replace(/\>/g, "&gt;");
		str = str.replace(/\</g, "&lt;");
	  str = str.replace(/\t/g, "&nbsp;&nbsp;");
		str = str.replace(/\"/g, "&quot;");
		str = str.replace(/\'/g, "&#39;");
		str = str.replace(/\n/g, "<br />");
    return str;
  }

  // HTMLEncode For Textarea -----------------------------------
  this.HTMLEncodeLite = function(str){
    if(str==undefined){ return ""; }
		str = str.replace(/\&/g, "&amp;");
		str = str.replace(/\>/g, "&gt;");
		str = str.replace(/\</g, "&lt;");
		str = str.replace(/\"/g, "&quot;");
		str = str.replace(/\'/g, "&#39;");
    return str;
  }

  // URL Encode -----------------------------------
  this.URLEncode = function(str){
    if(str==undefined){ return ""; }
    str = str.replace(/\&amp\;/ig,"&");
		str = str.replace(/\&/g, "&amp;");
		str = str.replace(/\>/g, "&gt;");
		str = str.replace(/\</g, "&lt;");
		str = str.replace(/\"/g, "&quot;");
		str = str.replace(/\'/g, "&#39;");
		str = str.replace(/\[/g, "&#91;");
		str = str.replace(/\]/g, "&#93;");
    return str;
  }

  // String Length with Double Bytes Language Support ----------
  this.lengthW = function(str){
    if(str==undefined){ return 0; }
    var tLen=0;
    for(var i=0;i<str.length;i++){
      charCode=str.charCodeAt(i);
      if(charCode<0||charCode>255){ tLen+=2 }else{ tLen++ }
    }
    return tLen;
  }

  // Cut Long String -------------------------------------------
  this.cutString = function(str, outputLen){
    var strLen,tLen, charCode;
    if(str==undefined){ return ""; }
    strLen=str.length;
    tLen=0;
    for(var i=0;i<strLen;i++){
      charCode=str.charCodeAt(i);
      if(charCode<0||charCode>255){ tLen+=2 }else{ tLen++ }
      if(tLen>=outputLen){ return str.substr(0,i)+"..."; }
    }
    return str;
  }

  // Trim String -----------------------------------------------
  this.trim = function(str){
    // Trim Extra Spaces & Newlines
    if(str==undefined){ return ""; }
    str=str.replace(/(^\s*|\s*$)/g,"");
    str=str.replace(/(\r*\n){3,}/g,"\n\n");
    str=str.replace(/\r/g,"");

    return str;
  }

  // Convert String to RegExp compatible -----------------------------------------------
  this.stringToRegExp = function(str){
    if(str==undefined){ return ""; }
    str=str.replace(/\\/g,"\\");
    str=str.replace(/\^/g,"\\^");
    str=str.replace(/\*/g,"\\*");
    str=str.replace(/\?/g,"\\?");
    str=str.replace(/\+/g,"\\+");
    str=str.replace(/\./g,"\\.");
    str=str.replace(/\|/g,"\\|");
    str=str.replace(/\[/g,"\\[");
    str=str.replace(/\]/g,"\\]");
    str=str.replace(/\(/g,"\\(");
    str=str.replace(/\)/g,"\\)");
    str=str.replace(/\{/g,"\\{");
    str=str.replace(/\}/g,"\\}");
    return str;
  }

  // Highlight String -----------------------------------------------
  this.highlight = function(str, arrKeywords){
    if(str==undefined||arrKeywords==undefined){ return ""; }
    
    // Generate Keyword RegExp String - We need to duplicate the original keyword array here
    var reStr=arrKeywords.join("$,$");
    reStr=reStr.split("$,$");
    for(var i=0;i<reStr.length;i++){
      if(func.lengthW(reStr[i])<3){
        reStr.splice(i,1);
        i--;
      }else{
        reStr[i]=this.stringToRegExp(reStr[i]);
      }
    }
    reStr=new RegExp("("+reStr+")","ig");

    var re=new RegExp("(\>|^)(.*?)(\<|$)","igm");
    while ((arrMatch = re.exec(str)) != null){
      var newStr=arrMatch[1]+arrMatch[2].replace(reStr,'<span class="highlight">'+"$1"+'</span>')+arrMatch[3];
      str=str.replace(arrMatch[0],newStr);
      re.lastIndex+=newStr.length-arrMatch[0].length;
    }

    return str;
  }

  // Trim HTML Tags --------------------------------------------
  this.trimHTML = function(str){
    if(str==undefined){ return ""; }
    str=str.replace(/\<[^\<\>]+\>/g,"");
    str=str.replace(/ +/g," ");

    return str;
  }

  // Trim UBB Tags --------------------------------------------
  this.trimUBB = function(str){
    if(str==undefined){ return ""; }
    str=str.replace(/\[quote([^\[\]]+|)\](\n*)(\s*)/ig,"\"");
    str=str.replace(/(\s*)(\n*)\[\/quote\]/ig,"\"");
    str=str.replace(/\[code\](\n*)(\s*)/ig,"\"");
    str=str.replace(/(\s*)(\n*)\[\/code\]/ig,"\"");
    str=str.replace(/\[hr\]/g,"\n------\n");
    str=str.replace(/\[(\/|)(b|i|u|s|sup|sub|url[^\]]*|align[^\]]*|size[^\]]*|color[^\]]*|font[^\]]*|list[^\]]*|email[^\]]*|img[^\]]*|swf[^\]]*|wmp[^\]]*|qt[^\]]*|rm[^\]]*)\]/ig,"");
    str=str.replace(/\[\*\]/g,"*");
    str=str.replace(/ +/g," ");

    return str;
  }

  // Clean HTML Tags --------------------------------------------
  this.cleanHTML = function(str){
    var re=new RegExp("\<scr"+"ipt([^\<\>]+)\>","ig");
    str=str.replace(re,"&lt;script$1&gt;");
    re=new RegExp("\<\/scr"+"ipt\>","ig");
    str=str.replace(re,"&lt;/script&gt;");
    delete re;

    str=str.replace(/\<iframe(\/| \/|)\>/ig,"&lt;iframe$1&gt;");
    str=str.replace(/\<\/iframe\>/ig,"&lt;/iframe&gt;");

    str=str.replace(/\<br(\/| \/|)\>/ig,"<br/>");

    return str;
  }

  // Close HTML Tags --------------------------------------------
  this.closeHTML = function(str){
    var arrTags=["p","div","span","table","ul","font","b","u","i","h1","h2","h3","h4","h5","h6"];

    for(var i=0;i<arrTags.length;i++){
      var intOpen=0;
      var intClose=0;

      var	re=new RegExp("\\<"+arrTags[i]+"( [^\\<\\>]+|)\\>","ig");
      var arrMatch=str.match(re);
      if(arrMatch!=null) intOpen=arrMatch.length;

      re=new RegExp("\\<\\/"+arrTags[i]+"\\>","ig");
      arrMatch=str.match(re);
      if(arrMatch!=null) intClose=arrMatch.length;

      for(var j=0;j<intOpen-intClose;j++){
        str+="</"+arrTags[i]+">";
      }
    }

    return str;
  }

  // Close UBB Tags --------------------------------------------
  this.closeUBB = function(str){
    var arrTags=["code","quote","list","color","align","font","size","b"];

    for(var i=0;i<arrTags.length;i++){
      var intOpen=0;
      var intClose=0;

      var	re=new RegExp("\\["+arrTags[i]+"(=[^\\[\\]]+|)\\]","ig");
      var arrMatch=str.match(re);
      if(arrMatch!=null) intOpen=arrMatch.length;

      re=new RegExp("\\[\\/"+arrTags[i]+"\\]","ig");
      arrMatch=str.match(re);
      if(arrMatch!=null) intClose=arrMatch.length;

      for(var j=0;j<intOpen-intClose;j++){
        str+="[/"+arrTags[i]+"]";
      }
    }

    return str;
  }

  // Check String for SQL Query --------------------------------
  this.checkStr = function(str){
    str=str.replace(/\'/g,"''");
    str=str.replace(/\r/g,"");
    str=str.replace(/(wh)(ere)/ig,"$1'+'$2");

    return str;
  }

  // Check Int -------------------------------------------------
  // Convert String to Int
  this.checkInt = function(intStr){
    if(!intStr){ return 0; }
    intStr=parseInt(intStr,10);
    if(isNaN(intStr)){ return 0; }

    return intStr;
  }

  // Check Username -------------------------------------------
  this.checkUsername = function(str){
    if(typeof(str)!="string"){ return false; }
    if(this.lengthW(str)<3||str.length>24){ return false; }
    if(str.search(/[^\w\u3400-\u4DBF\u4E00-\u9FAF]/)!=-1){
      return false;
    }
    return true;
  }

  // Check Password -------------------------------------------
  this.checkPassword = function(str){
    if(str==undefined){ return false; }
    if(str.length<6||str.length>16){ return false; }
    if(str.search(/[^\x20-\x7e]/g)!=-1){
      return false;
    }
    return true;
  }

  // Check Email ----------------------------------------------
  this.checkEmail = function(str){
    if(str==undefined){ return false; }
    if(str.length<6||str.length>50){ return false; }
    var m;
    if((m=str.match(/[\w\[\]\@\(\)\.]+\.+[A-Za-z]{2,4}/g)) != null){
      if(m[0]==str) return true;
    }
    return false;
  }

  // Check URL ----------------------------------------------
  this.checkURL = function(str){
    str = str.replace(/document\.cookie/ig, "document cookie");
    str = str.replace(/document\.write/ig, "document write");
    str = str.replace(/javascript:/ig, "javascript ");
    str = str.replace(/jscript:/ig, "jscript ");
    str = str.replace(/vbscript:/ig, "vbscript ");
    str = str.replace(/\<|\>/ig, " ");
    return str;
  }

  // Word Filter ----------------------------------------------
  this.wordFilter = function(str){
    if(str==undefined){ return false; }
    if(str.length<3){ return str; }
    for(var i=0;i<theCache.wordFilter.length;i++){
      with(theCache.wordFilter[i]){
        var ctext= isRegExp ? text :this.stringToRegExp(text);
        ctext=new RegExp(ctext,"gi");
        if(mode==0){
          str=str.replace(ctext,replace);
        }else{
          if(str.search(ctext)>-1){
            return false;
          }
        }
      }
    }
    return str;
  }

  // Random String Generator ----------------------------------
  this.randomStr = function(intLength, strSeed){
  	if(strSeed==undefined){strSeed = "abcdefghijklmnopqrstuvwxyz1234567890";}
    var seedLength=strSeed.length;
    var str="";
    for(var i=0;i<intLength;){
      var pos=Math.round((Math.random()*seedLength));
      if(pos>=0&&pos<seedLength){
        str+=strSeed.charAt(pos);
        i++;
      }
    }
    return str;
  }

  // The SHA1 function ----------------------------------------
  this.SHA1 = function(str){
    var inLBS=true;
    </script>
    <!--#include file="sha1.asp"-->
    <script language="JScript" runAt="server">
    return SHA1(str);
  }

  // The MD5 function -----------------------------------------
  this.MD5 = function(str){
    var inLBS=true;
    </script>
    <!--#include file="md5.asp"-->
    <script language="JScript" runAt="server">
    return MD5(str);
  }

  // DateTime Output function ---------------------------------
  // YY: Full Year                yy: Short Year
  // MM: Numberic Month with 0    mm: Numberic Month
  //  M: Month Name                m: Short Month Name
  // DD: Numberic Date with 0     dd: Numberic Date
  //  W: Weekday Name              w: Short Weekday Name
  // hh: Numberic Hour with 0     HH: Numberic Hour
  //  h: 12 Hour Format with 0     H: 12 Hour Format
  // ii: Numberic Minute with 0   II: Numberic Minute
  // ss: Numberic Second with 0   SS: Numberic Second
  //  Z: Full TimeZone Offset      z: Short TimeZone Offset
  // ZZ: Full  Offset with "Z"    zz: Short Offset with "Z"
  this.getDateTimeString = function(strFormat, objDate, bEnglishNames){
    var t=new Array();
    t["weekday_0"]="Sunday";
    t["weekday_1"]="Monday";
    t["weekday_2"]="Tuesday";
    t["weekday_3"]="Wednesday";
    t["weekday_4"]="Thursday";
    t["weekday_5"]="Friday";
    t["weekday_6"]="Saturday";
    t["weekday_abbr_0"]="Sun";
    t["weekday_abbr_1"]="Mon";
    t["weekday_abbr_2"]="Tue";
    t["weekday_abbr_3"]="Wed";
    t["weekday_abbr_4"]="Thu";
    t["weekday_abbr_5"]="Fri";
    t["weekday_abbr_6"]="Sat";
    t["month_1"]="January";
    t["month_2"]="February";
    t["month_3"]="March";
    t["month_4"]="April";
    t["month_5"]="May";
    t["month_6"]="June";
    t["month_7"]="July";
    t["month_8"]="August";
    t["month_9"]="September";
    t["month_10"]="October";
    t["month_11"]="November";
    t["month_12"]="December";
    t["month_abbr_1"]="Jan";
    t["month_abbr_2"]="Feb";
    t["month_abbr_3"]="Mar";
    t["month_abbr_4"]="Apr";
    t["month_abbr_5"]="May";
    t["month_abbr_6"]="Jun";
    t["month_abbr_7"]="Jul";
    t["month_abbr_8"]="Aug";
    t["month_abbr_9"]="Sep";
    t["month_abbr_10"]="Oct";
    t["month_abbr_11"]="Nov";
    t["month_abbr_12"]="Dec";

    if(objDate==undefined){
      objDate=new Date();
    }
    if(strFormat==undefined||strFormat==""){
      strFormat="YY-MM-DD hh:ii:ss";
    }
    var tYear=objDate.getFullYear();
    var tMonth=objDate.getMonth()+1;
    var tDate=objDate.getDate();
    var tDay=objDate.getDay();
    var tHour=objDate.getHours();
    var tHour12= tHour>12 ? tHour-12 : tHour;
    var tMinute=objDate.getMinutes();
    var tSecond=objDate.getSeconds();
    var tAMPM= tHour>12 ? "PM" : "AM";
    var tZone=objDate.getTimezoneOffset();
    if(tZone==0){
      tZone="Z";
    }else{
      tZone = Math.abs(Math.round(tZone/60));
      tZone = (objDate.getTimezoneOffset() <0 ? "+":"-") + (tZone<10 ? "0"+tZone : tZone);
    }

    // Year
    strFormat=strFormat.replace(/([^\\]|^)YY/g, "$1"+tYear);
    strFormat=strFormat.replace(/([^\\]|^)yy/g, "$1"+tYear.toString().substr(0,2));
    // Month
    if(tMonth<10){
      strFormat=strFormat.replace(/([^\\]|^)MM/g,"$1"+"0"+tMonth);
    }else{
      strFormat=strFormat.replace(/([^\\]|^)MM/g,"$1"+tMonth);
    }
    strFormat=strFormat.replace(/([^\\]|^)mm/g,"$1"+tMonth);
    // Date
    if(tDate<10){
      strFormat=strFormat.replace(/([^\\]|^)DD/g,"$1"+"0"+tDate);
    }else{
      strFormat=strFormat.replace(/([^\\]|^)DD/g,"$1"+tDate);
    }
    strFormat=strFormat.replace(/([^\\]|^)dd/g,"$1"+tDate);
    // Hour
    if(tHour<10){
      strFormat=strFormat.replace(/([^\\]|^)hh/g,"$1"+"0"+tHour);
    }else{
      strFormat=strFormat.replace(/([^\\]|^)hh/g,"$1"+tHour);
    }
    strFormat=strFormat.replace(/([^\\]|^)HH/g,"$1"+tHour);
    strFormat=strFormat.replace(/([^\\]|^)H/g,"$1"+tHour12);
    strFormat=strFormat.replace(/([^\\]|^)h/g,"$1"+(tHour12<10 ? "0"+tHour12 : tHour12));
    // Minute
    if(tMinute<10){
      strFormat=strFormat.replace(/([^\\]|^)ii/g,"$1"+"0"+tMinute);
    }else{
      strFormat=strFormat.replace(/([^\\]|^)ii/g,"$1"+tMinute);
    }
    strFormat=strFormat.replace(/([^\\]|^)II/g,"$1"+tMinute);
    // second
    if(tSecond<10){
      strFormat=strFormat.replace(/([^\\]|^)ss/g,"$1"+"0"+tSecond);
    }else{
      strFormat=strFormat.replace(/([^\\]|^)ss/g,"$1"+tSecond);
    }
    strFormat=strFormat.replace(/([^\\]|^)SS/g,"$1"+tSecond);
    // AM PM
    strFormat=strFormat.replace(/([^\\]|^)A/g,"$1"+tAMPM);
    strFormat=strFormat.replace(/([^\\]|^)a/g,"$1"+tAMPM.toLowerCase());
    // Time Zone Offset
    strFormat=strFormat.replace(/([^\\]|^)Z/g,"$1"+tZone+"00");
    strFormat=strFormat.replace(/([^\\]|^)z/g,"$1"+tZone);
    // Month & Weekday Names
    if(bEnglishNames){
      strFormat=strFormat.replace(/([^\w]|^)M([^\w]|$)/g,"$1"+t["month_"+tMonth]+"$2");
      strFormat=strFormat.replace(/([^\w]|^)m([^\w]|$)/g,"$1"+t["month_abbr_"+tMonth]+"$2");
      strFormat=strFormat.replace(/([^\w]|^)W([^\w]|$)/g,"$1"+t["weekday_"+tDay]+"$2");
      strFormat=strFormat.replace(/([^\w]|^)w([^\w]|$)/g,"$1"+t["weekday_abbr_"+tDay]+"$2");
    }else{
      strFormat=strFormat.replace(/([^\w]|^)M([^\w]|$)/g,"$1"+lang["month_"+tMonth]+"$2");
      strFormat=strFormat.replace(/([^\w]|^)m([^\w]|$)/g,"$1"+lang["month_abbr_"+tMonth]+"$2");
      strFormat=strFormat.replace(/([^\w]|^)W([^\w]|$)/g,"$1"+lang["weekday_"+tDay]+"$2");
      strFormat=strFormat.replace(/([^\w]|^)w([^\w]|$)/g,"$1"+lang["weekday_abbr_"+tDay]+"$2");
    }

    return strFormat;
  }

  // Parse DateTime String "2005-05-10 11:18:45" ---------------------------------
  this.parseDateTime = function(strDateTime){
    var theDate=new Date();
    var iNum=0;
    var strDate;
    var strTime;

    strDateTime=strDateTime.split(" ");
    if(strDateTime.length==2){
      strDate=strDateTime[0];
      strTime=strDateTime[1];
    }else if(strDateTime.length=1){
      strDate=strDateTime[0];
      strTime="";
    }else{
      return null;
    }

    strDate=strDate.split("-");
    if(strDate.length!=3){
      return null;
    }else{
      iNum=parseInt(strDate[0],10);
      if(iNum!=NaN) theDate.setFullYear(iNum);
      iNum=parseInt(strDate[1],10);
      if(iNum!=NaN) theDate.setMonth(iNum-1);
      iNum=parseInt(strDate[2],10);
      if(iNum!=NaN) theDate.setDate(iNum);
    }

    strTime=strTime.split(":");
    if(strTime.length==3){
      iNum=parseInt(strTime[0],10);
      if(iNum!=NaN) theDate.setHours(iNum);
      iNum=parseInt(strTime[1],10);
      if(iNum!=NaN) theDate.setMinutes(iNum);
      iNum=parseInt(strTime[2],10);
      if(iNum!=NaN) theDate.setSeconds(iNum);
    }
    
    return theDate;
  }

  // Generate Page Links -------------------------------------------------
  this.generatePageLinks = function(intEntryCount, intPageSize, intCurrentPage, intShowPages, urlPrefix, urlSuffix){
    var maxPage=Math.floor((intEntryCount-1)/intPageSize)+1;
    var output="";
    urlPrefix += urlPrefix=="?" ? "" : "&amp;";
    if(urlSuffix==undefined) urlSuffix="";

    //intShowPages=(intShowPages%2==1)? intShowPages+1 : intShowPages; // Should be Even Number

    // Calculate Page Bounds
    var prevBound=intCurrentPage-Math.floor(intShowPages/2);
    var nextBound=intCurrentPage+Math.floor(intShowPages/2);
    if(prevBound<=0){
      prevBound=1;
      nextBound=intShowPages;
    }
    if(nextBound>maxPage){
      nextBound=maxPage;
      prevBound=maxPage-intShowPages;
    }
    if(prevBound<=0) prevBound=1;

    if(maxPage==1){
      output="<span class=\"pagelink-current\"> 1 </span>";
    }else{
      // First Page Link
      if(prevBound>1) output+="<a href=\"" + urlPrefix + "page=1" + urlSuffix +  "\"> &lt;&lt; </a> | \n";
      // Previous Page Link
      if(intCurrentPage>1) output+="<a href=\"" + urlPrefix + "page=" + (intCurrentPage-1) + urlSuffix + "\"> &lt; </a> | \n";
      // Process Main Portion
      for(var i=prevBound;i<=nextBound;i++){
        if(intCurrentPage==i){
          output+="<span class=\"pagelink-current\">" + i +  "</span> | \n";
        }else if(i<=maxPage){
          output+="<a href=\"" + urlPrefix + "page=" + i + urlSuffix  + "\"> " + i + " </a> | \n";
        }
      }
      // Next Page Link
      if(intCurrentPage<maxPage) output+="<a href=\"" + urlPrefix + "page=" + (intCurrentPage+1) + urlSuffix  + "\"> &gt; </a>\n";
      // Last Page Link
      if(nextBound<maxPage) output+=" | <a href=\"" + urlPrefix + "page=" + maxPage + urlSuffix  + "\"> &gt;&gt; </a>\n";
    }
    return output;
  }
}
</script>
