
### Wahrscheinlichkeit, beim Auss�en von 1000 Samenk�rnern 
### zwischen 280 und 330 gelbe Bl�ten zu erhalten 
###############################################################################

n = 1000
p = 0.3    # W-keit f�r gelbe Bl�te

## Mit exakter Binomialverteilung
pbinom(330,n,p) - pbinom(279,n,p)  # Achtung: bei unterer Grenze 279 einsetzen

## Normalapproximation ohne Stetigkeitskorrektur
( z_unten = (280-n*p)/(sqrt(n*p*(1-p))) )
( z_oben = (330-n*p)/(sqrt(n*p*(1-p))) )
pnorm(z_oben) - pnorm(z_unten)

## Normalapproximation mit Stetigkeitskorrektur
( z_unten = (280-n*p-0.5)/(sqrt(n*p*(1-p))) )
( z_oben = (330-n*p+0.5)/(sqrt(n*p*(1-p))) )
pnorm(z_oben) - pnorm(z_unten)



#####
#####
#####



### �bung 6   #################################################################
### Normalapproximation der Binomialverteilung     ############################
### Zu Beispiel 1.3 aus [Bortz], S. 44             ############################
### Anzahl M�dchengeburten unter 1000 Neugeborenen ############################
### Wahrscheinlichkeit f�r M�dchengeburt ist 50%   ############################
###############################################################################

### Mit Standardisierung
###############################################################################

p = 0.5
n = 1000

x_a = 530
x_e = 560
x = x_a:x_e
y = dbinom(x,n,p)

plot(x,y,type = "h", col = "red", lwd = 4, 
     xlim = c(x_a,x_e), ylim = c(0, 0.0045),
     main = "Normalverteilungsapproximation der Binomialverteilung",
     ylab = "Wahrscheinlichkeiten P(X=x)")

par(new = TRUE)
z = (x - n*p)/sqrt(n*p*(1-p)) 
z_a = (x_a-n*p)/sqrt(n*p*(1-p))
z_e = (x_e-n*p)/sqrt(n*p*(1-p))
delta_z = 1/sqrt(n*p*(1-p))
delta_z

plot(z,dnorm(z)*delta_z, type = "l", lwd = 2, 
     xlim = c(z_a,z_e), ylim = c(0, 0.0045),
     xaxt = "n", xlab = "", ylab = "")  


### Alternativ: ohne Standardisierung
###############################################################################

p = 0.5
n = 1000

x_a = 530
x_e = 560
x = x_a:x_e
y = dbinom(x,n,p)

plot(x,y,type = "h", col = "red", lwd = 4, 
     xlim = c(x_a,x_e), ylim = c(0, 0.0045),
     main = "Normalverteilungsapproximation der Binomialverteilung",
     ylab = "Wahrscheinlichkeiten P(X=x)")

par(new = TRUE)

plot(x,dnorm(x, mean = n*p, sd = sqrt(n*p*(1-p))), type = "l", lwd = 2, 
     xlim = c(x_a,x_e), ylim = c(0, 0.0045),
     xaxt = "n", xlab = "", ylab = "")  



#####
#####
#####



### �bung 7 ###################################################################
### Optimale Stichprobenumf�nge                    ############################
### Zu Tabelle 1.5 [Bortz], S. 53                  ############################
### Nachvollzug der Fragestellung                  ############################
### "Abweichung p von 0.5"                         ############################
###############################################################################


### Auswertung der Formel aus Aufgabenteil (a) ################################
###############################################################################

## Formel f�r n ###############################################################
p_0 = 0.5
delta = c(0.05, 0.15, 0.25)
p_1 = p_0 + delta

epsilon = 0.8

# alpha = 0.01
##############
alpha_1 = 0.01
n_1 = (( sqrt(p_0*(1-p_0))*qnorm(1-alpha_1)-sqrt(p_1*(1-p_1))*qnorm(1-epsilon))/delta)^2

# alpha = 0.05
##############
alpha_2 = 0.05
n_2 = (( sqrt(p_0*(1-p_0))*qnorm(1-alpha_2)-sqrt(p_1*(1-p_1))*qnorm(1-epsilon))/delta)^2

round(rbind(n_1,n_2),0)

## Formel f�r x_c (mit Stetigkeitskorrektur) ##################################

( n_1 = round(n_1,0) )
( n_2 = round(n_2,0) )

x_c_1 = sqrt(n_1*p_0*(1-p_0))*qnorm(1-alpha_1) + n_1*p_0 + 0.5 
x_c_2 = sqrt(n_2*p_0*(1-p_0))*qnorm(1-alpha_2) + n_2*p_0 + 0.5

ceiling(rbind(x_c_1,x_c_2)) # Anmerkung: Wert 40 statt 41 bei Rundung der Quantile


### Aufgabenteil (b)                             ##############################  
### Exakte Berechnung mittels Binomialverteilung ##############################
###############################################################################

## alpha = 1%, n = 1001
#######################
n = 1001
x_c = 538
p_1 = 0.55

#  �berpr�fung kritischer Wert
1- pbinom(x_c    ,n,p_0)
1- pbinom(x_c - 1,n,p_0) # dieser Wert sollte der letzte unter dem Niveau alpha sein: passt
1- pbinom(x_c - 2,n,p_0)

# Berechnung der Testst�rke
1-pbinom(x_c - 1,n,p_1)


## alpha = 1%, n = 109
#######################
n = 109
x_c = 68
p_1 = 0.65

#  �berpr�fung kritischer Wert
1- pbinom(x_c    ,n,p_0)
1- pbinom(x_c - 1,n,p_0) # dieser Wert sollte der letzte unter dem Niveau alpha sein: passt
1- pbinom(x_c - 2,n,p_0) # bei 67 als kritischer Wert w�rde Niveau minimal �berschritten

# Berechnung der Testst�rke
1-pbinom(x_c - 1,n,p_1)  
1-pbinom(x_c - 2,n,p_1)  # bei 67 als kritischer Wert w�rde angestrebte Testst�rke besser getroffen werden


## alpha = 1%, n = 37
#######################
n = 37
x_c = 27
p_1 = 0.75

#  �berpr�fung kritischer Wert
1- pbinom(x_c    ,n,p_0)
1- pbinom(x_c - 1,n,p_0) # dieser Wert sollte der letzte unter dem Niveau alpha sein: passt
1- pbinom(x_c - 2,n,p_0) # bei 26 als kritischer Wert w�rde Niveau minimal �berschritten

# Berechnung der Testst�rke
1-pbinom(x_c - 1,n,p_1)
1-pbinom(x_c - 2,n,p_1)  # bei 26 als kritischer Wert w�rde angestrebte Testst�rke besser getroffen werden


## alpha = 5%, n = 616
#######################
n = 616
x_c = 329
p_1 = 0.55

#  �berpr�fung kritischer Wert
1- pbinom(x_c    ,n,p_0)
1- pbinom(x_c - 1,n,p_0) # dieser Wert sollte der letzte unter dem Niveau alpha sein: passt
1- pbinom(x_c - 2,n,p_0)

# Berechnung der Testst�rke
1-pbinom(x_c - 1,n,p_1)


## alpha = 5%, n = 67
#######################
n = 67
x_c = 41
p_1 = 0.65

#  �berpr�fung kritischer Wert
1- pbinom(x_c    ,n,p_0)
1- pbinom(x_c - 1,n,p_0) # dieser Wert sollte der letzte unter dem Niveau alpha sein: passt
1- pbinom(x_c - 2,n,p_0)

# Berechnung der Testst�rke
1-pbinom(x_c - 1,n,p_1)


## alpha = 5%, n = 23
#######################
n = 23
x_c = 16
p_1 = 0.75

#  �berpr�fung kritischer Wert
1- pbinom(x_c    ,n,p_0)
1- pbinom(x_c - 1,n,p_0) # dieser Wert sollte der letzte unter dem Niveau alpha sein: passt
1- pbinom(x_c - 2,n,p_0)

# Berechnung der Testst�rke
1-pbinom(x_c - 1,n,p_1)


