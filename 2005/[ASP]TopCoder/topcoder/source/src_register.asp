<script language="JScript" runAt="server">
// Check if file is called inside LBS
var inLBS;
if(inLBS!=true){
  Response.write("Invalid Call");
  Response.End();
}
</script>
<%
//====== User Registration PAGE LOGIC ========================
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-02-26 23:57:15
//============================================================

pageHeader(lang["reg_title"]);

if(theCache.settings["enableRegister"]!=1){
  // If register is disabled
  redirectMessage(lang["error"], lang["reg_disabled"], lang["goback"], "default.asp", false, "errorbox");
}else if(Session("registered")||theUser.loggedIn){
  // If user is already logged in
  redirectMessage(lang["error"], lang["reg_already"], lang["goback"], "default.asp", false, "errorbox");
}else{
  switch(String(input["act"])){
    case "agree":
      // Make sure user is post from the form
      theCache.genSecurityCode();

      outputRegisterForm();
      break;
    case "save":
      // Do register
      var strError=theUser.register(input, true);
      if(strError!=false){
        // Show errors
        strError=lang["reg_error"]+'<ul id="errorlist">'+strError+"</ul>"
        redirectMessage(lang["error"], strError, lang["goback"], "javascript:window.history.back();", false, "errorbox");
      }else{
        // Redirect to index
        redirectMessage(lang["done"], lang["reg_done"], lang["redirect"], "default.asp", true, "messagebox");
      }
      break;
    default:
      outputRegisterAgreement();
  }
}

pageFooter();

%>