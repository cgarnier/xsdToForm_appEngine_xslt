<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0">
    
    <xsl:output 
        method="html"
        encoding="UTF8"
        doctype-public="-//W3C//DTD XHTML 1.1//EN"
        doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"
        indent="yes" />
    
    
    <xsl:template match="randonnee">
        <html>
            <head>
                <title>Randonnée - <xsl:value-of select="circuit/titre"/></title>
                <style type="text/css">
 
                </style>
                <link rel="stylesheet" type="text/css" href="static/css/rando.css" />
            </head>
            <body>
                <div id="content">
                    <div id="circuit">
                        <xsl:apply-templates select="circuit" />   
                    </div>
                    <xsl:call-template name="cat">
                        <xsl:with-param name="texte">Description</xsl:with-param>
                    </xsl:call-template>
                    <div id="descImg">
                     <div id="description">
 
                         <xsl:apply-templates select="//etape"/>
                     </div>
                        <div id="images">
                            <xsl:apply-templates select="images/image"></xsl:apply-templates>
                            <div class="clear"></div>
                        </div>
                    </div>
                   
                    
                    <xsl:call-template name="cat">
                        <xsl:with-param name="texte">Fiches</xsl:with-param>
                    </xsl:call-template>
                    
                    <div id="technique">
                        <xsl:apply-templates select="fiche_technique"></xsl:apply-templates>
                    </div>
                    
                    <div id="information">
                        <xsl:apply-templates select="fiche_information"></xsl:apply-templates>
                    </div>
                    
                    
                </div>
 
            </body>
        </html>    
    </xsl:template>
    
    <xsl:template match="circuit">
        <h1><xsl:value-of select="titre"/></h1>
        <div class="big"><img src="static/img/rando/Layens/09.jpg" alt=""/></div>
        <div class="menu"><img src="static/img/rando/52.jpg" alt=""/></div>
       
        <p class="situation"><b>SITUATION : </b> <xsl:value-of select="situation"/></p>
        <p class="resume"><xsl:value-of select="resume"/></p>
        <p class="introduction"><xsl:value-of select="introduction"/></p>
        
    </xsl:template>
    <xsl:template match="personne">
        <li>
            <xsl:value-of select="@prenom" />
        </li>
    </xsl:template>
    
    <xsl:template match="etape">
        <div class="etape">
            <h3><xsl:value-of select="@numero"/> - <xsl:value-of select="lieu"/></h3>
            <h5>distance: <xsl:value-of select="@distance"/>, temps: <xsl:value-of select="@temps"/></h5>
            <p><xsl:value-of select="texte"/></p>
        </div>    
        
    </xsl:template>
    
    <xsl:template match="fiche_technique">
        <h3>Fiche technique</h3>
        <ul>
            <li><b>INFORMATION : </b> <p><xsl:value-of select="information"/></p></li>
            <li><b>RECOMMANDATIONS : </b><p> <xsl:value-of select="recommandations"/></p></li>
            <li><b>DIFFICULTE : </b> <p><xsl:value-of select="difficulte"/></p></li>
            <li><b>EPOQUE CONSEILLEE : </b> <p><xsl:value-of select="epoque_conseillee"/></p></li>
            <li><b>DENIVELE TOTAL : </b> <xsl:value-of select="denivele_total"/></li>
            <li><b>LONGUEUR TOTALE : </b> <xsl:value-of select="longueur_totale"/></li>
            <li><b>ALTITUDE DEPART : </b> <xsl:value-of select="altitude_depart"/></li>
            <li><b>ALTITUDE ARRIVEE : </b> <xsl:value-of select="altitude_arrivee"/></li>
            <li><b>ALTITUDE MAXI : </b> <xsl:value-of select="altitude_maxi"/></li>
            <li><b>HORAIRE TOTAL : </b> <xsl:value-of select="duree_totale"/></li>
            <li><b>LIEU DE DEPART : </b> <p><xsl:value-of select="depart/lieu"/></p></li>
            <li><b>LIEU D ARRIVEE : </b> <p><xsl:value-of select="arrivee/lieu"/></p></li>
            <li><b>COMMUNE PROCHE DU DEPART : </b> <p><xsl:value-of select="depart/commune"/></p></li>
            <li><b>COMMUNE PROCHE ARRIVEE : </b> <p><xsl:value-of select="arrivee/commune"/></p></li>
        </ul>
    </xsl:template>
    <xsl:template match="fiche_information">
        <h3>Fiche d'information</h3>
        <ul>
            <li><b>CARTE NECESSAIRE  : </b> <p><xsl:for-each select="cartes_necessaire/carte"><xsl:value-of select="self::carte"/></xsl:for-each></p></li>
            <li><b>CARROYAGE  : </b><xsl:value-of select="carroyage"/></li>
            <li><b>NOM  : </b><xsl:value-of select="nom"/></li>
            <li><b>ACCES ROUTIER  : </b> <p><xsl:value-of select="acces"/></p></li>
            <li><b>PARKING  : </b><p><xsl:value-of select="parking"/></p></li>
            <li><b>TYPE DE PARCOURS  : </b><p> <xsl:value-of select="type/parcours"/></p></li>
            <li><b>TYPE DE CHEMIN  : </b><p>
                
                <xsl:for-each select="type/chemins/chemin">
                    <xsl:value-of select="self::chemin"/>; 
                </xsl:for-each></p>
            </li>
            <li><b>TYPE DE TERRAIN  : </b><p>
                
                <xsl:for-each select="type/terrains/terrain">
                    <xsl:value-of select="self::terrain"/>; 
                </xsl:for-each></p>
            </li>
            <li><b>MATERIEL  : </b> <p><xsl:value-of select="materiel" /></p></li>
            
        </ul>
    </xsl:template>
    <xsl:template match="images/image">
        <div class="image">
            <xsl:element name="img">
                <xsl:attribute name="src">
                    <xsl:value-of select="@fichier"/>
                </xsl:attribute>
            </xsl:element>
            <div class="image_num"><xsl:value-of select="@numero"/></div>
        </div>
    </xsl:template>
    
    <xsl:template name="cat">
        <xsl:param name="texte"></xsl:param>
        <div class="categorie">
            <img src="static/img/rando/50.jpg" alt=""/>
            <h3><xsl:value-of select="$texte"/></h3>
        </div>
    </xsl:template>
</xsl:stylesheet>