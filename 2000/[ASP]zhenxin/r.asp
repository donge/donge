<%@ codepage ="936" %>
<%
fromid=request.querystring("f")
toid=request.querystring("t")
Set ts = Server.CreateObject("ADODB.Recordset")
Set con=Server.CreateObject("ADODB.Connection")%>
<!-- #include file=1Qw@3E.inc -->
<%con.Open connstr
sql="select top 2 oid,you_click,click_you,site_url from zhenxin_user where oid="&fromid&" or oid="&toid
ts.open sql,con,1,3
if ts("oid")=Cint(fromid) then
ts("you_click")=ts("you_click")+1
end if
if ts("oid")=Clng(toid) then
ts("click_you")=ts("click_you")+1
url=ts("site_url")
end if
ts.movenext
if ts("oid")=Cint(fromid) then
ts("you_click")=ts("you_click")+1
end if
if ts("oid")=Clng(toid) then
ts("click_you")=ts("click_you")+1
url=ts("site_url")
end if
ts.Update
ts.close
con.close
set ts=nothing
set con=nothing
response.redirect url%>