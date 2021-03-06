<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="1.0">
    <xsl:template match="xs:pattern">
        <xsl:param name="path"></xsl:param>
        <xsl:element name="label">
            <xsl:attribute name="for"><xsl:value-of select="$path"></xsl:value-of></xsl:attribute>
            <xsl:value-of select="ancestor::xs:element/@name"/>
        </xsl:element>
        <xsl:element name="input">
            <xsl:attribute name="name"><xsl:value-of select="$path"/></xsl:attribute>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>