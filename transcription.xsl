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
					<h1><xsl:value-of select="//tei:title"/></h1>
					<h2>A Music Theory Text from the Fourteenth Century</h2>
				</div>
				<div id="menu">
					<ul>
						<li><a href="home.xml">Home</a> </li>
						<li><a href="transcriptions.html">Transcriptions</a></li>
						<li><a href="translation.xml">Translation</a></li>
						<li><a href="files.html">Files</a></li>
						<li><a href="about.html">About</a> </li>
					</ul>
				</div>
				<div id="content">
					
					<div id="left">
						<h2><xsl:value-of select="//tei:settlement"/><xsl:text>, </xsl:text>
							<xsl:value-of select="//tei:repository"/><xsl:text>, </xsl:text>
							<xsl:value-of select="//tei:idno"/></h2>
						<p> <br/><br/></p>
							<xsl:apply-templates />
						<div id="footer">
							<xsl:call-template name="footnote"/>
						</div>
					</div>
					<div id="right">
						<xsl:call-template name="imageContent"/>
					</div>
				</div>
				<div id="footer">
					<p> Copyright @Creative Commons 2011. Designed by <a href="http://www.freecsstemplates.org" class="link1">Free CSS Templates</a></p>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="//tei:div[@corresp]">
		<xsl:choose>
			<xsl:when test="contains(@type, 'chapter')">
				<p id="{@xml:id}"><a name="{@n}" class="paragraphnumber">[<xsl:value-of
					select="@n"/>]</a>
					<xsl:apply-templates/>
				</p>
					<!-- <div id="translationText">
						<p id="{@xml:id}Trans" class="hidden">
							 <xsl:for-each select="tokenize(@corresp, '\div+')"> 
								<xsl:variable name="baseDoc" select="substring-before(.,'#')"/>
								<xsl:variable name="fragment" select="substring-after(.,'#')"/>
								<xsl:variable name="otherDoc" select="doc($baseDoc )"/>
							 	<xsl:value-of select="$otherDoc/id($fragment)"/>
							</xsl:for-each>
						</p>
					</div> -->
				</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="imageContent">
		<h2>Images<xsl:text> </xsl:text> 
			<script type="text/javascript">
			// Popup window code
			function newPopup(url) {
			popupWindow = window.open(
			url,'popUpWindow','height=700,width=800,left=10,top=10,screenX="400",resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes')
			}
			</script>

			<!-- <a href="Javascript:newPopup('../omni/Sc/Sc63r.htm');">Launch viewer</a> -->
		</h2>
		<p><i>Images are reproduced here with the kind permission of the <xsl:value-of
			select="//tei:repository"></xsl:value-of>, <xsl:value-of
				select="//tei:settlement"></xsl:value-of> and may not be downloaded.</i></p>
		<xsl:for-each select="//tei:pb">
			<hr/>[folio <xsl:value-of select="@n"/>] 
			<a href="Javascript:newPopup('../zoomify/{@xml:id}.htm');">CLICK TO ZOOM</a><br />
			<!-- testing code to protect images 
			<div id="image1" style="background-image: url({@facs});">
				<img src="blank.gif" height="631px" width="459px"/>
			</div>-->
			<img src="{@facs}" />
			<xsl:apply-templates/>
		</xsl:for-each>
	</xsl:template>
	
	<!--<xsl:template name="musicExamples">
		<xsl:for-each select="//tei:graphic">
			<xsl:variable name="graphicURL"><xsl:value-of select="//tei:graphic/@url"/></xsl:variable>
			<img src="../omni/images/{graphicURL}" alt="altTextGoesHere"/>
		</xsl:for-each>
	</xsl:template>-->
	
		
	<!-- <xsl:template name="getPar4">
		<h4>Chicago</h4>
		<p><xsl:value-of select="normalize-space(//tei:div/id('omnid4'))"/></p>
		<h4>Seville</h4>
		<xsl:variable name="wit2" select="doc('seville.xml')"/>
		<p><xsl:value-of select="normalize-space($wit2/id('ScC4'))"/></p>
		<h4>Translation</h4>
		<xsl:variable name="trans" select="doc('translation.xml')"/>
		<p><xsl:value-of select="normalize-space($trans/id('trans4'))"/></p>
	</xsl:template> -->
	
</xsl:stylesheet>
