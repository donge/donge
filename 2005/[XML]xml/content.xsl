<?xml version='1.0' encoding="gb2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

	<xsl:template match="/">
	
	<html>
	
	<head>
	<title>donge.org</title>
	<link href="public.css" rel="stylesheet" type="text/css" />
	<link href="content.css" rel="stylesheet" type="text/css" />
	
	</head>
	
	<body>
	<div id="header">donge.org</div>
	<div id="book">
	<xsl:apply-templates select="book"/>

	<div id="pages"><script language="JavaScript" type="text/JavaScript" src="script.js" charset="gb2312"></script></div>
	
	</div>
	
	<div id="footer">
		<ul>
			<li>donge.org����ʹ��IE6�������������</li>
		</ul>
	</div>
	</body>
	</html>
	
	</xsl:template>

	<xsl:template match="book">
		<div class="btn_goback"><a href="index.xml">��վ��ҳ</a><a href="index.xml">������ҳ</a><a href="index.xml">������Ŀ</a></div>
		<xsl:apply-templates select="info"/>
		<div id="frame"><div id="framebg"><xsl:apply-templates select="frame"/></div>
		</div>
	</xsl:template>
	
	<xsl:template match="info">
		<h1><xsl:value-of select="title"/></h1>
		<!--<div class="author">����:<xsl:value-of select="author"/><span class="time">  ����ʱ��:<xsl:value-of select="time"/></span></div>-->
	</xsl:template>
	
	<xsl:template match="frame">
		<xsl:apply-templates select="text"/>
	</xsl:template>

	<xsl:template match="text">
		<p><xsl:value-of select="."/></p>
	</xsl:template>

</xsl:stylesheet>