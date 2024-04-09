library(TCGAbiolinks)
library(plotly)

# Query para obtener los datos de Copy Number Variation de TCGA-ACC
query <- GDCquery(
  project = "TCGA-ACC",
  data.category = "Copy Number Variation",
  data.type = "Masked Copy Number Segment",
  sample.type = c("Primary Tumor")
)

GDCdownload(query)

data <- GDCprepare(query)

# Clasificar los segmentos en positivos y negativos basados en Segment_Mean
data$Mean_Category <- ifelse(data$Segment_Mean > 0, "Positive", "Negative")

# Contar la cantidad de segmentos en cada categoría
category_counts <- table(data$Mean_Category)

# Convertir la tabla a un dataframe.
# Esto debería crear automáticamente las columnas correctas.
df_counts <- as.data.frame(category_counts)

# Nombrar explícitamente las columnas del dataframe resultante
names(df_counts) <- c("Category", "Count")

# Crear la gráfica de pastel con plotly, usando los nombres de columnas correctos
fig <- plot_ly(df_counts,
  labels = ~Category, values = ~Count, type = "pie",
  textinfo = "label+percent",
  insidetextorientation = "radial",
  marker = list(colors = c("#FF9999", "#66CC99")),
  hoverinfo = "label+percent"
)

# Mejorar la gráfica con un título y configuración del layout
fig <- fig %>% layout(title = "Distribución de Segmentos por Media del Segmento")

# Mostrar la gráfica
fig
