<!---#include file="_common.asp"-->
<!---#include file="global.asp"-->
<!---#include file="class/ubbcode.asp"-->
<!---#include file="source/src_gbook.asp"-->
<%
//====== Guestbook PAGE OUTPUT ===============================
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-04-23 19:09:54
//============================================================

// Output Master Page Layout
function outputGuestBook(entries, intEntryCount, intEntryPerPage, intCurrentPage, strURLPrefix, arrKeywords){
  var strPageLinks = String(intEntryCount)+lang["entries"]+" | "+func.generatePageLinks(intEntryCount, intEntryPerPage, intCurrentPage, 15, strURLPrefix);
%>
<div id="mainWrapper">
<div id="content" class="content">
<div id="innerContent">
  <div class="article-top">
    <div class="pages">
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
    for(var i=0;i<entries.length;i++){
      with(entries[i]){%>
  <div class="gbbox">
    <div class="gbbox-content">
      <div class="gbbox-title">
        <a href='user.asp?act=view&amp;id=<%=userid%>'><%=username%><%if(userid==0)write("*")%></a>
        <div class="gbbox-label">
        [ <%=func.getDateTimeString("YY-MM-DD hh:ii:ss",postTime)%><%if(theUser.groupID==1){%> | <%=ip%><%}%> ]
        <%if(theUser.loggedIn&&(theUser.rights["edit"]>1||(theUser.rights["edit"]==1&&theUser.id==userid))){%>
          &nbsp;<a href="?act=edit&amp;id=<%=id%>" title="<%=lang['edit']+"/"+lang["reply"]%>"><img src="<%=theCache.settings["imageFolder"]%>/icon_edit.gif" alt="<%=lang['edit']+"/"+lang["reply"]%>"></a>
          <%}%>
        <%if(theUser.loggedIn&&(theUser.rights["delete"]>1||(theUser.rights["delete"]==1&&theUser.id==userid))){%>
          &nbsp;<a href="?act=delete&amp;id=<%=id%>" title="<%=lang['delete']%>" onclick="return confirm('<%=lang["confirm_delete_comment"]%>?')"><img src="<%=theCache.settings["imageFolder"]%>/icon_del.gif" alt="<%=lang['delete']%>"></a>
          <%}%>
        </div>
      </div>
      <%if(!hidden||(theUser.id==userid&&userid!=0)||theUser.rights["view"]>2){%>
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
    <%if(reply){%>
    <div class="gbbox-reply">
      <div class="gbbox-reply-title">
        <%=replyUsername%>
        <div class="gbbox-reply-label">[ <%=func.getDateTimeString("YY-MM-DD hh:ii:ss",replyTime)%> ]</div>
      </div>
      <%if(!hidden||(theUser.id==userid&&userid!=0)||theUser.rights["view"]>2){%>
        <%
        var strContent=ubb.toHTML(func.HTMLEncode(reply),"110011", "", true)
        if(arrKeywords.length>0){
          strContent=func.highlight(strContent, arrKeywords);
        }
        %>
        <%=strContent%>
      <%}else{%>
        <div class="hidden-note"><%=lang["hidden_comment"]%></div>
      <%}%>
    </div>
    <%}%>
  </div>
    <%}
    }
  }
  %>
  <div class="article-bottom">
    <div class="pages">
    <%=strPageLinks%>
    </div>
  </div>
  <br />
  <%commentForm(lang["post_comment"],"?act=save")%>
</div>
</div>
<% sidebar(); %>
<div class="clear"></div>
</div>
<%
}

// Edit Guestbook Entry
function outputEditEntry(strTitle,strActionURL,strContent,strUBBFlags,bHidden,strReply,bShowReplyArea){
%>
<div id="mainWrapper">
<div id="content" class="content">
<div id="innerContent">
<%commentForm(strTitle,strActionURL,strContent,strUBBFlags,bHidden,strReply,bShowReplyArea)%>
</div>
</div>
<% sidebar(); %>
<div class="clear"></div>
</div>
<%
}
%>