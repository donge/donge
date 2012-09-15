<script language="JScript" runAt="server">
// Check if file is called inside LBS
var inLBS;
if(inLBS!=true){
  Response.write("Invalid Call");
  Response.End();
}

//====== CLASS lbsCache ======================================
// Cache class used as the Global Data Container
//
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-05-11 09:59:55
//============================================================

function lbsCache(){
  ////// Attributes /////////////////////////////////////////////
  
  // Public
  this.settings = new Array();
  this.settingsCount;
  this.userGroup = new Array();
  this.categories = new Array();
  this.smilies = new Array();
  this.wordFilter = new Array();
  this.categoriesCount;
  this.calendarHTML;
  this.recentArticles = new Array();
  this.recentComments = new Array();
  this.loaded = false;
  this.articleMode = ["","",lang["draft"],lang["hidden"],lang["private"]];

  ////// Methods ////////////////////////////////////////////////

  // Load All Caches --------------------------
  this.load = function(){
    if(Application(lbsNamespace+"cacheSettings")!=undefined){
      this.fillSettings(Application(lbsNamespace+"cacheSettings"));
    }else{
      this.loadSettings();
    }
    if(Application(lbsNamespace+"cacheCategories")!=undefined){
      this.fillCategories(Application(lbsNamespace+"cacheCategories"));
    }else{
      this.loadCategories();
    }
    if(Application(lbsNamespace+"cacheUserGroup")!=undefined){
      this.fillUserGroup(Application(lbsNamespace+"cacheUserGroup"));
    }else{
      this.loadUserGroup();
    }
    if(Application(lbsNamespace+"cacheSmilies")!=undefined){
      this.fillSmilies(Application(lbsNamespace+"cacheSmilies"));
    }else{
      this.loadSmilies();
    }
    if(Application(lbsNamespace+"cacheWordFilter")!=undefined){
      this.fillWordFilter(Application(lbsNamespace+"cacheWordFilter"));
    }else{
      this.loadWordFilter();
    }
    if(Application(lbsNamespace+"cacheCalendar")!=undefined&&Application(lbsNamespace+"cacheCalendarDay")==(new Date()).getDate()){
      this.calendarHTML=Application(lbsNamespace+"cacheCalendar");
    }else{
      this.loadCalendar();
    }
    if(Application(lbsNamespace+"cacheArticles")!=undefined){
      this.fillArticles(Application(lbsNamespace+"cacheArticles"));
    }else{
      this.loadArticles();
    }
    if(Application(lbsNamespace+"cacheComments")!=undefined){
      this.fillComments(Application(lbsNamespace+"cacheComments"));
    }else{
      this.loadComments();
    }
    this.loaded = true;
  }

  // Load All From DB --------------------------
  this.loadFromDB = function(){
    this.loadSettings();
    this.loadCategories();
    this.loadUserGroup();
    this.loadSmilies();
    this.loadCalendar();
    this.loadArticles();
    this.loadComments();
    this.loaded = true;
  }

  // Load Settings ----------------------------
  this.loadSettings = function(){
    this.settings = new Array();
    this.saveToCache(lbsNamespace+"cacheSettings","none");
    var tmpA=connBlog.query("SELECT * FROM [blog_Settings]",undefined,undefined,true);
    if(tmpA!=null){
      if(tmpA.ubound(2)>-1){
        this.saveToCache(lbsNamespace+"cacheSettings",tmpA);
        this.fillSettings(tmpA);
      }
    }
    delete tmpA;
  }

  // Fill Settings ----------------------------
  this.fillSettings = function(arr){
    if(arr=="none") return;
    this.settingsCount=arr.ubound(2);
    for(var i=0;i<=arr.ubound(2);i++){
      var tValue = (arr.getItem(1,i)==0) ? arr.getItem(2,i) : arr.getItem(3,i);
      this.settings[arr.getItem(0,i)]=tValue;
    }
  }

  // Load Categories ----------------------------
  this.loadCategories = function(){
    this.categories = new Array();
    this.saveToCache(lbsNamespace+"cacheCategories","none");
    // Don't change the order of the fields in SQL string
    var tmpA=connBlog.query("SELECT cat_ID,cat_Name,cat_Order,cat_articleCount,cat_hidden,cat_Locked FROM [blog_Category] ORDER BY cat_Order ASC",undefined,undefined,true);
    if(tmpA!=null){
      if(tmpA.ubound(2)>-1){
        this.saveToCache(lbsNamespace+"cacheCategories",tmpA);
        this.fillCategories(tmpA);
      }
    }
    delete tmpA;
  }

  // Fill Categories ----------------------------
  this.fillCategories = function(arr){
    if(arr=="none") return;
    var count=arr.ubound(2);
    for(var i=0;i<=count;i++){
      this.categories[i]={ "id": arr.getItem(0,i),
                           "name": arr.getItem(1,i),
                           "order": arr.getItem(2,i),
                           "articleCount": arr.getItem(3,i),
                           "hidden": arr.getItem(4,i),
                           "locked": arr.getItem(5,i)
                         };
    }
  }

  // Get Category by ID ----------------------------
  this.getCategoryByID = function(intID){
    for(var i in this.categories){
      if(this.categories[i].id==intID){
        return this.categories[i];
      }
    }
    return {"id":0, "name":"", "articleCount": 0, "hidden": true, "locked": true};
  }
  
  // Load User Group Info ----------------------------
  this.loadUserGroup = function(){
    this.userGroup = new Array();
    this.saveToCache(lbsNamespace+"cacheUserGroup","none");
    // Don't change the order of the fields in SQL string
    var tmpA=connBlog.query("SELECT group_ID,group_Name,group_Rights FROM [blog_UserGroup]",undefined,undefined,true);
    if(tmpA!=null){
      if(tmpA.ubound(2)>-1){
        this.saveToCache(lbsNamespace+"cacheUserGroup",tmpA);
        this.fillUserGroup(tmpA);
      }
    }
    delete tmpA;
  }

  // Fill User Group ----------------------------
  this.fillUserGroup = function(arr){
    if(arr=="none") return;
    var count=arr.ubound(2);
    for(var i=0;i<=count;i++){
      var strRights=arr.getItem(2,i);
      var arrRights=new Array();
      for(var j=0;j<strRights.length;j++){
        arrRights[j]=parseInt(strRights.charAt(j),10);
      }
      this.userGroup[i]={ "id": arr.getItem(0,i),
                          "name": arr.getItem(1,i),
                          "rights": {"view":arrRights[0], "post":arrRights[1], "edit":arrRights[2], "delete":arrRights[3], "upload":arrRights[4] }
                         };
    }
  }
  
  // Load Smilies Data----------------------------
  this.loadSmilies = function(){
    this.smilies = new Array();
    this.saveToCache(lbsNamespace+"cacheSmilies","none");
    // Don't change the order of the fields in SQL string
    var tmpA=connBlog.query("SELECT sm_id,sm_code,sm_image FROM [blog_Smilies]",undefined,undefined,true);
    if(tmpA!=null){
      if(tmpA.ubound(2)>-1){
        this.saveToCache(lbsNamespace+"cacheSmilies",tmpA);
        this.fillSmilies(tmpA);
      }
    }
    delete tmpA;
  }

  // Fill Smilies Array ----------------------------
  this.fillSmilies = function(arr){
    if(arr=="none") return;
    var count=arr.ubound(2);
    for(var i=0;i<=count;i++){
      this.smilies[i]={ "id": arr.getItem(0,i),
                        "code": arr.getItem(1,i),
                        "image": arr.getItem(2,i)
                       };
    }
  }
  
  // Load Word Filter List Data----------------------------
  this.loadWordFilter = function(){
    this.wordFilter = new Array();
    this.saveToCache(lbsNamespace+"cacheWordFilter","none");
    // Don't change the order of the fields in SQL string
    var tmpA=connBlog.query("SELECT wf_id,wf_mode,wf_text,wf_replace,wf_regExp FROM [blog_WordFilter]",undefined,undefined,true);
    if(tmpA!=null){
      if(tmpA.ubound(2)>-1){
        this.saveToCache(lbsNamespace+"cacheWordFilter",tmpA);
        this.fillWordFilter(tmpA);
      }
    }
    delete tmpA;
  }

  // Fill Word Filter List ----------------------------
  this.fillWordFilter = function(arr){
    if(arr=="none") return;
    var count=arr.ubound(2);
    for(var i=0;i<=count;i++){
      this.wordFilter[i]={ "id": arr.getItem(0,i),
                           "mode": arr.getItem(1,i),
                           "text": arr.getItem(2,i),
                           "replace": arr.getItem(3,i),
                           "isRegExp": arr.getItem(4,i)
                          };
    }
  }
  
  // Load Recent Articles----------------------------
  this.loadArticles = function(){
    this.recentArticles = new Array();
    this.saveToCache(lbsNamespace+"cacheArticles","none");
    var intCount=this.settings["recentArticleList"];
    if(func.checkInt(intCount)<10) intCount=10;
    if(func.checkInt(intCount)<this.settings["articlePerPageNormal"]) intCount=this.settings["articlePerPageNormal"];

    // Get a list of articles we need to cache
    var arrList=new Array();

    // Exclude articles in hidden category
    var sqlWHERE="";
    for(var i=0;i<theCache.categories.length;i++){
      if(theCache.categories[i].hidden) sqlWHERE+=" AND log_catid<>"+theCache.categories[i].id;
    }

    var tmpA=connBlog.query("SELECT TOP "+intCount+" log_id FROM [blog_Article] tLog WHERE log_mode=1 "+sqlWHERE+" ORDER BY log_postTime DESC");
    if(tmpA){
      for(var i=0;i<tmpA.length;i++){
        arrList=arrList.concat(tmpA[i]["log_id"]);
      }
    }
    delete tmpA;
    tmpA=connBlog.query("SELECT TOP "+intCount+" log_id FROM [blog_Article] ORDER BY log_postTime DESC");
    if(tmpA){
      for(var i=0;i<tmpA.length;i++){
        arrList=arrList.concat(tmpA[i]["log_id"]);
      }
    }
    delete tmpA;
    // Remove duplicated items
    arrList=arrList.sort();
    var arrItem=arrList[0];
    for(var i=1;i<arrList.length;i++){
      if(arrItem==arrList[i]){
        arrList.splice(i,1);
        i--;
      }else{
        arrItem=arrList[i];
      }
    }
    arrList=arrList.join(",");

    // Load articles from DB
    if(arrList!=""){
      // Get all article that later than that time
      // Don't change the order of the fields in SQL string
      tmpA=connBlog.query("SELECT log_id, log_catID, log_authorID, log_author, log_title, log_content0, log_content1, log_editMark, log_mode, log_locked, log_selected, log_ubbFlags, log_trackbackURL, log_postTime, log_ip, log_commentCount, log_viewCount, log_trackbackCount FROM [blog_Article] WHERE log_id IN ("+arrList+") ORDER BY log_postTime DESC",undefined,undefined,true);
      if(tmpA!=null){
        if(tmpA.ubound(2)>-1){
          this.saveToCache(lbsNamespace+"cacheArticles",tmpA);
          this.fillArticles(tmpA);
        }
      }
      delete tmpA;
    }
  }

  // Fill Recent Articles Array ----------------------------
  this.fillArticles = function(arr){
    if(arr=="none") return;
    var count=arr.ubound(2);
    for(var i=0;i<=count;i++){
      this.recentArticles[i]={"log_id": arr.getItem(0,i),
                              "log_catid": arr.getItem(1,i),
                              "log_authorid": arr.getItem(2,i),
                              "log_author": arr.getItem(3,i),
                              "log_title": arr.getItem(4,i),
                              "log_content0": arr.getItem(5,i),
                              "log_content1": arr.getItem(6,i),
                              "log_editmark":  arr.getItem(7,i),
                              "log_mode": arr.getItem(8,i),
                              "log_locked": arr.getItem(9,i),
                              "log_selected": arr.getItem(10,i),
                              "log_ubbflags": arr.getItem(11,i),
                              "log_trackbackurl": arr.getItem(12,i),
                              "log_posttime": arr.getItem(13,i),
                              "log_ip": arr.getItem(14,i),
                              "log_commentcount": arr.getItem(15,i),
                              "log_viewcount": arr.getItem(16,i),
                              "log_trackbackcount": arr.getItem(17,i)
                               };
    }
  }

  // Get Article by ID
  this.getArticleByID = function(intID){
    for(var i=0;i<this.recentArticles.length;i++){
      if(this.recentArticles[i]["log_id"]==intID){
        return this.recentArticles[i];
      }
    }
    return false;
  }

  // Load Recent Comments----------------------------
  this.loadComments = function(){
    this.recentComments = new Array();
    this.saveToCache(lbsNamespace+"cacheComments","none");
    var intCount=this.settings["recentCommentList"];
    if(func.checkInt(intCount)<10) intCount=10;
    // Get a list of comments we need to cache
    var arrList=new Array();
    var tmpA=connBlog.query("SELECT TOP "+intCount+" tComm.comm_id FROM [blog_Article] tLog, [blog_Comment] tComm, [blog_Category] tCat WHERE tLog.log_id=tComm.log_id AND tLog.log_catid=tCat.cat_id AND tLog.log_mode=1 AND tCat.cat_hidden=FALSE ORDER BY tComm.comm_postTime DESC");
    if(tmpA){
      for(var i=0;i<tmpA.length;i++){
        arrList=arrList.concat(tmpA[i]["comm_id"]);
      }
    }
    delete tmpA;
    tmpA=connBlog.query("SELECT TOP "+intCount+" comm_id FROM [blog_Comment] ORDER BY comm_postTime DESC");
    if(tmpA){
      for(var i=0;i<tmpA.length;i++){
        arrList=arrList.concat(tmpA[i]["comm_id"]);
      }
    }
    delete tmpA;
    // Remove duplicated items
    arrList=arrList.sort();
    var arrItem=arrList[0];
    for(var i=1;i<arrList.length;i++){
      if(arrItem==arrList[i]){
        arrList.splice(i,1);
        i--;
      }else{
        arrItem=arrList[i];
      }
    }
    arrList=arrList.join(",");

    if(arrList!=""){
      // Don't change the order of the fields in SQL string
      var tmpA=connBlog.query("SELECT tComm.comm_id, tComm.log_id, tComm.comm_author, tComm.comm_content, tComm.comm_hidden, tComm.comm_postTime, tLog.log_title, tLog.log_mode, tCat.cat_hidden, tComm.comm_ubbFlags FROM [blog_Article] tLog, [blog_Comment] tComm, [blog_Category] tCat WHERE tLog.log_id=tComm.log_id AND tLog.log_catid=tCat.cat_id AND tComm.comm_id IN ("+arrList+") ORDER BY tComm.comm_postTime DESC",undefined,undefined,true);
      if(tmpA!=null){
        if(tmpA.ubound(2)>-1){
          this.saveToCache(lbsNamespace+"cacheComments",tmpA);
          this.fillComments(tmpA);
        }
      }
      delete tmpA;
    }
  }

  // Fill Recent Comments Array ----------------------------
  this.fillComments = function(arr){
    if(arr=="none") return;
    var count=arr.ubound(2);
    for(var i=0;i<=count;i++){
      this.recentComments[i]={"id": arr.getItem(0,i),
                              "log_id": arr.getItem(1,i),
                              "author": arr.getItem(2,i),
                              "content": arr.getItem(3,i),
                              "hidden":  arr.getItem(4,i),
                              "postTime": new Date(Number(arr.getItem(5,i))),
                              "log_title": arr.getItem(6,i),
                              "log_mode": arr.getItem(7,i),
                              "cat_hidden": arr.getItem(8,i),
                              "ubbFlags": arr.getItem(9,i)
                               };
    }
  }

  // Load Calendar
  this.loadCalendar = function(){
    this.calendarHTML = this.generateCalendar();
    this.saveToCache(lbsNamespace+"cacheCalendar",this.calendarHTML);
    this.saveToCache(lbsNamespace+"cacheCalendarDay",(new Date()).getDate());
  }

  // Generate Calendar ------------------------------
  this.generateCalendar = function(intYear, intMonth){
    var tmpDate=new Date();
    if(intYear==undefined||intYear==0){
      intYear=tmpDate.getFullYear();
    }
    if(intMonth==undefined||intMonth==0){
      intMonth=tmpDate.getMonth()+1;
    }
    intToday=tmpDate.getDate();
    currentYear=tmpDate.getFullYear();
    currentMonth=tmpDate.getMonth()+1;

    var dayInMonth=[0,31,28,31,30,31,30,31,31,30,31,30,31];
    if((intYear%4==0 && intYear%100!=0) || (intYear%100==0 && (intYear/100)%4==0)){
      dayInMonth[2]=29;
    }

    var prevMonth = (intMonth-1)==0 ? 12: intMonth-1;
    var nextMonth = (intMonth+1)==13 ? 1 : intMonth+1;
    var prevYear = prevMonth==12 ? intYear-1 : intYear;
    var nextYear = nextMonth==1 ? intYear+1 : intYear;
    
    tmpDate.setFullYear(intYear,intMonth-1,1);
    var startWeekDay=tmpDate.getDay();

    var arrEvent=new Array();
    var tmpA=connBlog.query("SELECT log_Title,log_postTime,log_mode FROM [blog_Article] WHERE YEAR(log_PostTime)="+intYear+" AND MONTH(log_postTime)="+intMonth+" ORDER BY log_PostTime ASC");
    if(tmpA){
      for(var i=0;i<tmpA.length;i++){
        var tag=(new Date(Number(tmpA[i]["log_posttime"]))).getDate();
        if(arrEvent[tag]==undefined)arrEvent[tag]="";
        arrEvent[tag]+="- "+(tmpA[i]["log_mode"]>2 ? tmpA[i]["log_title"].replace(/./g,"*") : func.HTMLEncodeLite(tmpA[i]["log_title"]))+"\n";
      }
    }
    tmpA=/10f1ad1cc06f152380e5a6c39a33d6943fafd7da/;

    var output='<table cellspacing="1" width="100%" id="calendar">\n';
    output+='<tr><td colspan="7" class="calendar-top">';
    output+='\t<a href="default.asp?date='+(intYear-1)+'-'+intMonth+'">&laquo;</a>\n';
    output+='\t<a href="default.asp?date='+intYear+'-'+intMonth+'"><span class="calendar-year">'+intYear+'</span></a>\n';
    output+='\t<a href="default.asp?date='+(intYear+1)+'-'+intMonth+'">&raquo;</a>\n';
    output+='\t&nbsp;&nbsp;\n';
    output+='\t<a href="default.asp?date='+prevYear+'-'+prevMonth+'">&laquo;</a>\n';
    output+='\t<a href="default.asp?date='+intYear+'-'+intMonth+'"><span class="calendar-month">'+lang["month_"+intMonth]+'</span></a>\n';
    output+='\t<a href="default.asp?date='+nextYear+'-'+nextMonth+'">&raquo;</a>\n';
    output+='</td></tr>\n';
    output+='<tr class="calendar-weekdays">\n';
    for(var i=0;i<7;i++){
      output+='\t<td class="calendar-weekday-cell">'+lang["weekday_abbr_"+i]+'</td>\n';
    }
    output+='</tr>\n';
    if(startWeekDay>0) output+='<tr>\n';
    for(var i=0;i<startWeekDay;i++){
      output+='\t<td class="calendar-day-blank"></td>\n';
    }
    for(var i=1;i<=dayInMonth[intMonth];i++){
      var theDay=(i+startWeekDay)%7;
      var styleClass="calendar-day";
      if(theDay==0) styleClass="calendar-saturday";
      if(theDay==1) { output+='<tr>\n'; styleClass="calendar-sunday";}
      if(intYear==currentYear&&intMonth==currentMonth&&i==intToday) styleClass="calendar-today";
      output+='\t<td class="'+styleClass+'">';
      output+=arrEvent[i] ? '<a href="default.asp?date='+intYear+'-'+intMonth+'-'+i+'" class="calendar" title="'+arrEvent[i].substr(0,arrEvent[i].length-1)+'">'+i+"</a>" : i;
      output+='</td>\n';
      if(theDay==0){ output+='</tr>\n'; }
    }
    var sufBlank=7-(startWeekDay+dayInMonth[intMonth])%7;
    if(sufBlank!=0&&sufBlank!=7){
      for(var i=0;i<sufBlank;i++){
        output+='\t<td class="calendar-day-blank"></td>\n';
      }
      output+='</tr>\n';
    }
    output+='</table>\n';

    return output;

  }

  /////////// Update Routines Below ////////////

  </script>
  <script language="VBScript" runAt="server">
  'I have to use VBScript to dynamic update VBArray Cache
  Function updateVBArray(obj, id, tName, tValue, bSet)
    Dim i
    For i=0 To ubound(obj,2)
      If obj(0,i)=id Then
        If bSet Then
          obj(tName,i)=tValue
        Else
          obj(tName,i)=obj(tName,i)+tValue
        End If
        Exit For
      End If
    Next
    updateVBArray=obj
  End Function
  </script>
  <script language="JScript" runAt="server">

  // Update for Article Counter
  this.updateArticleCounter = function(id,strName,tValue){
    if(Application(lbsNamespace+"cacheArticles")==undefined)return;
    var intName;
    switch(strName){
      case "comment":
        intName=15;
        break;
      case "view":
        intName=16;
        break;
      case "trackback":
        intName=17;
        break;
    }
    Application(lbsNamespace+"cacheArticles")=updateVBArray(Application(lbsNamespace+"cacheArticles"), id, intName, tValue, false);

  }

  // Update for Global Counter
  this.updateGlobalCounter = function(id,tValue){
    if(Application(lbsNamespace+"cacheSettings")==undefined)return;
    Application(lbsNamespace+"cacheSettings")=updateVBArray(Application(lbsNamespace+"cacheSettings"), id, 2, tValue, false);

  }

  /////////// General Routines Below ////////////

  // Generate Security Code
  this.genSecurityCode = function(){
    if(Session("lbsSecurityCode")==undefined){
      Session("lbsSecurityCode")=func.randomStr(4,"0123456789");
    }else{
      if(Session("lbsSecurityCode").length!=4) Session("lbsSecurityCode")=func.randomStr(4,"0123456789");
    }
  }

  // Save to Cache
  this.saveToCache = function(strName,obj){
	  Application.Lock();
    Application(strName)=obj;
	  Application.Unlock();
  }

  // Delete from Cache
  this.deleteFromCache = function(strName,obj){
	  Application.Lock();
    Application.Contents.Remove(arrClean[i]);
	  Application.Unlock();
  }

  // Clean up caches
  this.clean = function(key){
    if(!key) key=lbsNamespace;
    var output="";
    var e = new Enumerator(Application.Contents);
    var arrClean=new Array();
    var i=0;
    for (;!e.atEnd();e.moveNext()){
      var itemName = e.item();
      if(itemName.substr(0,key.length)==key){
        arrClean[i]=itemName; // We have to delay the removal to get all item names
        i++;
        output+="<li><b>"+itemName+"</b> Cleaned</li>";
      }
    }
    Application.Lock();
    for(var i=0;i<arrClean.length;i++){
      Application.Contents.Remove(arrClean[i]);
    }
	  Application.Unlock();
    return output;
  }

  this.cleanAll = function(){
    Application.Contents.RemoveAll();
  }
}

</script>
