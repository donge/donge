<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/bgsub.asp"-->
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then response.redirect "default.asp"
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="css/css.css">
<title>����칫ϵͳ</title>
</head>
<body bgcolor="#eeeeee" topmargin="5" leftmargin="5">
<%
call bghead()
%>
<center><b>����ͨ��</b>&nbsp;&nbsp;&nbsp;&nbsp;"<font color=red>*</font>"�ŵı�ʾ������д</center>
<%
call bgmid()
%>
<center>
<%
if request("submit")="����" then
title=request("title")
content=request("content")
set conn=opendb("oabusy","conn","accessdsn")
sql = "Insert Into newnotice (title,content) Values( "
sql = sql & SqlStr(title) & ", "
sql = sql & SqlStr(content) & ")"
conn.Execute sql
'���Ƿ񿴹�ͨ���Ϊ"no"
set conn=opendb("oabusy","conn","accessdsn")
sql = "update userinf set seenotice='no'"
conn.Execute sql
%>
<br><br>
<font color=red>��ͨ�淢���ɹ���</font>
<%
else
%>

<script Language="JavaScript">
 function maxlength(str,minl,maxl) {
    if(str.length <= maxl && str.length >= minl){return true;}else{return false;}
                                    }

 function form_check(){
   var l1=maxlength(document.form2.title.value,1,50);
   if(!l1){window.alert("����ĳ��ȴ���1λС��50λ");document.form2.title.focus();return (false);}

                    }

</script>


<br>

<form method=post name=form2 action="newnotice.asp" onsubmit="return form_check();">
<table border=1>
<tr>
<td>
ͨ����⣺<input type=text name="title" size=50><font color=red>*</font>
</td>
</tr>
<tr>
<td>
<center>ͨ������</center><textarea rows="9" name="content" cols="60"></textarea>
</td>
</tr>
</table>
<br>
<input type="submit" name="submit" value="����">
</form>
<%
end if
%>
</center>
<%
call bgback()
%>

</body>
</html>