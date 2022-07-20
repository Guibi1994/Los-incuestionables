library(pdftools)



pr <- pdf_text("1_datos/pureba_DIAN.pdf") %>% 
  str_split(., "\n")

str_view(pr[[1]][3], "[^\\D\\s]+\\D")


