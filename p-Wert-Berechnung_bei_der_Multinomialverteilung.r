
### Anzahl der verschiedenen Besetzungsm�glichkeiten aus Teil (b) #############
###############################################################################

n = 10
k = 4
choose(n+k-1,k-1)



### L�sung zum Teil (c) ######################################################
### p-Wert-Berechnung   ######################################################
##############################################################################

x_star = c(4,2,1,3)
p_null = c(0.43, 0.46, 0.07, 0.04) 


### Mit in R implementiertem Test ################### 
library(EMT)
multinomial.test(observed = x_star, prob = p_null)

# Werte des Outputs
erg = multinomial.test(observed = x_star, prob = p_null)
erg
str(erg)
erg$allProb


### Weiterer Nachvollzug einiger Werte ############## 

# Ermittlung von p_star (W-keit unter H0 f�r gemachte Beobachtung)
beob  = c(4,2,1,3)
p = c(0.43, 0.46, 0.07, 0.04)
p_star = dmultinom(x = beob, prob = p)
p_star 

# p-Wert
sum(erg$allProb[erg$allProb <= p_star])



#####