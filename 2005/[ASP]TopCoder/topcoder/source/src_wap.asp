<script language="JScript" runAt="server">
// Check if file is called inside LBS
var inLBS;
if(inLBS!=true){
  Response.write("Invalid Call");
  Response.End();
}
</script>
<%
//====== WAP PAGE LOGIC =====================================
// Copyright 2005 Felix. All Rights Reserved.
// http://www.felixwoo.com
// Last Update: 2005-10-30 12:53:20
//===========================================================

//====== 变量配置 ===========================================
var cookieDays=1;				//cookie保存天数
var enablePostComment=true;		//是否允许发表评论和留言
var enablePostArticle=true;		//是否允许发表日志
var enableWAPprefix=false;		//是否在发表的内容前添加前缀标记
var WAPprefix="[WAP]";			//前缀标记内容
var commentTimeOrder=true;		//评论显示的时间顺序(true为降序,false为升序)
//===========================================================

Response.ContentType="text/vnd.wap.wml; charset=utf-8";
var sqlWHERE="";
var wap_version="3.1";
var loggedin=false;
if(Request.Cookies("wap_login")!=""){
	var wap_cookie=String(Request.Cookies("wap_login")).split(",");
	var wap_user_name=wap_cookie[0];
	var wap_user_id=wap_cookie[1];
	var wap_user_groupid=wap_cookie[2];
	var wap_user_hashkey=wap_cookie[3];
	var wap_user_rights=checkUserRights();
	checkCookies();
}else{
	var wap_user_id=0;
	var wap_user_groupid=2;
	var wap_user_hashkey="";
	var wap_user_rights=checkUserRights();
}

//获得用户权限
function checkUserRights(){
    for(var i=0;i<theCache.userGroup.length;i++){
      if(wap_user_groupid==theCache.userGroup[i].id){
        return (theCache.userGroup[i].rights);
      }
    }
}

//检查Cookie
function checkCookies(){
	if(!String(wap_user_id)||!String(wap_user_hashkey)){
	  logout(false);
	}else{
	  var intUserID=func.checkInt(wap_user_id);
	  var strHashKey=String(wap_user_hashkey);
	  var tmpA=connBlog.query("SELECT TOP 1 user_id,user_ip,user_name,user_groupID FROM [blog_User] WHERE user_id="+intUserID+" AND user_hashKey='"+func.checkStr(strHashKey)+"' AND user_hashKey<>''");
	  if(tmpA){
		if(tmpA[0]["user_ip"]!=getIP() || tmpA[0]["user_name"]!=String(wap_user_name) || tmpA[0]["user_groupid"]!=func.checkInt(wap_user_groupid)){
		  wap_user_id=tmpA[0]["user_id"];
		  logout(true);
		}else{
		  loggedin=true;
		}
	  }else{
		logout(false);
	  }
	}
}

//退出
function logout(bCleanHashKey){
	Response.Cookies("wap_login")="";
	if(bCleanHashKey){
	  connBlog.update("[blog_User]", {"user_hashKey": ""},"user_ID="+wap_user_id);
	} 
	loggedin=false;
}

//获得用户IP地址
function getIP(){
	var strIP=String(Request.ServerVariables("HTTP_X_FORWARDED_FOR")).replace(/[^0-9\.,]/g,"");
  	if(strIP.length<7) strIP=String(Request.ServerVariables("REMOTE_ADDR")).replace(/[^0-9\.,]/g,"");
  	if(strIP.indexOf(",")>7) strIP=strIP.substr(0,strIP.indexOf(","));
	return strIP;
}

//分页函数
function generatePageLinks(intEntryCount, intPageSize, intCurrentPage, intShowPages, urlPrefix, urlSuffix){
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
      output="<b> 1 </b>";
    }else{
      // First Page Link
      if(prevBound>1) output+="<a href=\"" + urlPrefix + "page=1" + urlSuffix +  "\"> &lt;&lt; </a> | \n";
      // Previous Page Link
      if(intCurrentPage>1) output+="<a href=\"" + urlPrefix + "page=" + (intCurrentPage-1) + urlSuffix + "\"> &lt; </a> | \n";
      // Process Main Portion
      for(var i=prevBound;i<=nextBound;i++){
        if(intCurrentPage==i){
          output+="<b>" + i +  "</b> | \n";
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

if(input["act"]=="login"){
    if(loggedin){
      // If user is already logged in
      response.Redirect("wap.asp");
    }else{
		var tHashKey=func.SHA1(func.randomStr(6)+func.getDateTimeString());
		var arrUpdate={ "user_IP": getIP(),
						"user_hashKey": tHashKey,
						"user_LastVisit": new Date() };
		var tmpA=connBlog.query("SELECT TOP 1 user_id,user_name,user_password,user_salt,user_groupid FROM [blog_User] WHERE user_name='"+input["username"]+"' AND user_salt<>''");
		if(tmpA){
		  tmpA=tmpA[0];
		  if(tmpA["user_password"]==func.SHA1(input["password"]+tmpA["user_salt"])){
			var tDate=new Date();
   			tDate.setTime(tDate.getTime()+cookieDays*864E5);
	        connBlog.update("[blog_User]", arrUpdate,"user_ID="+tmpA["user_id"]); 
			Response.Cookies("wap_login")=tmpA["user_name"]+","+tmpA["user_id"]+","+tmpA["user_groupid"]+","+tHashKey;
			Response.Cookies("wap_login").Expires=tDate.getVarDate();
			response.Redirect("wap.asp");
		  }else{
			Response.Cookies("wap_login")="";
			outputMessage(func.HTMLEncode(lang["login_fail"]));
		  }
		}else{
			Response.Cookies("wap_login")="";
			outputMessage(func.HTMLEncode(lang["user_not_found"]));
		}
    }
}
if(input["act"]=="logout"){
	if(loggedin){
		logout(true);
	}else{
		logout(false);
	}
	response.Redirect("wap.asp");
}
if(input["act"]=="post"){
	if(func.trim(input["username"])=="" || func.trim(input["content"])=="")
		outputMessage(func.HTMLEncode(lang["error"]));
	var username=loggedin?wap_user_name:func.trim(input["username"]);
	var wap_content=enableWAPprefix?(WAPprefix+func.trim(input["content"])):func.trim(input["content"]);
	if(!loggedin){
		var tmpA=connBlog.query("SELECT TOP 1 user_name FROM [blog_User] WHERE user_name='"+func.trim(input["username"])+"' AND user_salt<>''");
		if(tmpA){
			outputMessage(lang["user_exist"]);}
	}

	if(input["postwhat"]=="comment" && enablePostComment && wap_user_rights["post"]>0)
	{
      var arrInsert={ "log_id": input["logid"],
                      "comm_content": wap_content,
                      "comm_authorID": wap_user_id,
                      "comm_author": username,
                      "comm_ubbFlags": "112211",
                      "comm_hidden": input["comm_hidden"]=="true" ? true:false,
                      "comm_postTime": new Date(),
                      "comm_ip": getIP()
                    };
      connBlog.insert("blog_Comment", arrInsert);
      connBlog.updateSQL("[blog_Article]","log_commentCount=log_commentCount+1", "log_id="+input["logid"]);
      connBlog.updateSQL("[blog_User]","user_commentCount=user_commentCount+1", "user_id="+wap_user_id);
      connBlog.updateSQL("[blog_Settings]","set_value0=set_value0+1", "set_name='counterComment'");
      theCache.updateArticleCounter(input["logid"],"comment",1);
      theCache.updateGlobalCounter("counterComment",1);
      theCache.loadComments();
      theCache.loadArticles();
	  response.Redirect("?q="+input["logid"]+"&comment=1&page=1");
	 } else	if(input["postwhat"]=="article" && enablePostArticle && wap_user_rights["post"]>1)
	{
		var arrInsert={ "log_catID": input["category"],
						"log_authorID": wap_user_id,
						"log_author": wap_user_name,
						"log_title": input["title"],
						"log_content0": wap_content,
						"log_content1": "",
						"log_ip": getIP(),
						"log_trackbackURL": "",
						"log_mode": input["log_mode"],
						"log_postTime": new Date(),
						"log_locked": false,
						"log_selected": false,
						"log_ubbFlags": "111111"
						};
		connBlog.insert("[blog_Article]", arrInsert);
		connBlog.updateSQL("[blog_Settings]","set_value0=set_value0+1", "set_name='counterArticle'");
		theCache.updateGlobalCounter("counterArticle",1);
		connBlog.updateSQL("[blog_User]","user_articleCount=user_articleCount+1", "user_id="+wap_user_id);
		connBlog.updateSQL("[blog_Category]","cat_articleCount=cat_articleCount+1", "cat_id="+input["category"]);
		theCache.loadArticles();
		theCache.loadCategories();
		theCache.loadCalendar();
		response.Redirect("wap.asp?q=article");
	 } else	if(input["postwhat"]=="guestbook" && enablePostComment && wap_user_rights["post"]>0)
	 {
		var connGBook=new DBConn(gbookDB);
		connGBook.open();
		var arrInsert={ "gb_content": wap_content,
						"gb_userid": wap_user_id,
						"gb_username": username,
						"gb_ubbFlags": "112211",
						"gb_hidden": input["comm_hidden"]=="true" ? true:false,
						"gb_postTime": new Date(),
						"gb_ip": getIP()
					};
		connGBook.insert("guestbook", arrInsert);
		connGBook.close();
		response.Redirect("wap.asp?q=guestbook");
	 } else {
	 	outputMessage(func.HTMLEncode(lang["no_rights"]));
	 }
}
if(input["q"]=="login"){
	outputLogin();
}
if(input["q"]=="comment"){
  // Output Comments
  var comments;
  comments=theCache.recentComments;
  outputComment(comments,null,"wap.asp",null,null,null);
}
if(input["q"]=="article"){
  // Output Articles List
  var articles;
  articles=theCache.recentArticles;
  outputArticles(articles);
}
if(input["q"]=="stat")
{
  // Output Stats Page
    outputStat();
}
if(input["q"]=="guestbook")
{
  // Output GuestBook
  var entryCount=0;
  var connGBook=new DBConn(gbookDB);
  connGBook.open();
  var entries = connGBook.query("SELECT TOP 10 * FROM [Guestbook] ORDER BY gb_postTime DESC");
  connGBook.close();
  if(entries){
    for(var i=0;i<entries.length;i++){
      var arrEntry={"id": entries[i]["gb_id"],
                   "userid": entries[i]["gb_userid"],
                   "username": entries[i]["gb_username"],
                   "content": entries[i]["gb_content"],
                   "ubbFlags": entries[i]["gb_ubbflags"],
                   "postTime": new Date(Number(entries[i]["gb_posttime"])),
                   "reply": entries[i]["gb_reply"],
                   "replyTime": new Date(Number(entries[i]["gb_replytime"])),
                   "replyUsername": entries[i]["gb_replyusername"],
                   "hidden": entries[i]["gb_hidden"]};
      entries[i]="";
      entries[i]=arrEntry;
    }
    entryCount = connGBook.recordCount;
  }else{
    entries="";
    entryCount = 0;
  }
  outputGuestBook(entries, entryCount);
}
if(input["q"]==null && input["p"]==null && input["act"]==null)
{
  // Output WAP Index Page
    outputIndex();
}
if(input["q"]>=0 && input["act"]=="showPostComment")
{
  outputPost(input["q"],"comment","wap.asp?q="+input["q"]+"&amp;comment=1");
}
if(input["act"]=="showPostArticle" && loggedin)
{
  outputPost(0,"article","wap.asp?q=article");
}
if(input["act"]=="showPostGuestbook")
{
  outputPost(0,"guestbook","wap.asp?q=guestbook");
}
if(input["q"]>=0 && input["comment"]==1 && input["page"]!=null)
{
  // Output Comments
  var bWithTrackBack=false;
  var intTrackbackPos=theCache.settings["showTrackbackPosition"];
  var intPageSize=theCache.settings["commentPerPage"];
  
  // Check current page number
  if(input["page"]){
	input["page"]=func.checkInt(input["page"]);
	if(input["page"]<=0){
	  input["page"]=1;
	}
  }else{
	input["page"]=1;
  }

  var tArticle=new lbsArticle();
  tArticle.id=input["q"];
  var intEntryCount=tArticle.loadComments(commentTimeOrder, bWithTrackBack, intTrackbackPos, intPageSize, 1);
  outputComment(tArticle.comments,input["q"],"wap.asp?q="+input["q"],intEntryCount,intPageSize,input["page"]);
}
if(input["q"]>=0 && input["comment"]==null && input["act"]==null)
{
  // Output article
	var article;
	var page;
	page = input["p"]==null?0:input["p"];
	sqlWHERE += " AND tLog.log_id="+input["q"];
	var strSQL = "SELECT TOP 1 tLog.log_id, tLog.log_catid, tLog.log_title, tLog.log_authorid, tLog.log_author, tLog.log_mode, tLog.log_ubbFlags, tLog.log_postTime, tLog.log_content0, tLog.log_content1, tLog.log_commentCount FROM [blog_Article] tLog WHERE tLog.log_mode=1"+sqlWHERE+" ORDER BY tLog.log_postTime DESC";
	article = connBlog.query(strSQL);
	if(!article) article="";
	outputArticle(article,page);
}
%>