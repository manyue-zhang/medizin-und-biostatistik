<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1673001012528" ID="ID_1287797344" MODIFIED="1673465818349">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      B4-2: Testmethoden f&#252;r H&#228;ufigkeiten
    </p>
    <p style="text-align: left">
      <b>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Multinomialverteilung</b>
    </p>
  </body>
</html></richcontent>
<node CREATED="1672762831544" ID="ID_1880858779" MODIFIED="1672999606905" POSITION="right" TEXT=" n Versuche sind unabh&#xe4;ngig voneinander "/>
<node CREATED="1672762869055" ID="ID_532093803" MODIFIED="1673465847420" POSITION="right">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;Bei jedem Versuch erh&#228;lt man als Anfang eine Wert
    </p>
  </body>
</html></richcontent>
<node CREATED="1672762874852" ID="ID_936651989" MODIFIED="1673466032401" TEXT=" p = (p1, ..., pk) die W-keiten die Auspr&#xe4;gung auftreten"/>
<node CREATED="1672762883437" ID="ID_1108225118" MODIFIED="1672999746765" TEXT=" X = (X1, ..., Xk) bezeichnet die Anzahl der F&#xe4;lle die jeweilige Kategorie bei den n Versuchen auftritt "/>
</node>
<node CREATED="1672762881544" ID="ID_155117868" MODIFIED="1673465991788" POSITION="right" TEXT="Multinomialverteilung: X~ Mult(n;p)">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1673466016514" ID="ID_1733040570" MODIFIED="1673517329674" TEXT="mit p = (p1, ..., pk)"/>
<node CREATED="1673465996798" ID="ID_868030171" MODIFIED="1673466009675" TEXT="mit X = (X1, ..., Xk)"/>
</node>
<node CREATED="1672762986387" HGAP="22" ID="ID_1501121331" MODIFIED="1672999827512" POSITION="right" TEXT="Wahrscheinlichkeit f&#xfc;r die Realisierung x = (x1, ..., xk) ist gegeben durch" VSHIFT="13"/>
<node CREATED="1672763017272" HGAP="23" ID="ID_1186679737" MODIFIED="1673517406844" POSITION="right" VSHIFT="30">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      NUR k = 2 f&#252;hrt auf die Binomialverteilung: Xj~B(n; pj )&#160;&#160;
    </p>
  </body>
</html>
</richcontent>
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1673517430384" ID="ID_724707715" MODIFIED="1673517431183" TEXT=" marginalen Verteilung der Xj ">
<node CREATED="1673517435453" ID="ID_1066540036" MODIFIED="1673517452374" TEXT="Xj~B(n; pj ) "/>
</node>
</node>
<node CREATED="1672763045390" ID="ID_544440831" MODIFIED="1673517482313" POSITION="right">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Die Zufallveriable&#160;&#160;X1, ..., Xk sind<b>&#160;<u>nicht </u>unabh&#228;ngig&#160;</b>
    </p>
  </body>
</html>
</richcontent>
<arrowlink DESTINATION="ID_544440831" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_1730454090" STARTARROW="None" STARTINCLINATION="0;0;"/>
<arrowlink DESTINATION="ID_544440831" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_285432261" STARTARROW="None" STARTINCLINATION="0;0;"/>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_544440831" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_1730454090" SOURCE="ID_544440831" STARTARROW="None" STARTINCLINATION="0;0;"/>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_544440831" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_285432261" SOURCE="ID_544440831" STARTARROW="None" STARTINCLINATION="0;0;"/>
<node CREATED="1672763059600" ID="ID_496290542" MODIFIED="1672999946926" TEXT="Erwartungswerte: E[Xj] = n*pj"/>
<node CREATED="1672763078562" ID="ID_1184273268" MODIFIED="1672999965092" TEXT="Varianzen / Kovarianzen: Var[Xj]=n*pj*(1-pj) und Cov[Xi,Xj]=-n*pi*pj"/>
</node>
<node CREATED="1672763076497" ID="ID_1769450558" MODIFIED="1673517491524" POSITION="right" TEXT="Zusammenhang mit Poisson-Verteilung ">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1672763160870" ID="ID_1287362441" MODIFIED="1673517557031" TEXT="Betrachte k unabh&#xe4;ngige Poisson-verteilte  X1, ..., Xk:"/>
<node CREATED="1672763213916" HGAP="18" ID="ID_1588156702" MODIFIED="1673517630964" TEXT=" Summe N der Anzahlen Xj ist auch Poisson-verteilt: " VSHIFT="15"/>
<node CREATED="1672763226204" HGAP="22" ID="ID_1141499127" MODIFIED="1673000094106" TEXT="Bei Fixierung der Summe N auf den Wert n ist die bedingte Verteilung von X = (X1, ..., Xk) eine Multinomialverteilung " VSHIFT="22">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
</node>
<node CREATED="1672763244306" HGAP="26" ID="ID_654938053" MODIFIED="1673517720203" POSITION="right" VSHIFT="27">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      k Kategorien: k beobachtete und k erwartete H&#228;ufigkeiten vergleichen
    </p>
  </body>
</html>
</richcontent>
<arrowlink DESTINATION="ID_654938053" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_225269134" STARTARROW="None" STARTINCLINATION="0;0;"/>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_654938053" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_225269134" SOURCE="ID_654938053" STARTARROW="None" STARTINCLINATION="0;0;"/>
<node CREATED="1672763275229" ID="ID_109913544" MODIFIED="1673517732408" TEXT="Nullhypothese:  zweiseitig:   H0: p = p0   (p1,p2,...,pk) = (p01,p02,...,p0k)  "/>
<node CREATED="1672763300122" ID="ID_965409841" MODIFIED="1673517753339" TEXT=" Teststatistik X: X~Mult(n; p),  Xj: Anzahl F&#xe4;lle, in denen Kategorie j bei n Versuchen auftritt "/>
<node CREATED="1672763361476" ID="ID_317147921" MODIFIED="1672763362377" TEXT="Beobachteter Wert der Teststatistik ">
<node CREATED="1672763369927" ID="ID_181329463" MODIFIED="1672763370474" TEXT=" x* = (x1*, ..., xk*) "/>
<node CREATED="1672763372240" ID="ID_420235797" MODIFIED="1673517768105" TEXT="W-keit hier f&#xfc;r unter H0: "/>
</node>
<node CREATED="1672763399598" ID="ID_616158750" MODIFIED="1672763419437" TEXT="p-Wert zur Beobachtung x*:">
<node CREATED="1672763426038" ID="ID_643365403" MODIFIED="1673000219224" TEXT="Bezeichne M die Menge aller x-Werte mit P(X = x)  &lt;=p* "/>
<node CREATED="1672763457434" HGAP="24" ID="ID_1349233816" MODIFIED="1673000288907" TEXT=" p-Wert bestimmen: " VSHIFT="16"/>
</node>
</node>
<node CREATED="1672764175209" ID="ID_28602664" MODIFIED="1672764178076" POSITION="right" TEXT="Anmerkung">
<node CREATED="1672764183630" ID="ID_406943895" MODIFIED="1673000349839">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Formulierung f&#252;r ungerichteteNullhypothese&#160;
    </p>
  </body>
</html></richcontent>
<node CREATED="1672764234682" ID="ID_626727584" MODIFIED="1673000469069" TEXT="Abweichungen zwischen beobachteten H&#xe4;ufigkeiten und postulierten W-keiten in den jeweiligen Kategorie, wenn sie unter H0 selten wie p* sind "/>
</node>
<node CREATED="1672764196593" ID="ID_700794978" MODIFIED="1672764197140" TEXT="p-Wert ">
<node CREATED="1672764218559" ID="ID_453371982" MODIFIED="1673000549137" TEXT=" &#x201e;Extremer Wert&#x201c; der Teststatistik wird hier als &#x201e;Wert mit geringerer Eintretenswahrscheinlichkeit&#x201c; (unter H0) definiert "/>
<node CREATED="1672764228487" ID="ID_1366733153" MODIFIED="1673000586473" TEXT="Nicht leicht zu berechnen, da alle Kombinationsm&#xf6;glichkeiten, die mit einer W-keit&lt; = p*  verbunden sind, bestimmt werden m&#xfc;ssen "/>
</node>
<node CREATED="1672764244572" ID="ID_1025413224" MODIFIED="1673000657766">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;Multinomialtest: nur kleine Stichproben von kategorialen Daten benutzt&#160;
    </p>
  </body>
</html></richcontent>
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1672764263556" ID="ID_124702310" MODIFIED="1673000692731" TEXT="sinnvoll: ein asymptotischer Test f&#xfc;r sehr kleine n nicht anwendbar ist">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1672764284967" ID="ID_1136531504" MODIFIED="1673517946957" POSITION="right">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Beispiel zum Multinomialtest&#160;
    </p>
    <p>
      (Skelettanomalien bei Neugeborenen )
    </p>
    <p>
      <b>Im R&#252;ckseite</b>
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1672764307440" ID="ID_65960701" MODIFIED="1672764308312" TEXT="Multinomialtest">
<node CREATED="1672764313818" ID="ID_583106632" MODIFIED="1672764323552" TEXT=" Nullhypothese:  H0: p = p0   mit p0 = (70%, 20%, 10%) "/>
</node>
<node CREATED="1672764347141" ID="ID_1918765700" MODIFIED="1672764376959" TEXT="Teststatistik X:  X = (X1, X2, X3) X~Mult(3;p)">
<arrowlink DESTINATION="ID_1918765700" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_60812570" STARTARROW="None" STARTINCLINATION="0;0;"/>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_1918765700" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_60812570" SOURCE="ID_1918765700" STARTARROW="None" STARTINCLINATION="0;0;"/>
<node CREATED="1672764378468" HGAP="19" ID="ID_1544811686" MODIFIED="1673000890306" TEXT="Beobachteter Wert der Teststatistik x* = (0, 3, 0) " VSHIFT="-1"/>
<node CREATED="1672764384244" HGAP="21" ID="ID_1801815639" MODIFIED="1673000892273" TEXT="W-keit unter H0: " VSHIFT="8"/>
</node>
<node CREATED="1672764399145" ID="ID_1811453561" MODIFIED="1673000925448" TEXT=" p-Wert">
<node CREATED="1672764405718" HGAP="24" ID="ID_41938075" MODIFIED="1673000886358" TEXT=" Die Menge M enth&#xe4;lt drei Elemente: {(0,3,0),(0,1,2),(0,0,3)}" VSHIFT="16"/>
</node>
<node CREATED="1672764455964" ID="ID_1781476951" MODIFIED="1672764457169" TEXT="Testentscheidung: Wegen pW &lt; 5%, wird H0 abgelehnt ">
<node CREATED="1672764469913" ID="ID_1804059953" MODIFIED="1673000965500" TEXT=" Abweichungen der beobachteten von den postulierten H&#xe4;ufigkeiten sind signifikant ">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
</node>
<node CREATED="1672764480599" ID="ID_1401587116" MODIFIED="1672764486352" TEXT=" Rechnungen zur Ermittlung des p-Wertes pW  eine Tabelle"/>
</node>
</node>
</map>
