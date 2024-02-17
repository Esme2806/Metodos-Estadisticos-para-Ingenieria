2 + 2
34 / 6
2 * 5
5^3

# Es una función que me ayuda a detectar si la paquetería ya esta instalada o no
find.package("devtools")
# Error in find.package("devtools") : there is no package called ‘devtools’
# Es correcto este error porque no hemos instalado la paquetería

# Es una función que ayuda a instalar paquetería
# Esta función es la primera opción para descargar paqueterías
install.packages("devtools")

# las segunda opción para descargar paqueterías es bajar el archivo
# tar.gz de CRAN y guardarlo en la carpeta de R que esta en nuestro disco

# función    (argumento o argumentos)

# la tercera opción para instalar una paquetería es la siguiente ruta
# tools - install packages - seleccionar la paquetería

find.package("devtools")

# para cargar y usar la paquetería se usa la función library ()
library(devtools)

# vamos a usar una función que viene dentro del paquete devtools
find_rtools()

library(swirl)
