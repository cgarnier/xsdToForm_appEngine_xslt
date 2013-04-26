<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="1.0">
    <xsl:template match="xs:restriction">
        <xsl:param name="path"></xsl:param>
        
        <xsl:apply-templates select="xs:pattern">
            <xsl:with-param name="path"><xsl:value-of select="$path"/></xsl:with-param>
        </xsl:apply-templates>
        
        <xsl:if test="xs:enumeration">
            <xsl:element name="select">
                <xsl:attribute name="name"><xsl:value-of select="$path"/></xsl:attribute>
                
                <xsl:apply-templates select="xs:enumeration">
                    <xsl:with-param name="path"><xsl:value-of select="$path"/></xsl:with-param>
                </xsl:apply-templates>
            </xsl:element>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="xs:enumeration">
        <xsl:param name="path"></xsl:param>
        <xsl:element name="option">
            <xsl:attribute name="value">
                <xsl:value-of select="position()"/>
                
            </xsl:attribute>
            <xsl:value-of select="@value"/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>