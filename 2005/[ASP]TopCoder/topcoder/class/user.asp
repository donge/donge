<script language="JScript" runAt="server">
// Check if file is called inside LBS
var inLBS;
if(inLBS!=true){
  Response.write("Invalid Call");
  Response.End();
}

//====== CLASS lbsUser =======================================
// User Class for LBS
//
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-02-26 23:57:15
//============================================================

function lbsUser(){
  ////// Attributes /////////////////////////////////////////////
  this.id=0;
  this.username;
  this.password;
  this.salt;
  this.groupID=2; // Default to Guest Group
  this.groupName="<font color=red>"+lang["unkown"]+"</font>";
  this.rights={"view":0,"post":0,"edit":0,"delete":0,"upload":0};
  this.gender;
  this.email;
  this.homepage;
  this.hideEmail;
  this.lastVisit;
  this.lastIP;
  this.IP;
  this.articleCount;
  this.commentCount;
  this.connectionOpen;
  this.loggedIn=false;


  ////// Initialization //////////////////////////////////////////

  // Get user current IP
  this.IP = getIP();

  ////// Methods /////////////////////////////////////////////////

  // Register -----------------------
  this.register = function(bCheckSCode){
      var strError="";
      
      if(theCache.settings["enableRegister"]!=1){
        return "<li>"+lang["reg_disabled"]+"</li>";
      }

      // If user is already register
      if(Session("registered")||theUser.loggedIn){
        return "<li>"+lang["reg_already"]+"</li>";
      }

      // Check Data
      strError+=this.fillFromPost(bCheckSCode);

      if(strError!=""){
        // Return with error message
        return strError;
      }else{
        // Clean up to avoid abuse
        Session("lbsSecurityCode")=undefined;

        // Insert DB Record
        this.insert();

        // Make sure no double register is possible
        if(Session("registered")==undefined){
          Session("registered")=true;
        }

        // Login now
        this.login(input["username"],input["password"],1,false,"",true);
        
        return false;
      }
  }
  
  // Common Check for Post Data
  this.fillFromPost = function(bCheckSCode,bEdit,bAdmin){
    var strError="";

    if((!bEdit&&(!input["username"]||!input["password"]||!input["repassword"]))||!Session("lbsSecurityCode")){
      strError+="<li>"+lang["form_incomplete"]+"</li>";
    }
    if(theCache.settings["enableSecurityCode"]==1&&bCheckSCode&&Session("lbsSecurityCode")!=input["scode"]){
      strError+="<li>"+lang["scode_invalid"]+"</li>";
    }
    
    if(!bEdit&&(!func.checkUsername(input["username"])||input["username"]!=func.wordFilter(input["username"]))){
      strError+="<li>"+lang["username_invalid"]+"</li>";
    }
    
    if(!bEdit){
      if(connBlog.query("SELECT user_id FROM [blog_User] WHERE user_name='"+func.checkStr(input["username"])+"'")){
        strError+="<li>"+lang["user_exist"]+"</li>";
      }else{
        this.username=input["username"];
      }
    }

    if(!bEdit){
      if(input["password"]!=input["repassword"]||!func.checkPassword(input["password"])){
        strError+="<li>"+lang["password_invalid"]+"</li>";
      }else{
        this.salt=func.randomStr(6);
        this.password=func.SHA1(input["password"]+this.salt);
      }
    }else{
      if(input["password"]){
        if(input["password"]!=input["repassword"]||!func.checkPassword(input["password"])){
          strError+="<li>"+lang["password_invalid"]+"</li>";
        }else{
          this.salt=func.randomStr(6);
          this.password=func.SHA1(input["password"]+this.salt);
        }
      }else if(!bAdmin){
        this.salt=func.randomStr(6);
        this.password=func.SHA1(input["oldpassword"]+this.salt);
      }
    }

    if(!input["email"]){
      this.email="";
    }else if(!func.checkEmail(input["email"])&&input["email"]){
      strError+="<li>"+lang["email_invalid"]+"</li>";
    }else{
      this.email=input["email"];
    }
    this.hideEmail = input["hideemail"] ? true : false;

    this.gender=func.checkInt(input["gender"]);
    if(this.gender<0||this.gender>2){
      this.gender=0;
    }

    if(input["homepage"]){
      this.homepage=func.checkURL(input["homepage"]);
    }else{
      this.homepage="";
    }

    return strError;
  }

  // Login --------------------------
  this.login = function(strUsername, strPassword, intCookiesDay, bCheckSCode, strSCode, bNoSCode){
    var strError="";
    
    // Check if user is banned for login failure
    if((new Date())-Session("loginban")>3*60*1000){
      Session("loginfail")=undefined;
      Session("loginban")=undefined;
    }
    if(Session("loginfail")>3){
      Session("loginban")=new Date();
      Session("lbsSecurityCode")=undefined; // Clean up to avoid abuse
      return "<li>"+lang["login_fail_ban"]+"</li>";
    }

    // Check data
    if(!strUsername||!strPassword||(!bNoSCode&&!Session("lbsSecurityCode"))){
      strError+="<li>"+lang["form_incomplete"]+"</li>";
    }
    if(!func.checkUsername(strUsername)){
      strError+="<li>"+lang["username_invalid"]+"</li>";
    }
    if(!func.checkPassword(strPassword)){
      strError+="<li>"+lang["password_invalid"]+"</li>";
    }
    if(theCache.settings["enableSecurityCode"]==1&&bCheckSCode&&Session("lbsSecurityCode")!=strSCode){
      strError+="<li>"+lang["scode_invalid"]+"</li>";
    }

    if(strError!=""){
      // Return with error message
      return strError;
    }
    
    intCookiesDay = func.checkInt(intCookiesDay);
    if(!intCookiesDay){
      intCookiesDay = 1;
    }
    var tDate=new Date();
    tDate.setTime(tDate.getTime()+intCookiesDay*864E5);

    var tHashKey=func.SHA1(func.randomStr(6)+func.getDateTimeString());
    var arrUpdate={ "user_IP": this.IP,
                    "user_hashKey": tHashKey,
                    "user_LastVisit": new Date() };
    // Check Password
    var tmpA=connBlog.query("SELECT TOP 1 user_name,user_salt,user_password,user_id,user_groupID FROM [blog_User] WHERE user_Name='"+strUsername+"' AND user_salt<>''");
    if(tmpA){
      tmpA=tmpA[0];
      if(tmpA["user_password"]==func.SHA1(strPassword+tmpA["user_salt"])){
        // Update IP, lastVisitDate & hash key
        connBlog.update("[blog_User]", arrUpdate,"user_ID="+tmpA["user_id"]); 
        Response.Cookies(lbsNamespace+"userid")=tmpA["user_id"];
        Response.Cookies(lbsNamespace+"hashkey")=tHashKey;
        Response.Cookies(lbsNamespace+"userid").Expires=tDate.getVarDate();
        Response.Cookies(lbsNamespace+"hashkey").Expires=tDate.getVarDate();
        Session("lbsSecurityCode")=undefined; // Clean up to avoid abuse
        this.fill(tmpA);
        this.loggedIn=true;
        return false;
      }else{
        this.logout(false);
        if(!Session("loginfail")) Session("loginfail")=0;
        Session("loginfail")++;
        return "<li>"+lang["login_fail"]+"</li>";
      }
    // Code below is only for transportion from old version
    }else if(tmpA=connBlog.query("SELECT TOP 1 user_name,user_id,user_salt,user_groupID FROM [blog_User] WHERE user_Name='"+strUsername+"' AND user_password='"+func.MD5(strPassword).toUpperCase()+"'")){
      tmpA=tmpA[0];
      if(!tmpA["user_salt"]){
        // Update Password Encrytion
        var strSalt=func.randomStr(6);
        arrUpdate["user_Salt"]=strSalt; // Update Password
        arrUpdate["user_Password"]=func.SHA1(strPassword+strSalt); // Update Password
        connBlog.update("[blog_User]", arrUpdate,"user_id="+tmpA["user_id"]);
        Response.Cookies(lbsNamespace+"userid")=tmpA["user_id"];
        Response.Cookies(lbsNamespace+"hashkey")=tHashKey;
        Response.Cookies(lbsNamespace+"userid").Expires=tDate.getVarDate();
        Response.Cookies(lbsNamespace+"hashkey").Expires=tDate.getVarDate();
        Session("lbsSecurityCode")=undefined; // Clean up to avoid abuse
        this.fill(tmpA);
        this.loggedIn=true;
        return false;
      }else{
        this.logout(false);
        if(!Session("loginfail"))Session("loginfail")=0;
        Session("loginfail")++;
        return "<li>"+lang["login_fail"]+"</li>";
      }
    }else{
      this.logout(false);
      return "<li>"+lang["user_not_found"]+"</li>";
    }
  }

  // Logout --------------------------
  this.logout = function(bCleanHashKey){
    Response.Cookies(lbsNamespace+"userid")=undefined;
    Response.Cookies(lbsNamespace+"hashkey")=undefined;
    if(bCleanHashKey){
      connBlog.update("[blog_User]", {"user_hashKey": ""},"user_ID="+this.id);
    } 
    this.loggedIn=false;
  }

  // Check User Cookies --------------------------
  this.checkCookies = function(){
    if(!String(Request.Cookies(lbsNamespace+"userid"))||!String(Request.Cookies(lbsNamespace+"hashkey"))){
      this.logout(false);
    }else{
      var intUserID=func.checkInt(Request.Cookies(lbsNamespace+"userid"));
      var strHashKey=String(Request.Cookies(lbsNamespace+"hashkey"));
      var tmpA=connBlog.query("SELECT TOP 1 user_id,user_ip,user_name,user_groupID FROM [blog_User] WHERE user_id="+intUserID+" AND user_hashKey='"+func.checkStr(strHashKey)+"' AND user_hashKey<>''");
      if(tmpA){
        if(bCheckIP&&tmpA[0]["user_ip"]!=this.IP){
          this.id=tmpA[0]["user_id"];
          this.logout(true);
        }else{
          this.loggedIn=true;
          this.fill(tmpA[0]);
        }
      }else{
        this.logout(false);
      }
    }
  }

  // Load User by ID --------------------------
  this.loadByID = function(intID){
    if(!func.checkInt(intID)){
      return lang["invalid_parameter"];
    }
    // Load from DB
    if(this.load("*", "user_id="+func.checkInt(intID))){
      return false;
    }else{
      return lang["user_not_found"];
    }
  }

  // Load User From DB --------------------------
  this.load = function(strSelect, strWhere){
    var tmpA=connBlog.query("SELECT TOP 1 "+strSelect+" FROM [blog_User] WHERE "+strWhere);
    if(tmpA){
      this.fill(tmpA[0]);
      return true;
    }else{
      return false;
    }
  }

  // Fill User Object -------------------
  this.fill = function(arr){
    this.id = arr["user_id"];
    this.username = arr["user_name"];
    this.password = arr["user_password"];
    this.salt = arr["user_salt"];
    this.groupID = arr["user_groupid"];
    this.gender = arr["user_gender"];
    this.email = arr["user_email"];
    this.hideEmail = arr["user_hideemail"];
    this.homepage = arr["user_homepage"];
    this.lastVisit = new Date(Number(arr["user_lastvisit"]));
    this.lastIP = arr["user_ip"];
    this.articleCount = arr["user_articlecount"];
    this.commentCount = arr["user_commentcount"];
    this.getUserRights();
  }

  // Get User Rights
  this.getUserRights = function(){
    for(var i=0;i<theCache.userGroup.length;i++){
      if(this.groupID==theCache.userGroup[i].id){
        this.groupName=theCache.userGroup[i].name;
        this.rights=theCache.userGroup[i].rights;
        return;
      }
    }
  }

  // Insert New User
  this.insert = function(){
    var arrInsert={ "user_Name": this.username,
                    "user_Password": this.password,
                    "user_Salt": this.salt,
                    "user_GroupID": 3, // Registered Group
                    "user_gender": this.gender,
                    "user_Email": this.email,
                    "user_homepage": this.homepage,
                    "user_HideEmail": this.hideEmail
                    };
    connBlog.insert("[blog_User]", arrInsert);
    connBlog.updateSQL("[blog_Settings]","set_value0=set_value0+1", "set_name='counterUser'");
    theCache.updateGlobalCounter("counterUser",1);
  }

  // Update User Profile
  this.update = function(){
    var arrUpdate={ "user_Name": this.username,
                    "user_Password": this.password,
                    "user_Salt": this.salt,
                    "user_GroupID": this.groupID,
                    "user_gender": this.gender,
                    "user_Email": this.email,
                    "user_homepage": this.homepage,
                    "user_HideEmail": this.hideEmail
                    };
    connBlog.update("[blog_User]", arrUpdate, "user_id="+this.id);
  }

  // Delete User
  this.doDelete = function(){
    connBlog.doDelete("[blog_User]","user_id="+this.id);
    connBlog.updateSQL("[blog_Article]","log_authorID=0","log_authorID="+this.id);
    connBlog.updateSQL("[blog_Comment]","comm_authorID=0","comm_authorID="+this.id);
    if(gbookDB!=""){
      // Initialize DB Connection
      var connGBook=new DBConn(gbookDB);
      connGBook.open();
      connGBook.updateSQL("[Guestbook]","gb_userID=0","gb_userID="+this.id);
      connGBook.close();
      delete connGBook;
    }
    connBlog.updateSQL("[blog_Settings]","set_value0=set_value0-1", "set_name='counterUser'");
    theCache.updateGlobalCounter("counterUser",-1);
  }
  
  // Check View Permission for Articles -------------------------------------------------------
  this.checkViewPermission = function(objArticle){
    return !(
              (
                objArticle.mode==1&&this.rights["view"]<1||
                objArticle.mode==2&&(!this.loggedIn||this.rights["view"]<1)||
                (objArticle.mode==3||objArticle.category.hidden)&&(!this.loggedIn||this.rights["view"]<2)||
                objArticle.mode==4&&(!this.loggedIn||this.rights["view"]<3)
              ) && objArticle.authorID!=this.id
            );
  }

  // Record Visitor -------------------------------------------------------
  this.recordVisitor = function(){
    var strTarget=String(Request.ServerVariables("URL")).replace("\\","/");
    strTarget=strTarget.substr(strTarget.lastIndexOf("/"));
    strTarget+="?"+Request.ServerVariables("QUERY_STRING");
    strTarget=strTarget.substr(0,50);
    var browserCap = getBrowserCap(strUA); // strUA is defined in _common.asp
    var arrInfo={"vr_ip": this.IP,
                 "vr_browser": browserCap.name,
                 "vr_os": browserCap.os,
                 "vr_referer": strReferer.substr(0,250), // strReferer is defined in _common.asp
                 "vr_target": strTarget,
                 "vr_time": new Date()};

    var tmpA=connBlog.query("SELECT count(vr_id) as cnt FROM [blog_VisitorRecord]");
    if(tmpA[0]["cnt"]>=theCache.settings["maxVisitorRecord"]){
      tmpA=connBlog.query("SELECT TOP 1 vr_id FROM [blog_VisitorRecord] ORDER BY vr_time ASC");
      connBlog.update("[blog_VisitorRecord]",arrInfo,"vr_id="+tmpA[0]["vr_id"]);
    }else{
      connBlog.insert("[blog_VisitorRecord]",arrInfo);
    }
    delete tmpA;

    connBlog.updateSQL("[blog_Settings]","set_value0=set_value0+1", "set_name='counterVisitor'");
    theCache.updateGlobalCounter("counterVisitor",1);

  }

  // Get User's IP Address ----------------------------------------
  function getIP(){
    var strIP=String(Request.ServerVariables("HTTP_X_FORWARDED_FOR")).replace(/[^0-9\.,]/g,"");
    if(strIP.length<7) strIP=String(Request.ServerVariables("REMOTE_ADDR")).replace(/[^0-9\.,]/g,"");
    if(strIP.indexOf(",")>7) strIP=strIP.substr(0,strIP.indexOf(","));
    return strIP;
  }

  // Browser & OS Info Function -----------------------------------------
  // This is a supressed version
  function getBrowserCap(strUA){
    var arrInfo={ "name": "Unkown",
                  "os": "Unkown"};
    var idx, idxCol;
    var strType="";

    // Clean up string
    strUA = strUA.toLowerCase();
    strUA = strUA.replace(/^\s+/,"");
    strUA = strUA.replace(/\s+$/,"");
    strUA = strUA.replace(/\n/,"");

    if(strUA.length<10) return arrInfo;

    // Browser Check
    if(strUA.indexOf("mozilla")>-1) arrInfo["name"]="Mozilla";
    if(strUA.indexOf("icab")>-1) arrInfo["name"]="iCab";
    if(strUA.indexOf("lynx")>-1) arrInfo["name"]="Lynx";
    if(strUA.indexOf("links")>-1) arrInfo["name"]="Links";
    if(strUA.indexOf("elinks")>-1) arrInfo["name"]="ELinks";
    if(strUA.indexOf("jbrowser")>-1) arrInfo["name"]="JBrowser";
    if(strUA.indexOf("gecko")>-1){
      strType="[Gecko]";
      arrInfo["name"]="Mozilla";
      if(strUA.indexOf("aol")>-1) arrInfo["name"]="AOL";
      if(strUA.indexOf("netscape")>-1) arrInfo["name"]="Netscape";
      if(strUA.indexOf("firefox")>-1) arrInfo["name"]="FireFox";
      if(strUA.indexOf("chimera")>-1) arrInfo["name"]="Chimera";
      if(strUA.indexOf("camino")>-1) arrInfo["name"]="Camino";
      if(strUA.indexOf("galeon")>-1) arrInfo["name"]="Galeon";
      if(strUA.indexOf("k-meleon")>-1) arrInfo["name"]="K-Meleon";
      arrInfo["name"]+=strType;

    }
    if(strUA.indexOf("konqueror")>-1){
      arrInfo["name"]="Konqueror";
    }
    if(strUA.indexOf("bot")>-1||strUA.indexOf("crawl")>-1){
      strType="[Bot/Crawler]";
      arrInfo["name"]="";
      if(strUA.indexOf("grub")>-1) arrInfo["name"]="Grub";
      if(strUA.indexOf("googlebot")>-1) arrInfo["name"]="GoogleBot";
      if(strUA.indexOf("msnbot")>-1) arrInfo["name"]="MSN Bot";
      if(strUA.indexOf("slurp")>-1) arrInfo["name"]="Yahoo! Slurp";
      arrInfo["name"]+=strType;
    }
    if(strUA.indexOf("wget")>-1){
      arrInfo["name"]="Wget";
    }
    if(strUA.indexOf("ask jeeves")>-1||strUA.indexOf("teoma")>-1){
      arrInfo["name"]="Ask Jeeves/Teoma";
    }
    if(strUA.indexOf("msie")>-1){
      strType="[IE";
      idx=strUA.indexOf("msie") ;
      idxCol=strUA.indexOf(";",idx) 
      strType+= " "+strUA.substr(idx+5, idxCol-idx-5)+"]";
      arrInfo["name"]="IE";
      if(strUA.indexOf("msn")>-1) arrInfo["name"]="MSN";
      if(strUA.indexOf("aol")>-1) arrInfo["name"]="AOL";
      if(strUA.indexOf("webtv")>-1) arrInfo["name"]="WebTV";
      if(strUA.indexOf("myie2")>-1) arrInfo["name"]="MyIE2";
      if(strUA.indexOf("maxthon")>-1) arrInfo["name"]="Maxthon";
      if(strUA.indexOf("gosurf")>-1) arrInfo["name"]="GoSurf";
      if(strUA.indexOf("netcaptor")>-1) arrInfo["name"]="NetCaptor";
      if(strUA.indexOf("sleipnir")>-1) arrInfo["name"]="Sleipnir";
      if(strUA.indexOf("avant browser")>-1) arrInfo["name"]="AvantBrowser";
      if(strUA.indexOf("greenbrowser")>-1) arrInfo["name"]="GreenBrowser";
      if(strUA.indexOf("slimbrowser")>-1) arrInfo["name"]="SlimBrowser";
      arrInfo["name"]+=strType;
    }
    if(strUA.indexOf("opera")>-1){
      idx=strUA.indexOf("opera") ;
      arrInfo["name"]="Opera "+strUA.substr(idx+6, idx+9);
    }
    if(strUA.indexOf("applewebkit")>-1){
      strType="[AppleWebKit]";
      arrInfo["name"]="";
      if(strUA.indexOf("omniweb")>-1) arrInfo["name"]="OmniWeb";
      if(strUA.indexOf("safari")>-1) arrInfo["name"]="Safari";
      arrInfo["name"]+=strType;
    }

    // OS Check
    if(strUA.indexOf("windows")>-1) arrInfo["os"]="Windows";
    if(strUA.indexOf("windows ce")>-1) arrInfo["os"]="Windows CE";
    if(strUA.indexOf("windows 95")>-1) arrInfo["os"]="Windows 95";
    if(strUA.indexOf("win98")>-1) arrInfo["os"]="Windows 98";
    if(strUA.indexOf("windows 98")>-1) arrInfo["os"]="Windows 98";
    if(strUA.indexOf("windows 2000")>-1) arrInfo["os"]="Windows 2000";
    if(strUA.indexOf("windows xp")>-1) arrInfo["os"]="Windows XP";

    if(strUA.indexOf("windows nt")>-1){
      arrInfo["os"]="Windows NT";
      if(strUA.indexOf("windows nt 5.0")>-1) arrInfo["os"]="Windows 2000";
      if(strUA.indexOf("windows nt 5.1")>-1) arrInfo["os"]="Windows XP";
      if(strUA.indexOf("windows nt 5.2")>-1) arrInfo["os"]="Windows 2003";
    }
    if(strUA.indexOf("x11")>-1||strUA.indexOf("unix")>-1) arrInfo["os"]="Unix";
    if(strUA.indexOf("sunos")>-1||strUA.indexOf("sun os")>-1) arrInfo["os"]="SUN OS";
    if(strUA.indexOf("powerpc")>-1||strUA.indexOf("ppc")>-1) arrInfo["os"]="PowerPC";
    if(strUA.indexOf("macintosh")>-1) arrInfo["os"]="Mac";
    if(strUA.indexOf("mac osx")>-1) arrInfo["os"]="MacOSX";
    if(strUA.indexOf("freebsd")>-1) arrInfo["os"]="FreeBSD";
    if(strUA.indexOf("linux")>-1) arrInfo["os"]="Linux";
    if(strUA.indexOf("palmsource")>-1||strUA.indexOf("palmos")>-1) arrInfo["os"]="PalmOS";
    if(strUA.indexOf("wap ")>-1) arrInfo["os"]="WAP";

    return arrInfo;
  }

}

</script>