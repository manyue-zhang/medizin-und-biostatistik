

### Teil (a) mit R berechnet ##################################################
## Sterblichkeitsraten
32/628
39/208
91/236
207/242
sterb = c(0.0510, 0.1875, 0.3856, 0.8554)


### Teil (b) mit R berechnet ##################################################
## Relative Risiken
(19/288)/(13/340)
(27/130)/(12/78)
(51/115)/(40/121)
(42/49)/(165/193)
RR = c(1.7254, 1.35, 1.3415, 1.0026)


### Teil (c): Grafische Darstellungen #########################################
## Zusammenfassung von Sterblichkeitsraten und RR zu einer Matrix
data = rbind(sterb, RR)
data

# Mit Spaltenbeschriftung
colnames(data) = c("Alter < 45","Alter 45-54","Alter 55-64","Alter >= 65")
data

## Einfacher Barplot
barplot(data, beside = TRUE, 
        col = c("red", "blue", "red", "blue", "red", "blue", "red", "blue") )


## Etwas elegantere Farbeingabe
graphics.off()
matrix(c("red","blue"), nrow = 2, ncol = 4)

barplot(data, beside = TRUE, 
        col = matrix(c("red","blue"), nrow = 2, ncol = 4))

## Mit �berschrift und Legende
barplot(data, beside = TRUE, 
        col = matrix(c("red","blue"), nrow = 2, ncol = 4),
        main = "Sterblichkeit und Relatives Risiko pro Altersklasse")

legend("topright", c("Sterblichkeit","Relatives Risiko"),
                 col = c("red","blue"), lty = 1, lwd = 6)

# Alternative Positionierung der Legende
barplot(data, beside = TRUE, 
        col = matrix(c("red","blue"), nrow = 2, ncol = 4),
        main = "Sterblichkeit und Relatives Risiko pro Altersklasse")

legend(8,1.7, c("Sterblichkeit","Relatives Risiko"),
                 col = c("red","blue"), lty = 1, lwd = 6)



### �bung 2 ###################################################################
### Blutdrucksenkendes Mittel vs. Placebo #####################################
###############################################################################

n = 16
p = 1/2

### Nachvollzug der Rechnung aus Teil (a) #####################################
### Einseitiger Test                      #####################################
###############################################################################

## direkte Berechnung des p-Wertes zum Beobachtungswert x_star = 12
p_W = 1 - pbinom(11,n,p)
p_W

# alternativ
pbinom(11,n,p,lower.tail = FALSE)  # Achtung: P(X > 11) wird berechnet

## Berechnung der Einzelwahrscheinlichkeiten
round( dbinom(12,n,p) ,4)
round( dbinom(13,n,p) ,4)
round( dbinom(14,n,p) ,4)
round( dbinom(15,n,p) ,4)
round( dbinom(16,n,p) ,4)


### Zur Info: Rechnung aus Teil (b) ###########################################
### Zweiseitiger Test               ###########################################
###############################################################################

## direkte Berechnung des p-Wertes zum Beobachtungswert x_star = 12
p_W = 1 - pbinom(11,n,p) + pbinom(4,n,p) 
p_W

