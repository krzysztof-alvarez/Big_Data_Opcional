#Desarrollo de guia opcional
#se integra la data y se procede a trabajar

library(readxl)
Data_Nomofobia <- read_excel("D:/Descargas/Data_Nomofobia.xlsx")
#se procede a observar la tabla en una primera instancia
# I: estadistica descriptiva
View(Data_Nomofobia)
#se realiza el resumen con analisis basico de los datos
summary(Data_Nomofobia)
str(Data_Nomofobia)
#se realizan graficas  diversas de cada variable
#se transforma sexo en un factor para ser graficado
Data_Nomofobia$Género_factor <- factor(Data_Nomofobia$Género, labels = c("Hombre", "Mujer"))
str(Data_Nomofobia$Género_factor)
#barra
par(mfcol=c(2,4))
hist(Data_Nomofobia$Nomofobia, col = "red",border = "black", xlab = "Nomofobia", ylab = "Frecuencia", main = "Grafico de barra de Nomofobia")
hist(Data_Nomofobia$Estrés, col = "green",border = "black", xlab = "Estres", ylab = "Frecuencia", main = "Grafico de barra de Estres")
hist(Data_Nomofobia$Ansiedad, col = "blue",border = "black", xlab = "Ansiedad", ylab = "Frecuencia", main = "Grafico de barra de Ansiedad")
hist(Data_Nomofobia$Compulsividad, col = "orange",border = "black", xlab = "Compulsividad", ylab = "Frecuencia", main = "Grafico de barra de Compulsividad")
hist(Data_Nomofobia$`Habilidades blandas`, col = "purple",border = "black", xlab = "Habilidades blandas", ylab = "Frecuencia", main = "Grafico de barra de Habilidades blandas")
hist(Data_Nomofobia$`Resolución de conflictos`, col = "pink",border = "black", xlab = "Resolucion de conflictos", ylab = "Frecuencia", main = "Grafico de barra de Resolucion de conflictos")
hist(Data_Nomofobia$`Tiempo de uso del celular`, col = "brown",border = "black", xlab = "Tiempo de uso de celular", ylab = "Frecuencia", main = "Grafico de barra de Tiempo de uso del celular")
hist(Data_Nomofobia$Edad, col = "grey",border = "black", xlab = "Edad", ylab = "Frecuencia", main = "Grafico de barra de Edad")

#dispercion
par(mfcol=c(3,3))
plot(Data_Nomofobia$Nomofobia, col = "red", xlab = "Nomofobia", ylab = "Frecuencia", main = "Grafico de dispersion Nomofobia")
plot(Data_Nomofobia$Estrés, col = "green", xlab = "Estres", ylab = "Frecuencia", main = "Grafico de dispersion Estres")
plot(Data_Nomofobia$Ansiedad, col = "blue", xlab = "Ansiedad", ylab = "Frecuencia", main = "Grafico de dispersion Ansiedad")
plot(Data_Nomofobia$Compulsividad, col = "orange", xlab = "Compulsividad", ylab = "Frecuencia", main = "Grafico de dispersion Compulsividad")
plot(Data_Nomofobia$`Habilidades blandas`, col = "purple", xlab = "Habilidades blandas", ylab = "Frecuencia", main = "Grafico de dispersion Habilidades blandas")
plot(Data_Nomofobia$`Resolución de conflictos`, col = "pink", xlab = "Resolucion de conflictos", ylab = "Frecuencia", main = "Grafico de dispersion Resolucion de conflictos")
plot(Data_Nomofobia$`Tiempo de uso del celular`, col = "brown", xlab = "Tiempo de uso de celular", ylab = "Frecuencia", main = "Grafico de dispersion Tiempo de uso del celular")
plot(Data_Nomofobia$Edad, col = "grey", xlab = "Edad", ylab = "Frecuencia", main = "Grafico de dispersion Edad")
plot(Data_Nomofobia$Género_factor, xlab = "Género", ylab = "Frecuencia", main = "Grafico de dispersion Genero")

#caja con outliners para saber si hay datos en outline
par(mfcol=c(2,4))
boxplot(Data_Nomofobia$Nomofobia, outline = TRUE, main = "Nomofobia", col = "red",border = "black",  xlab = "Distribucion de Nomofobia", ylab = "Frecuencia")
boxplot(Data_Nomofobia$Estrés, outline = TRUE, main = "Estres", col = "green",border = "black",  xlab = "Distribucion de Estres", ylab = "Frecuencia")
boxplot(Data_Nomofobia$Ansiedad, outline = TRUE, main = "Ansiedad", col = "blue",border = "black",  xlab = "Distribucion de Ansiedad", ylab = "Frecuencia")
boxplot(Data_Nomofobia$Compulsividad, outline = TRUE, main = "Compulsividad", col = "orange",border = "black",  xlab = "Distribucion de Compulsividad", ylab = "Frecuencia")
boxplot(Data_Nomofobia$`Habilidades blandas`, outline = TRUE, main = "Habilidades Blandas", col = "purple",border = "black",  xlab = "Distribucion de Habilidades blandas", ylab = "Frecuencia")
boxplot(Data_Nomofobia$`Resolución de conflictos`, outline = TRUE, main = "Resolucion de conflictos", col = "pink",border = "black",  xlab = "Distribucion de Resolucion de conflictos", ylab = "Frecuencia")
boxplot(Data_Nomofobia$`Tiempo de uso del celular`, outline = TRUE, main = "Tiempo de uso del celular", col = "brown",border = "black",  xlab = "Distribucion de Tiempo de uso del celular", ylab = "Frecuencia")
boxplot(Data_Nomofobia$Edad, outline = TRUE, main = "Edad", col = "grey",border = "black",  xlab = "Distribucion de Edad", ylab = "Frecuencia")


# II : tests
library(moments)
x <- as.data.frame(Data_Nomofobia)
y <- x[-8,-10]
y <- y[-8]
y
skewness(y)
kurtosis(y)
par(mfcol=c(2,4))
qqnorm(Data_Nomofobia$Nomofobia)
qqnorm(Data_Nomofobia$Estrés)
qqnorm(Data_Nomofobia$Ansiedad)
qqnorm(Data_Nomofobia$Compulsividad)
qqnorm(Data_Nomofobia$`Habilidades blandas`)
qqnorm(Data_Nomofobia$`Resolución de conflictos`)
qqnorm(Data_Nomofobia$`Tiempo de uso del celular`)
qqnorm(Data_Nomofobia$Edad)
cor(y)


# III: Regresion simple
regresionMCO<-lm(Data_Nomofobia$Nomofobia~Data_Nomofobia$Ansiedad+Data_Nomofobia$Compulsividad+Data_Nomofobia$Estrés+Data_Nomofobia$`Habilidades blandas`+Data_Nomofobia$`Resolución de conflictos`+Data_Nomofobia$`Tiempo de uso del celular`+Data_Nomofobia$Género+Data_Nomofobia$Edad)
regresionMCO
View(regresionMCO)
##se pueden observar los valores de mayor impacto son los de tiempo de uso de celular, genero y compulsividad, considerando solo los valores de los coeficientes, no obstante, se observa la relacion
#indirecta entre la edad y la nomofobia, demostrando en teoria que es algo que incide principalmente en los jovenes. 

#V: Anova
anova(regresionMCO)
plot(regresionMCO, which = 1)
plot(regresionMCO, which = 2)
residuos <- rstandard(regresionMCO)
hist(residuos, main = "residuos MCO", col = "brown")


# VI: Graficos
  
par(mfcol=c(1,1))
hist(Data_Nomofobia$Estrés, col = "green",border = "black", xlab = "Estres", ylab = "Frecuencia", main = "Grafico de barra de Estres")

boxplot(Data_Nomofobia$`Habilidades blandas`, outline = TRUE, main = "Habilidades Blandas", col = "purple",border = "black",  xlab = "Distribucion de habilidades blandas", ylab = "Frecuencia")
  
barplot(Data_Nomofobia$Ansiedad, main = "Ansiedad", col = "blue",border = "black", xlab = "Niveles de Ansiedad", ylab = "Frecuencia")

# VII: outliners
library(MASS)
library(car)
library(ggplot2)
par(mfcol=c(3,3))
boxplot(Data_Nomofobia$Nomofobia, outline = TRUE, main = "nomofobia", col = "red",border = "black")
boxplot(Data_Nomofobia$Estrés, outline = TRUE, main = "Estres", col = "green",border = "black")
boxplot(Data_Nomofobia$Ansiedad, outline = TRUE, main = "Ansiedad", col = "blue",border = "black")
boxplot(Data_Nomofobia$Compulsividad, outline = TRUE, main = "Compulsividad", col = "orange",border = "black")
boxplot(Data_Nomofobia$`Habilidades blandas`, outline = TRUE, main = "Habilidades Blandas", col = "purple",border = "black")
boxplot(Data_Nomofobia$`Resolución de conflictos`, outline = TRUE, main = "Resolucion de conflictos", col = "pink",border = "black")
boxplot(Data_Nomofobia$`Tiempo de uso del celular`, outline = TRUE, main = "Tiempo de uso del celular", col = "brown",border = "black")
boxplot(Data_Nomofobia$Edad, outline = TRUE, main = "Edad", col = "grey",border = "black")
plot(Data_Nomofobia$Género_factor, xlab = "Género", ylab = "Frecuencia", main = "Grafico de dispersion genero")

boxplot.stats(Data_Nomofobia$Nomofobia)
boxplot.stats(Data_Nomofobia$Estrés)
boxplot.stats(Data_Nomofobia$Ansiedad)
boxplot.stats(Data_Nomofobia$Compulsividad)
boxplot.stats(Data_Nomofobia$`Habilidades blandas`) #posee outliner 200 y 350
boxplot.stats(Data_Nomofobia$`Resolución de conflictos`)
boxplot.stats(Data_Nomofobia$`Tiempo de uso del celular`)
boxplot.stats(Data_Nomofobia$Edad)
boxplot.stats(Data_Nomofobia$Género_factor)


(head(Data_Nomofobia$`Habilidades blandas`, n = 50))
#se observa outliner en 5  posicion
(tail(Data_Nomofobia$`Habilidades blandas`, n = 50))
#se encuentra el otro outlinner en la posicion 106
Data_sin_outliner <- Data_Nomofobia[c(-5,-106),]

#se corrobora outliners

par(mfcol=c(3,3))
boxplot(Data_sin_outliner$Nomofobia, outline = TRUE, main = "nomofobia", col = "red",border = "black")
boxplot(Data_sin_outliner$Estrés, outline = TRUE, main = "Estres", col = "green",border = "black")
boxplot(Data_sin_outliner$Ansiedad, outline = TRUE, main = "Ansiedad", col = "blue",border = "black")
boxplot(Data_sin_outliner$Compulsividad, outline = TRUE, main = "Compulsividad", col = "orange",border = "black")
boxplot(Data_sin_outliner$`Habilidades blandas`, outline = TRUE, main = "Habilidades Blandas", col = "purple",border = "black")
boxplot(Data_sin_outliner$`Resolución de conflictos`, outline = TRUE, main = "Resolucion de conflictos", col = "pink",border = "black")
boxplot(Data_sin_outliner$`Tiempo de uso del celular`, outline = TRUE, main = "Tiempo de uso del celular", col = "brown",border = "black")
boxplot(Data_sin_outliner$Edad, outline = TRUE, main = "Edad", col = "grey",border = "black")
plot(Data_sin_outliner$Género_factor, xlab = "Género", ylab = "Frecuencia", main = "Grafico de dispersion genero")

boxplot.stats(Data_sin_outliner$Nomofobia)
boxplot.stats(Data_sin_outliner$Estrés)
boxplot.stats(Data_sin_outliner$Ansiedad)
boxplot.stats(Data_sin_outliner$Compulsividad)
boxplot.stats(Data_sin_outliner$`Habilidades blandas`) #posee outliner 150
boxplot.stats(Data_sin_outliner$`Resolución de conflictos`)
boxplot.stats(Data_sin_outliner$`Tiempo de uso del celular`)
boxplot.stats(Data_sin_outliner$Edad)
boxplot.stats(Data_sin_outliner$Género_factor)

(head(Data_sin_outliner$`Habilidades blandas`, n = 50))
#se observa outliner en 10 posicion
Data_sin_outliner <- Data_sin_outliner[c(-10),]
#se vuelve a corroborar
par(mfcol=c(3,3))
boxplot(Data_sin_outliner$Nomofobia, outline = TRUE, main = "nomofobia", col = "red",border = "black")
boxplot(Data_sin_outliner$Estrés, outline = TRUE, main = "Estres", col = "green",border = "black")
boxplot(Data_sin_outliner$Ansiedad, outline = TRUE, main = "Ansiedad", col = "blue",border = "black")
boxplot(Data_sin_outliner$Compulsividad, outline = TRUE, main = "Compulsividad", col = "orange",border = "black")
boxplot(Data_sin_outliner$`Habilidades blandas`, outline = TRUE, main = "Habilidades Blandas", col = "purple",border = "black")
boxplot(Data_sin_outliner$`Resolución de conflictos`, outline = TRUE, main = "Resolucion de conflictos", col = "pink",border = "black")
boxplot(Data_sin_outliner$`Tiempo de uso del celular`, outline = TRUE, main = "Tiempo de uso del celular", col = "brown",border = "black")
boxplot(Data_sin_outliner$Edad, outline = TRUE, main = "Edad", col = "grey",border = "black")
plot(Data_sin_outliner$Género_factor, xlab = "Género", ylab = "Frecuencia", main = "Grafico de dispersion genero")

boxplot.stats(Data_sin_outliner$Nomofobia)
boxplot.stats(Data_sin_outliner$Estrés)
boxplot.stats(Data_sin_outliner$Ansiedad)
boxplot.stats(Data_sin_outliner$Compulsividad)
boxplot.stats(Data_sin_outliner$`Habilidades blandas`) 
boxplot.stats(Data_sin_outliner$`Resolución de conflictos`)
boxplot.stats(Data_sin_outliner$`Tiempo de uso del celular`)
boxplot.stats(Data_sin_outliner$Edad)
boxplot.stats(Data_sin_outliner$Género_factor)

#no se vuelven a apreciar outliners.
