<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" exclude-result-prefixes="tei"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:output method="html" version="4.01" encoding="utf-8" indent="yes" doctype-system="http://www.w3.org/TR/html4/strict.dtd" doctype-public="-//W3C//DTD HTML 4.01//EN" />

    <xsl:template match="//tei:fileDesc" />

    <xsl:template match="//tei:encodingDesc" />

    <xsl:template match="//tei:front" />

    <xsl:template match="//tei:witness"/>

    <xsl:template match="tei:lb">
        <br/><xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:pb">
        <hr/>[folio <xsl:value-of select="@n"/>]<br/>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:graphic">
        <br/><a href="Javascript:newPopup('../large/{@url}');"><img src="../{@url}" alt="altTextGoesHere"/></a>
    </xsl:template>

    <xsl:template match="tei:hi">
        <span style="color:#cd5c5c;font-weight:bold;font-size: 150%">
            <xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="tei:ref">
        <a href="{@target}"><xsl:apply-templates/></a>
    </xsl:template>

    <xsl:template match="choice"/>

    <xsl:template match="tei:sic">
        <span class="error"><xsl:value-of select="."/></span>
    </xsl:template>

    <xsl:template match="tei:expan">
        <xsl:text> </xsl:text><span class="emendation">[<em>expan.</em>
            <xsl:text> </xsl:text><xsl:value-of select="."/>]<xsl:text> </xsl:text></span>
    </xsl:template>

    <xsl:template match="tei:corr">
        <xsl:text> </xsl:text><span class="emendation">[<em>corr.</em>
            <xsl:text> </xsl:text><xsl:value-of select="."/>]<xsl:text> </xsl:text></span>
    </xsl:template>

    <xsl:template match="tei:del">
        <xsl:text> </xsl:text><span class="scribalDeletion" style="text-decoration: line-through;"><xsl:value-of select="."/></span><xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:note">
        <xsl:variable name="id"><xsl:number count="//tei:note" level="any" format="a"/></xsl:variable>
        <sup><a href="#footnote{$id}" name="footnotereference{$id}" class="footnote"><xsl:copy-of select="$id"/></a></sup>
    </xsl:template>

    <xsl:template name="footnote">
        <ul><xsl:for-each select="//tei:note">
            <xsl:variable name="id"><xsl:number count="//tei:note" level="any" format="a"/></xsl:variable>
            <li id="footnote{$id}"><a href="#footnotereference{$id}"><xsl:copy-of select="$id"/></a><xsl:apply-templates/></li>
        </xsl:for-each>
        </ul>
    </xsl:template>

</xsl:stylesheet>
