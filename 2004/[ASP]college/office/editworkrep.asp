<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/keepformat.asp"-->
<!--#include file="asp/checked.asp"-->
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then response.redirect "default.asp"
%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
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
<%
username=request("username")
superior=request("superior")
recdate=request("recdate")
id=request("id")
'�����ݿ�����û�����
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select name from userinf where username=" & sqlstr(username)
rs.open sql,conn,1
if not rs.eof and not rs.bof then stafname=rs("name")
%>
<center>
<table border="0"  cellspacing="0" cellpadding="0">
<tr>
<td><b>�༭<%=stafname%>�Ĺ����ƻ���<%=recdate%>��</b></td>
<form action="displayworkrec.asp" method=post name="form1">
<td><input type="submit" name="addworkrep" value="����"></td>
<input type="hidden" name="username" value="<%=username%>">
<input type="hidden" name="superior" value="<%=superior%>">
<input type="hidden" name="recdate" value="<%=recdate%>">
</form>
</tr>
</table>
</center>
<%
call bgmid()
%>
<%
if request("submit")="�޸�" then
title=request("title")
remark=request("remark")
finished=request("finished")
imp1=request("imp")
set conn=opendb("oabusy","conn","accessdsn")
sql = "update workrep set finished=" & sqlstr(finished) & ",imp=" & sqlstr(imp1) & ",title=" & sqlstr(title) & ",remark=" & sqlstr(remark) & " where id=" & id
conn.Execute sql
%>
<center>
<br><br><br>
<font color=red size=3>�༭�ɹ���</font>
</center>
<%
else
if request("submit")="ɾ��" then
set conn=opendb("oabusy","conn","accessdsn")
sql = "delete from workrep where id=" & id
conn.Execute sql
%>
<center>
<br><br><br>
<font color=red size=3>ɾ���ɹ���</font>
</center>
<%
else
%>
&nbsp;
<%
'�����ݿ����id=id�ļ�¼
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from workrep where id=" & id
rs.open sql,conn,1
%>
<center>
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
<form action="editworkrep.asp" method=post name="form2" onsubmit="return form_check();">
<table border="1"  cellspacing="0" cellpadding="0" width=430>
<tr>
<td width=80>��Ҫ����</td><td width=350>
<%
if (username=oabusyusername and rs("superior")="") or (rs("superior")=oabusyusername) then
%>
<input type="text" name="title" size=50 value="<%=rs("title")%>"><font color=red>*</font>
<%
else
%>
<input type="hidden" name="title" value="<%=rs("title")%>"><%=rs("title")%>
<%
end if
%>
</td>
</tr>
<tr>
<td>��ϸ˵��</td><td>
<%
if (username=oabusyusername and rs("superior")="") or (rs("superior")=oabusyusername) then
%>
<textarea rows="10" name="remark" cols="50"><%=rs("remark")%></textarea>
<%
else
%>
<input type="hidden" name="remark" value="<%=rs("remark")%>"><%=checked3(keepformat(rs("remark")))%>
<%
end if
%>
</td>
</tr>
<tr>
<td colspan=2>������:
<%
if username=oabusyusername and superior="" then
%> 
<input type="radio" name="finished" value="yes"<%=checked("yes",rs("finished"))%>>�����&nbsp;&nbsp;<input type="radio" name="finished" value="no"<%=checked("no",rs("finished"))%>>δ���<br>
<%
else
%>
<input type="hidden" name="finished" value="<%=rs("finished")%>">
<%=checked1("yes",rs("finished"))%>�����&nbsp;&nbsp;<%=checked1("no",rs("finished"))%>δ���<br>
<%
end if
%>
��Ҫ�̶�:
<%
if (username=oabusyusername and rs("superior")="") or (rs("superior")=oabusyusername) then
%> 
<input type="radio" name="imp" value="yes"<%=checked("yes",rs("imp"))%>>��Ҫ&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="imp" value="no"<%=checked("no",rs("imp"))%>>һ��
<%
else
%>
<%=checked1("yes",rs("imp"))%>��Ҫ&nbsp;&nbsp;&nbsp;&nbsp;<%=checked1("no",rs("imp"))%>һ��
<input type="hidden" name="imp" value="<%=rs("imp")%>">
<%
end if
%>
</td>
</tr>
</table>
<input type="submit" name="submit" value="�޸�" >
<%
if (username=oabusyusername and rs("superior")="") or (rs("superior")=oabusyusername) then
%>
&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="submit" value="ɾ��" onclick="return window.confirm('��ȷʵҪɾ�������ƻ���');">
<%
end if
%>
<input type="hidden" name="username" value="<%=username%>">
<input type="hidden" name="superior" value="<%=superior%>">
<input type="hidden" name="recdate" value="<%=recdate%>">
<input type="hidden" name="id" value="<%=id%>">
</form>
</center>
<%
end if
end if
%>
<%
call bgback()
%>
</body>
</html>