<!--#include file="conn.asp"-->
<%
	Id=request("Id")
	set rsUser=server.createobject("adodb.recordset")
	sqltext="select * from Userinfo where Id="&Id&""
	rsUser.open sqltext,conn,3,3

		rsUser("txtLevel")=Request("txtLevel")
		rsUser("flag")=1

		rsUser.update
		rsUser.close
		conn.close
		
		response.write "<script language=JavaScript>{window.alert('�˺ųɹ���ͨ��');window.location.href='manage.asp'}</script>"
	    response.end
%>
