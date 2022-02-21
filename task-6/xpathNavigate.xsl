<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="3.0">
    <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>ROZWIAZANIA</title>
            </head>
            <body>
                <table>
                    <!--                    rozwiazanie zadania 1 jest na dole dokumentu-->
                    <xsl:apply-templates select="/osoby/grupaStudentow/student[3]"/>
                    <tr>
                        <th>
                            ZADANIE 2
                        </th>
                        <tr>
                            <th>Elementy student o wieku powyzej 21 lat</th>
                            <td>
                                <xsl:value-of select="/osoby/grupaStudentow/student[wiek > 21]"/>
                            </td>
                        </tr>
                        <tr>
                            <th>wszystkie elementy student, które mają atrybut "plec" o wartości "k"</th>
                            <td>
                                <xsl:value-of select="/osoby/grupaStudentow/student[@plec = 'k']"/>
                            </td>
                        </tr>
                        <tr>
                            <th>wszystkich pracowników mężczyzn</th>
                            <td>
                                <xsl:value-of select="/osoby/grupaPracownikow/pracownik[@plec = 'm']"/>
                            </td>
                        </tr>
                        <tr>
                            <th>wszystkich pracowników, których numer pracownika jest większy od 40000</th>
                            <td>
                                <xsl:value-of select="/osoby/grupaPracownikow/pracownik[nr_prac > 40000]"/>
                            </td>
                        </tr>
                    </tr>
                    <th>
                        ZADANIE 3
                    </th>
                    <tr>
                        <th>drugie wystąpienie elementu student</th>
                        <td>
                            <xsl:value-of select="/osoby/grupaStudentow/student[position() = 2]"/>
                        </td>
                    </tr>
                    <tr>
                        <th>trzecie i kolejne wystąpienie student</th>
                        <td>
                            <xsl:value-of
                                    select="/osoby/grupaStudentow/student[position() = 2] | /osoby/grupaStudentow/student[position() = 3]"/>
                        </td>
                    </tr>
                    <tr>
                        <th>wszystkich poza drugim wystąpieniem elementu student</th>
                        <td>
                            <xsl:value-of select="/osoby/grupaStudentow/student[position() != 2]"/>
                        </td>
                    </tr>
                    <tr>
                        <th>podostatniego pracownika i studenta</th>
                        <td>
                            <xsl:value-of
                                    select="/osoby/grupaStudentow/student[last() - 1] | /osoby/grupaPracownikow/pracownik[last() - 1]"/>
                        </td>
                    </tr>
                    <tr>
                        <th>od drugiego włącznie pracownika</th>
                        <td>
                            <xsl:value-of select="/osoby/grupaPracownikow/pracownik[position() > 1]"/>
                        </td>
                    </tr>
                    <th>
                        ZADANIE 4
                    </th>
                    <tr>
                        <th>wszystkie wartości wiek korzystając z funkcji text()</th>
                        <td>
                            <xsl:value-of select="/osoby/*/*/wiek/text()"/>
                        </td>
                    </tr>
                    <tr>
                        <th>sumę wartości wiek wszystkich pracowników</th>
                        <td>
                            <xsl:value-of select="sum(/osoby/grupaPracownikow/pracownik/wiek)"/>
                        </td>
                    </tr>
                    <tr>
                        <th>średnią wieku mężczyzn</th>
                        <td>
                            <xsl:value-of select="avg(/osoby/*/*[@plec = 'm']/wiek)"/>
                        </td>
                    </tr>
                    <tr>
                        <th>najmłodszego i najstarszego studenta i pracownika</th>
                        <td> najstarszy student:
                            <xsl:value-of select="/osoby/grupaStudentow/student[wiek = max(/osoby/grupaStudentow/student/wiek)]"/>
                        </td>
                        <td> najmlodszy student:
                            <xsl:value-of select="/osoby/grupaStudentow/student[wiek = min(/osoby/grupaStudentow/student/wiek)]"/>

                        </td>
                        <td> najstarszy pracownik
                            <xsl:value-of select="/osoby/grupaPracownikow/pracownik[wiek = max(/osoby/grupaPracownikow/pracownik/wiek)]"/>

                        </td>
                        <td> najmlodszy pracownik
                            <xsl:value-of select="/osoby/grupaPracownikow/pracownik[wiek = min(/osoby/grupaPracownikow/pracownik/wiek)]"/>

                        </td>
                    </tr>
                    <tr>
                        <th>liczbę kobiet i mężczyzn (zarówno studentów, jak i pracowników)</th>
                        <td> laczna liczba kobiet:
                            <xsl:value-of select="count(/osoby/*/*[@plec = 'k'])"/>
                        </td>
                        <td> laczna liczba mezczyzn
                            <xsl:value-of select="count(/osoby/*/*[@plec = 'm'])"/>
                        </td>

                    </tr>
                    <tr>
                        <th>liczbę kobiet i mężczyzn dla poszczególnych grup (studentów i osobno dla pracowników)</th>
                        <td> liczba kobiet wsrod studentow:
                            <xsl:value-of select="count(/osoby/grupaStudentow/student[@plec = 'k'])"/>
                        </td>

                        <td> liczba mezczyzn wsrod studentow:
                            <xsl:value-of select="count(/osoby/grupaStudentow/student[@plec = 'm'])"/>
                        </td>
                        <td> liczba kobiet wsrod pracowników:
                            <xsl:value-of select="count(/osoby/grupaPracownikow/pracownik[@plec = 'k'])"/>
                        </td>
                        <td> liczba mezczyzn wsrod pracowników:
                            <xsl:value-of select="count(/osoby/grupaPracownikow/pracownik[@plec = 'm'])"/>
                        </td>
                    </tr>
                    <tr>
                        <th>największą i najmniejszą liczbę zdobytych punktów przez studentów</th>
                        <td>
                            <xsl:value-of
                                    select="min(/osoby/grupaStudentow/student/zdobytePunkty | /osoby/grupaStudentow/student/punkty)"/>
                        </td>
                        <td>
                            <xsl:value-of
                                    select="max(/osoby/grupaStudentow/student/zdobytePunkty | /osoby/grupaStudentow/student/punkty)"/>
                        </td>
                    </tr>
                    <tr>
                        <th>średnią liczbę zdobytych punktów przez studentów</th>
                        <td>
                            <xsl:value-of
                                    select="avg(/osoby/grupaStudentow/student/zdobytePunkty | /osoby/grupaStudentow/student/punkty)"/>
                        </td>
                    </tr>
                    <tr>
                        <th>liczbę studentów, którzy zdali, czyli zyskali powyżej 50 punktów</th>
                        <td>
                            <xsl:value-of
                                    select="/osoby/grupaStudentow/student[zdobytePunkty > 50] | /osoby/grupaStudentow/student[punkty > 50]"/>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="/osoby/grupaStudentow/student[3]">

        <th>
            ZADANIE 1
        </th>
        <tr>
            <th>nazwisko bieżącego elementu</th>
            <td>
                <xsl:value-of select="nazwisko"/>
            </td>
        </tr>
        <tr>
            <th>element bieżący student wraz z podelementami</th>
            <td>
                <xsl:value-of select="."/>
            </td>
        </tr>
        <tr>
            <th>element o nazwie grupaPracownikow</th>
            <td>
                <xsl:value-of select="../../grupaPracownikow"/>
            </td>
        </tr>
        <tr>
            <th>punkty studenta o imieniu Stefania</th>
            <td>
                <xsl:value-of select="../student[imie = 'Stefania']/zdobytePunkty"/>
            </td>
        </tr>
        <tr>
            <th>nrAlbumu i wiek bieżącego elementu student</th>
            <td>
                <xsl:value-of select="nrAlbumu | wiek "/>
            </td>
        </tr>
        <tr>
            <th>wiek studenta o imieniu Aleksandra</th>
            <td>
                <xsl:value-of select="../student[imie = 'Aleksandra']/wiek"/>
            </td>
        </tr>
        <tr>
            <th>numery wszystkich pracowników</th>
            <td>
                <xsl:value-of select="../../grupaPracownikow/pracownik/nr_prac"/>
            </td>
        </tr>
        <tr>
            <th>płeć studentów Aleksandra i Teofil oraz wszystkich pracowników</th>
            <td>
                <xsl:value-of
                        select="../../grupaPracownikow/pracownik | ../student[imie = 'Aleksandra']/@plec | ../student[imie = 'Teofil']/@plec "/>
            </td>
        </tr>


    </xsl:template>
</xsl:stylesheet>







