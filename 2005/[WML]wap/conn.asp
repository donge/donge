<%
	Dim Conn, StrSQL
	StrSQL = "provider=microsoft.jet.oledb.4.0;" & "data source = " & server.mappath("d5s.mdb")
	set Conn = Server.Createobject("Adodb.Connection")
	Conn.open StrSQL
%>