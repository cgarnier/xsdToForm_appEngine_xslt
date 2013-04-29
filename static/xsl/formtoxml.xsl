<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    
    
    <xsl:template match="form/fieldset[1]">
        <xsl:apply-templates select="input"></xsl:apply-templates>
        <xsl:apply-templates select="fieldset"></xsl:apply-templates>
        
    </xsl:template>
    <xsl:template match="fieldset">
        jklj
        <xsl:apply-templates select="input"></xsl:apply-templates>
        <xsl:apply-templates select="fieldset"></xsl:apply-templates>
        
    </xsl:template>
    
    
    <xsl:template match="input">
        lkmlk
        <xsl:element name="{@name}">hh<xsl:value-of select="@value"/></xsl:element>
    </xsl:template>
</xsl:stylesheet>