<!--#include file="Conn.asp"-->
<!--#include file="CHAR.asp"-->
<%
	UserId=trim(request("txtId"))
	set rsUser=server.createobject("adodb.recordset")
	sqltext="select * from Userinfo where txtId='"&UserId&"'"
	rsUser.open sqltext,conn,3,3
		'必添项

	rsUser("txtSex")=Request("txtSex")
		rsUser("txtName")=Request("txtName")
		rsUser("txtClass")=Request("txtClass")
		rsUser("txtTel")=Request("txtTel")
		rsUser("txtNumber")=Request("txtNumber")
		rsUser("txtEmail")=Request("txtEmail")
		rsUser("txtDate")=Request("txtDate")
		rsUser("txtProv")=Request("txtProv")
		rsUser("txtOicq")=Request("txtOicq")
		rsUser("txtPage")=Request("txtPage")
		rsUser("txtOther")=Request("txtOther")
			rsUser("txtDesc1")=htmlencode(Request("txtDesc1"))
		rsUser("txtDesc2")=htmlencode(Request("txtDesc2"))
		rsUser("txtDesc3")=htmlencode(Request("txtDesc3"))
		rsUser("txtDesc4")=htmlencode(Request("txtDesc4"))
		rsUser("txtDesc5")=htmlencode(Request("txtDesc5"))
		
	If Request("txtPage")="" Then
			rsUser("txtPage")="未知"
		Else
			rsUser("txtPage")=trim(Request("txtPage"))
		End If
		
		If Request("txtTel")="" Then
			rsUser("txtTel")="未知"
		Else
			rsUser("txtTel")=trim(Request("txtTel"))
		End If
		
		If Request("txtOicq")="" Then
			rsUser("txtOicq")="未知"
		Else
			rsUser("txtOicq")=trim(Request("txtOicq"))
		End If

		rsUser.update
		rsUser.close
		conn.close
		
		response.write "<script language=JavaScript>{window.alert('资料修改成功！');window.location.href='default.asp'}</script>"
	    response.end


%>
