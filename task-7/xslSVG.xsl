<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">

        <svg width="1700px" height="2500px" xmlns="http://www.w3.org/2000/svg"
             style="font-family:Cambria; background-color:lightcyan;" xmlns:xlink="http://www.w3.org/1999/xlink">

            <script type="text/javascript">
                function link_click(evt) {
                var a = evt.target;
                a.setAttribute("style","fill:black; font-size:24;")
                }

                function link_hover(evt) {
                var a = evt.target;
                a.setAttribute("style","font-style:italic; font-size:26; text-decoration:underline")
                }

                function link_out(evt) {
                var a = evt.target;
                a.setAttribute("style","font-style:normal; font-size:26; text-decoration:underline")
                }

                function on_authors_hover(evt) {
                var a = evt.target;
                a.setAttribute("style","font-stretch: expanded; font-size:21")
                }

                function on_authors_out(evt) {
                var a = evt.target;
                a.setAttribute("style","font-stretch: expanded; font-size:20")
                }

                function show(name) {
                document.getElementById(name).style.visibility = "visible";
                }

                function hide(name) {
                document.getElementById(name).style.visibility = "hidden";
                }

                function line_click(evt) {
                var a = evt.target;
                a.setAttribute("stroke-width", 20);
                a.setAttribute("stroke", "pink");
                }

                function line_hover(evt) {
                var a = evt.target;
                a.setAttribute("stroke-width", 20);
                a.setAttribute("stroke", "yellow");
                }

                function line_over(evt) {
                var a = evt.target;
                a.setAttribute("stroke-width", 10);
                a.setAttribute("stroke", "black");
                }

                function line2_hover(evt) {
                var a = evt.target;
                a.setAttribute("stroke-width", 20);
                a.setAttribute("stroke", "pink");
                }
            </script>

            <text x="60" y="50" font-size="26px" fill="black">Wybierz dział biblioteki:</text>

            <a xlink:href="#Fantasy">
                <text onmouseout="link_out(evt)" onclick="link_click(evt)" onmouseover="link_hover(evt)" x="370" y="35"
                      style="fill:black; font-size:24; text-decoration:underline;">Fantasy
                </text>
            </a>
            <a id="Fantasy">
                <text x="350" y="110" style="fill:black; font-size:30; font-family:Arial Black;">Fantasy</text>
            </a>
            <text x="1000" y="100" style="fill:black; font-size:30; font-family:Arial Black;">Ocena czytelników
            </text>
            <xsl:for-each select="task7/bookCatalog/book[libraryDepartment = 'Fantasy']">

                <xsl:variable name="position" select="50+(position()-1) * 40"/>
                <xsl:variable name="reviews" select="1000+readersRating * 2.5"/>
                <xsl:if test="author = 'Joanne Kathleen Rowling'">
                    <image id="imageId" width="200" height="200" x="800" y="100"
                           href="https://image.ceneostatic.pl/data/products/34672883/i-harry-potter-and-the-philosopher-s-stone.jpg"
                           visibility="hidden"/>
                    <a href="https://pl.wikipedia.org/wiki/J.K._Rowling" target="_blank">
                        <text onmouseover="on_authors_hover(evt)" onmouseout="on_authors_out(evt)" x="80"
                              y="{$position + 100}" style="fill:black;  font-size:20">
                            <xsl:value-of select="author"/>
                        </text>
                    </a>
                    <text onmouseover="show('imageId')" onmouseout="hide('imageId')" x="450" y="{$position + 100}"
                          style="fill:black; font-size:20px; font-style:italic">
                        <xsl:value-of select="bookTitle"/>
                    </text>
                </xsl:if>
                <xsl:if test="author = 'Markus Zusak'">
                    <image id="imageId2" width="200" height="200" x="800" y="100"
                           href="https://www.granice.pl/sys6/pliki/okladka_k/c3fa674282051c717e0be268663bd45b.jpeg"
                           visibility="hidden"/>
                    <a href="https://pl.wikipedia.org/wiki/Markus_Zusak" target="_blank">
                        <text onmouseover="on_authors_hover(evt)" onmouseout="on_authors_out(evt)" x="80"
                              y="{$position + 100}" style="fill:black;  font-size:20">
                            <xsl:value-of select="author"/>
                        </text>
                    </a>
                    <text onmouseover="show('imageId2')" onmouseout="hide('imageId2')" x="450" y="{$position + 100}"
                          style="fill:black; font-size:20px; font-style:italic">
                        <xsl:value-of select="bookTitle"/>
                    </text>
                </xsl:if>

                <xsl:if test="author = 'John Ronald Reuel Tolkien'">
                    <image id="imageId3" width="200" height="200" x="800" y="100"
                           href="https://images-na.ssl-images-amazon.com/images/I/919-2hQNB6L.jpg"
                           visibility="hidden"/>
                    <a href="https://pl.wikipedia.org/wiki/J.R.R._Tolkien" target="_blank">
                        <text onmouseover="on_authors_hover(evt)" onmouseout="on_authors_out(evt)" x="80"
                              y="{$position + 100}" style="fill:black;  font-size:20">
                            <xsl:value-of select="author"/>
                        </text>
                    </a>
                    <text onmouseover="show('imageId3')" onmouseout="hide('imageId3')" x="450" y="{$position + 100}"
                          style="fill:black; font-size:20px; font-style:italic">
                        <xsl:value-of select="bookTitle"/>
                    </text>
                </xsl:if>

                <xsl:if test="author = 'George Raymond Richard Martin'">
                    <image id="imageId4" width="200" height="200" x="800" y="100"
                           href="https://images-na.ssl-images-amazon.com/images/I/91hPXkwnaeL.jpg"
                           visibility="hidden"/>
                    <a href="https://pl.wikipedia.org/wiki/George_R.R._Martin" target="_blank">
                        <text onmouseover="on_authors_hover(evt)" onmouseout="on_authors_out(evt)" x="80"
                              y="{$position + 100}" style="fill:black;  font-size:20">
                            <xsl:value-of select="author"/>
                        </text>
                    </a>
                    <text onmouseover="show('imageId4')" onmouseout="hide('imageId4')" x="450" y="{$position + 100}"
                          fill="black" font-size="20px" font-style="italic">
                        <xsl:value-of select="bookTitle"/>
                    </text>
                </xsl:if>

                <text x="1250" y="{$position + 100}" style="fill:black;  font-size:18">
                    <xsl:value-of select="readersRating"/>
                </text>
                <line onmouseover="line_hover(evt)" onmouseout="line_over(evt)" x1="1000" y1="{$position + 94}"
                      x2="1000"
                      y2="{$position + 94}" stroke-width="10" stroke="black">
                    <animate attributeName="x2" attributeType="XML" begin="0s" dur="2s" fill="freeze" from="1000"
                             to="{$reviews}"/>
                </line>

            </xsl:for-each>
            <a xlink:href="#Historical_Fiction">
                <text onmouseout="link_out(evt)" onclick="link_click(evt)" onmouseover="link_hover(evt)" x="500" y="35"
                      style="fill:black; font-size:24; text-decoration:underline;">Fikcja historyczna
                </text>
            </a>
            <a id="Historical_Fiction">
                <text x="270" y="350" style="fill:black; font-size:30; font-family:Arial Black;">Fikcja
                    historyczna
                </text>
            </a>
            <xsl:for-each select="task7/bookCatalog/book[libraryDepartment = 'Historical Fiction']">
                <xsl:variable name="position" select="300+(position()-1) * 40"/>
                <xsl:variable name="reviews" select="1000+readersRating * 2.5"/>

                <xsl:if test="author = 'George Orwell'">
                    <image id="imageId5" width="200" height="200" x="700" y="300"
                           href="https://www.swiatksiazki.pl/media/catalog/product/cache/eaf55611dc9c3a2fa4224fad2468d647/x/6/x699906728306.jpg"
                           visibility="hidden"/>
                    <a href="https://pl.wikipedia.org/wiki/George_Orwell" target="_blank">
                        <text onmouseover="on_authors_hover(evt)" onmouseout="on_authors_out(evt)" x="80"
                              y="{$position + 100}" style="fill:black;  font-size:20">
                            <xsl:value-of select="author"/>
                        </text>
                    </a>
                    <text onmouseover="show('imageId5')" onmouseout="hide('imageId5')" x="450" y="{$position + 100}"
                          style="fill:black; font-size:20px; font-style:italic">
                        <xsl:value-of select="bookTitle"/>
                    </text>
                </xsl:if>

                <xsl:if test="author = 'Alexander Dumas'">
                    <image id="imageId6" width="200" height="200" x="700" y="300"
                           href="https://a.allegroimg.com/s1024/0c86b8/3de10c064facb330fffe9f598b50"
                           visibility="hidden"/>
                    <a href="https://pl.wikipedia.org/wiki/Alexandre_Dumas" target="_blank">
                        <text onmouseover="on_authors_hover(evt)" onmouseout="on_authors_out(evt)" x="80"
                              y="{$position + 100}" style="fill:black;  font-size:20">
                            <xsl:value-of select="author"/>
                        </text>
                    </a>
                    <text onmouseover="show('imageId6')" onmouseout="hide('imageId6')" x="450" y="{$position + 100}"
                          style="fill:black; font-size:20px; font-style:italic">

                        <xsl:value-of select="bookTitle"/>
                    </text>
                </xsl:if>

                <text x="1250" y="{$position + 100}" style="fill:black;  font-size:18">
                    <xsl:value-of select="readersRating"/>
                </text>
                <line onmouseover="line_hover(evt)" onmouseout="line_over(evt)" x1="1000" y1="{$position + 94}"
                      x2="1000"
                      y2="{$position + 94}" stroke-width="10" stroke="black">
                    <animate attributeName="x2" attributeType="XML" begin="0s" dur="2s" fill="freeze" from="1000"
                             to="{$reviews}"/>
                </line>

            </xsl:for-each>
            <a xlink:href="#Comic_Book">
                <text onmouseout="link_out(evt)" onclick="link_click(evt)" onmouseover="link_hover(evt)" x="750" y="35"
                      style="fill:black; font-size:24; text-decoration:underline;">Komiksy
                </text>
            </a>
            <a id="Comic_Book">
                <text x="300" y="520" style="fill:black; font-size:30; font-family:Arial Black;">Komiksy
                </text>
            </a>
            <xsl:for-each select="task7/bookCatalog/book[libraryDepartment = 'Comic Book']">
                <xsl:variable name="position" select="470+(position()-1) * 40"/>
                <xsl:variable name="reviews" select="1000+readersRating * 2.5"/>

                <xsl:if test="author = 'Rene Goscinny'">
                    <image id="imageId7" width="200" height="200" x="600" y="470"
                           href="https://www.freecomicbookday.com/SiteImage/MainImage/STL148494"
                           visibility="hidden"/>
                    <a href="https://pl.wikipedia.org/wiki/Ren%C3%A9_Goscinny" target="_blank">
                        <text onmouseover="on_authors_hover(evt)" onmouseout="on_authors_out(evt)" x="80"
                              y="{$position + 100}" style="fill:black;  font-size:20">
                            <xsl:value-of select="author"/>
                        </text>
                    </a>
                    <text onmouseover="show('imageId7')" onmouseout="hide('imageId7')" x="450" y="{$position + 100}"
                          style="fill:black; font-size:20px; font-style:italic">

                        <xsl:value-of select="bookTitle"/>
                    </text>
                </xsl:if>

                <xsl:if test="author = 'Jerry Siegel'">
                    <image id="imageId8" width="200" height="200" x="600" y="470"
                           href="https://image.ceneostatic.pl/data/products/69850966/i-superman-action-comics-tom-4-nowy-swiat.jpg"
                           visibility="hidden"/>
                    <a href="https://pl.wikipedia.org/wiki/Jerry_Siegel" target="_blank">
                        <text onmouseover="on_authors_hover(evt)" onmouseout="on_authors_out(evt)" x="80"
                              y="{$position + 100}" style="fill:black;  font-size:20">
                            <xsl:value-of select="author"/>
                        </text>
                    </a>
                    <text onmouseover="show('imageId8')" onmouseout="hide('imageId8')" x="450" y="{$position + 100}"
                          fill="black" font-size="20px" font-style="italic">
                        <xsl:value-of select="bookTitle"/>
                    </text>
                </xsl:if>

                <text x="1250" y="{$position + 100}" style="fill:black;  font-size:18">
                    <xsl:value-of select="readersRating"/>
                </text>
                <line onmouseover="line_hover(evt)" onmouseout="line_over(evt)" x1="1000" y1="{$position + 94}"
                      x2="1000"
                      y2="{$position + 94}" stroke-width="10" stroke="black">
                    <animate attributeName="x2" attributeType="XML" begin="0s" dur="2s" fill="freeze" from="1000"
                             to="{$reviews}"/>
                </line>

            </xsl:for-each>
            <a xlink:href="#Detective">
                <text onmouseout="link_out(evt)" onclick="link_click(evt)" onmouseover="link_hover(evt)" x="900" y="35"
                      style="fill:black; font-size:24; text-decoration:underline;">Detektywistyczne
                </text>
            </a>
            <a id="Detective">
                <text x="240" y="670" style="fill:black; font-size:30; font-family:Arial Black;">Detektywistyczne
                </text>
            </a>

            <xsl:for-each select="task7/bookCatalog/book[libraryDepartment = 'Detective']">
                <xsl:variable name="position" select="620+(position()-1) * 40"/>
                <xsl:variable name="reviews" select="1000+readersRating * 2.5"/>

                <xsl:if test="author = 'Arthur Conan Doyle'">
                    <image id="imageId9" width="200" height="200" x="740" y="625"
                           href="https://ecsmedia.pl/c/przygody-sherlocka-holmesa-w-iext99676811.jpg"
                           visibility="hidden"/>
                    <a href="https://pl.wikipedia.org/wiki/Arthur_Conan_Doyle" target="_blank">
                        <text onmouseover="on_authors_hover(evt)" onmouseout="on_authors_out(evt)" x="80"
                              y="{$position + 100}" style="fill:black;  font-size:20">
                            <xsl:value-of select="author"/>
                        </text>
                    </a>
                    <text onmouseover="show('imageId9')" onmouseout="hide('imageId9')" x="450" y="{$position + 100}"
                          fill="black" font-size="20px" font-style="italic">
                        <xsl:value-of select="bookTitle"/>
                    </text>
                </xsl:if>

                <xsl:if test="author = 'Agatha Christie'">
                    <image id="imageId10" width="200" height="200" x="740" y="625"
                           href="https://ecsmedia.pl/c/morderstwo-w-orient-expressie-b-iext97137398.jpg"
                           visibility="hidden"/>
                    <a href="https://pl.wikipedia.org/wiki/Agatha_Christie" target="_blank">
                        <text onmouseover="on_authors_hover(evt)" onmouseout="on_authors_out(evt)" x="80"
                              y="{$position + 100}" style="fill:black;  font-size:20">
                            <xsl:value-of select="author"/>
                        </text>
                    </a>
                    <text onmouseover="show('imageId10')" onmouseout="hide('imageId10')" x="450" y="{$position + 100}"
                          style="fill:black; font-size:20px; font-style:italic">
                        <xsl:value-of select="bookTitle"/>
                    </text>
                </xsl:if>

                <text x="1250" y="{$position + 100}" style="fill:black;  font-size:18">
                    <xsl:value-of select="readersRating"/>
                </text>
                <line onmouseover="line_hover(evt)" onmouseout="line_over(evt)" x1="1000" y1="{$position + 94}"
                      x2="1000"
                      y2="{$position + 94}" stroke-width="10" stroke="black">
                    <animate attributeName="x2" attributeType="XML" begin="0s" dur="2s" fill="freeze" from="1000"
                             to="{$reviews}"/>
                </line>

            </xsl:for-each>
            <a xlink:href="#Drama">
                <text onmouseout="link_out(evt)" onclick="link_click(evt)" onmouseover="link_hover(evt)" x="1150"
                      y="35"
                      style="fill:black; font-size:24; text-decoration:underline;">Dramaty
                </text>
            </a>
            <a id="Drama">
                <text x="300" y="840" style="fill:black; font-size:30; font-family:Arial Black;">Dramaty
                </text>
            </a>
            <xsl:for-each select="task7/bookCatalog/book[libraryDepartment = 'Drama']">
                <xsl:variable name="position" select="790+(position()-1) * 40"/>
                <xsl:variable name="reviews" select="1000+readersRating * 2.5"/>

                <xsl:if test="author = 'William Shakespeare'">
                    <image id="imageId11" width="200" height="200" x="640" y="820"
                           href="https://ecsmedia.pl/c/romeo-i-julia-w-iext97331996.jpg"
                           visibility="hidden"/>
                    <a href="https://pl.wikipedia.org/wiki/William_Shakespeare" target="_blank">
                        <text onmouseover="on_authors_hover(evt)" onmouseout="on_authors_out(evt)" x="80"
                              y="{$position + 100}" style="fill:black;  font-size:20">
                            <xsl:value-of select="author"/>
                        </text>
                    </a>
                    <text onmouseover="show('imageId11')" onmouseout="hide('imageId11')" x="450" y="{$position + 100}"
                          style="fill:black; font-size:20px; font-style:italic">
                        <xsl:value-of select="bookTitle"/>
                    </text>
                </xsl:if>

                <xsl:if test="author = 'Louisa May Alcott'">
                    <image id="imageId12" width="200" height="200" x="640" y="820"
                           href="https://ecsmedia.pl/c/male-kobietki-wersja-ilustrowana-b-iext81301175.jpg"
                           visibility="hidden"/>
                    <a href="https://pl.wikipedia.org/wiki/Louisa_May_Alcott" target="_blank">
                        <text onmouseover="on_authors_hover(evt)" onmouseout="on_authors_out(evt)" x="80"
                              y="{$position + 100}" style="fill:black;  font-size:20">
                            <xsl:value-of select="author"/>
                        </text>
                    </a>
                    <text onmouseover="show('imageId12')" onmouseout="hide('imageId12')" x="450" y="{$position + 100}"
                          style="fill:black; font-size:20px; font-style:italic">

                        <xsl:value-of select="bookTitle"/>
                    </text>
                </xsl:if>

                <xsl:if test="author = 'Leo Tolstoy'">
                    <image id="imageId13" width="200" height="200" x="640" y="820"
                           href="https://s.lubimyczytac.pl/upload/books/152000/152298/783829-352x500.jpg"
                           visibility="hidden"/>
                    <a href="https://pl.wikipedia.org/wiki/Lew_Tołstoj" target="_blank">
                        <text onmouseover="on_authors_hover(evt)" onmouseout="on_authors_out(evt)" x="80"
                              y="{$position + 100}" style="fill:black;  font-size:20">
                            <xsl:value-of select="author"/>
                        </text>
                    </a>
                    <text onmouseover="show('imageId13')" onmouseout="hide('imageId13')" x="450" y="{$position + 100}"
                          style="fill:black; font-size:20px; font-style:italic">
                        <xsl:value-of select="bookTitle"/>
                    </text>
                </xsl:if>

                <text x="1250" y="{$position + 100}" style="fill:black;  font-size:18">
                    <xsl:value-of select="readersRating"/>
                </text>
                <line onmouseover="line_hover(evt)" onmouseout="line_over(evt)" x1="1000" y1="{$position + 94}"
                      x2="1000"
                      y2="{$position + 94}" stroke-width="10" stroke="black">
                    <animate attributeName="x2" attributeType="XML" begin="0s" dur="2s" fill="freeze" from="1000"
                             to="{$reviews}"/>
                </line>
            </xsl:for-each>

            <a xlink:href="#Biography">
                <text onmouseout="link_out(evt)" onclick="link_click(evt)" onmouseover="link_hover(evt)" x="1300"
                      y="35"
                      style="fill:black; font-size:24; text-decoration:underline;">Biografie
                </text>
            </a>
            <a id="Biography">
                <text x="280" y="1050" style="fill:black; font-size:30; font-family:Arial Black;">Biografie
                </text>
            </a>
            <xsl:for-each select="task7/bookCatalog/book[libraryDepartment = 'Biography']">
                <xsl:variable name="position" select="1000+(position()-1) * 40"/>
                <xsl:variable name="reviews" select="1000+readersRating * 2.5"/>


                <xsl:if test="author = 'Walter Isaacson'">
                    <image id="imageId14" width="200" height="200" x="740" y="1000"
                           href="https://ecsmedia.pl/c/steve-jobs-b-iext90647304.jpg"
                           visibility="hidden"/>
                    <a href="https://pl.wikipedia.org/wiki/Walter_Isaacson" target="_blank">
                        <text onmouseover="on_authors_hover(evt)" onmouseout="on_authors_out(evt)" x="80"
                              y="{$position + 100}" style="fill:black;  font-size:20">
                            <xsl:value-of select="author"/>
                        </text>
                    </a>
                    <text onmouseover="show('imageId14')" onmouseout="hide('imageId14')" x="450" y="{$position + 100}"
                          style="fill:black; font-size:20px; font-style:italic">
                        <xsl:value-of select="bookTitle"/>
                    </text>
                </xsl:if>

                <xsl:if test="author = 'Charles Nicholl'">
                    <image id="imageId15" width="200" height="200" x="740" y="1000"
                           href="https://ecsmedia.pl/c/leonardo-da-vinci-b-iext97205306.jpg"
                           visibility="hidden"/>
                    <a href="https://en.wikipedia.org/wiki/Charles_Nicholl_(author)" target="_blank">
                        <text onmouseover="on_authors_hover(evt)" onmouseout="on_authors_out(evt)" x="80"
                              y="{$position + 100}" style="fill:black;  font-size:20">
                            <xsl:value-of select="author"/>
                        </text>
                    </a>
                    <text onmouseover="show('imageId15')" onmouseout="hide('imageId15')" x="450" y="{$position + 100}"
                          style="fill:black; font-size:20px; font-style:italic">
                        <xsl:value-of select="bookTitle"/>
                    </text>
                </xsl:if>

                <text x="1250" y="{$position + 100}" style="fill:black;  font-size:18">
                    <xsl:value-of select="readersRating"/>
                </text>
                <line onmouseover="line_hover(evt)" onmouseout="line_over(evt)" x1="1000" y1="{$position + 94}"
                      x2="1000"
                      y2="{$position + 94}" stroke-width="10" stroke="black">
                    <animate attributeName="x2" attributeType="XML" begin="0s" dur="2s" fill="freeze" from="1000"
                             to="{$reviews}"/>
                </line>

            </xsl:for-each>

            <a xlink:href="#Cookbooks">
                <text onmouseout="link_out(evt)" onclick="link_click(evt)" onmouseover="link_hover(evt)" x="370" y="65"
                      style="fill:black; font-size:24; text-decoration:underline;">Książki kucharskie
                </text>
            </a>
            <a id="Cookbooks">
                <text x="200" y="1250" style="fill:black; font-size:30; font-family:Arial Black;">Książki
                    kucharskie
                </text>
            </a>

            <xsl:for-each select="task7/bookCatalog/book[libraryDepartment = 'Cookbooks']">
                <xsl:variable name="position" select="1200+(position()-1) * 40"/>
                <xsl:variable name="reviews" select="1000+readersRating * 2.5"/>

                <xsl:if test="author = 'Marion Rombauer Becker'">
                    <image id="imageId16" width="200" height="200" x="700" y="1200"
                           href="https://www.swiatksiazki.pl/media/catalog/product/cache/eaf55611dc9c3a2fa4224fad2468d647/3/6/3699906611336.jpg"
                           visibility="hidden"/>
                    <a href="https://en.wikipedia.org/wiki/Marion_Rombauer_Becker" target="_blank">
                        <text onmouseover="on_authors_hover(evt)" onmouseout="on_authors_out(evt)" x="80"
                              y="{$position + 100}" style="fill:black;  font-size:20">
                            <xsl:value-of select="author"/>
                        </text>
                    </a>
                    <text onmouseover="show('imageId16')" onmouseout="hide('imageId16')" x="450" y="{$position + 100}"
                          style="fill:black; font-size:20px; font-style:italic">
                        <xsl:value-of select="bookTitle"/>
                    </text>
                </xsl:if>


                <text x="1250" y="{$position + 100}" style="fill:black;  font-size:18">
                    <xsl:value-of select="readersRating"/>
                </text>
                <line onmouseover="line_hover(evt)" onmouseout="line_over(evt)" x1="1000" y1="{$position + 94}"
                      x2="1000"
                      y2="{$position + 94}" stroke-width="10" stroke="black">
                    <animate attributeName="x2" attributeType="XML" begin="0s" dur="2s" fill="freeze" from="1000"
                             to="{$reviews}"/>
                </line>

            </xsl:for-each>

            <a xlink:href="#History">
                <text onmouseout="link_out(evt)" onclick="link_click(evt)" onmouseover="link_hover(evt)" x="620" y="65"
                      style="fill:black; font-size:24; text-decoration:underline;">Książki historyczne
                </text>
            </a>
            <a id="History">
                <text x="200" y="1400" style="fill:black; font-size:30; font-family:Arial Black;">Książki
                    historyczne
                </text>
            </a>

            <xsl:for-each select="task7/bookCatalog/book[libraryDepartment = 'History']">
                <xsl:variable name="position" select="1350+(position()-1) * 40"/>
                <xsl:variable name="reviews" select="1000+readersRating * 2.5"/>

                <xsl:if test="author = 'Barbara Tuchman'">
                    <image id="imageId17" width="200" height="200" x="650" y="1350"
                           href="https://images-na.ssl-images-amazon.com/images/I/81ijRAC+c3L.jpg"
                           visibility="hidden"/>
                    <a href="https://pl.wikipedia.org/wiki/Barbara_Tuchman" target="_blank">
                        <text onmouseover="on_authors_hover(evt)" onmouseout="on_authors_out(evt)" x="80"
                              y="{$position + 100}" style="fill:black;  font-size:20">
                            <xsl:value-of select="author"/>
                        </text>
                    </a>
                    <text onmouseover="show('imageId17')" onmouseout="hide('imageId17')" x="450" y="{$position + 100}"
                          style="fill:black; font-size:20px; font-style:italic">
                        <xsl:value-of select="bookTitle"/>
                    </text>
                </xsl:if>

                <xsl:if test="author = 'David McCullogh'">
                    <image id="imageId18" width="200" height="200" x="650" y="1350"
                           href="https://d28hgpri8am2if.cloudfront.net/book_images/cvr9780743223133_9780743223133_hr.jpg"
                           visibility="hidden"/>
                    <a href="https://pl.wikipedia.org/wiki/David_McCullogh" target="_blank">
                        <text onmouseover="on_authors_hover(evt)" onmouseout="on_authors_out(evt)" x="80"
                              y="{$position + 100}" style="fill:black;  font-size:20">
                            <xsl:value-of select="author"/>
                        </text>
                    </a>
                    <text onmouseover="show('imageId18')" onmouseout="hide('imageId18')" x="450" y="{$position + 100}"
                          style="fill:black; font-size:20px; font-style:italic">
                        <xsl:value-of select="bookTitle"/>
                    </text>
                </xsl:if>

                <text x="1250" y="{$position + 100}" style="fill:black;  font-size:18">
                    <xsl:value-of select="readersRating"/>
                </text>
                <line onmouseover="line_hover(evt)" onmouseout="line_over(evt)" x1="1000" y1="{$position + 94}"
                      x2="1000"
                      y2="{$position + 94}" stroke-width="10" stroke="black">
                    <animate attributeName="x2" attributeType="XML" begin="0s" dur="2s" fill="freeze" from="1000"
                             to="{$reviews}"/>
                </line>

            </xsl:for-each>

            <a xlink:href="#Poetry">
                <text onmouseout="link_out(evt)" onclick="link_click(evt)" onmouseover="link_hover(evt)" x="870" y="65"
                      style="fill:black; font-size:24; text-decoration:underline;">Poezja
                </text>
            </a>
            <a id="Poetry">
                <text x="250" y="1550" style="fill:black; font-size:30; font-family:Arial Black;">Poezja
                </text>
            </a>

            <xsl:for-each select="task7/bookCatalog/book[libraryDepartment = 'Poetry']">
                <xsl:variable name="position" select="1500+(position()-1) * 40"/>
                <xsl:variable name="reviews" select="1000+readersRating * 2.5"/>

                <xsl:if test="author = 'Adam Mickiewicz'">
                    <image id="imageId19" width="200" height="200" x="650" y="1520"
                           href="https://ecsmedia.pl/c/ballady-i-romanse-b-iext102863078.jpg"
                           visibility="hidden"/>
                    <a href="https://pl.wikipedia.org/wiki/Adam_Mickiewicz" target="_blank">
                        <text onmouseover="on_authors_hover(evt)" onmouseout="on_authors_out(evt)" x="80"
                              y="{$position + 100}" style="fill:black;  font-size:20">
                            <xsl:value-of select="author"/>
                        </text>
                    </a>
                    <text onmouseover="show('imageId19')" onmouseout="hide('imageId19')" x="450" y="{$position + 100}"
                          style="fill:black; font-size:20px; font-style:italic">
                        <xsl:value-of select="bookTitle"/>
                    </text>
                </xsl:if>

                <xsl:if test="author = 'Walt Whitman'">
                    <image id="imageId20" width="200" height="200" x="650" y="1520"
                           href="https://images-na.ssl-images-amazon.com/images/I/71ZUAQQ-9IL.jpg"
                           visibility="hidden"/>
                    <a href="https://pl.wikipedia.org/wiki/Walt_Whitman" target="_blank">
                        <text onmouseover="on_authors_hover(evt)" onmouseout="on_authors_out(evt)" x="80"
                              y="{$position + 100}" style="fill:black;  font-size:20">
                            <xsl:value-of select="author"/>
                        </text>
                    </a>
                    <text onmouseover="show('imageId20')" onmouseout="hide('imageId20')" x="450" y="{$position + 100}"
                          style="fill:black; font-size:20px; font-style:italic">
                        <xsl:value-of select="bookTitle"/>
                    </text>
                </xsl:if>

                <text x="1250" y="{$position + 100}" style="fill:black;  font-size:18">
                    <xsl:value-of select="readersRating"/>
                </text>
                <line onmouseover="line_hover(evt)" onmouseout="line_over(evt)" x1="1000" y1="{$position + 94}"
                      x2="1000"
                      y2="{$position + 94}" stroke-width="10" stroke="black">
                    <animate attributeName="x2" attributeType="XML" begin="0s" dur="2s" fill="freeze" from="1000"
                             to="{$reviews}"/>
                </line>
            </xsl:for-each>
            <text x="500" y="1750" style="fill:black; font-size:30; font-family:Arial Black;">Wartość książki w PLN
            </text>
            <xsl:for-each select="task7/bookCatalog/book">
                <xsl:sort select="bookValue/bookValueInPLN" data-type="number" order="descending"/>
                <xsl:variable name="nr" select="(position()-1) * 75"/>
                <xsl:variable name="value" select="bookValue/bookValueInPLN"/>

                <text x="{$nr + 97}" y="{1940-$value*2}" style="fill:black; font-size:18">
                    <xsl:value-of select="$value"/>
                </text>
                <line onclick="line_click(evt)" x1="{$nr + 120}" y1="1980" x2="{$nr + 120}" y2="1980"
                      fill="black"
                      stroke="black" stroke-width="20">

                <animate attributeType="XML" attributeName="y2" from="2000" to="{1950-$value*2}"
                         dur="2s" fill="freeze"/>
                </line>
                <text writing-mode="tb" x="{$nr + 115}" y="2000"  style="fill:black; font-size:20px; font-style:italic">
                    <xsl:value-of select="bookTitle"/>
                </text>
            </xsl:for-each>

        </svg>
    </xsl:template>
</xsl:stylesheet>