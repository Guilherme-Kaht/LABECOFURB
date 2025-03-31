# API (Forma de Acesso)
# Dados do Banco Mundial - Base WDI (World Development Indicators)

library(WDI)

options (scipen = 999) #Ajusta os números (NOT.CIENT)

basepib <- WDI(country = "all",
               indicator = "NY.GDP.MKTP.CD")


basepib2023 <- basepib <- WDI(country = "all",
                              indicator = "NY.GDP.MKTP.CD",
                              start = 2023, end = 2023)

#CORTE TRANSVERSAL (Vários Locais - Período de tempo específico)


basepibbr <- WDI(country = "BR",
               indicator = "NY.GDP.MKTP.CD")

#Evolução do Pib Per Capita no Mundo - Dados em Painel
pibpercapita <- WDI(country = "all",
                      indicator = "NY.GDP.PCAP.CD")

#Coeficiente Gini 2023 - Corte Transversal
coeficienteGini2023 <- WDI(country = "all",
                           indicator = "SI.POV.GINI",
                           start = 2023, end =  2023)

#População Urbana com Acesso a Energia - Série Temporal
populacaoComEnergia <- WDI(country = "BR",
                     indicator = "EG.ELC.ACCS.UR.ZS")
