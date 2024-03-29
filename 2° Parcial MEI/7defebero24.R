count <- c(7, 25, 16, 12, 10, 30)

pie(count)

# vamos al colocar el argumento clockwise
# por default es FALSE
# y lo vamos a cambiar a TRUE

pie(count, clockwise = TRUE)

# vamos a modificar el argumento llamado label=

pie(count, labels = count)

# podemos colocar etiquetas con nombres propios o etiquetas

pie(count, labels = c("0-15", "16-30", "31-45", "46-60", "61-75", "76-90"))

pie(count, labels = c("Diana", "Miguel", "Juan", "Pedro", "Maria", "Ana"))

# vamos a personalizar los colores de la gráfica
# usando el argumento col= y el argumento
# cex= permite modificar el tamaño de las etiquetas

pie(count, labels = count, col = 1:6, cex = 2)
pie(count, labels = count, col = 2:7, cex = 1)
pie(count, labels = count, col = 6:12, cex = 3)
pie(count, labels = count, col = rainbow(6), cex = 1)

# col=1:6 toma de una paleta de colores estándar
# mientras que rainbow(6) es una paleta de colores predefinida
pie(count, labels = count, col = topo.colors(6), cex = 1)
# vamos a utilizar un argumento llamado mfrow=
# este argumento sirve para visualizar varias gráficas en una imagen
par(mfrow = c(1, 3))
pie(count, labels = c("0-15", "16-30", "31-45", "46-60", "61-75", "76-90"))

pie(count, labels = c("Diana", "Miguel", "Juan", "Pedro", "Maria", "Ana"))
pie(count, labels = count, col = 1:6, cex = 2)

# RColorBrewer
# vamos a instalar el paquete RColorBrewer
library(RColorBrewer)
color <- brewer.pal(length(count), "Set2")
pie(count, labels = count, col = color)
# ahora vamos a utilizar el argumento border= para modificar el color del borde
pie(count, labels = count, col = color, border = "#7A48DE")
# vamos a modificar el tipo de linea del borde
# con el argumento lty=
pie(count, labels = count, col = color, lty = 10)

# vamos a integrar la función de densidad del color
# usando el argumento density()
pie(count, labels = count, col = color, density = 50, angle = 45)
# edge= permite modificar el grosor del borde
pie(count, labels = count, col = color, edge = 20)

# como agregar los % de los elementos
pie(count, labels = paste0(count, "%"))

# ejemplo para graficar elementos que no sumen el 100%
# vamos a crear un vector
count_2 <- c(15, 27, 25, 10)
# son 4 elementos y suman 77
# vamos a usar una función llamada round()
pie_labels <- paste0(round(100 * count_2 / sum(count_2), 2), "%")
pie(count_2, labels = pie_labels)
# esta operación es la siguiente 15/77=0.19*100=19.48%
# si queremos que se desplieguen los elementos originales y no los calculados
pie_labels <- paste0(count_2, "=", round(100 * count_2 / sum()))
pie(count_2, labels = pie_labels)

# para buscar + info
# ?PieChart

# instalar una paquetería llamada "lessR"
# esta paquetería tiene más argumentos para personalizar la gráfica
# después de instalar se procede a cargar la paquetería con
library("lessR")
my_data <- data.frame(x = c(rep(
  count_2[1],
  count_2[1],
  count_2[2],
  count_2[2],
  count_2[3],
  count_2[3],
  count_2[4],
  count_2[4]
)))

# estamos creando un tabla de datos con la función c() y rep()
PieChart(x, hole = 0, values = "%", data = my_data, fill = 1:4, main = " ")

pie_labels <- paste0(count_2, "=", round(100 * count_2 / sum(count)))
pie(count_2, labels = pie_labels)
count_2 <- c(15, 27, 25, 10)
mis_datos <- c(12, 14, 34, 56)
# es esta función los colores llaman con el argumento fill=
# en esta función el argumento hole= nos ayuda a representar el gráfico completo
PieChart(
  x,
  hole = 0,
  values = "%",
  data = my_data,
  fill = "red",
  main = "Titulo del gráfico"
)
# también podemos llamar paletas de colores por ejemplo una rebanada
# y el plural grays nos da la paleta de escala de grises

# graficar datos cualitativos o categóricos
# con la función de factor()
# vamos a crear datos categóricos
gender_var <- factor(c(rep("Male", 10), rep("Female", 20)))
gender_var
# para contar las variables categóricas se usa la función table()
gender_table <- table(gender_var)
gender_table
pie(gender_table)

# vamos a programar con el paquete LessR
gender <- data.frame(g = gender_var)
gender

PieChart(
  g,
  hole = 0,
  values = "%",
  data = gender,
  fill = c("lightblue", "pink"),
  main = "Gender"
)

# creamos una nueva variable llamada count_3
count_3 <- c(20, 50, 30)
pie(count_3, labels = paste0(count_3, "%"))
legend(
  "topleft",
  legend = c("Teatro", "Series", "Películas"),
  fill = c("white", "lightblue", "mistyrose")
)

# también existe top, topright, etc.
# plotrix es un paquete que permite hacer gráficas en 3D
library("plotrix")

num_data <- c(65, 35)

# usaremos un argumento para dividir la gráfica explode=
# vamos a corregir el color de los bordes de la gráfica
pie3D(
  num_data,
  labels = num_data,
  explode = 0.1,
  col = 2:3,
  labelcol = "red",
  border = "white"
)
