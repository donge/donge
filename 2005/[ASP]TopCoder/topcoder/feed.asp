<!---#include file="_common.asp"-->
<!---#include file="global.asp"-->
<!---#include file="class/ubbcode.asp"-->
<!---#include file="class/article.asp"-->
<!---#include file="source/src_feed.asp"-->
<%
//====== Feed PAGE OUTPUT ===================================
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-02-26 23:57:15
//============================================================

// Article RSS 2.0 Output
function outputRSS2(arrArticle){
  Response.ContentType="text/xml; charset="+globalEncoding;
%><?xml version="1.0" encoding="<%=globalEncoding%>"?>
<rss version="2.0" xmlns:wfw="http://wellformedweb.org/CommentAPI/">
  <channel>
    <title><![CDATA[<%=theCache.settings["blogTitle"]%>]]></title> 
    <link><%=theCache.settings["baseURL"]%></link> 
    <description><![CDATA[<%=theCache.settings["blogDescription"]%>]]></description> 
    <language><%=theCache.settings["blogLanguage"]%></language> 
    <copyright><![CDATA[Copyright <%=func.getDateTimeString("YY")%>, <%=theCache.settings["blogTitle"]%>]]></copyright> 
    <webMaster><![CDATA[<%=theCache.settings["blogWebMasterEmail"]%> (<%=theCache.settings["blogWebMaster"]%>)]]></webMaster> 
    <generator>LBS v<%=blogVersion%></generator> 
    <pubDate><%=func.getDateTimeString("w, DD m YY hh:ii:ss Z",undefined,true)%></pubDate> 
    <ttl>60</ttl>
  <%for(var i=0;i<arrArticle.length;i++){
      var tArticle=new lbsArticle();
      tArticle.fill(arrArticle[i]);
      if(tArticle.mode==1&&!tArticle.category.hidden){%>
    <item>
      <title><![CDATA[<%=func.HTMLEncode(tArticle.title)%>]]></title> 
      <link><![CDATA[<%=theCache.settings["baseURL"]+"article.asp?id="+tArticle.id%>]]></link> 
      <category><![CDATA[<%=tArticle.category.name%>]]></category> 
      <author><![CDATA[<%=tArticle.author%> <null@null.com>]]></author> 
      <pubDate><%=func.getDateTimeString("w, DD m YY hh:ii:ss Z",tArticle.postTime,true)%></pubDate> 
      <description><![CDATA[<%if(tArticle.ubbFlags=="html"){%><%=tArticle.content0%><%}else{%><%=ubb.toHTML(func.closeUBB(func.HTMLEncode(tArticle.content0)),tArticle.ubbFlags,theCache.settings["baseURL"])%><%}%>]]></description>
      <wfw:commentRss><![CDATA[<%=theCache.settings["baseURL"]+"feed.asp?q=comment&id="+tArticle.id%>]]></wfw:commentRss>
    </item>
      <%}
    }%>
  </channel>
</rss>
<%
}

// Comment RSS 2.0 Output
function outputCommentRSS2(arrComment){
  Response.ContentType="text/xml; charset="+globalEncoding;
%><?xml version="1.0" encoding="<%=globalEncoding%>"?>
<rss version="2.0">
  <channel>
    <title><![CDATA[<%=theCache.settings["blogTitle"]%>]]></title> 
    <link><%=theCache.settings["baseURL"]%></link> 
    <description><![CDATA[<%=theCache.settings["blogDescription"]%>]]></description> 
    <language><%=theCache.settings["blogLanguage"]%></language> 
    <copyright><![CDATA[Copyright <%=func.getDateTimeString("YY")%>, <%=theCache.settings["blogTitle"]%>]]></copyright> 
    <webMaster><![CDATA[<%=theCache.settings["blogWebMasterEmail"]%> (<%=theCache.settings["blogWebMaster"]%>)]]></webMaster> 
    <generator>LBS v<%=blogVersion%></generator> 
    <pubDate><%=func.getDateTimeString("w, DD m YY hh:ii:ss Z",undefined,true)%></pubDate> 
    <ttl>60</ttl>
  <%for(var i=0;i<arrComment.length;i++){
     with(arrComment[i]){
     %>
    <item>
      <title><![CDATA[<%=lang["comment_on"]%>: <%=func.HTMLEncode(log_title)%>]]></title> 
      <link><![CDATA[<%=theCache.settings["baseURL"]+"article.asp?id="+log_id+"#comment"+id%>]]></link> 
      <author><![CDATA[<%=author%> <null@null.com>]]></author> 
      <pubDate><%=func.getDateTimeString("w, DD m YY hh:ii:ss Z",postTime,true)%></pubDate> 
      <description><![CDATA[<%=ubb.toHTML(func.closeUBB(func.HTMLEncode(content)),ubbFlags,theCache.settings["baseURL"])%>]]></description>
    </item>
      <%
      }
    }%>
  </channel>
</rss>
<%
}

// Article JS Output
function outputJS(arrArticle){
%>
// LBS v<%=blogVersion%> Javascript Output
<%
  for(var i=0;i<arrArticle.length;i++){
    var tArticle=new lbsArticle();
    tArticle.fill(arrArticle[i]);
    if(tArticle.mode==1&&!tArticle.category.hidden){%>
document.write("<a href=\"<%=theCache.settings["baseURL"]+"article.asp?id="+tArticle.id%>\" title=\"[<%=tArticle.category.name%>] <%=func.HTMLEncode(tArticle.title)%> - <%=tArticle.author%>\"><%=func.HTMLEncode(tArticle.title)%></a><br />"); 
    <%}
  }
}
%>