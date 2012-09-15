<!---#include file="_common.asp"-->
<!---#include file="global.asp"-->
<!---#include file="source/src_user.asp"-->
<%
//====== User PAGE OUTPUT ====================================
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-02-26 23:57:15
//============================================================

function outputUserInfo(tUser){
%>
<div id="mainWrapper">
<div id="content" class="content">
<div id="innerContent">
<div class="textbox">
  <div class="textbox-title"><h4><%=lang["user_info"]%></h4></div>
  <div class="textbox-content">
  <table cellpadding="2" cellspacing="1">
    <tr>
      <td class="formbox-rowheader" width="120"><%=lang["username"]%>:</td>
      <td class="formbox-content"><%=func.HTMLEncodeLite(tUser.username)%>  <%if(theUser.groupID==1||theUser.id==tUser.id){%> &nbsp;&nbsp; <a href="?act=edit&id=<%=tUser.id%>">[<%=lang["edit_profile"]%>]</a><%}%>
      </td>
    </tr>
    <tr>
      <td class="formbox-rowheader" width="120"><%=lang["user_group"]%>:</td>
      <td class="formbox-content"><%=func.HTMLEncodeLite(tUser.groupName)%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader" width="120"><%=lang["stats"]%>:</td>
      <td class="formbox-content">
        <a href="default.asp?user=<%=tUser.id%>" title="<%=lang["view_user_article"]%>"><%=lang["articles"]%>: <%=tUser.articleCount%></a>
        &nbsp;&nbsp;
        <a href="comment.asp?user=<%=tUser.id%>" title="<%=lang["view_user_comment"]%>"><%=lang["comments"]%>: <%=tUser.commentCount%></a>
      </td>
    </tr>
    <tr>
      <td class="formbox-rowheader" width="120"><%=lang["gender"]%>:</td>
      <td class="formbox-content"><%=lang["gender"+tUser.gender]%></td>
    </tr>
    <%if((!tUser.hideEmail||theUser.groupID==1)&&theUser.loggedIn){%>
    <tr>
      <td class="formbox-rowheader" width="120"><%=lang["email"]%>:</td>
      <td class="formbox-content"><%=func.HTMLEncodeLite(tUser.email)%></td>
    </tr>
    <%}%>
    <tr>
      <td class="formbox-rowheader" width="120"><%=lang["homepage"]%>:</td>
      <td class="formbox-content"><a href="<%=func.HTMLEncodeLite(tUser.homepage)%>" target="_blank" ref="nofollow"><%=func.HTMLEncodeLite(tUser.homepage)%></a></td>
    </tr>
    <tr>
      <td class="formbox-rowheader" width="120"><%=lang["last_visit"]%>:</td>
      <td class="formbox-content"><%=func.getDateTimeString("",tUser.lastVisit)%></td>
    </tr>
    <%if(theUser.groupID==1){%>
    <tr>
      <td class="formbox-rowheader" width="120"><%=lang["ip"]%>:</td>
      <td class="formbox-content"><%=func.HTMLEncodeLite(tUser.lastIP)%></td>
    </tr>
    <%}%>
  </table>
  </div>
  </div>
</div>
</div>
<% sidebar(); %>
<div class="clear"></div>
</div>
<%
}

function outputUserForm(tUser){
%>
<div id="mainWrapper">
<div id="content" class="content">
<div id="innerContent">
<div class="textbox">
  <div class="textbox-title"><h4><%=lang["edit_profile"]%></h4></div>
  <div class="textbox-content">
  <form name="editprofile" action="?act=update&id=<%=tUser.id%>" method="post">
  <table cellpadding="2" cellspacing="1">
    <tr>
      <td class="formbox-rowheader" width="120"><%=lang["username"]%>:</td>
      <td class="formbox-content">
        <%=func.HTMLEncodeLite(tUser.username)%>
        <%if(theUser.groupID==1||theUser.id==tUser.id){%>
        <a href="?act=delete&id=<%=tUser.id%>" onclick="return confirm('<%=lang["confirm_delete_user"]%>?')"><img src="<%=theCache.settings["imageFolder"]%>/icon_del.gif" title="<%=lang["delete"]%>" /></a>
        <%}%>
      </td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["user_group"]%>:</td>
      <td class="formbox-content">
      <%if(theUser.groupID==1){%>
      <select name="groupID" id="groupID">
        <%for(var i=0;i<theCache.userGroup.length;i++){%>
        <option value="<%=theCache.userGroup[i].id%>"<%if(tUser.groupID==theCache.userGroup[i].id) write(" selected=\"selected\"")%>><%=func.HTMLEncodeLite(theCache.userGroup[i].name)%></option>
        <%}%>
      </select>
      <%}else{%>
      <%=func.HTMLEncodeLite(tUser.groupName)%>
      <%}%>
      </td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["password"]%>:</td>
      <td class="formbox-content"><input name="oldpassword" type="password" id="oldpassword" size="16" maxlength="16" class="text" />
      &nbsp;<font color="#FF0000">*</font> <%=lang["edit_password_req"]%></td>
    </tr>
    <% if(theCache.settings["enableSecurityCode"]==1){ %>
    <tr>
      <td class="formbox-rowheader"><%=lang["scode"]%>:</td>
      <td class="formbox-content"><input name="scode" size="4" maxlength="4" type="text" id="scode" class="text" />
        <img src="scode.asp" />&nbsp;<font color="#FF0000">*</font> <%=lang["scode_req"]%>
      </td>
    </tr>
    <% } %>
    <tr>
      <td class="formbox-rowheader"><%=lang["new_password"]%>:</td>
      <td class="formbox-content"><input name="password" type="password" id="password" size="16" maxlength="16" class="text" /> &nbsp; <%=lang["password_req"]%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["repassword"]%>:</td>
      <td class="formbox-content"><input name="repassword" type="password" id="repassword" size="16" maxlength="16" class="text" /> &nbsp; <%=lang["repassword_req"]%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["gender"]%>:</td>
      <td class="formbox-content">
        <input name="gender" type="radio" value="0"<%if(tUser.gender==0) write(" checked=\"checked\"")%> /><%=lang["gender0"]%>
        <input name="gender" type="radio" value="1"<%if(tUser.gender==1) write(" checked=\"checked\"")%> /><%=lang["gender1"]%>
        <input name="gender" type="radio" value="2"<%if(tUser.gender==2) write(" checked=\"checked\"")%> /><%=lang["gender2"]%>
      </td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["email"]%>:</td>
      <td class="formbox-content"><input name="email" size="30" maxlength="50" type="text" value="<%=func.HTMLEncodeLite(tUser.email)%>" class="text" />
      <input type="checkbox" name="hideemail" value="true"<%if(tUser.hideEmail) write(" checked=\"checked\"")%> /> <%=lang["email_hide"]%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["homepage"]%>:</td>
      <td class="formbox-content"><input name="homepage" size="30" maxlength="50" type="text" value="<%=func.HTMLEncodeLite(tUser.homepage)%>" class="text" /></td>
    </tr>
    <tr>
      <td></td>
      <td><input type="Submit" name="Submit" value=" <%=lang["save_change"]%> " class="button" /></td>
    </tr>
  </table>
  </form>
  </div>
  </div>
</div>
</div>
<% sidebar(); %>
<div class="clear"></div>
</div>
<%
}

// Output User List ------------------------------
function outputUserList(arrUser,intEntryCount, intEntryPerPage, intCurrentPage){
  var strPageLinks = func.generatePageLinks(intEntryCount, intEntryPerPage, intCurrentPage, 15, "?");
%>
<div id="mainWrapper">
<div id="content" class="content">
<div id="innerContent">
  <div class="article-top">
    <div class="pages">
      <%=strPageLinks%>
    </div>
  </div>

  <div class="listbox">
  <div style="width: 99%">
    <table cellpadding="2" cellspacing="2" width="100%">
      <tr>
        <td class="listbox-header"><%=lang["username"]%> / <%=lang["homepage"]%></td>
        <td class="listbox-header"><%=lang["articles"]%></td>
        <td class="listbox-header"><%=lang["comments"]%></td>
		    <td class="listbox-header"><%=lang["last_visit"]%></td>
        <%if(theUser.loggedIn){%>
        <td class="listbox-header"><%=lang["email"]%></td>
        <%}%>
      </tr>
  <%
  for(var i=0;i<arrUser.length;i++){
    var tUser=new lbsUser();
    tUser.fill(arrUser[i]);
  %>
      <tr>
        <td class="listbox-entry" style="word-break: normal;">
        <%if(theUser.groupID==1){%>
        <a href="?act=delete&id=<%=tUser.id%>" onclick="return confirm('<%=lang["confirm_delete_user"]%>?')"><img src="<%=theCache.settings["imageFolder"]%>/icon_del.gif" title="<%=lang["delete"]%>" /></a>
        <%}%>&nbsp;&nbsp;
        <a href="?id=<%=tUser.id%>" title="<%=lang["user_info"]%>"><%=func.HTMLEncodeLite(tUser.username)%></a>
        <%if(tUser.homepage){%><a href="<%=func.HTMLEncodeLite(tUser.homepage)%>" target="_blank" ref="nofollow" alt="<%=func.HTMLEncodeLite(tUser.homepage)%>"><img src="<%=theCache.settings["imageFolder"]%>/icon_website.gif" title="<%=func.HTMLEncodeLite(tUser.homepage)%>" /></a><%}%>
        </td>
        <td class="listbox-entry" width="80"><a href="default.asp?user=<%=tUser.id%>" title="<%=lang["view_user_article"]%>"><%=tUser.articleCount%></a></td>
        <td class="listbox-entry" width="80"><a href="comment.asp?user=<%=tUser.id%>" title="<%=lang["view_user_comment"]%>"><%=tUser.commentCount%></a></td>
        <td class="listbox-entry" width="125"><%=func.getDateTimeString("",tUser.lastVisit)%></td>
        <%if(theUser.loggedIn){%>
        <td class="listbox-entry"><%if(!tUser.hideEmail){%><%=func.HTMLEncodeLite(tUser.email)%><%}%></td>
        <%}%>
      </tr>
  <%}%>
    </table>
  </div>
  </div>

  <div class="article-bottom">
    <div class="pages">
      <%=strPageLinks%>
    </div>
  </div>
</div>
</div>
<% sidebar(); %>
<div class="clear"></div>
</div>
<%
}
%>
