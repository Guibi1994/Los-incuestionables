# Base de congreso
library(dplyr)
library(stringr)
library(tidyr)
library(ggplot2)

a0_raw_congreso <- read.csv("1_datos/01_congreso_base_funcion_publica.csv")

# Registros por cédula
pr <- a0_raw_congreso %>% 
  group_by(NUMERO_DOCUMENTO) %>% 
  summarise(registros = n(),
            min_year = min(ANO_GRAVABLE_DECLARAC_IYR, na.rm = T),
            max_year = max(ANO_GRAVABLE_DECLARAC_IYR, na.rm = T),
            pr = as.list(ANO_GRAVABLE_DECLARAC_IYR)) %>% 
  as.data.frame()
