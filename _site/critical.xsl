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
                
                <script type="text/javascript">
                    function changeme(id, action) {
                    
                    	 if (action=="hide") {
                    
                    			document.getElementById(id).style.display = "none";
                    
                    	 } else {
                    
                    			document.getElementById(id).style.display = "block";
                    
                    	 }
                    
                    }
			    </script>
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
                        <li><a
                            href="translation.xml">Translation</a></li>
                        <li><a href="files.html">Files</a></li>
                        <li><a href="about.html">About</a> </li>
                        <li><a href="http://www.arsmusicae.org/wordpress/">Blog</a></li> 
                    </ul>
                </div>
                <div id="content">
                    
                    <div id="left">
                        <h2>Critical Edition</h2>
                        <xsl:apply-templates/>
                    </div>
                    <div id="right">
                        <h2>Variant readings</h2>
                        <xsl:call-template name="variants"/>
                    </div>
                </div>
                <div id="footer">
                    <p> Copyright @Creative Commons 2011. Designed by <a href="http://www.freecsstemplates.org" class="link1">Free CSS Templates</a></p>
                </div>
            </body>
        </html>
        
    </xsl:template>
     
    <!-- <xsl:template match="tei:p">
        <xsl:variable name="id"><xsl:number level="any" from="tei:text"/></xsl:variable>
        <p id="{@xml:id}" class="paragraphChapter"><a name="{$id}"
            class="paragraphnumber">[<xsl:number level="any"
                from="tei:text"/>]</a>
                <xsl:apply-templates/>
                <span class="paragraphmenu"><a
                    class="paragraphmenu">Paragraph Menu</a></span></p><div class="paradiv"
                    id="{@xml:id}" style="display: none;"></div> </p>
    </xsl:template>
    
    <xsl:template match="div"/> -->
    
    <xsl:template match="//tei:div[@corresp]">
        <xsl:choose>
            <xsl:when test="contains(@type, 'chapter')">
                <p id="{@xml:id}"><a name="{@n}" class="paragraphnumber">[<xsl:value-of
                    select="@n"/>]</a>
                    <xsl:apply-templates/></p>
                
                    <!-- <xsl:for-each select="tokenize(@corresp, '\div+')"> 
                    <xsl:variable name="baseDoc" select="substring-before(.,'#')"/>
                    <xsl:variable name="fragment" select="substring-after(.,'#')"/>
                    <xsl:variable name="otherDoc" select="doc($baseDoc )"/>
                        <span onclick="changeme('translationText', 'hide');" style="text-decoration: underline; cursor: pointer;">Hide</span><xsl:text> </xsl:text>
                        <span onclick="changeme('translationText', 'show');" style="text-decoration: underline; cursor: pointer;">Show</span>
                    <div id="translationText"><xsl:value-of select="$otherDoc/id($fragment)"/></div>
                    
                    </xsl:for-each>-->
            </xsl:when>
            <xsl:otherwise/>
        </xsl:choose>
    </xsl:template>
          
    <xsl:template match="tei:lem">
        <xsl:apply-templates/>
    </xsl:template>
        
    <xsl:template match="tei:rdg"> 
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:app">
        <xsl:variable name="id"><xsl:number count="//tei:app" level="any" format="1"/></xsl:variable>
        <xsl:apply-templates select="tei:lem"/><sup><a href="#variant{$id}" name="variantreference{$id}" class="footnote"><xsl:copy-of select="$id"/></a></sup>
    </xsl:template> 
    
    <xsl:template name="variants">
        
        <ul class="variantlist">
            <xsl:for-each select="//tei:app">
                
                <xsl:variable name="id">
                    <xsl:number count="//tei:app" level="any" format="1"/>
                </xsl:variable>
                
                <li id="variant{$id}"><a href="#variantreference{$id}"><xsl:copy-of select="$id"/></a><xsl:text> </xsl:text>
                    <xsl:apply-templates select="tei:lem"/>]
                    <!-- <xsl:apply-templates select="tei:rdg"/>-->
                    <xsl:for-each select="tei:rdg">
                        <xsl:choose>
                            <xsl:when test="contains(@type, 'omissio')">
                                <xsl:text> </xsl:text><xsl:value-of select="."/><xsl:text> </xsl:text>
                                <em><xsl:text>om. </xsl:text></em><xsl:text> </xsl:text>
                                <span style="witnessName"><xsl:value-of
                                    select="substring-after(@wit,'#')"/></span><xsl:text>   </xsl:text>
                            </xsl:when>
                            <xsl:when test="contains(@type, 'add')">
                                <xsl:value-of select="."/><xsl:text> </xsl:text>
                                <em><xsl:value-of select="@type"/></em><xsl:text> </xsl:text>
                                <xsl:value-of select="substring-after(@wit,'#')"/><xsl:text>   </xsl:text>
                            </xsl:when>
                            <!-- <xsl:when test="contains(@type, 'add.sed.del.')">
                                <xsl:value-of select="tei:del/tei:add"/><xsl:text> </xsl:text>
                                <em><xsl:value-of select="@type"/></em><xsl:text> </xsl:text>
                                <xsl:value-of select="substring-after(@wit,'#')"/><xsl:text>   </xsl:text>
                                </xsl:when>
                                <xsl:when test="contains(@type, 'corr.')">
                                <xsl:value-of select="tei:subst/tei:add"/><xsl:text> </xsl:text>
                                <em>corr. ex</em><xsl:text> </xsl:text>
                                <xsl:value-of select="tei:subst/tei:del"/><xsl:text> </xsl:text>
                                <xsl:value-of select="substring-after(@wit,'#')"/><xsl:text>   </xsl:text>
                                </xsl:when>  -->  
                            <xsl:otherwise>
                                <xsl:text> </xsl:text><xsl:value-of select="."/><xsl:text> </xsl:text>
                                <span style="witnessName"><xsl:value-of
                                    select="substring-after(@wit,'#')"/></span><xsl:text>   </xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </li>  
            </xsl:for-each>
        </ul>
        
    </xsl:template>
    
</xsl:stylesheet>
