<%@ language=vbscript %>
<!--#include file="conn.asp"-->
<%

  if Session.Contents("gws")<>true then
 %>
<!--#include file="gly.asp"-->
<%  
else





Dim sColor



set rs=server.createobject("adodb.recordset")

j=request("j")
jsd=request("jsd")
myjl=request("myjl")

jlh=request("jlh")
if jlh="" then
 jlh=0
 end if
 
if jlh=1 then
sql="select * from cxb Order by xh"
elseif jlh=2 then
sql="select * from cxb Order by xm"
elseif jlh=3 then
sql="select * from cxb Order by s"
elseif jlh=4 then
sql="select * from cxb Order by zybj"
elseif jlh=5 then
sql="select * from cxb Order by csrq"
elseif jlh=6 then
sql="select * from cxb Order by jtdz"

elseif jlh=7 then
sql="select * from cxb Order by rxsj"
elseif jlh=8 then
sql="select * from cxb Order by byzs"
elseif jlh=9 then
sql="select * from cxb Order by jg"
elseif jlh=10 then
sql="select * from cxb Order by zzmm"
elseif jlh=11 then
sql="select * from cxb Order by bysj"

else
sql="select * from cxb Order by zybj"
end if



rs.open sql,conn,3,3
total=rs.recordcount
if not isnumeric(request("page")) or isempty(request("page")) then
page=1
else
page=int(abs(request("page")))
end if
if myjl=0 then
myjl=10
end if
rs.pagesize=myjl
mypagesize=rs.pagesize
if total<>0 then
rs.absolutepage=page
end if
%>











<html>
<head>
<title>成绩查询管理系统</title>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="config.css" type="text/css">


</head>
<body bgcolor="#FFFFFF" text="#000000" background="bg01.gif">
<center>





<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
    
      <div align="center"><b><font color=red face="华文行楷" size="6">学生管理窗口</font></b></div>    
      <center>

        每页显示：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <a href='index0.asp?myjl=<%=10%>'>10条</a> &nbsp;&nbsp;&nbsp;&nbsp;

        <a href='index0.asp?myjl=<%=20%>'>20条</a> &nbsp;&nbsp;&nbsp;&nbsp;
        
        <a href='index0.asp?myjl=<%=50%>'>50条</a> &nbsp;&nbsp;&nbsp;&nbsp;

        <a href='index0.asp?myjl=<%=100%>'>100条</a> &nbsp;&nbsp;&nbsp;&nbsp;
        
        <a href='index0.asp?myjl=<%=total%>'>全部</a>
</center>

      <p>
  
      <div align="center"><b><font color="#0066FF">(目前共有记录<font color=red><%=total%></font>条,欢迎你查询管理) 
      </font></b></div>
 
   
    </td>
  </tr>
</table>

  
 

<%
Response.Write("<center>")


	Response.Write("<table border=1 cellpadding=1 cellspacing=1>")
	Response.Write("<tr bgcolor=aaaaaa style='color:black;'>")
	Response.Write("<td align=center>编号</td>")
	Response.Write("<td align=center><a  href='index0.asp?jlh=1&myjl="&myjl&"'>学号</a></td>")
	Response.Write("<td align=center><a  href='index0.asp?jlh=2&myjl="&myjl&"'>姓名</a></td>")
	Response.Write("<td align=center>性别</td>")
	Response.Write("<td align=center><a  href='index0.asp?jlh=3&myjl="&myjl&"'>部门或专业</a></td>")
	Response.Write("<td align=center><a  href='index0.asp?jlh=4&myjl="&myjl&"'>班级名称</a></td>")
	Response.Write("<td align=center><a  href='index0.asp?jlh=5&myjl="&myjl&"'>出生日期</a></td>")
	Response.Write("<td align=center><a  href='index0.asp?jlh=6&myjl="&myjl&"'>家庭住址</a></td>")

    Response.Write("<td align=center><a  href='index0.asp?jlh=7&myjl="&myjl&"'>入学时间</a></td>")
    Response.Write("<td align=center><a  href='index0.asp?jlh=8&myjl="&myjl&"'>毕业证书号</a></td>")
	Response.Write("<td align=center><a  href='index0.asp?jlh=9&myjl="&myjl&"'>籍贯</a></td>")
	Response.Write("<td align=center><a  href='index0.asp?jlh=10&myjl="&myjl&"'>政治面貌</a></td>")
		Response.Write("<td align=center><a  href='index0.asp?jlh=11&myjl="&myjl&"'>毕业时间</a></td>")


    Response.Write("<td align=center>查看详情</td></tr>")




dim i 
i=1
do while not rs.eof and mypagesize>0 '----------这里的mypagesize>0不能丢，它是跳出循环的判断条件
xh=rs("xh")
xm=rs("xm")
xb=rs("xb")
s=rs("s")
zybj=rs("zybj")
jtdz=rs("jtdz")
csrq=rs("csrq")

rxsj=rs("rxsj")
byzs=rs("byzs")
jg=rs("jg")
zzmm=rs("zzmm")
bysj=rs("bysj")


  
  
  
  

 If sColor = "silver" Then
		sColor = "#cccccc"
	Else
		sColor = "silver"
	End If
   
		Response.Write("<tr bgcolor='" & sColor & "'>")
 
   %>
	
 
	<td align=center><font color="red"><%=i+(page-1)*rs.pagesize%></font></td>
	<td align=center><%=xh%></td>
    <td align=center><%=xm%></td>
 <%
    if xb="男" then
    	 %>
<td align=center><font color="red"><%=xb%></font></td>
	<%
else
	 %>
    	<td align=center><font color="green"><%=xb%></font></td>
<%
end if
 %>

    <td align=center><%=s%></td>
    <td align=center><%=zybj%></td>
    <td align=center><%=csrq%>　</td>
    <td align=center><%=jtdz%></td>
    
    <td align=center><%=rxsj%></td>
    <td align=center><%=byzs%></td>
    <td align=center><%=jg%>　</td>
    <td align=center><%=zzmm%></td>
    <td align=center><%=bysj%>　</td>

    <td align=center>
  <a href="#" onClick="window.open('gwslygl.asp?xh=<%=xh%>&zybj=<%=zybj%>', 'Sample', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=yes,left=0,top=0')">
     <font color="blue">查看详情</font></a></td></tr>
 
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   

<%


mypagesize=mypagesize-1  '-------------设定为10 这样只能循环10 次 减为0时跳出循环
i=i+1
rs.movenext
loop
'-------------------显示记录到此结束

	Response.Write("</table><br><br>") 
	 
Response.Write("</center>")

%>
 
<table width="100%" border="0" align="center">
  <tr>
    <td>
      <div align="center">页数：&nbsp; 
      
      
            
              <%
if page>2 then  '-------------------如果是在第2页以后则 显示首页
%>
        <a href=index0.asp?page=<%=1%>&jlh=<%=jlh%>&myjl=<%=myjl%>>首页</a> 
        <%
end if
%>


             <%
if page>10 then  '-------------------如果是在第11页以后则 显示上10页
%>
        <a href=index0.asp?page=<%=page-10%>&jlh=<%=jlh%>&myjl=<%=myjl%>>前10页</a> 
        <%
end if
%>




      
      
        <%
if page>1 then  '-------------------如果是在第一页以后则 显示上一页
%>
        <a href=index0.asp?page=<%=page-1%>&jlh=<%=jlh%>&myjl=<%=myjl%>>上一页</a> 
        <%
end if
%>
        <%
if rs.pagecount<=10 then '---------------如果总共分页数少于或等于10页 则只用12345678910显示
for j=1 to rs.pagecount 
response.write "[<a href=index0.asp?page="&j&"&jlh="&jlh&"&myjl="&myjl&">"&j&"</a>]"
next
else '----------------如果多于10页 则前10页用12345678910标出
jsj=page
if jsj>rs.pagecount-10 then
jsd=rs.pagecount
else
jsd=jsj+9
end if

for j=jsj to jsd
response.write "[<a href='index0.asp?page="&j&"&jlh="&jlh&"&myjl="&myjl&"'>"&j&"</a>]&nbsp;"
next
if page<rs.pagecount-9 then
response.write  "[<a href='index0.asp?page="&rs.pagecount&"&jlh="&jlh&"&myjl="&myjl&"' title='最后一页'>尾页</a>]"
end if
end if
'-------------最后一页
%>

<%
if page<rs.pagecount   then%>
        <a href='index0.asp?page=<%=page+1%>&jlh=<%=jlh%>&myjl=<%=myjl%>'>下一页</a> 
        <%
end if



%>
      </div>
    </td>
  </tr>
</table>

  <!--#include file="nn.asp"-->
  
  
<form name="form2" method="post" action="find0.asp?myjl=<%=myjl%>">
  <table width="100%" border="0" align="center" height="37">
    <tr>
      <td height="42"> 
        <div align="center">
          <select name="topic">
            <option value="1">按学号搜</option>
            <option value="2">按姓名搜</option>
            <option value="3">按家庭住址搜</option>
            <option value="4">按部门或专业搜</option>
            <option value="5">按班级名称搜</option>
            <option value="6">按联系电话搜</option>
            <option value="7">按政治面貌搜</option>
            <option value="8">按籍贯搜</option>
            <option value="9">按奖励搜</option>
            <option value="10">按处分搜</option>
            
            <option value="11">按出生日期搜</option>
            <option value="12">按入学时间搜</option>
            <option value="13">按毕业时间搜</option>
            <option value="14">按毕业证书号搜</option>
           <option value="15">按学位搜</option>

            
            
            
            
            <option value="0" selected>智能搜索</option>
                                            </select>
                   
          关键词： 
          <input type="text" name="key" size="20">
          <input type="submit" name="Submit2" value="搜索">
        </div>
      </td>
    </tr>
  </table>
  <center>
  
  
  
    <p>搜索之后可对搜索到的学生进行修改或删除</p>
  
  
  
  </center>

   <table width="100%" border="1" cellspacing="0" cellpadding="0" align="center" bordercolor="#999999" bordercolorlight="#999999" bordercolordark="#f7f7f7">
    <tr> 
  </body>
</html>
<%
rs.close
set rs=nothing
conn.close
set conn=nothing
end if
%>