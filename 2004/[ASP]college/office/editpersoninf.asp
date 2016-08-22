<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/bgsub.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/checked.asp"-->
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
<center>
<table>
<tr>
<td>
<b>编辑<%=oabusyname%>的个人基本档案</b>&nbsp;&nbsp;
</td><form method="post" action="personinf.asp"><td>
<input type="submit" value="返回">
</td>
<form method="post" action="personinf.asp"><td>
<input type="submit" name="submit" value="删除" onclick="return window.confirm('你确定要删除你的个人基本档案吗？');">
</td>
</form>
</form>
</tr>
</table>
</center>
<%
call bgmid()
%>
<%
dim a(33)
'打开数据库，读出个人档案
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from personinf where username=" & sqlstr(oabusyusername)
rs.open sql,conn,1
if not rs.eof and not rs.bof then
for i=1 to 33
a(i)=rs("a" & i)
next
inputdate=rs("inputdate")
updatedate=rs("updatedate")
havephoto=rs("havephoto")
else
for i=1 to 33
a(i)=""
next
a(26)="请填清楚单位、地址、电话"
a(30)="请按亲属关系、姓名、性别、工作单位及职务、地址顺序填写"
a(32)="请按关系、姓名、地址、电话顺序填写"
inputdate=""
updatedate=""
havephoto="no"
end if
%>
<center>
<br>
<form method="post" ENCTYPE="multipart/form-data" action="editpersoninfindb.asp">
<table border="0" cellpadding="0" cellspacing="0" width="95%">
  <tr>
    <td width="33%"><b>员工编号：</b><input type=text size=10 name=a1 value="<%=a(1)%>"></td>
    <td width="33%"></td>
    <td align="right"></td>
  </tr>
</table>

<table border="0" cellpadding="0" cellspacing="0" width="95%">
    <tr>
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000" width="15%" height="20"><b>姓&nbsp;&nbsp;&nbsp;     
        名</b></td>          
      <td style="border-right: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000" width="35%"><%=oabusyname%></td>         
      <td align="center" style="border-right: 1 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000" width="15%"><b>曾     
        用 名</b></td>         
      <td style="border-right: 2 solid #000000; border-top: 2 solid #000000; border-bottom: 1 solid #000000" width="35%"><input type=text size=10 name=a2 value="<%=a(2)%>"></td>         
    </tr>         
    <tr>         
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000" height="20"><b>性&nbsp;&nbsp;&nbsp;     
        别</b></td>          
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><select name=a3 size=1><option value="男"<%=selected(a(3),"男")%>>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option><option value="女"<%=selected(a(3),"女")%>>女</option></select></td>     
      <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>民&nbsp;&nbsp;&nbsp;     
        族</b></td>     
      <td style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type=text size=10 name=a4 value="<%=a(4)%>"></td>     
    </tr>     
    <tr>     
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000" height="20"><b>所属部门</b></td>     
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><%=oabusyuserdept%></td>     
      <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>职&nbsp;&nbsp;&nbsp;     
        务</b></td>     
      <td style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><%=oabusyuserlevel%></td>     
    </tr>     
    <tr>     
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000" height="20"><b>职&nbsp;&nbsp;&nbsp;     
        称</b></td>     
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><input type=text size=10 name=a5 value="<%=a(5)%>"></td>     
      <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>出生日期</b></td>     
      <td style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type=text size=10 name=a6 value="<%=a(6)%>"></td>     
    </tr>     
    <tr>     
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000" height="20"><b>政治面貌</b></td>     
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><input type=text size=10 name=a7 value="<%=a(7)%>"></td>     
      <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>健康状况</b></td>     
      <td style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type=text size=10 name=a8 value="<%=a(8)%>"></td>     
    </tr>     
    <tr>     
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000" height="20"><b>籍&nbsp;&nbsp;&nbsp;     
        贯</b></td>          
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><input type=text size=10 name=a9 value="<%=a(9)%>"></td>          
      <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>体&nbsp;&nbsp;&nbsp;     
        重</b></td>          
      <td style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type=text size=10 name=a10 value="<%=a(10)%>"></td>          
    </tr>          
    <tr>          
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000" height="20"><b>身份证号码</b></td>          
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><input type=text size=10 name=a11 value="<%=a(11)%>"></td>          
      <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>身&nbsp;&nbsp;&nbsp;     
        高</b></td>          
      <td style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type=text size=10 name=a12 value="<%=a(12)%>"></td>          
    </tr>          
    <tr>          
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000" height="20"><b>婚姻状况</b></td>          
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><select name=a13 size=1><option value="未婚"<%=selected(a(13),"未婚")%>>未婚&nbsp;&nbsp;&nbsp;&nbsp;</option><option value="已婚"<%=selected(a(13),"已婚")%>>已婚</option></select></td>         
      <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>毕业院校</b></td>         
      <td style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type=text size=10 name=a14 value="<%=a(14)%>"></td>         
    </tr>         
    <tr>         
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000" height="20"><b>本人成分</b></td>         
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><input type=text size=10 name=a15 value="<%=a(15)%>"></td>         
      <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>专&nbsp;&nbsp;&nbsp;     
        业</b></td>         
      <td style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type=text size=10 name=a16 value="<%=a(16)%>"></td>         
    </tr>         
    <tr>         
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000" height="20"><b>工&nbsp;&nbsp;&nbsp;     
        龄</b></td>         
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><input type=text size=10 name=a17 value="<%=a(17)%>"></td>         
      <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>学&nbsp;&nbsp;&nbsp;     
        历</b></td>         
      <td style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type=text size=10 name=a18 value="<%=a(18)%>"></td>         
    </tr>         
    <tr>         
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000" height="20"><b>外语语种</b></td>         
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><input type=text size=10 name=a19 value="<%=a(19)%>"></td>         
      <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>外语水平</b></td>         
      <td style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type=text size=10 name=a20 value="<%=a(20)%>"></td>         
    </tr>         
    <tr>         
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000" height="20"><b>普通话程度</b></td>         
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><input type=text size=10 name=a21 value="<%=a(21)%>"></td>         
      <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>粤语程度</b></td>         
      <td style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type=text size=10 name=a22 value="<%=a(22)%>"></td>         
    </tr>         
    <tr>         
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000" height="20"><b>计算机能力</b></td>         
      <td style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><input type=text size=10 name=a23 value="<%=a(23)%>"></td>         
      <td align="center" style="border-right: 1 solid #000000; border-bottom: 1 solid #000000"><b>户口所在地</b></td>         
      <td style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type=text size=10 name=a24 value="<%=a(24)%>"></td>         
    </tr>         
    <tr>         
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000" height="20"><b>现  住     
        址</b></td>         
      <td colspan="3" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000" width="85%"><input type=text size=50 name=a25 value="<%=a(25)%>"></td>         
    </tr>         
    <tr>         
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000" height="20"><b>档案存放地</b></td>         
      <td colspan="3" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><input type=text size=50 name=a26  value="<%=a(26)%>"></td>         
    </tr>         
    <tr>         
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000" height="20"><b>个人专长<br>         
        以及爱好</b></td>         
      <td colspan="3" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><textarea name=a27 rows="3" cols="49"><%=a(27)%></textarea></td>         
    </tr>         
    <tr>         
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000" height="20"><b>本人曾受<br>    
        过何种奖<br>    
        励和处分</b></td>         
      <td colspan="3" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><textarea name=a28 rows="3" cols="49"><%=a(28)%></textarea></td>         
    </tr>         
    <tr>         
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000" height="20"><b>工作经历</b></td>         
      <td colspan="3" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><textarea name=a29 rows="3" cols="49"><%=a(29)%></textarea></td>         
    </tr>         
    <tr>         
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000" height="20"><b>家庭情况</b></td>         
      <td colspan="3" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><textarea name=a30 rows="3" cols="49"><%=a(30)%></textarea></td>         
    </tr>         
    <tr>         
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000" height="20"><b>本&nbsp;&nbsp;&nbsp;     
        人<br>    
        联系方式</b></td>         
      <td colspan="3" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><textarea name=a31 rows="3" cols="49"><%=a(31)%></textarea></td>         
    </tr>         
    <tr>         
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 1 solid #000000" height="20"><b>发生意外<br>    
        紧急情况<br>    
        通知何人</b></td>         
      <td colspan="3" style="border-right: 2 solid #000000; border-bottom: 1 solid #000000"><textarea name=a32 rows="3" cols="49"><%=a(32)%></textarea></td>          
    </tr>          
    <tr>          
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 2 solid #000000" height="20"><b>备&nbsp;&nbsp;&nbsp;     
        注</b></td>         
      <td colspan="3" style="border-right: 2 solid #000000; border-bottom: 2 solid #000000"><textarea name=a33 rows="3" cols="49"><%=a(33)%></textarea></td>         
    </tr>         
    <tr>        
      <td align="center" style="border-left: 2 solid #000000; border-right: 1 solid #000000; border-bottom: 2 solid #000000" height="20"><b>照&nbsp;&nbsp;&nbsp;     
        片</b></td>        
      <td colspan="3" style="border-right: 2 solid #000000; border-bottom: 2 solid #000000"><input type="file" name="file1" size=40></td>        
    </tr>       
  </table>
<table>
<tr>
<td>
<%
if inputdate="" then
%>
<input type="submit" name="submit" value="输入">
<%
else
%>
<input type="submit" name="submit" value="修改"> 
<%
end if
%>
</td>
</form>
<form method="post" action="personinf.asp"><td>
<input type="submit" name="submit" value="删除" onclick="return window.confirm('你确定要删除你的个人基本档案吗？');">
</td>
</form>
</table>
</center>
<%
call bgback()
%>
</body>
</html>










