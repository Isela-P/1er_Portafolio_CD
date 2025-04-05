#Cargar las librerías
library(readr)
library(dplyr)
library(ggplot2)
#cargar archivo

data <- read_csv("salarios_mujeres.csv")
print("Cargando archivo ´Salarios_Mujeres´...")
#Leer datos del archivo cargado
cat("Las dimensiones del DataSet son:", dim(data))
head(data)
print("Se presenta el resumen estadístico del DataSet")
summary(data)

#Limpieza de datos
print("Analizando los datos...")
#Ver Cuántos NA (Datos Nulos) hay en el Dataset
cat("Existen", sum(is.na(data)), "datos Nulos en el dataset")
#Eliminar datos nulos
print("Eliminando datos nulos...")
datos_sin_NA<- na.omit(data)
print("Se han eliminado los datos nulos")
cat("Las nuevas dimensiones del DataSet son:", dim(datos_sin_NA))
head(datos_sin_NA)

#Eliminar datos duplicados
cat("Existen", sum(duplicated(datos_sin_NA)), "en el DataSet")
print("Eliminando datos duplicados...")
datos_limpios <- datos_sin_NA[!duplicated(datos_sin_NA), ]
cat("Se han eliminado los datos duplicados. Las nuevas dimensiones del DataSet son", dim(datos_limpios))

head(datos_limpios)

print("Realinzando análisis estadístico del DataSet Limpio")
summary(datos_limpios)

#Visualización de DATOS
print("Creando diagrama de puntos del Salario que ganan las mujeres Vs su Edad ")

ggplot(datos_limpios, aes(x = Edad, y = Salario)) +  
  geom_point(color = "blue") +
  labs(title = "Salario de Mujeres Vs Edad", x = "Edad (años)", y = "Salario ($)") +
  theme_minimal()

print("Creando histograma de la Edad de Mujeres.")

ggplot(datos_limpios, aes(x = Edad)) +  
  geom_histogram(binwidth = 10, fill = "lightgreen", color = "black") +
  labs(title = "Edad de mujeres", x = "Edad", y = "N° de Mujeres") +
  theme_replace()

#Link de mi portafolio en GitHub
print("Anexando el link para acceder a mi Portafolio en GitHub...")

print("https://github.com/Isela-P/1er_Portafolio_CD")

#https://github.com/Isela-P/1er_Portafolio_CD