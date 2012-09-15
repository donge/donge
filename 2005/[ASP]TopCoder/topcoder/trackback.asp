<!---#include file="_common.asp"-->
<!---#include file="global.asp"-->
<!---#include file="class/article.asp"-->
<!---#include file="source/src_trackback.asp"-->
<%
//====== Trackback PAGE OUTPUT ===============================
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-04-23 19:09:33
//============================================================

function outputTrackbackList(trackbacks, intEntryCount, intEntryPerPage, intCurrentPage, intCategory, strURLPrefix, arrKeywords){
  var strPageLinks = func.generatePageLinks(intEntryCount, intEntryPerPage, intCurrentPage, 15, strURLPrefix);
%>
<div id="mainWrapper">
<div id="content" class="content">
<div id="innerContent">
<div class="comment-wrapper">
  <div class="article-top">
    <div class="pages">
    <%=lang["trackbacks"]%> |
    <%if(intCategory){%><%=lang["category"]%>: <%=func.HTMLEncode(theCache.getCategoryByID(intCategory).name)%> | <%}%>
    <%if(input["q"]){%><%=lang["search"]%>: <%=func.HTMLEncodeLite(input["q"])%> | <%}%>
    <%=strPageLinks%>
    </div>
  </div>
  <%
  if(intEntryCount==0){
    %>
    <div class="no-entry">
      <div class="no-entry-message">
      <%=lang["no_entry"]%>
      </div>
    </div>
    <%
  }else{
    for(var i=0;i<trackbacks.length;i++){
      with(trackbacks[i]){
    %>
    <div class="trackbackbox">
      <div class="trackbackbox-title">
        <img src="<%=theCache.settings["imageFolder"]%>/icon_trackback.gif" alt="<%=lang["trackback"]%>" />
        <b><a href="<%=func.HTMLEncode(url)%>" title="<%=func.HTMLEncode(title)%>" target="_blank">
        <%
          var strTitle=func.HTMLEncode(title);
          if(arrKeywords.length>0){
            strTitle=func.highlight(strTitle, arrKeywords);
          }
        %>
        <%=strTitle%>
        </a></b>
        <div class="trackbackbox-label">
          [  <%=func.HTMLEncode(blog)%> | <%=func.getDateTimeString("YY-MM-DD hh:ii:ss",time)%><%if(theUser.groupID==1){%> | <%=IP%><%}%> ]
        <%if(theUser.loggedIn&&(theUser.rights["delete"]>1|| (theUser.rights["delete"]==1&&theUser.id==log_authorID))){%>
          &nbsp;<a href="trackback.asp?act=delete&amp;id=<%=id%>" onclick="return confirm('<%=lang["confirm_delete_trackback"]%>?')"><img src="<%=theCache.settings["imageFolder"]%>/icon_del.gif" alt="<%=lang['delete']%>"></a>
        <%}%>
        </div>
      </div>
      <div class="trackbackbox-content">
        <%
          var strExcerpt=func.HTMLEncode(excerpt);
          if(arrKeywords.length>0){
            strExcerpt=func.highlight(strExcerpt, arrKeywords);
          }
        %>
        <%=strExcerpt%>
        <br /><br />
        <a href="article.asp?id=<%=log_id%>">&raquo; <%=func.HTMLEncode(log_title)%></a>
      </div>
    </div>
    <%}
    }
  }
  %>
  <div class="article-bottom">
    <div class="pages">
    <%=lang["trackbacks"]%> |
    <%=strPageLinks%>
    </div>
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