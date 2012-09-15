<!---#include file="_common.asp"-->
<!---#include file="global.asp"-->
<!---#include file="class/ubbcode.asp"-->
<!---#include file="class/article.asp"-->
<!---#include file="source/src_default.asp"-->
<%
//====== Index PAGE OUTPUT ===================================
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-02-26 23:57:15
//============================================================

// Output Master Page Layout
function outputMaster(viewMode, arrArticle, intEntryCount, intEntryPerPage, intCurrentPage, intCategory, strURLPrefix, arrKeywords){
  var strPageLinks = func.generatePageLinks(intEntryCount, intEntryPerPage, intCurrentPage, 15, strURLPrefix);
%>
<div id="mainWrapper">
<div id="content" class="content">
<div id="innerContent">
  <%if(theCache.settings["announceShow"]==1&&intCurrentPage==1){%>
  <div class="announce">
    <div class="announce-content">
      <div class="announce-time"><%=theCache.settings["announceDate"]%></div>
      <%if(theCache.settings["announceUBBFlags"]=="html"){%>
      <%=theCache.settings["announce"]%>
      <%}else{%>
      <%=ubb.toHTML(func.HTMLEncode(theCache.settings["announce"]),theCache.settings["announceUBBFlags"])%>
      <%}%>
      <br />
    </div>
  </div>
  <%}%>
  <div class="article-top">
    <div class="view-mode"><%=lang["view_mode"]%>: <a href="?mode=normal"><%=lang["normal"]%></a> | <a href="?mode=list"><%=lang["list"]%></a></div>
    <div class="pages">
    <%if(intCategory){%><%=lang["category"]%>: <%=func.HTMLEncode(theCache.getCategoryByID(intCategory).name)%> | <%}%>
    <%if(intYear){%><%if(intMonth){%><%=lang["month_"+intMonth]%>, <%}%><%=intYear%> | <%}%>
    <%if(input["q"]){%><%=lang["search"]%>: <%=func.HTMLEncodeLite(input["q"])%> | <%}%>
    <%=strPageLinks%>
    </div>
  </div>
  <%
  if(intEntryCount==0){
    %>
    <div class="no-entry">
      <div class="no-entry-message">
      <%=lang["no_article"]%>
      </div>
    </div>
    <%
  }else{
    if(viewMode==1){
      outputList(arrArticle, arrKeywords);
    }else{
      outputNormal(arrArticle, arrKeywords);
    }
  }
  %>
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

function outputNormal(arrArticle, arrKeywords){
  var j=0; // Used to store output entry count
  for(var i=0;i<arrArticle.length&&j<theCache.settings["articlePerPageNormal"];i++){
    var tArticle=new lbsArticle();
    tArticle.fill(arrArticle[i]);
    if(!tArticle.category.hidden||(tArticle.category.hidden&&theUser.rights["view"]>1)){
      j++; // Only increase when the article is out
  %>
<div class="textbox">
  <div class="textbox-title">
    <h4>
    <%if(tArticle.selected){%><img src="<%=theCache.settings["imageFolder"]%>/icon_star.gif" alt="<%=lang["selected"]%>" /><%}%>
    <%if(tArticle.locked||tArticle.category.locked){%><img src="<%=theCache.settings["imageFolder"]%>/icon_lock.gif" alt="<%=lang["locked"]%>" /><%}%>
    <a href="article.asp?id=<%=tArticle.id%>">
    <%if(!theUser.checkViewPermission(tArticle)){%>
      <%="["+lang["hidden"]+"]"%>
    <%}else{%>
      <%
        var strTitle=func.HTMLEncode(tArticle.title);
        if(arrKeywords.length>0){
          strTitle=func.highlight(strTitle,arrKeywords);
        }       
      %>
      <%=strTitle%>
    <%}%></a>
    <%if(tArticle.mode>1){%>
    <span class="comment-text">[<%=theCache.articleMode[tArticle.mode]%>]</span> 
    <%}%>
    </h4>
    <div class="textbox-label">[ <%=func.getDateTimeString("YY-MM-DD hh:ii:ss",tArticle.postTime)%> | <%=lang["author"]%>: <a href="user.asp?act=view&amp;id=<%=tArticle.authorID%>"><%=tArticle.author%></a><%if(theUser.groupID==1){%> | <%=tArticle.IP%><%}%> ]</div>
  </div>
  <div class="textbox-content">
  <%if(!theUser.checkViewPermission(tArticle)){%>
    <div class="hidden-note"><%=lang["no_rights_view"]%></div>
  <%}else{%>
    <%
      var strContent="";
      if(tArticle.ubbFlags=="html"){
        strContent=func.closeHTML(tArticle.content0);
      }else{
        strContent=ubb.toHTML(func.closeUBB(func.HTMLEncode(tArticle.content0)),tArticle.ubbFlags);
      }
      if(arrKeywords.length>0){
        strContent=func.highlight(strContent,arrKeywords);
      }
    %>
    <%=strContent%>
    <%if(tArticle.content1.length>1){%>...<br /><br /><a href="article.asp?id=<%=tArticle.id%>"><b><%=lang["read_more"]%></b></a><%}%>
  <%}%>
  </div>
  <div class="textbox-bottom">
    <%if(theUser.rights["edit"]>1||(theUser.rights["edit"]==1&&theUser.username==tArticle.author)){%>
    <a href="article.asp?act=edit&amp;id=<%=tArticle.id%>" title="<%=lang['edit']%>"><img src="<%=theCache.settings["imageFolder"]%>/icon_edit.gif" alt="<%=lang['edit']%>" /></a> |
    <%}%>
    <%if(theUser.rights["delete"]>1||(theUser.rights["delete"]==1&&theUser.username==tArticle.author)){%>
    <a href="article.asp?act=delete&amp;id=<%=tArticle.id%>" title="<%=lang['delete']%>" onclick="return confirm('<%=lang["confirm_delete_article"]%>?')"><img src="<%=theCache.settings["imageFolder"]%>/icon_del.gif" alt="<%=lang['delete']%>" /></a> |
    <%}%>
    <a href="?cat=<%=tArticle.category.id%>"><%=lang["category"]%>: <%=tArticle.category.name%></a> |
    <a href="<%=theCache.settings["baseURL"]%>?id=<%=tArticle.id%>"><%=lang["permalink"]%></a> |
    <a href="article.asp?id=<%=tArticle.id%>#commentbox"><%=lang["comments"]%>: <%=tArticle.commentCount%></a> |
    <a href="trackback.asp?act=list&amp;id=<%=tArticle.id%>"><%=lang["trackbacks"]%>: <%=tArticle.trackbackCount%></a> |
    <%=lang["views"]%>: <%=tArticle.viewCount%>
  </div>
</div>
  <%}
  }
}


function outputList(arrArticle, arrKeywords){
%>
<div class="listbox">
<div class="listbox-table">
<table cellpadding="2" cellspacing="2" width="100%">
<%
for(var i=0;i<arrArticle.length&&i<theCache.settings["articlePerPageList"];i++){
  var tArticle=new lbsArticle();
  tArticle.fill(arrArticle[i]);
%>
  <tr>
  <td class="listbox-entry">
    <a href="?cat=<%=tArticle.category.id%>">[<%=tArticle.category.name%>]</a>
    <a href="article.asp?id=<%=tArticle.id%>"> 
    <%if(!theUser.checkViewPermission(tArticle)){%>
      <%=tArticle.title.replace(/./g,"*")%>
    <%}else{%>
      <%
        var strTitle=func.HTMLEncode(tArticle.title);
        if(arrKeywords.length>0){
          strTitle=func.highlight(strTitle,arrKeywords);
        }       
      %>
      <%=strTitle%>
    <%}%></a>
    <%if(tArticle.selected){%><img src="<%=theCache.settings["imageFolder"]%>/icon_star.gif" alt="<%=lang["selected"]%>" /><%}%>
    <%if(tArticle.locked||tArticle.category.locked){%><img src="<%=theCache.settings["imageFolder"]%>/icon_lock.gif" alt="<%=lang["locked"]%>" /><%}%>
  </td>
  <td class="listbox-entry" style="word-break: normal;">
    <%if(theUser.rights["edit"]>1||(theUser.rights["edit"]==1&&theUser.username==tArticle.author)){%>
    <a href="article.asp?act=edit&amp;id=<%=tArticle.id%>" title="<%=lang['edit']%>"><img src="<%=theCache.settings["imageFolder"]%>/icon_edit.gif" alt="<%=lang['edit']%>" /></a> |
    <%}%>
    <%if(theUser.rights["delete"]>1||(theUser.rights["delete"]==1&&theUser.username==tArticle.author)){%>
    <a href="article.asp?act=delete&amp;id=<%=tArticle.id%>" title="<%=lang['delete']%>" onclick="return confirm('<%=lang["confirm_delete_article"]%>?')"><img src="<%=theCache.settings["imageFolder"]%>/icon_del.gif" alt="<%=lang['delete']%>" /></a> |
    <%}%>
    <a href="user.asp?act=view&amp;id=<%=tArticle.authorID%>" title="<%=lang["author"]%>"><%=tArticle.author%></a>
  </td>
  <td class="listbox-entry" width="70"><%=func.getDateTimeString("YY-MM-DD",tArticle.postTime)%></td>
  <td class="listbox-entry" width="100"><a href="article.asp?id=<%=tArticle.id%>#commentbox" title="<%=lang["comments"]%>"><%=tArticle.commentCount%></a> | <%=tArticle.trackbackCount%> | <%=tArticle.viewCount%></td>
  </tr>
<%}%>
</table>
</div>
</div>
<%
}

%>








