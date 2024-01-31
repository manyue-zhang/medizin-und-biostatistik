##############################################################################
### Berechnung des kritischen Werts aus dem Beispiel in B2 ###################
##############################################################################

## Binomialverteilung

n = 10
p = 1/2

### Einseitiger Test ##########################################################
### Bestimmung des kritischen Wertes durch sukzessives Ausrechnen

## W-keit P(X >= 7)= 1 - P(X <= 6)
1-pbinom(6,n,p)

## W-keit P(X >= 8)= 1 - P(X <= 7)
1-pbinom(7,n,p)

## W-keit P(X >= 9)= 1 - P(X <= 8)
1-pbinom(8,n,p)                    # -> kritischer Wert ist 9

### Direkt �ber Quantilfunktion
qbinom(0.95,n,p)
?qbinom                            # Nachschauen, wie qbinom definiert ist

# Plausibilisierung des Ergebnisses
pbinom(7,n,p)
pbinom(8,n,p)



###############################################################################
### Darstellung von Binomialwahrscheinlichkeiten ##############################
###############################################################################

## Erzeugung eines Vektors von �quidistanten x-Werten
x = 0:10; x
seq(0,10)
seq(0,10,by = 0.25)

## Berechnung der Binomialwahrscheinlichkeiten
dbinom(x,n,p)

## Plot-Funktion
y = dbinom(x,n,p)
plot(x,y)

# Darstellung der Punkte und Beschriftung von Achsen
?plot
plot(x,y,type = "h", main = "Binomialwahrscheinlichkeiten")

# �nderung von Farben und Linienst�rken
?par
plot(x,y,type = "h", col = "red", lwd = 4,
     main = "Binomialwahrscheinlichkeiten")
colors()

# �nderung der Anzahl der Tickmarks
plot(x,y,type = "h", col = "red", lwd = 4, xaxp = c(0,10,10),
     main = "Binomialwahrscheinlichkeiten")

## Barplot-Funktion
barplot(y)

# Anzeige der x-Werte
?barplot
barplot(y, names.arg = x, col = "red", 
	  xlab = "x", ylab = "y", main = "Binomialwahrscheinlichkeiten")

# �nderung der Balkenbreite
barplot(y, names.arg = x, col = "red", space = 2,
	  xlab = "x", ylab = "y", main = "Binomialwahrscheinlichkeiten")


 
###############################################################################
### Binomialwahrscheinlichkeiten f�r verschiedene Parameterwerte  #############
###############################################################################
n = 20 #konstant
x = 0:n

p = 0.75 
barplot(dbinom(x,n,p), names.arg = x, col = "red", space = 2,
	  xlab = "x", ylab = "y", main = "Binomialwahrscheinlichkeiten")       
              


###############################################################################
### Einige diskrete Verteilungen in R  ########################################
###############################################################################

## Poisson-Verteilung #########################################################
x = 1:24

lambda = 12
y = dpois(x,lambda)
plot(x,y,type = "h", col = "red", lwd = 4,
     main = paste("Poissonverteilung mit lambda =", lambda))


## Geometrische Verteilung ####################################################
x = 0:10

p = 0.2
y = dgeom(x,prob = p)
plot(x,y,type = "h", col = "red", lwd = 4,
     main = paste("Geometrische Verteilung mit p =", p),
     sub = "Anzahl Misserfolge bis zum ersten Erfolg")     



## Negativ-Binomialverteilung #################################################
x = 0:10

# r = 1
y = dnbinom(x, 1, 0.2)
plot(x,y,type = "h", col = "red", lwd = 4,
     main = "Negative-Binomialverteilung mit r = 1, p = 0.2",
     sub = "Anzahl Misserfolge bis zum ersten Erfolg")   

# r = 2
y = dnbinom(x, 2, 0.2)
plot(x,y,type = "h", col = "red", lwd = 4,
     main = "Negative-Binomialverteilung mit r = 2, p = 0.2",
     sub = "Anzahl Misserfolge bis zum zweiten Erfolg")   

# r = 3
y = dnbinom(x, 3, 0.2)
plot(x,y,type = "h", col = "red", lwd = 4,
     main = "Negative-Binomialverteilung mit r = 3, p = 0.2",
     sub = "Anzahl Misserfolge bis zum dritten Erfolg")   

  
## Hypergeometrische Verteilung ###############################################
?dhyper

x = 0:10
y = dhyper(x,20,30,10) # 20 wei�e, 30 schwarze Kugeln in Urne; 10 gezogen
plot(x,y,type = "h", col = "red", lwd = 4,
     main = "Hypergeometrische Verteilung mit N = 50, K = 20, n = 10",
     sub = "Anzahl wei�er Kugeln in Stichprobe",
     ylim = c(0,0.3))   

par(new = TRUE) # Entsprechende Binomialwahrscheinlichkeiten dazu gezeichnet
plot(x,dbinom(x,10,0.4), col = "blue", lwd = 4,
     ylab = "",     
     ylim = c(0,0.3))   



###############################################################################
### Rechnungen zum Beispiel 1 aus B 2  ########################################
###############################################################################

## Normalverteilung
x = seq(-3,3,by = 0.05)
y = dnorm(x, mean = 0, sd = 1)
plot(x,y, type = "l", lwd = 2, col = "red",
     main = "Dichte der Standardnormalverteilung")

## Exakte Wahrscheinlichkeit
n = 1000
p = 0.5
1-pbinom(529,n,p)
1-pbinom(529,n,p)+pbinom(470,n,p)

## Normalverteilungsapproximation
n = 1000; p = 0.5
1-pnorm((530-n*p)/sqrt(n*p*(1-p)))   # ohne Stetigkeitskorrektur
1-pnorm((529.5-n*p)/sqrt(n*p*(1-p))) # mit Stetigkeitskorrektur



###############################################################################
### Grafische Darstellung der Approximation ###################################
###############################################################################

### Dies ist Gegenstand einer �bung ###########################################



###############################################################################
### Einige R-Befehle zum Beispiel 2 aus B2 ####################################
###############################################################################

## Erzeugung der Tabelle in Beispiel 2                                  #######
## Hintergrund: Ben�tigter Stichprobenumfang, um signifikantes Ergebnis #######
##              zu erhalten                                             #######
###############################################################################

p = 0.50       # W-keit f�r M�dchengeburt unter Nullhypothese
p_beob = 0.51  # beobachtete relative H�ufigkeit von M�dchengeburten 

n = c(100, 1000, 3000, 5000, 10000, 50000) # Stichprobenumf�nge
w = n*p_beob                               # beobachtete M�dchengeburten
w

z = round((w - n*p)/sqrt(n*p*(1-p)),2)     # beobachtete z-Werte Normalapprox. 
z
p_W = round(1-pnorm(z),4)                  # zugeh�rige p-Werte
p_W

## Zusammenfassung
Tabelle_1 = cbind(n,w,z,p_W)
Tabelle_2 = data.frame(n,w,z,p_W)

Tabelle_1
Tabelle_2

class(Tabelle_1)
class(Tabelle_2)

colnames(Tabelle_2) = c("N", "Anzahl M", "z-Wert", "p-Wert")
Tabelle_2
print(Tabelle_2, row.names = FALSE) 

## Working Directory
getwd()
setwd("Q:/2022 WS/Vorlesungen/Medizin- und Biostatistik/R-Outputs")

## Ausgabe in Excel-CSV-Datei
write.csv2(Tabelle_2, "Tabelle.csv", row.names = FALSE)

## Einlesen aus Excel-CSV-Datei
Tabelle_3 = read.csv2("Tabelle.csv") 
Tabelle_3

# falls die ersten drei Zeilen nicht eingelesen werden sollen:
Tabelle_4 = read.csv2("Tabelle.csv", skip = 3, header = FALSE) 
Tabelle_4

## kritischer z-Wert
qnorm(0.95)