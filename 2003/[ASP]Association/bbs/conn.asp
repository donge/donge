<%
Server.ScriptTimeout="10"
Set myconn = Server.CreateObject("ADODB.Connection")
connstr="driver={Microsoft Access Driver (*.mdb)};dbq=" & Server.MapPath("db\6k85633.mdb")
myconn.open connstr
%>