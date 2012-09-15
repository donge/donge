<%@LANGUAGE="JSCRIPT" CODEPAGE="65001"%>
<%
Response.Buffer=true;
Session.Timeout=30;

////// Configuration Section ///////////////////////////////

var blogVersion="2.0.304"

// Main Database - Modify the folder and file name to make it safe
var blogDB="data/blog_1116.mdb";
// IP Database - Leave blank to disable IP database query support
var ipDB="";
// GuestBook Database - Leave blank to disable Guestbook Module
var gbookDB="data/gbook_1116.mdb";

// Define Cookie,Application Namespace
// Modify this if you have multiple copies of ASP application on the server
var lbsNamespace="lbs_topcoder";

// Define the code which is used to trigger cache cleaning
// Use "?cleancache=%YOUR CODE HERE%" to trigger
// Modify this to prevent other people clean your cache
var cacheCleanCode="doit";

// Whether Check IP
// Modify this if you have a dynamic IP (Set this to false may create security flaws)
var bCheckIP=true;

//The Codepage and encoding settings
var globalCodePage = 65001;
var globalEncoding ="utf-8"; //Used for all content-type tag encoding parameter
var altCodePage = 936;
var altCodePageName = "gbk"; //Only used when specified in query string parameter

var siteClosedMessage="<div style=\"font-family: Tahoma; font-size: 12px;\" align=\"center\"><br /><b>Site Maintenance</b><br />Please Come Back Later...</div>";

var siteBannedMessage="<div style=\"font-family: Tahoma; font-size: 12px; font-weight: bold; color:red;\" align=\"center\"><br /><b>You have been Banned</b><br />Don't Come Back Any More...</div>";


/////// Global variables ////////////////////////////////////
var strUA=String(Request.ServerVariables("HTTP_USER_AGENT"));
var strReferer=String(Request.ServerVariables("HTTP_REFERER")).replace(/\\/g,"/");
if(strUA=="undefined") strUA="";
if(strReferer=="undefined") strReferer="";

////// Encoding Process /////////////////////////////////////
Session("OldCodePage") = Session.CodePage;
Session.CodePage = globalCodePage;
// Codepage work around for Trackback using other encoding
if(Request.QueryString("codepage")==altCodePageName){
	Session.CodePage = altCodePage;
}

// Site Closed
var requestURL=String(Request.ServerVariables("URL")).toLowerCase();
if(Application(lbsNamespace+"siteClosed")==true && requestURL.indexOf("login.asp")<0 && requestURL.indexOf("admin.asp")<0){
	Response.Write(siteClosedMessage);
  Session.CodePage = Session("OldCodePage");
	Response.End;
}


/////// Debug Functions //////////////////////////////////////

// Simplified Response.Write Output
function write(str)
{
  Response.Write(str);
}

// Debug Output
function debug(obj)
{
  write("<div style='color:#003399; border: solid 1px #003399; background: #EEF7FF; margin: 1px; font-size: 12px; padding: 2px;'>");
  if(obj&&obj.constructor){
    write("<b>"+String(obj.constructor).match(/function (\w+)\(/)[1]+((obj.constructor==String||obj.constructor==Array)?"["+obj.length+"]":"")+":</b> ");
  }
  write(obj);
  write("</div>");
}

// SQL Debug Output
function showSQL(){
  write("<div style='margin: 10px;width: 100%'><div><table style='background: #CCCCCC; font-size: 12px;' width='100%' cellpadding='3' cellspacing='1'>");
  write("<tr><th>SQL: "+connBlog.queryCount+" queries</th><th>Return</th><th>Total</th></tr>");
  for(var i=0;i<connBlog.debugData.length;i++){
    write("<tr style='background:#FCFCFC'><td>"+Server.HTMLEncode(connBlog.debugData[i][0])+"</td><td>"+connBlog.debugData[i][1]+"</td><td>"+connBlog.debugData[i][2]+"</td></tr>")
  }
  write("</table></div></div>");
}

// Fatal Error Output
function errorMessage(err)
{
  write("<div style='color:#990000; border: solid 1px #CC0000; background: #FFEEDD; margin: 1px; font-size: 12px;'>");
  if(err.constructor==Error){
    write("<div style='color:#FFFFFF; padding: 2px; background: #990000;'>Error Code " + String(err.number & 0xFFFF) + "</div><div style='padding: 2px;'>"+err.description);
  }else{
    write("<div style='padding: 2px;'>"+err);
  }
  write("</div></div>");
  showSQL();
  Response.End();
}

////// Initialization //////////////////////////////////////

var processTime=Number(new Date()); // Start a Timer

var inLBS=true; // Set a flag to avoid direct page execution
var inDebug=false; // Set a flag to use debug mode

var lang=new Array(); // Create the language array

// Load General Classes & Language File
%>
<!--#include file="lang/blog.asp"-->
<!--#include file="class/functions.asp"-->
<!--#include file="class/dbconn.asp"-->
<!--#include file="class/cache.asp"-->
<!--#include file="class/user.asp"-->
<%
// Since the page process order is a little odd in ASP with JScript,
// I have to use this stupid method to load the language strings
getLanguageArray(lang);

// Initialize Function Wrapper
var func=new lbsFunc();

// Get Request Data (QueryString, Form)
var input=func.getInput();

// Initialize DB Connection
var connBlog=new DBConn(blogDB);
connBlog.open();

// Load caches - Not cached in debug mode
var theCache=new lbsCache();
if(input["cleancache"]==cacheCleanCode)theCache.cleanAll();
theCache.load();

// Create an user object
var theUser=new lbsUser();
theUser.checkCookies();
theUser.getUserRights();

// Visitor Record /////////////////////////////////////////////
if(theCache.settings["enableVisitorRecord"]==1&&!Session("Recorded")){
  theUser.recordVisitor();
  Session("Recorded")=true;
}

// Online User Counter ////////////////////////////////////////
if(Application(lbsNamespace+"userOnlineCounter")!=undefined){
  if(Number(new Date())-Application(lbsNamespace+"userOnlineCountTime")>60*1000){
    Application.Lock();
    Application(lbsNamespace+"userOnline")=Application(lbsNamespace+"userOnlineCounter");
    Application(lbsNamespace+"userOnlineCounter")=1;
    Application(lbsNamespace+"userOnlineKey")=func.randomStr(2);
    Application(lbsNamespace+"userOnlineCountTime")=Number(new Date());
    Application.Unlock();
  }else{
    if(Session("userOnlineKey")!=Application(lbsNamespace+"userOnlineKey")){
      Application.Lock();
      Application(lbsNamespace+"userOnlineCounter")++;
      Application.Unlock();
      Session("userOnlineKey")=Application(lbsNamespace+"userOnlineKey");
    }
  }
}else{
  Application.Lock();
  Application(lbsNamespace+"userOnline")=1;
  Application(lbsNamespace+"userOnlineCounter")=1;
  Application(lbsNamespace+"userOnlineKey")=func.randomStr(2);
  Application(lbsNamespace+"userOnlineCountTime")=Number(new Date());
  Application.Unlock();
}
%>