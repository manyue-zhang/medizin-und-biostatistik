###############################################################################
### Mehrfelder-Chi-Quadrat-Test              ##################################
### Beispiel: Regionales Krankheitsaufkommen ##################################
###############################################################################

x_star = c(74, 36, 155)
p_null = c(0.25, 0.12, 0.63) 

### Mit in R implementierem Chi-Quadrat-Test ##################################

chisq.test(x_star,p_null)            # Achtung: dieser Aufruf f�hrt nicht zum Ziel
chisq.test(x_star, y = NULL, p_null) # ebenfalls falsch
chisq.test(x_star, y = NULL, correct = TRUE, p_null)
chisq.test(x = x_star,p = p_null)

### Ausgabe erwartete H�ufigkeiten unter H0
chisq.test(x = x_star,p = p_null)$expected

### Einzelne Summanden der Teststatistik
chisq.test(x = x_star,p = p_null)$residuals          # Residuen
(chisq.test(x = x_star,p = p_null)$residuals)^2      # Einzelne Summanden
sum((chisq.test(x = x_star,p = p_null)$residuals)^2) # Wert der Teststatistik


### Exakter Multinomialtest zum Vergleich ##################################### 

library(EMT)
multinomial.test(observed = x_star, prob = p_null)

# �ber Chi-Quadrat-Approximation
multinomial.test(observed = x_star, prob = p_null,
                 useChisq = TRUE)



###############################################################################
### Chiquadrat-Anpassungstest                          ########################
### Beispiel: Diagnostik von Hirnsch�den (Benton Test) ########################
###############################################################################

### Gesch�tzte Verteilungsparameter der postulierten Normalverteilung
mu = 106.78
sigma = 21.48

### Festlegung Intervallgrenzen
x = c(-Inf, seq(80,140,by = 10), Inf) # Intervallgrenzen nach
                                      # Zusammenfassung der urspr�nglich
                                      # ersten beiden Intervalle
x

### Beobachtungen in den Intervallen
b = c(13,7,12,17,15,13,7,6)
n = sum(b)

### Berechnung der Wahrscheinlichkeiten unter H0
( x_unten = x[-length(x)] )           # ohne letzten Wert von x 
( x_oben = x[-1] )                    # ohne ersten Wert von x
p_null = pnorm(x_oben,mu,sigma) - pnorm(x_unten,mu,sigma)
p_null
length(p_null)

### Berechnung der erwarteten H�ufigkeiten unter H0
round(n*p_null,2)


### Mit in R implementierem Chi-Quadrat-Test ##################################

( ergebnis = chisq.test(x = b,p = p_null) )  # Achtung: Anzahl FG -> p-Wert passt nicht

### Ausgabe erwartete H�ufigkeiten unter H0
round(ergebnis$expected,2)

### Einzelne Summanden der Teststatistik
round((ergebnis$residuals)^2,2)       

### Manuelle Berechnung des p-Wertes (Anpassung Anzahl Freiheitsgrade)
ergebnis$statistic[[1]]               # Wert der Teststatistik
( p_W = 1- pchisq(ergebnis$statistic[[1]],5) )



###############################################################################
### Fisher-Yates-Test                                      ####################
### Beispiel: Diagnostischer Test zum Aufdecken von Typhus ####################
###############################################################################

### Komplett manuelle Berechnung �ber hypergeometrische W-keiten
###############################################################################

### beobachtete Tafel
choose(7,4)
choose(8,1)
choose(15,5)

( p_star = choose(7,4)*choose(8,1)/choose(15,5) )
dhyper(4,7,8,5)

### noch extremere Tafel
choose(7,5)
choose(8,0)
choose(15,5)

choose(7,5)*choose(8,0)/choose(15,5)
dhyper(5,7,8,5)

### Erzeugung der Grafik 
n_11 = 0:5
p = dhyper(n_11,7,8,5)
plot(n_11,p,type = "h", col = "red", lwd = 5,
     main = "Hypergeometrische Wahrscheinlichkeiten")
abline(h=dhyper(4,7,8,5), col = "blue", lwd = 3, lty = 2)


### Testdurchf�hrung mit dem in R implementierten Befehl
###############################################################################

tafel = matrix(c(4,1,3,7),2,2,byrow = TRUE)               
dimnames(tafel) =  list(c("Typhus", "Paratyphus"), c("pos", "neg")) 
tafel

fisher.test(tafel, alternative = "greater")  # einseitiger Test
fisher.test(tafel)                           # zweiseitiger Test



###############################################################################
### Vierfelder-Chi-Quadrat-Test                                     ###########
### Beispiel: Famili�re Belastung und Auftretensalter von Epilepsie ###########
###############################################################################

tafel = matrix(c(5,5,6,24),2,2,byrow = TRUE)                 
dimnames(tafel) = list(c("hoch", "niedrig"), c("7-12", "13-18")) 
tafel

chisq.test(tafel, correct = FALSE) 
chisq.test(tafel) 
chisq.test(tafel)$expected 

# Exakter Fisher-Yates-Test zum Vergleich #####################################

fisher.test(tafel)

# Grafik der exakten Wahrscheinlichkeiten
n_11 = 0:10
p = dhyper(n_11,11,29,10)
plot(n_11,p,type = "h", col = "red", lwd = 5,
     main = "Hypergeometrische Wahrscheinlichkeiten")
abline(h=dhyper(5,11,29,10), col = "blue", lwd = 3, lty = 2)

# p-Wert-Bestimmung beim exakten Test von Fisher (zu Fu�)
n_pw = c(0,5:10)
p_w_exakt = sum(dhyper(n_pw,11,29,10))
p_w_exakt

# Kritischer Wert und p-Werte bei Chi-Quadrat-Test (zu Fu�)
qchisq(0.95,1)
1-pchisq(3.3855799,1)
1-pchisq(2.0480669,1)



###############################################################################
### Freeman-Halton-Test                                         ###############
### Beispiel: Behandlungserfolg bei Zwang- und Angstneurotikern ###############
###############################################################################


### Zu Fu� f�r Beispiel #######################################################

# W-keit f�r Tafel in Abh�ngigkeit der Elemente n11 (=x) und n31 (=y)
ptafel = function(x,y){
z�hler = factorial(5)*factorial(12)*factorial(6)*factorial(8)*factorial(3)
nenner = factorial(17)*factorial(x)*factorial(6-x)*factorial(5-x-y)*factorial(3+x+y)*factorial(y)*factorial(3-y)
q = z�hler / nenner
return(q)
}

# W-keit f�r beobachtete Tafel
( p_star = ptafel(0,2) )      

# Alle 18 Tafeln
komb = matrix(c(5,0,4,0,3,0,2,0,1,0,0,0,
                4,1,3,1,2,1,1,1,0,1,
                3,2,2,2,1,2,0,2,
                2,3,1,3,0,3),
                nrow = 18, ncol = 2, byrow = TRUE)
colnames(komb) = c("n11","n31")
komb

# Wahrscheinlichkeiten f�r alle 18 Tafeln
p = vector(length = 18)
for (k in 1:18) p[k] = ptafel(komb[k,1], komb[k,2])

round(p,4)
sum(p)

# p-Wert
p[which(p <= p_star)]           
length(p[which(p <= p_star)])  # Anzahl zu ber�cksichtigender Tafeln

p_w = sum(p[which(p <= p_star)])
p_w


### Mit in R implementiertem Test #############################################

tafel = matrix(c(0,6,3,5,2,1),3,2,byrow = TRUE)                 
dimnames(tafel) = list(c("gut", "m��ig", "unbefriedigend"), c("Zwang", "Angst")) 
tafel

fisher.test(tafel)
fisher.test(t(tafel))    # Man kann auch die transponierte Tafel nehmen


### Trendalternativhypothese am Beispiel ######################################

# Trendwerte f�r die 18 Tafeln
trend = 10-komb[,1]+komb[,2]
trend

# Relevante Tafeln f�r p-Wert
which(trend >=12)
komb[which(trend >=12),]

# p-Wert-Berechnung
ptafel(1,3)
ptafel(0,3)

p_star + ptafel(1,3) + ptafel(0,3)



###############################################################################
### (kx2)-Felder-Chi-Quadrat-Test                                  ############
### Beispiel: Drei Formen von Schizophrenie bei M�nnern und Frauen ############
###############################################################################

tafel = matrix(c(30,25,60,55,61,93),3,2, byrow = TRUE)                 
dimnames(tafel) = list(c("Hebephrene", "Katakone", "Paranoide"), c("m�nnlich", "weiblich")) 
tafel

chisq.test(tafel)
round(chisq.test(tafel)$expected,1)
round((chisq.test(tafel)$residuals)^2,2)



#####