<%
dim db,conn,stime
db="db.mdb"
set conn=server.createobject("adodb.connection")
conn.open "provider=microsoft.jet.oledb.4.0;data source="& server.mappath(db)

'����ر����ݿ�
function closedb
conn.close
set conn=nothing
end function

'�������sql�ַ�
function killbad(strchar)
if strchar="" then
killbad=""
else
killbad=replace(strchar,"?","��")
killbad=replace(strchar,"*","��")
killbad=replace(strchar,"'","��")
killbad=replace(strchar,";","��")
killbad=replace(strchar,":","��")
killbad=replace(strchar,".","��")
killbad=replace(strchar,"(","��")
killbad=replace(strchar,")","��")
killbad=replace(strchar,"@","��")
killbad=replace(strchar,"%","��")
killbad=replace(strchar,"&","��")
killbad=replace(strchar,"-","��")
killbad=replace(strchar,"<","��")
killbad=replace(strchar,">","��")
killbad=replace(strchar,"+","��")
end if
end function

'�����ֹ�ӱ����ύ����
sub httpchk()
dim server1,server2
server1=cstr(request.servervariables("http_referer"))
server2=cstr(request.servervariables("server_name"))
if mid(server1,8,len(server2))<>server2 then
response.write "<script>alert('�벻Ҫ�ӱ����ύ���ݣ�лл����');history.back();</script>"
response.end
end if
end sub

'�������html�ַ�
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