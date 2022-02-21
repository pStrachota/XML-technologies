<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <xsl:text>Raport TXT - Piotr Strachota, numer indeksu 236660 &#xA;&#xA;</xsl:text>
        <xsl:text>Identyfikator książki:        Dział biblioteki:             Autor:                                  Wydawca:                      Tytuł książki:                                    Cena książki w PLN:      Rabat w PLN:        Cena książki w EUR:    Rabat w EUR:         Cena książki w USD:      Rabat w USD:      Rodzaj okładki:    Data wydania:        Ocena czytelników:                       &#xA;&#xA;</xsl:text>
        <xsl:for-each select="task7/bookCatalog/book">
            <xsl:value-of
                    select="substring(concat(bookId,'                            '),1,30)"/>
            <xsl:value-of
                    select="substring(concat(libraryDepartment,'                              '),1,30)"/>
            <xsl:value-of
                    select="substring(concat(author,'                             '),1,40)"/>
            <xsl:value-of
                    select="substring(concat(bookseller,'                          '),1,30)"/>
            <xsl:value-of
                    select="substring(concat(bookTitle,'                                           '),1,50)"/>
            <xsl:value-of
                    select="substring(concat(bookValue/bookValueInPLN,'                     '),1,25)"/>
            <xsl:value-of
                    select="substring(concat(discount/discountInPLN,'                   '),1,20)"/>
            <xsl:value-of
                    select="substring(concat(bookValue/bookValueInEUR,'                    '),1,23)"/>
            <xsl:value-of
                    select="substring(concat(discount/discountInEUR,'                    '),1,21)"/>
            <xsl:value-of
                    select="substring(concat(bookValue/bookValueInUSD,'                        '),1,25)"/>
            <xsl:value-of
                    select="substring(concat(discount/discountInUSD,'                 '),1,18)"/>
            <xsl:value-of
                    select="substring(concat(coverType,'               '),1,19)"/>
            <xsl:value-of
                    select="substring(concat(bookRelease/@date,'                 '),1,21)"/>
            <xsl:value-of
                    select="readersRating"/>
            <xsl:text>&#xA;</xsl:text>
        </xsl:for-each>
        <xsl:text>&#xA;&#xA;                                                                             PODSUMOWANIE:&#xA;</xsl:text>
        <xsl:text>Wartość wszystkich książek    Średnia cena książki	   Najtańsza książka                     Najdroższa książka      Najlepiej oceniana książka     Najgorzej oceniana książka	Łączna liczba książek&#xA;</xsl:text>
        <xsl:value-of select="concat(task7/report/valueOfAllBooks/valueInPLN, ' PLN                       ')"/>
        <xsl:value-of select="concat(task7/report/averagePrice/averagePriceInPLN, ' PLN')"/>
        <xsl:value-of select="concat('                     ',task7/report/cheapestBook/cheapestBookTitle)"/>
        <xsl:value-of select="concat('   ',/task7/report/mostExpensiveBook/mostExpensiveBookTitle)"/>
        <xsl:value-of select="concat('       ',/task7/report/bestRatingBook/bestRatingBookTitle)"/>
        <xsl:value-of
                select="concat('                       ',/task7/report/worstRatingBook/worstRatingBookTitle)"/>
        <xsl:value-of select="concat('                     ',/task7/report/numberOfBooks)"/><xsl:text>&#xA;</xsl:text>
        <xsl:value-of select="concat(task7/report/valueOfAllBooks/valueInEUR, ' EUR                    ')"/>
        <xsl:value-of select="concat(task7/report/averagePrice/averagePriceInEUR, ' EUR                      ')"/>
        <xsl:value-of
                select="concat(/task7/report/cheapestBook/cheapestBookInPLN, ' PLN                              ')"/>
        <xsl:value-of select="concat(/task7/report/mostExpensiveBook/mostExpensiveBookInPLN, 'PLN')"/><xsl:text>&#xA;</xsl:text>
        <xsl:value-of select="concat(task7/report/valueOfAllBooks/valueInUSD, ' USD                       ')"/>
        <xsl:value-of select="concat(task7/report/averagePrice/averagePriceInUSD, ' USD                      ')"/>
        <xsl:value-of
                select="concat(/task7/report/cheapestBook/cheapestBookInEUR, ' EUR                                 ')"/>
        <xsl:value-of select="concat(/task7/report/mostExpensiveBook/mostExpensiveBookInEUR, ' EUR')"/><xsl:text>&#xA;</xsl:text>
        <xsl:value-of
                select="concat('                                                         ', /task7/report/cheapestBook/cheapestBookInUSD, ' USD                              ')"/>
        <xsl:value-of select="concat(/task7/report/mostExpensiveBook/mostExpensiveBookInUSD, ' USD')"/><xsl:text>&#xA;&#xA;&#xA;</xsl:text>

        <xsl:text>                                                                    LICZBA KSIĄŻEK DLA KAŻDEJ KATEGORII</xsl:text><xsl:text>&#xA;</xsl:text>
        <xsl:text>Fantasy    Fikcja historyczna	  Komiksy      Detektywistyczne      Dramaty      Biograficzne	    Książki kucharskie	    Historyczne      Poezja&#xA;</xsl:text>

        <xsl:value-of
                select="concat(/task7/report/numberOfBooksForEveryCategory/Fantasy, '          ')"/>
        <xsl:value-of
                select="concat(/task7/report/numberOfBooksForEveryCategory/Historical_Fiction, '                      ')"/>
        <xsl:value-of
                select="concat(/task7/report/numberOfBooksForEveryCategory/Comic_Book, '            ')"/>
        <xsl:value-of
                select="concat(/task7/report/numberOfBooksForEveryCategory/Detective, '                     ')"/>
        <xsl:value-of
                select="concat(/task7/report/numberOfBooksForEveryCategory/Drama, '            ')"/>
        <xsl:value-of
                select="concat(/task7/report/numberOfBooksForEveryCategory/Biography, '                 ')"/>
        <xsl:value-of
                select="concat(/task7/report/numberOfBooksForEveryCategory/Cookbooks, '                       ')"/>
        <xsl:value-of
                select="concat(/task7/report/numberOfBooksForEveryCategory/History, '                ')"/>
        <xsl:value-of
                select="concat(/task7/report/numberOfBooksForEveryCategory/Poetry, ' ')"/>


    </xsl:template>


</xsl:stylesheet>