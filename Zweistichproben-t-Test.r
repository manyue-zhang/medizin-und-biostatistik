
### Zweistichproben-t-Test (unabhängige Stichproben)
###############################################################################

# Wert der Teststatistik
n.1 = 97
n.2 = 98
m.1 = 23.2
m.2 = 21.0
S.1 = 32.05
S.2 = 30.43

( S_p_q = ((n.1-1)*S.1^2 + (n.2-1)*S.2^2)/(n.1+n.2-2) )

( t_star = (m.1 - m.2)/(sqrt(S_p_q)*sqrt(1/n.1 + 1/n.2)) )

# kritischer Wert
qt(0.975,193)

# p-Wert
round(2*(1-pt(t_star, 193)),4)

# Konfidenzintervall
( delta = m.1 - m.2 )
( b = qt(0.975,193)*sqrt(S_p_q)*sqrt(1/n.1 + 1/n.2) )
round(c(delta-b, delta+b),2)


### Einstichproben-t-Test (gepaarte Stichproben)
###############################################################################

# Wert der Teststatistik

( t_star = -m.2 /(S.2*sqrt(1/n.2)) )

# kritischer Wert
qt(0.975,97)

# p-Wert
round(2*(1-pt(abs(t_star), 97)),4)

# Konfidenzintervall
( delta = - m.2 )
( b = qt(0.975,97)*S.2*sqrt(1/n.2) )
round(c(delta-b, delta+b),2)



### Wilcoxon-Test (unabhängige Stichproben)
###############################################################################

n = 98
m = 97 
W = 10020

( E_W = n*(n+m+1)/2 )
( V_W = n*m*(n+m+1)/12 )
( S_W = sqrt(V_W) )

( Min_W = n*(n+1)/2 )
( Max_W = n*(2*m+n+1)/2 )

( z_star = (W - E_W)/S_W )
( p_w = 2*(1 - pnorm(z_star)) )



### Beispiel aus Bortz (S. 143 f) #############################################
###############################################################################
###############################################################################
###############################################################################


### Psychogene vs. somatogene Verdauungsstörungen 
###############################################################################

x = c(2.0,3.7,8.3,4.3,3.1,3.2)              # 6 psychogene Kranke
y = c(1.5,3.0,4.2,2.4,0.7,1.9,3.5,2.8)      # 8 somatogene Kranke


## U-Test (exakt)
wilcox.test(x, y, alternative = "greater")

## U-Test (Normalapproximation)    
wilcox.test(x, y, exact = FALSE, correct = FALSE, alternative = "greater")  

## U-Test (Normalapproximation mit Stetigkeitskorrektur)    
wilcox.test(x, y, exact = FALSE, correct = TRUE, alternative = "greater")  


## Normalapproximation zu Fuß
z_star = (59-45)/sqrt(60)
round(z_star,4)

round(1-pnorm(z_star),5)   # p-Wert

## Normalapproximation mit Stetigkeitskorrektur zu Fuß
z_star = (59-45-0.5)/sqrt(60)
round(z_star,4)

round(1-pnorm(z_star),5)   # p-Wert



#####