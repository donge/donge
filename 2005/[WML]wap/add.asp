<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% Response.ContentType="text/vnd.wap.wml;charset=UTF-8" %>
<?xml version="1.0" encoding="UTF-8"?><!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.wapforum.org/DTD/wml_1.1.xml"> 
<wml>
	<head>
		<meta http-equiv="Cache-Control" content="max-age=0"/>
		<meta http-equiv="Cache-Control" content="no-cache"/>
	</head>
	<card id="add" title="经典WAP留言本">
		<p>
			昵称：<br/>
			<input name="Name" emptyok="false" size="10" maxlength="10"/><br/>
			标题：<br/>
			<input name="Title" emptyok="false" maxlength="40"/><br/>
			内容：<br/>
			<input name="Content" format="false" maxlength="150"/><br/>

			<br/><anchor>POST方式提交
				<go href="save.asp" method="post">
					<postfield name="Name" value="$(Name:n)" />
					<postfield name="Title" value="$(Title:n)" />
					<postfield name="Content" value="$(Content:n)" />
					<postfield name="Method" value="POST" />
				</go>
			</anchor>
			<br/><a href="save.asp?Name=$(Name:n)&amp;Title=$(Title:n)&amp;Content=$(Content:n)&amp;Method=GET">GET方式提交</a><br/><br/>
			<a href="index.asp">返回留言列表</a>
		</p>
		<p>
		有任何疑问，请访问：http://www.designer5.net或<br/>
		蓝色理想论坛WAP版：http://www.blueidea.com/bbs<br/>
		广告：蓝色理想WAP网站改版了，使用手机访问<a href="http://wap.blueidea.com">http://wap.blueidea.com</a><br/>
		如果您参考了此程序，有自己的WAP站点，请做上http://wap.blueidea.com的链接。
		</p>
		<do type="prev" label="返回"><prev/></do>
	</card>
</wml>
