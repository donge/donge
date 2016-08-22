<%
Set conn = Server.CreateObject("ADODB.Connection")
connstr="driver={Microsoft Access Driver (*.mdb)};pwd=gws;dbq=" & Server.MapPath("gws.mdb")
conn.open connstr
%>