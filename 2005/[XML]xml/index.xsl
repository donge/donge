<?xml version='1.0' encoding="gb2312"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

	<xsl:template match="/">
	
	<html>
	
	<head>
	<title>donge.org</title>
	<link href="public.css" rel="stylesheet" type="text/css" />
	<link href="index.css" rel="stylesheet" type="text/css" />
	
	</head>
	
	<body>
	<div id="header">
		donge.org
	</div>
	<div id="booksort">
		<xsl:apply-templates select="booksort"/>
	</div>
	<div id="footer">
		<ul>
			<li>donge.org·请使用IE6以上浏览器访问</li>
		</ul>
	</div>
	</body>
	</html>
	
	</xsl:template>

	<xsl:template match="booksort">
		<div class="info"><xsl:apply-templates select="info"/></div>
		<div class="table_frame">
		<table width="100%" align="center" border="0" cellspacing="0" cellpadding="0" id="booklist">
	  <tr>
		<th class="list1">Menu</th>
		<th class="list2">Update</th>
	  </tr>
	<xsl:apply-templates select="booklist"/>
	</table>
		</div>
	
	<div class="btn_goback"><a href="index.xml">返回网站首页</a></div>

	</xsl:template>
	
	<xsl:template match="info">
		<div id="location">欢迎访问 <span class="sitename"><xsl:value-of select="sortname"/></span></div>
		<div id="edit">管理员:<span class="color"><xsl:value-of select="edit"/></span> 技术支持:<span class="color"><xsl:value-of select="time"/></span></div>		
	</xsl:template>
	
	<xsl:template match="booklist">
		<xsl:apply-templates select="item"/>
	</xsl:template>
	
	<xsl:template match="item">
	<tr>
			<td class="list1"><a>
				<xsl:attribute name="href">
					<xsl:apply-templates select="links"/>
				</xsl:attribute>
				<xsl:apply-templates select="bookname"/>
			</a>
			<!-- -[<xsl:apply-templates select="author"/>] -->
			</td>

			<td class="list2"><xsl:apply-templates select="booktime"/></td>
	</tr>
	</xsl:template>

	<xsl:template match="bookname">
		<xsl:value-of select="."/>
	</xsl:template>

	<xsl:template match="links">
		<xsl:value-of select="."/>
	</xsl:template>
	
	<xsl:template match="author">
		<xsl:value-of select="."/>
	</xsl:template>
	
	<xsl:template match="booktime">
		<xsl:value-of select="."/>
	</xsl:template>
	
</xsl:stylesheet>