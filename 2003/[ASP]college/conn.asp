<%@LANGUAGE="VBSCRIPT"%>
<%option explicit%>
<%
' Ԥ�ȶ��峣�õ�һЩȫ�ֱ����볣��
Dim Starttime,Endtime,Conn,Connstr,Dburl,FSYS
Dim Talesql,Talers,i,j,k,Chararr,Action,Operate,Strer,TaleChar
DIm Templates,NowTitle,Taleclass,ReAction,OnClick,ClickName
Const Pwidth="<p style='WIdth:100%'>"
Const TableH="<table width='90%' align=center cellSpacing=0 cellPadding=0>"
Const Table2H="<table width='100%' align=center cellSpacing=0 cellPadding=0>"
Const TableF="</td></tr></table>"
Const Table1H="<table width='100%'  cellSpacing=0 cellPadding=0>"
Const TaleLine="<table width='100%'  cellSpacing=0 cellPadding=0><tr><td height=1 background='image/tline.gif'></td></tr></table>"
Const Submit="<input type=submit class=go value='ȷ���ύ' name='submit'>&nbsp;&nbsp;&nbsp;&nbsp;<input type=reset class=go value='�����д'>"
' ==============================
Starttime=timer()	' ��ʼִ��ʱ��
Dburl="data/data.mdb"	' ���ݿ�·��
' ==============================
' �������ݿ�����
Set Conn = Server.CreateObject("ADODB.Connection")
Connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(Dburl)
' �����ķ��������ý��ϰ汾Access�����������������ӷ���
' Connstr="driver={Microsoft Access Driver (*.mdb)};dbq=" & Server.MapPath(Dburl)
Conn.Open Connstr
' ==============================
' ����:Closedb
' ����:��
' ����:�ر����ݿ����ӹ���
' �汾:Version 2003-9-9
' ==============================
Sub Closedb
Conn.close
Set Conn=Nothing
End Sub
%>
