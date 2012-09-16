<%@LANGUAGE="VBSCRIPT"%>
<%option explicit%>
<%
' 预先定义常用的一些全局变量与常量
Dim Starttime,Endtime,Conn,Connstr,Dburl,FSYS
Dim Talesql,Talers,i,j,k,Chararr,Action,Operate,Strer,TaleChar
DIm Templates,NowTitle,Taleclass,ReAction,OnClick,ClickName
Const Pwidth="<p style='WIdth:100%'>"
Const TableH="<table width='90%' align=center cellSpacing=0 cellPadding=0>"
Const Table2H="<table width='100%' align=center cellSpacing=0 cellPadding=0>"
Const TableF="</td></tr></table>"
Const Table1H="<table width='100%'  cellSpacing=0 cellPadding=0>"
Const TaleLine="<table width='100%'  cellSpacing=0 cellPadding=0><tr><td height=1 background='image/tline.gif'></td></tr></table>"
Const Submit="<input type=submit class=go value='确认提交' name='submit'>&nbsp;&nbsp;&nbsp;&nbsp;<input type=reset class=go value='清除重写'>"
' ==============================
Starttime=timer()	' 开始执行时间
Dburl="data/data.mdb"	' 数据库路径
' ==============================
' 开启数据库连接
Set Conn = Server.CreateObject("ADODB.Connection")
Connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(Dburl)
' 如果你的服务器采用较老版本Access驱动，请用下面连接方法
' Connstr="driver={Microsoft Access Driver (*.mdb)};dbq=" & Server.MapPath(Dburl)
Conn.Open Connstr
' ==============================
' 函数:Closedb
' 参数:无
' 描述:关闭数据库连接过程
' 版本:Version 2003-9-9
' ==============================
Sub Closedb
Conn.close
Set Conn=Nothing
End Sub
%>
