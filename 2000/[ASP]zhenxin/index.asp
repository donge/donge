<html>
<head>
<title>真 心 链</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="link.css">
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0">
<!--#include file="1.htm" --> 
<table width="778" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td bgcolor="#eeeeee" width="180" valign="top"> 
      <p>&nbsp;</p>
      <table width="80%" border="1" cellspacing="0" cellpadding="0" align="center" bordercolorlight="#000000" bordercolordark="#FFFFFF">
        <tr bgcolor="#FFFFFF"> 
          <td> <br>
            <form action="edituser.asp" method="post">
              <div align="center"> <span FONT-SIZE: 9pt><font color="#000000">用户：</font> 
                </span> 
                <input
  name="user" size="10" class="stedit" maxlength="10">
                <p> <span><font color="#000000">pass_word：</font> 
                  <input
  name="password" size="10" class="stedit" type="password" maxlength="10">
                  </span></p>
                <p> 
                  <input type="submit" class="stbtm"
  value="登 陆" name="submit">
                </p>
              </div>
            </form>
          </td>
        </tr>
      </table>
      <p align="center"><a href="apply.asp">新用户注册！</a></p>
      <p align="center"><a href="deluser.asp">用户删除</a></p>
      <table width="80%" border="1" cellspacing="0" cellpadding="0" align="center" bordercolorlight="#000000" bordercolordark="#FFFFFF">
        <tr bgcolor="#FFFFFF"> 
          <td> 
            <div align="center"> 
              <p style="LINE-HEIGHT: 20px"><br>
                <font color="#FF0000">站长须知</font></p>
              <p style="LINE-HEIGHT: 20px">经过一个月的修改，本站基本功能已经制作完成。以后本站将加大管理力度，删除一些非法网站。</p>
              <p style="LINE-HEIGHT: 20px"> 如果你的网站被删除，请不要着急。您可以凭你的user_name和pass_word到修改功能中恢复。只需将site_name更改成合法的内容即可。<br>
                &nbsp; </p>
              </div>
          </td>
        </tr>
      </table>
      <p align="center"><a href="idsort.asp">用户排序</a></p>
      </td>
    <td valign="top"> 
      <table width="95%" border="0" cellspacing="1" cellpadding="2" align="center">
        <tr bgcolor="#FFeeee"> 
          <td> &nbsp;<font color="#FF0000">最 新 消 息</font></td>
        </tr>
        <tr> 
          <td> 
            <p style="LINE-HEIGHT: 20px"> 2000年9月17日 增加了站长管理功能，以后将不定期的处理非法用户。<br>
              2000年9月17日 增加了分类目录浏览功能，使本站功能更加强大。<br>
              2000年9月17日 解决了在自己的真心链中的显示自己网站的缺陷。<br>
              2000年9月11日 广告交换系统改变了计算模式，达到了实时显示的效果。<br>
              2000年9月10日 真心链站长新闻发布系统正式启动。 </p>
          </td>
        </tr>
      </table>
      <hr size="1" width="95%">
      <table width="95%" border="0" cellspacing="1" cellpadding="3" align="center">
        <tr bgcolor="#FFeeee"> 
          <td> &nbsp;<font color="#FF0000">站 长 新 闻</font></td>
        </tr>
        <tr> 
          <td><!--#include file="newsconn.asp"--> 
            <script language="JavaScript">
function popwin2(id,path)
{		window.open("opennews.asp?id="+id+"&ppath="+path,"","height=400,width=600,resizable=yes,scrollbars=yes,status=no,toolbar=no,menubar=yes,location=no");
}
</script>
            <%
   const MaxPerPage=10
   dim totalPut   
   dim CurrentPage
   dim TotalPages
   dim i,j
   dim sql
   dim rs
 
%><% 
sql="select * from news order by id desc" 
Set rs= Server.CreateObject("ADODB.Recordset") 
rs.open sql,conn,1,1 
  if rs.eof and rs.bof then 
       response.write "<p align='center'>没 有 找 到 任 何 新 闻</p>" 
   else 
	  totalPut=rs.recordcount 
      totalPut=rs.recordcount 
      if currentpage<1 then 
          currentpage=1 
      end if 
      if (currentpage-1)*MaxPerPage>totalput then 
	   if (totalPut mod MaxPerPage)=0 then 
	     currentpage= totalPut \ MaxPerPage 
	   else 
	      currentpage= totalPut \ MaxPerPage + 1 
	   end if 
 
      end if 
       if currentPage=1 then 
           showpage totalput,MaxPerPage,"index.asp" 
            showContent 
            showpage totalput,MaxPerPage,"index.asp" 
       else 
          if (currentPage-1)*MaxPerPage<totalPut then 
            rs.move  (currentPage-1)*MaxPerPage 
            dim bookmark 
            bookmark=rs.bookmark 
           showpage totalput,MaxPerPage,"index.asp" 
            showContent 
             showpage totalput,MaxPerPage,"index.asp" 
        else 
	        currentPage=1 
           showpage totalput,MaxPerPage,"index.asp" 
           showContent 
           showpage totalput,MaxPerPage,"index.asp" 
	      end if 
	   end if 
   rs.close 
   end if 
	         
   set rs=nothing   
   sub showContent 
       dim i 
	   i=0 
%> 
            <div align="center"> 
              <center>
                <table border="0" cellspacing="1" width="100%" cellpadding="2">
                  <%do while not rs.eof%> 
                  <tr> 
                    <td width="60"> 
                      <p><font color="red"><%=rs("date")%></font> 
                    </td>
                    <td> 
                      <p><a href="javascript:popwin2(<%=rs("id")%>)"><%=rs("title")%></a> 
                    </td>
                    <td width="50"> 
                      <p>人气：<font color="#FF0000"><%=rs("hits")%></font> 
                    </td>
                  </tr>
                  <% i=i+1
	      if i>=MaxPerPage then exit do
	      rs.movenext
	   loop
		  %> 
                  <td colspan="3"> 
                    <div align="right"> 
                        <p><a href="addnews.asp">发布新闻</a> <a href="news.asp">更多新闻</a></p>
                    </div>
                  </td>
                </table>
              </center>
            </div>
            <%
 end sub 
function showpage(totalnumber,maxperpage,filename)
  dim n
  if totalnumber mod maxperpage=0 then
     n= totalnumber \ maxperpage
  else
     n= totalnumber \ maxperpage+1
  end if
end function
%> </td>
        </tr>
      </table>
      <hr size="1" width="95%">
      <table width="95%" border="0" cellspacing="1" cellpadding="3" align="center">
        <tr bgcolor="eeeeee"> 
          <td> 
            <div align="center"><a href="type.asp?type=1">综合门户</a></div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=2">国家地区</a></div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=3">电脑网络</a></div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=4">政府机关</a></div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=5">休闲娱乐</a></div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=6">电信港湾</a></div>
          </td>
        </tr>
        <tr bgcolor="eeeeee"> 
          <td> 
            <div align="center"><a href="type.asp?type=7">生活资讯</a> </div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=8">文化艺术</a></div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=9">科学教育</a></div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=10">游戏世界</a></div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=11">体育健身</a> </div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=12">工商经济</a></div>
          </td>
        </tr>
        <tr bgcolor="eeeeee"> 
          <td> 
            <div align="center"><a href="type.asp?type=13">金融投资</a></div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=14">新闻媒体</a></div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=15">情感交流</a></div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=16">女性天地</a></div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=17">卫生保健</a> </div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=18">其他类别</a></div>
          </td>
        </tr>
      </table>
      <hr size="1" width="95%">
      <%dim oid(26),counturl(26),sitename(26),jiji(26),jcount(26),fenlei(26),zcounter(26),todaycounter(26),sn(26)
set con = Server.CreateObject("ADODB.Connection")%> <!-- #include file=1Qw@3E.inc --> 
      <%con.open
sql="select * from zhenxin_user where id<26 and id>0 and site_name<>'此用户已被删除！'"
Set Rs=con.Execute(sql)
n=1
do while not rs.eof
sn(n)=rs("ID")
oid(sn(n))=rs("oid")
counturl(sn(n))=rs("site_url")
fenlei(sn(n))=rs("site_type")
sitename(sn(n))=rs("site_name")
jcount(sn(n))=rs("day_visit")
jiji(sn(n))=rs("site_about")
zcounter(sn(n))=rs("total_view")
todaycounter(sn(n))=rs("today_view")
fenlei(sn(n))=rs("site_type")
n=n+1
rs.movenext
loop
rs.close
con.close
set rs=nothing
set con=nothing%> 
      <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td colspan="2"> 
            <table border="0" cellpadding="2" width="100%" cellspacing="1">
              <tr bgcolor="eeeeee"> 
                <td width="7%" >排名</td>
                <td width="13%" >site_type</td>
                <td width="24%" >site_name</td>
                <td width="13%" >total_view</td>
                <td width="13%" >day_visit</td>
                <td width="13%" >today_view</td>
                <td bgcolor="eeeeee" width="7%" bordercolordark="#000000" bordercolorlight="#000000" >统计</td>
              </tr>
              <%for i=1 to n-1%> <%if sitename(i)<>"" then%> 
              <tr> 
                <td ><%=i%></td>
                <td ><%select case fenlei(i)
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
                <td ><a href=<%=counturl(i)%> target="_blank" title="<%=jiji(i)%>"><%=sitename(i)%></a></td>
                <td ><%=zcounter(i)%></td>
                <td ><%=jcount(i)%></td>
                <td ><%=todaycounter(i)%></td>
                <td bordercolor="#000000" bordercolordark="#000000" bordercolorlight="#000000"><a href="view.asp?oid=<%=oid(i)%>">查看</a>　</td>
              </tr>
              <%end if%> <%next%> 
            </table>
          </td>
        </tr>
      </table>
    </td>
    <td bgcolor="#ffeeee" width="160" valign="top"> 
      <p>&nbsp;</p>
      <table width="80%" border="1" cellspacing="0" cellpadding="0" align="center" bordercolorlight="#000000" bordercolordark="#FFFFFF">
        <tr bgcolor="#FFFFFF"> 
          <td> 
            <div align="center"> 
              <p style="LINE-HEIGHT: 20px"><br>
                广告征订(<font color="#FF0000">开张特价</font>)<br>
                2000.9.1 - 2000.10.1 
              <p style="LINE-HEIGHT: 20px">一个文字广告位，显示一星期，价格<font color="#FF0000">30</font>元。<br>
                一个文字广告位，显示一个月，价格<font color="#FF0000">100</font>元。 
              <p style="LINE-HEIGHT: 20px">有意者请与管理员联系 
              <p style="LINE-HEIGHT: 20px"><a href="mailto:ydd@elong.com?subject=广告合作">ydd@elong.com</a><br>
                &nbsp; 
            </div>
          </td>
        </tr>
      </table>
      <p>&nbsp;</p>
      <table width="80%" border="1" cellspacing="0" cellpadding="0" align="center" bordercolorlight="#000000" bordercolordark="#FFFFFF">
        <tr bgcolor="#FFFFFF"> 
          <td> 
            <p>&nbsp;</p>
            <p align="center">合作伙伴</p>
            <p align="center"><a href="http://ligangde.xiloo.com/" target="_blank">少女最迷人之处</a></p>
            <p>&nbsp;</p>
          </td>
        </tr>
      </table>
      <p>&nbsp;</p>
      <table width="80%" border="1" cellspacing="0" cellpadding="0" align="center" bordercolorlight="#000000" bordercolordark="#FFFFFF">
        <tr bgcolor="#FFFFFF"> 
          <td> 
            <p align="center">&nbsp;</p>
            <p align="center">友情连接</p>
            <p align="center"><a href="http://www.99free.net" target="_blank"><img src="images/logo1.GIF" width="88" height="31" border="0" alt="免费资源搜罗网"></a></p>
            <p align="center"><a href="http://www.smartone2free.com/" target="_blank"><img src="images/logo2.gif" width="88" height="31" alt="-专业赚钱网站-SmartOne2Free.com" border="0"></a></p>
            <p align="center"><a href="http://www.cnjh.net" target="_blank"><img src="images/logo3.gif" width="88" height="31" alt="金华信息港" border="0"></a></p>
            <p align="center">&nbsp;</p>
          </td>
        </tr>
      </table>
      <p>&nbsp;</p>
    </td>
  </tr>
</table>
<!--#include file="2.htm" --> 
</body>
</html>
