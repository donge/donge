<!---#include file="_common.asp"-->
<!---#include file="global.asp"-->
<!---#include file="source/src_stats.asp"-->
<%
//====== Stats PAGE OUTPUT ===================================
// Copyright 2005 SiC. All Rights Reserved.
// Last Update: 2005-03-03 17:51:19
//============================================================

function outputVisitorList(arrVisitor){
%>
<div id="main-wrapper">
<div id="content" class="content-only">
<div id="innerContent">
  <div class="textbox-title"><h4><%=lang["recent_visitors"]%></h4></div>
  <div class="listbox-table">
  <table cellpadding="2" cellspacing="2" width="100%">
    <tr>
      <td class="listbox-header" width="120"><%=lang["ip"]%></td>
      <td class="listbox-header" width="100"><%=lang["browser"]%>/<%=lang["os"]%></td>
      <td class="listbox-header" width="100"><%=lang["timestamp"]%></td>
      <td class="listbox-header"><%=lang["referer"]%></td>
    </tr>
  <%for(var i=0;i<arrVisitor.length;i++){%>
    <tr>
      <td><%=arrVisitor[i]["vr_ip"]%></td>
      <td><%=arrVisitor[i]["vr_browser"]%><br /><%=arrVisitor[i]["vr_os"]%></td>
      <td><%=arrVisitor[i]["vr_time"]%></td>
      <td><a href="<%=arrVisitor[i]["vr_referer"]%>"><%=func.HTMLEncode(func.cutString(arrVisitor[i]["vr_referer"],50))%></a></td>
    </tr>
  <%}%>
  </table>
  </div>
</div>
</div>
<div class="clear"></div>
</div>
<%
}
%>
