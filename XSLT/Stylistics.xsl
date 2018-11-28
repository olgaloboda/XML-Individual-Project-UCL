<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
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
                    
                    <h3>Tropes from short stories</h3>
                    <!-- This is to extract data from particular tag. As the position of tags is floating, exact path wasn't specified, and thus "//" is added. -->
                    <table class="full">
                        <tr class="full">
                            <th class="full" colspan="2">Metaphor</th>
                        </tr>
                        <xsl:for-each select="content/story/text/p//metaphor">
                            <tr class="full">
                                <td class="full" colspan="2">
                                    <xsl:value-of select="."/>
                                </td>
                            </tr>
                        </xsl:for-each>
                        
                        <tr class="full" >
                            <th class="full" colspan="2">Metonymy</th>
                        </tr>
                        <xsl:for-each select="content/story/text/p//metonymy">
                            <tr class="full">
                                <td class="full">
                                    <xsl:value-of select="."/>
                                    <xsl:text> </xsl:text>
                                </td>
                                <td class="full">
                                    <!-- 
                                        As the data displayed was not comprehensive without the reference to what metonymy represents, the value of attribute
                                        "ref" is also extracted. 
                                    -->
                                    reference to <xsl:value-of select="@ref"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                        
                        <tr class="full">
                            <th class="full" colspan="2">Zeugma</th>
                        </tr>
                        <xsl:for-each select="content/story/text/p//zeugma">
                            <tr class="full">
                                <td class="full" colspan="2">
                                    <xsl:value-of select="."/>
                                </td>
                            </tr>
                        </xsl:for-each>
                        
                        <tr class="full">
                            <th class="full" colspan="2">Epithet</th> 
                        </tr>
                        <xsl:for-each select="content/story/text/p//epithet">
                            <tr class="full">
                                <td class="full" colspan="2">
                                    <xsl:value-of select="."/>
                                    <xsl:text> </xsl:text>
                                    <!-- 
                                        As the data displayed was not very comprehensive without a noun which epithet refers to, value 
                                        of attribute "ref" is also extracted. 
                                    -->
                                    <xsl:value-of select="@ref"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                        
                        <tr class="full">
                            <th class="full" colspan="2">Personification</th>
                        </tr>
                        <xsl:for-each
                            select="content/story/text/p//personification">
                            <tr class="full">
                                <td class="full" colspan="2">
                                    <xsl:value-of select="."/>
                                </td>
                            </tr>
                        </xsl:for-each>
                        
                        <tr class="full">
                            <th class="full" colspan="2">Hyperbole</th>
                        </tr>
                        <xsl:for-each select="content/story/text/p//hyperbole">
                            <tr class="full">
                                <td class="full" colspan="2">
                                    <xsl:value-of select="."/>
                                </td>
                            </tr>
                        </xsl:for-each>
                        
                        <tr class="full">
                            <th class="full" colspan="2">Onomatopoeia</th>
                        </tr>
                        <xsl:for-each select="content/story/text/p//onomatopoeia">
                            <tr class="full">
                                <td class="full" colspan="2">
                                    <xsl:value-of select="."/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                    
                    <h3>Figures of speech from short stories</h3>
                    <table class="full" style="margin-bottom:-20px;">
                        <tr class="full">
                            <th class="full" colspan="2">Simile</th>
                        </tr>
                        <xsl:for-each select="content/story/text/p//simile">
                            <tr class="full">
                                <td class="full">
                                    <xsl:value-of select="."/>
                                </td>
                            </tr>
                        </xsl:for-each>
                        
                        <tr class="full">
                            <th class="full" colspan="2">Anaphora</th>
                        </tr>
                        <xsl:for-each select="content/story/text/p//anaphora">
                            <tr class="full">
                                <td class="full" colspan="2">
                                    <xsl:value-of select="."/>
                                </td>
                            </tr>
                        </xsl:for-each>
                        
                        <tr class="full">
                            <th class="full" colspan="2">Enumeration</th>
                        </tr>
                        <xsl:for-each select="content/story/text/p//enumeration">
                            <tr class="full">
                                <td class="full" colspan="2">
                                    <xsl:value-of select="."/>
                                </td>
                            </tr>
                        </xsl:for-each>
                        
                        <tr class="full">
                            <th class="full" colspan="2">Break in the Narrative</th>
                        </tr>
                        <xsl:for-each select="content/story/text/p//break_in_the_narrative">
                            <tr class="full">
                                <td class="full" colspan="2">
                                    <xsl:value-of select="."/>
                                </td>
                            </tr>
                        </xsl:for-each>
                        
                        <tr class="full">
                            <th class="full" colspan="2">Attachment</th>
                        </tr>
                        <xsl:for-each select="content/story/text/p//attachment">
                            <tr class="full">
                                <td class="full" colspan="2">
                                    <xsl:value-of select="."/>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <tr class="full">
                            <th class="full" colspan="2">Climax</th>
                        </tr>
                        <xsl:for-each select="content/story/text/p//climax">
                            <tr class="full">
                                <td class="full" colspan="2">
                                    <xsl:value-of select="."/>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <tr class="full">
                            <th class="full" colspan="2">Epiphora</th>
                        </tr>
                        <xsl:for-each select="content/story/text/p//epiphora">
                            <tr class="full">
                                <td class="full" colspan="2">
                                    <xsl:value-of select="."/>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <tr class="full">
                            <th class="full" colspan="2">Parallelism</th>
                        </tr>
                        <xsl:for-each select="content/story/text/p//parallelism">
                            <tr class="full">
                                <td class="full" colspan="2">
                                    <xsl:value-of select="."/>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <tr class="full">
                            <th class="full" colspan="2">Periphrasis</th>
                        </tr>
                        <xsl:for-each select="content/story/text/p//periphrasis">
                            <tr class="full">
                                <td class="full" colspan="2">
                                    <xsl:value-of select="."/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                    <br/>
                    <hr/>
                    <p id="module">INSTG037 | Olga Loboda</p>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>