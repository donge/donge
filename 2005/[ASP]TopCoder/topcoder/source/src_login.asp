<script language="JScript" runAt="server">
// Check if file is called inside LBS
var inLBS;
if(inLBS!=true){
  Response.write("Invalid Call");
  Response.End();
}
</script>
<%
//====== Login PAGE LOGIC ====================================
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-02-26 23:57:15
//============================================================


if(strReferer==undefined){strReferer="default.asp";}
if(strReferer.indexOf("login.asp")!=-1||strReferer.indexOf("?act=")>-1){ strReferer="default.asp";}

switch(String(input["act"])){
  case "login":
    pageHeader(lang["login"]);
    if(theUser.loggedIn){
      // If user is already logged in
      redirectMessage(lang["error"], lang["login_already"], lang["goback"], "default.asp", false, "errorbox");
    }else{
      var strError=theUser.login(input["username"],input["password"],input["cookiesday"],true,input["scode"]);
      if(strError==false){
        redirectMessage(lang["done"], lang["login_done"], lang["redirect"], strReferer, true, "messagebox");
      }else{
        strError=lang["login_error"]+'<ul id="errorlist">'+strError+"</ul>"
        redirectMessage(lang["error"], strError, lang["goback"], "javascript:window.history.back();", false, "errorbox");
      }
      theCache.genSecurityCode();
    }
    break;
  case "logout":
    if(theUser.loggedIn){
      theUser.logout(true);
    }else{
      theUser.logout(false);
    }
    theCache.genSecurityCode();
    pageHeader(lang["logout"]);
    redirectMessage(lang["done"], lang["logout_done"], lang["redirect"], strReferer, true, "messagebox");
    break;
  default:
    // Generate security code
    theCache.genSecurityCode();

    pageHeader(lang["login"]);
    outputLoginForm();
}

pageFooter();

%>