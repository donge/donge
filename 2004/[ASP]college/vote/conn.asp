<%
dim db,conn,stime
db="db.mdb"
set conn=server.createobject("adodb.connection")
conn.open "provider=microsoft.jet.oledb.4.0;data source="& server.mappath(db)

'定义关闭数据库
function closedb
conn.close
set conn=nothing
end function

'定义过滤sql字符
function killbad(strchar)
if strchar="" then
killbad=""
else
killbad=replace(strchar,"?","？")
killbad=replace(strchar,"*","＊")
killbad=replace(strchar,"'","‘")
killbad=replace(strchar,";","；")
killbad=replace(strchar,":","：")
killbad=replace(strchar,".","。")
killbad=replace(strchar,"(","（")
killbad=replace(strchar,")","）")
killbad=replace(strchar,"@","＠")
killbad=replace(strchar,"%","％")
killbad=replace(strchar,"&","＆")
killbad=replace(strchar,"-","－")
killbad=replace(strchar,"<","＜")
killbad=replace(strchar,">","＞")
killbad=replace(strchar,"+","＋")
end if
end function

'定义禁止从本地提交数据
sub httpchk()
dim server1,server2
server1=cstr(request.servervariables("http_referer"))
server2=cstr(request.servervariables("server_name"))
if mid(server1,8,len(server2))<>server2 then
response.write "<script>alert('请不要从本地提交数据，谢谢合作');history.back();</script>"
response.end
end if
end sub

'定义过滤html字符
function htmlencode(hstring)
if not isnull(hstring) then
hstring=replace(hstring,"<","&lt;")
hstring=replace(hstring,">","&gt;")
hstring=replace(hstring,chr(32),"&nbsp;")
hstring=replace(hstring,chr(34),"&quot;")
hstring=replace(hstring,chr(9),"&nbsp;")
hstring=replace(hstring,chr(39),"#&39;")
hstring=replace(hstring,chr(10)&chr(10),"<p></P>")
hstring=replace(hstring,chr(10),"<br>")
hstring=replace(hstring,chr(13),"")
htmlencode=hstring
end if
end function
%>