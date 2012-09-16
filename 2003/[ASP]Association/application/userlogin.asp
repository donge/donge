<!--#include file="Conn.asp"-->
<%
'********************************************************
'用户登录成功处理
'*******************************************************
Sub UserEnter(userid,flag)
  dim connEnter
  dim strSQL
    
  if trim(userid)="" then
   exit sub
  end if 
  
'会员登录进来啦  
  if flag="1" then
	  session("UserID")=trim(userid)
	  
      '从用户表中提取用户信息
	  set rec=server.createobject("adodb.recordset")
	  strsql="select * from userinfo where txtId='" & userid & "'"
	  rec.open strsql,conn,1,1
	  
	  if not rec.eof then
	  '用户信息提取
	   session("txtLevel")=rec("txtLevel")
	   session("userlogin")="ok"
	   rec.close
	   set rec=nothing
	  end if 
	  
  end if
END Sub
'******************
'检测用户帐号是否已经开通
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

'判断接受的帐号\密码是否符合要求
if userid="" then 
  Response.Write "<script language=JavaScript>{window.alert('登录帐号不得为空!');window.history.go(-1);}</script>"
end if
if instr(1,userid,",")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('登录帐号不得包含逗号!');window.history.go(-1);}</script>"
end if
if instr(1,userid,"'")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('登录帐号不得包含单引号!');window.history.go(-1);}</script>"
end if
if instr(1,password,",")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('登录帐号不得包含逗号!');window.history.go(-1);}</script>"
end if
if instr(1,password,"'")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('登录帐号不得包含单引号!');window.history.go(-1);}</script>"
end if
if instr(1,password,"*")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('登录帐号不得包含*!');window.history.go(-1);}</script>"
end if
if instr(1,password,"$")>=1 then 
  Response.Write "<script language=JavaScript>{window.alert('登录帐号不得包含$!');window.history.go(-1);}</script>"
end if


'判断帐号及密码是否正确 
 set recCheckUser=server.CreateObject("ADODB.recordset")
 uid=trim(Request("userid"))
 upwd=trim(Request("password"))
 strSQL="select * from userinfo where txtId='" & uid & "' and txtPass='" & upwd & "'"
 recCheckUser.Open  strSQL,conn
 
  if not recCheckUser.EOF then
 	'如果用户帐号及密码正确
 	
 	'检测用户帐号是否审核通过或被锁定
 	If CheckUserIdBegin(Uid)=0 Then
 		Response.Write "<script language=JavaScript>{window.alert('此会员帐号尚未通过验证，请确认您已经加纳会费，若是，请尽快与我们联系!');window.history.go(-1);}</script>"
   		response.end
    End If
   	
   	'用户进入
   	call UserEnter(uid,1)
	Response.Write "<script language=JavaScript>{window.alert('登录成功!');window.location.href='default.asp';}</script>"
 	Response.End
 else
 	'用户帐号及密码不正确
  	recCheckUser.Close 
  	set recCheckUser=nothing
  	set conn=nothing
	Response.Write "<script language=JavaScript>{window.alert('您输入的帐号及密码错误，请重新输入!');window.history.go(-1);}</script>"
 end if 

%>
