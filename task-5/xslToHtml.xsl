<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <style type="text/css"/>
                <link rel="stylesheet" type="text/css" href="myStyle2.css"/>
                <title>WELCOME TO LIBRARY</title>
            </head>
            <body>
                <table class="authorTable">
                    <tr>
                        <th>
                            Autor:
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <xsl:value-of select="/task5/authorInfo/author"/>

                        </td>
                    </tr>
                    <tr>
                        <th>Numer indeksu:</th>
                    </tr>
                    <tr>
                        <td>
                            <xsl:value-of select="/task5/authorInfo/index"/>
                        </td>
                    </tr>
                </table>
                <table class="infoTable">
                    <tr>
                        <th>Identyfikator książki</th>
                        <th>Identyfikator działu</th>
                        <th>Autor książki</th>
                        <th>Wydawca</th>
                        <th>Tytuł książki</th>
                        <th>Cena książki</th>
                        <th>Oprawa książki</th>
                        <th>Rok wydania książki</th>
                        <th>Gatunek</th>
                    </tr>
                    <xsl:for-each select="task5/bookCatalog/book">
                        <xsl:sort select="author" data-type="text" order="descending"/>
                        <xsl:choose>
                            <xsl:when test="bookValue > 40">
                                <tr>
                                    <td>
                                        <xsl:value-of select="@ID"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@lDepID"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="author"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="bookseller"/>
                                    </td>
                                    <td>
                                        <i>
                                            <xsl:value-of select="bookTitle"/>
                                        </i>
                                    </td>
                                    <td bgcolor="red">
                                        <xsl:value-of select="bookValue"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="coverType/@cover"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="bookReleaseDate"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="bookGenre"/>
                                    </td>
                                </tr>
                            </xsl:when>
                            <xsl:otherwise>
                                <tr>
                                    <td>
                                        <xsl:value-of select="@ID"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@lDepID"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="author"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="bookseller"/>
                                    </td>
                                    <td>
                                        <i>
                                            <xsl:value-of select="bookTitle"/>
                                        </i>
                                    </td>
                                    <td>
                                        <xsl:value-of select="bookValue"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="coverType/@cover"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="bookReleaseDate"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="bookGenre"/>
                                    </td>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>

                </table>
                <table class="softCoverTypeTable">
                    <th>
                        Lista ksiazek w miekkiej okladce:
                    </th>
                    <xsl:for-each select="task5/bookCatalog/book">

                        <xsl:if test="coverType[@cover = 'soft']">
                            <tr>
                                <td>
                                    <xsl:value-of select="bookTitle"/>
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>


                </table>
                <table class="hardCoverTypeTable">
                    <th>
                        Lista ksiazek w twardej okladce:
                    </th>
                    <xsl:for-each select="task5/bookCatalog/book">

                        <xsl:if test="coverType[@cover = 'hard']">
                            <tr>
                                <td>
                                    <xsl:value-of select="bookTitle"/>
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>


                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>

