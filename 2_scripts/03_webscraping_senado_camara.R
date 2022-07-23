# Scrapping senadores y partidos
library(rvest)
library(dplyr)
library(stringr)
library(ggplot2)
simplyTEXT <- function(texto) {
  texto <- tolower(texto)
  #texto <- gsub(pattern = "\ ", replacement = "",texto)
  texto <- gsub(pattern = "á", replacement = "a",texto)
  texto <- gsub(pattern = "é", replacement = "e",texto)
  texto <- gsub(pattern = "í", replacement = "i",texto)
  texto <- gsub(pattern = "ó", replacement = "o",texto)
  texto <- gsub(pattern = "ú", replacement = "u",texto)
  texto <- gsub(pattern = "ü", replacement = "u",texto)
  texto <- gsub(pattern = "ñ", replacement = "n",texto)
  return(texto)
}


a0_base <- read_html("https://www.senado.gov.co/index.php/el-senado/senadores?lastletter=Todos#modazdirectory")

a1_senado <- data.frame(
  # Scarping
  nombres_completos = a0_base %>% html_nodes("h3") %>% html_text(),
  partidos =  a0_base %>% html_nodes("h3+ p") %>% html_text()) %>% .[1:105,] %>% 
  
  mutate(nwords = lengths(gregexpr("\\W+", nombres_completos)) + 1,
         across(nombres_completos:partidos,~simplyTEXT(.)),
         across(nombres_completos:partidos,~str_replace(., "^\\s+","")),
         across(nombres_completos:partidos,~str_replace(., "\\s+$","")),
         across(nombres_completos:partidos,~str_replace(., "\\s{2}"," ")),
         partidos = ifelse(partidos == "polo democratico alternativo",
                           "polo democratico",partidos))

  
  	
pr <- merge(a1_senado, b2_lista_cedulas, by = "nombres_completos", all.x = T)



unlist(a0_base)
