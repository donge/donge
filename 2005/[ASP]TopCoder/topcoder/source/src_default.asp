<script language="JScript" runAt="server">
// Check if file is called inside LBS
var inLBS;
if(inLBS!=true){
  Response.write("Invalid Call");
  Response.End();
}
</script>
<%
//====== Index PAGE LOGIC ====================================
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-05-07 11:21:10
//============================================================

// Redirect For Permalink URL ///////////////////////////
if(input["id"]){
  connBlog.close();
  Response.Redirect("article.asp?id="+input["id"]);
}

// Process Default Page /////////////////////////////////
var strURLPrefix="?";
var sqlWHERE=" WHERE 1=1";
var arrKeywords="";

// Check view Mode
var viewMode;
if(input["mode"]=="list"){
  Session("viewMode")=1;
}else if(input["mode"]=="normal"){
  Session("viewMode")=0;
}
if(Session("viewMode")!=0&&Session("viewMode")!=1){
  viewMode=theCache.settings["defaultViewMode"];
}else{
  viewMode=Session("viewMode");
}

// Check current page number
if(input["page"]){
  input["page"]=func.checkInt(input["page"]);
  if(input["page"]<=0){
    input["page"]=1;
  }
}else{
  input["page"]=1;
}

// Check if output selected content only
if(input["selected"]=="true"){
  sqlWHERE += " AND log_selected=true";
  strURLPrefix += strURLPrefix=="?" ? "" : "&amp;";
  strURLPrefix += "selected=true";
}

// Check category id
if(input["cat"]){
  input["cat"]=func.checkInt(input["cat"]);
  if(input["cat"]>0){
    sqlWHERE += " AND log_catID="+input["cat"];
    strURLPrefix += strURLPrefix=="?" ? "" : "&amp;";
    strURLPrefix += "cat="+input["cat"];
  }
}

// Check user id
if(input["user"]){
  input["user"]=func.checkInt(input["user"]);
  if(input["user"]>0){
    sqlWHERE += " AND log_authorID="+input["user"];
    strURLPrefix += strURLPrefix=="?" ? "" : "&amp;";
    strURLPrefix += "user="+input["user"];
  }
}

// Check if doing search
if(input["q"]){
  arrKeywords=input["q"].split(" ");
  for(var i=0;i<arrKeywords.length;i++){
    if(func.lengthW(arrKeywords[i])>2){
      sqlWHERE += " AND (log_title LIKE '%"+func.checkStr(arrKeywords[i])+"%' OR log_content0 LIKE '%"+func.checkStr(arrKeywords[i])+"%' OR log_content1 LIKE '%"+func.checkStr(arrKeywords[i])+"%')";
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

// Check date range
var intYear;
var intMonth;
var intDay;
if(input["date"]){
  input["date"]=input["date"].split("-");
  intYear=func.checkInt(input["date"][0]);
  intMonth=func.checkInt(input["date"][1]);
  intDay=func.checkInt(input["date"][2]);
  if(intYear>0){
    // Re-generate Calendar
    theCache.calendarHTML = theCache.generateCalendar(intYear, intMonth);

    strURLPrefix += strURLPrefix=="?" ? "" : "&amp;";

    strURLPrefix += "date="+intYear;
    sqlWHERE += " AND Year(log_postTime)="+intYear;
    if(intMonth>0&&intMonth<13){
      strURLPrefix += "-"+intMonth;
      sqlWHERE += " AND Month(log_postTime)="+intMonth;
      if(intDay>0&&intDay<32){
        strURLPrefix += "-"+intDay;
        sqlWHERE += " AND Day(log_postTime)="+intDay;
      }
    }
  }
}

// Check for Hidden category display rights
if(theUser.rights["view"]<2){
  for(var i=0;i<theCache.categories.length;i++){
    if(theCache.categories[i].hidden) sqlWHERE+=" AND log_catid<>"+theCache.categories[i].id;
  }
}

// Load articles from DB when needed
var articles;
var entryCount;
var entryPerPage = (viewMode==1 ? theCache.settings["articlePerPageList"] : theCache.settings["articlePerPageNormal"])
if(input["page"]>1||input["cat"]>0||input["user"]>0||input["selected"]=="true"||input["q"]||intYear>0||viewMode==1){
  var strSQL = "SELECT ";
  
  if(viewMode==1){
    strSQL+="log_id, log_catid, log_title, log_authorid, log_author, log_mode, log_ubbFlags, log_postTime, log_ip, log_locked, log_selected, log_commentcount, log_viewcount, log_trackbackcount";
  }else{
    strSQL+="log_id, log_catid, log_title, log_content0, Left(log_content1,2) as log_content1, log_authorid, log_author, log_mode, log_ubbFlags, log_postTime, log_ip, log_locked, log_selected, log_commentcount, log_viewcount, log_trackbackcount";
  }
  strSQL += " FROM [blog_Article]"+sqlWHERE+" ORDER BY log_postTime DESC";
  
  articles = connBlog.query(strSQL, entryPerPage, input["page"], false);

  if(articles){
    entryCount = connBlog.recordCount;
  }else{
    articles="";
    entryCount = 0;
  }
}else{
  articles = theCache.recentArticles;
  entryCount = theCache.settings["counterArticle"];

  if(theUser.rights["view"]<2){
    for(var i=0;i<theCache.categories.length;i++){
      if(theCache.categories[i].hidden) entryCount = entryCount - theCache.categories[i].articleCount;
    }
  }
}

// Generate a security code for reference
theCache.genSecurityCode();

pageHeader();

// Output via Master layout
outputMaster(viewMode, articles, entryCount, entryPerPage, input["page"], input["cat"], strURLPrefix, arrKeywords);

pageFooter();
%>