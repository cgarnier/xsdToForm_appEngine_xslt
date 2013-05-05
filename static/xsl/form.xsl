<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    
    version="1.0">
    <xsl:template match="form">

        <xsl:apply-templates select="fieldset"></xsl:apply-templates>
            
        
    </xsl:template>
    
    <xsl:template match="fieldset">
        <xsl:element name="{legend}">
            
            <xsl:apply-templates select="div[@class='attributes']/p/input"></xsl:apply-templates>
            
            <xsl:apply-templates select="p/textarea"></xsl:apply-templates>
            
            
            
        <xsl:apply-templates select="fieldset"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="div/p/input">
        <xsl:attribute name="{@name}"><xsl:value-of select="@value"/></xsl:attribute>
    </xsl:template>
    <xsl:template match="p/textarea">
        <xsl:element name="{@name}"><xsl:value-of select="text()"/></xsl:element>
    </xsl:template>
</xsl:stylesheet>