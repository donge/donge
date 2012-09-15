<!---#include file="_common.asp"-->
<!---#include file="class/article.asp"-->
<!---#include file="source/src_wap.asp"-->
<%
//====== WAP PAGE OUTPUT ===================================
// Copyright 2005 Felix. All Rights Reserved.
// http://www.felixwoo.com
// Last Update: 2005-10-30 12:53:20
//==========================================================

function wapHeader(wapTitle){%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml">
<wml>
<head><meta http-equiv="Cache-Control" content="max-age=3600" /></head>
<card title="<%=func.HTMLEncode(wapTitle)%>">
<%}

// IndexPage Output
function outputIndex(){
wapHeader(func.HTMLEncode(theCache.settings["blogTitle"]));%>
<p align="center"><b>-- <%=func.HTMLEncode(theCache.settings["blogTitle"])%> --</b></p>
<p align="center"><a href="wap.asp?q=article"><%=func.HTMLEncode(lang["recent_articles"])%></a></p>
<p align="center"><a href="wap.asp?q=comment"><%=func.HTMLEncode(lang["recent_comments"])%></a></p>
<p align="center"><a href="wap.asp?q=guestbook"><%=func.HTMLEncode(lang["guestbook"])%></a></p>
<p align="center"><a href="wap.asp?q=stat"><%=func.HTMLEncode(lang["stats"])%></a></p>
<p align="center"><a href="http://www.felixwoo.com/wapindex.asp"><%=func.HTMLEncode(lang["links"])%></a></p>
<%if(!loggedin){%><p align="center"><a href="wap.asp?q=login"><%=func.HTMLEncode(lang["login"])%></a></p>
<%} else {%><p align="center"><a href="wap.asp?act=logout"><%=func.HTMLEncode(lang["logout"])%>(<%=wap_user_name%>)</a></p><%}%>
</card>
</wml>
<%
}
// Login Output
function outputLogin(){
wapHeader(func.HTMLEncode(lang["login"]));%>
<p align="center"><b>-- <%=func.HTMLEncode(theCache.settings["blogTitle"])%> --</b></p>
<p align="center">
<%if(!loggedin){%>
	<%=func.HTMLEncode(lang["username"])%>:<input emptyok="false" name="username" size="10"/><br/>
	<%=func.HTMLEncode(lang["password"])%>:<input emptyok="true" name="password" type="password" size="10"/><br/>
	<anchor><%=func.HTMLEncode(lang["login"])%><go href="wap.asp?act=login" method="post">
		<postfield name="username" value="$(username)"/>
		<postfield name="password" value="$(password)"/>
	</go>
	</anchor>
<%} else {%>
	<%=func.HTMLEncode(lang["login_as"])%><%=wap_user_name%><br/>
	<a href="wap.asp?act=logout"><%=func.HTMLEncode(lang["logout"])%></a>
<%}%>
</p>
<p align="center"><a href="wap.asp"><%=func.HTMLEncode(lang["back"])%></a></p>
</card>
</wml>
<%
}
// Post Output
function outputPost(logid,postwhat,backurl){
wapHeader(func.HTMLEncode(lang["post"]));%>
<p align="center"><b>-- <%=func.HTMLEncode(theCache.settings["blogTitle"])%> --</b></p>
<p align="center"><%if(postwhat=="article"){%><%=func.HTMLEncode(lang["category"])%>:
	<select title="<%=func.HTMLEncode(lang["select_category"])%>" name="category">
        <%for(var i=0;i<theCache.categories.length;i++){
            if(!theCache.categories[i].hidden||(theCache.categories[i].hidden&&wap_user_rights["view"]>1)){%>
          <option value="<%=theCache.categories[i].id%>"><%=theCache.categories[i].name%> [<%=theCache.categories[i].articleCount%>]</option>
        <%}}%>
	</select><br/>
	<%=func.HTMLEncode(lang["mode"])%>:
      <select title="<%=func.HTMLEncode(lang["mode"])%>" name="log_mode">
        <option value="1"><%=func.HTMLEncode(lang["public"])%></option>
        <option value="2"><%=func.HTMLEncode(lang["draft"])%></option>
        <option value="3"><%=func.HTMLEncode(lang["hidden"])%></option>
        <option value="4"><%=func.HTMLEncode(lang["private"])%></option>
      </select><br/><%}%>
	<%if(postwhat=="guestbook" || postwhat=="comment"){%><%=func.HTMLEncode(lang["comm_hidden"])%>:
	<select title="<%=func.HTMLEncode(lang["comm_hidden"])%>" name="comm_hidden">
        <option value="false"><%=func.HTMLEncode(lang["no"])%></option>
        <option value="true"><%=func.HTMLEncode(lang["yes"])%></option>
    </select><br/><%}%>
	<%if(!loggedin){%><%=func.HTMLEncode(lang["username"])%>:<input emptyok="false" name="username" size="10" /><br/><%}%>
	<%if(postwhat=="article"){%><%=func.HTMLEncode(lang["title"])%>:<input emptyok="false" name="title" size="10"/><br/><%}%>
	<%=func.HTMLEncode(lang["content"])%>:<input emptyok="false" name="content" size="10"/><br/>
	<anchor><%=func.HTMLEncode(lang["submit"])%><go href="wap.asp?act=post" method="post">
		<postfield name="logid" value="<%=logid%>"/>
		<postfield name="postwhat" value="<%=postwhat%>"/>
		<postfield name="username" value="<%=loggedin?wap_user_name:"$(username)"%>"/>
		<%if(postwhat=="guestbook" || postwhat=="comment"){%><postfield name="comm_hidden" value="$(comm_hidden)"/><%}%>
		<%if(postwhat=="article"){%><postfield name="category" value="$(category)"/><%}%>
		<%if(postwhat=="article"){%><postfield name="log_mode" value="$(log_mode)"/><%}%>
		<%if(postwhat=="article"){%><postfield name="title" value="$(title)"/><%}%>
		<postfield name="content" value="$(content)"/>
		</go>
	</anchor>
</p>
<p align="center"><a href="<%=backurl%>"><%=func.HTMLEncode(lang["back"])%></a> | <a href="wap.asp"><%=func.HTMLEncode(lang["homepage"])%></a></p>
</card>
</wml>
<%
}
// Stats Output
function outputStat(){
wapHeader(func.HTMLEncode(lang["stats"]));%>
<p align="center"><b>-- <%=func.HTMLEncode(theCache.settings["blogTitle"])%> --</b></p>
<p align="center"><%=func.HTMLEncode(lang["articles"])%>:<%=theCache.settings["counterArticle"]%></p>
<p align="center"><%=func.HTMLEncode(lang["comments"])%>:<%=theCache.settings["counterComment"]%></p>
<p align="center"><%=func.HTMLEncode(lang["trackbacks"])%>:<%=theCache.settings["counterTrackback"]%></p>
<p align="center"><%=func.HTMLEncode(lang["reg_users"])%>:<%=theCache.settings["counterUser"]%></p>
<p align="center"><%=func.HTMLEncode(lang["visitors"])%>:<%=theCache.settings["counterVisitor"]%></p>
<p align="center"><%=func.HTMLEncode(lang["online_user"])%>:<%=Application(lbsNamespace+"userOnline")%></p>
<p align="center">WAP Version:<%=wap_version%></p>
<p align="center"><a href="wap.asp"><%=func.HTMLEncode(lang["back"])%></a></p>
</card>
</wml>
<%
}
// GuestBook Output
function outputGuestBook(entries, entryCount){
wapHeader(func.HTMLEncode(lang["guestbook"]));%>
<p align="center"><b>-- <%=func.HTMLEncode(theCache.settings["blogTitle"])%> --</b></p>
<%if(enablePostComment && wap_user_rights["post"]>0){%><p align="center"><a href="wap.asp?act=showPostGuestbook"><%=func.HTMLEncode(lang["post"])%></a></p><%}%>
<%if(entryCount==0){%>
<p align="center"><%=func.HTMLEncode(lang["no_entry"])%></p>
<%} else {
	for(var i=0;i<entries.length;i++){
      with(entries[i]){%>
<%if (!hidden || wap_user_rights["view"]>2 || author==wap_user_name){%>
<p><%=(i+1) + ".<b>" + username + "</b>:" + func.trimUBB(func.HTMLEncode(content))%></p><%}else{%>
<p><%=(i+1) + ".<b>" + username + "</b>:" + func.HTMLEncode(lang["hidden_comment"])%></p><%}}}}%>
<p align="center"><a href="wap.asp"><%=func.HTMLEncode(lang["back"])%></a></p>
</card></wml>
<%
}
// Articles Output
function outputArticles(arrArticle){
wapHeader(func.HTMLEncode(lang["recent_articles"]));%>
<p align="center"><b>-- <%=func.HTMLEncode(theCache.settings["blogTitle"])%> --</b></p>
<%if(enablePostArticle && wap_user_rights["post"]>1){%><p align="center"><a href="wap.asp?act=showPostArticle"><%=func.HTMLEncode(lang["new_article"])%></a></p><%}%>
<%for(var i=0;i<arrArticle.length;i++){
      var tArticle=new lbsArticle();
      tArticle.fill(arrArticle[i]);
      if(tArticle.mode==1&&!tArticle.category.hidden||wap_user_rights["view"]>2||tArticle.author==wap_user_name){%>
<p><%=(i+1) + "." + "<a href='wap.asp?q="+tArticle.id+"'>" + func.HTMLEncode(tArticle.title)%></a> (<%=tArticle.viewCount%>,<%=tArticle.commentCount%>)</p><%} else {%>
<p><%=(i+1) + "." + func.HTMLEncode(lang["hidden"])%></p><%}}%>
<p align="center"><a href="wap.asp"><%=func.HTMLEncode(lang["back"])%></a></p>
</card></wml>
<%
}
// Article Output
function outputArticle(arrArticle,readMode){
wapHeader(func.HTMLEncode(lang["articles"]));%>
<p align="center"><b>-- <%=func.HTMLEncode(theCache.settings["blogTitle"])%> --</b></p>
<%
      var tArticle=new lbsArticle();
      tArticle.fill(arrArticle[0]);
      if(tArticle.mode==1&&!tArticle.category.hidden||wap_user_rights["view"]>2||tArticle.author==wap_user_name){%>
<p><%=func.trimUBB(func.HTMLEncode(readMode==0?tArticle.content0:tArticle.content0+tArticle.content1))%></p>
<%=((tArticle.content1=="" || readMode==1)?"":"<p align=\"center\"><a href='wap.asp?q="+tArticle.id+"&amp;p=1'>"+ lang["read_more"] +"</a></p>")%>
<%}%>
<p align="center"><a href="wap.asp?q=<%=tArticle.id%>&amp;comment=1&amp;page=1"><%=func.HTMLEncode(lang["comments"])%>(<%=tArticle.commentCount%>)</a></p>
<p align="center"><a href="wap.asp?q=article"><%=func.HTMLEncode(lang["back"])%></a> | <a href="wap.asp"><%=func.HTMLEncode(lang["homepage"])%></a></p>
</card></wml>
<%
}
// Comment Output
function outputComment(arrComment,logid,backurl,intEntryCount,intPageSize,intCurrentPage){
wapHeader(func.HTMLEncode(lang["comments"]));%>
<p align="center"><b>-- <%=func.HTMLEncode(theCache.settings["blogTitle"])%> --</b></p>
<%if(enablePostComment && wap_user_rights["post"]>0 && logid!=null){%><p align="center"><a href="wap.asp?q=<%=logid%>&amp;act=showPostComment"><%=func.HTMLEncode(lang["post_comment"])%></a></p><%}%>
<%for(var i=0;i<arrComment.length;i++){
	with(arrComment[i]){
%>
<%if (!hidden || wap_user_rights["view"]>2 || author==wap_user_name){%>
<p><%=(i+1) + ".<b>" + author + "</b>:" + func.trimUBB(func.HTMLEncode(content))%></p><%}else{%>
<p><%=(i+1) + ".<b>" + author + "</b>:" + func.HTMLEncode(lang["hidden"])%></p><%}}}%>
<%if(intEntryCount!=null && intPageSize!=null){%><p align="center"><%=generatePageLinks(intEntryCount, intPageSize, intCurrentPage, 5, "wap.asp?q="+logid+"&amp;comment=1", "")%></p><%}%>
<p align="center"><a href="<%=backurl%>"><%=func.HTMLEncode(lang["back"])%></a> | <a href="wap.asp"><%=func.HTMLEncode(lang["homepage"])%></a></p>
</card></wml>
<%
}
// Message Output
function outputMessage(message){
wapHeader(func.HTMLEncode(theCache.settings["blogTitle"]));%>
<p align="center"><b>-- <%=func.HTMLEncode(theCache.settings["blogTitle"])%> --</b></p>
<p align="center"><%=message%></p>
<p align="center"><a href="wap.asp"><%=func.HTMLEncode(lang["back"])%></a></p>
</card>
</wml>
<%
response.End();
}%>