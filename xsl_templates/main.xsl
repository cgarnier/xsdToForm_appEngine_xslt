<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="1.0">

    <xsl:import href="elements.xsl"/>
    <xsl:import href="core.xsl"/>
    <xsl:import href="attributes.xsl"/>
    
    
    <xsl:import href="types/simpletypes/simpletype.xsl"/>
    <xsl:import href="types/simpletypes/patterns.xsl"/>
    <xsl:import href="types/simpletypes/restrictions.xsl"/>
    
    <!--<xsl:output method="xml"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" 
        doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" /> -->
    
    <xsl:template match="xs:schema">
        <!--<html>
            <head></head> <body>--><form id="theform">
            <xsl:apply-templates select="xs:element[1]">
                <xsl:with-param name="path">/</xsl:with-param>
            </xsl:apply-templates>
           </form><!--</body>
        </html>-->
    </xsl:template>
</xsl:stylesheet>