<script language="JScript" runAt="server">
// Check if file is called inside LBS
var inLBS;
if(inLBS!=true){
  Response.write("Invalid Call");
  Response.End();
}
</script>
<%
//====== Comment PAGE LOGIC ==================================
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-02-26 23:57:15
//============================================================

switch(String(input["act"])){
  case "save":
    if(theCache.settings["enableComment"]==1){
      commentSave();
    }else{
      pageHeader(lang["error"]);
      redirectMessage(lang["error"], lang["comment_disabled"], lang["goback"], "javascript:window.history.back();", false, "errorbox");
    }
    break;
  case "edit":
    commentEdit(false);
    break;
  case "update":
    commentEdit(true);
    break;
  case "delete":
    commentDelete();
    break;
  default:
    // View Comment List
    pageHeader(lang["comments"]);
    commentList();
}

pageFooter();

// Output Comment List ////////////////////////////////////////////////////////
function commentList(){
  var sqlWHERE="";
  var strURLPrefix="?";
  var arrKeywords="";

  // Check current page number
  if(input["page"]){
    input["page"]=func.checkInt(input["page"]);
    if(input["page"]<=0){
      input["page"]=1;
    }
  }else{
    input["page"]=1;
  }

  // Check category id
  if(input["cat"]){
    input["cat"]=func.checkInt(input["cat"]);
    if(input["cat"]>0){
      sqlWHERE += " AND tLog.log_catID="+input["cat"];
      strURLPrefix += strURLPrefix=="?" ? "" : "&amp;";
      strURLPrefix += "cat="+input["cat"];
    }
  }

  // Check user id
  if(input["user"]){
    input["user"]=func.checkInt(input["user"]);
    if(input["user"]>0){
      sqlWHERE += " AND tComm.comm_authorID="+input["user"];
      strURLPrefix += strURLPrefix=="?" ? "" : "&amp;";
      strURLPrefix += "user="+input["user"];
    }
  }

  // Check if has search keywords
  if(input["q"]){
    arrKeywords=input["q"].split(" ");
    for(var i=0;i<input["q"].length;i++){
      if(func.lengthW(arrKeywords[i])>2){
        sqlWHERE += " AND tComm.comm_content LIKE '%"+func.checkStr(arrKeywords[i])+"%'";
      }
    }
    strURLPrefix += strURLPrefix=="?" ? "" : "&amp;";
    strURLPrefix += "q="+input["q"];
  }
  
  // Check if has highlight keywords
  if(input["hl"]){
    arrKeywords=input["hl"].split(" ");
    strURLPrefix += strURLPrefix=="?" ? "" : "&amp;";
    strURLPrefix += "hl="+input["hl"];
  }

  // Check for Hidden category display rights
  if(theUser.rights["view"]<2){
    sqlWHERE+=" AND tLog.log_mode=1";
    for(var i=0;i<theCache.categories.length;i++){
      if(theCache.categories[i].hidden) sqlWHERE+=" AND tLog.log_catid<>"+theCache.categories[i].id;
    }
  }

  // Load comments from DB
  var comments;
  var entryCount;
  var entryPerPage = theCache.settings["listEntryPerPage"];
  var strSQL = "SELECT tComm.*, tLog.log_authorID, tLog.log_title FROM [blog_Article] tLog, [blog_Comment] tComm WHERE tLog.log_id=tComm.log_id "+sqlWHERE+" ORDER BY tComm.comm_postTime DESC";
  
  comments = connBlog.query(strSQL, entryPerPage, input["page"], false);
  if(!comments){
    comments=new Array();
    entryCount=0;
  }else{
    entryCount = connBlog.recordCount;
    for(var i=0;i<comments.length;i++){
      comments[i]={ "id": comments[i]["comm_id"],
                    "log_id": comments[i]["log_id"],
                    "log_title": comments[i]["log_title"],
                    "log_authorID": comments[i]["log_authorid"],
                    "author": comments[i]["comm_author"],
                    "authorID": comments[i]["comm_authorid"],
                    "content": comments[i]["comm_content"],
                    "hidden": comments[i]["comm_hidden"],
                    "postTime": new Date(Number(comments[i]["comm_posttime"])),
                    "ubbFlags": comments[i]["comm_ubbflags"],
                    "editMark": comments[i]["comm_editmark"],
                    "IP": comments[i]["comm_ip"]
                     };
    }
  }

  // Output Comment List
  outputCommentList(comments, entryCount, entryPerPage, input["page"], input["cat"], strURLPrefix, arrKeywords);

}

// Save New Comment ///////////////////////////////////////////////////////////////////////////////
function commentSave(){
  if(theUser.rights["post"]<1||theCache.settings["enableComment"]==0||!Session("lbsSecurityCode")){
    // Check User Right - without DB Query
    pageHeader(lang["error"]);
    redirectMessage(lang["error"], lang["no_rights"], lang["goback"], "javascript:window.history.back();", false, "errorbox");
  }else if((new Date())-Session("FloodControl")<theCache.settings["minPostDuration"]*1000){
    // Check if user is banned for Spam
    Session("FloodControl")=new Date();
    pageHeader(lang["error"]);
    redirectMessage(lang["error"], lang["flood_control"], lang["goback"], "javascript:window.history.back();", false, "errorbox");
  }else{
    var strError="";
    var bCheckCode=true;

    // For guest user group
    if(!theUser.loggedIn){
      if(input["comm_register"]=="true"){
        // Do register
        input["username"]=input["comm_username"];
        input["password"]=input["comm_password"];
        input["repassword"]= input["comm_password"];
        input["email"]= "";
        input["hideemail"]= true;
        input["scode"]= input["scode"];
        var strErrorRegister=theUser.register(true);
        if(strErrorRegister!=false){
          strError+=strErrorRegister;
        }else{
          var tmpA=connBlog.query("SELECT user_id FROM [blog_User] WHERE user_name='"+func.checkStr(input["comm_username"])+"'");
          if(tmpA) theUser.id=tmpA[0]["user_id"];
        }
        bCheckCode=false; // Bypass the Security Code check below
      }else if(input["comm_password"]!=undefined&&input["comm_password"]!=""){
        // Do login
        var strErrorLogin=theUser.login(input["comm_username"],input["comm_password"],1,true,input["scode"]);
        if(strErrorLogin!=false) strError+=strErrorLogin;
        bCheckCode=false; // Bypass the Security Code check below
      }else{
        // Check Username for Guest
        if(!input["comm_username"]||!func.checkUsername(input["comm_username"])){
          strError+="<li>"+lang["username_invalid"]+"</li>";
        }else if(connBlog.query("SELECT user_id FROM [blog_User] WHERE user_name='"+func.checkStr(input["comm_username"])+"'")){
          strError+="<li>"+lang["user_exist"]+"</li>";
        }
        theUser.id=0;
        theUser.username=input["comm_username"];
      }
    }
    
    // Check for data
    strError+=checkPostData(bCheckCode, true);

    // Check for ubbFlags
    var strUbbFlags=getUbbFlags();

    if(strError!=""){
      pageHeader(lang["error"]);
      redirectMessage(lang["error"], strError, lang["goback"], "javascript:window.history.back();", false, "errorbox");
    }else{
      var arrInsert={ "log_id": input["logid"],
                      "comm_content": input["message"],
                      "comm_authorID": theUser.id,
                      "comm_author": theUser.username,
                      "comm_ubbFlags": strUbbFlags,
                      "comm_hidden": input["comm_hidden"]=="true" ? true:false,
                      "comm_postTime": new Date(),
                      "comm_ip": theUser.IP
                    };
      connBlog.insert("blog_Comment", arrInsert);
      connBlog.updateSQL("[blog_Article]","log_commentCount=log_commentCount+1", "log_id="+input["logid"]);
      connBlog.updateSQL("[blog_User]","user_commentCount=user_commentCount+1", "user_id="+theUser.id);
      connBlog.updateSQL("[blog_Settings]","set_value0=set_value0+1", "set_name='counterComment'");
      theCache.updateArticleCounter(input["logid"],"comment",1);
      theCache.updateGlobalCounter("counterComment",1);
      theCache.loadComments();

      // Clean up to avoid abuse
      Session("lbsSecurityCode")=undefined;

      // Flood Control
      Session("FloodControl")=new Date();

      // Output ok message
      pageHeader(lang["done"]);
      redirectMessage(lang["done"], lang["comment_save_done"], lang["redirect"], "article.asp?id="+input["logid"], true, "messagebox");
    }

  }
}

// Check Post Form Data -----------------------
function checkPostData(bCheckCode, bCheckArticle){

  var strError="";

  // Check Security Code
  if(theCache.settings["enableSecurityCode"]==1 && bCheckCode && Session("lbsSecurityCode")!=input["scode"]){
    strError+="<li>"+lang["scode_invalid"]+"</li>";
  }
  
  // Check content
  input["message"]=func.trim(input["message"]);
  if(!input["message"]){
    strError+="<li>"+lang["content_blank"]+"</li>";
  }else{
    if(input["message"].length>theCache.settings["maxCommentLength"]||input["message"].length<2){
      strError+="<li>"+lang["length_invalid"]+"</li>";
    }
    input["message"]=func.wordFilter(input["message"]);
    if(!input["message"]){
      strError+="<li>"+lang["wordfilter_block"]+"</li>";
    }
  }

  // Exit with error so we don't need to query the db any more
  if(strError!=""||!bCheckArticle){
    return strError;
  }

  // Check if target article exists
  var theArticle=new lbsArticle();

  input["logid"]=func.checkInt(input["logid"]);
  if(!input["logid"]){
    strError=lang["invalid_parameter"];
  }else{
    if(theArticle.load("log_catid, log_mode, log_locked","log_id="+input["logid"])){
      strError="";
    }else{
      strError=lang["article_not_found"];
    }
  }

  if(strError!=""){
    // Article not found
    return strError;
  }
  
  // Check article status for different user permissions
  if(theArticle.locked||theArticle.category.locked||
     theArticle.category.hidden&&theUser.rights["view"]<2||
     theArticle.mode==1&&theUser.rights["view"]<1||
     theArticle.mode==2&&(!theUser.loggedIn||theUser.rights["view"]<1)||
     theArticle.mode==3&&(!theUser.loggedIn||theUser.rights["view"]<2)||
     theArticle.mode==4&&(!theUser.loggedIn||theUser.rights["view"]<3)
    ){
      strError="<li>"+lang["no_rights"]+"</li>";
  }

  return strError;

}

// Get ubbFlags String -----------------------
function getUbbFlags(){
  var ubbFlags = "";
  ubbFlags+= input["e_ubb"]=="true" ? "1":"0";
  ubbFlags+= input["e_autourl"]=="true" ? "1":"0";
  ubbFlags+= "2"; // bImage - always 2
  ubbFlags+= "2"; // bMedia - always 2
  ubbFlags+= input["e_smilies"]=="true" ? "1":"0";
  ubbFlags+= "1"; // bTextBlock - always 1
  return ubbFlags;
}

// Edit Comment ///////////////////////////////////////////////////////////////////////////////////
function commentEdit(bSave){
  if(theUser.rights["edit"]<1){
    // Check User Right - without DB Query
    pageHeader(lang["error"]);
    redirectMessage(lang["error"], lang["no_rights"], lang["goback"], "javascript:window.history.back();", false, "errorbox");
  }else{
    var strError="";
    var arrData;

    input["id"]=func.checkInt(input["id"]);
    if(!input["id"]){
      strError=lang["invalid_parameter"];
    }else{
      // Check user right again
      arrData=connBlog.query("SELECT TOP 1 tLog.log_id,tLog.log_authorID,tLog.log_title,tComm.comm_authorid,tComm.comm_content,tComm.comm_ubbFlags,tComm.comm_hidden FROM [blog_Article] tLog,[blog_Comment] tComm WHERE tLog.log_id=tComm.log_id AND tComm.comm_id="+input["id"]);
      if(arrData){
        arrData=arrData[0];
        if(theUser.id!=arrData["log_authorid"]&&theUser.id!=arrData["comm_authorid"]&&theUser.rights["edit"]<2){
          strError=lang["no_rights"];
        }
      }else{
        strError=lang["comment_not_found"];
      }
    }

    if(strError!=""){
      pageHeader(lang["error"]);
      redirectMessage(lang["error"], strError, lang["goback"], "javascript:window.history.back();", false, "errorbox");
    }else{

      if(!bSave){
        // Output the Edit Form
        theCache.genSecurityCode();
        pageHeader(lang["comment"]);
        outputEditComment(lang["edit_comment_on"]+": "+arrData["log_title"], "?act=update&id="+input["id"], arrData["comm_content"], arrData["comm_ubbflags"],arrData["comm_hidden"]);
      }else{
        // Save changes
        var strError=checkPostData(true, false);
        var strUbbFlags=getUbbFlags();

        if(strError!=""){
          pageHeader(lang["error"]);
          redirectMessage(lang["error"], strError, lang["goback"], "javascript:window.history.back();", false, "errorbox");
        }else{
          var arrUpdate={ "comm_content": input["message"],
                          "comm_ubbFlags": strUbbFlags,
                          "comm_hidden": input["comm_hidden"]=="true" ? true:false,
                          "comm_ip": theUser.IP
                        };
          if(input["message"]!=arrData["comm_content"]) arrUpdate["comm_editMark"] = theUser.username + "$|$" + func.getDateTimeString();

          connBlog.update("blog_Comment", arrUpdate, "comm_id="+input["id"]);
          theCache.loadComments();

          // Clean up to avoid abuse
          Session("lbsSecurityCode")=undefined;
          // Output ok message
          pageHeader(lang["done"]);
          redirectMessage(lang["done"], lang["comment_save_done"], lang["redirect"], "article.asp?id="+arrData["log_id"], true, "messagebox");
        }
      }
    }
  }
}

// Delete Comment ///////////////////////////////////////////////////////////////////////////////////
function commentDelete(){
  if(theUser.rights["delete"]<1){
    // Check User Right - without DB Query
    pageHeader(lang["error"]);
    redirectMessage(lang["error"], lang["no_rights"], lang["goback"], "javascript:window.history.back();", false, "errorbox");
  }else{
    var strError="";
    var arrData;

    input["id"]=func.checkInt(input["id"]);
    if(!input["id"]){
      strError=lang["invalid_parameter"];
    }else{
      // Check user right again
      arrData=connBlog.query("SELECT TOP 1 tLog.log_id,tLog.log_authorID,tComm.comm_authorid FROM [blog_Article] tLog,[blog_Comment] tComm WHERE tLog.log_id=tComm.log_id AND tComm.comm_id="+input["id"]);
      if(arrData){
        arrData=arrData[0];
        if(theUser.id!=arrData["log_authorid"]&&theUser.id!=arrData["comm_authorid"]&&theUser.rights["delete"]<2){
          strError=lang["no_rights"];
        }
      }else{
        strError=lang["comment_not_found"];
      }
    }

    if(strError!=""){
      pageHeader(lang["error"]);
      redirectMessage(lang["error"], strError, lang["goback"], "javascript:window.history.back();", false, "errorbox");
    }else{
      connBlog.doDelete("[blog_Comment]","comm_id="+input["id"]);
      connBlog.updateSQL("[blog_Article]","log_commentCount=log_commentCount-1", "log_id="+arrData["log_id"]);
      connBlog.updateSQL("[blog_User]","user_commentCount=user_commentCount-1", "user_id="+arrData["comm_authorid"]);
      connBlog.updateSQL("[blog_Settings]","set_value0=set_value0-1", "set_name='counterComment'");
      theCache.updateArticleCounter(arrData["log_id"],"comment",-1);
      theCache.updateGlobalCounter("counterComment",-1);
      theCache.loadComments();

      pageHeader(lang["done"]);
      redirectMessage(lang["done"], lang["comment_delete_done"], lang["redirect"], "article.asp?id="+arrData["log_id"], true, "messagebox");
    }

  }
}
%>