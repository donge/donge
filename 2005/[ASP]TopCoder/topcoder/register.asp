<!---#include file="_common.asp"-->
<!---#include file="global.asp"-->
<!---#include file="source/src_register.asp"-->
<%

//====== Register PAGE OUTPUT ================================
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-02-26 23:57:15
//============================================================

function outputRegisterAgreement(){
%>
<center>
<div class="messagebox">
  <div class="messagebox-title"><%=lang["reg_agreement"]%></div>
  <div class="messagebox-content">
    <%=lang["reg_agreement_text"]%>
    <div align="center"><form name="aform" method="post" action="?act=agree">
      <input name="agreesubmit" type="submit" id="agree" value=" <%=lang["reg_agree"]%> " class="button" /> &nbsp;
      <input type="button" name="return" value=" <%=lang["reg_decline"]%> " onclick="javascript:history.go(-1);" class="button" />
    </form></div>
  </div>
</div>
</center>
<script type="text/javascript" language="javascript">
var secs = 9;
var wait = secs * 1000;
var agreetext=" <%=lang["reg_agree"]%> ";
document.aform.agreesubmit.value = agreetext+"(" + secs + ") ";
document.aform.agreesubmit.disabled = true;
for(i = 1; i <= secs; i++) {
  window.setTimeout("update(" + i + ")", i * 1000);
}
window.setTimeout("timer()", wait);
function update(num, value) {
  if(num == (wait/1000)) {
    document.aform.agreesubmit.value = agreetext;
  } else {
    printnr = (wait / 1000)-num;
    document.aform.agreesubmit.value = agreetext+"(" + printnr + ") ";
  }
}
function timer() {
  document.aform.agreesubmit.disabled = false;
  document.aform.agreesubmit.value = agreetext;
}
</script>
<%
}

function outputRegisterForm(){
%>
<form name="register" method="post" action="?act=save">
<table cellspacing="1" width="500px" align="center" class="formbox">
  <tr><td class="formbox-title" colspan="2"><%=lang["reg_title"]%></td></tr>
  <tr>
    <td class="formbox-rowheader"><%=lang["username"]%>:</td>
    <td class="formbox-content"><input name="username" type="text" id="username" size="24" maxlength="24" class="text" />
    <font color="#FF0000">&nbsp;*</font> <%=lang["username_req"]%></td>
  </tr>
  <tr>
    <td class="formbox-rowheader"><%=lang["password"]%>:</td>
    <td class="formbox-content"><input name="password" type="password" id="password" size="16" maxlength="16" class="text" />
    &nbsp;<font color="#FF0000">*</font> <%=lang["password_req"]%></td>
  </tr>
  <tr>
    <td class="formbox-rowheader"><%=lang["repassword"]%>:</td>
    <td class="formbox-content"><input name="repassword" type="password" id="repassword" size="16" maxlength="16" class="text" />
    &nbsp;<font color="#FF0000">*</font> <%=lang["repassword_req"]%></td>
  </tr>
  <tr>
    <td class="formbox-rowheader"><%=lang["gender"]%>:</td>
    <td class="formbox-content">
      <input name="gender" type="radio" value="0" checked="checked" /><%=lang["gender0"]%>
      <input name="gender" type="radio" value="1" /><%=lang["gender1"]%>
      <input name="gender" type="radio" value="2" /><%=lang["gender2"]%>
    </td>
  </tr>
  <tr>
    <td class="formbox-rowheader"><%=lang["email"]%>:</td>
    <td class="formbox-content"><input name="email" size="30" maxlength="50" type="text" id="email" class="text" />
    <input type="checkbox" name="hideemail" value="true" checked="checked" /> <%=lang["email_hide"]%></td>
  </tr>
  <tr>
    <td class="formbox-rowheader"><%=lang["homepage"]%>:</td>
    <td class="formbox-content"><input name="homepage" size="30" maxlength="50" type="text" id="homepage" class="text" /></td>
  </tr>
  <% if(theCache.settings["enableSecurityCode"]==1){ %>
  <tr>
    <td class="formbox-rowheader"><%=lang["scode"]%>:</td>
    <td class="formbox-content"><input name="scode" size="4" maxlength="4" type="text" id="scode" class="text" />
      <img src="scode.asp" align="absmiddle" />&nbsp;<font color="#FF0000">*</font> <%=lang["scode_req"]%>
    </td>
  </tr>
  <% } %>
  <tr>
    <td class="formbox-content"></td>
    <td class="formbox-content">
    <input name="Submit" type="submit" id="Submit" value=" <%=lang["submit"]%> " class="button" /> &nbsp;
    <input name="Reset" type="reset" id="Reset" value=" <%=lang["reset"]%> " class="button" />
    </td>
  </tr>
</table>
</form>
<%
}

%>
