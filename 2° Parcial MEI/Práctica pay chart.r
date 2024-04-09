#la función ls() sirve para mostrar las variables que siguen vigentes en el ambiente global
ls()
#la función rm() sirve para  borrar las variables
#remove
rm(list=ls())
ls()

#pie() esta función me ayuda a representar visualmente la info
#la caracxterística de la gráfica de pay es que todos los elementos deben de sumar 100%

count<-c(7, 25, 16, 12, 10, 30)
count

pie(count)

#vamos a colocar el argumentoque se llama clockwise=
#por default viene en modo falso y lo vamos a colocar en modo true

pie(count, clockwise = TRUE)

#vamos a modificar el argumento llamado label=

pie(count, labels = count)

#podemos colocar etiquetas con nombres propios o rangos

pie(count, labels = c("0-15", "16-30", "31-45", "46-60", "61-75", "76-90"))
pie(count, labels = c("Diana", "Miguel", "José", "Miriam", "Marcos", "Jorge"))

#vamos a personalizar los colores de la gráfica usando el argumento col= y el argumento cex= permite modificar el tamaño de las etiquetas

pie(count, labels = count, col = 1:6, cex=2)
pie(count, labels = count, col = 2:7, cex=1)
pie(count, labels = count, col = 6:12, cex=3)
#col=1-6 toma de una paleta de colores estándar
#mientras que rainbow es una de tantas de paletas de colores de R 
pie(count, labels = count, col = rainbow(6), cex=1)
pie(count, labels = count, col = topo.colors(6), cex=1)

#vamos a utilizar un argumento llamado mfrow= este argumento sirve para visualizar varias gráficas en una
#hay que correr la función y cada una de las 
par(mfrow= c(1,3))

pie(count, labels = count, col = 1:6, cex=2)
pie(count, labels = count, col = 2:7, cex=1)
pie(count, labels = count, col = 6:12, cex=3)

par(mfrow= c(2,1))

pie(count, labels = count, col = 1:6, cex=2)
pie(count, labels = count, col = 2:7, cex=1)
pie(count, labels = count, col = 6:12, cex=3)

#vamos a usar una paleta de colores que se llama bremer.pal
#esta se encuentra en la paquetería de RcolorBrewer
#despues de instalar la paquetería se debe cargar con la funcion library
library(RColorBrewer)

#la paleta de coloresbrewer.pal tiene 8 conjuntos de colores
color<-brewer.pal(length(count), "Set2")
pie(count, labels = count, col=color)

color<-brewer.pal(length(count), "Set1")
pie(count, labels = count, col=color)

color<-brewer.pal(length(count), "Set3")
pie(count, labels = count, col=color)

color<-brewer.pal(length(count), "Pastel1")
pie(count, labels = count, col=color)

color<-brewer.pal(length(count), "Pastel2")
pie(count, labels = count, col=color)

color<-brewer.pal(length(count), "Accent")
pie(count, labels = count, col=color)

color<-brewer.pal(length(count), "Dark2")
pie(count, labels = count, col=color)

color<-brewer.pal(length(count), "Paired")
pie(count, labels = count, col=color)

#ahora vamos a utilizar el argumento border= para modificar el borde de la gráfica
pie(count, labels = count, col = color, border = color)

#vamos a modificar el tipo de línea con el argumento lty=
pie(count, labels = count, col = color, lty = 2)

#vamos a integrar el argumento de densidad del color con density=
#también usaremos el argmento angle= 
pie(count, labels = count, col = color, density = 110, angle = 60)

#vamos a modificar la figura con el argumento edge=
pie(count, labels = count, edges = 20)

#Esta funcion me ayuda a restablecer la aparición de una figura
par(infrow = c(1, 1))

#como agrgar los porcentajes a los elementos
pie(count, label=paste0(count, "%"))

#ejemplo para graficar elementos que no sumen el 100%
count_2<-c(15,27, 25, 10)

#son 4 elementos
#vamos a usar una función llamada round y saca la proporción de cada elemento
pi_labels<-paste0(round(100*count_2/sum(count_2), 2),"%")
pie(count_2, labels = pi_labels)
#esta operacion es la siguiente:15/77*100=48%

#si queremos que se desplieguen los valores originales 
pi_labels<-paste0(count_2, "=", round(100*count_2/sum(count_2), 2),"%")
pie(count_2, labels = pi_labels)

#para buscar mas info de la funcion se usa lo siguiente:
help("piechart")
?piechart 

#instalar una paqueteria llamada "LessR"
#Esta paquetería tiene más argumentos para personalizar la gráfica
install.packages("lessR")

#después de instalarla se procede a cargar la paquetería con library()
library(lessR)

#Estamos creando u na tabla de datos con c() y rep()
my_data<- data.frame(x=c(rep(count_2[1], count_2[1]), 
                        rep(count_2[2], count_2[2]),
                        rep(count_2[3], count_2[3]), 
                        rep(count_2[4], count_2[4])))

#Letras con values, 
PieChart(x, hole=0, values="%", data=my_data, fill=1:4,main = " ")

PieChart(x, values = "%", data= my_data)

#En esta función los colores se llaman con el argumento fill=
#en esta funcion el argumento hole= nos ayuda a representar el grafico completo

PieChart(x, hole=0, values="%", data=my_data, fill="turquoises",main = "Título del gráfico")
#main= nos permite poner título
#también podemos llamar paletas de colores como "grays" o para una rebanada "gray"

#graficar datos cualitativos o categoricos con la función de factor()
#vamos a crear datos categóricos 
gender_var<-factor(c(rep("male", 10), rep("female", 20)))
gender_var

#para contar las variables categoricas se usa la función table(
gender_table<-table(gender_var)
gender_table

#esta grafica es con la funcion base de pie()
pie(gender_table)

#vamos a programar con el paquete lessR
gender<-data.frame(gend= gender_var)
gender

PieChart(gend, hole=0, values="%", data=gender, fill=c("pink", "lightblue"), main="Gender")

#creamos una nueva variable llamada count 3
count_3<-(c(20, 50, 30))
pie(count_3, labels = paste0(count_3), "%")
legend("topleft", legend = c("Teatro", "Series", "Películas"), fill = C("white"", "lightblue", "mistyrose"))

#tambien existe top, topright, etc. 
#plotrix es un paquete que permite hacer graficass en 3D

install.packages(plotrix)
library(plotrix)

num_data<-c(65, 35)
num_data
pie3D(num_data, labels=num_data)

#usaremos un argumento para dividir la grafica explode=
pie3D(num_data, labels= num_data, explode=0.1)

#vamos a corregir el color de los bordes de la grafica
pie3D(num_data, labels= num_data, explode=0.1, col= 2:3, labelcol= "red", border= "white")

