<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <!-- strip-space should have deleted space after elements specified as values of the attribute "elements". However, it doesn't work in all cases. -->
    <xsl:strip-space elements="address date"/>
    <xsl:strip-space elements="personification anaphora metaphor"/>
    <xsl:strip-space elements="enumeration epiphora periphrasis"/>
    <xsl:template match="/">
        <html>
            <head>
                <meta http-equiv="Content-Language" content="en-gb"/>
                <meta content="author" name="Olga Loboda"/>
                <meta content="module" name="INSTG037"/>
                <meta content="lecturer" name="Simon Mahony"/>
                <title>Ray Bradbury's short stories</title>
                <link rel="stylesheet" type="text/css" href="../CSS/bradbury.css"/>
            </head>
            <body>
                <div>
                    <h1>
                        <a href="../XHTML/HomePage.html">Ray Bradbury</a>
                    </h1>
                    <h2>Short Stories</h2>
                    <hr/>
                    <!-- This table creates top menu bar. -->
                    <table>
                        <tr>
                            <td>
                                <a href="../XHTML/ReadAll.html">Read</a>
                            </td>
                            <td>
                                <a href="../XHTML/Stylistics.html">Stylistic devices</a>
                            </td>
                            <td>
                                <a href="../XHTML/Coloured.html">Devices in context</a>
                            </td>
                            <td>
                                <a href="../XHTML/Miscellaneous.html">Miscellaneous</a>
                            </td>
                        </tr>
                    </table>
                    <hr/>
                    <h4>Content</h4>
                    <!-- 
                        This is to extract entire content of the element "header" so as to be able to display the content (namely children "title" and "date" from the root
                        "header") as it is anticipated. In addition, sorting method was applied in order to present titles in alphabetical order. 
                    -->
                    <ol>
                        <xsl:apply-templates select="content/story/header">
                            <xsl:sort select="bibl/title"/>
                        </xsl:apply-templates>
                    </ol>
                    <!-- 
                        This is to display the stories for reading purposes. In order to improve usability, stories were reordered and positioned in 
                        alphabetical order which also responds to the content list above. 
                    -->
                    <xsl:apply-templates select="content/story">
                        <xsl:sort select="@title" data-type="text"/>
                    </xsl:apply-templates>
                    <br/>
                    <hr/>
                    <p id="module">INSTG037 | Olga Loboda</p>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <!-- This is to display the content related to previously sorted titles within the XML document. -->
    <xsl:template match="content/story/header">
        <xsl:for-each select="bibl">
            <li>
                <xsl:value-of select="title"/>
                <xsl:if test="date">
                    (<xsl:value-of select="date/year"/>)
                </xsl:if>
            </li>
        </xsl:for-each>
    </xsl:template>
    
    <!--This is to display the whole content of webpage. -->
    <xsl:template match="content/story">
        <h3>
            <!-- This selects title and then embeds year to it if the year is mentioned. -->
            <xsl:value-of select="header/bibl/title"/>
            <xsl:if test="header/bibl/date">
                (<xsl:value-of select="header/bibl/date/year"/>)
            </xsl:if>
        </h3>
        <h4> 
            by
            <!-- This finds the reference to the author of short story. -->
            <xsl:apply-templates select="header/bibl/author"/>
        </h4>
        <!-- This selects and displays the whole content of the tag 'p'. -->
        <xsl:for-each select="text/p">
            <p>
                <xsl:apply-templates select="."/>
            </p>
        </xsl:for-each>
        
        <hr/>
        <!-- This creates the reference to the original document which was further modified with xml and xslt. -->
        <p class="source">Original document of
            "<xsl:value-of select="header/bibl/title"/>"
            <br/>
            <xsl:for-each select="header/meta">
                <xsl:value-of select="@source"/>
            </xsl:for-each>
        </p>
        <hr/>
    </xsl:template>
    
    <!-- This is to add space between the children of element "persName". -->
    <xsl:template match="//persName">
        <xsl:if test="persTitle">
            <xsl:value-of select="persTitle"/>
            <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:if test="forename">
            <xsl:value-of select="forename"/>
        </xsl:if>
        <xsl:if test="surname">
            <xsl:text> </xsl:text>
            <xsl:value-of select="surname"/>
        </xsl:if>
    </xsl:template>
    
    <!-- This is to add space between the children of element "address". -->
    <xsl:template match="//address/house_number">
        <xsl:value-of select="."/>
        <xsl:text> </xsl:text>
    </xsl:template>
    
    <!-- This is to change the style of element "emph". -->
    <xsl:template match="//emph">
        <span style="font-style:italic">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
</xsl:stylesheet>