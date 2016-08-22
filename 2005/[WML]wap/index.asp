<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<%
Function outHTM(str)
	' 把字符串进行HTM解码,输出字符串
	Dim sTemp
	sTemp = str
	outHTM = ""
	If IsNull(sTemp) Then
	Exit Function
	End If
	sTemp = Replace(sTemp, "&#39;", "'")	'还原单引号
	sTemp = Replace(sTemp, "&", "&amp;")
	sTemp = Replace(sTemp, "<", "&lt;")
	sTemp = Replace(sTemp, ">", "&gt;")
	sTemp = Replace(sTemp, "$", "$$")
	sTemp = Replace(sTemp, "", "&nbsp;")
	sTemp = Replace(sTemp, Chr(10), "<br/>")
	outHTM = sTemp
End Function

	Sql = "SELECT * FROM guestbook ORDER BY ID DESC "
	Set Rs = Server.CreateObject("Adodb.Recordset")
	Rs.Open Sql,conn,1,3

	page = Request.QueryString("Page")
	Rs.PageSize = 6	'一页6条记录
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
<% Response.ContentType="text/vnd.wap.wml;charset=UTF-8" %>
<?xml version="1.0" encoding="utf-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
	<head>
		<meta http-equiv="Cache-Control" content="max-age=0"/>
		<meta http-equiv="Cache-Control" content="no-cache"/>
	</head>
	<card id="add" title="经典WAP留言本">
		<p>
		<a href="add.asp">发表新贴</a><br/>
<%
	For i=1 to Rs.PageSize
		If Rs.Eof Then
			Exit For
		End If
%>
			(<%=Rs("ID")%>) <%=outHTM(Rs("Title"))%><br/>
			内容：<%=outHTM(Rs("Content"))%><br/>
			留言者：<%=outHTM(Rs("Name"))%><br/>
			时间：<%=outHTM(Rs("CreatTime"))%><br/>
			回复：<% 
	if Rs("Reply")<>""then
		Response.Write outHTM(Rs("Reply"))
	else
		Response.Write "“暂无回复”"
	end if
%><br/>
			－－－－－－<br/>
<%
		Rs.MoveNext
	Next

    
    if page>=Rs.PageCount then
        'Response.Write ("[下一页]")        
    else
        Response.Write("[<a href='index.asp?Page=" & (Page+1) & "'>下一页</a>]")
    end if

    if page<=1 then
        'Response.Write ("[上一页] ")
    else        
		Response.Write("[<a href='index.asp?Page=" & (Page-1) & "'>上一页</a>]")
    end if
%>
		<br/><a href="add.asp">发表新贴</a>
		</p>
		<p>
		有任何疑问，请访问：http://www.designer5.net 或<br/>
		蓝色理想论坛WAP版：http://www.blueidea.com/bbs<br/>
		广告：蓝色理想WAP网站改版了，<a href="http://wap.blueidea.com">http://wap.blueidea.com</a><br/>
		如果您参考了此程序，有自己的WAP站点，请做上http://wap.blueidea.com的连接
		</p>
	</card>
</wml>








