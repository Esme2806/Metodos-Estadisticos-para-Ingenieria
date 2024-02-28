# Clase del 26 de febrero de 2024
# Tema: como analizar datos (Guía para principiantes)
# Paquetería: dplyr
#Borrar la lista de variables del programa anterior
ls()
rm(list = ls())

#Instalar y cargar la paquetería dplyr
library(dplyr)

#vamos a aprender a seleccionar columnas
#filtra datos
#ordenar datos
#crear nuevas columnas a partir de las existentes
#calcular estadísticas
#realizar agrupamientos

#hay una paquetería que contiene bases de datos
#gapminder
library(gapminder)

#con la función head()
#podemos ver las primeras filas de un data frame
head(gapminder)
#podemos ver las primeras 12 filas de un data frame
head(gapminder, 12)

#con la función tail()
#podemos ver las últimas filas de un data frame
tail(gapminder)

#SELECCIÓN DE COLUMNAS
#el operador %>% (pipe)
#sirve para encadenar funciones
#es decir, un resultado parcial de la primera función
#pasa a la segunda función
#la función select()
#sirve para seleccionar columnas que quiero
gapminder %>% select(country, year, pop)

#esta función print() de la base
#nos ayuda a visualizar la información
#en las cantidades que requerimos
print(gapminder, n = 50)

#otra manera de seleccionar columnas
#es usando el prefijo (-)
gapminder %>% select(-continent)

#Filtrar información
#con la función filter()
gapminder %>% select(country, year, lifeExp) %>% filter(year == 2007)

gapminder %>%
  select(country, year, lifeExp) %>%
  filter(year == 2007, country == "Poland")

#si queremos la información por medio del filtro
#de varios países se usa el operador %in%
gapminder %>%
  filter(year == 2007, country %in% c("Poland", "Mexico", "United States"))

#ORDEN DE LA INFORMACIÓN
#se usa la función arrange()
gapminder %>%
  select(country, year, lifeExp) %>%
  filter(year == 2007) %>%
  arrange(lifeExp)

gapminder %>%
  select(country, year, lifeExp) %>%
  filter(year == 2007) %>%
  arrange(desc(lifeExp))

#usaremos la función de top_n()
#para que despliegue las primeras filas
gapminder %>%
  select(country, year, lifeExp) %>%
  filter(year == 2007) %>%
  arrange(desc(lifeExp)) %>%
  top_n(5)

#por lo tanto la función head(), print() y top_n(6)
#son muy parecidas

#CREAR NUEVAS COLUMNAS A PARTIR DE LAS EXISTENTES
#para esto se usará la función mutate()
#la nueva variable que se crea es GDP
#que contiene el producto interno bruto de cada país
gapminder %>%
  select(country, year, pop, gdpPercap) %>%
  filter(year == 2007) %>%
  mutate(GDP = pop * gdpPercap) %>%
  arrange(desc(GDP)) %>%
  top_n(5)

#CALCULAR ESTADÍSTICAS

gapminder %>%
  summarise(AvgLifeExp = mean(lifeExp))
#se crea una nueva variable llamada
#llamda AvgLifeExp que contiene el promedio de la esperanza de vida
#de todos los años y países
#para calcular estadísticas se usa la función summarise()
gapminder %>%
  summarise(AvgLifeExp = mean(lifeExp))

gapminder %>%
  filter(year == 2007, continent == "Europe") %>%
  summarise(AvgLifeExp = mean(lifeExp))

#AGRUPAMIENTOS
#para agrupar se usa la función group_by()
gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarise(AvgLifeExp = mean(lifeExp))

gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarise(AvgLifeExp = mean(lifeExp)) %>%
  arrange(desc(AvgLifeExp))

gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarise(AvgLifeExp = mean(lifeExp)) %>%
  mutate(over75 = if_else(AvgLifeExp > 75, "Yes", "No"))
