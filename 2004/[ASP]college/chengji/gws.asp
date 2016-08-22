<%
 dim id
 dim psw
 id=request("id")
 psw=request("psw")
  if id="admin" and psw="admin" then
   session("gws")=true
   response.redirect("stglyck.asp")
 else 
   session("gws")=false
  response.redirect("gly.asp")
 end if
%>