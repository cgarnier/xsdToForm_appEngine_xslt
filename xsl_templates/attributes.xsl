<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="1.0">
    <xsl:template match="xs:attribute">
        <xsl:param name="path"></xsl:param>
        <label>@<xsl:value-of select="@name"/></label>
        <xsl:element name="input">
            <xsl:attribute name="type">text</xsl:attribute>
            <xsl:attribute name="name"><xsl:value-of select="$path"/></xsl:attribute>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>