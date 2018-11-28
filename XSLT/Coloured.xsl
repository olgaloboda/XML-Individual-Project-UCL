<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
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
                    <!--This table creates top menu bar. -->
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
                    
                    <p>Note: different colours mark different stylistic devices and references within the context of their use. The colour of every highlighted stylistic device 
                        can be found on the left-hand side. The reference to the main character(s) - above the text in which they occur.</p>
                    
                    <div id="tropesAndFiguresList">
                        <p>Tropes:</p>
                        <ul class="small">
                            <li><span style="color:#B8B894">Epithet;</span></li>
                            <li><span style="color:#66FF33">Hyperbole;</span></li>
                            <li><span style="color:#FF0000">Metaphor;</span></li>
                            <li><span style="color:#009900">Metonymy;</span></li>
                            <li><span style="color:#FF75A3">Onomatopoeia</span></li>
                            <li><span style="color:#002E8A">Personification;</span></li>
                            <li><span style="color:#7575A3">Zeugma;</span></li>
                        </ul>
                        <p>Figures of speech:</p>
                        <ul class="small"> 
                            <li><span style="color:#B88A00">Anaphora;</span></li>
                            <li><span style="color:#A3007A">Attachment</span></li>
                            <li><span style="color:#66CCFF">Break in the Narrative;</span></li>
                            <li><span style="color:#CC00FF">Climax;</span></li>
                            <li><span style="color:#FF0066">Enumeration;</span></li>
                            <li><span style="color:#476B6B">Epiphora;</span></li>
                            <li><span style="color:#4747FF">Parallelism;</span></li>
                            <li><span style="color:#00CC99">Periphrasis;</span></li>
                            <li><span style="color:#FF9900">Simile;</span></li>
                        </ul>
                    </div>
                    <h4>Content</h4>
                    <ol>
                        <!-- This element extracts entire content of the header so as to be able to display the content (namely title and date) inside the 
                            header as it is anticipated. In addition, sorting method is applied in order to present titles in alphabetical order. -->
                        <xsl:apply-templates select="content/story/header"/>
                    </ol>
                    <!-- This is to display the content of stories and make further modification, i.e., apply different colours to different parts of the content. -->
                    <xsl:apply-templates select="content/story"/>
                    <br/>
                    <hr/>
                    <p id="module">INSTG037 | Olga Loboda</p>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <!-- This is to display the content related to unsorted titles within the XML document. -->
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
    
    <!-- This is to display the whole content of the webpage and add year if it is mentioned. -->
    <xsl:template match="content/story">
        <h3>
            <xsl:value-of select="header/bibl/title"/>
            <xsl:if test="header/bibl/date">
                (<xsl:value-of select="header/bibl/date/year"/>)
            </xsl:if>
        </h3>
        <h4> 
            by 
            <xsl:value-of select="header/bibl/author"/>
        </h4>
        <!-- This is to select the reference to a certain character from short story and change the font colour as different font colours are applied to references to different characters occurred within the text. -->
        <xsl:choose>
            <xsl:when test="@title='The Pedestrian'">
                <p>Reference to <span style="color:#009999" class="bold">Leonard Mead</span></p>
            </xsl:when>
            <xsl:when test="@title='The Dragon'">
                <p>Reference to <span style="color:#33CC33" class="bold">The Dragon</span></p>
            </xsl:when>
            <xsl:when test="@title='All Summer in a Day'">
                <p>Reference to</p> 
                <ul>
                    <li><span style="color:#FF3300" class="bold">Sun</span></li>
                    <li><span style="color:#D119A3" class="bold">Margot</span></li>
                    <li><span style="color:#00BFFF" class="bold">Children</span></li>
                </ul>
            </xsl:when>
        </xsl:choose>
        <xsl:for-each select="text/p">
            <p>
                <xsl:apply-templates select="."/>
            </p>
        </xsl:for-each>
    </xsl:template>
    
    <!-- This is to add whitespace between the children of element "persName". -->
    <xsl:template match="persName">
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
    
    <!-- This is to add whitespace between the children of element "address". -->
    <xsl:template match="address/house_number">
        <xsl:value-of select="."/>
        <xsl:text> </xsl:text>
    </xsl:template>
    
    <!-- Templates below refer only to the element defined within the xsl:template match="", such as metaphor, but not to their content, i.e., element's children.
        "//"s are used so as to get elements no matter where they are.-->
    <xsl:template match="//metaphor">
        <span style="color:#FF0000">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    <xsl:template match="//metonymy">
        <span style="color:#009900">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    
    <xsl:template match="//zeugma">
        <span style="color:#7575A3">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    <xsl:template match="//epithet">
        <span style="color:#B8B894">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    <xsl:template match="//hyperbole">
        <span style="color:#66FF33">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    <xsl:template match="//personification">
        <span style="color:#002E8A">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    <xsl:template match="//simile">
        <span style="color:#FF9900">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    <xsl:template match="//anaphora">
        <span style="color:#B88A00">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    <xsl:template match="//enumeration">
        <span style="color:#FF0066">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    <xsl:template match="//break_in_the_narrative">
        <span style="color:#66CCFF">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    <xsl:template match="//attachment">
        <span style="color:#A3007A">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    <xsl:template match="//climax">
        <span style="color:#CC00FF">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    <xsl:template match="//epiphora">
        <span style="color:#476B6B">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    <xsl:template match="//parallelism">
        <span style="color:#4747FF">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    <xsl:template match="//periphrasis">
        <span style="color:#00CC99">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    <xsl:template match="//onomatopoeia">
        <span style="color:#FF75A3">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    
    <!-- This is to create a path to a particular character/characters mentioned using the element "reference" and display the reference to 
        characters where they appear. -->
    <xsl:template match="//reference">
        <xsl:choose>
            <xsl:when test="@to='Leonard Mead'">
                <span style="color:#009999" class="bold">
                    <xsl:value-of select="."/>
                </span>
            </xsl:when>
            
            <xsl:when test="@to='Margot'">
                <span style="color:#D119A3" class="bold">
                    <xsl:value-of select="."/>
                </span>
            </xsl:when>
            
            <xsl:when test="@to='sun'">
                <span style="color:#FF3300" class="bold">
                    <xsl:value-of select="."/>
                </span>
            </xsl:when>
            
            <xsl:when test="@to='children'">
                <span style="color:#00CCFF" class="bold">
                    <xsl:value-of select="."/>
                </span>
            </xsl:when>
            
            <xsl:when test="@to='dragon'">
                <span style="color:#33CC33" class="bold">
                    <xsl:value-of select="."/>
                </span>
            </xsl:when>
            
            <xsl:otherwise>
                <xsl:value-of select="."/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- This is to apply particular style to the element "emph". -->
    <xsl:template match="//emph">
        <span style="font-style:italic;">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    
</xsl:stylesheet>