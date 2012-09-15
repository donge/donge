<script language="JScript" runAt="server">
// Check if file is called inside LBS
var inLBS;
if(inLBS!=true){
  Response.write("Invalid Call");
  Response.End();
}
</script>
<%
//====== Admin PAGE LOGIC ====================================
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-03-01 22:57:56
//============================================================

if(!theUser.loggedIn||theUser.groupID!=1) Response.Redirect("default.asp");

getAdminLanguage(lang);

pageHeader(lang["administration"]);

if(input["act"]=="login"){
  adminLogin();
}
if(input["act"]=="logout"){
  Session("admin")=undefined;
  Response.Redirect("default.asp");
}

if(Session("admin")==true){
  // Admin has logged in
  switch(String(input["in"])){
    case "settings":
      if(input["act"]=="update") updateSettings();
      theCache.loadSettings();
      outputSettings();
      break;
    case "category":
      if(input["act"]) updateCategories();
      theCache.loadCategories();
      if(input["act"]!="move"||input["target"]){
        outputCategories();
      }
      break;
    case "group":
      if(input["act"]) updateUserGroup();
      theCache.loadUserGroup();
      outputUserGroup();
      break;
    case "smilies":
      if(input["act"]) updateSmilies();
      theCache.loadSmilies();
      outputSmilies();
      break;
    case "wordfilter":
      if(input["act"]) updateWordFilter();
      theCache.loadWordFilter();
      outputWordFilter();
      break;
    case "database":
      showDatabase();
      break;
    case "attachment":
      showAttachment();
      break;
    case "announce":
      showAnnouncement();
      break;
    case "links":
      showLinks();
      break;
    case "misc":
      showMisc();
      break;
    default:
      switch(String(input["act"])){
        case "closesite":
          if(Session("admin")==true){
            closeSite();
            Response.Redirect("?");
          }
          break;
        case "opensite":
          if(Session("admin")==true){
            openSite();
            Response.Redirect("?");
          }
          break;
        default:
          showGeneralInfo();
      }
  }
}else{
  // Admin has not logged in
  adminLoginForm();
}

pageFooter();

// Admin Login Check ///////////////////////////////////////////////////////////////////
function adminLogin(){
  var tmpA=connBlog.query("SELECT user_password, user_salt FROM [blog_User] WHERE user_id="+theUser.id);
  if(!tmpA){
    Session("admin")=undefined;
    redirectMessage(lang["error"], lang["user_not_found"], "", "", false, "errorbox");
    write("<br />");
  }else{
    if(tmpA[0]["user_password"]!=func.SHA1(input["password"]+tmpA[0]["user_salt"])){
      Session("admin")=undefined;
      redirectMessage(lang["error"], lang["password_invalid"], "", "", false, "errorbox");
      write("<br />");
    }else{
      Session("admin")=true;
    }
  }
}

// Display General Information on the Server ///////////////////////////////////////////////
function showGeneralInfo(){
  var serverInfo={ "software": Request.ServerVariables("SERVER_SOFTWARE"),
                   "ip": Request.ServerVariables("LOCAL_ADDR"),
                   "scriptEngine": ScriptEngineMajorVersion()+"."+ScriptEngineMinorVersion()+"."+ScriptEngineBuildVersion(),
                   "time": func.getDateTimeString("YY-MM-DD hh:ii:ss Z"),
                   "path": Request.ServerVariables("APPL_PHYSICAL_PATH"),
                   "objFSO": checkServerObject("Scripting.FileSystemObject"),
                   "objStream": checkServerObject("ADODB.Stream"),
                   "objXMLHTTP": checkServerObject("MSXML2.ServerXMLHTTP"),
                   "objXMLDOM": checkServerObject("Microsoft.XMLDOM")
                 }
  outputGeneralInfo(serverInfo);
}

// Check if the object is usable on the server
function checkServerObject(strObjectName){
  try{
    var obj=Server.CreateObject(strObjectName);
  }catch(e){
    return false;
  }
  delete obj;

  return true;
}

// Update Global Settings ///////////////////////////////////////////////////////////////////
function updateSettings(){
  // Check path
  if(input["baseurl"]){
    input["baseurl"].replace(/\\/g,"/");
    if(input["baseurl"].slice(-1)!="/") input["baseurl"]+="/";
  }
  if(input["logoimage"]){
    input["logoimage"].replace(/\\/g,"/");
    if(input["logoimage"].slice(-1)=="/") input["logoimage"]=input["stylesheet"].substr(0,input["stylesheet"].length-1);
  }
  if(input["stylesheet"]){
    input["stylesheet"].replace(/\\/g,"/");
    if(input["stylesheet"].slice(-1)=="/") input["stylesheet"]=input["stylesheet"].substr(0,input["stylesheet"].length-1);
  }
  if(input["imagefolder"]){
    input["imagefolder"].replace(/\\/g,"/");
    if(input["imagefolder"].slice(-1)=="/") input["imagefolder"]=input["imagefolder"].substr(0,input["imagefolder"].length-1);
  }
  if(input["smiliesfolder"]){
    input["smiliesfolder"].replace(/\\/g,"/");
    if(input["smiliesfolder"].slice(-1)=="/") input["smiliesfolder"]=input["smiliesfolder"].substr(0,input["smiliesfolder"].length-1);
  }
  if(input["uploadpath"]){
    input["uploadpath"].replace(/\\/g,"/");
    if(input["uploadpath"].slice(-1)!="/") input["uploadpath"]+="/";
  }
  // Do updates
  connBlog.exec(genStrUpdate("blogtitle"));
  connBlog.exec(genStrUpdate("blogdescription"));
  connBlog.exec(genStrUpdate("baseurl"));
  connBlog.exec(genStrUpdate("logoimage"));
  connBlog.exec(genStrUpdate("blogwebmaster"));
  connBlog.exec(genStrUpdate("blogwebmasteremail"));
  connBlog.exec(genStrUpdate("bloglanguage"));
  connBlog.exec(genBoolUpdate("defaultviewmode"));
  connBlog.exec(genIntUpdate("articleperpagenormal",0,21));
  connBlog.exec(genIntUpdate("articleperpagelist",19,101));
  connBlog.exec(genIntUpdate("listentryperpage",9,101));
  connBlog.exec(genIntUpdate("commentperpage",-1,51));
  connBlog.exec(genBoolUpdate("commenttimeorder"));
  connBlog.exec(genBoolUpdate("showtrackbackwithcomment"));
  connBlog.exec(genIntUpdate("showtrackbackposition",-1,3));
  connBlog.exec(genIntUpdate("recentarticlelist",2,31));
  connBlog.exec(genIntUpdate("recentcommentlist",2,31));
  connBlog.exec(genBoolUpdate("enabledynamiccalendar"));
  connBlog.exec(genBoolUpdate("enablecontentautosplit"));
  connBlog.exec(genIntUpdate("contentautosplitchars",99,2001));
  connBlog.exec(genBoolUpdate("enableregister"));
  connBlog.exec(genBoolUpdate("enablesecuritycode"));
  connBlog.exec(genBoolUpdate("enabletrackbackin"));
  connBlog.exec(genBoolUpdate("enabletrackbackout"));
  connBlog.exec(genBoolUpdate("enablecomment"));
  connBlog.exec(genIntUpdate("maxcommentlength",99,2001));
  connBlog.exec(genBoolUpdate("enableguestbook"));
  connBlog.exec(genIntUpdate("entryperpageguestbook",2,31));
  connBlog.exec(genStrUpdate("stylesheet"));
  connBlog.exec(genStrUpdate("imagefolder"));
  connBlog.exec(genStrUpdate("smiliesfolder"));
  connBlog.exec(genIntUpdate("smiliesperrow",0,31));
  connBlog.exec(genIntUpdate("minpostduration",0,601));
  connBlog.exec(genBoolUpdate("enablevisitorrecord"));
  connBlog.exec(genIntUpdate("maxvisitorrecord",0,301));
  connBlog.exec(genBoolUpdate("enableupload"));
  connBlog.exec(genIntUpdate("uploadsize",1023,50000001));
  connBlog.exec(genStrUpdate("uploadpath"));
  connBlog.exec(genStrUpdate("uploadtypes"));

  theCache.loadCalendar();
  theCache.loadArticles();
  theCache.loadComments();

  function genStrUpdate(strName){
    if(input[strName]){
        return "UPDATE [blog_Settings] SET set_value1='"+func.checkStr(func.trim(input[strName]))+"' WHERE set_name='"+strName+"';";
    }else{
      return "";
    }
  }

  function genBoolUpdate(strName){
    input[strName] = input[strName] ? 1: 0;
    return "UPDATE [blog_Settings] SET set_value0="+input[strName]+" WHERE set_name='"+strName+"';";
  }

  function genIntUpdate(strName,intMin, intMax){
    input[strName]=func.checkInt(input[strName]);
    if(input[strName]>intMin&&input[strName]<intMax){
      return "UPDATE [blog_Settings] SET set_value0="+input[strName]+" WHERE set_name='"+strName+"';";
    }else{
      return "";
    }
  }

}

// Update Categories ///////////////////////////////////////////////////////////////////
function updateCategories(){
  // Save changes ------------------------------------------------
  if(input["act"]=="update"){
    // Set all to false then set selected ones to hidden
    connBlog.updateSQL("[blog_Category]", "cat_hidden=false","cat_id>0");
    if(input["hidden"]){
      var arrHidden=input["hidden"].split(",");
      for(var i=0;i<arrHidden.length;i++){
        arrHidden[i]=func.checkInt(arrHidden[i]);
      }
      connBlog.updateSQL("[blog_Category]", "cat_hidden=true","cat_id IN ("+arrHidden.join(",")+")");
    }

    // Set all to false then set selected ones to locked
    connBlog.updateSQL("[blog_Category]", "cat_locked=false","cat_id>0");
    if(input["locked"]){
      var arrLocked=input["locked"].split(",");
      for(var i=0;i<arrLocked.length;i++){
        arrLocked[i]=func.checkInt(arrLocked[i]);
      }
      connBlog.updateSQL("[blog_Category]", "cat_locked=true","cat_id IN ("+arrLocked.join(",")+")");
    }

    // Update Data
    var arrID=input["id"].split(",");
    var arrName=input["name"].split(",");
    var arrOrder=input["order"].split(",");
    for(var i=0;i<arrID.length;i++){
      // Check data
      arrID[i]=func.checkInt(arrID[i]);
      arrName[i]=func.trim(arrName[i]);
      arrOrder[i]=func.checkInt(arrOrder[i]);
      if(arrName[i].length<1||arrName[i].length>50) arrID[i]=-1;
      
      // Update DB
      var arrData={"cat_name": arrName[i],
                   "cat_order": arrOrder[i]};
      if(arrID[i]!=-1) connBlog.update("[blog_Category]", arrData,"cat_id="+arrID[i]);
      // Insert new category
      if(arrID[i]==0){
        arrData["cat_hidden"]= input["newhidden"] ? true : false;
        arrData["cat_locked"]= input["newlocked"] ? true : false;
        connBlog.insert("[blog_Category]", arrData);
      }
    }
    return;
  }
  
  // Move Articles --------------------------------
  if(input["act"]=="move"){
    if(!input["selected"]) return;
    var arrSelected=input["selected"].split(",");
    for(var i=0;i<arrSelected.length;i++){
      arrSelected[i]=func.checkInt(arrSelected[i]);
      if(arrSelected[i]<1){
        arrSelected.splice(i,1);
        i--;
      }
    }
    if(arrSelected.length>0){
      if(!input["target"]){
        outputCatMoveTarget(arrSelected);
      }else{
        input["target"]=theCache.getCategoryByID(func.checkInt(input["target"]));
        if(input["target"].id>0){
          connBlog.updateSQL("[blog_Article]","log_catID="+input["target"].id,"log_catID IN ("+arrSelected.join(",")+")");
          // Resync Article Counter
          connBlog.updateSQL("[blog_Category]","cat_articleCount=0","cat_id IN ("+arrSelected.join(",")+")");
          var tmpA=connBlog.query("SELECT count(log_id) as cnt FROM [blog_Article] WHERE log_catid="+input["target"].id);
          connBlog.updateSQL("[blog_Category]","cat_articleCount="+tmpA[0]["cnt"],"cat_id="+input["target"].id);
          delete tmpA;
          theCache.loadCategories();
          theCache.loadArticles();
        }
      }
    }
    return;
  }

  // Delete Categories --------------------------------
  if(input["act"]=="delete"){
    if(!input["selected"]) return;
    var arrSelected=input["selected"].split(",");
    for(var i=0;i<arrSelected.length;i++){
      arrSelected[i]=func.checkInt(arrSelected[i]);
      if(arrSelected[i]<1){
        arrSelected.splice(i,1);
        i--;
      }
    }
    // Do delete
    if(arrSelected.length>0){
      arrSelected=arrSelected.join(",");
      connBlog.doDelete("[blog_Article] tLog, [blog_Comment] tComm","tComm.log_id=tLog.log_id AND tLog.log_catID IN ("+arrSelected+")","tComm.*");
      connBlog.doDelete("[blog_Article] tLog, [blog_Trackback] tTB","tTB.log_id=tLog.log_id AND tLog.log_catID IN ("+arrSelected+")","tTB.*");
      connBlog.doDelete("[blog_Article]","log_catID IN ("+arrSelected+")");
      connBlog.doDelete("[blog_Category]","cat_id IN ("+arrSelected+")");
      var tmpA=connBlog.query("SELECT count(log_id) as cnt FROM [blog_Article]");
      connBlog.updateSQL("[blog_Settings]","set_value0="+tmpA[0]["cnt"],"set_name='counterArticle'");
      tmpA=connBlog.query("SELECT count(comm_id) as cnt FROM [blog_Comment]");
      connBlog.updateSQL("[blog_Settings]","set_value0="+tmpA[0]["cnt"],"set_name='counterComment'");
      tmpA=connBlog.query("SELECT count(tb_id) as cnt FROM [blog_Trackback]");
      connBlog.updateSQL("[blog_Settings]","set_value0="+tmpA[0]["cnt"],"set_name='counterTrackback'");
      theCache.loadSettings();
      theCache.loadCategories();
      theCache.loadArticles();
    }
    return;
  }
  
}

// Update User Groups ///////////////////////////////////////////////////////////////////
function updateUserGroup(){
  // Update --------------------------------
  if(input["act"]=="update"){
    var arrID=input["id"].split(",");
    var arrName=input["name"].split(",");
    var arrView=input["view"].split(",");
    var arrPost=input["post"].split(",");
    var arrEdit=input["edit"].split(",");
    var arrDelete=input["delete"].split(",");
    var arrUpload=input["upload"].split(",");
    for(var i=0;i<arrID.length;i++){
      // Check data
      arrID[i]=func.checkInt(arrID[i]);
      arrName[i]=func.trim(arrName[i]);
      arrView[i]=func.checkInt(arrView[i]);
      arrPost[i]=func.checkInt(arrPost[i]);
      arrEdit[i]=func.checkInt(arrEdit[i]);
      arrDelete[i]=func.checkInt(arrDelete[i]);
      arrUpload[i]=func.checkInt(arrUpload[i]);

      // Skip Admin Group
      if(arrID[i]==1) arrID[i]=-1;
      if(arrName[i].length<1||arrName[i].length>50) arrID[i]=-1;
      if(arrView[i]<0||arrView>3) arrID[i]=-1;
      if(arrPost[i]<0||arrPost>2) arrID[i]=-1;
      if(arrEdit[i]<0||arrEdit>2) arrID[i]=-1;
      if(arrDelete[i]<0||arrDelete>2) arrID[i]=-1;
      if(arrUpload[i]<0||arrUpload>1) arrID[i]=-1;
      
      // Update DB
      var arrData={"group_name": arrName[i],
                   "group_rights": String(arrView[i])+String(arrPost[i])+String(arrEdit[i])+String(arrDelete[i])+String(arrUpload[i])};
      if(arrID[i]!=-1) connBlog.update("[blog_UserGroup]", arrData,"group_id="+arrID[i]);
      // Insert new Group
      if(arrID[i]==0) connBlog.insert("[blog_UserGroup]", arrData);
    }
    return;
  }

  // Delete --------------------------------
  if(input["act"]=="delete"){
    if(!input["selected"]) return;
    var arrSelected=input["selected"].split(",");
    for(var i=0;i<arrSelected.length;i++){
      arrSelected[i]=func.checkInt(arrSelected[i]);
      if(arrSelected[i]<1){
        arrSelected.splice(i,1);
        i--;
      }
    }
    if(arrSelected.length>0){
      arrSelected=arrSelected.join(",");
      connBlog.doDelete("[blog_User]","user_groupID IN ("+arrSelected+")");
      connBlog.doDelete("[blog_UserGroup]","group_id IN ("+arrSelected+")");
    }
    return;
  }

}

// Update Smilies ///////////////////////////////////////////////////////////////////
function updateSmilies(){
  // Update --------------------------------
  if(input["act"]=="update"){
    var arrID=input["id"].split(",");
    var arrCode=input["code"].split(",");
    var arrImage=input["image"].split(",");
    for(var i=0;i<arrID.length;i++){
      // Check data
      arrID[i]=func.checkInt(arrID[i]);
      arrCode[i]=func.trim(arrCode[i]);
      arrImage[i]=func.trim(arrImage[i]);
      if(arrCode[i].length<1||arrCode[i].length>25) arrID[i]=-1;
      if(arrImage[i].length<1||arrImage[i].length>50) arrID[i]=-1;
      
      // Update DB
      var arrData={"sm_code": arrCode[i],
                   "sm_image": arrImage[i]};
      if(arrID[i]!=-1) connBlog.update("[blog_Smilies]", arrData,"sm_id="+arrID[i]);
      // Insert new smilies
      if(arrID[i]==0) connBlog.insert("[blog_Smilies]", arrData);
    }
    return;
  }

  // Delete --------------------------------
  if(input["act"]=="delete"){
    if(!input["selected"]) return;
    var arrSelected=input["selected"].split(",");
    for(var i=0;i<arrSelected.length;i++){
      arrSelected[i]=func.checkInt(arrSelected[i]);
      if(arrSelected[i]<1){
        arrSelected.splice(i,1);
        i--;
      }
    }
    if(arrSelected.length>0){
      arrSelected=arrSelected.join(",");
      connBlog.doDelete("[blog_Smilies]","sm_id IN ("+arrSelected+")");
    }
    return;
  }

}

// Update Word Filter ///////////////////////////////////////////////////////////////////
function updateWordFilter(){
  // Update --------------------------------
  if(input["act"]=="update"){
    // Set all to false then set selected ones to hidden
    connBlog.updateSQL("[blog_WordFilter]", "wf_regexp=false","wf_id>0");
    if(input["regexp"]){
      var arrRegExp=input["regexp"].split(",");
      for(var i=0;i<arrRegExp.length;i++){
        arrRegExp[i]=func.checkInt(arrRegExp[i]);
      }
      connBlog.updateSQL("[blog_WordFilter]", "wf_regexp=true","wf_id IN ("+arrRegExp.join(",")+")");
    }

    var arrID=input["id"].split(",");
    var arrMode=input["mode"].split(",");
    var arrText=input["text"].split(",");
    var arrReplace=input["replace"].split(",");
    for(var i=0;i<arrID.length;i++){
      // Check data
      arrID[i]=func.checkInt(arrID[i]);
      arrMode[i]=func.checkInt(arrMode[i]);
      arrText[i]=func.trim(arrText[i]);
      arrReplace[i]=func.trim(arrReplace[i]);
      if(arrMode[i]<0||arrMode[i]>1) arrID[i]=-1;
      if(arrText[i].length<1||arrText[i].length>25) arrID[i]=-1;
      if(arrMode[i]==0&&(arrReplace[i].length<1||arrReplace[i].length>50)) arrID[i]=-1;
      
      // Update DB
      var arrData={"wf_mode": arrMode[i],
                   "wf_text": arrText[i],
                   "wf_replace": arrReplace[i]};
      if(arrID[i]!=-1) connBlog.update("[blog_WordFilter]", arrData,"wf_id="+arrID[i]);
      // Insert new word filter
      if(arrID[i]==0){
        arrData["wf_regExp"]= input["newregexp"] ? true : false;
        connBlog.insert("[blog_WordFilter]", arrData);
      }
    }
    return;
  }

  // Delete --------------------------------
  if(input["act"]=="delete"){
    if(!input["selected"]) return;
    var arrSelected=input["selected"].split(",");
    for(var i=0;i<arrSelected.length;i++){
      arrSelected[i]=func.checkInt(arrSelected[i]);
      if(arrSelected[i]<1){
        arrSelected.splice(i,1);
        i--;
      }
    }
    if(arrSelected.length>0){
      arrSelected=arrSelected.join(",");
      connBlog.doDelete("[blog_WordFilter]","wf_id IN ("+arrSelected+")");
    }
    return;
  }

}

// Show Database ///////////////////////////////////////////////////////////////////
function showDatabase(){
  
  // Get Path
  var strDBFullPath=getFileFolder(connBlog.dbPath);
  var strDBPath=blogDB.substr(0,blogDB.lastIndexOf("/")+1);

  // Used for result output of operations
  var strResult="";
  
  // Compact DB
  if(input["act"]=="compact"){
    var result=compactDatabase();
    if(result[0]){
      strResult = result[1]+"- <b>"+lang["op_done"]+"</b>";
    }else{
      strResult = result[1]+"- <span class=\"red\"><b>"+lang["error_occured"]+"</b></span>";
    }
  }
  
  // Backup DB
  if(input["act"]=="backup"){
    var result=backupDatabase();
    if(result[0]){
      strResult = result[1]+"- <b>"+lang["op_done"]+"</b>";
    }else{
      strResult = result[1]+"- <span class=\"red\"><b>"+lang["error_occured"]+"</b></span>";
    }
  }
  
  // Restore DB
  if(input["act"]=="restore"){
    var result=restoreDatabase(strDBFullPath+"/"+unescape(input["file"]));
    if(result[0]){
      strResult = result[1]+"- <b>"+lang["op_done"]+"</b>";
    }else{
      strResult = result[1]+"- <span class=\"red\"><b>"+lang["error_occured"]+"</b></span>";
    }
  }

  // Delete Backup
  if(input["act"]=="delete"&&input["file"]){
    try{
      var fso=Server.CreateObject("Scripting.FileSystemObject");
      fso.DeleteFile(strDBFullPath+"/"+unescape(input["file"]));
      delete fso;
    }catch(e){
    }
  }
  
  // Get file list and Information after operations
  var arrInfo={"path": connBlog.dbPath,
               "size": getSize(connBlog.dbPath)};
  var arrBackup=getFolderList(strDBFullPath);
  // Output
  outputDatabase(arrInfo, strDBPath, arrBackup, strResult);
}

// Compact Database -------------------------------------------------------------
function compactDatabase(){
  var fso;
  var strResult="";

  // Close site to prevent conflict
  closeSite();

  // Close DB Connection to unlock the DB file
  strResult+="- "+lang["close_conn"]+"<br />";
  connBlog.close();

  // Create FSO
  strResult+="- "+lang["check_exist"]+"<br />";
  try{
    fso=Server.CreateObject("Scripting.FileSystemObject");
  }catch(e){
    return [false, strResult];
  }
  
  if(!fso.FileExists(connBlog.dbPath)){
    return [false, strResult];
  }

  strResult+="- "+lang["compact_db"]+"<br />";
  try{
    // Create DB Engine Object & Compact Database
    var jro = Server.CreateObject("JRO.JetEngine");
    jro.CompactDatabase("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + connBlog.dbPath,
                        "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + connBlog.dbPath+ ".tmp");
    delete jro;
  }catch(e){
    return [false, strResult];
  }

  strResult+="- "+lang["rename_db_file"]+"<br />";
  try{
    // Rename DB File
    fso.CopyFile(connBlog.dbPath+ ".tmp", connBlog.dbPath);
    fso.DeleteFile(connBlog.dbPath+ ".tmp");
  }catch(e){
    return [false, strResult];
  }
  
  delete fso;

  // Open site
  openSite();

  // Open DB Connection
  connBlog.open();

  return [true, strResult];
}

// Backup Database -------------------------------------------------------------
function backupDatabase(){
  var fso;
  var strResult="";

  // Close site to prevent conflict
  closeSite();

  // Close DB Connection to unlock the DB file
  strResult+="- "+lang["close_conn"]+"<br />";
  connBlog.close();

  // Create FSO
  strResult+="- "+lang["check_exist"]+"<br />";
  try{
    fso=Server.CreateObject("Scripting.FileSystemObject");
  }catch(e){
    return [false, strResult];
  }
  
  if(!fso.FileExists(connBlog.dbPath)){
    return [false, strResult];
  }

  strResult+="- "+lang["copy_to_backup"]+"<br />";
  var strPath=connBlog.dbPath;
  strPath=strPath.substr(0,strPath.lastIndexOf("."))+func.getDateTimeString("_YYMMDD_hhiiss")+".bak";
  try{
    // Rename DB File
    fso.CopyFile(connBlog.dbPath, strPath);
  }catch(e){
    return [false, strResult];
  }
  
  delete fso;

  // Open site
  openSite();

  // Open DB Connection
  connBlog.open();

  return [true, strResult];
}

// Restore Database -------------------------------------------------------------
function restoreDatabase(strFilePath){
  var fso;
  var strResult="";

  // Close site to prevent conflict
  closeSite();

  // Close DB Connection to unlock the DB file
  strResult+="- "+lang["close_conn"]+"<br />";
  connBlog.close();

  // Create FSO
  strResult+="- "+lang["check_exist"]+"<br />";
  try{
    fso=Server.CreateObject("Scripting.FileSystemObject");
  }catch(e){
    return [false, strResult];
  }
  
  if(!fso.FileExists(connBlog.dbPath)){
    return [false, strResult];
  }

  strResult+="- "+lang["copy_to_backup"]+"<br />";
  try{
    // Backup original file
    fso.CopyFile(connBlog.dbPath, connBlog.dbPath+".tmp");
    fso.DeleteFile(connBlog.dbPath);
    // Copy DB File
    fso.CopyFile(strFilePath, connBlog.dbPath);
  }catch(e){
    return [false, strResult];
  }

  try{
    // Delete backup of original file
    fso.DeleteFile(connBlog.dbPath+".tmp");
  }catch(e){
    return [false, strResult];
  }
  
  delete fso;

  // Open site
  openSite();

  // Open DB Connection
  connBlog.open();

  return [true, strResult];
}

// Attachments /////////////////////////////////////////////////////////////////////////////
function showAttachment(){
  
  // Get Path
  var strFullPath;
  var strCurrentPath;
  var strBasePath=theCache.settings["uploadPath"];
  var bShowParent=false;
  if(input["path"]){
    input["path"] = input["path"].replace(/\/+$/,"/");
    input["path"] = input["path"].replace(/^[\/\.]+/,"");
    strFullPath=Server.MapPath(theCache.settings["uploadPath"]+unescape(input["path"]));
    strCurrentPath=unescape(input["path"])+"/";
    bShowParent=true;
  }else{
    strFullPath=Server.MapPath(theCache.settings["uploadPath"]);
    strCurrentPath="";
  }

  // Delet File or Folder ----------------------------------------
  if(input["act"]=="delete"){
    if(input["file"]){
      try{
        var fso=Server.CreateObject("Scripting.FileSystemObject");
        fso.DeleteFile(strFullPath+"/"+unescape(input["file"]));
        delete fso;
      }catch(e){
      }
    }
    if(input["folder"]){
      try{
        var fso=Server.CreateObject("Scripting.FileSystemObject");
        var fileCount=fso.GetFolder(strFullPath+"/"+unescape(input["folder"])).Files.Count;
        if(fileCount==0) fso.DeleteFolder(strFullPath+"/"+unescape(input["folder"]));
        delete fso;
      }catch(e){
      }
    }

  }

  // Get File list
  var arrList=getFolderList(strFullPath);
  // Output
  outputAttachment(strBasePath, strCurrentPath, arrList, bShowParent);

}

// Announcement Page /////////////////////////////////////////////////////////////////////////////////////
function showAnnouncement(){
  // Update -------------
  if(input["act"]=="update"){
    var ubbFlags = "";
    ubbFlags+= input["e_ubb"]=="true" ? "1":"0";
    ubbFlags+= input["e_autourl"]=="true" ? "1":"0";
    ubbFlags+= input["e_image"]=="true" ? "1":"0";
    ubbFlags+= input["e_media"]=="true" ? "1":"0";
    ubbFlags+= input["e_smilies"]=="true" ? "1":"0";
    ubbFlags+= "1"; // bTextBlock - always 1
    if(input["e_html"]=="true") ubbFlags = "html";
    connBlog.updateSQL("[blog_Settings]","set_value0="+(input["show"]=="true" ? 1 : 0),"set_name='announceShow'");
    connBlog.updateSQL("[blog_Settings]","set_value1='"+ubbFlags+"'","set_name='announceUBBFlags'");
    connBlog.updateSQL("[blog_Settings]","set_value1='"+func.checkStr(input["message"])+"'","set_name='announce'");
    connBlog.updateSQL("[blog_Settings]","set_value1='"+func.getDateTimeString()+"'","set_name='announceDate'");
  }

  theCache.loadSettings();
  outputAnnouncement();
}

// Links Page /////////////////////////////////////////////////////////////////////////////////////
function showLinks(){
  // Update -------------
  if(input["act"]=="update"){
    connBlog.updateSQL("[blog_Settings]","set_value1='"+func.checkStr(input["links"])+"'","set_name='links'");
  }

  theCache.loadSettings();
  outputLinks();
}

// Misc Page /////////////////////////////////////////////////////////////////////////////////////
function showMisc(){
  // Resync Global Counter
  if(input["act"]=="resync_g"){
    var tmpA=connBlog.query("SELECT count(log_id) as cnt FROM [blog_Article]");
    connBlog.updateSQL("[blog_Settings]","set_value0="+tmpA[0]["cnt"],"set_name='counterArticle'");
    tmpA=connBlog.query("SELECT count(comm_id) as cnt FROM [blog_Comment]");
    connBlog.updateSQL("[blog_Settings]","set_value0="+tmpA[0]["cnt"],"set_name='counterComment'");
    tmpA=connBlog.query("SELECT count(tb_id) as cnt FROM [blog_Trackback]");
    connBlog.updateSQL("[blog_Settings]","set_value0="+tmpA[0]["cnt"],"set_name='counterTrackback'");
    tmpA=connBlog.query("SELECT count(user_id) as cnt FROM [blog_User]");
    connBlog.updateSQL("[blog_Settings]","set_value0="+tmpA[0]["cnt"],"set_name='counterUser'");
    theCache.loadSettings();
  }

  // Resync Category Counter
  if(input["act"]=="resync_c"){
    var tmpA=connBlog.query("SELECT cat_id FROM [blog_Category]");
    if(tmpA){
      for(var i=0;i<tmpA.length;i++){
        var tmpB=connBlog.query("SELECT count(log_id) as cnt FROM [blog_Article] WHERE log_catid="+tmpA[i]["cat_id"]);
        connBlog.updateSQL("[blog_Category]","cat_articleCount="+tmpB[0]["cnt"],"cat_id="+tmpA[i]["cat_id"]);
      }
    }
    delete tmpA;
    theCache.loadCategories();
  }

  // Resync Article Counter
  if(input["act"]=="resync_a"){
    if(!input["start"]){
      input["start"]=1;
    }else{
      input["start"]=func.checkInt(input["start"]);
    }
    var tmpA=connBlog.query("SELECT log_id FROM [blog_Article]",20,input["start"]);
    if(tmpA){
      for(var i=0;i<tmpA.length;i++){
        var tmpB=connBlog.query("SELECT count(comm_id) as cnt FROM [blog_Comment] WHERE log_id="+tmpA[i]["log_id"]);
        connBlog.updateSQL("[blog_Article]","log_commentCount="+tmpB[0]["cnt"],"log_id="+tmpA[i]["log_id"]);
        tmpB=connBlog.query("SELECT count(tb_id) as cnt FROM [blog_Trackback] WHERE log_id="+tmpA[i]["log_id"]);
        connBlog.updateSQL("[blog_Article]","log_trackbackCount="+tmpB[0]["cnt"],"log_id="+tmpA[i]["log_id"]);
      }
      outputEvent(lang["resync_article_stats"],lang["processed"]+(input["start"]*20)+lang["entries"],"?in=misc&act=resync_a&start="+(input["start"]+1));
      Response.End();
    }else{
      Response.Redirect("?in=misc");
    }
    delete tmpA;
    theCache.loadArticles();
  }

  // Resync User Counter
  if(input["act"]=="resync_u"){
    if(!input["start"]){
      input["start"]=1;
    }else{
      input["start"]=func.checkInt(input["start"]);
    }
    var tmpA=connBlog.query("SELECT user_id FROM [blog_User]",50,input["start"]);
    if(tmpA){
      for(var i=0;i<tmpA.length;i++){
        var tmpB=connBlog.query("SELECT count(comm_id) as cnt FROM [blog_Comment] WHERE comm_authorid="+tmpA[i]["user_id"]);
        connBlog.updateSQL("[blog_User]","user_commentCount="+tmpB[0]["cnt"],"user_id="+tmpA[i]["user_id"]);
        tmpB=connBlog.query("SELECT count(log_id) as cnt FROM [blog_Article] WHERE log_authorid="+tmpA[i]["user_id"]);
        connBlog.updateSQL("[blog_User]","user_articleCount="+tmpB[0]["cnt"],"user_id="+tmpA[i]["user_id"]);
      }
      outputEvent(lang["resync_user_stats"],lang["processed"]+(input["start"]*50)+lang["entries"],"?in=misc&act=resync_u&start="+(input["start"]+1));
      Response.End();
    }else{
      Response.Redirect("?in=misc");
    }
    delete tmpA;
  }

  // Clean Inactive User Account
  if(input["act"]=="clean_u"){
    var tDate=new Date();
    tDate.setTime(tDate.getTime()-30*864E5);
    connBlog.exec("DELETE * FROM [blog_User] WHERE user_commentCount=0 AND user_articleCount=0 AND user_lastVisit<#"+func.getDateTimeString("YY-MM-DD hh:ii:ss",tDate)+"#");
    var tmpA=connBlog.query("SELECT count(user_id) as cnt FROM [blog_User]");
    connBlog.updateSQL("[blog_Settings]","set_value0="+tmpA[0]["cnt"],"set_name='counterUser'");
    delete tmpA;
    theCache.loadSettings();
  }

  // Clean Visitor Counter
  if(input["act"]=="clean_vc"){
    connBlog.exec("DELETE * FROM [blog_VisitorRecord]");
  }

  // Clean GuestBook Entries
  if(input["act"]=="clean_gb"){
    var connGBook=new DBConn(gbookDB);
    connGBook.open();
    var tDate=new Date();
    tDate.setTime(tDate.getTime()-30*864E5);
    connGBook.exec("DELETE * FROM [Guestbook] WHERE gb_postTime<#"+func.getDateTimeString("YY-MM-DD hh:ii:ss",tDate)+"#");
    connGBook.close();
  }

  // output Page
  outputMisc();
}

// Open/Close Site Routines ////////////////////////////////////////////////////////////////
function openSite(){
  Application.Lock();
  Application(lbsNamespace+"siteClosed")=undefined;
  Application.Unlock();
}

function closeSite(){
  Application.Lock();
  Application(lbsNamespace+"siteClosed")=true;
  Application.Unlock();
}

// File Operation Routines //////////////////////////////////////////////////////////////////

// Get File Folder -----------------------
function getFileFolder(strPath){
  var file;
  try{
    fso=Server.CreateObject("Scripting.FileSystemObject");
    file=fso.GetFile(strPath);
  }catch(e){
    return "";
  }
  
  var path=file.ParentFolder;
  delete file;
  delete fso;

  return path;
}

// Get Folder Sub-Folder & File List -----------------------
function getFolderList(strPath){
  var fso, folder;
  var arrItems=new Array();
  try{
    fso=Server.CreateObject("Scripting.FileSystemObject");
    folder=fso.GetFolder(strPath);
  }catch(e){
    return arrItems;
  }

  // Get Sub-Folders
  var folders = new Enumerator(folder.SubFolders);
  for(var i=0; !folders.atEnd(); folders.moveNext()){
    arrItems[i]=new Array();
    arrItems[i]["name"] = folders.item().Name;
    arrItems[i]["size"] = fileSizeString(folders.item().Size);
    arrItems[i]["type"] = "folder";
    i++;
  }
  delete folders;

  // Get Files
  var files = new Enumerator(folder.files);
  for(var i=0; !files.atEnd(); files.moveNext()){
    arrItems[i]=new Array();
    arrItems[i]["name"] = files.item().Name;
    arrItems[i]["size"] = fileSizeString(files.item().Size);
    arrItems[i]["type"] = "file";
    i++;
  }
  delete files;


  delete folder;
  delete fso;

  return arrItems;
}

// Get File or Folder Size -----------------------
function getSize(strPath,strType){
	var fso;
  try{
    fso=Server.CreateObject("Scripting.FileSystemObject");
  }catch(e){
    return lang["na"];
  }

  var obj;
  try{
    if(strType=="folder"){
      obj=fso.GetFolder(strPath);
    }else{
      obj=fso.GetFile(strPath);
    }
  }catch(e){
    return lang["na"];
  }

  var size=obj.Size;

  delete obj;
  delete fso;

  return fileSizeString(size);
}

// Convert File Size to String -----------------------
function fileSizeString(size){
  if(size>1024*1024*1024){
    size=String(size/1024/1024/1024);
    if(size.indexOf(".")>0) size=size.substr(0, size.indexOf(".")+3);
    return size+" "+lang["gb"];
  }else if(size>1024*1024){
    size=String(size/1024/1024);
    if(size.indexOf(".")>0) size=size.substr(0, size.indexOf(".")+3);
    return size+" "+lang["mb"];
  }else if(size>1024){
    size=String(size/1024);
    if(size.indexOf(".")>0) size=size.substr(0, size.indexOf(".")+3);
    return size+" "+lang["kb"];
  }else{
    return size+" "+lang["bytes"];
  }
}

%>