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
                    <table class="full">
                        <tr class="full">
                            <th class="full">Geographical name</th>
                            <td class="full">
                                <ul>
                                    <!--  
                                            Considering geogName's position is not stable, path has three options. Improving usability (and to 
                                            show different sorting metods), the data is also arranged in alphabetical order as it is purely textual and value of 
                                            location attribute was added where it was mentioned in XML. 
                                    -->
                                    <xsl:for-each select="content/story/text/p/./geogName | */geogName | ../geogName | //geogName">
                                        <xsl:sort select="*" data-type="text"/>
                                        <li><xsl:value-of select="."/>
                                            <xsl:if test="*/@location">
                                                (<xsl:value-of select="*/@location"/>)
                                            </xsl:if>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </td>
                        </tr>
                        <tr class="full">
                            <th class="full">Origanisation</th>
                            <td class="full">
                                <ul>
                                    <!-- 
                                        As orgName has two paths which are both children of "p" tag, an asterisk is used. Attribute "type" reveals whether 
                                        organisation is fictional or existing.
                                    -->
                                    <xsl:for-each select="content/story/text/p/*/orgName">
                                        <li>
                                            <xsl:value-of select="."/>
                                            <xsl:if test="@type">
                                                (<span style="color:#1F5C99; font-style:italic;"><xsl:value-of select="@type"/></span>)
                                            </xsl:if>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </td>
                        </tr>
                        <tr class="full">
                            <th class="full">Address</th>
                            <td class="full">
                                <ul>
                                    <!-- 
                                       As address has two paths which are both children of "p" tag, an asterisk is used matching any element's node. 
                                        Attribute "type" reveals whether address is fictional or existing.
                                    -->
                                    <xsl:for-each select="content/story/text/p/*/address">
                                        <li><xsl:value-of select="."/>
                                            <xsl:if test="@type">
                                                (<span style="color:#1F5C99; font-style:italic;"><xsl:value-of select="@type"/></span>)
                                            </xsl:if></li>
                                    </xsl:for-each>
                                </ul>
                            </td>
                        </tr>
                        <tr class="full">
                            <th class="full">Event</th>
                            <td class="full">
                                <ul>
                                    <!-- As element "event" appeared only once in the XML document, direct path is specified. -->
                                    <xsl:for-each select="content/story/text/p/sp/event">
                                        <li>
                                            <xsl:value-of select="."/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </td>
                        </tr>
                        <tr class="full">
                            <th class="full">Date (years only)</th>
                            <td class="full">
                                <ul>
                                    <!-- Element for-each extracts the years and sorts them in descending order. Considering the date may appear within different tags, /./ allows selecting the current node dynamically.-->
                                    <xsl:for-each select="content/story/text/p/./date/year">
                                        <xsl:sort select="." data-type="number" order="descending"/>
                                        <li>
                                            <xsl:value-of select="."/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </td>
                        </tr>
                    </table>
                    <br/>
                    <hr/>
                    <p id="module">INSTG037 | Olga Loboda</p>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>