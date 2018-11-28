<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <!-- strip space allows removing all unnecessary whitespace which may appear between tags. -->
    <xsl:strip-space elements="*"/>
    <!-- preserve-space allows preserving whitespace between tags. -->
    <xsl:preserve-space elements="geogName"/>
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
                <div id="home">
                    <!-- No homepage link here because this xsl is for home page only. -->
                    <h1>Ray Bradbury</h1>
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
                    <q cite="http://www.raybradbury.com/about.html">Ray Bradbury is one of those rare individuals whose writing has changed the way people think.</q>
                    <sup class="reference">[1]</sup>
                    <br/>
                    <!-- This <xsl:apply-templates> element  selects the content of all paragraphs, apart from the last one in order to make some edits to how the content is displayed. 
                        "apply-templates" was used so as to add comma between surname and name - "Bradbury Ray" (which was deliberately deleted from the original document so that 
                        persName tag didn't have PCDATA in it), and to provide information on Ray Bradbury's death. -->
                    <p>
                        <xsl:apply-templates select="content/addInfo/para[not(position()=last())]"/>
                    </p>
                    <!-- This extracts all content of the tag list and makes further modifications on styling the list. -->
                    <ul>
                        <xsl:apply-templates select="content/addInfo/list"/>
                    </ul>
                    <!-- This displays the content of the whole paragraph and allows making an edit applying the relevant template, i.e., to add reference to the original source. -->
                    <p style="margin-bottom: 4em;">
                        <xsl:apply-templates select="content/addInfo/para[last()]"/>
                    </p>
                    <hr/>
                    <!-- This is to display references and credits. -->
                    <p class="reference">
                        <sup>[1]</sup> - 
                        <a href="http://www.raybradbury.com/about.html">http://www.raybradbury.com/about.html</a>
                    </p>
                    <p class="reference">
                        <sup>[2]</sup> - 
                        <a href="http://en.wikipedia.org/wiki/Ray_Bradbury">http://en.wikipedia.org/wiki/Ray_Bradbury</a>
                    </p>
                    <p class="reference">
                        <sup>[3]</sup> - 
                        <a href="http://mikejmoran.typepad.com/files/pedestrian-by-bradbury-1.pdf">
                            <xsl:value-of select="content/addInfo/@source"/>
                        </a>
                    </p>
                    <hr/>
                    <p id="module">INSTG037 | Olga Loboda</p>
                    <!-- All the pages refer to one CSS, the home page displays that the document was checked with W3C validator and CSS is valid. -->
                    <p>
                        <a href="http://jigsaw.w3.org/css-validator/check/referer">
                            <img style="border:0;width:88px;height:31px"
                                src="http://jigsaw.w3.org/css-validator/images/vcss-blue"
                                alt="Valid CSS!" />
                        </a>
                    </p>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <!-- This template adds comma between the children of element "persName". -->
    <xsl:template match="content/addInfo/para/persName">
        <xsl:value-of select="surname"/>, 
        <xsl:value-of select="forename"/>
    </xsl:template>
    
    <!-- This xsl element selects the element "death" with predefined attribute "@of" and adds content to it. -->
    <xsl:template match="content/addInfo/para/death[@of='Ray Bradbury']">
        <xsl:value-of select="."/>2012<sup class="reference">[2]</sup>
    </xsl:template> 
    
    <!-- This template makes the element "list" display as unordered list which could improve usability compared with original material. -->
    <xsl:template match="content/addInfo/list">
        <xsl:for-each select="bibl">
            <li>
                <xsl:value-of select="title"/>
                (<xsl:value-of select="date/year"/>);
            </li>
        </xsl:for-each>
    </xsl:template>
    
    <!-- Element xsl:template selects the whole content of the element "para" and then adds some additional information. -->
    <xsl:template match="content/addInfo/para[last()]">
        <xsl:value-of select="."/><sup class="reference">[3]</sup>
    </xsl:template>
    
</xsl:stylesheet>