<%dim spanfen(51),zcounter(51),todaycounter(51),counturl(51),sitename(51),registerdate(51),jiji(51)
dim jcount(51)
dim sn(51),fenlei(51),oid(51)
set con = Server.CreateObject("ADODB.Connection")%>
<!-- #include file=1Qw@3E.inc -->
<%con.open

sql="select * from zhenxin_user where id<51 and id>0 and site_name<>'���û��ѱ�ɾ����'"
Set Rs=con.Execute(sql)
n=1
do while not rs.eof
sn(n)=rs("ID")
oid(sn(n))=rs("oid")
zcounter(sn(n))=rs("total_view")
todaycounter(sn(n))=rs("today_view")
counturl(sn(n))=rs("site_url")
sitename(sn(n))=rs("site_name")
registerdate(sn(n))=rs("user_name")
jiji(sn(n))=rs("site_about")
jcount(sn(n))=rs("day_visit")
fenlei(sn(n))=rs("site_type")
n=n+1
rs.movenext
loop
rs.close
con.close
set rs=nothing
set con=nothing%>


<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>������</title>
<meta name="GENERATOR" content="Microsoft FrontPage 3.0">
<link rel="stylesheet" type="text/css" href="link.css">
</head>
<body leftmargin="0" topmargin="0" bgcolor="#FFFFFF">
<!--#include file="1.htm" -->
<table border="0" cellspacing="0" cellpadding="0" width="778">
  <tr> 
    <td> 
      <div align="center"> 
        <center>
          <p>&nbsp;</p>
          <p>������day_visit���а�</p>
          <table border="0" cellpadding="3" bordercolor="#000000"
    bordercolorlight="#000000" bordercolordark="#000000" width="80%">
            <tr bgcolor="eeeeee"> 
              <td >����</td>
              <td >site_type</td>
              <td >site_name</td>
              <td >total_view</td>
              <td >day_visit</td>
              <td >today_view</td>
              <td >ͳ��</td>
            </tr>
            <%for i=1 to n-1%> <%if sitename(i)<>"���û��ѱ�ɾ����" then%> 
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
              <td >��<%=zcounter(i)%></td>
              <td ><%=jcount(i)%></td>
              <td >��<%=todaycounter(i)%></td>
              <td><a href="view.asp?oid=<%=oid(i)%>">�鿴</a>��</td>
            </tr>
            <%end if%> <%next%> 
          </table>
          <p>&nbsp;</p></center>
      </div>
      </td>
  </tr>
</table>
<!--#include file="2.htm" -->
</body>
</html>
