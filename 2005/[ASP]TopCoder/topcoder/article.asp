<!---#include file="_common.asp"-->
<!---#include file="global.asp"-->
<!---#include file="class/ubbcode.asp"-->
<!---#include file="class/article.asp"-->
<!---#include file="source/src_article.asp"-->
<%
//====== Article PAGE OUTPUT =================================
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-04-23 19:09:45
//============================================================

function outputArticle(theArticle, intEntryCount, intPageSize, intCurrentPage){
  var strPageLinks="";
  if(intPageSize>0){ 
    strPageLinks = func.generatePageLinks(intEntryCount, intPageSize, intCurrentPage, 15, "?id="+theArticle.id, "#comments");
  }
%>
<div id="mainWrapper">
<div id="content" class="content">
<div id="innerContent">
  <div class="article-top">
    <div class="prev-article"><% if(theArticle.prevArticle){ %><a href="?id=<%=theArticle.prevArticle.id%>" title="<%=func.HTMLEncode(theArticle.prevArticle.title)%>">&laquo; <%=func.HTMLEncode(func.cutString(theArticle.prevArticle.title,20))%></a><% } %></div>
    <div class="next-article"><% if(theArticle.nextArticle){ %><a href="?id=<%=theArticle.nextArticle.id%>" title="<%=func.HTMLEncode(theArticle.nextArticle.title)%>"><%=func.HTMLEncode(func.cutString(theArticle.nextArticle.title,20))%> &raquo;</a><% } %></div>
    <div class="category-label"><a href="default.asp?cat=<%=theArticle.category.id%>"><%=lang["category"]%>: <%=func.HTMLEncode(theArticle.category.name)%></a></div>
  </div>
  <div class="textbox">
    <div class="textbox-title">
      <%if(theArticle.selected){%><img src="<%=theCache.settings["imageFolder"]%>/icon_star.gif" alt="<%=lang["selected"]%>" /><%}%>
      <%if(theArticle.locked||theArticle.category.locked){%><img src="<%=theCache.settings["imageFolder"]%>/icon_lock.gif" alt="<%=lang["locked"]%>" /><%}%>
      <h4><%=func.HTMLEncode(theArticle.title)%></h4>
      <div class="textbox-label">
      [ <%=func.getDateTimeString("YY-MM-DD hh:ii:ss",theArticle.postTime)%> | <%=lang["author"]%>: <a href='user.asp?act=view&amp;id=<%=theArticle.authorID%>'><%=theArticle.author%></a><%if(theUser.groupID==1){%> | <%=theArticle.IP%><%}%> ]
      <%if(theUser.rights["edit"]>1||(theUser.rights["edit"]==1&&theUser.username==theArticle.author)){%>
      &nbsp;<a href="?act=edit&amp;id=<%=theArticle.id%>" title="<%=lang['edit']%>"><img src="<%=theCache.settings["imageFolder"]%>/icon_edit.gif" alt="<%=lang['edit']%>" /></a>
      <%}%>
      <%if(theUser.rights["delete"]>1||(theUser.rights["delete"]==1&&theUser.username==theArticle.author)){%>
      &nbsp;<a href="?act=delete&amp;id=<%=theArticle.id%>" title="<%=lang['delete']%>" onclick="return confirm('<%=lang["confirm_delete_article"]%>?')"><img src="<%=theCache.settings["imageFolder"]%>/icon_del.gif" alt="<%=lang['delete']%>" /></a>
      <%}%>
      </div>
    </div>
    <div class="textbox-fontsize">
      <%=lang["font_size"]%>:
      <a href="javascript:setFontSize(14)" title="<%=lang["font_size"]%>: <%=lang["large"]%>"><%=lang["large"]%></a> |
      <a href="javascript:setFontSize(11)" title="<%=lang["font_size"]%>: <%=lang["medium"]%>"><%=lang["medium"]%></a> |
      <a href="javascript:setFontSize(9)" title="<%=lang["font_size"]%>: <%=lang["small"]%>"><%=lang["small"]%></a>
    </div>
    <div id="textboxContent" class="textbox-content">
    <%if(theArticle.ubbFlags=="html"){%>
      <%=(theArticle.content0+theArticle.content1).replace(/\[separator\]/ig,"")%>
    <%}else{%>
      <%=ubb.toHTML(func.HTMLEncode(theArticle.content0+theArticle.content1),theArticle.ubbFlags)%>
    <%}%>
    <%if(theArticle.editMark){
        var arrEdit=theArticle.editMark.split("$|$");
        %>
      <div class="editmark">[<%=lang["edited_by"]+arrEdit[0]+lang["at"]+arrEdit[1]%>]</div>
    <%}%>
      <div class="textbox-urls">
        <img src="<%=theCache.settings["imageFolder"]%>/rss_comment.png" class="meta-button" alt="<%=lang["comment_feed"]%>" />
        <b><%=lang["comment_feed"]%>:</b> <%=theCache.settings["baseURL"]+"feed.asp?q=comment&amp;id="+theArticle.id%>
      <%if(theCache.settings["enableTrackbackIn"]==1&&!theArticle.locked&&theArticle.mode<4){%>
        <br />
        <img src="<%=theCache.settings["imageFolder"]%>/utf8.png"  class="meta-button" alt="UTF-8 Encoding" /> <b><%=lang["trackback_url"]%>:</b> <%=theCache.settings["baseURL"]+"trackback.asp?id="+theArticle.id%>
      <%}%>
      </div>
    </div>
  </div>
  <br />
  <script type="text/javascript" language="javascript" src="common.js"></script>
  <a name="comments"></a>
  <div id="commentWrapper" class="comment-wrapper">
    <% if(theArticle.comments){
         %>
    <div id="commentTop" class="comment-top"><%=lang["view_mode"]%>: <a href="javascript:toggleComments(true,true);"><%=lang["show_all"]%></a> |
    <a href="javascript:toggleComments(true,false);"><%=lang["comments"]%>: <%=theArticle.commentCount%></a> |
    <%if(theCache.settings["showTrackbackWithComment"]==1){%><a href="javascript:toggleComments(false,true);"><%}else{%><a href="trackback.asp?act=list&amp;id=<%=theArticle.id%>" target="_blank"><%}%><%=lang["trackbacks"]%>: <%=theArticle.trackbackCount%></a> | <a href="javascript:toggleOrder();"><%=lang["toggle_order"]%></a> | <%=lang["views"]%>: <%=theArticle.viewCount%> </div>
    <%if(intPageSize>0){%>
    <div class="comment-pages">
      <%=strPageLinks%>
    </div>
    <%}%>
    <%
    for(var i=0;i<theArticle.comments.length;i++){
      with(theArticle.comments[i]){
        if(type==0){ %>
    <div class="commentbox" id="comment<%=id%>">
      <a name="comment<%=id%>"></a>
      <div class="commentbox-title">
        <a href="javascript:doQuote('comm_<%=id%>','<%=author%>')"><img src="<%=theCache.settings["imageFolder"]%>/icon_quote<%if(authorID==theArticle.authorID)write("_author")%>.gif" alt="<%=lang["quote"]%>" /></a>
        <b><a href="user.asp?act=view&amp;id=<%=authorID%>"><%=author%><%if(authorID==0)write("*")%></a></b>
        <div class="commentbox-label">
          [ <%=func.getDateTimeString("YY-MM-DD hh:ii:ss",postTime)%><%if(theUser.groupID==1){%> | <%=IP%><%}%> ]
          <%if(theUser.loggedIn&&(theUser.rights["edit"]>1||(theUser.rights["edit"]==1&&(theUser.id==theArticle.authorID||theUser.id==authorID)))){%>
          &nbsp;<a href="comment.asp?act=edit&amp;id=<%=id%>" title="<%=lang['edit']%>"><img src="<%=theCache.settings["imageFolder"]%>/icon_edit.gif" alt="<%=lang['edit']%>" /></a>
          <%}%>
          <%if(theUser.loggedIn&&(theUser.rights["delete"]>1||(theUser.rights["delete"]==1&&(theUser.id==theArticle.authorID||theUser.id==authorID)))){%>
          &nbsp;<a href="comment.asp?act=delete&amp;id=<%=id%>" title="<%=lang['delete']%>" onclick="return confirm('<%=lang["confirm_delete_comment"]%>?')"><img src="<%=theCache.settings["imageFolder"]%>/icon_del.gif" alt="<%=lang['delete']%>" /></a>
          <%}%>
        </div>
      </div>
      <div id="comm_<%=id%>" class="commentbox-content">
        <%if(!hidden||theUser.id==theArticle.authorID||(theUser.id==authorID&&authorID!=0)){%>
          <%=ubb.toHTML(func.HTMLEncode(content),ubbFlags,"",true)%>
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
          <% }else{ %>
    <div class="trackbackbox" id="trackback<%=id%>">
      <a name="trackback<%=id%>"></a>
      <div class="trackbackbox-title">
        <img src="<%=theCache.settings["imageFolder"]%>/icon_trackback.gif" alt="<%=lang["trackback"]%>" />
        <b><a href="<%=func.HTMLEncode(url)%>" target="_blank"><%=func.HTMLEncode(title)%></a></b>
        <div class="trackbackbox-label">
          [  <%=func.HTMLEncode(blog)%> | <%=func.getDateTimeString("YY-MM-DD hh:ii:ss",time)%><%if(theUser.groupID==1){%> | <%=IP%><%}%> ]
        <%if(theUser.loggedIn&&(theUser.rights["delete"]>1|| (theUser.rights["delete"]==1&&theUser.id==theArticle.authorID))){%>
          &nbsp;<a href="trackback.asp?act=delete&amp;id=<%=id%>" onclick="return confirm('<%=lang["confirm_delete_trackback"]%>?')"><img src="<%=theCache.settings["imageFolder"]%>/icon_del.gif" alt="<%=lang['delete']%>" /></a>
        <%}%>
        </div>
      </div>
      <div class="trackbackbox-content"><%=func.HTMLEncode(excerpt)%></div>
    </div>
        <% }
         }
       }
       %>
    <%if(intPageSize>0){%>
    <div class="comment-pages">
      <%=strPageLinks%>
    </div>
    <%}%>
  <%}else{ %>
    <div class="no-comment-box"><%=lang["no_comment"]%></div>
  <%}%>
  </div>
  <br />
  <a name="commentbox"></a>
  <%if(theArticle.locked||theArticle.category.locked||theCache.settings["enableComment"]!=1){%>
    <div class="no-comment-box"><%=lang["comment_disabled"]%></div>
  <%}else{%>
    <%commentForm(lang["post_comment"],"comment.asp?act=save&amp;logid="+theArticle.id);%>
  <%}%>

</div>
</div>
<% sidebar(); %>
<div class="clear"></div>
</div>
<%
}

function outputForm(formTitle, formAction, objArticle, bEdit){
%>
<div id="mainWrapper">
<script type="text/javascript" language="javascript" src="messageform.js"></script>
<form name="inputform" method="post" action="<%=formAction%>">
<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" class="formbox">
  <tr>
    <td colspan="2" class="formbox-title"><%=formTitle%></td>
  </tr>
  <tr>
    <td class="formbox-rowheader" width="140"><b><%=lang["category"]%>:</b></td>
    <td class="formbox-content">
      <select name="log_catid" id="log_catid">
        <option value="0">- <%=lang["select_category"]%> -</option>
        <%for(var i=0;i<theCache.categories.length;i++){
            if(!theCache.categories[i].hidden||(theCache.categories[i].hidden&&theUser.rights["view"]>1)){%>
          <option value="<%=theCache.categories[i].id%>" <%if(objArticle.categoryID==theCache.categories[i].id) write(' selected="selected"')%>><%=theCache.categories[i].name%> [<%=theCache.categories[i].articleCount%>]</option>
        <%  }
        }%>
      </select>
      &nbsp;&nbsp;
      <b><%=lang["mode"]%>:</b> 
      <select name="log_mode" id="log_mode">
        <option value="1"<%if(objArticle.mode==1) write(' selected="selected"')%>><%=lang["public"]%></option>
        <option value="2"<%if(objArticle.mode==2) write(' selected="selected"')%>><%=lang["draft"]%></option>
        <option value="3"<%if(objArticle.mode==3) write(' selected="selected"')%>><%=lang["hidden"]%></option>
        <option value="4"<%if(objArticle.mode==4) write(' selected="selected"')%>><%=lang["private"]%></option>
      </select>
      &nbsp;&nbsp;
      <input name="log_locked" type="checkbox" id="log_locked" value="true"<%if(objArticle.locked) write(' checked="checked"')%> /> <%=lang["locked"]%>
      <%if(bEdit){%>
      &nbsp;&nbsp;
      <a href="?act=delete&id=<%=objArticle.id%>" onclick="return confirm('<%=lang["confirm_delete_article"]%>?')"><img src="<%=theCache.settings["imageFolder"]%>/icon_del.gif" /> <%=lang["delete"]%></a>
      <%}%>
    </td>
  </tr>
  <tr>
    <td class="formbox-rowheader"><b><%=lang["title"]%>:</b></td>
    <td class="formbox-content">
      <input name="log_title" type="text" id="log_title" size="60" value="<%=func.HTMLEncodeLite(objArticle.title)%>" maxlength="255" class="text" />&nbsp;&nbsp;
      <input name="log_selected" type="checkbox" id="log_selected" value="true"<%if(objArticle.selected) write(' checked="checked"')%> /> <%=lang["selected"]%>
      <input name="log_id" type="hidden" value="<%=objArticle.id%>" />
    </td>
  </tr>
  <tr>
    <td class="formbox-rowheader"><b><%=lang["post_time"]%>:</b></td>
    <td class="formbox-content">
      <input name="log_postTime" type="text" id="log_postTime" size="20" value="<%=func.getDateTimeString("YY-MM-DD hh:ii:ss",objArticle.postTime)%>" maxlength="20" class="text" />&nbsp;&nbsp&nbsp;<a href="javascript:setToCurrentTime()"><%=lang["set_to_current"]%></a>
    </td>
  </tr>
  <tr>
    <td class="formbox-rowheader" valign="top">
      <b><%=lang["content"]%>:</b><br /><br />
      <div class="panel-smilies">
        <div class="panel-smilies-title"><%=lang["smilies"]%></div>
        <div class="panel-smilies-content">
        <%for(var i=0;i<theCache.smilies.length;i++){%>
          <a href="javascript:insertSmilies('<%=theCache.smilies[i].code%>')"><img src="<%=theCache.settings["smiliesFolder"]%>/<%=theCache.smilies[i].image%>" alt="<%=theCache.smilies[i].code%>" /></a>
          <%if((i+1)%theCache.settings["smiliesPerRow"]==0) write("<br />\n")%>
        <%}%>
        </div>
      </div>
      <div style="font-weight: normal; text-align:left;">
        <input name="e_html" type="checkbox" value="true"<%if(objArticle.ubbFlags=="html") write(" checked=\"checked\"")%> /> <%=lang["e_html"]%><br />
        <input name="e_ubb" type="checkbox" value="true"<%if(objArticle.ubbFlags!="html" && objArticle.ubbFlags.substr(0,1)=="1") write(" checked=\"checked\"")%> /> <%=lang["e_ubb"]%><br />
        <input name="e_autourl" type="checkbox" value="true"<%if(objArticle.ubbFlags!="html" && objArticle.ubbFlags.substr(1,1)=="1") write(" checked=\"checked\"")%> /> <%=lang["e_autourl"]%><br />
        <input name="e_image" type="checkbox" value="true"<%if(objArticle.ubbFlags!="html" && objArticle.ubbFlags.substr(2,1)=="1") write(" checked=\"checked\"")%> /> <%=lang["e_image"]%><br />
        <input name="e_media" type="checkbox" value="true"<%if(objArticle.ubbFlags!="html" && objArticle.ubbFlags.substr(3,1)=="1") write(" checked=\"checked\"")%> /> <%=lang["e_media"]%><br />
        <input name="e_smilies" type="checkbox" value="true"<%if(objArticle.ubbFlags!="html" && objArticle.ubbFlags.substr(4,1)=="1") write(" checked=\"checked\"")%> /> <%=lang["e_smilies"]%>
      </div>
    </td>
    <td class="formbox-content">
      <div style="padding-bottom:3px">
        <select name="font" onfocus="this.selectedIndex=0" onchange="chfont(this.options[this.selectedIndex].value)">
          <option value="" selected="selected">- Select Font -</option>
          <option value="Arial">Arial</option>
          <option value="Book Antiqua">Book Antiqua</option>
          <option value="Century Gothic">Century Gothic</option>
          <option value="Courier New">Courier New</option>
          <option value="Georgia">Georgia</option>
          <option value="Impact">Impact</option>
          <option value="Tahoma">Tahoma</option>
          <option value="Times New Roman">Times New Roman</option>
          <option value="Verdana">Verdana</option>
        </select>
        <select name="size" onfocus="this.selectedIndex=0" onchange="chsize(this.options[this.selectedIndex].value)">
          <option value="" selected="selected">- Size (pt) -</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="12">12</option>
          <option value="16">16</option>
          <option value="18">18</option>
          <option value="24">24</option>
          <option value="28">28</option>
          <option value="32">32</option>
          <option value="36">36</option>
        </select>
        <select name="color" onfocus="this.selectedIndex=0" onchange="chcolor(this.options[this.selectedIndex].value)">
          <option value="" selected="selected">- Color -</option>
          <option value="White" style="background-color:white;color:white;">White</option>
          <option value="Black" style="background-color:black;color:black;">Black</option>
          <option value="Red" style="background-color:red;color:red;">Red</option>
          <option value="Yellow" style="background-color:yellow;color:yellow;">Yellow</option>
          <option value="Pink" style="background-color:pink;color:pink;">Pink</option>
          <option value="Green" style="background-color:green;color:green;">Green</option>
          <option value="Orange" style="background-color:orange;color:orange;">Orange</option>
          <option value="Purple" style="background-color:purple;color:purple;">Purple</option>
          <option value="Blue" style="background-color:blue;color:blue;">Blue</option>
          <option value="Beige" style="background-color:beige;color:beige;">Beige</option>
          <option value="Brown" style="background-color:brown;color:brown;">Brown</option>
          <option value="Teal" style="background-color:teal;color:teal;">Teal</option>
          <option value="Navy" style="background-color:navy;color:navy;">Navy</option>
          <option value="Maroon" style="background-color:maroon;color:maroon;">Maroon</option>
          <option value="LimeGreen" style="background-color:limegreen;color:limegreen;">LimeGreen</option>
        </select>  &nbsp;
        <input type="radio" name="mode" value="1" onclick="chmode(1)" checked="checked" /> Basic
        <input type="radio" name="mode" value="0" onclick="chmode(0)" /> Prompt
      </div>
      <div>
        <a href="javascript:bold()"><img src="<%=theCache.settings["imageFolder"]%>/ubbcode/bb_bold.gif" alt="Bold" /></a> <a href="javascript:italicize()"><img src="<%=theCache.settings["imageFolder"]%>/ubbcode/bb_italicize.gif" alt="Italic" /></a> <a href="javascript:underline()"><img src="<%=theCache.settings["imageFolder"]%>/ubbcode/bb_underline.gif" alt="Underline" /></a> <a href="javascript:strike()"><img src="<%=theCache.settings["imageFolder"]%>/ubbcode/bb_strike.gif" alt="Strike Line" /></a> <a href="javascript:superscript()"><img src="<%=theCache.settings["imageFolder"]%>/ubbcode/bb_sup.gif" alt="Insert Superscript" /></a> <a href="javascript:subscript()"><img src="<%=theCache.settings["imageFolder"]%>/ubbcode/bb_sub.gif" alt="Insert Subscript" /></a> <a href="javascript:center()"><img src="<%=theCache.settings["imageFolder"]%>/ubbcode/bb_center.gif" alt="Align Center" /></a> <a href="javascript:hyperlink()"><img src="<%=theCache.settings["imageFolder"]%>/ubbcode/bb_url.gif" alt="Insert URL" /></a> <a href="javascript:email()"><img src="<%=theCache.settings["imageFolder"]%>/ubbcode/bb_email.gif" alt="Insert Mail Link" /></a> <a href="javascript:image()"><img src="<%=theCache.settings["imageFolder"]%>/ubbcode/bb_image.gif" alt="Insert Image" /></a> <a href="javascript:media()"><img src="<%=theCache.settings["imageFolder"]%>/ubbcode/bb_media.gif" alt="Insert Flash" /></a> <a href="javascript:code()"><img src="<%=theCache.settings["imageFolder"]%>/ubbcode/bb_code.gif" alt="Insert Code Block" /></a> <a href="javascript:quote()"><img src="<%=theCache.settings["imageFolder"]%>/ubbcode/bb_quote.gif" alt="Insert Quote" /></a> <a href="javascript:list()"><img src="<%=theCache.settings["imageFolder"]%>/ubbcode/bb_list.gif" alt="Insert List" /></a> <a href="javascript:seperator()"><img src="<%=theCache.settings["imageFolder"]%>/ubbcode/bb_seperator.gif" alt="Insert Content Separator" /></a>
      </div>
      <div>
        <textarea name="message" rows="18" cols="64" id="message" style="width:100%" onselect="storeCaret(this);" onclick="storeCaret(this);" onkeyup="storeCaret(this);CtrlEnter();"><%=func.HTMLEncodeLite(objArticle.content0+objArticle.content1)%></textarea>
      </div>
    </td>
  </tr>
  <%if(theUser.rights["upload"]>0&&theCache.settings["enableUpload"]==1){%>
  <tr class="formbox-content">
    <td align="right"><b><%=lang["attachment"]%>:</b></td>
    <td><iframe frameborder="0" height="21" marginheight="0" marginwidth="0" scrolling="no" width="99%" src="upload.asp"></iframe></td>
  </tr>
  <%}%>
  <tr class="formbox-content">
    <td align="right"><b><%=lang["trackback_url"]%>:</b></td>
    <td>
      <input name="log_trackbackurl" type="text" id="log_trackbackurl" size="60" value="<%=func.URLEncode(objArticle.trackbackURL)%>" maxlength="255" class="text" />
    </td>
  </tr>
  <tr class="formbox-content">
    <td></td>
    <td>
      <input name="btnSubmit" type="button" id="btnSubmit" value="<%=lang["save"]%>" onclick="CheckInputForm();" class="button" />
      <input name="btnReset" type="reset" id="btnReset" value="<%=lang["reset"]%>" class="button" />
      <input name="btnCancel" type="button" id="btnCancel" value="<%=lang["cancel"]%>" onclick="window.history.back();" class="button" />
    </td>
  </tr>
</table>
</form>
</div>
<%
}
%>