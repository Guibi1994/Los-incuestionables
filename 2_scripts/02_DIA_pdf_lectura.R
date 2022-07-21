library(pdftools)
library(dplyr)
library(stringr)
library(tidyr)
library(ggplot2)
options(scipen = 100)


a0_DIAN <- pdf_text("1_datos/pureba_DIAN.pdf") %>% 
  str_split(., "\\s{4,}", simplify = T) %>% 
  as.data.frame()




a1_reporte <- data.frame(
  # Cedula o ID de la persona
  id_persona = as.numeric(str_remove_all(a0_DIAN$V4, "\\s")),
  # ID del formulario DIAN
  id_formulario_DIAN = as.numeric(a0_DIAN$V3),
  # Año de la declaración
  year = as.integer(str_sub(a0_DIAN$V133, 1,4)),
  # Rubros tributarios
  total_patrimonio_bruto = as.numeric(str_remove_all(a0_DIAN$V15, "\\,")),
  total_deudas = as.numeric(str_remove_all(a0_DIAN$V15, "\\,")),
  total_patrimonio_liquido = as.numeric(str_remove_all(a0_DIAN$V16, "\\,")),
  ganancias_ocacionales = as.numeric(str_remove_all(a0_DIAN$V86, "\\,")))



c1_id <- str_replace_all(a0_DIAN[[1]][3],"\\s*","")



str_view(c1_id, "\\d+")


