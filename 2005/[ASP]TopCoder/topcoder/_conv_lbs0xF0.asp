<%@LANGUAGE="JSCRIPT" CODEPAGE="65001"%>
<!--#include file="lang/blog.asp"-->
<!--#include file="class/functions.asp"-->
<!--#include file="class/dbconn.asp"-->
<%
//====== Upgrade PAGE ========================================
// UPGRADE Version 001 for LBS2
//
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-03-05 12:18:30
//============================================================
Response.Expires = -1;
Response.AddHeader("Pragma","no-cache");
Response.AddHeader("cache-control","no-cache");
Response.Buffer=true;
Session.Timeout=60;

var blogDB="data/blog.mdb";

var inLBS=true;
var inDebug=true;

var lang=new Array(); // Create the language array
getLanguageArray(lang);

// Initialize Function Wrapper
var func=new lbsFunc();

// Get Request Data (QueryString, Form)
var input=func.getInput();

// Initialize DB Connection
var connBlog=new DBConn(blogDB);
connBlog.open();

switch(String(input["in"])){
  case "settings":
    transSettings();
    break;
  case "category":
    transCategory();
    break;
  case "comment":
    transComment();
    break;
  case "log":
    transLog();
    break;
  case "user":
    transUser();
    break;
  case "wf":
    transWordFilter();
    break;
  case "vr":
    transVisitorRecord();
    break;
  case "sm":
    transSmilies();
    break;
  case "cdb":
    cleanDB();
    break;
  case "done":
    done();
    break;
  default:
    var strText="<b>Script Engine Version:</b> "+ScriptEngineMajorVersion()+"." +ScriptEngineMinorVersion()+"." +ScriptEngineBuildVersion()+"<br />";
    strText+='Please backup your database first<br /><br /><a href="?in=settings">Click here to start</a> '
    outputEvent("L-Blog S_Hybrid Version to LBS2 Database Upsizing",strText)
}

connBlog.close();

showSQL();


// Output Events
function outputEvent(strStep, strEvent,strRedirect){
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>L-Blog S_Hybrid Version to LBS2 Database Upsizing</title>
<link rel="stylesheet" type="text/css" href="styles/default/styles.css" />
</head>
<body>
<div id="content" class="content" style="margin:10px;">
<div id="innerContent">
  <div class="textbox-title"><h4><%=strStep%></h4></div>
  <div class="textbox-content">
    <%=strEvent%>
    <%if(strRedirect){%>
    <meta http-equiv="refresh" content="3; URL=<%=strRedirect%>" /><br /><br />
    <a href="<%=strRedirect%>">Click Here If This Page Has Not Redirected Automatically</a>
    <%}%>
 </div>
</div>
</div>
<br />
</body>
</html>
<%
}

// Simplified Response.Write Output
function write(str)
{
  Response.Write(str);
}

// SQL Debug Output
function showSQL()
{
  write("<div style='margin: 10px;width: 100%'><div><table style='background: #CCCCCC; font-size: 12px;' width='100%' cellpadding='3' cellspacing='1'>");
  write("<tr><th>SQL: "+connBlog.queryCount+" queries</th><th>Return</th><th>Total</th></tr>");
  for(var i=0;i<connBlog.debugData.length;i++){
    write("<tr style='background:#FCFCFC'><td>"+Server.HTMLEncode(connBlog.debugData[i][0])+"</td><td>"+connBlog.debugData[i][1]+"</td><td>"+connBlog.debugData[i][2]+"</td></tr>")
  }
  write("</table></div></div>");
}

// Fatal Error Output
function errorMessage(err)
{
  write("<div style='color:#990000; border: solid 1px #CC0000; background: #FFEEDD; margin: 1px; font-size: 12px;'>");
  if(err.constructor==Error){
    write("<div style='color:#FFFFFF; padding: 2px; background: #990000;'>Error Code " + String(err.number & 0xFFFF) + "</div><div style='padding: 2px;'>"+err.description);
  }else{
    write("<div style='padding: 2px;'>"+err);
  }
  write("</div></div>");
  showSQL();
  Response.End();
}

// Done /////////////////////////////////////////////////////////////////
function done(){
  Application.Contents.RemoveAll();
  outputEvent("Transfer Done", "Database is updated. You can use LBS2 Now.<br />(Better Compact the Database File before launch your site)");
}

// Clean-up DB /////////////////////////////////////////////////////////////////
function cleanDB(){
  connBlog.exec("CREATE INDEX log_catID ON [blog_Article] (log_catID ASC)");
  connBlog.exec("CREATE INDEX log_authorID ON [blog_Article] (log_authorID ASC)");
  connBlog.exec("CREATE INDEX log_postTime ON [blog_Article] (log_postTime DESC)");
  connBlog.exec("CREATE INDEX log_selected ON [blog_Article] (log_selected ASC)");
  connBlog.exec("ALTER TABLE [blog_Comment] DROP CONSTRAINT [PrimaryKey]");
  connBlog.exec("ALTER TABLE [blog_Comment] DROP CONSTRAINT comm_id");
  connBlog.exec("CREATE INDEX comm_id ON [blog_Comment] (comm_id ASC) WITH PRIMARY");
  connBlog.exec("CREATE INDEX comm_postTime ON [blog_Comment] (comm_postTime DESC)");
  connBlog.exec("ALTER TABLE [blog_Smilies] DROP CONSTRAINT [PrimaryKey]");
  connBlog.exec("ALTER TABLE [blog_Smilies] DROP CONSTRAINT sm_id");
  connBlog.exec("CREATE INDEX sm_id ON [blog_Smilies] (sm_id ASC) WITH PRIMARY");
  connBlog.exec("ALTER TABLE [blog_Trackback] DROP CONSTRAINT [PrimaryKey]");
  connBlog.exec("ALTER TABLE [blog_Trackback] DROP CONSTRAINT tb_id");
  connBlog.exec("CREATE INDEX tb_id ON [blog_Trackback] (tb_id ASC) WITH PRIMARY");
  connBlog.exec("ALTER TABLE [blog_Trackback] DROP CONSTRAINT blog_id");
  connBlog.exec("CREATE INDEX log_id ON [blog_Trackback] (log_id ASC)");
  connBlog.exec("CREATE INDEX tb_time ON [blog_Trackback] (tb_time DESC)");
  connBlog.exec("ALTER TABLE [blog_UserGroup] DROP CONSTRAINT group_id");
  connBlog.exec("CREATE INDEX group_id ON [blog_UserGroup] (group_id ASC) WITH PRIMARY");
  connBlog.exec("ALTER TABLE [blog_WordFilter] DROP CONSTRAINT [PrimaryKey]");
  connBlog.exec("ALTER TABLE [blog_WordFilter] DROP CONSTRAINT sm_id");
  connBlog.exec("CREATE INDEX wf_id ON [blog_WordFilter] (wf_id ASC) WITH PRIMARY");
  outputEvent("Clean-up Database", "Clean-up Database","?in=done");
}

// Transfer Smilies ////////////////////////////////////////////////////////////////////////
function transSmilies(){
  connBlog.exec("ALTER TABLE [blog_Smilies] ADD COLUMN sm_code TEXT(25) WITH COMP");
  connBlog.exec("ALTER TABLE [blog_Smilies] ALTER COLUMN sm_image TEXT(50) WITH COMP");
  connBlog.exec("UPDATE [blog_Smilies] SET sm_code=sm_text");
  connBlog.exec("ALTER TABLE [blog_Smilies] DROP COLUMN sm_text");
  outputEvent("Modify Smilies Table", "Modify Smilies Table","?in=cdb");
}

// Transfer Visitor Record ////////////////////////////////////////////////////////////////////////
function transVisitorRecord(){
  connBlog.exec("DROP TABLE [blog_VisitorRecord]");
  connBlog.exec("CREATE TABLE [blog_VisitorRecord] (vr_id AUTOINCREMENT NOT NULL CONSTRAINT vr_id PRIMARY KEY, vr_ip TEXT(15) WITH COMP, vr_browser TEXT(30) WITH COMP, vr_os TEXT(30) WITH COMP, vr_time DATETIME NOT NULL DEFAULT Now(), vr_referer TEXT(250) WITH COMP, vr_target TEXT(50) WITH COMP)");
  outputEvent("Create Visitor Record Table", "Create Visitor Record Table","?in=sm");
}

// Transfer Word Filter ////////////////////////////////////////////////////////////////////////
function transWordFilter(){
  connBlog.exec("ALTER TABLE [blog_WordFilter] ADD COLUMN wf_regExp BIT DEFAULT false");
  connBlog.exec("UPDATE [blog_WordFilter] SET wf_regExp=false")
  outputEvent("Transfer WordFilter", "Alter WordFilter Table","?in=vr");
}

// Transfer User ////////////////////////////////////////////////////////////////////////
function transUser(){
  if(!input["start"]){
    connBlog.exec("CREATE TABLE [blog_User] (user_id AUTOINCREMENT NOT NULL CONSTRAINT user_id PRIMARY KEY, user_name TEXT(24) WITH COMP NOT NULL, user_password TEXT(40) WITH COMP NOT NULL, user_salt TEXT(6) WITH COMP NOT NULL, user_groupID INT NOT NULL, user_gender BYTE DEFAULT 0, user_email TEXT(50) WITH COMP, user_hideEmail BIT DEFAULT true, user_homepage TEXT(50) WITH COMP,user_articleCount INT NOT NULL DEFAULT 0,user_commentCount INT NOT NULL DEFAULT 0, user_lastVisit DATETIME NOT NULL DEFAULT Now(), user_ip TEXT(15) WITH COMP, user_hashKey TEXT(40) WITH COMP)");
    outputEvent("Transfer Users", "Create User Table","?in=user&start=1");
  }else{
    input["start"]=func.checkInt(input["start"]);
    var tmpA=connBlog.query("SELECT * FROM [blog_Member]", 100, input["start"]);
    if(tmpA){
      for(var i=0;i<tmpA.length;i++){
        var arrInsert={"user_id": tmpA[i]["mem_id"],
                       "user_name": tmpA[i]["mem_name"],
                       "user_password": tmpA[i]["mem_password"],
                       "user_salt": "",
                       "user_groupID": tmpA[i]["mem_status"],
                       "user_gender": tmpA[i]["mem_sex"],
                       "user_email": tmpA[i]["mem_email"],
                       "user_hideEmail": tmpA[i]["mem_hideemail"]==1 ? true : false,
                       "user_homepage": tmpA[i]["mem_homepage"],
                       "user_articleCount": tmpA[i]["mem_postlogs"],
                       "user_commentCount": tmpA[i]["mem_postcomms"],
                       "user_lastVisit": new Date(Number(tmpA[i]["mem_lastvisit"])),
                       "user_ip": tmpA[i]["mem_ip"],
                       "user_hashKey": ""
                       };
        connBlog.insert("[blog_User]", arrInsert);
      }
      outputEvent("Transfer Users", "Processed "+(input["start"]*100)+" Entries", "?in=user&start="+(input["start"]+1));
    }else{
      connBlog.close();
      connBlog.exec("DROP TABLE [blog_Member]");
      outputEvent("Transfer Users", "Delete Old Table", "?in=wf");
    }
  }
}

// Transfer Log ////////////////////////////////////////////////////////////
function transLog(){
  if(!input["start"]){
    connBlog.exec("CREATE TABLE [blog_Article] (log_id AUTOINCREMENT NOT NULL CONSTRAINT log_id PRIMARY KEY, log_catID INT NOT NULL, log_title TEXT(50) WITH COMP NOT NULL, log_authorID INT NOT NULL, log_author TEXT(25) WITH COMP NOT NULL, log_editMark TEXT(50) WITH COMP, log_trackbackURL TEXT(255) WITH COMP, log_content0 MEMO WITH COMP, log_content1 MEMO WITH COMP,log_mode BYTE NOT NULL DEFAULT 1, log_locked BIT NOT NULL, log_selected BIT NOT NULL, log_ubbFlags TEXT(50) WITH COMP NOT NULL, log_postTime DATETIME NOT NULL DEFAULT Now(), log_ip TEXT(15), log_commentCount INT DEFAULT 0, log_viewCount INT DEFAULT 0, log_trackbackCount INT DEFAULT 0)");
    outputEvent("Transfer Articles", "Create Articles Table","?in=log&start=1");
  }else{
    input["start"]=func.checkInt(input["start"]);
    var tmpA=connBlog.query("SELECT * FROM [blog_Content]", 10, input["start"]);
    if(tmpA){
      for(var i=0;i<tmpA.length;i++){
        var strContent0=tmpA[i]["log_content"];
        strContent0=strContent0.replace(/sel\&\#101\;ct/g, "select");
        strContent0=strContent0.replace(/jo\&\#105\;n/g, "join");
        strContent0=strContent0.replace(/un\&\#105\;on/g, "union");
        strContent0=strContent0.replace(/wh\&\#101\;re/g, "where");
        strContent0=strContent0.replace(/ins\&\#101\;rt/g, "insert");
        strContent0=strContent0.replace(/del\&\#101\;te/g, "delete");
        strContent0=strContent0.replace(/up\&\#100\;ate/g, "update");
        strContent0=strContent0.replace(/lik\&\#101\;/g, "like");
        strContent0=strContent0.replace(/dro\&\#112\;/g, "drop");
        strContent0=strContent0.replace(/cr\&\#101\;ate/g, "create");
        strContent0=strContent0.replace(/mod\&\#105\;fy/g, "modify");
        strContent0=strContent0.replace(/ren\&\#097\;me/g, "rename");
        strContent0=strContent0.replace(/alt\&\#101\;r/g, "alter");
        strContent0=strContent0.replace(/ca\&\#115\;t/g, "cast");

        var strContent1="";
        var pos=strContent0.indexOf("[#seperator#]");
        if(pos>0){
          strContent1=strContent0.substr(pos+13);
          strContent0=strContent0.substr(0,pos);
        }else if(strContent0.length>400){
          pos=getSplitPos(strContent0,400);
          if(pos!=false){
            strContent1=strContent0.substr(pos);
            strContent0=strContent0.substr(0,pos);
          }
        }
        var logMode=tmpA[i]["log_status"];
        var logLocked = logMode==2 ? true : false;
        if(logMode==2) logMode=1;
        var ubbFlags = tmpA[i]["log_disUBB"] ? "0":"1";
        ubbFlags+= "1";
        ubbFlags+= tmpA[i]["log_disIMG"] ? "0":"1";
        ubbFlags+=  tmpA[i]["log_disIMG"] ? "0":"1";
        ubbFlags+= tmpA[i]["log_disSM"] ? "0":"1";
        ubbFlags+= "1"; // bTextBlock - always 1
        var arrInsert={"log_id": tmpA[i]["log_id"],
                       "log_catID": tmpA[i]["log_cateid"],
                       "log_title": tmpA[i]["log_title"],
                       "log_authorID": tmpA[i]["log_authorid"],
                       "log_author": tmpA[i]["log_author"],
                       "log_trackbackURL": tmpA[i]["log_trackback"],
                       "log_content0": strContent0,
                       "log_content1": strContent1,
                       "log_mode": logMode,
                       "log_locked": logLocked,
                       "log_selected": false,
                       "log_ubbFlags": ubbFlags,
                       "log_postTime": new Date(Number(tmpA[i]["log_posttime"])),
                       "log_ip": tmpA[i]["log_ip"],
                       "log_commentCount": tmpA[i]["log_commnums"],
                       "log_viewCount": tmpA[i]["log_viewnums"],
                       "log_trackbackCount": tmpA[i]["log_trackbacknums"]
                      };
        connBlog.insert("[blog_Article]", arrInsert);
      }
      outputEvent("Transfer Articles", "Processed "+(input["start"]*10)+" Entries", "?in=log&start="+(input["start"]+1));
    }else{
      connBlog.close();
      connBlog.exec("DROP TABLE [blog_Content]");
      outputEvent("Transfer Articles", "Delete Old Table", "?in=user");
    }
  }
}
function getSplitPos(str, intChars){
  // Check if the text block left behind is big enough
  if(str.length<=intChars||intChars==0) return false;
  if(str.length<=intChars+50) return false;
  
  // Snap to the Nearest Space Char
  var nearReturnChar=str.indexOf(" ",intChars-10);
  if(nearReturnChar>-1&&nearReturnChar<intChars+30) intChars=nearReturnChar+1;
  // Snap to the Nearest UBB tag
  nearReturnChar=str.indexOf("[/",intChars-10);
  if(nearReturnChar>-1) nearReturnChar=str.indexOf("]",nearReturnChar);
  if(nearReturnChar>-1&&nearReturnChar<intChars+30) intChars=nearReturnChar+1;
  // Snap to the Nearest New Line Char
  nearReturnChar=str.indexOf("\n",intChars-10);
  if(nearReturnChar>-1&&nearReturnChar<intChars+30) intChars=nearReturnChar+1;

  return intChars;
}

// Transfer Comment ////////////////////////////////////////////////////////////////////////
function transComment(){
  if(!input["start"]){
    connBlog.exec("ALTER TABLE [blog_Comment] ADD COLUMN comm_editMark TEXT(50) WITH COMP");
    connBlog.exec("ALTER TABLE [blog_Comment] ADD COLUMN comm_UBBFlags TEXT(10) WITH COMP");
    outputEvent("Transfer Comments", "Alter Commment Table", "?in=comment&start=1");
  }else{
    input["start"]=func.checkInt(input["start"]);
    var tmpA=connBlog.query("SELECT comm_ID, comm_disSM, comm_disUBB, comm_disIMG, comm_autoURL FROM [blog_Comment]", 100, input["start"]);
    if(tmpA){
      for(var i=0;i<tmpA.length;i++){
        var ubbFlags = tmpA[i]["comm_disUBB"] ? "0":"1";
        ubbFlags+= tmpA[i]["comm_autoURL"] ? "1":"0";
        ubbFlags+= "0"; // bImage - always 0
        ubbFlags+= "0"; // bMedia - always 0
        ubbFlags+= tmpA[i]["comm_disSM"] ? "0":"1";
        ubbFlags+= "1"; // bTextBlock - always 1
        connBlog.update("[blog_comment]",{"comm_ubbFlags": ubbFlags},"comm_id="+tmpA[i]["comm_id"])
      }
      outputEvent("Transfer Comments", "Processed "+(input["start"]*100)+" Entries", "?in=comment&start="+(input["start"]+1));
    }else{
      connBlog.close();
      connBlog.exec("ALTER TABLE [blog_Comment] DROP COLUMN comm_disSM");
      connBlog.exec("ALTER TABLE [blog_Comment] DROP COLUMN comm_disUBB");
      connBlog.exec("ALTER TABLE [blog_Comment] DROP COLUMN comm_disIMG");
      connBlog.exec("ALTER TABLE [blog_Comment] DROP COLUMN comm_autoURL");
      outputEvent("Transfer Comments", "Delete Old Fields", "?in=log");
    }
  }
}

// Transfer Category ////////////////////////////////////////////////////////////////
function transCategory(){
  var tmpA=connBlog.query("SELECT * FROM [blog_Category]");
  connBlog.exec("DROP TABLE [blog_Category]");
  connBlog.exec("CREATE TABLE [blog_Category] (cat_id AUTOINCREMENT NOT NULL CONSTRAINT cat_id PRIMARY KEY, cat_name TEXT(50) WITH COMP NOT NULL, cat_order INT, cat_articleCount INT NOT NULL DEFAULT 0, cat_locked BIT NOT NULL, cat_hidden BIT NOT NULL)");
  var strTable="blog_Category";
  for(var i=0;i<tmpA.length;i++){
    connBlog.insert(strTable,{"cat_id": tmpA[i]["cate_id"], "cat_name": tmpA[i]["cate_name"], "cat_order": tmpA[i]["cate_order"], "cat_articleCount": tmpA[i]["cate_nums"], "cat_hidden": tmpA[i]["cate_mode"]==1 ? false : true});
  }

  outputEvent("Transfer Categories", "Categories transfered", "?in=comment");

}

// Transfer Settings ////////////////////////////////////////////////////////
function transSettings(){
  connBlog.exec("CREATE TABLE [blog_Settings] (set_name TEXT(25) WITH COMP NOT NULL CONSTRAINT set_name PRIMARY KEY, set_type BYTE NOT NULL DEFAULT 0, set_value0 INT DEFAULT 0, set_value1 MEMO WITH COMP)");
  var tmpA=connBlog.query("SELECT * FROM [blog_Info]");
  tmpA=tmpA[0];
  var strTable="blog_Settings";
  connBlog.insert(strTable,{"set_name": "announce", "set_type": 1, "set_value1": "Announcement Text"});
  connBlog.insert(strTable,{"set_name": "announceDate", "set_type": 1, "set_value1": "Announcement Date"});
  connBlog.insert(strTable,{"set_name": "announceShow", "set_type": 0,  "set_value0": 0});
  connBlog.insert(strTable,{"set_name": "announceUBBFlags", "set_type": 1, "set_value1": "111111"});
  connBlog.insert(strTable,{"set_name": "articlePerPageList", "set_type": 0, "set_value0": 40});
  connBlog.insert(strTable,{"set_name": "articlePerPageNormal", "set_type": 0, "set_value0": tmpA["blog_topicperpage"]});
  connBlog.insert(strTable,{"set_name": "recentArticleList", "set_type": 0, "set_value0": 10});
  connBlog.insert(strTable,{"set_name": "recentCommentList", "set_type": 0, "set_value0": 10});
  connBlog.insert(strTable,{"set_name": "entryPerPageGuestBook", "set_type": 0, "set_value0": 10});
  connBlog.insert(strTable,{"set_name": "baseURL", "set_type": 1, "set_value1": tmpA["blog_siteurl"]});
  connBlog.insert(strTable,{"set_name": "blogDescription", "set_type": 1, "set_value1": tmpA["blog_subtitle"]});
  connBlog.insert(strTable,{"set_name": "blogLanguage", "set_type": 1, "set_value1": tmpA["blog_langcode"]});
  connBlog.insert(strTable,{"set_name": "blogTitle", "set_type": 1, "set_value1": tmpA["blog_title"]});
  connBlog.insert(strTable,{"set_name": "blogWebMaster", "set_type": 1, "set_value1": tmpA["blog_adminname"]});
  connBlog.insert(strTable,{"set_name": "blogWebMasterEmail", "set_type": 1, "set_value1": tmpA["blog_adminemail"]});
  connBlog.insert(strTable,{"set_name": "contentAutoSplitChars", "set_type": 0, "set_value0": 400});
  connBlog.insert(strTable,{"set_name": "counterArticle", "set_type": 0, "set_value0":  tmpA["blog_lognums"]});
  connBlog.insert(strTable,{"set_name": "counterComment", "set_type": 0, "set_value0":  tmpA["blog_commnums"]});
  connBlog.insert(strTable,{"set_name": "counterTrackback", "set_type": 0, "set_value0":  tmpA["blog_trackbacknums"]});
  connBlog.insert(strTable,{"set_name": "counterUser", "set_type": 0, "set_value0":  tmpA["blog_memnums"]});
  connBlog.insert(strTable,{"set_name": "counterVisitor", "set_type": 0, "set_value0":  tmpA["blog_visitnums"]});
  connBlog.insert(strTable,{"set_name": "defaultViewMode", "set_type": 0, "set_value0":  0});
  connBlog.insert(strTable,{"set_name": "enableComment", "set_type": 0, "set_value0":  1});
  connBlog.insert(strTable,{"set_name": "enableGuestBook", "set_type": 0, "set_value0":  1});
  connBlog.insert(strTable,{"set_name": "enableContentAutoSplit", "set_type": 0, "set_value0":  1});
  connBlog.insert(strTable,{"set_name": "enableDynamicCalendar", "set_type": 0, "set_value0":  1});
  connBlog.insert(strTable,{"set_name": "enableRegister", "set_type": 0, "set_value0":  1});
  connBlog.insert(strTable,{"set_name": "enableSecurityCode", "set_type": 0, "set_value0":  1});
  connBlog.insert(strTable,{"set_name": "enableTrackbackIn", "set_type": 0, "set_value0": tmpA["blog_enabletrackback"] ? 1 : 0});
  connBlog.insert(strTable,{"set_name": "enableTrackbackOut", "set_type": 0, "set_value0": tmpA["blog_enabletrackback"] ? 1 : 0});
  connBlog.insert(strTable,{"set_name": "enableUpload", "set_type": 0, "set_value0": 1});
  connBlog.insert(strTable,{"set_name": "enableVisitorRecord", "set_type": 0, "set_value0": tmpA["blog_savevisitors"] ? 1 : 0});
  connBlog.insert(strTable,{"set_name": "maxCommentLength", "set_type": 0, "set_value0": tmpA["blog_commentlength"]});
  connBlog.insert(strTable,{"set_name": "maxVisitorRecord", "set_type": 0, "set_value0": tmpA["blog_visitorrecords"]});
  connBlog.insert(strTable,{"set_name": "minPostDuration", "set_type": 0, "set_value0": tmpA["blog_postdelay"]});
  connBlog.insert(strTable,{"set_name": "smiliesPerRow", "set_type": 0, "set_value0": 4});
  connBlog.insert(strTable,{"set_name": "uploadPath", "set_type": 1, "set_value1": tmpA["blog_uploadpath"]});
  connBlog.insert(strTable,{"set_name": "uploadTypes", "set_type": 1, "set_value1": tmpA["blog_uploadtype"]});
  connBlog.insert(strTable,{"set_name": "uploadSize", "set_type": 0, "set_value0": tmpA["blog_uploadsize"]});
  connBlog.insert(strTable,{"set_name": "links", "set_type": 1, "set_value1": tmpA["blog_links"]});
  connBlog.insert("[blog_settings]",{"set_name": "styleSheet", "set_type": 1, "set_value1": "styles/default/styles.css"});
  connBlog.insert("[blog_settings]",{"set_name": "imageFolder", "set_type": 1, "set_value1": "styles/default/images"});
  connBlog.insert("[blog_settings]",{"set_name": "smiliesFolder", "set_type": 1, "set_value1": "styles/default/images/smilies"});
  connBlog.insert("[blog_settings]",{"set_name": "listEntryPerPage", "set_type": 0, "set_value0": 30});
  connBlog.insert("[blog_settings]",{"set_name": "commentPerPage", "set_type": 0, "set_value0": 0});
  connBlog.insert("[blog_settings]",{"set_name": "commentTimeOrder", "set_type": 0, "set_value0": 0});
  connBlog.insert("[blog_settings]",{"set_name": "showTrackbackWithComment", "set_type": 0, "set_value0": 1});
  connBlog.insert("[blog_settings]",{"set_name": "showTrackbackPosition", "set_type": 0, "set_value0": 0});
  connBlog.insert("[blog_settings]",{"set_name": "logoImage", "set_type": 1, "set_value1": "styles/default/logo.gif"});

  connBlog.exec("DROP TABLE [blog_Info]");

  outputEvent("Transfer Settings", "Settings transfered", "?in=category");
}
%>
