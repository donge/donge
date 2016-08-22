<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<%
	Function inWML(str)
	' 把字符串存入数据库，单引号过滤，'==Chr(39)
		sTemp = Replace(str, Chr(39), "&#39;")	'单引号过滤
		inWML = sTemp
	End Function
	IF Request("Method")<>"" Then
		Name=inWML(Trim(Request("Name")))
		Title=inWML(Trim(Request("Title")))
		Content=inWML(Trim(Request("Content")))
		Method=Request("Method")
		
		Sql = "INSERT INTO guestbook(Name, Title, Content, Method) values('"&Name&"', '"&Title&"', '"&Content&"', '"&Method&"')"
		Conn.Execute Sql	
	End IF
	Response.Redirect ("index.asp")
%>