## Berechnungen zum Aufgabenteil (a) #########################################
### Normalapproximation der Binomialverteilung ################################

## Kritischer Wert ###############################
alpha = 0.05
n = 180
p_0 = 1/6

( x_c = sqrt(n*p_0*(1-p_0))*qnorm(1-alpha) + n*p_0 + 0.5 )
( x_c = ceiling(x_c))


## p-Wert ########################################
x_star = 44

( z = (x_star - n*p_0 - 0.5)/sqrt(n*p_0*(1-p_0)) )
( p_W = 1- pnorm(z) )


### Aufgabenteil (b)  #########################################################
### Exakte Berechnung #########################################################

## Kritischer Wert ###############################

# �berpr�fung des in (a) n�herungsweise ermittelten Wertes
x_c 
1- pbinom(x_c    ,n,p_0)
1- pbinom(x_c - 1,n,p_0) # dieser Wert sollte der letzte unter dem Niveau alpha sein: passt
1- pbinom(x_c - 2,n,p_0)

## p-Wert ########################################
x_star = 44

( p_W = 1- pbinom(x_star -1,n,p_0) )

# p-Wert aus binom.test
binom.test(x_star, n, p_0, alternative = "greater")


### Aufgabenteil (c)  #########################################################
### Vergleich mit Chi-Quadrat ####################

## Annahme: Kritischer Wert wird beobachtet ######

( x_o = c(x_c, n-x_c) )                            # beobachtet
( x_e = c(n* p_0, n*(1-p_0)) )                     # erwartet (unter H0)
x_quadrat = sum( (x_o - x_e)^2/x_e )               # ohne Stetigkeitskorrektur 
x_quadrat_corr = sum( (abs(x_o - x_e)-0.5)^2/x_e ) # mit Stetigkeitskorrektur

x_quadrat
x_quadrat_corr

## kritischer Wert
qchisq(0.9,1)

## p-Werte
(1-pchisq(x_quadrat,1))/2
(1-pchisq(x_quadrat_corr,1))/2

# Zum Vergleich: p-Wert des exakten Binomialtests
( p_W = 1- pbinom(x_c -1,n,p_0) )



#####