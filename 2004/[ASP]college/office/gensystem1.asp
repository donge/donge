<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then response.redirect "default.asp"
%>

<html>

<head>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>����칫ϵͳ</title>
</head>

<frameset rows="0,68,*">
  <frame name="banner1" scrolling="no" noresize target="contents" src="top0.asp">
  <frame name="banner" scrolling="no" noresize target="contents" src="top.asp">

  <frameset cols="180,*">
   <frame name="contents" scrolling="no" noresize target="main" src="left.asp">
    <frame name="main" src="dayrep.asp">
  </frameset>
  <noframes>
  <body>

  <p>����ҳʹ���˿�ܣ��������������֧�ֿ�ܡ�</p>

  </body>
  </noframes>
</frameset>
</html>
