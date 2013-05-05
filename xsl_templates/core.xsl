<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="1.0">

    
    <xsl:template name="parcourir">
        <xsl:param name="path"></xsl:param>
        <xsl:if test="xs:complexType/xs:attribute">
            <h3>Attributs:</h3>
        </xsl:if>
        <!--<xsl:element name="div">
            <xsl:attribute name="class"><xsl:text>attributes</xsl:text></xsl:attribute>
        -->
        <xsl:apply-templates select="xs:complexType/xs:attribute">
            <xsl:with-param name="path"><xsl:value-of select="$path"/></xsl:with-param>
        </xsl:apply-templates>
        <!--</xsl:element>-->
        <xsl:if test="xs:complexType/xs:sequence">
            <xsl:if test="xs:complexType/xs:sequence[@maxOccurs]">
                <xsl:if test="xs:complexType/xs:sequence[@maxOccurs = 'unbounded']">
                    <input type="button" class="addbtn" value="+"></input>
                </xsl:if>
            </xsl:if>
            <xsl:apply-templates select="xs:complexType/xs:sequence/xs:element">
                <xsl:with-param name="path"><xsl:value-of select="$path"/></xsl:with-param>
            </xsl:apply-templates>
        </xsl:if>
        
        <xsl:if test="xs:simpleType">
            <xsl:apply-templates select="xs:simpleType">
                <xsl:with-param name="path"><xsl:value-of select="$path"/></xsl:with-param>
            </xsl:apply-templates>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="searchElementDef">
        <xsl:param name="name"></xsl:param>
        <xsl:param name="path"></xsl:param>
        
        
        <xsl:apply-templates select="/xs:schema/xs:element[@name=$name]">
            <xsl:with-param name="path"><xsl:value-of select="$path"/></xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>
    
    <xsl:template name="searchAttributeDef">
        <xsl:param name="name"></xsl:param>
        <xsl:param name="path"></xsl:param>
        
        
        <xsl:apply-templates select="/xs:schema/xs:attribute[@name=$name]">
            <xsl:with-param name="path"><xsl:value-of select="$path"/></xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>
</xsl:stylesheet>