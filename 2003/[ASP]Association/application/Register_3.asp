<!--#include file="Conn.asp"-->
<!--#include file="CHAR.asp"-->
<%
	UserId=trim(request("txtId"))
	set rsUser=server.createobject("adodb.recordset")
	sqltext="select * from Userinfo where txtId='"&UserId&"'"
	rsUser.open sqltext,conn,3,3
	if rsUser.recordcount>0 then
		response.write "<script language=JavaScript>{window.alert('�˻�Ա�ʺ��Ѿ�ע��!');window.history.go(-1)}</script>"
	    response.end
	else
	'���һ����¼�����ݿ�
		rsUser.addnew
		'������
		rsUser("txtLevel")=Request("txtLevel")
		rsUser("txtId")=Request("txtId")
		rsUser("txtPass")=Request("txtPass")
		rsUser("txtQuestion")=Request("txtQuestion")
		rsUser("txtAnswer")=Request("txtAnswer")
		rsUser("txtSex")=Request("txtSex")
		rsUser("txtName")=Request("txtName")
		rsUser("txtClass")=Request("txtClass")
		rsUser("txtTel")=Request("txtTel")
		rsUser("txtType")=Request("txtType")
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
		rsUser("dateandtime")=now()
		rsUser("flag")=0
		
		If Request("txtPage")="" Then
			rsUser("txtPage")="δ֪"
		Else
			rsUser("txtPage")=trim(Request("txtPage"))
		End If
		
		If Request("txtTel")="" Then
			rsUser("txtTel")="δ֪"
		Else
			rsUser("txtTel")=trim(Request("txtTel"))
		End If
		
		If Request("txtOicq")="" Then
			rsUser("txtOicq")="δ֪"
		Else
			rsUser("txtOicq")=trim(Request("txtOicq"))
		End If

		rsUser.update
		rsUser.close
		conn.close
		
		response.write "<script language=JavaScript>{window.alert('ע��ɹ�!��ȴ�����ԱΪ����ͨ�˺ţ�');window.location.href='default.asp'}</script>"
	    response.end
	end if

%>
