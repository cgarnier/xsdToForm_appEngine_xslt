<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                version="1.0">
    <xsl:template match="xs:attribute">

        <xsl:param name="path"></xsl:param>

        <xsl:if test="@ref">
            <xsl:variable name="newpath">
                <xsl:value-of select="$path"/>
                <xsl:text>@</xsl:text>
                <xsl:value-of select="@ref"></xsl:value-of>
            </xsl:variable>
            <xsl:call-template name="searchAttributeDef">

                <xsl:with-param name="name">
                    <xsl:value-of select="@ref"/>
                </xsl:with-param>
                <xsl:with-param name="path">
                    <xsl:value-of select="$newpath"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="@name">
            <p class="attribute">
                <xsl:element name="label">
                    <xsl:attribute name="for">
                        

                        <xsl:value-of select="@name"/>
                    </xsl:attribute>
                    <xsl:text>@</xsl:text>
                    <xsl:value-of select="@name"/>
                </xsl:element>
                <xsl:element name="input">
                    <xsl:attribute name="type">text</xsl:attribute>
                    <xsl:attribute name="name">
                        

                        <xsl:value-of select="@name"></xsl:value-of>
                    </xsl:attribute>
                </xsl:element>
            </p>
        </xsl:if>
    </xsl:template>

    <xsl:template match="/xs:schema/xs:attribute">

        <xsl:param name="path"></xsl:param>


        <xsl:variable name="newpath">
            <xsl:value-of select="$path"/>
            <xsl:value-of select="@name"/>
            <xsl:text>/</xsl:text>
        </xsl:variable>


        <xsl:if test="@name">

            <xsl:if test="@type">

                <xsl:call-template name="printBasicAttribute">
                    <xsl:with-param name="path">
                        <xsl:value-of select="$path"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    <xsl:template name="printBasicAttribute">
        <xsl:param name="path"></xsl:param>
        <xsl:if test="@name">
            <p class="attribute">
                <xsl:element name="label">
                    <xsl:attribute name="for">

                        <xsl:value-of select="@name"/>
                    </xsl:attribute>
                    <xsl:text>@</xsl:text>
                    <xsl:value-of select="@name"/>
                </xsl:element>
                
                <xsl:element name="input">
                    <xsl:attribute name="type">text</xsl:attribute>
                    
                    <xsl:attribute name="name">

                        <xsl:value-of select="@name"/>
                    </xsl:attribute>
                    <xsl:attribute name="value"><xsl:value-of select="@type"/></xsl:attribute>
                    
                </xsl:element>
                
            </p>
        </xsl:if>
        
    </xsl:template>

</xsl:stylesheet>