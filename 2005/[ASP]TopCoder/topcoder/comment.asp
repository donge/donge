<!---#include file="_common.asp"-->
<!---#include file="global.asp"-->
<!---#include file="class/article.asp"-->
<!---#include file="class/ubbcode.asp"-->
<!---#include file="source/src_comment.asp"-->
<%
//====== Comment PAGE OUTPUT =================================
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-04-23 19:09:38
//============================================================

function outputCommentList(comments, intEntryCount, intEntryPerPage, intCurrentPage, intCategory, strURLPrefix, arrKeywords){
  var strPageLinks = func.generatePageLinks(intEntryCount, intEntryPerPage, intCurrentPage, 15, strURLPrefix);
%>
<div id="mainWrapper">
<div id="content" class="content">
<div id="innerContent">
<div class="comment-wrapper">
  <div class="article-top">
    <div class="pages">
    <%=lang["comments"]%> |
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
      <%=lang["no-entry"]%>
      </div>
    </div>
    <%
  }else{
    for(var i=0;i<comments.length;i++){
      with(comments[i]){
    %>
    <div class="commentbox">
      <div class="commentbox-title">
        <img src="<%=theCache.settings["imageFolder"]%>/icon_quote<%if(authorID==log_authorID)write("_author")%>.gif" alt="<%=lang["quote"]%>" />
        <b><a href="user.asp?act=view&amp;id=<%=authorID%>"><%=author%><%if(authorID==0)write("*")%></a></b>
        :
        <a href="article.asp?id=<%=log_id%>"><%=log_title%></a>
        <div class="commentbox-label">
          [ <%=func.getDateTimeString("YY-MM-DD hh:ii:ss",postTime)%><%if(theUser.groupID==1){%> | <%=IP%><%}%> ]
        <%if(theUser.loggedIn&&(theUser.rights["edit"]>1||(theUser.rights["edit"]==1&&(theUser.id==log_authorID||theUser.id==authorID)))){%>
        &nbsp;<a href="comment.asp?act=edit&amp;id=<%=id%>" title="<%=lang['edit']%>"><img src="<%=theCache.settings["imageFolder"]%>/icon_edit.gif" alt="<%=lang['edit']%>"></a>
        <%}%>
        <%if(theUser.loggedIn&&(theUser.rights["delete"]>1||(theUser.rights["delete"]==1&&(theUser.id==log_authorID||theUser.id==authorID)))){%>
        &nbsp;<a href="comment.asp?act=delete&amp;id=<%=id%>" title="<%=lang['delete']%>" onclick="return confirm('<%=lang["confirm_delete_comment"]%>?')"><img src="<%=theCache.settings["imageFolder"]%>/icon_del.gif" alt="<%=lang['delete']%>"></a>
        <%}%>
        </div>
      </div>
      <div id="comm_<%=id%>" class="commentbox-content">
        <%if(!hidden||theUser.id==log_authorID||(theUser.id==authorID&&authorID!=0)){%>
          <%
          var strContent=ubb.toHTML(func.HTMLEncode(content),ubbFlags,"",true)
          if(arrKeywords.length>0){
            strContent=func.highlight(strContent, arrKeywords);
          }
          %>
          <%=strContent%>
          <%if(editMark){
              var arrEdit=editMark.split("$|$");
              %>
            <div class="editmark">[<%=lang["edited_by"]+arrEdit[0]+lang["at"]+arrEdit[1]%>]</div>
          <%}%>
        <%}else{%>
          <div class="hidden-note"><%=lang["hidden_comment"]%></div>
        <%}%>
      </div>
    </div>
    <%}
    }
  }
  %>
  <div class="article-bottom">
    <div class="pages">
    <%=lang["comments"]%> |
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

// Edit Comment Form
function outputEditComment(strTitle,strActionURL,strContent,strUBBFlags,bHidden){
%>
<div id="mainWrapper">
<div id="content" class="content">
<div id="innerContent">
<%commentForm(strTitle,strActionURL,strContent,strUBBFlags,bHidden)%>
</div>
</div>
<% sidebar(); %>
<div class="clear"></div>
</div>
<%
}
%>