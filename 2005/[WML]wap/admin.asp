<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<%
Function inWML(str)
' 把字符串存入数据库，单引号过滤
	sTemp = Replace(str, Chr(39), "&#39;")	'单引号过滤
	inWML = sTemp
End Function

	IF (Request.Form("Flag")="ReplySave") Then
		Id = Request.Form("Id")
		Name = inWml(Request.Form("Name"))
		Title = inWml(Request.Form("Title"))
		Content = inWml(Request.Form("Content"))
		Reply = inWml(Request.Form("Reply"))

		'可修改用户留言，是为了避免用户输入非法信息
		Sql = "UPDATE GuestBook SET Name = '"&Name&"', "	
		Sql = Sql + "Title = '"&Title&"', "
		Sql = Sql + "Content = '"&Content&"', "
		Sql = Sql + "Reply = '"&Reply&"' "
		Sql = Sql + " WHERE Id = "&Id
		Conn.ExeCute Sql
		Conn.Close
		Set Conn = Nothing
		Response.Redirect("admin.asp")
	End IF
	
	IF (Request.QueryString("Action")="Del") Then
		Sql = "DELETE FROM GuestBook WHERE Id=" & Request.QueryString("Id")
		Conn.Execute Sql
		Conn.Close
		Set Conn = Nothing
		Response.Redirect("admin.asp")
	End IF
%>
<%
	Set Rs=Server.CreateObject("adodb.Recordset")
	Sql = "SELECT * FROM GuestBook ORDER BY Id Desc"
	Rs.open Sql,conn,3,3
	Page = Request.QueryString("Page")
	Rs.PageSize = 10	'一页6条记录
	IF Not IsEmpty(Page) Then
		IF Not IsNumeric(Page) Then		'判断Page是否为数字
			Page=1
		Else
			Page=Cint(Page)		'转换成短整形Integer
		End IF
		IF Page > Rs.PageCount Then
			Rs.AbsolutePage = Rs.PageCount	'设置当前显示页等于最后一页
		ElseIF Page <= 0 Then
			Rs.AbsolutePage = 1		'设置当前页等于第一页
		Else
			Rs.AbsolutePage = Page	'如果大于零,显示当前页等于接收的页数
		End IF
	Else
		Rs.AbsolutePage = 1
	End IF
	Page = Rs.AbsolutePage
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>经典WAP留言本</title>
<style type="text/css">
body, td{font-size:12px;}
p{line-height:22px;}
</style>
<script language="javascript" type="text/javascript" charset="utf-8">
<!--
function check_form1()
{
	if (document.form1.Reply.value==""){
		alert("请填写回复内容！");
		document.form1.Reply.focus();
	}
	else{return true;}
	return false;
}
-->
</script>
</head>
<body>

<table width="600" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#2D96FF">
  <tr align="center" bgcolor="#D0E8FF">
    <td height="70" colspan="8"><p><strong>经典WAP留言本</strong></p>
      <p><strong>制作：</strong><strong><a href="http://www.designer5.net" target="_blank">D5S工作室</a>&nbsp;&nbsp;&nbsp;作者：yytcpt</strong></p>
    </td>
  </tr>
  <tr align="center" bgcolor="#9BCDFF">
    <td height="25"><strong>ID</strong></td>
    <td><strong>留言者</strong></td>
    <td><strong>标题</strong></td>
    <td><strong>留言内容</strong></td>
    <td><strong>提交方式</strong></td>
    <td><strong>留言时间</strong></td>
    <td width="34"><strong>回复</strong></td>
    <td><strong>删除</strong></td>
  </tr>
<%
	For i=1 to Rs.PageSize
		If Rs.Eof Then 
			Exit For
		End If 
%>
  <tr bgcolor="#C8E3FF" onMouseOver="javascript:this.bgColor='#9BCDFF';" onMouseOut="javascript:this.bgColor='#C8E3FF';">
    <td width="19" height="25" align="center"><%=Rs("Id")%></td>
    <td width="48" align="center"><%=Rs("Name")%></td>
    <td width="53" align="center"><%=Rs("Title")%></td>
    <td width="247" align="left"><%=Rs("Content")%> </td>
    <td width="53" align="center"><%=Rs("Method")%></td>
    <td width="76" align="center"><%=Rs("CreatTime")%></td>
    <td align="center"><a href="admin.asp?Action=Reply&Id=<%=Rs("Id")%>">回复</a></td>
    <td width="45" align="center"><a href="javascript:if(confirm('确实要删除吗?'))location='admin.asp?Action=Del&Id=<%=Rs("Id")%>'">删除</a></td>
  </tr>
<%
		Rs.MoveNext
	Next
%> 
<tr align="center" bgcolor="#9BCDFF">
  <td height="25" colspan="8">
    <%
	Response.Write("<form name=page method=get onsubmit=""document.location = 'admin.asp?Page='+this.page.value;return false;"">")        
    if page<=1 then
        Response.Write ("[首页] [上一页] ")
    else        
        Response.Write("[<a href=admin.asp?Page=1>首页</a>] ")
        Response.Write("[<a href=admin.asp?Page=" & (Page-1) & ">上一页</a>] ")
    end if

    if page>=Rs.PageCount then
        Response.Write ("[下一页] [尾页]")        
    else
        Response.Write("[<a href=admin.asp?Page=" & (Page+1) & ">下一页</a>] ")
        Response.Write("[<a href=admin.asp?Page=" & Rs.PageCount & ">尾页</a>]")            
    end if
    Response.Write("[页次:<font color=red>" & page & "</font>/" & Rs.PageCount)    
    Response.Write("] [共" & Rs.RecordCount & "条 <font color=red>"& Rs.PageSize & "</font>条/页]")
    Response.Write(" 转到" & "<input name=page size=4 value=" & page & ">" & "页<input type=submit value=go></form>")
%>
  </td>
  </tr>
<tr align="center">
  <td height="30" colspan="8" bgcolor="#C8E3FF"><p> 有任何疑问，请访问<a href="http://www.designer5.net">&nbsp;<strong>http://www.designer5.net</strong></a> &nbsp;或<strong><a href="http://www.blueidea.com/bbs" target="_blank">&nbsp;</a></strong><a href="http://www.blueidea.com/bbs" target="_blank"><strong>&nbsp;</strong></a><strong><a href="http://www.blueidea.com/bbs" target="_blank">蓝色理想论坛WAP版块</a></strong><br/>
  <strong>广告：</strong>蓝色理想WAP网站改版了，请使用手机访问<a href="http://wap.blueidea.com"><strong>http://wap.blueidea.com</strong></a><br/>
    如果您参考了此程序，有自己的WAP站点，请做上http://wap.blueidea.com的连接</p></td>
</tr>
</table>
<p>&nbsp;</p>
<%
	IF (Request.QueryString("Action")="Reply") Then
	Set Rs=Server.CreateObject("adodb.Recordset")
	Sql = "SELECT * FROM GuestBook WHERE Id ="&Request.QueryString("Id")
	Rs.open Sql,conn,3,3
%>
<table width="333" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#C8E3FF">
<form name="form1" method="post" action="admin.asp" onsubmit="javascript:return check_form1()">
  <tr>
    <td width="69"><strong>ID</strong></td>
    <td width="264"><%=Rs("Id")%></td>
  </tr>
  <tr>
    <td><strong>留言者</strong></td>
    <td>
      <input name="Name" type="text" value="<%=Rs("Name")%>" size="20">
    </td>
  </tr>
  <tr>
    <td><strong>标题</strong></td>
    <td><input name="Title" type="text" value="<%=Rs("Title")%>" size="20"></td>
  </tr>
  <tr>
    <td><strong>留言时间</strong></td>
    <td><%=Rs("CreatTime")%></td>
  </tr>
  <tr>
    <td><strong>留言内容</strong></td>
    <td><textarea name="Content" cols="30" rows="4"><%=Rs("Content")%></textarea></td>
  </tr>
  <tr>
    <td><strong>本站回复</strong></td>
    <td><textarea name="Reply" cols="30" rows="4"><%=Rs("Reply")%></textarea></td>
  </tr>
  <tr align="center">
    <td colspan="2"><input type="submit" name="Submit" value="提交">
      &nbsp;&nbsp;&nbsp;&nbsp;
      <input type="reset" name="Submit" value="重置">
	  <input name="Id" type="hidden" value="<%=Rs("Id")%>">
	  <input name="Flag" type="hidden" value="ReplySave">
	  </td>
    </tr>
  </form>
</table>
<%	End IF	%>
</body>
</html>
<%
	Rs.Close
	Set Rs = Nothing
%>