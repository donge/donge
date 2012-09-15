<script language="JScript" runAt="server">
// Check if file is called inside LBS
var inLBS;
if(inLBS!=true){
  Response.write("Invalid Call");
  Response.End();
}

//====== CLASS lbsArticle ====================================
// Article Class for LBS
//
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-02-26 23:57:15
//============================================================

function lbsArticle(){
  ////// Attributes //////////////////////////////////////////

  // Public
  this.id=0;
  this.authorID=0;
  this.author="";
  this.category;
  this.categoryID=0;
  this.title="";
  this.content0="";
  this.content1="";
  this.comments;
  this.trackbacks;
  this.editMark="";
  this.postTime=new Date();
  this.IP="";
  this.mode;
  this.locked = false;
  this.selected = false;
  this.ubbFlags="";
  this.viewCount;
  this.commentCount;
  this.trackbackURL="";
  this.trackbackCount;
  this.trackbackAgain = false;
  this.nextArticle;
  this.prevArticle;


  ////// Methods ////////////////////////////////////////////////

  // Load Article --------------------------
  this.load = function(strSelect, strWhere){
    var tmpA=connBlog.query("SELECT TOP 1 "+strSelect+" FROM [blog_Article] WHERE "+strWhere);
    if(tmpA){
      this.fill(tmpA[0]);
      return true;
    }else{
      return false;
    }
  }

  // Load Article By ID --------------------
  this.loadByID = function(intID, bLoadSideArticle){
    if(!func.checkInt(intID)){
      return lang["invalid_parameter"];
    }
    // Load from cache
    var article=theCache.getArticleByID(intID);
    if(article){
      this.fill(article);
      return false;
    }
    // Load from DB
    if(this.load("*", "log_ID="+func.checkInt(intID))){
      return false;
    }else{
      return lang["article_not_found"];
    }
  }

  // Fill Article Object -------------------
  this.fill = function(arr){
      this.id = arr["log_id"];
      this.author = arr["log_author"];
      this.authorID = arr["log_authorid"];
      this.categoryID = arr["log_catid"];
      this.category = theCache.getCategoryByID(this.categoryID);
      this.title = arr["log_title"];
      this.content0 = arr["log_content0"];
      this.content1 = arr["log_content1"];
      this.editMark = arr["log_editmark"];
      this.postTime = new Date(Number(arr["log_posttime"]));
      this.IP  = arr["log_ip"];
      this.mode  = arr["log_mode"];
      this.locked = arr["log_locked"];
      this.selected = arr["log_selected"];
      this.ubbFlags = arr["log_ubbflags"];
      this.viewCount = arr["log_viewcount"];
      this.commentCount = arr["log_commentcount"];
      this.trackbackCount = arr["log_trackbackcount"];
      this.trackbackURL = arr["log_trackbackurl"];
      this.disableTrackback = arr["log_disabletrackback"];
  }

  // Load Side Article --------------------------
  this.loadSideArticle = function(){
    this.nextArticle=this.getSideArticle(true);
    this.prevArticle=this.getSideArticle(false);
  }

  // Get Side Article --------------------------
  this.getSideArticle = function(bNext){


    // Construct SQL String
    var sql="SELECT TOP 1 log_ID,log_Title FROM [blog_Article] WHERE log_PostTime";
    if(bNext){
      sql+=">";
    }else{
      sql+="<";
    }
    sql+="#"+func.getDateTimeString("",this.postTime)+"#";

    if(theUser.rights["view"]<1) return false;
    if(theUser.rights["view"]==1) sql += theUser.loggedIn ? "AND log_mode<3": "AND log_mode=1";
    if(theUser.rights["view"]<2){
      for(var i=0;i<theCache.categories.length;i++){
        if(theCache.categories[i].hidden) sql += " AND log_catid<>"+theCache.categories[i].id;
      }
    }
    if(theUser.rights["view"]==2) sql+="AND log_mode<4";

    sql+=" ORDER BY log_PostTime";
    if(bNext){
      sql+=" ASC";
    }else{
      sql+=" DESC";
    }
    
    // Query
    var tmpA=connBlog.query(sql);
    if(tmpA){
      return {"id": tmpA[0]["log_id"], "title": tmpA[0]["log_title"]};
    }else{
      return false;
    }
  }

  // Load Comments --------------------------
  this.loadComments = function(bTimeOrder, bWithTrackBack, intTrackbackPos, intPageSize, intCurrentPage){
	  var sql="SELECT 0 as type, comm_ID,comm_Content,comm_authorID,comm_author,comm_PostTime,comm_EditMark,comm_UBBFlags,comm_Hidden,comm_IP FROM blog_Comment WHERE log_ID="+this.id;
    
    if(bWithTrackBack){
      // Trackback Fields Mapping: comm_ID=0, comm_Content=tb_Excerpt, comm_authorID=tb_ID, comm_author=tb_Title
      sql+=" UNION ALL SELECT 1,0,tb_Excerpt,tb_ID,tb_Title,tb_Time,tb_URL,tb_Blog,false,tb_IP FROM blog_Trackback WHERE log_ID="+this.id;
    }
    
    sql+=" ORDER BY";
    if(bWithTrackBack){
      if(intTrackbackPos==1){
        sql+=" type DESC,";
      }else if(intTrackbackPos==2){
        sql+=" type ASC,";
      }
    }
    if(bTimeOrder){
     sql+=" comm_PostTime DESC";
    }else{
     sql+=" comm_PostTime ASC";
    }

    // Get data
    var tmpA;
    if(intPageSize>0){
      tmpA=connBlog.query(sql, intPageSize, input["page"], false);
    }else{
      tmpA=connBlog.query(sql);
    }

    if(tmpA){
      this.comments=new Array();
      for(var i=0;i<tmpA.length;i++){
        if(tmpA[i]["type"]==0){
          // normal comment
          this.comments[i]={ "type": 0,
                             "id": tmpA[i]["comm_id"],
                             "content": tmpA[i]["comm_content"],
                             "authorID": tmpA[i]["comm_authorid"],
                             "author": tmpA[i]["comm_author"],
                             "postTime": new Date(Number(tmpA[i]["comm_posttime"])),
                             "editMark": tmpA[i]["comm_editmark"],
                             "ubbFlags": tmpA[i]["comm_ubbflags"],
                             "hidden": tmpA[i]["comm_hidden"],
                             "IP": tmpA[i]["comm_ip"]
                            }
        }else{
          // trackback entry
          this.comments[i]={ "type": 1,
                             "id": tmpA[i]["comm_authorid"],
                             "excerpt": tmpA[i]["comm_content"],
                             "title": tmpA[i]["comm_author"],
                             "time": new Date(Number(tmpA[i]["comm_posttime"])),
                             "IP": tmpA[i]["comm_ip"],
                             "url": tmpA[i]["comm_editmark"],
                             "blog": tmpA[i]["comm_ubbflags"]
                            }
        }
      }
      return connBlog.recordCount;
    }else{
      this.comments=false;
      return 0;
    }
  }

  // Fill Article Object From Edit Form Data -------------------
  this.fillFromPost = function(bEdit){
    var strError="";
    // Get Data
    if(!input["log_title"]||!input["log_catid"]||!input["message"]){
      strError+="<li>"+lang["form_incomplete"]+"</li>";
    }

    this.categoryID = func.checkInt(input["log_catid"]);
    // Check If the Category Exists
    this.category = theCache.getCategoryByID(this.categoryID);
    if(this.category.id==0){
      strError+="<li>"+lang["invalid_cat"]+"</li>";
    }
    
    this.mode = func.checkInt(input["log_mode"]);
    if(this.mode==0){
      strError+="<li>"+lang["invalid_mode"]+"</li>";
    }
    
    this.title = func.trim(input["log_title"]);
    if(this.title.length<1||this.title.length>255){
      strError+="<li>"+lang["title_invalid"]+"</li>";
    }

    this.postTime = func.parseDateTime(input["log_posttime"]);
    if(this.postTime==null) this.postTime = new Date();

    this.ubbFlags = "";
    this.ubbFlags+= input["e_ubb"]=="true" ? "1":"0";
    this.ubbFlags+= input["e_autourl"]=="true" ? "1":"0";
    this.ubbFlags+= input["e_image"]=="true" ? "1":"0";
    this.ubbFlags+= input["e_media"]=="true" ? "1":"0";
    this.ubbFlags+= input["e_smilies"]=="true" ? "1":"0";
    this.ubbFlags+= "1"; // bTextBlock - always 1
    if(input["e_html"]=="true") this.ubbFlags = "html";
    
    this.content0 = func.trim(input["message"]);
    this.content1 = "";
    if(this.ubbFlags=="html"){
      // Clean up the HTML a little
      this.content0=func.cleanHTML(this.content0);
      this.content0=func.closeHTML(this.content0);
    }
    if(this.content0.length<2){
      strError+="<li>"+lang["content_blank"]+"</li>";
    }else{
      // Split Content
      var pos=this.content0.indexOf("[separator]");
      if(pos>0){
        this.content1=this.content0.substr(pos);
        this.content0=this.content0.substr(0,pos);
      }else if(theCache.settings["enableContentAutoSplit"]==1 && this.content0.length>theCache.settings["contentAutoSplitChars"]){
        var intLength=theCache.settings["contentAutoSplitChars"];
        if(this.ubbFlags=="html"){
          pos=getSplitPosHTML(this.content0,intLength);
        }else{
          pos=getSplitPos(this.content0,intLength);
        }
        if(pos!=false){
          this.content1=this.content0.substr(pos);
          this.content0=this.content0.substr(0,pos);
        }
      }
    }

    // Data that needs no validation
    if(bEdit) this.editMark = theUser.username+"$|$"+func.getDateTimeString();
    this.IP  = theUser.IP;
    this.locked = input["log_locked"]=="true" ? true : false;
    this.selected = input["log_selected"]=="true" ? true : false;

    // Check if we need to send a trackback again
    if(this.trackbackURL!=input["log_trackbackurl"]) this.trackbackAgain = true;
    this.trackbackURL = func.trim(input["log_trackbackurl"]);

    return strError;
  }

  // Get Auto Split Position
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

  // Get Auto Split Position For HTML Content
  function getSplitPosHTML(str, intChars){
    // Check if the text block left behind is big enough
    if(str.length<=intChars||intChars==0) return false;
    if(str.length<=intChars+80) return false;

    // Caculate tags length in area
    intChars+=intChars-func.trimHTML(str.substr(0,intChars)).length;

    // Snap to the Nearest Space Char
    var nearCloseTag=str.indexOf(" ",intChars-10);
    if(nearCloseTag>-1&&nearCloseTag<intChars+30) intChars=nearCloseTag+1;
    // Snap to the <br/> tag
    nearCloseTag=str.indexOf("<br/>",intChars-10);
    if(nearCloseTag>-1&&nearCloseTag<intChars+30) intChars=nearCloseTag+5;
    // Snap to a close tag
    nearCloseTag=str.indexOf("</",intChars-10);
    if(nearCloseTag>-1) nearCloseTag=str.indexOf(">",nearCloseTag);
    if(nearCloseTag>-1&&nearCloseTag<intChars+30) intChars=nearCloseTag+1;

    return intChars;
  }

  // Update --------------------------
  this.update = function(){
    var arrUpdate={ "log_catID": this.categoryID,
                    "log_title": this.title,
                    "log_content0": this.content0,
                    "log_content1": this.content1,
                    "log_ip": theUser.IP,
                    "log_editMark": this.editMark,
                    "log_trackbackURL": this.trackbackURL,
                    "log_mode": this.mode,
                    "log_postTime": this.postTime,
                    "log_locked": this.locked,
                    "log_selected": this.selected,
                    "log_ubbFlags": this.ubbFlags
                    };
    connBlog.update("[blog_Article]", arrUpdate,"log_id="+this.id);
  }

  // Insert --------------------------
  this.insert = function(){
    var arrInsert={ "log_catID": this.categoryID,
                    "log_authorID": theUser.id,
                    "log_author": theUser.username,
                    "log_title": this.title,
                    "log_content0": this.content0,
                    "log_content1": this.content1,
                    "log_ip": theUser.IP,
                    "log_trackbackURL": this.trackbackURL,
                    "log_mode": this.mode,
                    "log_postTime": this.postTime,
                    "log_locked": this.locked,
                    "log_selected": this.selected,
                    "log_ubbFlags": this.ubbFlags
                    };
    connBlog.insert("[blog_Article]", arrInsert);
    connBlog.updateSQL("[blog_Settings]","set_value0=set_value0+1", "set_name='counterArticle'");
    theCache.updateGlobalCounter("counterArticle",1);
  }

  this.doDelete = function(){
    connBlog.doDelete("[blog_Article]","log_id="+this.id);
    connBlog.doDelete("[blog_Comment]","log_id="+this.id);
    connBlog.doDelete("[blog_Trackback]","log_id="+this.id);
    connBlog.updateSQL("[blog_Settings]","set_value0=set_value0-1", "set_name='counterArticle'");
    theCache.updateGlobalCounter("counterArticle",-1);
  }
}

</script>
