# BARLOT O GRAFICA DE BARRAS
# preparamos el ambiente global eliminando toda variable ajena a este nuevo programa
ls()
rm(list = ls())
ls()

# crear una nueva variable que contenga los datos a graficar

values <- c(0, 4, 0.75, 0.2, 0.6, 0.5)
values

# graficar barras usar funcion barplot, pertenece a las funciones basicas de R
barplot(values)

# podemos empezar a personalizar cambiando colores con argumento col=
barplot(values, col = "#1b98e0")
barplot(values, col = "#00FF00")
# Estos co´digos se llaman HEX-CODES

# Podemos personalizar la orientación de la gráfica
barplot(values, horiz = TRUE, col = "#1b98e0")

# ahora usaremos el argumento names.arg para poner las etiquetas
group <- LETTERS[1:5]
group
barplot(values, names.arg = group)
barplot(values, col = "#00FF00", horiz = TRUE, names.arg = group)

# Diagrama de barras apiladas
data <- as.matrix(data.frame(
    A = c(0.2, 0.4),
    B = c(0.3, 0.1),
    C = c(0.7, 0.1),
    D = c(0.1, 0.2),
    E = c(0.3, 0.3)
))
data
barplot(data, col = c("#3383FF", "#33FF71"))
# Ahora vamos agregar la leyenda a la gráfica con la función legend()
legend("topright", legend = c("Grupo 1", "Grupo 2"), fill = c("#3383FF", "#33FF71"))

# Agrupamientoo de grafica de barra
# con el argumento beside=se agrupan a los costados
barplot(data, col = c("#3383FF", "#33FF71"), beside = TRUE)

# vamos a usar la nueva paqueteria llamada ggplot2
# por lo tanto se va instalar (en Tools --> Intall packages--> gglot2)
# ahora la podemos llamar con la funcion library
library(ggplot2)

# crear una nueva variable
data_ggp <- data.frame(group, values)
# y usando la funcion ggplot para graficar
# la funcion de aes() se llama funcion de cotización
# nos ayuda a leer los data frame
# la funcion geom_bar(), nos ayuda a redimensionar elementos de la grafica,que se vea estética

ggplot(data_ggp, aes(x = group, y = values)) +
    geom_bar(stat = "identity")
# ahora utilizaremos una nueva paqueteria llamada plotly
# instalar y cargar
library(plotly)
plot_ly(x = group, y = values, type = "bar")
# la funcion plot_ly pertenece a paqueteria plotly
# esta paqueteria me sirve porque e smas facil su uso
# y con el argumento type=, podemos elegir el tipo de grafica a usar
