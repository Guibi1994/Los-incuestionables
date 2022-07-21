# Scrapping senadores y partidos
library(rvest)
library(dplyr)
library(stringr)
library(ggplot2)


a0_base <- read_html("https://www.senado.gov.co/index.php/el-senado/senadores?lastletter=Todos#modazdirectory")

a1_senado <- data.frame(
  nombres = a0_base %>% html_nodes("h3") %>% html_text(),
  partidos =  a0_base %>% html_nodes("h3+ p") %>% html_text()) %>% .[1:105,] %>% 
  mutate(nwords = lengths(gregexpr("\\W+", nombres)) + 1)

  nw