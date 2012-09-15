<!---#include file="_common.asp"-->
<!---#include file="global.asp"-->
<!---#include file="lang/admin.asp"-->
<!---#include file="source/src_admin.asp"-->
<%
//====== Admin PAGE OUTPUT ===================================
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-04-23 19:10:02
//============================================================

// Admin login form ---------------------------------------------------------------------
function adminLoginForm(){
%>
<div id="mainWrapper">
<center>
<div class="messagebox">
  <div class="messagebox-title"><%=lang["admin_login"]%></div>
  <div class="messagebox-content">
    <center>
    <form name="adminlogin" method="post" action="?act=login" style="display: inline">
    <input type="password" id="password" name="password" class="text" />&nbsp;
    <input type="submit" id="submit" name="submit" value=" <%=lang["login"]%> " class="button" />
    </form>
    </center>
  </div>
  </tr>
</div>
</center>
</div>
<%
}

// Admin Sidebar ---------------------------------------------------------------------
function adminSidebar(){
%>
<div id="sidebar" class="sidebar">
<div id="innerSidebar">

  <div id="panel_admin" class="panel">
  <h5><%=lang["admin_panel"]%></h5>
  <div class="panel-content">
    <a href="?">- <%=lang["general_info"]%></a><br />
    <a href="?in=settings">- <%=lang["global_settings"]%></a><br />
    <a href="?in=category">- <%=lang["categories"]%></a><br />
    <a href="?in=group">- <%=lang["user_group"]%></a><br />
    <a href="?in=smilies">- <%=lang["smilies"]%></a><br />
    <a href="?in=wordfilter">- <%=lang["word_filter"]%></a><br />
    <a href="?in=database">- <%=lang["database"]%></a><br />
    <a href="?in=attachment">- <%=lang["attachments"]%></a><br />
    <a href="?in=announce">- <%=lang["announcement"]%></a><br />
    <a href="?in=links">- <%=lang["links"]%></a><br />
    <a href="?in=misc">- <%=lang["misc"]%></a><br />
    <br /><a href="?act=logout">- <%=lang["logout"]%></a>
  </div>
  </div>

</div>
</div>
<%
}

// General Infomation Page ---------------------------------------------------------------------
function outputGeneralInfo(info){
%>
<div id="mainWrapper">
<div id="content" class="content">
<div id="innerContent">
<div class="textbox">
  <div class="textbox-title"><h4><%=lang["general_info"]%></h4></div>
  <div class="textbox-content">
  <table border="0" cellpadding="0" cellspacing="1">
    <tr>
      <td class="formbox-rowheader">LBS Version:</td>
      <td class="formbox-content"><%=blogVersion%> |
        <%if(Application(lbsNamespace+"siteClosed")){%>
        <a href="?act=opensite"><%=lang["open_site"]%></a>
        <%}else{%>
        <a href="?act=closesite"><%=lang["close_site"]%></a>
        <%}%> |
        <a href="?cleancache=<%=cacheCleanCode%>"><%=lang["clean_cache"]%></a>
      </td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["server_software"]%>:</td>
      <td class="formbox-content"><%=info.software%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["server_time"]%>:</td>
      <td class="formbox-content"><%=info.time%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["server_ip"]%>:</td>
      <td class="formbox-content"><%=info.ip%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["app_path"]%>:</td>
      <td class="formbox-content"><%=info.path%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["script_engine"]%>:</td>
      <td class="formbox-content">JScript <%=info.scriptEngine%>
      <%if(ScriptEngineMajorVersion()<5||(ScriptEngineMajorVersion()>=5&&ScriptEngineMinorVersion()<5)){%>
        <span class="red">* <%=lang["req_scriptengine"]%></span>
      <%}%>
      </td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["obj_fso"]%>:</td>
      <td class="formbox-content"><%if(info.objFSO){%><%=lang["yes"]%><%}else{%><%=lang["no"]%> <span class="red">* <%=lang["req_obj_fso"]%></span><%}%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["obj_xmlhttp"]%>:</td>
      <td class="formbox-content"><%if(info.objXMLHTTP){%><%=lang["yes"]%><%}else{%><%=lang["no"]%> <span class="red">* <%=lang["req_obj_xmlhttp"]%></span><%}%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["obj_xmldom"]%>:</td>
      <td class="formbox-content"><%if(info.objXMLDOM){%><%=lang["yes"]%><%}else{%><%=lang["no"]%> <span class="red">* <%=lang["req_obj_xmldom"]%></span><%}%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["obj_stream"]%>:</td>
      <td class="formbox-content"><%if(info.objStream){%><%=lang["yes"]%><%}else{%><%=lang["no"]%> <span class="red">* <%=lang["req_obj_stream"]%></span><%}%></td>
    </tr>
  </table>
  </div>
</div>
</div>
</div>
<% adminSidebar(); %>
<div class="clear"></div>
</div>
<%
}

// Settings Page ---------------------------------------------------------------------
function outputSettings(){
%>
<div id="mainWrapper">
<div id="content" class="content">
<div id="innerContent">
<div class="textbox" class="content">
  <div class="textbox-title"><h4><%=lang["global_settings"]%></h4></div>
  <div class="textbox-content">
  <table border="0" cellpadding="2" cellspacing="1">
    <form method="post" action="?in=settings&act=update">
    <tr>
      <td class="formbox-rowheader" width="140"><%=lang["blog_title"]%>:</td>
      <td class="formbox-content"><input type="text" name="blogTitle" size="60" value="<%=func.HTMLEncodeLite(theCache.settings["blogTitle"])%>" maxlength="250" class="text" /></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["blog_desc"]%>:</td>
      <td class="formbox-content"><input type="text" name="blogDescription" size="60" value="<%=func.HTMLEncodeLite(theCache.settings["blogDescription"])%>" maxlength="250" class="text" /></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["blog_base_url"]%>:</td>
      <td class="formbox-content"><input type="text" name="baseURL" size="60" value="<%=func.HTMLEncodeLite(theCache.settings["baseURL"])%>" maxlength="250" class="text" /></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["blog_logo_image"]%>:</td>
      <td class="formbox-content"><input type="text" name="logoImage" size="60" value="<%=func.HTMLEncodeLite(theCache.settings["logoImage"])%>" maxlength="250" class="text" /></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["webmaster_name"]%>:</td>
      <td class="formbox-content"><input type="text" name="blogWebMaster" size="60" value="<%=func.HTMLEncodeLite(theCache.settings["blogWebMaster"])%>" maxlength="150" class="text" /></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["webmaster_email"]%>:</td>
      <td class="formbox-content"><input type="text" name="blogWebMasterEmail" size="60" value="<%=func.HTMLEncodeLite(theCache.settings["blogWebMasterEmail"])%>" maxlength="150" class="text" /></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["language_code"]%>:</td>
      <td class="formbox-content"><input type="text" name="blogLanguage" size="20" value="<%=func.HTMLEncodeLite(theCache.settings["blogLanguage"])%>" maxlength="20" class="text" /> <span class="comment-text"><a href="http://blogs.law.harvard.edu/tech/stories/storyReader$15" target="_blank">* <%=lang["language_code_ref"]%></a></span></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["default_view"]%>:</td>
      <td class="formbox-content"><input type="radio" name="defaultViewMode" value=""<%if(theCache.settings["defaultViewMode"]==0)write(" checked=\"checked\"")%> /><%=lang["normal"]%>&nbsp;&nbsp; <input type="radio" name="defaultViewMode" value="true"<%if(theCache.settings["defaultViewMode"]==1)write(" checked=\"checked\"")%> /><%=lang["list"]%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["article_per_page"]%>:</td>
      <td class="formbox-content"><%=lang["normal"]%>: <input type="text" name="articlePerPageNormal" size="8" value="<%=theCache.settings["articlePerPageNormal"]%>" maxlength="4" class="text" />&nbsp;&nbsp; <%=lang["list"]%>: <input type="text" name="articlePerPageList" size="8" value="<%=theCache.settings["articlePerPageList"]%>" maxlength="4" class="text" /></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["entry_per_page"]%>:</td>
      <td class="formbox-content"><input type="text" name="listEntryPerPage" size="4" value="<%=theCache.settings["listEntryPerPage"]%>" maxlength="4" class="text" /> <%=lang["entries"]%>
      <span class="comment-text">(<%=lang["apply_comm_tb"]%>)</span></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["comment_per_page"]%>:</td>
      <td class="formbox-content"><input type="text" name="commentPerPage" size="4" value="<%=theCache.settings["commentPerPage"]%>" maxlength="4" class="text" /> <%=lang["entries"]%>
      <span class="comment-text">(<%=lang["apply_article_page"]%>)</span></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["comment_time_order"]%>:</td>
      <td class="formbox-content"><input type="radio" name="commentTimeOrder" value=""<%if(theCache.settings["commentTimeOrder"]==0)write(" checked=\"checked\"")%> /><%=lang["time_asc"]%>&nbsp;&nbsp; <input type="radio" name="commentTimeOrder" value="true"<%if(theCache.settings["commentTimeOrder"]==1)write(" checked=\"checked\"")%> /><%=lang["time_desc"]%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["show_tb_w_comm"]%>:</td>
      <td class="formbox-content"><input type="checkbox" name="showTrackbackWithComment" value="true"<%if(theCache.settings["showTrackbackWithComment"]==1)write(" checked=\"checked\"")%> /> <%=lang["enabled"]%>
      &nbsp;<input type="radio" name="showTrackbackPosition" value="0"<%if(theCache.settings["showTrackbackPosition"]==0)write(" checked=\"checked\"")%> /><%=lang["normal"]%>&nbsp; <input type="radio" name="showTrackbackPosition" value="1"<%if(theCache.settings["showTrackbackPosition"]==1)write(" checked=\"checked\"")%> /><%=lang["on_comm_top"]%>&nbsp; <input type="radio" name="showTrackbackPosition" value="2"<%if(theCache.settings["showTrackbackPosition"]==2)write(" checked=\"checked\"")%> /><%=lang["on_comm_bottom"]%>
      </td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["recent_articles"]%>:</td>
      <td class="formbox-content"><input type="text" name="recentArticleList" size="4" value="<%=theCache.settings["recentArticleList"]%>" maxlength="4" class="text" /> <%=lang["entries"]%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["recent_comments"]%>:</td>
      <td class="formbox-content"><input type="text" name="recentCommentList" size="4" value="<%=theCache.settings["recentCommentList"]%>" maxlength="4" class="text" /> <%=lang["entries"]%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["dynamic_calendar"]%>:</td>
      <td class="formbox-content"><input type="checkbox" name="enableDynamicCalendar" value="true"<%if(theCache.settings["enableDynamicCalendar"]==1)write(" checked=\"checked\"")%> /> <%=lang["enabled"]%> <span class="comment-text">(<%=lang["cal_more_query"]%>)</span></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["enable_split"]%>:</td>
      <td class="formbox-content"> <input type="checkbox" name="enableContentAutoSplit" value="true"<%if(theCache.settings["enableContentAutoSplit"]==1)write(" checked=\"checked\"")%> /> <%=lang["split_at"]%> <input type="text" name="contentAutoSplitChars" size="4" value="<%=theCache.settings["contentAutoSplitChars"]%>" maxlength="4" class="text" /> <%=lang["chars"]%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["enable_reg"]%>:</td>
      <td class="formbox-content"><input type="checkbox" name="enableRegister" value="true"<%if(theCache.settings["enableRegister"]==1)write(" checked=\"checked\"")%> /> <%=lang["enabled"]%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["enable_scode"]%>:</td>
      <td class="formbox-content"><input type="checkbox" name="enableSecurityCode" value="true"<%if(theCache.settings["enableSecurityCode"]==1)write(" checked=\"checked\"")%> /> <%=lang["enabled"]%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["enable_trackback"]%>:</td>
      <td class="formbox-content"><input type="checkbox" name="enableTrackbackIn" value="true"<%if(theCache.settings["enableTrackbackIn"]==1)write(" checked=\"checked\"")%> /> <%=lang["incoming"]%>&nbsp;&nbsp; <input type="checkbox" name="enableTrackbackOut" value="true"<%if(theCache.settings["enableTrackbackOut"]==1)write(" checked=\"checked\"")%> /> <%=lang["outgoing"]%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["enable_comment"]%>:</td>
      <td class="formbox-content"><input type="checkbox" name="enableComment" value="true"<%if(theCache.settings["enableComment"]==1)write(" checked=\"checked\"")%> /> <%=lang["enabled"]%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["max_comment_length"]%>:</td>
      <td class="formbox-content"><input type="text" name="maxCommentLength" size="4" value="<%=theCache.settings["maxCommentLength"]%>" maxlength="4" class="text" /> <%=lang["chars"]%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["enable_guestbook"]%>:</td>
      <td class="formbox-content"><input type="checkbox" name="enableGuestBook" value="true"<%if(theCache.settings["enableGuestBook"]==1)write(" checked=\"checked\"")%> /> <%=lang["enabled"]%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["gbook_page_size"]%>:</td>
      <td class="formbox-content"><input type="text" name="entryPerPageGuestBook" size="4" value="<%=theCache.settings["entryPerPageGuestBook"]%>" maxlength="4" class="text" /></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["style_sheet"]%>:</td>
      <td class="formbox-content"><input type="text" name="styleSheet" size="60" value="<%=func.HTMLEncodeLite(theCache.settings["styleSheet"])%>" maxlength="250" class="text" /></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["image_folder"]%>:</td>
      <td class="formbox-content"><input type="text" name="imageFolder" size="60" value="<%=func.HTMLEncodeLite(theCache.settings["imageFolder"])%>" maxlength="250" class="text" /></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["smilies_folder"]%>:</td>
      <td class="formbox-content"><input type="text" name="smiliesFolder" size="60" value="<%=func.HTMLEncodeLite(theCache.settings["smiliesFolder"])%>" maxlength="250" class="text" /></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["smilies_per_row"]%>:</td>
      <td class="formbox-content"><input type="text" name="smiliesPerRow" size="4" value="<%=theCache.settings["smiliesPerRow"]%>" maxlength="4" class="text" /> <span class="comment-text">(<%=lang["for_forms"]%>)</span></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["flood_control"]%>:</td>
      <td class="formbox-content"><input type="text" name="minPostDuration" size="4" value="<%=theCache.settings["minPostDuration"]%>" maxlength="4" class="text" /> <%=lang["between_posts"]%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["record_visitor"]%>:</td>
      <td class="formbox-content"> <input type="checkbox" name="enableVisitorRecord" value="true"<%if(theCache.settings["enableVisitorRecord"]==1)write(" checked=\"checked\"")%> /> <%=lang["record"]%> <input type="text" name="maxVisitorRecord" size="4" value="<%=theCache.settings["maxVisitorRecord"]%>" maxlength="4" class="text" /> <%=lang["visitors_not_affect"]%></td>
    </tr>
    </tr>
      <td class="formbox-rowheader"><%=lang["enable_upload"]%>:</td>
      <td class="formbox-content"><input type="checkbox" name="enableUpload" value="true"<%if(theCache.settings["enableUpload"]==1)write(" checked=\"checked\"")%> /> <%=lang["enabled"]%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["upload_size"]%>:</td>
      <td class="formbox-content"><input type="text" name="uploadSize" size="8" value="<%=theCache.settings["uploadSize"]%>" maxlength="20" class="text" /> <%=lang["bytes"]%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["upload_path"]%>:</td>
      <td class="formbox-content"><input type="text" name="uploadPath" size="60" value="<%=func.HTMLEncodeLite(theCache.settings["uploadPath"])%>" maxlength="250" class="text" /></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["upload_type"]%>:</td>
      <td class="formbox-content"><input type="text" name="uploadTypes" size="60" value="<%=func.HTMLEncodeLite(theCache.settings["uploadTypes"])%>" maxlength="250" class="text" /> <span class="comment-text">(<%=lang["seperate_by"]%>)</span></td>
    </tr>
    <tr>
      <td></td>
      <td><br /><input type="Submit" name="Submit" value=" <%=lang["save_change"]%> " class="button" /></td>
    </tr>
    </form>
  </table>
  </div>
</div>
</div>
</div>
<% adminSidebar(); %>
<div class="clear"></div>
</div>
<%
}

// Categories Page ---------------------------------------------------------------------
function outputCategories(){
%>
<div id="mainWrapper">
<div id="content" class="content">
<div id="innerContent">
<div class="textbox" class="content">
  <div class="textbox-title"><h4><%=lang["categories"]%></h4></div>
  <div class="textbox-content">
  <table border="0" cellpadding="3" cellspacing="2">
    <form method="post" action="?in=category">
    <tr>
      <td class="listbox-header"></td>
      <td class="listbox-header"><%=lang["title"]%></td>
      <td class="listbox-header"><%=lang["hidden"]%></td>
      <td class="listbox-header"><%=lang["locked"]%></td>
      <td class="listbox-header"><%=lang["order"]%></td>
      <td class="listbox-header"><%=lang["articles"]%></td>
    </tr>
  <%for(var i=0;i<theCache.categories.length;i++){
    with(theCache.categories[i]){%>
    <tr>
      <td><input type="checkbox" name="selected" value="<%=id%>" /><input type="hidden" name="id" value="<%=id%>" /></td>
      <td><input type="text" name="name" size="30" maxlength="50" value="<%=func.HTMLEncodeLite(name)%>" class="text" /></td>
      <td><input type="checkbox" name="hidden" value="<%=id%>"<%if(hidden)write(" checked=\"checked\"")%> /></td>
      <td><input type="checkbox" name="locked" value="<%=id%>"<%if(locked)write(" checked=\"checked\"")%> /></td>
      <td><input type="text" name="order" size="2" maxlength="2" value="<%=order%>" class="text" /></td>
      <td class="listbox-entry"><%=articleCount%></td>
    </tr>
  <%  }
    }
  %>
    <tr>
      <td><%=lang["new"]%>:<input type="hidden" name="id" value="0" /></td>
      <td><input type="text" name="name" size="30" maxlength="50" value="" class="text" /></td>
      <td><input type="checkbox" name="newHidden" value="true" /></td>
      <td><input type="checkbox" name="newLocked" value="true" /></td>
      <td><input type="text" name="order" size="2" maxlength="2" value="" class="text" /></td>
      <td></td>
    </tr>
    <tr>
      <td colspan="6">
        <br />
      	<select name="act">
					<option value="update"><%=lang["save_change"]%></option>
					<option value="move"><%=lang["move_cat"]%></option>
					<option value="delete"><%=lang["delete_cat"]%></option>
				</select>
        <input type="submit" name="submit" value=" <%=lang["execute"]%> " class="button" />
      </td>
    </tr>
    <tr>
      <td colspan="6"><span class="red">* <%=lang["delete_cat_note"]%></span></td>
    </tr>
    </form>
  </table>
  </div>
</div>
</div>
</div>
<% adminSidebar(); %>
<div class="clear"></div>
</div>
<%
}

// Move article in category box
function outputCatMoveTarget(arrSelected){
%>
<center>
<div class="formbox" style="width: 600px;">
  <div class="formbox-title"><%=lang["select_target_cat"]%></div>
  <div class="formbox-content" style="padding: 10px;">
    <center>
    <table cellpadding="2" cellspacing="1">
    <form name="movecat" method="post" action="?in=category&act=move" style="display: inline">
    <tr>
      <td class="formbox-rowheader"><%=lang["from_cat"]%>:</td>
      <td class="formbox-content">
      <%for(var i=0;i<arrSelected.length;i++){
        with(arrSelected[i]){%>
          [<%=func.HTMLEncodeLite(theCache.getCategoryByID(arrSelected[i]).name)%>]  
        <%}
        }%>
      </td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["to_cat"]%>:</td>
      <td class="formbox-content">
        <select name="target">
      <%for(var i=0;i<theCache.categories.length;i++){
        with(theCache.categories[i]){%>
          <option value="<%=id%>"><%=func.HTMLEncodeLite(name)%> [<%=articleCount%>]</option>
      <%  }
        }%>
        </select>
      </td>
    </tr>
    <tr>
      <td></td>
      <td class="formbox-content">
        <br />
        <input type="hidden" name="selected" value="<%=arrSelected.join(",")%>" />
        <input type="submit" name="submit" value=" <%=lang["move"]%> " class="button" />
        <input type="button" name="back" value=" <%=lang["cancel"]%> " onClick="window.history.back();" class="button" />
      </td>
    </tr>
    </form>
    </table>
    </center>
  </div>
  </tr>
</div>
</center>
<%
}

// User Group Page ---------------------------------------------------------------------
function outputUserGroup(){
%>
<div id="mainWrapper">
<div id="content" class="content">
<div id="innerContent">
<div class="textbox">
  <div class="textbox-title"><h4><%=lang["user_group"]%></h4></div>
  <div class="textbox-content">
  <table border="0" cellpadding="3" cellspacing="2">
    <form method="post" action="?in=group">
    <tr>
      <td class="listbox-header"></td>
      <td class="listbox-header"></td>
      <td class="listbox-header"><%=lang["view"]%></td>
      <td class="listbox-header"><%=lang["post"]%></td>
      <td class="listbox-header"><%=lang["edit"]%></td>
      <td class="listbox-header"><%=lang["delete"]%></td>
      <td class="listbox-header"><%=lang["upload"]%></td>
    </tr>
  <%for(var i=0;i<theCache.userGroup.length;i++){
    with(theCache.userGroup[i]){%>
    <tr>
      <td>
        <%if(id>4){%>
          <input type="checkbox" name="selected" value="<%=id%>" />
        <%}else{%>
          <input type="checkbox" name="not_for_select" disabled="disabled" />
        <%}%>
        <input type="hidden" name="id" value="<%=id%>" />
      </td>
      <td>
        <input type="text" name="name" size="10" maxlength="50" value="<%=func.HTMLEncodeLite(name)%>" class="text" />
      </td>
      <td>
        <select name="view">
          <option value="0"<%if(rights["view"]==0)write(" selected=\"selected\"")%>><%=lang["none"]%></option>
          <option value="1"<%if(rights["view"]==1)write(" selected=\"selected\"")%>><%=lang["normal"]%></option>
          <option value="2"<%if(rights["view"]==2)write(" selected=\"selected\"")%>><%=lang["hidden"]%></option>
          <option value="3"<%if(rights["view"]==3||id==1)write(" selected=\"selected\"")%>><%=lang["private"]%></option>
        </select>
      </td>
      <td>
        <select name="post">
          <option value="0"<%if(rights["post"]==0)write(" selected=\"selected\"")%>><%=lang["none"]%></option>
          <option value="1"<%if(rights["post"]==1)write(" selected=\"selected\"")%>><%=lang["comments"]%></option>
          <option value="2"<%if(rights["post"]==2||id==1)write(" selected=\"selected\"")%>><%=lang["articles"]%></option>
        </select>
      </td>
      <td>
        <select name="edit">
          <option value="0"<%if(rights["edit"]==0)write(" selected=\"selected\"")%>><%=lang["none"]%></option>
          <option value="1"<%if(rights["edit"]==1)write(" selected=\"selected\"")%>><%=lang["self"]%></option>
          <option value="2"<%if(rights["edit"]==2||id==1)write(" selected=\"selected\"")%>><%=lang["all"]%></option>
        </select>
      </td>
      <td>
        <select name="delete">
          <option value="0"<%if(rights["delete"]==0)write(" selected=\"selected\"")%>><%=lang["none"]%></option>
          <option value="1"<%if(rights["delete"]==1)write(" selected=\"selected\"")%>><%=lang["self"]%></option>
          <option value="2"<%if(rights["delete"]==2||id==1)write(" selected=\"selected\"")%>><%=lang["all"]%></option>
        </select>
      </td>
      <td>
        <select name="upload">
          <option value="0"<%if(rights["upload"]==0)write(" selected=\"selected\"")%>><%=lang["disabled"]%></option>
          <option value="1"<%if(rights["upload"]==1||id==1)write(" selected=\"selected\"")%>><%=lang["enabled"]%></option>
        </select>
      </td>
    </tr>
  <%  }
    }
  %>
    <tr>
      <td><%=lang["new"]%>:</td>
      <td><input type="hidden" name="id" value="0" /> <input type="text" name="name" size="10" maxlength="50" value="" class="text" /></td>
      <td>
        <select name="view">
          <option value="0"><%=lang["none"]%></option>
          <option value="1"><%=lang["normal"]%></option>
          <option value="2"><%=lang["hidden"]%></option>
          <option value="3"><%=lang["private"]%></option>
        </select>
      </td>
      <td>
        <select name="post">
          <option value="0"><%=lang["none"]%></option>
          <option value="1"><%=lang["comments"]%></option>
          <option value="2"><%=lang["articles"]%></option>
        </select>
      </td>
      <td>
        <select name="edit">
          <option value="0"><%=lang["none"]%></option>
          <option value="1"><%=lang["self"]%></option>
          <option value="2"><%=lang["all"]%></option>
        </select>
      </td>
      <td>
        <select name="delete">
          <option value="0"><%=lang["none"]%></option>
          <option value="1"><%=lang["self"]%></option>
          <option value="2"><%=lang["all"]%></option>
        </select>
      <td>
        <select name="upload">
          <option value="0"><%=lang["disabled"]%></option>
          <option value="1"><%=lang["enabled"]%></option>
        </select>
    </tr>
    <tr>
      <td colspan="6">
        <br />
      	<select name="act">
					<option value="update"><%=lang["save_change"]%></option>
					<option value="delete"><%=lang["delete_group"]%></option>
				</select>
        <input type="submit" name="submit" value=" <%=lang["execute"]%> " class="button" />
      </td>
    </tr>
    <tr>
      <td colspan="6"><span class="red">* <%=lang["delete_group_note"]%></span></td>
    </tr>
    </form>
  </table>
  </div>
</div>
</div>
</div>
<% adminSidebar(); %>
<div class="clear"></div>
</div>
<%
}

// Smilies Page ---------------------------------------------------------------------
function outputSmilies(){
%>
<div id="mainWrapper">
<div id="content" class="content">
<div id="innerContent">
<div class="textbox">
  <div class="textbox-title"><h4><%=lang["smilies"]%></h4></div>
  <div class="textbox-content">
  <table border="0" cellpadding="3" cellspacing="2">
    <form method="post" action="?in=smilies">
    <tr>
      <td class="listbox-header"></td>
      <td class="listbox-header"><%=lang["image"]%></td>
      <td class="listbox-header"><%=lang["code"]%></td>
      <td class="listbox-header"><%=lang["url"]%></td>
    </tr>
  <%for(var i=0;i<theCache.smilies.length;i++){
    with(theCache.smilies[i]){%>
    <tr>
      <td><input type="checkbox" name="selected" value="<%=id%>" /><input type="hidden" name="id" value="<%=id%>" /></td>
      <td><img src="<%=theCache.settings["smiliesFolder"]+'/'+image%>" /></td>
      <td><input type="text" name="code" size="10" maxlength="50" value="<%=func.HTMLEncodeLite(code)%>" class="text" /></td>
      <td><input type="text" name="image" size="30" maxlength="50" value="<%=func.HTMLEncodeLite(image)%>" class="text" /></td>
    </tr>
  <%  }
    }
  %>
    <tr>
      <td><%=lang["new"]%>:<input type="hidden" name="id" value="0" /></td>
      <td><img src="<%=theCache.settings["imageFolder"]+"/blank.gif"%>" id="imgPreview" /></td>
      <td><input type="text" name="code" size="10" maxlength="50" value="" class="text" /></td>
      <td><input type="text" name="image" size="30" maxlength="50" value="" class="text" onKeyUp="if(this.value.length>0){imgPreview.src='<%=theCache.settings["smiliesFolder"]+"/"%>'+this.value;}else{imgPreview.src='<%=theCache.settings["imageFolder"]%>/blank.gif';}" /></td>
    </tr>
    <tr>
      <td colspan="5">
        <br />
      	<select name="act">
					<option value="update"><%=lang["save_change"]%></option>
					<option value="delete"><%=lang["delete_smilies"]%></option>
				</select>
        <input type="submit" name="submit" value=" <%=lang["execute"]%> " class="button" />
      </td>
    </tr>
    </form>
  </table>
  </div>
</div>
</div>
</div>
<% adminSidebar(); %>
<div class="clear"></div>
</div>
<%
}

// Word Filter Page ---------------------------------------------------------------------
function outputWordFilter(){
%>
<div id="mainWrapper">
<div id="content" class="content">
<div id="innerContent">
<div class="textbox">
  <div class="textbox-title"><h4><%=lang["word_filter"]%></h4></div>
  <div class="textbox-content">
  <table border="0" cellpadding="3" cellspacing="2">
    <form method="post" action="?in=wordfilter">
    <tr>
      <td class="listbox-header"></td>
      <td class="listbox-header"><%=lang["text"]%>/<%=lang["replace"]%></td>
      <td class="listbox-header"><%=lang["regexp"]%>/<%=lang["mode"]%></td>
    </tr>
  <%for(var i=0;i<theCache.wordFilter.length;i++){
    with(theCache.wordFilter[i]){%>
    <tr>
      <td><input type="checkbox" name="selected" value="<%=id%>" /><input type="hidden" name="id" value="<%=id%>" /></td>
      <td><input type="text" name="text" size="40" maxlength="50" value="<%=func.HTMLEncodeLite(text)%>" class="text" /><br />
      <input type="text" name="replace" size="40" maxlength="50" value="<%=func.HTMLEncodeLite(replace)%>" class="text" /></td>
      <td>
        <%=lang["regexp"]%>:
        <input type="checkbox" name="regexp" value="<%=id%>"<%if(isRegExp)write(" checked=\"checked\"")%> />
        <br />
        <%=lang["mode"]%>:
        <select name="mode">
          <option value="0"<%if(mode==0)write(" selected=\"selected\"")%>><%=lang["replace"]%></option>
          <option value="1"<%if(mode==1)write(" selected=\"selected\"")%>><%=lang["block"]%></option>
        </select>
      </td>
    </tr>
  <%  }
    }
  %>
    <tr>
      <td><%=lang["new"]%>:<input type="hidden" name="id" value="0" /></td>
      <td><input type="text" name="text" size="40" maxlength="50" value="" class="text" /><br />
      <input type="text" name="replace" size="40" maxlength="50" value="" class="text" /></td>
      <td>
        <%=lang["regexp"]%>:
        <input type="checkbox" name="newRegexp" value="0" />
        <br />
        <%=lang["mode"]%>:
        <select name="mode">
          <option value="0"><%=lang["replace"]%></option>
          <option value="1"><%=lang["block"]%></option>
        </select>
      </td>
    </tr>
    <tr>
      <td colspan="5">
        <br />
      	<select name="act">
					<option value="update"><%=lang["save_change"]%></option>
					<option value="delete"><%=lang["delete_wordfilter"]%></option>
				</select>
        <input type="submit" name="submit" value=" <%=lang["execute"]%> " class="button" />
      </td>
    </tr>
    </form>
  </table>
  </div>
</div>
</div>
</div>
<% adminSidebar(); %>
<div class="clear"></div>
</div>
<%
}

// Database Page ---------------------------------------------------------------------
function outputDatabase(info, strDBPath, arrBackup, strResult){
%>
<div id="mainWrapper">
<div id="content" class="content">
<div id="innerContent">
<div class="textbox">
  <div class="textbox-title"><h4><%=lang["database"]%></h4></div>
  <div class="textbox-content">
  <table border="0" cellpadding="0" cellspacing="1">
    <tr>
      <td class="formbox-rowheader"><%=lang["db_path"]%>:</td>
      <td class="formbox-content"><%=func.HTMLEncodeLite(info.path)%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader"><%=lang["db_size"]%>:</td>
      <td class="formbox-content"><%=info.size%> | <a href="?in=database&act=backup"><%=lang["backup"]%></a> |  <a href="?in=database&act=compact"><%=lang["compact"]%></a></td>
    </tr>
    <%if(strResult!=""){%>
    <tr>
      <td class="formbox-rowheader" valign="top"><%=lang["op_result"]%>:</td>
      <td class="formbox-content"><%=strResult%></td>
    </tr>
    <%}%>
    <tr>
      <td class="formbox-rowheader" valign="top"><%=lang["backup_list"]%>:</td>
      <td class="formbox-content">
      <%for(var i=0;i<arrBackup.length;i++){
          if(arrBackup[i].type=="file"&&(arrBackup[i].name.indexOf(".bak")>0||arrBackup[i].name.indexOf(".tmp")>0)){%>
          <a href="<%=strDBPath+escape(arrBackup[i].name)%>"><img src="<%=theCache.settings["imageFolder"]%>/icon_file.gif" /> <b><%=func.HTMLEncodeLite(arrBackup[i].name)%></b></a> |
          <%=arrBackup[i].size%> |
          <a href="?in=database&act=restore&file=<%=escape(arrBackup[i].name)%>" onclick="return confirm('<%=lang["confirm_restore"]%>?')"><%=lang["restore"]%></a> |
          <a href="?in=database&act=delete&file=<%=escape(arrBackup[i].name)%>" onclick="return confirm('<%=lang["confirm_delete_file"]%>?')"><%=lang["delete"]%></a>
          <br />
      <%  }
        }%>
      </td>
    </tr>
  </table>
  </div>
</div>
</div>
</div>
<% adminSidebar(); %>
<div class="clear"></div>
</div>
<%
}

// Attachment Page ---------------------------------------------------------------------
function outputAttachment(strBasePath, strCurrentPath, arrList, bShowParent){
%>
<div id="mainWrapper">
<div id="content" class="content">
<div id="innerContent">
<div class="textbox">
  <div class="textbox-title"><h4><%=lang["attachments"]%></h4></div>
  <div class="textbox-content">
  <%if(bShowParent){%>
  <a href="?in=attachment"><img src="<%=theCache.settings["imageFolder"]%>/icon_folder_up.gif" /> <%=lang["parent_folder"]%></a><br /><br />
  <%}%>
  <%for(var i=0;i<arrList.length;i++){%>
    <%if(arrList[i].type=="file"){%>
      <a href="<%=strBasePath+strCurrentPath+escape(arrList[i].name)%>" target="_blank">
      <img src="<%=theCache.settings["imageFolder"]%>/icon_file.gif" />
      <b><%=func.HTMLEncodeLite(arrList[i].name)%></b></a> |
      <%=arrList[i].size%> |
      <a href="?in=attachment&act=delete&file=<%=strCurrentPath+escape(arrList[i].name)%>" onclick="return confirm('<%=lang["confirm_delete_file"]%>?')"><%=lang["delete"]%></a>
    <%}else{%>
      <a href="?in=attachment&path=<%=strCurrentPath+escape(arrList[i].name)%>">
      <img src="<%=theCache.settings["imageFolder"]%>/icon_folder.gif" />
      <b><%=func.HTMLEncodeLite(arrList[i].name)%></b></a> |
      <%=arrList[i].size%> |
      <a href="?in=attachment&act=delete&folder=<%=strCurrentPath+escape(arrList[i].name)%>" onclick="return confirm('<%=lang["confirm_delete_folder"]%>?')"><%=lang["delete"]%></a>
    <%}%>
    <br />
  <%}%>
    <br />
    <span class="comment-text"><%=lang["total"]%>: <%=arrList.length%>&nbsp;<%=lang["items"]%> (<%=lang["delete_folder_note"]%>)</span>
  </div>
</div>
</div>
</div>
<% adminSidebar(); %>
<div class="clear"></div>
</div>
<%
}

// Announcement Page ---------------------------------------------------------------------
function outputAnnouncement(){
%>
<div id="mainWrapper">
<div id="content" class="content">
<div id="innerContent">
<div class="textbox">
  <div class="textbox-title"><h4><%=lang["announcement"]%></h4></div>
  <div style="width: 100%">
  <script language="javascript" src="messageform.js"></script>
  <table border="0" cellpadding="3" cellspacing="2" width="100%">
    <form name="inputform" method="post" action="?in=announce&act=update">
    <tr>
      <td class="formbox-rowheader" width="150"><%=lang["enabled"]%>:</td>
      <td class="formbox-content"><input type="checkbox" name="show" value="true"<%if(theCache.settings["announceShow"]==1)write(" checked=\"checked\"")%> /><%=lang["show_announce"]%></td>
    </tr>
    <tr>
      <td class="formbox-rowheader">
        <div class="panel-smilies">
          <div class="panel-smilies-title"><%=lang["smilies"]%></div>
          <div class="panel-smilies-content">
          <%for(var i=0;i<theCache.smilies.length;i++){%>
            <a href="javascript:insertSmilies('<%=theCache.smilies[i].code%>')"><img src="<%=theCache.settings["smiliesFolder"]%>/<%=theCache.smilies[i].image%>" alt="<%=theCache.smilies[i].code%>" /></a>
            <%if((i+1)%theCache.settings["smiliesPerRow"]==0) write("<br />\n")%>
          <%}%>
          </div>
          <div style="font-weight: normal; text-align:left;">
						<input name="e_html" type="checkbox" value="true"<%if(theCache.settings["announceUBBFlags"]=="html") write(" checked")%> /> <%=lang["e_html"]%><br />
						<input name="e_ubb" type="checkbox" value="true"<%if(theCache.settings["announceUBBFlags"]!="html" && theCache.settings["announceUBBFlags"].substr(0,1)=="1") write(" checked")%> /> <%=lang["e_ubb"]%><br />
						<input name="e_autourl" type="checkbox" value="true"<%if(theCache.settings["announceUBBFlags"]!="html" && theCache.settings["announceUBBFlags"].substr(1,1)=="1") write(" checked")%> /> <%=lang["e_autourl"]%><br />
						<input name="e_image" type="checkbox" value="true"<%if(theCache.settings["announceUBBFlags"]!="html" && theCache.settings["announceUBBFlags"].substr(2,1)=="1") write(" checked")%> /> <%=lang["e_image"]%><br />
						<input name="e_media" type="checkbox" value="true"<%if(theCache.settings["announceUBBFlags"]!="html" && theCache.settings["announceUBBFlags"].substr(3,1)=="1") write(" checked")%> /> <%=lang["e_media"]%><br />
						<input name="e_smilies" type="checkbox" value="true"<%if(theCache.settings["announceUBBFlags"]!="html" && theCache.settings["announceUBBFlags"].substr(4,1)=="1") write(" checked")%> /> <%=lang["e_smilies"]%>
					</div>
      </td>
      <td class="formbox-content">
        <textarea name="message" cols="64" rows="16" wrap="virtual" id="message" style="width:100%" onSelect="storeCaret(this);" onClick="storeCaret(this);" onKeyup="storeCaret(this);CtrlEnter();"><%=func.HTMLEncodeLite(theCache.settings["announce"])%></textarea>
        <br />
        <input type="submit" name="submit" value=" <%=lang["save_change"]%> " class="button" />
      </td>
    </tr>
    </form>
  </table>
  </div>
</div>
</div>
</div>
<% adminSidebar(); %>
<div class="clear"></div>
</div>
<%
}

// Links Page ---------------------------------------------------------------------
function outputLinks(){
%>
<div id="mainWrapper">
<div id="content" class="content">
<div id="innerContent">
<div class="textbox">
  <div class="textbox-title"><h4><%=lang["links"]%></h4></div>
  <div style="width: 100%">
  <table border="0" cellpadding="3" cellspacing="2" width="100%">
    <form name="inputform" method="post" action="?in=links&act=update">
    <tr>
      <td class="formbox-content">
        <textarea name="links" cols="64" rows="16" wrap="virtual" id="links" style="width:100%"><%=func.HTMLEncodeLite(theCache.settings["links"])%></textarea>
        <br />
        <input type="submit" name="submit" value=" <%=lang["save_change"]%> " class="button" />
      </td>
    </tr>
    </form>
  </table>
  </div>
</div>
</div>
</div>
<% adminSidebar(); %>
<div class="clear"></div>
</div>
<%
}

// Misc Page ---------------------------------------------------------------------
function outputMisc(){
%>
<div id="mainWrapper">
<div id="content" class="content">
<div id="innerContent">
<div class="textbox">
  <div class="textbox-title"><h4><%=lang["misc"]%></h4></div>
  <div class="textbox-content" style="line-height: 20px;">
  <a href="?in=misc&act=resync_g">- <%=lang["resync_global_stats"]%></a><br />
  <a href="?in=misc&act=resync_c">- <%=lang["resync_cat_stats"]%></a><br />
  <a href="?in=misc&act=resync_a">- <%=lang["resync_article_stats"]%></a><br />
  <a href="?in=misc&act=resync_u">- <%=lang["resync_user_stats"]%></a><br />
  <a href="?in=misc&act=clean_u">- <%=lang["clean_user"]%></a><br />
  <a href="?in=misc&act=clean_vc">- <%=lang["clean_visitor_record"]%></a><br />
  <a href="?in=misc&act=clean_gb">- <%=lang["clean_gbook_record"]%></a><br />
  <br />
  <span class="comment-text">* <%=lang["resync_note"]%></span>
  </div>
</div>
</div>
</div>
<% adminSidebar(); %>
<div class="clear"></div>
</div>
<%
}

// Output Events ---------------
function outputEvent(strStep, strEvent, strRedirect){
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=strStep%></title>
<link rel="stylesheet" type="text/css" href="styles.css" />
</head>
<body>
<div id="main-wrapper">
<div id="content" class="content-only">
<div id="innerContent">
  <div class="textbox-title"><h4><%=strStep%></h4></div>
  <div class="textbox-content">
    <%=strEvent%>
    <%if(strRedirect){%>
    <meta http-equiv="refresh" content="3; URL=<%=strRedirect%>" /><br /><br />
    <a href="<%=strRedirect%>"><%=lang["redirect"]%></a>
    <%}%>
 </div>
</div>
</div>
</div>
<%
  connBlog.close();
  Session.CodePage = Session("OldCodePage");
  if(inDebug){
    showSQL();
  }
%>
</body>
</html>
<%
}

%>