# Carregamento de pacotes
library(tidyverse)
library(WDI)

options(scipen = 999)  # Evita notação científica

# -----------------------------
# Dados de PIB per capita - todos os países
# -----------------------------
# Requisição de dados
# Requisição de dados (se ainda não tiver carregado)
pib_per_capita <- WDI(country = "all",
                      indicator = "NY.GDP.PCAP.CD")

# Criar coluna de destaque apenas para os EUA
pib_per_capita <- pib_per_capita %>%
  mutate(destaque = if_else(iso2c == "US", "EUA", "Outros"))

# Gráfico: Apenas EUA em destaque
grafico_eua_destaque <- ggplot(pib_per_capita,
                               aes(x = year, y = NY.GDP.PCAP.CD, group = country)) +
  geom_line(aes(color = destaque),
            alpha = 0.7,
            size = 0.8) +
  scale_color_manual(values = c("EUA" = "red", "Outros" = "grey85")) +
  labs(title = "PIB Per Capita no Mundo - Destaque para os EUA",
       x = "Ano",
       y = "PIB Per Capita (USD)",
       color = "País") +
  theme_minimal(base_size = 13)

print(grafico_eua_destaque)

# -----------------------------
# Dados para o Top 15 em 2023
# -----------------------------
pib_per_capita_2023 <- WDI(country = "all",
                           indicator = "NY.GDP.PCAP.CD",
                           start = 2023, end = 2023)

top15_pib_per_capita <- pib_per_capita_2023 %>%
  arrange(desc(NY.GDP.PCAP.CD)) %>%
  slice(1:15)

# Gráfico 2: Top 15 PIB per capita - 2023
grafico_top15 <- ggplot(top15_pib_per_capita,
                        aes(x = reorder(country, NY.GDP.PCAP.CD),
                            y = NY.GDP.PCAP.CD)) +
  geom_bar(stat = "identity", fill = "#000080") +  # azul-marinho
  coord_flip() +
  labs(title = "Top 15 Países - PIB Per Capita (2023)",
       x = "País",
       y = "PIB Per Capita (USD)") +
  theme_minimal(base_size = 13) +
  theme(
    plot.background = element_rect(fill = "#eaffea", color = NA),  # verde bem clarinho
    panel.background = element_rect(fill = "#eaffea", color = NA),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

print(grafico_top15)

# -----------------------------
# Gráfico 3: PIB per capita do Brasil (histórico)
# -----------------------------
grafico_brasil <- ggplot(pib_brasil_per_capita,
                         aes(x = year, y = NY.GDP.PCAP.CD)) +
  geom_line(color = "#6A0DAD", size = 1.2) +  # Roxo
  geom_point(color = "#6A0DAD", size = 2) +   # Roxo
  labs(title = "PIB Per Capita do Brasil - Série Histórica",
       x = "Ano",
       y = "PIB Per Capita (USD)") +
  theme_minimal(base_family = "Helvetica", base_size = 13)

print(grafico_brasil)
