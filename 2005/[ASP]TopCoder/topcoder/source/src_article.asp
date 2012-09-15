<script language="JScript" runAt="server">
// Check if file is called inside LBS
var inLBS;
if(inLBS!=true){
  Response.write("Invalid Call");
  Response.End();
}
</script>
<%
//====== Article PAGE LOGIC ==================================
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-05-07 11:21:17
//============================================================

switch(String(input["act"])){
  case "new":
    articleNew(false);
    break;
  case "save":
    articleNew(true);
    break;
  case "edit":
    articleEdit(false);
    break;
  case "update":
    articleEdit(true);
    break;
  case "delete":
    articleDelete();
    break;
  default:
    articleView();
}

pageFooter();


// View Article Rountines ----------------------
function articleView(){
  var theArticle=new lbsArticle();
  var strError=theArticle.loadByID(input["id"]);
  if(strError!=false){
    pageHeader(lang["error"]);
    redirectMessage(lang["error"], strError, lang["goback"], "javascript:window.history.back();", false, "errorbox");
  }else{
    if(!theUser.checkViewPermission(theArticle)){
      pageHeader(lang["error"]);
      redirectMessage(lang["error"], lang["no_rights_view"], lang["goback"], "javascript:window.history.back();", false, "errorbox");
    }else{
      theCache.genSecurityCode();
      
      // Load article data
      theArticle.loadSideArticle();

      // Load Comments data
      var bTimeOrder=theCache.settings["commentTimeOrder"]==1 ? true : false;
      var bWithTrackBack=theCache.settings["showTrackbackWithComment"]==1 ? true : false;
      var intTrackbackPos=theCache.settings["showTrackbackPosition"];
      var intPageSize=theCache.settings["commentPerPage"];
      var intEntryCount=0;
      
      // Check current page number
      if(input["page"]){
        input["page"]=func.checkInt(input["page"]);
        if(input["page"]<=0){
          input["page"]=1;
        }
      }else{
        input["page"]=1;
      }

      intEntryCount=theArticle.loadComments(bTimeOrder, bWithTrackBack, intTrackbackPos, intPageSize, input["page"]);

      // Generate the calendar for that month
      if(theCache.settings["enableDynamicCalendar"]==1&&(theArticle.postTime.getMonth()!=(new Date()).getMonth())){
        theCache.calendarHTML = theCache.generateCalendar(theArticle.postTime.getFullYear(), theArticle.postTime.getMonth()+1);
      }

      connBlog.updateSQL("[blog_Article]","log_viewCount=log_viewCount+1", "log_id="+theArticle.id);
      theCache.updateArticleCounter(theArticle.id,"view",1);

      pageHeader(theArticle.title);
      outputArticle(theArticle, intEntryCount, intPageSize, input["page"]);
    }
  }
}

// New Article Rountines ----------------------
function articleNew(bSaveFlag){
  if(theUser.rights["post"]<2){
    // Check User Right - without DB Query
    pageHeader(lang["error"]);
    redirectMessage(lang["error"], lang["no_rights"], lang["goback"], "javascript:window.history.back();", false, "errorbox");
  }else{
    var theArticle=new lbsArticle();
    // Fill Blank Data

    if(!bSaveFlag){
      theArticle.ubbFlags="111111";
      // Output Edit Form
      pageHeader(lang["new_article"]);
      outputForm(lang["new_article"]+" ["+lang["author"]+": "+theUser.username+"]", "?act=save", theArticle, false);
    }else{
      // Save Changes
      var strError=theArticle.fillFromPost(false);
      if(strError!=false){
        pageHeader(lang["error"]);
        redirectMessage(lang["error"], strError, lang["goback"], "javascript:window.history.back();", false, "errorbox");
      }else{
        // Insert new article
        theArticle.insert();
        
        var strDone=lang["save_done"];
        var bAutoRedirect=true;

        // Do trackback if requested
        if(theArticle.trackbackURL!="" && theCache.settings["enableTrackbackOut"]==1 && theArticle.mode==1){
          var	tmpA=connBlog.query("SELECT TOP 1 log_ID FROM blog_Article WHERE log_authorID="+theUser.id+" AND log_trackbackURL='"+theArticle.trackbackURL+"' ORDER BY log_postTime DESC");
          if(tmpA){
            theArticle.id=tmpA[0]["log_id"];
            delete tmpA;

            var tbError = doTrackback(theArticle.trackbackURL,
                                      theCache.settings["baseURL"]+"?id="+theArticle.id,
                                      theArticle.title,
                                      theArticle.content0,
                                      theCache.settings["blogTitle"]);
						if(tbError==""){
              strDone+="<br />"+lang["trackback_done"];
            }else{
              strDone+="<br /><font color=\"red\">"+lang["trackback_error"]+": "+tbError+"</font>";
              bAutoRedirect=false;
						}
          }
				}

        // Update counters
        connBlog.updateSQL("[blog_User]","user_articleCount=user_articleCount+1", "user_id="+theUser.id);
        connBlog.updateSQL("[blog_Category]","cat_articleCount=cat_articleCount+1", "cat_id="+theArticle.categoryID);
        theCache.loadArticles();
        theCache.loadCategories();
        theCache.loadCalendar();

        // Output Message
        pageHeader(lang["done"]);
        redirectMessage(lang["done"], strDone, lang["redirect"], "default.asp", bAutoRedirect, "messagebox");
      }
    }
  }
}

// Edit Article Rountines ----------------------
function articleEdit(bSaveFlag){
  if(theUser.rights["edit"]<1){
    // Check User Right - without DB Query
    pageHeader(lang["error"]);
    redirectMessage(lang["error"], lang["no_rights"], lang["goback"], "javascript:window.history.back();", false, "errorbox");
  }else{
    var theArticle=new lbsArticle();
    var strError=false;

    if(bSaveFlag){
      // Use a simple query when save changes for better performance
      input["log_id"]=func.checkInt(input["log_id"]);
      if(!input["log_id"]){
        strError=lang["invalid_parameter"];
      }else{
        // Check if the article exists and load required data for saving changes
        if(theArticle.load("log_id, log_catID, log_authorID, log_postTime, log_trackbackURL","log_id="+input["log_id"])){
          strError=false;
        }else{
          strError=lang["article_not_found"];
        }
      }
    }else{
      // Load full data for Edit Form
      strError=theArticle.loadByID(input["id"]);
    }

    if(strError!=false){
      // Article not found
      pageHeader(lang["error"]);
      redirectMessage(lang["error"], strError, lang["goback"], "javascript:window.history.back();", false, "errorbox");
    }else{
      if(theUser.id!=theArticle.authorID&&theUser.rights["edit"]<2){
        // Check Edit Rights Again
        pageHeader(lang["error"]);
        redirectMessage(lang["error"], lang["no_rights"], lang["goback"], "javascript:window.history.back();", false, "errorbox");
      }else{
        if(!bSaveFlag){
          // Output Edit Form
          pageHeader("["+lang["edit"]+"] "+theArticle.title);
          outputForm(lang["edit"]+": "+theArticle.title+" ["+lang["author"]+": "+theArticle.author+"]", "?act=update", theArticle, true);
        }else{
          // Check Data
          var oldCategoryID=theArticle.category.id;
          strError=theArticle.fillFromPost(true);
          if(strError!=false){
            pageHeader(lang["error"]);
            redirectMessage(lang["error"], strError, lang["goback"], "javascript:window.history.back();", false, "errorbox");
          }else{
            // Save Changes
            theArticle.update();

            // Category Changed
            if(oldCategoryID!=theArticle.category.id){
              connBlog.updateSQL("[blog_Category]","cat_ArticleCount=cat_ArticleCount+1", "cat_id="+theArticle.category.id);
              connBlog.updateSQL("[blog_Category]","cat_ArticleCount=cat_ArticleCount-1", "cat_id="+oldCategoryID);
            }
            
            var strDone=lang["update_done"];
            var bAutoRedirect=true;

            // Do trackback if requested
            if(theArticle.trackbackURL!="" && theArticle.trackbackAgain && theCache.settings["enableTrackbackOut"]==1 && theArticle.mode==1){
              var tbError = doTrackback(theArticle.trackbackURL,
                                        theCache.settings["baseURL"]+"?id="+theArticle.id,
                                        theArticle.title,
                                        theArticle.content0,
                                        theCache.settings["blogTitle"]);
              if(tbError==""){
                strDone+="<br />"+lang["trackback_done"];
              }else{
                strDone+="<br /><font color=\"red\">"+lang["trackback_error"]+": "+tbError+"</font>";
                bAutoRedirect=false;
              }
            }

            theCache.loadCategories();
            theCache.loadArticles();
            theCache.loadCalendar();
            theCache.loadComments();

            pageHeader(lang["done"]);
            redirectMessage(lang["done"], strDone, lang["redirect"], "?id="+theArticle.id, bAutoRedirect, "messagebox");
          }
        }
      }
    }
  }
}


// Delete Article  ------------------------------------------------------
function articleDelete(){
  if(theUser.rights["delete"]<1){
    // Check User Right - without DB Query
    pageHeader(lang["error"]);
    redirectMessage(lang["error"], lang["no_rights"], lang["goback"], "javascript:window.history.back();", false, "errorbox");
  }else{
    var theArticle=new lbsArticle();
    var strError;

    input["log_id"]=func.checkInt(input["log_id"]);
    if(!input["id"]){
      strError=lang["invalid_parameter"];
    }else{
      // Check if the article exists
      theArticle.load("log_id, log_authorID, log_catID","log_id="+input["id"]);
      strError=false;
    }

    if(strError!=false){
      // Article not found
      pageHeader(lang["error"]);
      redirectMessage(lang["error"], strError, lang["goback"], "javascript:window.history.back();", false, "errorbox");
    }else{
      if(theUser.id!=theArticle.authorID&&theUser.rights["delete"]<2){
        // Check Delete Rights Again
        pageHeader(lang["error"]);
        redirectMessage(lang["error"], lang["no_rights"], lang["goback"], "javascript:window.history.back();", false, "errorbox");
      }else{
        theArticle.doDelete();
        connBlog.updateSQL("[blog_User]","user_articleCount=user_articleCount-1", "user_id="+theArticle.authorID);
        connBlog.updateSQL("[blog_Category]","cat_articleCount=cat_articleCount-1", "cat_id="+theArticle.categoryID);
        theCache.loadArticles();
        theCache.loadCategories();
        theCache.loadCalendar();
        theCache.loadComments();

        pageHeader(lang["done"]);
        redirectMessage(lang["done"], lang["delete_done"], lang["redirect"], "default.asp", true, "messagebox");

      }
    }
  }
}

// Send Trackback -------------------------------------------
function doTrackback(trackbackURL,url,title,excerpt,blogName){
	title = Server.URLEncode(func.cutString(title,100));
	excerpt = Server.URLEncode(func.cutString(excerpt, 252));
	url = Server.URLEncode(url);
	blogName = Server.URLEncode(func.cutString(blogName,100));
	var strError="";
  var queryString = "title="+title+"&url="+url+"&blog_name="+blogName+"&excerpt="+func.trimUBB(excerpt);
  var objXMLHTTP;
  var objDom;

	try{
    objXMLHTTP = Server.CreateObject("MSXML2.ServerXMLHTTP");
  }catch(e){
    return lang["create_object_fail_xmlhttp"];
  }

	//---This is the old GET method of trackback described in Specification---
	//---I put it here just for the memory of history-------------------------
	//		objXMLHTTP.Open "GET", trackbackURL&"&"&queryString, false
	//		objXMLHTTP.Send
	//---End Code Segment-----------------------------------------------------

	try{
  	objXMLHTTP.open("POST", trackbackURL, false);
    objXMLHTTP.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
  	objXMLHTTP.send(queryString);
  }catch(e){
		strError = lang["server_no_response"];
  }

	// Give some time to wait for the response
  if(objXMLHTTP.readyState!=4){
    try{
      objXMLHTTP.waitForResponse(15);
    }catch(e){
      strError = lang["server_no_response"];
    }
  }
  
  // Check for status again and abort the procedure when failed
  if(objXMLHTTP.readyState!=4||objXMLHTTP.status!=200){
    objXMLHTTP.abort();
    strError = lang["server_no_response"];
  }else{
    // Read in the response data
    try{
      objDom = Server.CreateObject("Microsoft.XMLDOM");
    }catch(e){
      return lang["create_object_fail_xmldom"];
    }
    objDom.async=false;
    objDom.loadXML(objXMLHTTP.responseText);
    if(objDom.parseError.errorCode!=0){
      strError = lang["parse_error"];
    }else{
      // Check for returned error code
      if(objDom.getElementsByTagName("error")[0].text!="0"){
        strError = func.HTMLEncode(objDom.getElementsByTagName("message")[0].text);
      }
    }
  }

	delete objXMLHTTP;
	delete objDom;

  return strError;
}

%>