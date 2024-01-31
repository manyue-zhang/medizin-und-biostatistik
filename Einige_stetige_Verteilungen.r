
###############################################################################
### Einige stetige Verteilungen in R  #########################################
###############################################################################


## Uniforme Verteilung auf [a,b] ##############################################

x = seq(-3,3,by = 0.05)
y = dunif(x, -3, 3)
plot(x,y, type = "l", lwd = 2, col = "red",
     main = "Dichte der Uniformen Verteilung auf [-3, 3]")


## Exponentialverteilung ######################################################

x = seq(0,3,by = 0.05)
y = dexp(x, 1)
z = dexp(x, 2)

plot(x,y, type = "l", lwd = 2, col = "red",
     ylim = c(0,2), main = "Dichte der Exponentialverteilung")
par(new = TRUE)
plot(x,z, type = "l", lwd = 2, col = "blue",
     ylim = c(0,2), main = "", ylab = " ")

legend("topright", c("lambda = 1","lambda = 2"),
                 col = c("red","blue"), lty = 1, lwd = 2)


## Gammaverteilung ############################################################

x = seq(0,3,by = 0.05)

# shape = 1 (f�hrt auf Exponentialverteilung)
y = dgamma(x, 1, 1)
z = dgamma(x, 1, 2)

plot(x,y, type = "l", lwd = 2, col = "red",
     ylim = c(0,2), main = "Dichte der Gammaverteilung mit shape = 1")
par(new = TRUE)
plot(x,z, type = "l", lwd = 2, col = "blue",
     ylim = c(0,2), main = "", ylab = " ")

legend("topright", c("lambda = 1","lambda = 2"),
                 col = c("red","blue"), lty = 1, lwd = 2)

# shape = 2
y = dgamma(x, 2, 1)
z = dgamma(x, 2, 2)
t = dgamma(x, 2, 3)

plot(x,y, type = "l", lwd = 2, col = "red",
     ylim = c(0,2), main = "Dichte der Gammaverteilung mit shape = 2")
par(new = TRUE)
plot(x,z, type = "l", lwd = 2, col = "blue",
     ylim = c(0,2), main = "", ylab = " ")
par(new = TRUE)
plot(x,t, type = "l", lwd = 2, col = "darkgreen",
     ylim = c(0,2), main = "", ylab = " ")

legend("topright", c("lambda = 1","lambda = 2","lambda = 3"),
                 col = c("red","blue","darkgreen"), lty = 1, lwd = 2)

# lambda = 2
y = dgamma(x, 1, 2)
z = dgamma(x, 2, 2)
t = dgamma(x, 3, 2)

plot(x,y, type = "l", lwd = 2, col = "red",
     ylim = c(0,2), main = "Dichte der Gammaverteilung mit lambda = 2")
par(new = TRUE)
plot(x,z, type = "l", lwd = 2, col = "blue",
     ylim = c(0,2), main = "", ylab = " ")
par(new = TRUE)
plot(x,t, type = "l", lwd = 2, col = "darkgreen",
     ylim = c(0,2), main = "", ylab = " ")

legend("topright", c("shape = 1","shape = 2","shape = 3"),
                 col = c("red","blue","darkgreen"), lty = 1, lwd = 2)


## Chiquadrat-Verteilung#######################################################

x = seq(0,4,by = 0.01)

# Spezialfall der Gammaverteilung (alpha = n/2, lambda = 1/2)
n = 3             # als Beispiel n = 3 gew�hlt
alpha = n/2 
y = dchisq(x, n)
z = dgamma(x, alpha, 0.5)

plot(x,y, type = "l", lwd = 2, col = "red", lty = 2,
     ylim = c(0,1), main = "Chiquadratverteilung als Spezialfall der Gammaverteilung ")
par(new = TRUE)
plot(x,z, type = "l", lwd = 2, col = "blue", lty = 3,
     ylim = c(0,1), main = "", ylab = " ")


# Verschiedene Freiheitsgrade
y = dchisq(x, 1)
z = dchisq(x, 2)
t = dchisq(x, 3)
s = dchisq(x, 4)

plot(x,y, type = "l", lwd = 2, col = "red",
     ylim = c(0,1), main = "Dichte der Chiquadratverteilung mit n Freiheitsgraden")
par(new = TRUE)
plot(x,z, type = "l", lwd = 2, col = "blue",
     ylim = c(0,1), main = "", ylab = " ")
par(new = TRUE)
plot(x,t, type = "l", lwd = 2, col = "darkgreen",
     ylim = c(0,1), main = "", ylab = " ")
par(new = TRUE)
plot(x,s, type = "l", lwd = 2, col = "chocolate4",
     ylim = c(0,1), main = "", ylab = " ")

legend("topright", c("n = 1","n = 2","n = 3","n = 4"),
                 col = c("red","blue","darkgreen","chocolate4"),
                 lty = 1, lwd = 2)


## t-Verteilung ###############################################################

x = seq(-3,3,by = 0.01)

y = dt(x, 1)
z = dt(x, 2)
t = dt(x, 3)
s = dt(x, 10)

plot(x,y, type = "l", lwd = 2, col = "red",
     ylim = c(0,0.5), main = "Dichte der t-Verteilung mit n Freiheitsgraden")
par(new = TRUE)
plot(x,z, type = "l", lwd = 2, col = "blue",
     ylim = c(0,0.5), main = "", ylab = " ")
par(new = TRUE)
plot(x,t, type = "l", lwd = 2, col = "darkgreen",
     ylim = c(0,0.5), main = "", ylab = " ")
par(new = TRUE)
plot(x,s, type = "l", lwd = 2, col = "chocolate4",
     ylim = c(0,0.5), main = "", ylab = " ")
par(new = TRUE)
plot(x,dnorm(x), type = "l", lwd = 2, col = "orange",
     ylim = c(0,0.5), main = "", ylab = " ")


legend("topright", c("n = 1","n = 2","n = 3","n = 10", "N(0;1)"),
                 col = c("red","blue","darkgreen","chocolate4","orange"),
                 lty = 1, lwd = 2)


## F-Verteilung ###############################################################

x = seq(0,4,by = 0.01)

# konstantes m = 1

y = df(x, 1, 1)
z = df(x, 2, 1)
t = df(x, 3, 1)
s = df(x, 10, 1)
u = df(x, 50, 1)

plot(x,y, type = "l", lwd = 2, col = "red",
     ylim = c(0,1), main = "Dichte der F-Verteilung mit (n,1) Freiheitsgraden")
par(new = TRUE)
plot(x,z, type = "l", lwd = 2, col = "blue",
     ylim = c(0,1), main = "", ylab = " ")
par(new = TRUE)
plot(x,t, type = "l", lwd = 2, col = "darkgreen",
     ylim = c(0,1), main = "", ylab = " ")
par(new = TRUE)
plot(x,s, type = "l", lwd = 2, col = "chocolate4",
     ylim = c(0,1), main = "", ylab = " ")
par(new = TRUE)
plot(x,u, type = "l", lwd = 2, col = "orange",
     ylim = c(0,1), main = "", ylab = " ")


legend("topright", c("n = 1","n = 2","n = 3","n = 10", "n = 50"),
                 col = c("red","blue","darkgreen","chocolate4","orange"),
                 lty = 1, lwd = 2)


# konstantes n = 3

y = df(x, 3, 1)
z = df(x, 3, 2)
t = df(x, 3, 3)
s = df(x, 3, 10)
u = df(x, 3, 50)

plot(x,y, type = "l", lwd = 2, col = "red",
     ylim = c(0,1), main = "Dichte der F-Verteilung mit (3,m) Freiheitsgraden")
par(new = TRUE)
plot(x,z, type = "l", lwd = 2, col = "blue",
     ylim = c(0,1), main = "", ylab = " ")
par(new = TRUE)
plot(x,t, type = "l", lwd = 2, col = "darkgreen",
     ylim = c(0,1), main = "", ylab = " ")
par(new = TRUE)
plot(x,s, type = "l", lwd = 2, col = "chocolate4",
     ylim = c(0,1), main = "", ylab = " ")
par(new = TRUE)
plot(x,u, type = "l", lwd = 2, col = "orange",
     ylim = c(0,1), main = "", ylab = " ")


legend("topright", c("m = 1","m = 2","m = 3","m = 10", "m = 50"),
                 col = c("red","blue","darkgreen","chocolate4","orange"),
                 lty = 1, lwd = 2)



###############################################################################
### Beispiel Todesf�lle durch Krebs in asbestbelastetem Wohnhaus ##############
###############################################################################


### Mit exakter Binomialverteilung ############################################ 

## 5 von 7 Todesf�lle durch Krebs verursacht
n = 7
p = 0.25

## Bestimmung p-Wert
(p_W = 1 - pbinom(4,n,p) ) # 5 F�lle wurden beobachtet 

## Kritischer Wert
1 - pbinom(3,n,p) # �berpr�fung, ob 4 kritischer Wert ist 
                  # Ergebnis: nein; daher ist 5 der kritische Wert

## Testst�rke f�r p1 = 0.5
1- pbinom(4,n,0.5)


## 50 von 70 Todesf�lle durch Krebs verursacht
n = 70
p = 0.25

## Bestimmung p-Wert
( p_W = 1 - pbinom(49,n,p) ) # 50 F�lle wurden beobachtet 

## Kritischer Wert
1 - pbinom(23,n,p) # �berpr�fung, ob 24 kritischer Wert ist
1 - pbinom(24,n,p) # �berpr�fung, ob 25 kritischer Wert ist
                   # Ergebnis: kritischer Wert ist 25

## Testst�rke f�r p1 = 0.5
1- pbinom(24,n,0.5)


### Mit Normalverteilungsapproximation ########################################

## Ermittlung der Testst�rke 
n = 70
p = 0.25
x = 50

z_c = qnorm(0.95)
( x_c = z_c * sqrt(n*p*(1-p)) + n*p )

(x_c - n*0.5)/sqrt(n*0.5*0.5)
1-pnorm( (x_c - n*0.5)/sqrt(n*0.5*0.5))


### Grafische Darstellung der G�tefunktionen ############
###############################################################################

p = seq(0,1, by = 0.005)
G_7 = 1 - pbinom(4,7,p)
G_70 = 1- pbinom(24,70,p)

plot(p,G_7, type = "l", lwd = 2, col = "red", ylab = "G(p)", 
     ylim = c(0,1), main = "G�tefunktionen f�r einseitigen Binomialtest (p_Null = 25%)")
par(new = TRUE)
plot(p,G_70, type = "l", lwd = 2, col = "blue",
     ylim = c(0,1), main = "", ylab = " ")

abline(v=0.25, col = "green4")
abline(v= 0.5, col = "chocolate")
abline(h = 0.0)
abline(h = 0.05, col = "green4")

legend("topleft", c("n = 7","n = 70"),
                 col = c("red","blue"), lty = 1, lwd = 2)


## Versuchsweise: kritischer Wert jeweils um 1 geringer
## Konsequenz: Niveau alpha = 5% wird nicht mehr eingehalten
G_7_a = 1 - pbinom(3,7,p)
G_70_a = 1-pbinom(23,70,p)
par(new = TRUE)
plot(p,G_7_a, type = "l", lwd = 2, col = "orange2",
     ylim = c(0,1), main = "", ylab = " ")
par(new = TRUE)
plot(p,G_70_a, type = "l", lwd = 2, col = "lightblue",
     ylim = c(0,1), main = "", ylab = " ")


#############################################################################
### Binomialtest in R  ######################################################
#############################################################################

### Beispiel Todesf�lle durch Krebs in Wohnhaus ###########

## 5 von 7 Todesf�lle durch Krebs 
n = 7
p = 0.25
x = 5

binom.test(x,n,p,alternative = "greater")


