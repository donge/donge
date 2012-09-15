<script language="JScript" runAt="server">
// Check if file is called inside LBS
var inLBS;
if(inLBS!=true){
  Response.write("Invalid Call");
  Response.End();
}
</script>
<%
//====== Trackback PAGE LOGIC ================================
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-03-20 17:08:33
//============================================================

switch(String(input["act"])){
  case "list":
    // View Comment List
    pageHeader(lang["trackbacks"]);
    trackbackList();
    pageFooter();
    break;
  case "delete":
    trackbackDelete();
    break;
  default:
    if(!input["url"]||!input["id"]){
      trackbackResponse(1,"Invalid Parameter");
    }else if(theCache.settings["enableTrackbackIn"]!=1){
      trackbackResponse(1,"Trackback Disabled");
    }else{
      trackbackSave();
    }
}


// Output Trackback List ////////////////////////////////////////////////////////
function trackbackList(){
  var sqlWHERE="";
  var strURLPrefix="?act=list";
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
      strURLPrefix += "&amp;cat="+input["cat"];
    }
  }

  // Check article id
  if(input["id"]){
    input["id"]=func.checkInt(input["id"]);
    if(input["id"]>0){
      sqlWHERE += " AND tTB.log_id="+input["id"];
      strURLPrefix += "&amp;id="+input["id"];
    }
  }

  // Check if has search keywords
  if(input["q"]){
    arrKeywords=input["q"].split(" ");
    for(var i=0;i<input["q"].length;i++){
      if(func.lengthW(arrKeywords[i])>2){
        sqlWHERE += " AND (tTB.tb_title LIKE '%"+func.checkStr(arrKeywords[i])+"%' OR tTB.tb_excerpt LIKE '%"+func.checkStr(arrKeywords[i])+"%')";
      }
    }
    strURLPrefix += "&amp;q="+input["q"];
  }
  
  // Check if has highlight keywords
  if(input["hl"]){
    arrKeywords=input["hl"].split(" ");
    strURLPrefix += "&amp;hl="+input["hl"];
  }

  // Load Trackbacks from DB
  var trackbacks;
  var entryCount;
  var entryPerPage = theCache.settings["listEntryPerPage"];
  var strSQL = "SELECT tTB.*, tLog.log_authorID, tLog.log_title FROM [blog_Article] tLog, [blog_Trackback] tTB WHERE tLog.log_id=tTB.log_id "+sqlWHERE+" ORDER BY tTB.tb_time DESC";
  
  trackbacks = connBlog.query(strSQL, entryPerPage, input["page"], false);
  if(!trackbacks){
    trackbacks=new Array();
    entryCount=0;
  }else{
    entryCount = connBlog.recordCount;
    for(var i=0;i<trackbacks.length;i++){
      trackbacks[i]={ "id": trackbacks[i]["tb_id"],
                      "log_id": trackbacks[i]["log_id"],
                      "log_title": trackbacks[i]["log_title"],
                      "log_authorID": trackbacks[i]["log_authorid"],
                      "title": trackbacks[i]["tb_title"],
                      "url": trackbacks[i]["tb_url"],
                      "blog": trackbacks[i]["tb_blog"],
                      "excerpt": trackbacks[i]["tb_excerpt"],
                      "time": new Date(Number(trackbacks[i]["tb_time"])),
                      "IP": trackbacks[i]["tb_ip"]
                       };
    }
  }

  // Output Trackback List
  outputTrackbackList(trackbacks, entryCount, entryPerPage, input["page"], input["cat"], strURLPrefix, arrKeywords);

}

// Save New Trackback ////////////////////////////////////////////////////////
function trackbackSave(){
  var tbEntry={"log_id": input["id"],
               "url": input["url"],
               "title": input["title"],
               "excerpt": input["excerpt"],
               "blog": input["blog_name"]
              }
  
  // These function calls look really horrible
  tbEntry.log_id=func.checkInt(tbEntry.log_id);
  tbEntry.url=func.trim(func.wordFilter(func.checkURL(tbEntry.url)));
  tbEntry.title=func.trim(func.wordFilter(func.trimHTML(func.trimUBB(tbEntry.title))));
  tbEntry.excerpt=func.trim(func.wordFilter(func.trimHTML(func.trimUBB(tbEntry.excerpt))));
  tbEntry.blog=func.trim(func.wordFilter(func.trimHTML(func.trimUBB(tbEntry.blog))));
  
  if(tbEntry.title=="") tbEntry.title=tbEntry.url;
  
  // Better Leave the error messages below in English
  if(!tbEntry.log_id)
    trackbackResponse(1, "Invalid Article ID");
  if(tbEntry.url=="")
    trackbackResponse(1, "Source URL is Blank");
  if(tbEntry.url==false||tbEntry.title==false||tbEntry.excerpt==false||tbEntry.blog==false)
    trackbackResponse(1, "Content contains blocked words");

  var tmpA=connBlog.query("SELECT Count(log_ID) as i FROM blog_Article WHERE log_locked=false AND log_mode<4 AND log_ID="+tbEntry.log_id);
  if(tmpA[0]["i"]==0) trackbackResponse(1, "Article does not exist or is locked");
  tmpA=connBlog.query("SELECT Count(tb_ID) as i FROM blog_Trackback WHERE tb_Title='"+tbEntry.title+"' AND tb_Excerpt='"+tbEntry.excerpt+"'");
  if(tmpA[0]["i"]>0) trackbackResponse(1, "Trackback is already saved");

  // Saving trackback
  var arrInsert={ "log_id": tbEntry.log_id,
                  "tb_url": tbEntry.url,
                  "tb_title": tbEntry.title,
                  "tb_excerpt": tbEntry.excerpt,
                  "tb_blog": tbEntry.blog,
                  "tb_ip": theUser.IP
                  };
  connBlog.insert("[blog_Trackback]", arrInsert);

  // Update counters
      connBlog.updateSQL("[blog_Article]","log_trackbackCount=log_trackbackCount+1", "log_id="+tbEntry.log_id);
      connBlog.updateSQL("[blog_Settings]","set_value0=set_value0+1", "set_name='counterTrackback'");
      theCache.updateArticleCounter(tbEntry.log_id,"trackback",1);
      theCache.updateGlobalCounter("counterTrackback",1);

  // Sent OK Response
  trackbackResponse(0);
}

// Trackback response
function trackbackResponse(intFlag, strMessage){
	Response.ContentType="text/xml";
	Response.Write("<?xml version=\"1.0\" encoding=\"iso-8859-1\"?><response><error>"+intFlag+"</error>");
	if(intFlag==1) Response.Write("<message>"+strMessage+"</message>");
	Response.Write("</response>");
	Response.End();
}

// Delete Trackback ////////////////////////////////////////////////////////
function trackbackDelete(){
  if(theUser.rights["delete"]<1){
    // Check User Right - without DB Query
    pageHeader(lang["error"]);
    redirectMessage(lang["error"], lang["no_rights"], lang["goback"], "javascript:window.history.back();", false, "errorbox");
  }else{
    var strError="";

    input["id"]=func.checkInt(input["id"]);
    if(!input["id"]){
      strError=lang["invalid_parameter"];
    }else{
      // Check user right again
      var arrData=connBlog.query("SELECT TOP 1 tLog.log_id,tLog.log_authorID,tTB.tb_id FROM [blog_Article] tLog,[blog_Trackback] tTB WHERE tLog.log_id=tTB.log_id AND tTB.tb_id="+input["id"]);
      if(arrData){
        arrData=arrData[0];
        if(theUser.id!=arrData["log_authorid"]||theUser.rights["delete"]<2){
          strError=lang["no_rights"];
        }
      }else{
        strError=lang["trackback_not_found"];
      }
    }

    if(strError!=""){
      pageHeader(lang["error"]);
      redirectMessage(lang["error"], strError, lang["goback"], "javascript:window.history.back();", false, "errorbox");
      pageFooter();
    }else{
      connBlog.doDelete("[blog_Trackback]","tb_id="+input["id"]);
      connBlog.updateSQL("[blog_Article]","log_trackbackCount=log_trackbackCount-1", "log_id="+arrData["log_id"]);
      connBlog.updateSQL("[blog_Settings]","set_value0=set_value0-1", "set_name='counterTrackback'");
      theCache.updateArticleCounter(input["id"],"trackback",-1);
      theCache.updateGlobalCounter("counterTrackback",-1);

      pageHeader(lang["done"]);
      redirectMessage(lang["done"], lang["trackback_delete_done"], lang["redirect"], "article.asp?id="+arrData["log_id"], true, "messagebox");
      pageFooter();
    }

  }
}
%>