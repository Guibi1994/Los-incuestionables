# Base de congreso
library(dplyr)
library(stringr)
library(tidyr)
library(ggplot2)

# 1. Cargar raw-data
b0_raw_congreso <- read.csv("1_datos/01_congreso_base_funcion_publica.csv")

b1_lista_rentas <- b0_raw_congreso %>% 
  group_by(NUMERO_DOCUMENTO) %>% mutate(records = n()) %>% ungroup() %>% as.data.frame() %>% 
  select(records,
         id_person = NUMERO_DOCUMENTO, 
         id_DIAN_report = NUMERO_FORMULARIO,
         record_date = FECHA_PUBLICAC_DECLARAC,
         name_a = PRIMER_NOMBRE_DECLARANTE_PN, 
         name_b =SEGUNDO_NOMBRE_DECLARANTE_PN,
         lastname_a = PRIMER_APELLIDO_DECLARANTE_PN,
         lastname_b = SEGUNDO_APELLIDO_DECLARANTE_PN,
         declarante = DECLARA_RENTA_DIAN,
         link_DIAN = DECLARACION_RENTA_DIAN,
         link_declaraion_ley_2013 = ARCHIVOS_DECLARACION_LEY_2013,
         link_aportes_campana = CERTIFICADO_APORTES_A_CAMPANA) %>% 
  # Cambiar vacios por NA
  mutate(across(id_person:link_aportes_campana,~ifelse(. == "",NA,.)),
         across(name_a:lastname_b,~tolower(.))) %>% 
  arrange(-records, id_person) #%>% 
  
  
  ## FILTRO TEMPORAL
  filter(id_person %in% c(14204889,51847750, 25280205, 208079, 7455054, 71769373))






# Aglunos ejemplos

79940745 # Duque
79289575 # Roy Barreras
25280205 # Paloma Valencia
51847750 # Maria Feranda Cabal
208079 # Gustavo Petro
14204889 # Robledo 
7455054 # Efrain Cepeda Sanabria
71769373 # Juan Felipe Lemos Uribe
