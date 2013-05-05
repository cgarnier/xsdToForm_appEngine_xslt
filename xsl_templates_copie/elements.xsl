<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                version="1.0">


    <xsl:template match="xs:element">

        <xsl:param name="path"></xsl:param>


        <xsl:variable name="newpath">
            <xsl:value-of select="$path"/>
            <xsl:value-of select="@name"/>
            <xsl:text>/</xsl:text>
        </xsl:variable>


        <xsl:if test="@name">
            <xsl:if test="not(@type)">
                <xsl:choose>
                    <xsl:when test="xs:complexType">

                        <fieldset>

                            <legend>
                                <xsl:value-of select="@name"/>
                            </legend>
                            <xsl:call-template name="parcourir">
                                <xsl:with-param name="path">
                                    <xsl:value-of select="$newpath"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </fieldset>
                    </xsl:when>
                    <xsl:otherwise>

                        <xsl:call-template name="parcourir">
                            <xsl:with-param name="path">
                                <xsl:value-of select="$newpath"/>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>


            </xsl:if>
        </xsl:if>


        <xsl:if test="@type">
            <xsl:call-template name="printBasicElement">
                <xsl:with-param name="path">
                    <xsl:value-of select="$path"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template match="xs:complexType/xs:sequence/xs:element">
        <xsl:param name="path"></xsl:param>

        <xsl:if test="@ref">
            <xsl:call-template name="searchElementDef">
                <xsl:with-param name="name">
                    <xsl:value-of select="@ref"/>
                </xsl:with-param>
                <xsl:with-param name="path">
                    <xsl:value-of select="$path"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="@type">
            <xsl:call-template name="printBasicElement"></xsl:call-template>
        </xsl:if>

    </xsl:template>
    <xsl:template name="printBasicElement">
        <xsl:param name="path"></xsl:param>
        <xsl:if test="@name">
            <p>
                <xsl:element name="label">
                        <xsl:attribute name="for">
                        <xsl:value-of select="$path"/>
                        <xsl:value-of select="@name"/>
                    </xsl:attribute>
                    <xsl:value-of select="@name"/>
                </xsl:element>

                <xsl:element name="textarea">
                    <xsl:attribute name="rows">1</xsl:attribute>
                    <xsl:attribute name="cols">30</xsl:attribute>
                    <xsl:attribute name="name">
                        <xsl:value-of select="$path"/>
                        <xsl:value-of select="@name"/>
                    </xsl:attribute>
                </xsl:element>

            </p>
        </xsl:if>

    </xsl:template>
</xsl:stylesheet>