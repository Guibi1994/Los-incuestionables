# Base de congreso
library(dplyr)
library(stringr)
library(tidyr)
library(ggplot2)


b0_raw_congreso <- read.csv("1_datos/01_congreso_base_funcion_publica.csv")


79940745 # Duqe
79289575 # Roy Barreras

View(b0_raw_congreso %>% filter(NUMERO_DOCUMENTO == "79289575"))
# Registros por cédula
b1_resumen <- b0_raw_congreso %>%
  select(NUMERO_DOCUMENTO,CARGO_DECLARANTE,
         PRIMER_NOMBRE_DECLARANTE_PN, SEGUCLARANTE_PN, SEGUNDO_APELLIDO_DECLARANTE_PN,
         ANO_GRAVABLE_DECLARAC_IYR, DECLARA_RENTA_DIAN, NUMERO_FORMULARIO, TOTAL_INGRESOS_PERS_NATURAL, DECLARACION_RENTA_DIAN) %>% 
  group_by(NUMERO_DOCUMENTO) %>%
  mutate(registros = n()) %>% 
  arrange(-registros)#
  summarise(registros = n(),
            min_year = min(ANO_GRAVABLE_DECLARAC_IYR, na.rm = T),
            max_year = max(ANO_GRAVABLE_DECLARAC_IYR, na.rm = T)) %>% 
  as.data.frame()
