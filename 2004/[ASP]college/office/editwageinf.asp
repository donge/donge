<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/opendb.asp"-->
<%
'-----------------------------------------
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then response.redirect "default.asp"
'--------------------------------------
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="css/css.css">
<script language="javascript1.2" src="js/openwin.js"></script>
<title>网络办公系统</title>
</head>
<body bgcolor="#eeeeee" topmargin="5" leftmargin="5">
<% call bghead() %>
<%
'打开数据库读出用户名
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select name from userinf where username=" & sqlstr(request("username"))
rs.open sql,conn,1
name=rs("name")
%>
<center>
<table>
<tr>
<td>
<b>编辑<%=name%>的工资信息</b>&nbsp;&nbsp;
</td>
<form method="post" action="wageinf.asp" name="form2"><td>
<input type="hidden" name="userdept" value="<%=request("userdept")%>">
<input type="hidden" name="username" value="<%=request("username")%>">
<input type="submit" value="返回">
</td>
</form>
</tr>
</table>
</center>
<%
call bgmid()
%>
<%
if request("submit")="修改" then
username=request("username")
wagelevel=request("wagelevel")
basewage=request("basewage")
stafjob=request("stafjob")
jobwage=request("jobwage")
workyear=request("workyear")
workyearwage=request("workyearwage")
rentwage=request("rentwage")
carwage=request("carwage")
prize=request("prize")
insurance=request("insurance")
tax=request("tax")
affairday=request("affairday")
affairfund=request("affairfund")
sickday=request("sickday")
sickfund=request("sickfund")
mustwage=request("mustwage")
actwage=request("actwage")
changreason=request("changreason")
actdate=request("actdate")
remark=request("remark")
updatename=oabusyname
updatedate=now()
id=request("id")
set conn=opendb("oabusy","conn","accessdsn")
sql = "Update wageinf set "
sql = sql & "wagelevel=" & SqlStr(wagelevel) & ", "
sql = sql & "basewage=" & SqlStr(basewage) & ", "
sql = sql & "stafjob=" & SqlStr(stafjob) & ", "
sql = sql & "jobwage=" & SqlStr(jobwage) & ", "
sql = sql & "workyear=" & SqlStr(workyear) & ", "
sql = sql & "workyearwage=" & SqlStr(workyearwage) & ", "
sql = sql & "rentwage=" & SqlStr(rentwage) & ", "
sql = sql & "carwage=" & SqlStr(carwage) & ", "
sql = sql & "prize=" & SqlStr(prize) & ", "
sql = sql & "insurance=" & SqlStr(insurance) & ", "
sql = sql & "tax=" & SqlStr(tax) & ", "
sql = sql & "affairday=" & SqlStr(affairday) & ", "
sql = sql & "affairfund=" & SqlStr(affairfund) & ", "
sql = sql & "sickday=" & SqlStr(sickday) & ", "
sql = sql & "sickfund=" & SqlStr(sickfund) & ", "
sql = sql & "mustwage=" & SqlStr(mustwage) & ", "
sql = sql & "actwage=" & SqlStr(actwage) & ", "
sql = sql & "changreason=" & SqlStr(changreason) & ", "
sql = sql & "actdate=" & SqlStr(actdate) & ", "
sql = sql & "remark=" & SqlStr(remark) & ", "
sql = sql & "updatename=" & SqlStr(updatename) & ", "
sql = sql & "updatedate=#" & updatedate & "# where id=" & id
conn.Execute sql
%>
<br><br>
<center><font color=red size=3>成功修改员工工资信息！</font></center>
<%
else
if request("submit")="删除" then
set conn=opendb("oabusy","conn","accessdsn")
sql="delete from wageinf where id=" & request("id")
conn.Execute sql
%>
<br><br>
<center><font color=red size=3>成功删除员工工资信息！</font></center>
<%
else
%>
<script Language="JavaScript">

 function form_check(){
   var l1=document.form1.basewage.value;
   if(l1==""){window.alert("基本工资必须填必须填写！");document.form1.basewage.focus();return (false);}

   var l2=document.form1.mustwage.value;
   if(l2==""){window.alert("应发工资必须填写！");document.form1.mustwage.focus();return (false);}
                    }



</script>
<%
'打开数据库，读出工资信息
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from wageinf where id=" & request("id")
rs.open sql,conn,1
%>
<br>
<center>
<form method="post" action="editwageinf.asp" name="form1" onsubmit="return form_check();">
<b>职员姓名:</b><%=name%>
  <table border="0" cellpadding="0" cellspacing="0" width="95%">
    <tr>
      <td height="25" align="center" width="15%" style="border-left: 2 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><b>工资级别</b></td>
      <td height="25" width="18%" style="border-left: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><input type="text" name=wagelevel size=10 value="<%=rs("wagelevel")%>"></td>
      <td height="25" align="center" width="15%" style="border-left: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><b>基本工资</b></td>
      <td height="25" width="18%" style="border-left: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><input type="text" name=basewage size=10 value="<%=rs("basewage")%>"><font color=red>*</font></td>
      <td height="25" align="center" width="15%" style="border-left: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><b>员工职务</b></td>
      <td height="25" width="19%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000"><input type="text" name=stafjob size=10 value="<%=rs("stafjob")%>">
      </td>
    </tr>
    <tr>
      <td height="25" align="center" width="15%" style="border-left: 2 solid #000000; border-bottom: 1 solid #000000"><b>职务工资</b></td>
      <td height="25" width="18%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><input type="text" name=jobwage size=10 value="<%=rs("jobwage")%>"></td>
      <td height="25" align="center" width="15%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><b>员工工龄</b></td>
      <td height="25" width="18%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><input type="text" name=workyear size=10 value="<%=rs("workyear")%>"></td>
      <td height="25" align="center" width="15%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><b>工龄工资</b></td>
      <td height="25" width="19%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type="text" name=workyearwage size=10 value="<%=rs("workyearwage")%>"></td>
    </tr>
    <tr>
      <td height="25" align="center" width="15%" style="border-left: 2 solid #000000; border-bottom: 1 solid #000000"><b>奖金金额</b></td>
      <td height="25" width="18%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><input type="text" name=prize size=10 value="<%=rs("prize")%>"></td>
      <td height="25" align="center" width="15%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><b>房租补贴</b></td>
      <td height="25" width="18%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><input type="text" name=rentwage size=10 value="<%=rs("rentwage")%>"></td>
      <td height="25" align="center" width="15%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><b>车费补贴</b></td>
      <td height="25" width="19%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type="text" name=carwage size=10 value="<%=rs("carwage")%>">
      </td>
    </tr>
    <tr>
      <td height="25" align="center" width="15%" style="border-left: 2 solid #000000; border-bottom: 1 solid #000000"><b>事假天数</b></td>
      <td height="25" width="18%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><input type="text" name=affairday size=10 value="<%=rs("affairday")%>"></td>
      <td height="25" align="center" width="15%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><b>扣事假款</b></td>
      <td height="25" width="18%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><input type="text" name=affairfund size=10 value="<%=rs("affairfund")%>"></td>
      <td height="25" align="center" width="15%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><b>病假天数</b></td>
      <td height="25" width="19%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type="text" name=sickday size=10 value="<%=rs("sickday")%>"></td>
    </tr>
    <tr>
      <td height="25" align="center" width="15%" style="border-left: 2 solid #000000; border-bottom: 1 solid #000000"><b>扣病假款</b></td>
      <td height="25" width="18%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><input type="text" name=sickfund size=10 value="<%=rs("sickfund")%>"></td>
      <td height="25" align="center" width="15%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><b>交个人税</b></td>
      <td height="25" width="18%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><input type="text" name=tax size=10 value="<%=rs("tax")%>"></td>
      <td height="25" align="center" width="15%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><b>交保险费</b></td>
      <td height="25" width="19%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type="text" name=insurance size=10 value="<%=rs("insurance")%>"></td>
    </tr>
    <tr>
      <td height="25" align="center" width="15%" style="border-left: 2 solid #000000; border-bottom: 1 solid #000000"><b>应发金额</b></td>
      <td height="25" width="18%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><input type="text" name=mustwage size=10 value="<%=rs("mustwage")%>"><font color=red>*</font></td>
      <td height="25" align="center" width="15%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><b>实发金额</b></td>
      <td height="25" width="18%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><input type="text" name=actwage size=10 value="<%=rs("actwage")%>"></td>
      <td height="25" align="center" width="15%" style="border-left: 1 solid #000000; border-bottom: 1 solid #000000"><b>执行时间</b></td>
      <td height="25" width="19%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type="text" name=actdate size=10 value="<%=rs("actdate")%>"></td>
    </tr>
    <tr>
      <td height="25" align="center" width="15%" style="border-left: 2 solid #000000; border-bottom: 1 solid #000000"><b>变动原因</b></td>
      <td colspan="5" height="25" width="85%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type="text" name=changreason size=59 value="<%=rs("changreason")%>"></td>
    </tr>
    <tr>
      <td height="25" align="center" width="15%" style="border-left: 2 solid #000000; border-bottom: 2 solid #000000"><b>备注说明</b></td>
      <td colspan="5" height="25" width="85%" style="border-left: 1 solid #000000; border-right: 2 solid #000000; border-bottom: 2 solid #000000"><input type="text" name=remark size=59 value="<%=rs("remark")%>"></td>
    </tr>
  </table>
<br>
<input type="hidden" name="userdept" value="<%=request("userdept")%>">
<input type="hidden" name="username" value="<%=request("username")%>">
<input type="hidden" name="id" value=<%=request("id")%>>
<input type="submit" name="submit" value="修改">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="submit" value="删除" onclick="return window.confirm('你确定要删除这条变动记录吗？')">
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










