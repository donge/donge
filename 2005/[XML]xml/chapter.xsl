<?xml version='1.0' encoding="gb2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

	<xsl:template match="/">
	
	<html>
	
	<head>
	<title>�ȶ�ʳ�����ߡ����ܳ��������¸о�</title>
	<link href="public.css" rel="stylesheet" type="text/css" />
	<link href="chapter.css" rel="stylesheet" type="text/css" />
	
	</head>
	
	<body>
	
	<div id="header"></div>
	<div id="chapter"><xsl:apply-templates select="book"/></div>
	<div id="footer">
		<ul>
			<li>�ȶ�ʳ�����ߡ����ܳ��������¸о��������ռ��ڻ����������Ȩ����֪!</li>
		</ul>
	</div>
	
	</body>
	</html>
	
	</xsl:template>

	<xsl:template match="book">
		<div class="btn_goback"><a href="/index.xml">������վ��ҳ</a><a href="../index.xml">���ط���Ŀ¼</a></div>
		<xsl:apply-templates select="info"/>
		<div id="catalog">
		<div id="catalogbg">
		<xsl:apply-templates select="catalog"/>
		</div>	
		</div>
		<div class="btn_goback"><a href="/index.xml">������վ��ҳ</a><a href="../index.xml">���ط���Ŀ¼</a></div>
	</xsl:template>
	
	<xsl:template match="info">
		<h1><xsl:value-of select="title"/></h1>
		<!-- <div class="author">����:<xsl:value-of select="author"/><span class="time">  ����ʱ��<xsl:value-of select="time"/></span></div>			-->
	</xsl:template>
	
	<xsl:template match="catalog">
		<xsl:apply-templates select="item"/>
	</xsl:template>
	
	<xsl:template match="item">
	<div class="cataloglist">
				<a>
				<xsl:attribute name="href">
					<xsl:apply-templates select="links"/>.xml
				</xsl:attribute>
				<xsl:apply-templates select="text"/>
				</a>
	</div>
	</xsl:template>

	<xsl:template match="text">
		<xsl:value-of select="."/>
	</xsl:template>

	<xsl:template match="links">
		<xsl:value-of select="."/>
	</xsl:template>

</xsl:stylesheet>