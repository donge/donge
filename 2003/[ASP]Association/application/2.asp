<%
if session("txtLevel")<>"普通会员" and session("txtLevel")<>"vip会员" then
  response.write "<script language=JavaScript>{window.alert('此栏目只对普通会员以上会员开放！');window.location.href='default.asp'}</script>"
end if
%>
<html>

<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>New Page 1</title>
</head>

<body>

<p align="center">　</p>
<p align="center">　</p>
<p align="center">　</p>
<h3 align="center"><font color="#800000">这是普通会员可以进入的页面！！</font></h3>
<p align="center">　</p>
<p align="center"><a href="default.asp">返回</a></p>

</body>

</html>
