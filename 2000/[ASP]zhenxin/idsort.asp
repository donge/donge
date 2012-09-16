<%set con = Server.CreateObject("ADODB.Connection")%>
<!-- #include file=1Qw@3E.inc -->
<%con.open
n=1
Set ts = Server.CreateObject("ADODB.Recordset")
sql="select ID,total_view,join_time,day_visit from zhenxin_user where id>0 and site_name<>'此用户已被删除！' order by day_visit DESC"
ts.open sql,con,1,2
application("num")=ts.recordcount
application("numn")=1
do while not ts.eof
te=datediff("D",ts("join_time"),date)
if te=0 then
te=ts("total_view")
else
te=(ts("total_view"))/te
end if
ts("day_visit")=te
ts("ID") = n
ts.Update
n=n+1
ts.movenext
loop
ts.close
con.close
set ts=nothing
set con=nothing
response.redirect "index.asp"
%>