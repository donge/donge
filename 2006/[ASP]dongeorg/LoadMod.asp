<!--#include file="const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="common/function.asp" -->
<!--#include file="common/library.asp" -->
<!--#include file="common/cache.asp" -->
<%
'==================================
'  插件读取页面
'    更新时间: 2005-10-24
'==================================

'读取插件模块
  Dim Getplugins,LoadMod,ModPath
  Getplugins=CheckStr(Request.QueryString("plugins"))
  If Len(Getplugins)<1 Then 
  	Response.Write("<meta http-equiv=""Content-Type"" content=""text/html; charset=UTF-8"" /><div style='font-size:12px;font-weight:bold;border:1px solid #006;padding:6px;background:#fcc'>非法参数</div>")
  Else
    log_module(1)
    LoadMod=Checkplugins
    If Not isArray(LoadMod) Then
	  	  Response.Write("<meta http-equiv=""Content-Type"" content=""text/html; charset=UTF-8"" /><div style='font-size:12px;font-weight:bold;border:1px solid #006;padding:6px;background:#c1e1f9'>无法找到相应的模块!</div>")
     Else
	      ModPath="Plugins"&"/"&LoadMod(2)&"/"&LoadMod(1)
	      TransferMod(ModPath)
    End If
  End If
  
  Function TransferMod(Path)
   on error resume Next
    Server.Transfer(Path)
   If Err Then
	  Response.Write("<meta http-equiv=""Content-Type"" content=""text/html; charset=UTF-8"" /><div style='font-size:12px;font-weight:bold;border:1px solid #006;padding:6px;background:#c1e1f9'>无法找到相应的模块!</div>")
      Err.Clear
   End If
  End Function 
  
IF IsNull(Conn)=True Then
	Conn.Close
	Set Conn=Nothing
End IF%>