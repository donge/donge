<html>
<head>
<title>�� �� ��</title>
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
              <div align="center"> <span FONT-SIZE: 9pt><font color="#000000">�û���</font> 
                </span> 
                <input
  name="user" size="10" class="stedit" maxlength="10">
                <p> <span><font color="#000000">pass_word��</font> 
                  <input
  name="password" size="10" class="stedit" type="password" maxlength="10">
                  </span></p>
                <p> 
                  <input type="submit" class="stbtm"
  value="�� ½" name="submit">
                </p>
              </div>
            </form>
          </td>
        </tr>
      </table>
      <p align="center"><a href="apply.asp">���û�ע�ᣡ</a></p>
      <p align="center"><a href="deluser.asp">�û�ɾ��</a></p>
      <table width="80%" border="1" cellspacing="0" cellpadding="0" align="center" bordercolorlight="#000000" bordercolordark="#FFFFFF">
        <tr bgcolor="#FFFFFF"> 
          <td> 
            <div align="center"> 
              <p style="LINE-HEIGHT: 20px"><br>
                <font color="#FF0000">վ����֪</font></p>
              <p style="LINE-HEIGHT: 20px">����һ���µ��޸ģ���վ���������Ѿ�������ɡ��Ժ�վ���Ӵ�������ȣ�ɾ��һЩ�Ƿ���վ��</p>
              <p style="LINE-HEIGHT: 20px"> ��������վ��ɾ�����벻Ҫ�ż���������ƾ���user_name��pass_word���޸Ĺ����лָ���ֻ�轫site_name���ĳɺϷ������ݼ��ɡ�<br>
                &nbsp; </p>
              </div>
          </td>
        </tr>
      </table>
      <p align="center"><a href="idsort.asp">�û�����</a></p>
      </td>
    <td valign="top"> 
      <table width="95%" border="0" cellspacing="1" cellpadding="2" align="center">
        <tr bgcolor="#FFeeee"> 
          <td> &nbsp;<font color="#FF0000">�� �� �� Ϣ</font></td>
        </tr>
        <tr> 
          <td> 
            <p style="LINE-HEIGHT: 20px"> 2000��9��17�� ������վ�������ܣ��Ժ󽫲����ڵĴ���Ƿ��û���<br>
              2000��9��17�� �����˷���Ŀ¼������ܣ�ʹ��վ���ܸ���ǿ��<br>
              2000��9��17�� ��������Լ����������е���ʾ�Լ���վ��ȱ�ݡ�<br>
              2000��9��11�� ��潻��ϵͳ�ı��˼���ģʽ���ﵽ��ʵʱ��ʾ��Ч����<br>
              2000��9��10�� ������վ�����ŷ���ϵͳ��ʽ������ </p>
          </td>
        </tr>
      </table>
      <hr size="1" width="95%">
      <table width="95%" border="0" cellspacing="1" cellpadding="3" align="center">
        <tr bgcolor="#FFeeee"> 
          <td> &nbsp;<font color="#FF0000">վ �� �� ��</font></td>
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
       response.write "<p align='center'>û �� �� �� �� �� �� ��</p>" 
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
                      <p>������<font color="#FF0000"><%=rs("hits")%></font> 
                    </td>
                  </tr>
                  <% i=i+1
	      if i>=MaxPerPage then exit do
	      rs.movenext
	   loop
		  %> 
                  <td colspan="3"> 
                    <div align="right"> 
                        <p><a href="addnews.asp">��������</a> <a href="news.asp">��������</a></p>
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
            <div align="center"><a href="type.asp?type=1">�ۺ��Ż�</a></div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=2">���ҵ���</a></div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=3">��������</a></div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=4">��������</a></div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=5">��������</a></div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=6">���Ÿ���</a></div>
          </td>
        </tr>
        <tr bgcolor="eeeeee"> 
          <td> 
            <div align="center"><a href="type.asp?type=7">������Ѷ</a> </div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=8">�Ļ�����</a></div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=9">��ѧ����</a></div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=10">��Ϸ����</a></div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=11">��������</a> </div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=12">���̾���</a></div>
          </td>
        </tr>
        <tr bgcolor="eeeeee"> 
          <td> 
            <div align="center"><a href="type.asp?type=13">����Ͷ��</a></div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=14">����ý��</a></div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=15">��н���</a></div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=16">Ů�����</a></div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=17">��������</a> </div>
          </td>
          <td> 
            <div align="center"><a href="type.asp?type=18">�������</a></div>
          </td>
        </tr>
      </table>
      <hr size="1" width="95%">
      <%dim oid(26),counturl(26),sitename(26),jiji(26),jcount(26),fenlei(26),zcounter(26),todaycounter(26),sn(26)
set con = Server.CreateObject("ADODB.Connection")%> <!-- #include file=1Qw@3E.inc --> 
      <%con.open
sql="select * from zhenxin_user where id<26 and id>0 and site_name<>'���û��ѱ�ɾ����'"
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
                <td width="7%" >����</td>
                <td width="13%" >site_type</td>
                <td width="24%" >site_name</td>
                <td width="13%" >total_view</td>
                <td width="13%" >day_visit</td>
                <td width="13%" >today_view</td>
                <td bgcolor="eeeeee" width="7%" bordercolordark="#000000" bordercolorlight="#000000" >ͳ��</td>
              </tr>
              <%for i=1 to n-1%> <%if sitename(i)<>"" then%> 
              <tr> 
                <td ><%=i%></td>
                <td ><%select case fenlei(i)
                       case 1:  response.write"�ۺ��Ż�"
                      case 2:  response.write"���ҵ���"
                       case 3:  response.write"��������"
                      case 4:  response.write"��������"
                       case 5:  response.write"��������"
                       case 6:  response.write"���Ÿ���"
                        case 7:  response.write"������Ѷ"
                     case 8:  response.write"�Ļ�����"
                       case 9:  response.write"��ѧ����"
                        case 10:  response.write"��Ϸ����"
                        case 11:  response.write"��������"
                       case 12:  response.write"���̾���"
                        case 13:  response.write"����Ͷ��"
                      case 14:  response.write"����ý��"
                       case 15:  response.write"��н���"
                     case 16:  response.write"Ů�����"
                       case 17:  response.write"��������"
                      case 18:  response.write"�������"
case else:response.write"<font color='#ff0000'>���ϴ���</font>"
end select%></td>
                <td ><a href=<%=counturl(i)%> target="_blank" title="<%=jiji(i)%>"><%=sitename(i)%></a></td>
                <td ><%=zcounter(i)%></td>
                <td ><%=jcount(i)%></td>
                <td ><%=todaycounter(i)%></td>
                <td bordercolor="#000000" bordercolordark="#000000" bordercolorlight="#000000"><a href="view.asp?oid=<%=oid(i)%>">�鿴</a>��</td>
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
                �������(<font color="#FF0000">�����ؼ�</font>)<br>
                2000.9.1 - 2000.10.1 
              <p style="LINE-HEIGHT: 20px">һ�����ֹ��λ����ʾһ���ڣ��۸�<font color="#FF0000">30</font>Ԫ��<br>
                һ�����ֹ��λ����ʾһ���£��۸�<font color="#FF0000">100</font>Ԫ�� 
              <p style="LINE-HEIGHT: 20px">�������������Ա��ϵ 
              <p style="LINE-HEIGHT: 20px"><a href="mailto:ydd@elong.com?subject=������">ydd@elong.com</a><br>
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
            <p align="center">�������</p>
            <p align="center"><a href="http://ligangde.xiloo.com/" target="_blank">��Ů������֮��</a></p>
            <p>&nbsp;</p>
          </td>
        </tr>
      </table>
      <p>&nbsp;</p>
      <table width="80%" border="1" cellspacing="0" cellpadding="0" align="center" bordercolorlight="#000000" bordercolordark="#FFFFFF">
        <tr bgcolor="#FFFFFF"> 
          <td> 
            <p align="center">&nbsp;</p>
            <p align="center">��������</p>
            <p align="center"><a href="http://www.99free.net" target="_blank"><img src="images/logo1.GIF" width="88" height="31" border="0" alt="�����Դ������"></a></p>
            <p align="center"><a href="http://www.smartone2free.com/" target="_blank"><img src="images/logo2.gif" width="88" height="31" alt="-רҵ׬Ǯ��վ-SmartOne2Free.com" border="0"></a></p>
            <p align="center"><a href="http://www.cnjh.net" target="_blank"><img src="images/logo3.gif" width="88" height="31" alt="����Ϣ��" border="0"></a></p>
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
