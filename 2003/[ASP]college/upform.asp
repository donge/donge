<!--#include file="conn.asp"-->
<!--#include file="inc/normalclass.asp"-->
<%
Set Templates=New Template
Call Templates.HeadHTML
Response.Write "<body style='background-image:none'>"
Set ReAction=New TaleStr
ReAction.StrIn="action{c}s{c}t{c}t"
ReAction.StrName="����"
ReAction.RequestStr()
Action=ReAction.StrOut
Set ReAction=Nothing
Response.Write "<form method='post' action='upload.asp' enctype='multipart/form-data' name='form2'>"
If Action="1" Then
	Response.WRite "<input class=input2 style='width:300px' type=file name='files'> <input class=go type=submit value='�ϴ�ͼƬ' name='type'>"
Else
	Response.WRite "<input class=input2 style='width:300px' type=file name='files'> <input class=go type=submit value='�ϴ��μ�' name='type'>"
End If
Response.Write "</form>"
Set Templates=NoThing
%>
