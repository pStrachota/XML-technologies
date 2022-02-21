<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:key name="lDepIDConnection" match="/task7/libraryDepartments/libraryDepartment" use="@lDepID"/>
    <xsl:key name="publisherConnection" match="/task7/publishers/publisher/publisherName" use="../@ID"/>
    <xsl:key name="authorConnection" match="/task7/bookWriters/bookWriter/bookWriterNameAndSurname
                                                                            | bookWriterPseudonymNameAndSurname " use="../@ID"/>

    <xsl:template match="/">

        <task7>
            <authorInfo>
                <author>
                    <xsl:value-of select="/task7/authorInfo/authorName"/>
                </author>
                <index>
                    <xsl:value-of select="/task7/authorInfo/index"/>
                </index>
            </authorInfo>

            <bookCatalog>
                <xsl:for-each select="/task7/bookCatalog/book">
                    <xsl:sort order="descending" select="readersRating"/>
                    <book>
                        <bookId>
                            <xsl:value-of select="@ID"/>
                        </bookId>
                        <libraryDepartment>
                            <xsl:value-of select="key('lDepIDConnection', @lDepID)"/>
                        </libraryDepartment>
                        <author>
                            <xsl:value-of select="key('authorConnection', author)"/>
                        </author>
                        <bookseller>
                            <xsl:value-of select="key('publisherConnection', bookseller)"/>
                        </bookseller>
                        <bookTitle>
                            <xsl:value-of select="bookTitle"/>
                        </bookTitle>
                        <bookValue>
                            <bookValueInPLN>
                                <xsl:value-of select="bookValue"/>
                            </bookValueInPLN>
                            <bookValueInUSD>
                                <xsl:value-of select="round(bookValue * 0.25 * 100) div 100"/>
                            </bookValueInUSD>
                            <bookValueInEUR>
                                <xsl:value-of select="round(bookValue * 0.22 * 100) div 100"/>
                            </bookValueInEUR>
                        </bookValue>
                        <coverType>
                            <xsl:value-of select="coverType/@cover"/>
                        </coverType>
                        <bookRelease>
                            <xsl:attribute name="date">
                                <xsl:value-of select="bookReleaseDate"/>
                            </xsl:attribute>
                        </bookRelease>
                        <discount>
                            <xsl:choose>
                                <xsl:when test="bookValue >= 45">
                                    <discountInPLN>
                                        <xsl:value-of select="ceiling((bookValue) * 0.4)"/>
                                    </discountInPLN>
                                    <discountInEUR>
                                        <xsl:value-of select="ceiling((bookValue) * 0.4 * 0.25)"/>
                                    </discountInEUR>
                                    <discountInUSD>
                                        <xsl:value-of select="ceiling((bookValue) * 0.4 * 0.22)"/>
                                    </discountInUSD>
                                </xsl:when>
                                <xsl:when test="bookValue >= 25">
                                    <discountInPLN>
                                        <xsl:value-of select="ceiling((bookValue) * 0.2)"/>
                                    </discountInPLN>
                                    <discountInEUR>
                                        <xsl:value-of select="ceiling((bookValue) * 0.2 * 0.25)"/>
                                    </discountInEUR>
                                    <discountInUSD>
                                        <xsl:value-of select="ceiling((bookValue) * 0.2 * 0.22)"/>
                                    </discountInUSD>
                                </xsl:when>
                                <xsl:otherwise>
                                    <discountInPLN>
                                        <xsl:value-of select="ceiling((bookValue) * 0.1)"/>
                                    </discountInPLN>
                                    <discountInEUR>
                                        <xsl:value-of select="ceiling((bookValue) * 0.1 * 0.25)"/>
                                    </discountInEUR>
                                    <discountInUSD>
                                        <xsl:value-of select="ceiling((bookValue) * 0.1 * 0.22)"/>
                                    </discountInUSD>
                                </xsl:otherwise>
                            </xsl:choose>
                        </discount>
                        <readersRating>
                            <xsl:value-of select="readersRating"/>
                        </readersRating>
                    </book>
                </xsl:for-each>
            </bookCatalog>

            <report>
                <valueOfAllBooks>
                    <valueInPLN>
                        <xsl:value-of select="floor(sum(/task7/bookCatalog/book/bookValue))"/>
                    </valueInPLN>
                    <valueInEUR>
                        <xsl:value-of select="floor(sum(/task7/bookCatalog/book/bookValue)) * 0.25"/>
                    </valueInEUR>
                    <valueInUSD>
                        <xsl:value-of select="floor(sum(/task7/bookCatalog/book/bookValue) * 0.22)"/>
                    </valueInUSD>
                </valueOfAllBooks>
                <numberOfBooks>
                    <xsl:value-of select="count(//task7/bookCatalog/book)"/>
                </numberOfBooks>

                <averagePrice>
                    <averagePriceInPLN>
                        <xsl:value-of select="round(avg(/task7/bookCatalog/book/bookValue))"/>
                    </averagePriceInPLN>
                    <averagePriceInEUR>
                        <xsl:value-of select="round(avg(/task7/bookCatalog/book/bookValue) * 0.25)"/>
                    </averagePriceInEUR>
                    <averagePriceInUSD>
                        <xsl:value-of select="round(avg(/task7/bookCatalog/book/bookValue) * 0.22)"/>
                    </averagePriceInUSD>
                </averagePrice>

                <cheapestBook>
                    <cheapestBookTitle>
                        <xsl:value-of
                                select="/task7/bookCatalog/book[bookValue = min(/task7/bookCatalog/book/bookValue)]/bookTitle"/>
                    </cheapestBookTitle>
                    <cheapestBookInPLN>
                        <xsl:value-of select="min(/task7/bookCatalog/book/bookValue)"/>
                    </cheapestBookInPLN>
                    <cheapestBookInEUR>
                        <xsl:value-of select="round(min(/task7/bookCatalog/book/bookValue) * 0.25 * 100) div 100"/>
                    </cheapestBookInEUR>
                    <cheapestBookInUSD>
                        <xsl:value-of select="round(min(/task7/bookCatalog/book/bookValue) * 0.22 * 100) div 100"/>
                    </cheapestBookInUSD>
                </cheapestBook>

                <mostExpensiveBook>
                    <mostExpensiveBookTitle>
                        <xsl:value-of
                                select="/task7/bookCatalog/book[bookValue = max(/task7/bookCatalog/book/bookValue)]/bookTitle"/>
                    </mostExpensiveBookTitle>
                    <mostExpensiveBookInPLN>
                        <xsl:value-of select="max(/task7/bookCatalog/book/bookValue)"/>
                    </mostExpensiveBookInPLN>
                    <mostExpensiveBookInEUR>
                        <xsl:value-of select="round(max(/task7/bookCatalog/book/bookValue) * 0.25 * 100) div 100"/>
                    </mostExpensiveBookInEUR>
                    <mostExpensiveBookInUSD>
                        <xsl:value-of select="round(max(/task7/bookCatalog/book/bookValue) * 0.22 * 100) div 100"/>
                    </mostExpensiveBookInUSD>
                </mostExpensiveBook>
                <bestRatingBook>
                    <bestRatingBookTitle>
                        <xsl:value-of
                                select="/task7/bookCatalog/book[readersRating = max(/task7/bookCatalog/book/readersRating)]/bookTitle"/>
                    </bestRatingBookTitle>
                    <bestRatingBookPoints>
                        <xsl:value-of select="max(/task7/bookCatalog/book/readersRating)"/>
                    </bestRatingBookPoints>
                </bestRatingBook>
                <worstRatingBook>
                    <worstRatingBookTitle>
                        <xsl:value-of
                                select="/task7/bookCatalog/book[readersRating = min(/task7/bookCatalog/book/readersRating)]/bookTitle"/>
                    </worstRatingBookTitle>
                    <worstRatingBookPoints>
                        <xsl:value-of select="min(/task7/bookCatalog/book/readersRating)"/>
                    </worstRatingBookPoints>
                </worstRatingBook>
                <numberOfBooksForEveryCategory>
                    <Fantasy>
                        <xsl:value-of select="count(//task7/bookCatalog/book[@lDepID = 'LD1'])"/>
                    </Fantasy>
                    <Historical_Fiction>
                        <xsl:value-of
                                select="count(//task7/bookCatalog/book[@lDepID = 'LD2'])"/>
                    </Historical_Fiction>
                    <Comic_Book>
                        <xsl:value-of select="count(//task7/bookCatalog/book[@lDepID = 'LD3'])"/>
                    </Comic_Book>
                    <Detective>
                        <xsl:value-of select="count(//task7/bookCatalog/book[@lDepID = 'LD4'])"/>
                    </Detective>
                    <Drama>
                        <xsl:value-of select="count(//task7/bookCatalog/book[@lDepID = 'LD5'])"/>
                    </Drama>
                    <Biography>
                        <xsl:value-of select="count(//task7/bookCatalog/book[@lDepID = 'LD6'])"/>
                    </Biography>
                    <Cookbooks>
                        <xsl:value-of select="count(//task7/bookCatalog/book[@lDepID = 'LD7'])"/>
                    </Cookbooks>
                    <History>
                        <xsl:value-of select="count(//task7/bookCatalog/book[@lDepID = 'LD8'])"/>
                    </History>
                    <Poetry>
                        <xsl:value-of select="count(//task7/bookCatalog/book[@lDepID = 'LD9'])"/>
                    </Poetry>
                </numberOfBooksForEveryCategory>
            </report>
        </task7>
    </xsl:template>
</xsl:stylesheet>

