# Base de congreso
library(dplyr)
library(stringr)
library(tidyr)
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


# 1. Cargar raw-data ----
b0_raw_congreso <- read.csv("1_datos/01_SENADO_base_funcion_publica.csv")



# 2. Extraer información relevente ----
b1_lista_rentas <- b0_raw_congreso %>% 
  ## 2.1. Identificar número de registros ----
  group_by(NUMERO_DOCUMENTO) %>% mutate(records = n()) %>% ungroup() %>% as.data.frame() %>% 
  
  ## 2.2. Crear variable de nombres completos ----
  mutate(nombres_completos = 
           simplyTEXT(paste(PRIMER_APELLIDO_DECLARANTE_PN, 
                            SEGUNDO_APELLIDO_DECLARANTE_PN,
                            PRIMER_NOMBRE_DECLARANTE_PN, 
                            SEGUNDO_NOMBRE_DECLARANTE_PN, sep = " "))) %>%
  ## 2.3. Arreglso de los nomnbres completos ----
  mutate(nombres_completos = str_replace(nombres_completos, "^\\s+",""),
         nombres_completos = str_replace(nombres_completos, "\\s+$",""),
         nombres_completos = str_replace(nombres_completos, "\\s{2}"," ")) %>% 
  ## 2.4. Selccionar variables relevantes ----
  select(records,
         id_person = NUMERO_DOCUMENTO, 
         id_DIAN_report = NUMERO_FORMULARIO,
         record_date = FECHA_PUBLICAC_DECLARAC,
         declaration_date = ANO_GRAVABLE_DECLARAC_IYR,
         nombres_completos,
         name_a = PRIMER_NOMBRE_DECLARANTE_PN, 
         name_b =SEGUNDO_NOMBRE_DECLARANTE_PN,
         lastname_a = PRIMER_APELLIDO_DECLARANTE_PN,
         lastname_b = SEGUNDO_APELLIDO_DECLARANTE_PN,
         declarante = DECLARA_RENTA_DIAN,
         link_DIAN = DECLARACION_RENTA_DIAN,
         link_declaraion_ley_2013 = ARCHIVOS_DECLARACION_LEY_2013,
         link_aportes_campana = CERTIFICADO_APORTES_A_CAMPANA) %>% 
  ## 2.5. Cambiar vacios por NA y reordenar la base
  mutate(across(id_person:link_aportes_campana,~ifelse(. == "",NA,.)),
         across(name_a:lastname_b,~tolower(.))) %>% 
  arrange(-records, id_person, record_date) #%>% 
  
  ## FILTRO TEMPORAL
  filter(id_person %in% c(14204889,51847750, 25280205, 208079, 7455054, 71769373,
                          79289575))


# 3. Lista de nombres, cédulas y registros----  
b2_lista_cedulas <- b1_lista_rentas %>%
  group_by(id_person, nombres_completos) %>% 
  summarise(registros = n()) %>% as.data.frame()



# Aglunos ejemplos

79940745 # Duque
79289575 # Roy Barreras
25280205 # Paloma Valencia
51847750 # Maria Feranda Cabal
208079 # Gustavo Petro
14204889 # Robledo 
7455054 # Efrain Cepeda Sanabria
71769373 # Juan Felipe Lemos Uribe
