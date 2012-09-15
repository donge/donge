<script language="JScript" runAt="server">
// Check if file is called inside LBS
var inLBS;
if(inLBS!=true){
  Response.write("Invalid Call");
  Response.End();
}
</script>
<%
//====== User PAGE LOGIC =====================================
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-03-15 10:25:41
//============================================================

if(input["id"]){
  switch(String(input["act"])){
    case "edit":
      editUserInfo(false);
      break;
    case "update":
      editUserInfo(true);
      break;
    case "delete":
      deleteUser();
      break;
    default:
      viewUserInfo();
  }
}else{
  pageHeader(lang["reg_users"]);
  viewUserList();
}

pageFooter();


// View User List //////////////////////////////////////////////////////////////
function viewUserList(){

  // Check current page number
  if(input["page"]){
    input["page"]=func.checkInt(input["page"]);
    if(input["page"]<=0){
      input["page"]=1;
    }
  }else{
    input["page"]=1;
  }

  var users, entryCount;
  
  var sqlWHERE="";
  var strSQL = "SELECT user_id, user_name, user_email, user_hideEmail, user_homepage, user_articleCount, user_commentCount, user_lastVisit FROM [blog_User] "+sqlWHERE+" ORDER BY user_articleCount DESC, user_commentCount DESC, user_lastVisit DESC";
  
  users = connBlog.query(strSQL, theCache.settings["articlePerPageList"], input["page"], false);

  if(users){
    entryCount = connBlog.recordCount;
  }else{
    users="";
    entryCount = 0;
  }
    outputUserList(users, entryCount, theCache.settings["articlePerPageList"], input["page"]);
}

// View User Info /////////////////////////////////////////////////////////////
function viewUserInfo(){
  var tUser=new lbsUser();
  var strError=tUser.loadByID(input["id"]);

  if(strError!=false){
    pageHeader(lang["error"]);
    redirectMessage(lang["error"], strError, lang["goback"], "javascript:window.history.back();", false, "errorbox");
  }else{
    pageHeader(lang["user_info"]);
    outputUserInfo(tUser);
  }
}

// Edit User Info /////////////////////////////////////////////////////////////
function editUserInfo(bSave){
  var tUser=new lbsUser();
  var strError=tUser.loadByID(input["id"]);

  if(strError!=false){
    pageHeader(lang["error"]);
    redirectMessage(lang["error"], strError, lang["goback"], "javascript:window.history.back();", false, "errorbox");
  }else if(tUser.id!=theUser.id&&theUser.groupID!=1){
    pageHeader(lang["error"]);
    redirectMessage(lang["error"], lang["no_rights"], lang["goback"], "javascript:window.history.back();", false, "errorbox");
  }else{
    if(!bSave){
      // Output edit form
      theCache.genSecurityCode();

      pageHeader(lang["edit_profile"]);
      outputUserForm(tUser);
    }else{
      // Save edit result
      var strError="";
      
      // Let Admin change User's Group
      if(theUser.groupID==1){
        input["groupid"]=func.checkInt(input["groupid"]);
        for(var i=0;i<theCache.userGroup.length;i++){
          if(input["groupid"]==theCache.userGroup[i].id){
            tUser.groupID=input["groupid"];
            break;
          }
        }
      }
      
      // Check Current Password
      if(!func.checkPassword(input["oldpassword"])){
        strError+="<li>"+lang["old_password_invalid"]+"</li>";
      }else{
        if(theUser.groupID==1&&theUser.id!=tUser.id){
          var tmpA=connBlog.query("SELECT user_password, user_salt FROM [blog_User] WHERE user_id="+theUser.id);
          if(!tmpA){
            strError+="<li>"+lang["user_not_found"]+"</li>";
          }else{
            if(tmpA[0]["user_password"]!=func.SHA1(input["oldpassword"]+tmpA[0]["user_salt"])){
              strError+="<li>"+lang["old_password_invalid"]+"</li>";
            }
          }
        }else{
          if(tUser.password!=func.SHA1(input["oldpassword"]+tUser.salt)){
            strError+="<li>"+lang["old_password_invalid"]+"</li>";
          }
        }
      }

      // Check Post data
      if(strError=="") strError+=tUser.fillFromPost(true,true, theUser.groupID==1 ? true : false);

      // Check for post data
      if(strError!=""){
        // Avoid password breaker
        if(Session("loginfail")>3){
          Session("lbsSecurityCode")=undefined;
        }
        if(!Session("loginfail"))Session("loginfail")=0;
        Session("loginfail")++;

        // Return with error message
        pageHeader(lang["error"]);
        redirectMessage(lang["error"], strError, lang["goback"], "javascript:window.history.back();", false, "errorbox");
      }else{
        // Clean up to avoid abuse
        Session("lbsSecurityCode")=undefined;

        tUser.update();
        
        pageHeader(lang["done"]);
        redirectMessage(lang["done"], lang["profile_updated"], lang["redirect"], "?id="+tUser.id, true, "messagebox");
      }
    }
  }
}

// Delete User /////////////////////////////////////////////////////////////
function deleteUser(){
  var tUser=new lbsUser();
  var strError=tUser.loadByID(input["id"]);

  if(strError!=false){
    pageHeader(lang["error"]);
    redirectMessage(lang["error"], strError, lang["goback"], "javascript:window.history.back();", false, "errorbox");
  }else if(tUser.id!=theUser.id&&theUser.groupID!=1){
    pageHeader(lang["error"]);
    redirectMessage(lang["error"], lang["no_rights"], lang["goback"], "javascript:window.history.back();", false, "errorbox");
  }else{
    tUser.doDelete();

    pageHeader(lang["done"]);
    redirectMessage(lang["done"], lang["user_deleted"], lang["redirect"], "?", true, "messagebox");
  }
}
%>