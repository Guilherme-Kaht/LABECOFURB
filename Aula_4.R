#WDI - World Development Indicators

#install.packages("WDI")

library(WDI)
#VIGNETTES -> Páginas web com orientações sobre as libraries.

#Buscando o PIB do Brasil.

#	GDP (current US$)(NY.GDP.MKTP.CD)
# GDP GROSS DOMESTIC PRODUCT

cod_gdp <- WDIsearch("	GDP (current US$)(NY.GDP.MKTP.CD)")

#É importante procurar pelo próprio site do Banco Mundial, é mais eficiente.

#Com o código, baixamos os dados.

options (scipen = 999) #Ajusta os números (NOT.CIENT)
basepib <- WDI(country = "all",
               indicator = "NY.GDP.MKTP.CD")

basepib2023 <- basepib <- WDI(country = "all",
                              indicator = "NY.GDP.MKTP.CD",
                              start = 2023, end = 2023)
