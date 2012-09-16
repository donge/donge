<!--#include file="newsconn.asp"-->
<%
dim sql
dim rs
dim listname
set rs=server.createobject("adodb.recordset")
sql="select * from news where id="&request("id")
rs.open sql,conn,1,1
%>
<html>
<head>
<title>真心链 - <%=rs("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="link.css">
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0">
<div align="center"><center>
  </center></div><div align="center"><center>
    <table width="500" border="0" cellspacing="0" cellpadding="0">
      <tr> 
        <td> 
          <div align="center"><img src="images/banner.gif" width="468" height="60"> 
          </div>
          </td>
      </tr>
    </table>
    <table border="1" width="500" cellspacing="0" cellpadding="3" bordercolorlight="#000000"
bordercolordark="#FFFFFF">
      <tr> 
        <td width="100%" bgcolor="#ffeeee"> 
          <p align="right">新闻编号：<%=rs("id")%> 加入日期：<%=rs("date")%>
        </td>
      </tr>
      <tr> 
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新闻标题：<%=rs("title")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;site_name：<%=rs("site")%><br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;site_url：<a href="<%=rs("link")%>" target="_blank"><%=rs("link")%></a><br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;站长姓名：<%=rs("name")%><br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;站长e_mail：<a href="mailto:<%=rs("mail")%>"><%=rs("mail")%></a></td>
      </tr>
      <tr> 
        <td width="100%"> 
          <table width="80%" border="0" cellspacing="0" cellpadding="0" align="center">
            <tr> 
              <td><%=rs("news")%></td>
            </tr>
          </table>
          <p align="center"><a href="javascript:self.close()">『关闭窗口』</a></p>
        </td>
      </tr>
    </table>
    <table width="500" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td> 
          <hr size="1" width="500">
          <div align="center"> Copyright&copy;2000 <a href="http://www.zhiyuanit.com/link">真心链</a> 
            All Rights Reserved<br>
            管理员：东冬 Email：<a href="mailto:ydd@elong.com">ydd@elong.com</a> Oicq：2780224 
            <p>
              <script language="JavaScript1.1" src="http://www.zhiyuanit.com/link/textlink.asp?oid=1&amp;bc=no&amp;st=1"></script>
            </p>
          </div>
        </td>
      </tr>
    </table>
    
  </center>
</div>
</body>
</html>
<%
rs.close

conn.close
set conn=nothing
%>
