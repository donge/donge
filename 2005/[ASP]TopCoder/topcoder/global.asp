<script language="JScript" runAt="server">
// Check If File is Called Correctly
var inLBS;
if(inLBS!=true){
  Response.write("Invalid Call");
  Response.End();
}
</script>
<%
//====== Global PAGE ELEMENTS OUTPUT =========================
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-04-23 12:22:38
//============================================================

// Page header //////////////////////////////////////////////////////////////
function pageHeader(strTitle){
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=func.HTMLEncode((!strTitle?"":strTitle+" - ")+theCache.settings["blogTitle"])%></title>
<meta name="robots" content="follow,index" />
<link rel="stylesheet" type="text/css" href="<%=theCache.settings["styleSheet"]%>" />
<link rel="alternate" type="application/rss+xml" title="<%=func.HTMLEncode(theCache.settings["blogTitle"])%>" href="<%=theCache.settings["baseURL"]%>feed.asp" />
<script type="text/javascript" language="javascript" src="common.js"></script>
</head>

<body>
<div id="wrapper">
<div id="innerWrapper">
<%if(Application(lbsNamespace+"siteClosed")==true){%>
<div style="border: solid 1px #CC0000; text-align: center; background: #FFEEDD;color: #990000">Site is Currently Closed</div>
<%}%>
<div id="header">
<div id="innerHeader">
  <div id="blogLogo"><img src="<%=theCache.settings["logoImage"]%>" id="logo" alt="Logo" /></div>
  <div class="blog-header">
    <h1 class="blog-title"><a href="<%=theCache.settings["baseURL"]%>"><%=func.HTMLEncode(theCache.settings["blogTitle"])%></a></h1>
    <div class="blog-desc"><%=func.HTMLEncode(theCache.settings["blogDescription"])%></div>
  </div>
  <div id="menu">
    <ul>
    <li><a href="default.asp"><%=lang["index"]%></a></li>
    <li><a href="default.asp?selected=true"><%=lang["selected"]%></a></li>
    <li><a href="gbook.asp"><%=lang["guestbook"]%></a></li>
    <li><a href="javascript:showHideSidebar()"><%=lang["toggle_sidebar"]%></a></li>
    <%if(!theUser.loggedIn){%><li><a href="javascript:showLogin()"><%=lang["login"]%></a></li><%}%>
    </ul>
  </div>
</div>
</div>
<%
}

// Sidebar //////////////////////////////////////////////////////////////
function sidebar(){
  %>
<div id="sidebar" class="sidebar">
<div id="innerSidebar">

  <%if(theUser.loggedIn){%>
  <div id="panel_user" class="panel">
  <h5><%=lang["user_panel"]%></h5>
  <div class="panel-content">
    <div class="comment-text"><%=lang["login_as"]%> <b><%=theUser.username%></b></div><br />
    <ul>
    <%if(theUser.groupID==1){%><li><a href="admin.asp"><%=lang["administration"]%></a></li><%}%>
    <%if(theUser.rights["post"]>1){%><li><a href="article.asp?act=new"><%=lang["new_article"]%></a></li><%}%>
    <li><a href="user.asp?act=edit&amp;id=<%=theUser.id%>"><%=lang["edit_profile"]%></a></li>
    <li><a href="login.asp?act=logout"><%=lang["logout"]%></a></li>
    </ul>
  </div>
  </div>
  <%}else{%>
  <div id="panelUser" class="panel" style="display: none">
  <h5><%=lang["user_panel"]%></h5>
  <div class="panel-content">
    <div id="loginForm">
    <form name="login" method="post" action="login.asp?act=login">
    <table cellpadding="0" cellspacing="2" width="100%">
      <tr>
        <td align="right"><%=lang["username"]%>:</td>
        <td><input name="username" type="text" size="12" maxlength="24" class="text" />
        </td>
      </tr>
      <tr>
        <td align="right"><%=lang["password"]%>:</td>
        <td><input name="password" type="password" size="12" maxlength="16" class="text" /></td>
      </tr>
      <% if(theCache.settings["enableSecurityCode"]==1){ %>
      <tr>
        <td align="right"><%=lang["scode"]%>:</td>
        <td><input name="scode" size="4" maxlength="4" type="text" class="text" />
        <img src="scode.asp" alt="<%=lang["scode"]%>" />
        </td>
      </tr>
      <% } %>
      <tr>
        <td align="center">
        <%if(theCache.settings["enableRegister"]==1){%>
        <a href="register.asp" style="text-decoration: underline; color: #666666;"><%=lang["reg_now"]%></a>
        <%}%>
        </td>
        <td>
        <input name="Login" type="submit" value="  <%=lang["login"]%>  " class="button" />
        </td>
      </tr>
    </table>
    </form>
    </div>
  </div>
  </div>
  <%}%>

  <div id="panelCategory" class="panel">
  <h5><%=lang["categories"]%></h5>
  <div class="panel-content">
  <ul>
  <li><a href="default.asp"><b><%=lang["index"]%></b></a></li>
  <%for(var i=0;i<theCache.categories.length;i++){
    with(theCache.categories[i]){
      if(!hidden||(hidden&&theUser.rights["view"]>1)){
      %>
    <li><a href="default.asp?cat=<%=id%>"><%=func.HTMLEncodeLite(name)%></a> [<%=articleCount%>] <a href="feed.asp?cat=<%=id%>" title="<%=func.HTMLEncodeLite(name)%> <%=lang["rss_feed"]%>" target="_blank"><img src="<%=theCache.settings["imageFolder"]%>/rss.png" class="meta-button" alt="<%=func.HTMLEncodeLite(name)%> <%=lang["rss_feed"]%>" /></a><%if(locked){%><img src="<%=theCache.settings["imageFolder"]%>/icon_lock.gif" alt="<%=lang["locked"]%>" /><%}%>
    </li>
      <%
      }
    }
  }%>
  </ul>
  </div>
  </div>

  <div id="panelCalendar" class="panel">
  <h5><%=lang["calendar"]%></h5>
  <%=theCache.calendarHTML%>
  </div>

  <div id="panelArticle" class="panel">
  <h5><%=lang["recent_articles"]%></h5>
  <div class="panel-content">
  <ul>
  <%var j=0;
    for(var i=0;i<theCache.recentArticles.length&&j<theCache.settings["recentArticleList"];i++){
    with(theCache.recentArticles[i]){
      var objArticle=new Object();
      objArticle.mode=theCache.recentArticles[i].log_mode;
      objArticle.authorID=theCache.recentArticles[i].log_authorid;
      objArticle.category=theCache.getCategoryByID(theCache.recentArticles[i].log_catid);
      if(theUser.checkViewPermission(objArticle)){
        j++;
      %>
    <li><a href="article.asp?id=<%=log_id%>" title="<%=func.HTMLEncode(log_title)%>"><%=func.HTMLEncode(func.cutString(log_title,28))%></a></li>
      <%
      }
    }
  }%>
  </ul>
  </div>
  </div>

  <div id="panelComment" class="panel">
  <h5><%=lang["recent_comments"]%></h5>
  <div class="panel-content">
  <ul>
  <%var j=0;
    for(var i=0;i<theCache.recentComments.length&&j<theCache.settings["recentCommentList"];i++){
    with(theCache.recentComments[i]){
      if(log_mode==1&&(hidden||cat_hidden)&&theUser.rights["view"]>1||
         log_mode==1&&!hidden&&!cat_hidden&&theUser.rights["view"]>0||
         log_mode==2&&!hidden&&!cat_hidden&&theUser.loggedIn&&theUser.rights["view"]>0||
         log_mode==3&&theUser.loggedIn&&theUser.rights["view"]>1||
         log_mode==4&&theUser.loggedIn&&theUser.rights["view"]>2
         ){
        j++;
      %>
    <li><a href="article.asp?id=<%=log_id%>#comment<%=id%>" title="<%=author+" ["+func.HTMLEncode(log_title)+"]: \n"+func.HTMLEncodeLite(func.cutString(func.trimUBB(content),300))%>"><%=func.HTMLEncodeLite(func.cutString(func.trimUBB(content),24))%></a></li>
      <%
      }else{
        j++;
      %>
    <li><a href="article.asp?id=<%=log_id%>#comment<%=id%>" title="<%=lang["hidden"]%>"><%=content.replace(/./g,"*").substr(0,24)%></a></li>
      <%
      }
    }
  }%>
  </ul>
  </div>
  </div>

  <div id="panelSearch" class="panel">
  <h5><%=lang["search"]%></h5>
  <div class="panel-content">
		<form name="searchForm" method="post" action="" onsubmit="return doSearch();">
		<input name="q" type="text" id="q" class="text search-field" />
		<select name="searchType">
			<option value="articles"><%=lang["articles"]%></option>
			<option value="comments"><%=lang["comments"]%></option>
			<option value="guestbook"><%=lang["guestbook"]%></option>
			<option value="trackbacks"><%=lang["trackbacks"]%></option>
		</select>
		<input name="submit" type="submit" id="submit" value=" <%=lang["search"]%> " class="button" />
		</form>
  </div>
  </div>

  <div id="panelStats" class="panel">
  <h5><%=lang["stats"]%></h5>
  <div class="panel-content">
    <%=lang["articles"]%>: <%=theCache.settings["counterArticle"]%><br />
    <a href="comment.asp"><%=lang["comments"]%>: <%=theCache.settings["counterComment"]%></a><br />
    <a href="trackback.asp?act=list"><%=lang["trackbacks"]%>: <%=theCache.settings["counterTrackback"]%></a><br />
    <a href="user.asp"><%=lang["reg_users"]%>:  <%=theCache.settings["counterUser"]%></a><br />
    <%if(theUser.groupID==1){%><a href="stats.asp" target="_blank"><%}%><%=lang["visitors"]%>:  <%=theCache.settings["counterVisitor"]%><%if(theUser.groupID==1){%></a><%}%><br />
    <%=lang["online_user"]%>: <%=Application(lbsNamespace+"userOnline")%><br />
    <br />
    <a href="feed.asp" title="<%=lang["articles"]%><%=lang["rss_feed"]%>" target="_blank"><img src="<%=theCache.settings["imageFolder"]%>/rss_article.png" class="meta-button" alt="<%=lang["articles"]%><%=lang["rss_feed"]%>" /></a><br />
    <a href="feed.asp?selected=true" title="<%=lang["selected"]%><%=lang["rss_feed"]%>" target="_blank"><img src="<%=theCache.settings["imageFolder"]%>/rss_selected.png" class="meta-button" alt="<%=lang["selected"]%><%=lang["rss_feed"]%>" /></a><br />
    <a href="feed.asp?q=comment" title="<%=lang["comments"]%><%=lang["rss_feed"]%>" target="_blank"><img src="<%=theCache.settings["imageFolder"]%>/rss_comment.png" class="meta-button" alt="<%=lang["comments"]%><%=lang["rss_feed"]%>" /></a><br />
    <a href="http://www.unicode.org/" title="Unicode.org" target="_blank"><img src="<%=theCache.settings["imageFolder"]%>/utf8.png" class="meta-button" alt="Unicode Encoding" /></a><br />
    <a href="http://creativecommons.org/licenses/by-nc-sa/1.0/" title="Creative Commons Licensed" target="_blank"><img src="<%=theCache.settings["imageFolder"]%>/cc.png" class="meta-button" alt="Creative Commons Licensed" /></a><br />
    <a href="http://www.voidland.com/" title="Powered by LBS" target="_blank"><img src="<%=theCache.settings["imageFolder"]%>/lbs.png" class="meta-button" alt="Powered by LBS" /></a><br />
  </div>
  </div>

  <div id="panelLinks" class="panel">
  <h5><%=lang["links"]%></h5>
  <div class="panel-content">
    <%=theCache.settings["links"]%>
  </div>
  </div>

</div>
</div>
  <%
}

// Message Box while redirect after operation //////////////////////////////////////
function redirectMessage(strTitle, strContent, strRediret, targetURL, bAuto, strStyle){
  if(strStyle==undefined){ strStyle="messagebox" }
  %>
<div id="mainWrapper">
<center>
<div class="<%=strStyle%>">
  <div class="<%=strStyle%>-title"><%=strTitle%></div>
  <div class="<%=strStyle%>-content">
    <%=strContent%>
  </div>
  <div class="<%=strStyle%>-bottom"><a href="<%=targetURL%>"><%=strRediret%></a></div>
  <% if(bAuto){ %><meta http-equiv="refresh" content="3;url=<%=targetURL%>" /><% } %>
</div>
</center>
</div>
  <%
}

// Comment Box //////////////////////////////////////////////////////////////
function commentForm(strTitle,strActionURL,strContent,strUBBFlags,bHidden,strReply,bShowReplyArea){
  if(!strContent) strContent="";
  if(!strUBBFlags) strUBBFlags="110011";
  if(!bHidden) bHidden=false;
%>
<div id="commentForm">
<script type="text/javascript" language="javascript" src="messageform.js"></script>
<form name="inputform" method="post" action="<%=strActionURL%>">
<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" class="formbox-comment">
  <tr>
    <td colspan="2" class="formbox-comment-title"><%=func.HTMLEncodeLite(strTitle)%></td>
  </tr>
  <tr>
    <td class="formbox-comment-rowheader" width="140">
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
        <input name="e_ubb" type="checkbox" value="true"<%if(strUBBFlags.substr(0,1)=="1") write(" checked=\"checked\"")%> /> <%=lang["e_ubb"]%><br />
        <input name="e_autourl" type="checkbox" value="true"<%if(strUBBFlags.substr(1,1)=="1") write(" checked=\"checked\"")%> /> <%=lang["e_autourl"]%><br />
        <input name="e_smilies" type="checkbox" value="true"<%if(strUBBFlags.substr(4,1)=="1") write(" checked=\"checked\"")%> /> <%=lang["e_smilies"]%><br />
        <input name="comm_hidden" type="checkbox" value="true"<%if(bHidden) write(" checked=\"checked\"")%> /> <%=lang["comm_hidden"]%>
      </div>
    </td>
    <td class="formbox-comment-content" valign="top">
      <%if(!theUser.loggedIn){%>
      <div style="padding-bottom:5px">
        <%=lang["username"]%>: <input name="comm_username" type="text" size="12" maxlength="24" class="text" />&nbsp;
        <%=lang["password"]%>: <input name="comm_password" type="password" size="12" maxlength="16" class="text" />&nbsp;
        <%if(theCache.settings["enableRegister"]==1){%>
        <input name="comm_register" type="checkbox" value="true" /> <%=lang["reg_now"]%>?
        <%}%>
      </div>
      <%}%>
      <% if(theCache.settings["enableSecurityCode"]==1){ %>
      <div style="padding-bottom:5px">
        <input name="scode" size="4" maxlength="4" type="text" class="text" />
        <img src="scode.asp" alt="<%=lang["scode"]%>" />
        <span class="comment-text">* <%=lang["scode_req"]%></span>
      </div>
      <% } %>
      <%if(!bShowReplyArea){%>
      <textarea name="message" cols="64" rows="10" id="message" style="width:100%" onselect="storeCaret(this);" onclick="storeCaret(this);" onkeyup="storeCaret(this);CtrlEnter();"><%=func.HTMLEncodeLite(strContent)%></textarea>
      <%}else{%>
      <textarea name="entry" cols="64" rows="10" id="entry" style="width:100%" onkeyup="CtrlEnter();"><%=func.HTMLEncodeLite(strContent)%></textarea>
      <textarea name="message" cols="64" rows="10" id="message" style="width:100%" onselect="storeCaret(this);" onclick="storeCaret(this);" onkeyup="storeCaret(this);CtrlEnter();"><%=func.HTMLEncodeLite(strReply)%></textarea>
      <%}%>
      <%if(theUser.rights["upload"]>0&&theCache.settings["enableUpload"]==1){%>
      <div>
        <iframe frameborder="0" height="21" marginheight="0" marginwidth="0" scrolling="no" width="100%" src="upload.asp"></iframe>
      </div>
      <%}%>
      <div style="padding-top:10px">
        <input type="submit" name="btnSubmit" value=" <%=lang["post_comment"]%> " onclick="this.disabled=true;document.inputform.submit();" class="button" />&nbsp;
        <input name="Reset" type="reset" value=" <%=lang["reset"]%> " class="button" />
      </div>
    </td>
  </tr>
</table>
</form>
</div>
  <%
}

// Page footer //////////////////////////////////////////////////////////////
function pageFooter(){
  // Caculate Execution Time
  processTime = Number(new Date()) - processTime;
  %>
<div id="footer">
<div id="innerFooter">
<!-- REMOVAL OF THIS COPYRIGHT WITHOUT PERMISSION FROM THE AUTHOR WILL VIOLATE THE LICENCE YOU AGREED TO WHEN DOWNLOADING THIS SOFTWARE. -->
<!-- Copyright Start -->
Powered by <a href="http://www.voidland.com/" target="_blank">LBS Version <%=blogVersion%></a> &copy; 2003-2005 SiC/CYAN.<br />
<!-- Copyright End -->
<b><%=connBlog.queryCount%> DB Queries | Proccessed in <%=processTime%>ms</b>
</div>
</div>
    </div>
    </div>
  </body>
</html>
  <%
  connBlog.close();
  Session.CodePage = Session("OldCodePage");
  if(inDebug) showSQL();
}
%>