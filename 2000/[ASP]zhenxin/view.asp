<%@ codepage ="936" %>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 3.0">
<link rel="stylesheet" type="text/css" href="link.css">
<title>真心链</title>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0">
<!--#include file="1.htm" --> 
<table border="0" cellspacing="0" cellpadding="0" width="778">
  <tr>
    <td colspan="15"> 
      <p>&nbsp;</p>
      <p><%oid=request.querystring("oid")
set con = Server.CreateObject("ADODB.Connection")%><!-- #include file=1Qw@3E.inc --><%con.open
sql="select * from zhenxin_user where oid="&oid
Set Rs=con.Execute(sql)
If Rs.Bof OR Rs.Eof Then%>document.write(&quot;真心统计发生错误，此户名不存在。&quot;);<%rs.close
con.close
set rs=nothing
set con=nothing
response.end
end if
counturl=rs("site_url")
sitename=rs("site_name")
jiji=rs("site_about")
fenlei=rs("site_type")
counter=rs("total_view")
todaycounter=rs("today_view")
sort=rs("ID")
jcount=rs("day_visit")
registerdate=rs("join_time")
fromhit=rs("click_you")
ghit=rs("you_click")
showtime=rs("view_you")
bshowtime=rs("you_view")

rs.close
con.close
set rs=nothing
set con=nothing%></p>
      <p align="center">真心统计</p>
      <table width="600" border="0" cellspacing="3" cellpadding="3" align="center">
        <tr> 
          <td width="50%" bgcolor="#FFcccc">资料</td>
          <td width="50%" bgcolor="#CCCCCC">统计</td>
        </tr>
        <tr> 
          <td> site_name：<%=server.htmlencode(sitename)%></td>
          <td>total_view：<%=counter%></td>
        </tr>
        <tr> 
          <td> 
            <p>site_url：<a href="<%=server.htmlencode(counturl)%>" target="_blank"><%=server.htmlencode(counturl)%></a></p>
          </td>
          <td>day_visit：<%=jcount%></td>
        </tr>
        <tr> 
          <td>site_type：<%select case fenlei
                       case 1:  response.write"综合门户"
                      case 2:  response.write"国家地区"
                       case 3:  response.write"电脑网络"
                      case 4:  response.write"政府机关"
                       case 5:  response.write"休闲娱乐"
                       case 6:  response.write"电信港湾"
                        case 7:  response.write"生活资讯"
                     case 8:  response.write"文化艺术"
                       case 9:  response.write"科学教育"
                        case 10:  response.write"游戏世界"
                        case 11:  response.write"体育健身"
                       case 12:  response.write"工商经济"
                        case 13:  response.write"金融投资"
                      case 14:  response.write"新闻媒体"
                       case 15:  response.write"情感交流"
                     case 16:  response.write"女性天地"
                       case 17:  response.write"卫生保健"
                      case 18:  response.write"其他类别"
case else:response.write"<font color='#ff0000'>资料错误</font>"
end select%></td>
          <td>today_view：<%=todaycounter%></td>
        </tr>
        <tr> 
          <td>注册日期：<%=registerdate%></td>
          <td>you_view：<%=bshowtime%></td>
        </tr>
        <tr> 
          <td>真心排名：<%=sort%></td>
          <td>you_click：<%=ghit%></td>
        </tr>
        <tr> 
          <td rowspan="2" valign="top">site_about：<%n=len(jiji)
n=int(n/50)+1
for i=0 to n
m=i*50+1
temp=mid(jiji,m,40)%><%=server.htmlencode(temp)%><%next%></td>
          <td>view_you：<%=showtime%></td>
        </tr>
        <tr> 
          <td>click_you：<%=fromhit%></td>
        </tr>
      </table>
      
    <p>&nbsp;</p></td>
</table>
<!--#include file="2.htm" -->
</body>
</html>
