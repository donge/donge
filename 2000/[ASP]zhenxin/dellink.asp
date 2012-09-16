<%
if request.cookies("manage")="" then
  response.redirect "login.asp"
end if
%>
<%set con = Server.CreateObject("ADODB.Connection")%>
<!-- #include file=1Qw@3E.inc -->
<%con.open
sql="select id,site_name from zhenxin_user where oid="&request("oid")
Set Rs=con.Execute(sql)
sql="UPDATE zhenxin_user SET site_name='此用户已被删除！',id=999999 where oid="&request("oid")
con.Execute sql
rs.close
con.close
set rs=nothing
set con=nothing
response.redirect "managelink.asp"
%> 