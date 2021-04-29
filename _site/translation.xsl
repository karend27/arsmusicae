<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" exclude-result-prefixes="tei"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:tei="http://www.tei-c.org/ns/1.0">
	<xsl:output method="html" version="4.01" encoding="utf-8" indent="yes" doctype-system="http://www.w3.org/TR/html4/strict.dtd" doctype-public="-//W3C//DTD HTML 4.01//EN" />
	
	<xsl:include href="generic.xsl"/>
	<xsl:template match="/">
		<html>
			<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Seville</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="header">
	<h1><a href="home.html"><xsl:value-of select="//tei:title"/></a></h1>
	<h2>A Music Theory Text from the Fourteenth Century</h2>
</div>
<div id="menu">
	<ul>
		<li><a href="home.xml">Home</a> </li>
		<li><a href="transcriptions.html">Transcriptions</a></li>
		<li><a
			href="translation.xml">Translation</a></li>
		<li><a href="files.html">Files</a></li>
		<li><a href="about.html">About</a> </li>
		<li><a href="http://www.arsmusicae.org/wordpress/">Blog</a> </li>
	</ul>
</div>
<div id="content">
	
	<div id="translation">
		<h2><xsl:value-of select="//tei:sourceDesc"/> (english translation)</h2>
			<xsl:call-template name="bodyText" /> 
		<div id="footer">
			<xsl:call-template name="footnote"/>
		</div>
	</div>
</div>
<div id="footer">
	<p> Copyright @Creative Commons 2011. Designed by <a href="http://www.freecsstemplates.org" class="link1">Free CSS Templates</a></p>
</div>
</body>
		</html>
		
	</xsl:template>
	
	<xsl:template name="bodyText">
		<xsl:for-each select="//tei:div">
		<xsl:choose>
			<xsl:when test="contains(@type, 'chapter')">
				<p id="{@xml:id}"><a name="{@n}" class="paragraphnumber">[<xsl:value-of
					select="@n"/>]</a><xsl:apply-templates/></p>
			</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates/>
		</xsl:otherwise>
		</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template match="div"/>
	
	<xsl:template match="tei:i">
		<span style="font-style:italic;">
			<xsl:apply-templates/></span>
	</xsl:template>
	
</xsl:stylesheet>
