<%
'***************PJblog2 连接数据库*******************
' PJblog2 Copyright 2005
' Update:2005-9-2
'***************************************************

'IF Not IsObject(Application(CookieName&"_blog_Conn")) Then
	    on error resume next
		Set Conn= Server.CreateObject("ADODB.Connection")
		Conn.ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(AccessFile)
		Conn.Open
		   If Err Then
			    err.Clear
			    Set Conn = Nothing
			    Response.Write("<meta http-equiv=""Content-Type"" content=""text/html; charset=UTF-8"" /><div style='font-size:12px;font-weight:bold;border:1px solid #006;padding:6px;background:#fcc'>数据库连接出错，请检查连接字串!</div>")
			    Response.End
		   end if
'Else
'	Set Conn=Application(CookieName&"_blog_Conn")
'End IF
%>