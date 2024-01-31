
### Rechnungen zur APSAC-Studie
###############################################################################
###############################################################################
###############################################################################


###############################################################################
### Fisher-Yates-Test bei APSAC-Studie ########################################
###############################################################################

### Komplett manuelle Berechnung über hpergeometrische W-keiten

( p_star = choose(28,9)*choose(285,153)/choose(313,162) )
dhyper(9,28,285,162)

# Erzeugung der Grafik 
n_11 = 0:28
p = dhyper(n_11,28,285,162)
plot(n_11,p,type = "h", col = "red", lwd = 5,
     main = "Hypergeometrische Wahrscheinlichkeiten")
abline(h=dhyper(9,28,285,162), col = "blue", lwd = 3, lty = 2)

# Wahrscheinlichkeiten sind tatsächlich nicht exakt symmetrisch
dhyper(14,28,285,162)
dhyper(15,28,285,162)
dhyper(20,28,285,162)

# p-Wert-Berechnung
sum(p[1:10])  # Achtung: n_11 = 0  steht in p[1] , n_11 = 9  steht in p[10]
sum(p[21:29]) # Achtung: n_11 = 20 steht in p[21], n_11 = 28 steht in p[29]

sum(p[1:10])+ sum(p[21:29]) # zweiseitiger Test
sum(p[1:10])                # einseitiger Test

### Testdurchführung mit dem in R implementierten Befehl
tafel = matrix(c(9,153,19,132),2,2,byrow = TRUE)               
dimnames(tafel) = list(c("APSAC", "Heparin"), c("verstorben", "überlebt")) 
tafel

fisher.test(tafel)                           # zweiseitiger Test
fisher.test(tafel, alternative = "less")     # einseitiger Test


###############################################################################
### Vierfelder-Chi-Quadrat-Test bei APSAC-Studie ##############################
###############################################################################

### Übliche Formulierung
tafel = matrix(c(9,153,19,132),2,2,byrow = TRUE)               
dimnames(tafel) = list(c("APSAC", "Heparin"), c("verstorben", "überlebt")) 
tafel

chisq.test(tafel, correct = FALSE) 
chisq.test(tafel) 
chisq.test(tafel)$expected 


### Modifizierte Teststatistik
( Erw_n11 = 28*162/313 )
( Var_n11 = 28*285*162*151/(313^2*312) )
( Xq_mod = (9-Erw_n11)^2/Var_n11 )

( p_w_mod = 1-pchisq(Xq_mod,1) )


###############################################################################
### Differenz der W-keiten bei APSAC-Studie ###################################
###############################################################################

# Relative Häufigkeiten 
( p_1 = 9/162 )
( p_2 = 19/151 )
p = 28/313

n_1 = 162
n_2 = 151

( Delta = p_1 - p_2 )

# Geschätzter Standardfehler
( se_1 = sqrt(p_1*(1-p_1)/n_1 + p_2*(1-p_2)/n_2) )
( se_2 = sqrt(p*(1-p)*(1/n_1 + 1/n_2)) )

# Approximative KI für die Differenz der W-keiten
( zq = qnorm(0.975) )
Delta - zq*se_1
Delta + zq*se_1

Delta - zq*se_2
Delta + zq*se_2


###############################################################################
### Relatives Risiko bei APSAC-Studie #########################################
###############################################################################

# Relatives Risiko
( RR = (9/162)/(19/151) )
log(RR)

# Geschätzter Standardfehler
( SE = sqrt((1-9/162)/9 + (1-19/151)/19 ) )

# Approximative KI für ln(RR)
( zq = qnorm(0.975) )
log(RR) - zq*SE
log(RR) + zq*SE

# Approximative KI für RR
exp(log(RR)-zq*SE)
exp(log(RR)+zq*SE)


###############################################################################
### Odds Ratio bei APSAC-Studie ###############################################
###############################################################################

# Odds Ratio
( OR = 9*132/(19*153) )
log(OR)

# Geschätzter Standardfehler
( SE = sqrt(1/9 + 1/153 + 1/19 + 1/132) )

# Approximative KI für ln(OR)
( zq = qnorm(0.975) )
log(OR) - zq*SE
log(OR) + zq*SE

# Approximative KI für OR
exp(log(OR)-zq*SE)
exp(log(OR)+zq*SE)


###############################################################################
### Beispiel CMH-Test #########################################################
###############################################################################

# Spaltenweises Einlesen der Daten als Array
tafel = array(c( 3,11,86,69,
                 6, 8,67,63),
             dim = c(2,2,2))

# Einfache Beschriftung
dimnames(tafel) = list(
                        c("APSAC","Heparin"),c("verstorben","überlebt"),          
				c("Hinterwand","Vorderwand")
                       )

tafel

# Komfortablere Beschriftung
dimnames(tafel) = list(
                        Therapie = c("APSAC","Heparin"),
				Ergebnis = c("verstorben","überlebt"),          
				Lokation = c("Hinterwand","Vorderwand")
                       )
tafel

# Durchführung des CMH-Tests
mantelhaen.test(x = tafel,correct = FALSE, exact = FALSE)

ergebnis = mantelhaen.test(x = tafel, alternative = c("two.sided"),
                correct = FALSE, exact = FALSE)
ergebnis
ergebnis$estimate
ergebnis$statistic


###############################################################################
### Binäre Logistische Regression: nur logistische Funktion ###################
###############################################################################

### Logistische Funktion
logistic = function(x) exp(x)/(1+exp(x))

x = seq(-5,5, by = 0.01)
windows(6,4)
plot(x, logistic(x), type = "l", lwd = 4, col = "blue", cex.main = 1.5,
     main = "Logistische Funktion", cex.axis = 1.0, cex.lab = 1.2,
     xlab = "Lineare Komponente" )



### Weitere Tests
###############################################################################
###############################################################################
###############################################################################


###############################################################################
### Beispiel (kxm)-Felder-Chi-Quadrat-Test ####################################
###############################################################################

tafel = matrix(c(28,9,3,17,1,2,5,0,25),3,3,byrow = TRUE)                 
dimnames(tafel) = 
   list(c("Staphylokokken", "Streptokokken","Pseudomonas aeruginosa"),
        c("sehr positiv", "positiv","negativ")) 
tafel

chisq.test(tafel, correct = FALSE) 
chisq.test(tafel) 
chisq.test(tafel)$expected 
(chisq.test(tafel)$residuals)^2 


###############################################################################
### Beispiel McNemar-Test #####################################################
###############################################################################

tafel = matrix(c(9,15,4,10),2,2, byrow = TRUE)                 
dimnames(tafel) = 
   list(c("A: starke Wirkung", "A: geringe Wirkung"),
        c("B: starke Wirkung", "B: geringe Wirkung")) 
tafel

mcnemar.test(tafel, correct = TRUE) # implementiert ist zweiseitiger Test


###############################################################################
### Beispiel Median-Test ######################################################
###############################################################################

# Eingabe der Daten und Bestimmung des empirischen gemeinsamen Medians
isol = c(1,4,1,2,2,1,5,1,2)
integ = c(1,4,4,1,3,2,4,4,5,4,4)

med = median(c(isol,integ))
med

# Erzeugung der entsprechenden Vierfeldertafel
n11 = sum(isol  > med)
n12 = sum(integ > med)
n21 = sum(isol  < med)
n22 = sum(integ < med)

tafel = matrix(c(n11,n12,n21,n22),2,2,byrow = TRUE)             
dimnames(tafel) = list(c("größer MED", "kleiner MED"), c("isoliert", "integriert")) 
tafel

# Durchführung der Vierfelder-Tests 
chisq.test(tafel, correct = FALSE) # zweiseitiger Chi-Quadrat-Test (ergibt Chi-Quadrat-Wert wie in Bortz)
qchisq(0.9,1)                      # kritischer Wert für einseitigen Test zum Niveau 5%

chisq.test(tafel, correct = TRUE)  # zweiseitiger Chi-Quadrat-Test mit Korrektur
chisq.test(tafel)$expected
 
fisher.test(tafel, alternative = "less")  # einseitig



#####