# API (Forma de Acesso)
# Dados do Banco Mundial - Base WDI (World Development Indicators)
library(tidyverse)
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

graficoPainel <- ggplot(pibpercapita,
                        aes(y = NY.GDP.PCAP.CD,
                            x = year)) +
  geom_point()

print(graficoPainel)

#Pib Per Capita em 2023 - Corte Transversal
pibpercapita2023 <- WDI(country = "all",
                           indicator = "NY.GDP.PCAP.CD",
                           start = 2023, end =  2023)
top20_pib <- pibpercapita2023 %>%
  arrange(desc(NY.GDP.PCAP.CD)) %>%
  head(20)

graficoTransversal <- ggplot(top20_pib, aes(y = NY.GDP.PCAP.CD, x = reorder(country, NY.GDP.PCAP.CD))) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +  # Inverter para barras horizontais
  labs(title = "Top 20 Países - PIB Per Capita (2023)",
       x = "País",
       y = "PIB Per Capita (USD)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Imprimir o gráfico
print(graficoTransversal)

#Pib Per Capita no Brasil - Série Temporal
pibpercapitabrasil <- WDI(country = "BR",
                           indicator = "NY.GDP.PCAP.CD")

graficoSerie <- ggplot(pibpercapitabrasil,
                             aes(y = NY.GDP.PCAP.CD,
                                 x = year)) +
  geom_line()

print(graficoSerie)