<script language="JScript" runAt="server">
// Check if file is called inside LBS
var inLBS;
if(inLBS!=true){
  Response.write("Invalid Call");
  Response.End();
}
</script>
<%
//====== Gusetbook PAGE LOGIC ================================
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-02-26 23:57:15
//============================================================


if(theCache.settings["enableGuestBook"]!=1||gbookDB==""){
  // If register is disabled
  pageHeader(lang["error"]);
  redirectMessage(lang["error"], lang["gbook_disabled"], lang["goback"], "default.asp", false, "errorbox");
  pageFooter();
}else{
  // Initialize DB Connection
  var connGBook=new DBConn(gbookDB);
  connGBook.open();

  switch(String(input["act"])){
    case "save":
      commentSave();
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
      theCache.genSecurityCode();
      // View Guestbook
      pageHeader(lang["guestbook"]);
      showGuestBook();
  }

  pageFooter();
  connGBook.close();
  if(inDebug) showSQLGB();
}

// Output GuestBook ////////////////////////////////////////////////////////////////////////////
function showGuestBook(){
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

  // Check if has search keywords
  if(input["q"]){
    sqlWHERE += " WHERE gb_hidden=False";
    arrKeywords=input["q"].split(" ");
    for(var i=0;i<input["q"].length;i++){
      if(func.lengthW(arrKeywords[i])>2){
        sqlWHERE += " AND (gb_content LIKE '%"+func.checkStr(arrKeywords[i])+"%' OR gb_reply LIKE '%"+func.checkStr(arrKeywords[i])+"%')";
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
  
  var entryPerPage = theCache.settings["entryPerPageGuestBook"];
  var entryCount=0;
  var entries = connGBook.query("SELECT * FROM [Guestbook]"+sqlWHERE+" ORDER BY gb_postTime DESC", entryPerPage, input["page"], false);

  if(entries){
    for(var i=0;i<entries.length;i++){
      var arrEntry={"id": entries[i]["gb_id"],
                   "userid": entries[i]["gb_userid"],
                   "username": entries[i]["gb_username"],
                   "content": entries[i]["gb_content"],
                   "editMark": entries[i]["gb_editmark"],
                   "ubbFlags": entries[i]["gb_ubbflags"],
                   "postTime": new Date(Number(entries[i]["gb_posttime"])),
                   "ip": entries[i]["gb_ip"],
                   "reply": entries[i]["gb_reply"],
                   "replyTime": new Date(Number(entries[i]["gb_replytime"])),
                   "replyUsername": entries[i]["gb_replyusername"],
                   "hidden": entries[i]["gb_hidden"]};
      entries[i]="";
      entries[i]=arrEntry;
    }
    entryCount = connGBook.recordCount;
  }else{
    entries="";
    entryCount = 0;
  }

  outputGuestBook(entries, entryCount, entryPerPage, input["page"], strURLPrefix, arrKeywords);
}

// Save New Entry //////////////////////////////////////////////////////////////////////////////////
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
    strError+=checkPostData(bCheckCode);

    // Check for ubbFlags
    var strUbbFlags=getUbbFlags();

    if(strError!=""){
      pageHeader(lang["error"]);
      redirectMessage(lang["error"], strError, lang["goback"], "javascript:window.history.back();", false, "errorbox");
    }else{
      var arrInsert={ "gb_content": input["message"],
                      "gb_userid": theUser.id,
                      "gb_username": theUser.username,
                      "gb_ubbFlags": strUbbFlags,
                      "gb_hidden": input["comm_hidden"]=="true" ? true:false,
                      "gb_postTime": new Date(),
                      "gb_ip": theUser.IP
                    };
      connGBook.insert("guestbook", arrInsert);

      // Clean up to avoid abuse
      Session("lbsSecurityCode")=undefined;

      // Flood Control
      Session("FloodControl")=new Date();

      // Output ok message
      pageHeader(lang["done"]);
      redirectMessage(lang["done"], lang["comment_save_done"], lang["redirect"], "?", true, "messagebox");
    }

  }
}

// Check Post Form Data -----------------------
function checkPostData(bCheckCode){

  var strError="";

  // Check Security Code
  if(theCache.settings["enableSecurityCode"]==1 && bCheckCode && Session("lbsSecurityCode")!=input["scode"]){
    strError+="<li>"+lang["scode_invalid"]+"</li>";
  }
  
  // Workaround for content/reply swap when the user has reply rights
  if(input["entry"]){
    input["reply"]=input["message"];
    input["message"]=input["entry"];
    if(input["reply"].length>theCache.settings["maxCommentLength"]||input["reply"].length<2){
      strError+="<li>"+lang["length_invalid"]+"</li>";
    }
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

// Edit Entry ///////////////////////////////////////////////////////////////////////////////////
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
      arrData=connGBook.query("SELECT TOP 1 gb_userid,gb_content,gb_reply,gb_ubbFlags,gb_hidden FROM [Guestbook] WHERE gb_id="+input["id"]);
      if(arrData){
        arrData=arrData[0];
        if(theUser.id!=arrData["gb_userid"]&&theUser.rights["edit"]<2){
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
        pageHeader(lang["guestbook"]);
        outputEditEntry(lang["edit_gbook_entry"], "?act=update&id="+input["id"], arrData["gb_content"], arrData["gb_ubbflags"],arrData["gb_hidden"],arrData["gb_reply"], theUser.rights["edit"]>2 ? true : false);
      }else{
        // Save changes
        var strError=checkPostData(true);
        var strUbbFlags=getUbbFlags();

        if(strError!=""){
          pageHeader(lang["error"]);
          redirectMessage(lang["error"], strError, lang["goback"], "javascript:window.history.back();", false, "errorbox");
        }else{
          var arrUpdate={ "gb_content": input["message"],
                          "gb_ubbFlags": strUbbFlags,
                          "gb_hidden": input["comm_hidden"]=="true" ? true:false
                        };
          if(input["message"]!=arrData["gb_content"]) arrUpdate["gb_editMark"] = theUser.username + "$|$" + func.getDateTimeString();

          // If the user has reply rights
          if(theUser.rights["edit"]>1){
            arrUpdate["gb_reply"]=input["reply"];
            arrUpdate["gb_replyUsername"]=theUser.username;
            arrUpdate["gb_replyTime"]=new Date();
          }

          connGBook.update("guestbook", arrUpdate, "gb_id="+input["id"]);

          // Clean up to avoid abuse
          Session("lbsSecurityCode")=undefined;
          // Output ok message
          pageHeader(lang["done"]);
          redirectMessage(lang["done"], lang["comment_save_done"], lang["redirect"], "?", true, "messagebox");
        }
      }
    }
  }
}

// Delete Comment /////////////////////////////////////////////////////////////////////////////
function commentDelete(){
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
      var arrData=connGBook.query("SELECT TOP 1 gb_userid FROM [Guestbook] WHERE gb_id="+input["id"]);
      if(arrData){
        arrData=arrData[0];
        if(theUser.id!=arrData["gb_userid"]&&theUser.groupID!=1&&theUser.rights["delete"]<2){
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
      connGBook.doDelete("[Guestbook]","gb_id="+input["id"]);

      pageHeader(lang["done"]);
      redirectMessage(lang["done"], lang["comment_delete_done"], lang["redirect"], "?", true, "messagebox");
    }

  }
}

// SQL Debug Output for GBook
function showSQLGB(){
  write("<div style='margin: 10px;width: 100%'><div><table style='background: #CCCCCC; font-size: 12px;' width='100%' cellpadding='3' cellspacing='1'>");
  write("<tr><th>SQL: "+connGBook.queryCount+" queries</th><th>Return</th><th>Total</th></tr>");
  for(var i=0;i<connGBook.debugData.length;i++){
    write("<tr style='background:#FCFCFC'><td>"+connGBook.debugData[i][0]+"</td><td>"+connGBook.debugData[i][1]+"</td><td>"+connGBook.debugData[i][2]+"</td></tr>")
  }
  write("</table></div></div>");
}

%>