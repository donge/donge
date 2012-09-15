<script language="JScript" runAt="server">
// Check if file is called inside LBS
var inLBS;
if(inLBS!=true){
  Response.write("Invalid Call");
  Response.End();
}
</script>
<%
//====== Stats PAGE LOGIC =====================================
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-03-03 17:48:58
//============================================================

pageHeader(lang["stats"]);

if(theUser.groupID!=1){
  redirectMessage(lang["error"], lang["no_rights"], lang["goback"], "javascript:window.history.back();", false, "errorbox");
}else{
  showVisitorList();
}

pageFooter();


// Show Visitor List ----------------------------------------------
function showVisitorList(){

  
  var arrVisitor=connBlog.query("SELECT * FROM [blog_VisitorRecord] ORDER BY vr_time DESC");
  
  if(!arrVisitor){
    arrVisitor=new Array();
  }

  outputVisitorList(arrVisitor);
  
}
%>