library(plotly)
library(readxl)

# Establecer directorio de trabajo
setwd("3° Parcial MEI/Trabajo Dengue/")

# Leer el archivo dengue_abierto.csv
data <- read.csv("dengue_abierto.csv")

# Leer los catálogos del archivo Catalogos_Dengue.xlsx
entidad <- read_excel("Catalogos_Dengue.xlsx", "CATÁLOGO ENTIDAD")
si_no <- read_excel("Catalogos_Dengue.xlsx", "CATALOGO SI_NO")
institucion <- read_excel("Catalogos_Dengue.xlsx", "CATÁLOGO INSTITUCION")
tipo_paciente <- read_excel("Catalogos_Dengue.xlsx", "CATÁLOGO TIPO_PACIENTE")

# Gráfica de barras de la columna ENTIDAD_RES
data$ENTIDAD_RES <- factor(
  data$ENTIDAD_RES,
  levels = entidad$CLAVE_ENTIDAD,
  labels = entidad$ENTIDAD_FEDERATIVA
)

plot_ly(data, x = ~ENTIDAD_RES) %>%
  add_histogram() %>%
  layout(title = "Distribución de casos de dengue por entidad federativa")

# Gráfica de barras de la columna HABLA_LENGUA_INDIG
data$HABLA_LENGUA_INDIG <- factor(
  data$HABLA_LENGUA_INDIG,
  levels = si_no$CLAVE,
  labels = si_no$DESCRIPCIÓN
)

plot_ly(data, x = ~HABLA_LENGUA_INDIG) %>%
  add_histogram() %>%
  layout(title = "Distribución de casos de dengue por habla lengua indígena")

# Gráfica de barras de la columna INDIGENA
data$INDIGENA <- factor(
  data$INDIGENA,
  levels = si_no$CLAVE,
  labels = si_no$DESCRIPCIÓN
)

plot_ly(data, x = ~INDIGENA) %>%
  add_histogram() %>%
  layout(title = "Distribución de casos de dengue por indígena")

# Gráfica de barras de la columna INSTITUCION_UM_NOTIF
data$INSTITUCION_UM_NOTIF <- factor(
  data$INSTITUCION_UM_NOTIF,
  levels = institucion$CLAVE,
  labels = institucion$DESCRIPCIÓN
)

plot_ly(data, x = ~INSTITUCION_UM_NOTIF) %>%
  add_histogram() %>%
  layout(
    title = "Distribución de casos de dengue por institución de notificación"
  )

# Gráfica de barras de la columna TIPO_PACIENTE
data$TIPO_PACIENTE <- factor(
  data$TIPO_PACIENTE,
  levels = tipo_paciente$CLAVE,
  labels = tipo_paciente$DESCRIPCIÓN
)

plot_ly(data, x = ~TIPO_PACIENTE) %>%
  add_histogram() %>%
  layout(title = "Distribución de casos de dengue por tipo de paciente")
