<!--#include file="asp/sqlstr.asp"-->
<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/bgsub.asp"-->
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="css/css.css">
<script language="javascript1.2" src="js/time.js"></script>
<title>����칫ϵͳ</title>
</head>
<body bgcolor="#eeeeee" topmargin="5" leftmargin="5" rightmargin="5">
<%
call bghead()
%>
<center><b>eoffice����˵��</b><br>��ϵ�ˣ��ž�ƽ&nbsp;&nbsp�绰��13828830797;&nbsp;Email:<a href="mailto:webmaster@beibang.com">webmaster@beibang.com</a></center>
<%
call bgmid()
%>
<center>
<table border="0"  cellspacing="0" cellpadding="0" width=100 height=10>
<tr>
<td></td>
</tr>
</table>
��ʹ�������û����������¼ϵͳ�������ã�<br><br>
<font color=red>Ϊ�˷��������ã�ҲΪ��ϵͳ��ȫ����û�и��������û�������</font><br><br>
��ʾ���أ�<a href="demo.zip">demo.zip</a><br><br>
<table border="1"  cellspacing="0" cellpadding="0">
<tr>
<td align=center>��  ��</td>
<td align=center>ְ  λ</td>
<td align=center>�û���</td>
<td align=center>��  �룺</td>
</tr>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where forbid='no' and userlevel<>'�ܹ�'"
rs.open sql,conn,1
while not rs.eof and not rs.bof
%>

<tr>
<td align=center><%=rs("userdept")%></td>
<td align=center><%=rs("userlevel")%></td>
<td align=center><%=rs("username")%></td>
<td align=center><%=rs("password")%></td>
</tr>
<%
rs.movenext
wend
%>
</table>
<br><br>
<table border="1"  cellspacing="0" cellpadding="0">
<tr>
<td>���ܼ��
</td>
</tr>
</table>
<table border="0"  cellspacing="0" cellpadding="0" width=100 height=10>
<tr>
<td></td>
</tr>
</table>
  <table border="3" cellpadding="0" cellspacing="0" bordercolor="#FFFF00" height="193">
    <tr>
      <td bgcolor="#FFFFFF" height="191">һ��<b>��ϵͳ��ԵĿͻ�����</b><br>
        &nbsp;&nbsp;&nbsp; 
        ��ϵͳ�������С����ҵ��Ϊ���Ա������Ч�ʡ���ʡ�ճ����ʶ���Ƶġ��ͻ�Ҫʹ�ñ�ϵͳ���������Ⱦ߱���internet������������߱���˾�ڲ����硣���е�ƽ̨ΪWindows 
        2000 Server�����ھ�������ӹ�˾�Ĺ�˾�򾭳�Ҫ��ʱ�������Ա��ϵ�͹�ͨ����ҵ�ر����á�<br>
        <br>
        ����<b>����ͨ����Ϣ</b><br>
        &nbsp;&nbsp;&nbsp; 
        ��ʹ�ñ�ϵͳ������˾ͨ�棬ÿ��Ա���ܼ�ʱ�յ��µ�ͨ�棬ϵͳ��ȷʵ��֤ÿ��Ա���������µ�ͨ�档<br>
        <br>
        ����<b>���Ĺ���</b><br>
        &nbsp;&nbsp;&nbsp; 
        ��ʹ�ñ�ϵͳ���͹�˾���Ź��ģ����缼��֪ͨ�����뵥����˾�ļ��ȡ�ϵͳ�ܼ�ʱ׼ȷ�ذѹ����͵������ߴ���<br>
        <br>
        �ġ�<b>��ԴԤԼ<br>
        </b>&nbsp;&nbsp;&nbsp; 
        ��ϵͳ��ͼ�κ��������ϵ���ʽ����ʱ��ӳ��˾����Դռ�������Ա���ܸ��ݱ�ϵͳ�ṩ������ԤԼʹ����Щ��Դ�������Դʹ��Ч�ʡ�<br>
        <br>
        �塢<b>������Դ����<br>
        </b>&nbsp;&nbsp; 
        ͨ����ϵͳ��������Ͳ��ұ���ҵ��˾����Ա���ϡ�<br>
        <br>
        ����<b>ͨѶ¼���Ͽ�<br>
        </b>&nbsp;&nbsp;&nbsp; 
        ��ϵͳ�ṩһ����˾�Ϳͻ�ͨѶ¼���Ͽ⣬Ա��������Ͳ��ұ���˾�Ϳͻ���ͨѶ���ϡ�<br>
        <br>
        �ߡ�<b>������־�͹����ճ̰���<br>
        </b>&nbsp;&nbsp;&nbsp; 
        Ա������ͨ����ϵͳ���й����ճ̰��ţ��ϼ����ſ��Բ鿴�¼��Ĺ�����չ����ͨ����ϵͳ���¼�ָ�ɹ�����<br>
        <br>
        �ˡ�<b>�û�Ȩ�޹���<br>
        &nbsp;&nbsp; </b>��ϵͳ�ṩǿ����û�Ȩ�޹������ð��п��ǵ��������úͰ�ȫ��û�д򿪴˹��ܣ�����£�</td>
    </tr>
  </table>
<br><br>
��ϵ�ˣ��ž�ƽ&nbsp;&nbsp�绰��13828830797;&nbsp;Email:<a href="mailto:webmaster@beibang.com">webmaster@beibang.com</a>
</center>
<%
call bgback()
%>
</body>
</html>