var str="";<%@ codepage ="936" %><%bc=request.querystring("bc")
if bc="no" or bc="" then
bcstr=""
else
bcstr="bgcolor="&bc&" "
end if
set fsFilesys=CreateObject("Scripting.FileSystemObject")
st=request.querystring("st")
oid=request.querystring("oid")
if oid="" or isnumeric(oid)=0 then
response.end
else
if oid<0 then response.end
end if
dim zcount,url(13),urlname(13),jiji(13),tcount(13),useroid(13),userid(13),jcount(13)
set con = Server.CreateObject("ADODB.Connection")%><!-- #include file=1Qw@3E.inc --> 
<%con.open
d=application("datat")
Set ts = Server.CreateObject("ADODB.Recordset")
if d="" or d<>date then
application("datat")=date
sql="UPDATE zhenxin_user SET today_view=0"
con.Execute sql
sql="select ID from zhenxin_user"
ts.open sql,con,1,1
application("num")=ts.recordcount
application("numn")=1
ts.close
end if
sql="select top 1 * from zhenxin_user where oid="&request("oid")
ts.open sql,con,1,3
If ts.Bof OR ts.Eof Then%> str=str+"真心链发生错误，此户名不存在。"; document.write(str); <%ts.close
con.close
set ts=nothing
set con=nothing
response.end
end if
ts("you_view")=ts("you_view")+1
ts("today_view")=ts("today_view")+1
ts("total_view")=ts("total_view")+1
ts.Update
url(10)=ts("site_url")
urlname(10)=ts("site_name")
jiji(10)=ts("site_about")
tcount(10)=ts("today_view")
userid(10)=ts("ID")
jcount(10)=ts("day_visit")
zcount=ts("total_view")
ts.close
num=application("num")
numn=application("numn")
sql="select top 10 * from zhenxin_user where you_view*10>view_you and oid<>"&oid&" and site_name<>'此用户已被删除！' order by id desc"
ts.open sql,con,1,3
numn=numn+10
do while (not ts.eof) and i<10
ts("view_you")=ts("view_you")+1
ts.Update
url(i)=ts("site_url")
urlname(i)=ts("site_name")
jiji(i)=ts("site_about")
tcount(i)=ts("today_view")
useroid(i)=ts("oid")
userid(i)=ts("ID")
jcount(i)=ts("day_visit")
i=i+1
ts.movenext
loop
ts.close
if numn>num then 
numn=1
end if
con.close
set ts=nothing
set con=nothing
application("numn")=numn
for n=0 to 10
if urlname(n)="此用户已被删除！" then 
urlname(n)="泳●装●模●特"
url(n)="http://ligangde.xiloo.com/"
jiji(n)="迷人身材让你心动！"
else
jiji(n)="排名:"&userid(n)&"|日均:"&jcount(n)&"|今日:"&tcount(n) &"|简介:"&server.htmlencode(jiji(n))&"|网址:"&url(n)
urlname(n)=server.htmlencode(urlname(n))
url(n)="http://www.zhiyuanit.com/link/r.asp?f="&oid&"&t="&useroid(n)
end if
next
if st="" then st=1
select case st:
case 2:%> <!--#include file="2.asp"--> <%case 3:%> <!--#include file="3.asp"--> 
<%case 4:%> <!--#include file="4.asp"--> <%case else:%> <!--#include file="1.asp"--> 
<%end select%> document.write(str);