###############################################################################
### Beispiel Fehlgeburten bei Rhesus-negativen M�ttern ########################
###############################################################################

p = 1/6
n = 180
rhn = 44

beob = c(rhn,n-rhn)
erw = c(p*n, (1-p)*n)
beob
erw

# Wert der Teststatistiken
( xq   = sum((beob-erw)^2/erw) )
( xq_c = sum((abs(beob-erw)-0.5)^2/erw) )

# kritischer Wert
qchisq(0.9, 1)

# p-Werte
round(0.5*(1-pchisq(xq,1)),4)
round(0.5*(1-pchisq(xq_c,1)),4)



###############################################################################
### Chi-Quadrat-Test in R  ####################################################
###############################################################################

### Beispiel Fehlgeburten bei Rhesus-negativen M�ttern ########################

p = 1/6
n = 180
rhn = 44

beob = c(rhn,n-rhn)
erw = c(p*n, (1-p)*n)
beob
erw

chisq.test(beob, erw/n)                      # so nicht!

chisq.test(beob, p = erw/n)                  # Angabe von Wahrscheinlichkeiten
chisq.test(beob, p = erw, rescale.p = TRUE)  # Angabe von erwarteten H�ufigkeiten 



###############################################################################
### Multinomialverteilung in R ################################################
###############################################################################

# Berechnung von Multinomialwahrscheinlichkeiten ##############################
x_star = c(0,3,0)
p_null = c(0.7, 0.2, 0.1) 

dmultinom(x_star,3,p_null)


# Erzeugung von 5 Zufallsvektoren aus Mult(n;p) ############################### 
n = 10
p = c(0.22,0.33,0.45)
rmultinom(5,n,p)



###############################################################################
### Beispiel Skelettanomalien bei Neugeborenen ################################
###############################################################################
###############################################################################

### Mit in R implementiertem Test ############################################# 
library(EMT)
multinomial.test(observed = x_star, prob = p_null)

out = multinomial.test(observed = x_star, prob = p_null)
plotMultinom(out)



#####