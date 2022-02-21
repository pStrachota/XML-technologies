<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"/>

    <xsl:template match="/">
        <html lang="eng" xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <link rel="stylesheet" type="text/css" href="myStyle3.css"/>
                <title>WELCOME TO LIBRARY</title>
            </head>
            <body>
                <div id="container">
                    <div id="author">
                        <table class="authorTable">
                            <tr>
                                <th>
                                    Autor:
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:value-of select="/task7/authorInfo/authorName"/>

                                </td>
                            </tr>
                            <tr>
                                <th>Numer indeksu:</th>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:value-of select="/task7/authorInfo/index"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="central">
                        LISTA KSIĄŻEK Z BIBLIOTEKI
                        <table class="infoTable">
                            <tr>
                                <th>Identyfikator książki</th>
                                <th>Dział biblioteki</th>
                                <th>Autor książki</th>
                                <th>Wydawca</th>
                                <th>Tytuł książki</th>
                                <th>Cena książki w PLN</th>
                                <th>Rabat w PLN</th>
                                <th>Cena książki w EUR</th>
                                <th>Rabat w EUR</th>
                                <th>Cena książki w USD</th>
                                <th>Rabat w USD</th>
                                <th>Oprawa książki</th>
                                <th>Rok wydania książki</th>
                                <th>Ocena czytelników</th>
                            </tr>
                            <xsl:for-each select="task7/bookCatalog/book">
                                <tr>
                                    <td>
                                        <xsl:value-of select="bookId"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="libraryDepartment"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="author"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="bookseller"/>
                                    </td>
                                    <td>
                                        <span class="title">
                                            <xsl:value-of select="bookTitle"/>
                                        </span>
                                    </td>
                                    <td>
                                        <xsl:value-of select="bookValue/bookValueInPLN"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="discount/discountInPLN"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="bookValue/bookValueInEUR"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="discount/discountInEUR"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="bookValue/bookValueInUSD"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="discount/discountInUSD"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="coverType"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="bookRelease/@date"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="readersRating"/>
                                    </td>
                                </tr>
                            </xsl:for-each>

                        </table>
                    </div>

                    <div id="report">
                        PODSUMOWANIE
                        <table class="reportTable">

                            <tr>
                                <th>
                                    Wartość wszystkich książek
                                </th>
                                <th>
                                    Średnia cena książki
                                </th>
                                <th>
                                    Najtańsza książka
                                </th>
                                <th>
                                    Najdroższa książka
                                </th>
                                <th>
                                    Najlepiej oceniana książka
                                </th>
                                <th>
                                    Najgorzej oceniana książka
                                </th>
                                <th>
                                    łączna liczba książek
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:value-of select="/task7/report/valueOfAllBooks/valueInPLN"/> PLN
                                </td>
                                <td>
                                    <xsl:value-of select="/task7/report/averagePrice/averagePriceInPLN"/> PLN
                                </td>
                                <td>
                                    <span class="title">
                                        <xsl:value-of select="task7/report/cheapestBook/cheapestBookTitle"/>
                                    </span>
                                </td>
                                <td>
                                    <span class="title">
                                        <xsl:value-of select="/task7/report/mostExpensiveBook/mostExpensiveBookTitle"/>
                                    </span>
                                </td>
                                <td>
                                    <span class="title">
                                        <xsl:value-of select="/task7/report/bestRatingBook/bestRatingBookTitle"/> -
                                        <xsl:value-of select="/task7/report/bestRatingBook/bestRatingBookPoints"/>
                                    </span>
                                </td>
                                <td>
                                    <span class="title">
                                        <xsl:value-of select="/task7/report/worstRatingBook/worstRatingBookTitle"/> -
                                        <xsl:value-of select="/task7/report/worstRatingBook/worstRatingBookPoints"/>
                                    </span>
                                </td>
                                <td>
                                    <xsl:value-of select="/task7/report/numberOfBooks"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:value-of select="/task7/report/valueOfAllBooks/valueInEUR"/> EUR
                                </td>
                                <td>
                                    <xsl:value-of select="/task7/report/averagePrice/averagePriceInEUR"/> EUR
                                </td>
                                <td>
                                        <xsl:value-of select="/task7/report/cheapestBook/cheapestBookInPLN"/>
                                    PLN
                                </td>
                                <td>
                                        <xsl:value-of select="/task7/report/mostExpensiveBook/mostExpensiveBookInPLN"/>
                                    PLN
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:value-of select="/task7/report/valueOfAllBooks/valueInUSD"/> USD
                                </td>
                                <td>
                                    <xsl:value-of select="/task7/report/averagePrice/averagePriceInUSD"/> USD
                                </td>
                                <td>
                                    <xsl:value-of select="/task7/report/cheapestBook/cheapestBookInEUR"/> EUR
                                </td>
                                <td>
                                    <xsl:value-of select="/task7/report/mostExpensiveBook/mostExpensiveBookInEUR"/>
                                    EUR
                                </td>
                            </tr>
                            <tr>
                                <td>

                                </td>
                                <td>
                                </td>
                                <td>
                                    <xsl:value-of select="/task7/report/cheapestBook/cheapestBookInUSD"/> USD
                                </td>
                                <td>
                                    <xsl:value-of select="/task7/report/mostExpensiveBook/mostExpensiveBookInUSD"/>
                                    USD
                                </td>
                            </tr>

                        </table>
                    </div>
                    <div id="report2">
                        LICZBA KSIĄŻEK DLA KAŻDEJ KATEGORII
                        <table class="reportTable">

                        <tr>
                            <th>
                                Fantasy
                            </th>
                            <th>
                                Fikcja historyczna
                            </th>
                            <th>
                                Komiksy
                            </th>
                            <th>
                                Detektywistyczne
                            </th>
                            <th>
                                Dramaty
                            </th>
                            <th>
                                Biograficzne
                            </th>
                            <th>
                                Książki kucharskie
                            </th>
                            <th>
                                Historyczne
                            </th>
                            <th>
                                Poezja
                            </th>
                        </tr>
                            <tr>
                                <td>
                                    <xsl:value-of select="/task7/report/numberOfBooksForEveryCategory/Fantasy"/>
                                </td>
                                <td>
                                    <xsl:value-of select="/task7/report/numberOfBooksForEveryCategory/Historical_Fiction"/>
                                </td>
                                <td>
                                    <xsl:value-of select="/task7/report/numberOfBooksForEveryCategory/Comic_Book"/>
                                </td>
                                <td>
                                    <xsl:value-of select="/task7/report/numberOfBooksForEveryCategory/Detective"/>
                                </td>
                                <td>
                                    <xsl:value-of select="/task7/report/numberOfBooksForEveryCategory/Drama"/>
                                </td>
                                <td>
                                    <xsl:value-of select="/task7/report/numberOfBooksForEveryCategory/Biography"/>
                                </td>
                                <td>
                                    <xsl:value-of select="/task7/report/numberOfBooksForEveryCategory/Cookbooks"/>
                                </td>
                                <td>
                                    <xsl:value-of select="/task7/report/numberOfBooksForEveryCategory/History"/>
                                </td>
                                <td>
                                    <xsl:value-of select="/task7/report/numberOfBooksForEveryCategory/Poetry"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>

