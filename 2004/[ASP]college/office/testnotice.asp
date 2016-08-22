<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/bgsub.asp"-->
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="css/css.css">
<script language="javascript1.2" src="js/time.js"></script>
<title>网络办公系统</title>
</head>
<body bgcolor="#eeeeee" topmargin="5" leftmargin="5" rightmargin="5">
<%
call bghead()
%>
<center><b>eoffice试用说明</b><br>联系人：张军平&nbsp;&nbsp电话：13828830797;&nbsp;Email:<a href="mailto:webmaster@beibang.com">webmaster@beibang.com</a></center>
<%
call bgmid()
%>
<center>
<table border="0"  cellspacing="0" cellpadding="0" width=100 height=10>
<tr>
<td></td>
</tr>
</table>
请使用下面用户名和密码登录系统进行试用：<br><br>
<font color=red>为了方便大家试用，也为了系统安全，故没有给出超级用户的密码</font><br><br>
演示下载：<a href="demo.zip">demo.zip</a><br><br>
<table border="1"  cellspacing="0" cellpadding="0">
<tr>
<td align=center>部  门</td>
<td align=center>职  位</td>
<td align=center>用户名</td>
<td align=center>密  码：</td>
</tr>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where forbid='no' and userlevel<>'总管'"
rs.open sql,conn,1
while not rs.eof and not rs.bof
%>

<tr>
<td align=center><%=rs("userdept")%></td>
<td align=center><%=rs("userlevel")%></td>
<td align=center><%=rs("username")%></td>
<td align=center><%=rs("password")%></td>
</tr>
<%
rs.movenext
wend
%>
</table>
<br><br>
<table border="1"  cellspacing="0" cellpadding="0">
<tr>
<td>功能简介
</td>
</tr>
</table>
<table border="0"  cellspacing="0" cellpadding="0" width=100 height=10>
<tr>
<td></td>
</tr>
</table>
  <table border="3" cellpadding="0" cellspacing="0" bordercolor="#FFFF00" height="193">
    <tr>
      <td bgcolor="#FFFFFF" height="191">一、<b>本系统针对的客户对象</b><br>
        &nbsp;&nbsp;&nbsp; 
        本系统是针对中小型企业，为提高员工工作效率、节省日常开资而设计的。客户要使用本系统，必须首先具备上internet网的条件，或具备公司内部网络。运行的平台为Windows 
        2000 Server。对于具有许多子公司的公司或经常要及时与出差人员联系和沟通的企业特别适用。<br>
        <br>
        二、<b>发布通告信息</b><br>
        &nbsp;&nbsp;&nbsp; 
        可使用本系统发布公司通告，每个员工能即时收到新的通告，系统能确实保证每个员工都看过新的通告。<br>
        <br>
        三、<b>公文管理</b><br>
        &nbsp;&nbsp;&nbsp; 
        可使用本系统发送公司或部门公文，比如技术通知、申请单、公司文件等。系统能及时准确地把公文送到接收者处。<br>
        <br>
        四、<b>资源预约<br>
        </b>&nbsp;&nbsp;&nbsp; 
        本系统以图形和文字相结合的形式，及时反映公司的资源占用情况，员工能根据本系统提供的资料预约使用这些资源，提高资源使用效率。<br>
        <br>
        五、<b>人力资源管理<br>
        </b>&nbsp;&nbsp; 
        通过本系统可以输入和查找本企业或公司的人员资料。<br>
        <br>
        六、<b>通讯录资料库<br>
        </b>&nbsp;&nbsp;&nbsp; 
        本系统提供一个公司和客户通讯录资料库，员工能输入和查找本公司和客户的通讯资料。<br>
        <br>
        七、<b>工作日志和工作日程安排<br>
        </b>&nbsp;&nbsp;&nbsp; 
        员工可以通过本系统进行工作日程安排，上级部门可以查看下级的工作进展，并通过本系统给下级指派工作。<br>
        <br>
        八、<b>用户权限管理<br>
        &nbsp;&nbsp; </b>本系统提供强大的用户权限管理，试用版中考虑到方便试用和安全，没有打开此功能，请见谅！</td>
    </tr>
  </table>
<br><br>
联系人：张军平&nbsp;&nbsp电话：13828830797;&nbsp;Email:<a href="mailto:webmaster@beibang.com">webmaster@beibang.com</a>
</center>
<%
call bgback()
%>
</body>
</html>