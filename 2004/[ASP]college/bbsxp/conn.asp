<%@ LANGUAGE=VBScript CodePage=936%>
<%Response.Buffer=True%>
<%
IsSqlDataBase=0      '定义数据库类别，0为Access数据库，1为SQL数据库
CacheName = "bbsxp"  '定义论坛缓存名称，如果一个站点有多个论坛请更改成不同名称
If IsSqlDataBase=0 Then
'''''''''''''''''''''''''''''' Access数据库 '''''''''''''''''''''''''''''''''''''''''''''''''''''''''
datapath    ="database/"      '数据库目录的相对路径
datafile    ="bbsxp.mdb"      '数据库的文件名
Connstr="DBQ="&server.mappath(""&datapath&""&datafile&"")&";DRIVER={Microsoft Access Driver (*.mdb)};"
SqlNowString="Now()"
SqlChar="'"
ver="4.11"
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Else
'''''''''''''''''''''''''''''' SQL数据库 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
SqlLocalName   ="(local)"     '连接IP  [ 本地用 (local) 外地用IP ]
SqlUsername    ="sa"          '用户名
SqlPassword    ="1"           '用户密码
SqlDatabaseName="bbsxp"       '数据库名
ConnStr = "Provider=Sqloledb; User ID=" & SqlUsername & "; Password=" & SqlPassword & "; Initial Catalog = " & SqlDatabaseName & "; Data Source=" & SqlLocalName & ";"
SqlNowString="GetDate()"
ver="4.11 SQL"
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
End If
%>