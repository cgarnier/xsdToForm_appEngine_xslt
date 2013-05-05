<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="1.0">
    <xsl:template match="xs:simpleType">
        <xsl:param name="path"></xsl:param>
        <xsl:apply-templates select="xs:restriction">
            <xsl:with-param name="path"><xsl:value-of select="$path"/></xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>
</xsl:stylesheet>