<%
dim founduser
dim password
dim founderr
founderr=false
FoundUser=false
password=trim(Request.Form("password"))
if password="1Qw@3E" then
response.cookies("manage")=true
     response.redirect "login.asp"
else
response.redirect "login.asp"
end if
%>
