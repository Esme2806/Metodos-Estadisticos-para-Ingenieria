# Clase 28-02-24
# Esta clase es parte de data science
# Bajemos la paquetería janitor()
library(janitor)
library(dplyr)

# primero veremos como limpiar la información de una base de datos
# vamos a limpiar los nombres de la columna
# con la función clean_names()

# a continuación creamos una tabla de datos o data frame
df <- as.data.frame(matrix(ncol = 5))
# con la función names() se agregan nombres a la base de datos
names(df) <- c("firstCol", "$SsecondCOL", "", "REPEAT_VALUE", "REPEAT_VALUE")
df %>% clean_names()

# hay una segunda manera de limpiar los datos
# con la función make_clean_names()

# Tibble nos ayuda a extraer información de una base de datos
# sin necesidad de instalarla
tibble::as.tibble(iris)
# el símbolo de interrogación y la palabra de la función o  base de datos
# nos abre la sección de ayuda
# para darnos mas información
?tibble
?iris

tibble::as_tibble(iris, .name_repair = janitor::make_clean_names)

# Ahora veremos como remover información vacía
# con la función remove_empty()

# creamos una nueva data frame
df <- data.frame(
  x1 = c(1, 2, NA),
  x2 = c(4, 5, 6),
  x3 = c(NA, NA, NA)
)
df
df %>% remove_empty(which = c("rows", "cols"))

# remover información constante
# con la función remove_constant()
df <- data.frame(
  x1 = c(1, 2, 3),
  x2 = c(4, 5, 6),
  x3 = c(7, 7, 7)
)
df

df %>% remove_constant()

# también esta paquetería tiene una función
# que detecta duplicidades
# con la función get_dupes()

get_dupes(iris)

# también podemos especificar las columnas para su revisión
get_dupes(iris, Sepal.Length, Petal.width)
