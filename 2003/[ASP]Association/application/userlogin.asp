<!--#include file="Conn.asp"-->
<%
'********************************************************
'�û���¼�ɹ�����
'*******************************************************
Sub UserEnter(userid,flag)
  dim connEnter
  dim strSQL
    
  if trim(userid)="" then
   exit sub
  end if 
  
'��Ա��¼������  
  if flag="1" then
	  session("UserID")=trim(userid)
	  
      '���û�������ȡ�û���Ϣ
	  set rec=server.createobject("adodb.recordset")
	  strsql="select * from userinfo where txtId='" & userid & "'"
	  rec.open strsql,conn,1,1
	  
	  if not rec.eof then
	  '�û���Ϣ��ȡ
	   session("txtLevel")=rec("txtLevel")
	   session("userlogin")="ok"
	   rec.close
	   set rec=nothing
	  end if 
	  
  end if
END Sub
'******************
'����û��ʺ��Ƿ��Ѿ���ͨ
'******************
Function CheckUserIdBegin(Uid)

	set rsUser=server.CreateObject("ADODB.recordset")
	strSQL="select Flag from Userinfo where txtId='"&Uid&"'"
	rsUser.Open strSQL,conn,1,1
	
	CheckUserIdBegin=rsUser("Flag")
   	rsUser.Close
 
End Function

userid=trim(Request("userid"))
password=trim(request("password"))

'�жϽ��ܵ��ʺ�\�����Ƿ����Ҫ��
if userid="" then 
  Response.Write "<script language=JavaScript>{window.alert('��¼�ʺŲ���Ϊ��!');window.history.go(-1);}</script>"
end if
if instr(1,userid,",")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('��¼�ʺŲ��ð�������!');window.history.go(-1);}</script>"
end if
if instr(1,userid,"'")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('��¼�ʺŲ��ð���������!');window.history.go(-1);}</script>"
end if
if instr(1,password,",")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('��¼�ʺŲ��ð�������!');window.history.go(-1);}</script>"
end if
if instr(1,password,"'")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('��¼�ʺŲ��ð���������!');window.history.go(-1);}</script>"
end if
if instr(1,password,"*")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('��¼�ʺŲ��ð���*!');window.history.go(-1);}</script>"
end if
if instr(1,password,"$")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('��¼�ʺŲ��ð���$!');window.history.go(-1);}</script>"
end if


'�ж��ʺż������Ƿ���ȷ 
 set recCheckUser=server.CreateObject("ADODB.recordset")
 uid=trim(Request("userid"))
 upwd=trim(Request("password"))
 strSQL="select * from userinfo where txtId='" & uid & "' and txtPass='" & upwd & "'"
 recCheckUser.Open  strSQL,conn
 
  if not recCheckUser.EOF then
 	'����û��ʺż�������ȷ
 	
 	'����û��ʺ��Ƿ����ͨ��������
 	If CheckUserIdBegin(Uid)=0 Then
 		Response.Write "<script language=JavaScript>{window.alert('�˻�Ա�ʺ���δͨ����֤����ȷ�����Ѿ����ɻ�ѣ����ǣ��뾡����������ϵ!');window.history.go(-1);}</script>"
   		response.end
    End If
   	
   	'�û�����
   	call UserEnter(uid,1)
	Response.Write "<script language=JavaScript>{window.alert('��¼�ɹ�!');window.location.href='default.asp';}</script>"
 	Response.End
 else
 	'�û��ʺż����벻��ȷ
  	recCheckUser.Close 
  	set recCheckUser=nothing
  	set conn=nothing
	Response.Write "<script language=JavaScript>{window.alert('��������ʺż������������������!');window.history.go(-1);}</script>"
 end if 

%>
