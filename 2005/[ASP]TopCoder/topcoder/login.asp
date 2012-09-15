<!---#include file="_common.asp"-->
<!---#include file="global.asp"-->
<!---#include file="source/src_login.asp"-->
<%
//====== Login PAGE OUTPUT ===================================
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-02-26 23:57:15
//============================================================

function outputLoginForm(){
  %>
<table width="500px" align="center" cellspacing="1" class="formbox">
  <form name="Login" method="post" action="?act=login">
  <tr>
    <td class="formbox-title" colspan="2"><%=lang["login"]%></td>
  </tr>
  <tr>
    <td class="formbox-rowheader"><%=lang["username"]%>:</td>
    <td class="formbox-content"><input name="username" type="text" id="username" size="24" maxlength="24" class="text" />
    </td>
  </tr>
  <tr>
    <td class="formbox-rowheader"><%=lang["password"]%>:</td>
    <td class="formbox-content"><input name="password" type="password" id="password" size="24" maxlength="16" class="text" /></td>
  </tr>
  <% if(theCache.settings["enableSecurityCode"]==1){ %>
  <tr>
    <td class="formbox-rowheader"><%=lang["scode"]%>:</td>
    <td class="formbox-content"><input name="scode" size="4" maxlength="4" type="text" id="scode" class="text" />
      <img src="scode.asp" />
    </td>
  </tr>
  <% } %>
  <tr>
    <td class="formbox-rowheader" valign="top"><%=lang["auto_login"]%>:</td>
    <td class="formbox-content">
      <input type="radio" name="CookiesDay" value="1" checked /> <%=lang["disabled"]%>
      <br><input type="radio" name="CookiesDay" value="30" /> 1 <%=lang["month"]%>
      <br><input type="radio" name="CookiesDay" value="365" /> 1 <%=lang["year"]%>
    </td>
  </tr>
  <tr>
    <td class="formbox-content"></td>
    <td class="formbox-content">
    <input name="Login" type="submit" id="agree" value="   <%=lang["login"]%>   " class="button" />
    &nbsp; <input name="Register" type="button" id="Register" onclick="javascript:document.location.href='register.asp';" value=" <%=lang["register"]%> " class="button" />
    </td>
  </tr></form>
</table>
  <%
}
%>