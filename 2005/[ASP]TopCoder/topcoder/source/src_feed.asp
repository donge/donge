<script language="JScript" runAt="server">
// Check if file is called inside LBS
var inLBS;
if(inLBS!=true){
  Response.write("Invalid Call");
  Response.End();
}
</script>
<%
//====== Feed PAGE LOGIC =====================================
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-03-19 16:37:20
//============================================================

var sqlWHERE="";

// Generate a list of hidden categories
for(var i=0;i<theCache.categories.length;i++){
  if(theCache.categories[i].hidden){
    sqlWHERE += " AND tLog.log_catID<>"+theCache.categories[i].id;
  }
}

if(input["q"]=="comment"){

  // Check article id
  if(input["id"]){
    input["id"]=func.checkInt(input["id"]);
    if(input["id"]>0){
      sqlWHERE += " AND tLog.log_id="+input["id"];
    }
  }

  // Load Comments from DB when needed
  var comments;
  if(input["id"]>0){
    var strSQL = "SELECT TOP 10 tComm.comm_id, tComm.log_id, tComm.comm_author, tComm.comm_content, tComm.comm_postTime, tComm.comm_ubbFlags, tLog.log_title FROM [blog_Article] tLog, [blog_Comment] tComm WHERE tLog.log_id=tComm.log_id AND tLog.log_mode=1 AND tLog.log_id="+input["id"]+" AND tComm.comm_hidden=false"+sqlWHERE+" ORDER BY tComm.comm_postTime DESC";
    comments = connBlog.query(strSQL);
    if(!comments) comments=new Array();
    for(var i=0;i<comments.length;i++){
      comments[i]={ "id": comments[i]["comm_id"],
                    "log_id": comments[i]["log_id"],
                    "author": comments[i]["comm_author"],
                    "content": comments[i]["comm_content"],
                    "postTime": new Date(Number(comments[i]["comm_posttime"])),
                    "log_title": comments[i]["log_title"],
                    "ubbFlags": comments[i]["comm_ubbflags"]
                     };
    }

  }else{
    comments=theCache.recentComments;
  }
  
  // Output RSS 2 Comments
  outputCommentRSS2(comments);

}else{

  // Check category id
  if(input["cat"]){
    input["cat"]=func.checkInt(input["cat"]);
    if(input["cat"]>0){
      sqlWHERE += " AND tLog.log_catID="+input["cat"];
    }
  }

  // Check if output selected content only
  if(input["selected"]=="true"){
    sqlWHERE += " AND tLog.log_selected=true";
  }

  // Load articles from DB when needed
  var articles;
  if(input["cat"]>0||input["selected"]=="true"){
    var strSQL = "SELECT TOP 10 tLog.log_id, tLog.log_catid, tLog.log_title, tLog.log_authorid, tLog.log_author, tLog.log_mode, tLog.log_ubbFlags, tLog.log_postTime, tLog.log_content0 FROM [blog_Article] tLog WHERE tLog.log_mode=1"+sqlWHERE+" ORDER BY tLog.log_postTime DESC";
    articles = connBlog.query(strSQL);
    if(!articles) articles="";
  }else{
    articles=theCache.recentArticles;
  }

  if(input["type"]=="js"){
    // Output article with JS template
    outputJS(articles);
  }else{
    // Output article with RSS2 template
    outputRSS2(articles);
  }
}

%>