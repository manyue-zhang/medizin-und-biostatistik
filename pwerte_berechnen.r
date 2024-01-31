###############################################################################
### Berechnung der p-Werte des Beispiels aus B1 ###############################
###############################################################################

n = 10
p = 1/2

### Einseitiger Test ##########################################################
dbinom(9,n,p)
dbinom(10,n,p)
dbinom(9,n,p) + dbinom(10,n,p)

1-pbinom(8,n,p)
pbinom(8,n,p,lower.tail = FALSE)  # Achtung: P(X > 8) wird berechnet

### Zweieitiger Test ##########################################################
pbinom(1,n,p)                     # P(X <= 1) kommt jetzt noch hinzu
pbinom(1,n,p) + 1 - pbinom(8,n,p)
