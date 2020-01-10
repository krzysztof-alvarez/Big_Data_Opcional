# Big_Data_Opcional

Pregunta I:
Dentro del analisis descriptivo de la data se observo los siguientes resultados gracias al comando summary:

 Nomofobia         Estrés         Ansiedad     Compulsividad   Habilidades blandas Resolución de conflictos Tiempo de uso del celular    Género               Edad      
 Min.   : 1.00   Min.   : 5.00   Min.   : 4.00   Min.   : 1.00   Min.   :  1.00      Min.   :-10.00           Min.   :-15.00            Length:129         Min.   :20.00  
 1st Qu.:25.00   1st Qu.:32.00   1st Qu.:26.00   1st Qu.:36.00   1st Qu.: 28.00      1st Qu.: 20.00           1st Qu.: 34.00            Class :character   1st Qu.:22.00  
 Median :50.00   Median :49.00   Median :51.00   Median :50.00   Median : 54.00      Median : 52.00           Median : 57.00            Mode  :character   Median :25.00  
 Mean   :50.88   Mean   :51.46   Mean   :52.15   Mean   :52.87   Mean   : 57.71      Mean   : 49.61           Mean   : 54.83                               Mean   :24.56  
 3rd Qu.:75.00   3rd Qu.:72.00   3rd Qu.:77.00   3rd Qu.:74.00   3rd Qu.: 77.00      3rd Qu.: 74.00           3rd Qu.: 74.00                               3rd Qu.:27.00  
 Max.   :99.00   Max.   :97.00   Max.   :99.00   Max.   :99.00   Max.   :350.00      Max.   : 99.00           Max.   : 99.00                               Max.   :30.00  

no obstante, en otro analisis por medio de un str, se observa:

Classes 'tbl_df', 'tbl' and 'data.frame':	129 obs. of  9 variables:
 $ Nomofobia                : num  90 40 28 91 27 54 43 11 33 75 ...
 $ Estrés                   : num  75 10 24 89 56 34 54 58 15 59 ...
 $ Ansiedad                 : num  60 28 36 72 23 56 23 18 71 19 ...
 $ Compulsividad            : num  84 50 24 76 43 34 54 15 25 46 ...
 $ Habilidades blandas      : num  36 74 62 50 200 65 76 15 73 32 ...
 $ Resolución de conflictos : num  14 83 51 20 34 34 34 65 60 52 ...
 $ Tiempo de uso del celular: num  90 35 32 73 24 65 52 16 39 55 ...
 $ Género                   : chr  "Hombre" "Mujer" "Hombre" "Hombre" ...
 $ Edad                     : num  22 30 22 25 24 23 23 23 26 23 ...

De todo esto se pueden desprender diversas informaciones:
  -en primera instancia se observa el valor minimo, primer cuarto, mediana, media, tercer cuarto y maximo respectivamente de las variables numericas, mientras que en el caso del genero, se observa que es una variable con caracteres, esto se complementa con el str, que entrega de manera mas resumida diversa informacion, como el tipo de dato que es cada variable, la cantidad de observaciuones y el numero de variables.
  -se observa que se poseen 8 variables numericas, en onde se observa que la gran mayoria posee un rango dentro del 0 al 100, no obstante, se observan 3 variables con datos fuera de estos numeros, el maximo de 350 de las habilidades blandas, el -10 de resolucion de conflictos y el -15 del tiempo de uso del celular, los cuales podrian ser posibles outliner o valores sesgados.

Pregunta II:
se realizaron test de skewness, kurtosis y adicionalmente el de covarianzas.

skewness(y)
                Nomofobia                    Estrés                  Ansiedad             Compulsividad       Habilidades blandas  Resolución de conflictos Tiempo de uso del celular 
               0.12878701                0.07338894                0.07901527                0.05750247                3.24416758                0.03161134               -0.16833481 
                     Edad 
               0.24901861 
kurtosis(y)
                Nomofobia                    Estrés                  Ansiedad             Compulsividad       Habilidades blandas  Resolución de conflictos Tiempo de uso del celular 
                 1.808778                  1.950532                  1.781507                  2.041257                 23.228306                  1.756892                  2.124407 
                     Edad 
                 1.938916 
cor(y)
                            Nomofobia       Estrés    Ansiedad Compulsividad Habilidades blandas Resolución de conflictos Tiempo de uso del celular         Edad
Nomofobia                  1.00000000  0.328397624  0.12324115    0.32001898        0.0343570538              -0.03106306              0.5766500786 -0.079299764
Estrés                     0.32839762  1.000000000  0.07187968    0.20169148        0.0076307467              -0.12834645              0.2257177263 -0.090315182
Ansiedad                   0.12324115  0.071879676  1.00000000    0.21934711       -0.0756054772               0.03070713              0.1031302091 -0.017780325
Compulsividad              0.32001898  0.201691477  0.21934711    1.00000000       -0.0785649627               0.01907076              0.1448087616 -0.043059683
Habilidades blandas        0.03435705  0.007630747 -0.07560548   -0.07856496        1.0000000000              -0.17159496             -0.0007605529  0.003181668
Resolución de conflictos  -0.03106306 -0.128346445  0.03070713    0.01907076       -0.1715949599               1.00000000              0.0710679745  0.234187270
Tiempo de uso del celular  0.57665008  0.225717726  0.10313021    0.14480876       -0.0007605529               0.07106797              1.0000000000 -0.051957470
Edad                      -0.07929976 -0.090315182 -0.01778033   -0.04305968        0.0031816684               0.23418727             -0.0519574696  1.000000000     

de manera adicional, se realizan graficas de normalidad para ver el comportamiento de todas las variables

Pregunta III:
se realiza la regresion simple, generando como resultado
Call:
lm(formula = Data_Nomofobia$Nomofobia ~ Data_Nomofobia$Ansiedad + Data_Nomofobia$Compulsividad + Data_Nomofobia$Estrés + Data_Nomofobia$`Habilidades blandas` +
    Data_Nomofobia$`Resolución de conflictos` + Data_Nomofobia$`Tiempo de uso del celular` +  Data_Nomofobia$Género + Data_Nomofobia$Edad)

Coefficients:
                               (Intercept)                     Data_Nomofobia$Ansiedad                Data_Nomofobia$Compulsividad                       Data_Nomofobia$Estrés  
                                   0.38756                                     0.01861                                     0.24230                                     0.17185  
      Data_Nomofobia$`Habilidades blandas`   Data_Nomofobia$`Resolución de conflictos`  Data_Nomofobia$`Tiempo de uso del celular`                  Data_Nomofobia$GéneroMujer  
                                   0.03143                                    -0.03812                                     0.57033                                     1.82901  
                       Data_Nomofobia$Edad  
                                  -0.17161  

Pregunta IV:
se pueden observar los valores de mayor impacto son los de tiempo de uso de celular, genero y compulsividad, considerando solo los valores de los coeficientes, no obstante, se observa la relacion indirecta entre la edad y la nomofobia, demostrando en teoria que es algo que incide principalmente en los jovenes. Por otra parte, si tomamos en cuenta la interpretacion de las variables y sus coheficientes, la variable "habilidades Blandas" genera cierta duda, ya que al poseer una persona mas habilidades blandas deberia ser capaz de afrontar de mejor manera la perdida de su celular, es decir el coheficiente deberia ser negativo, como se puede observar en la situacion con la variable "Resolucion de Conflictos", la cual posee un coheficiente negativo indicando que esta permite sobrellevar esta situacion de mejor manera. Adicionalmente, las variables con coheficientes positivos, como lo son "Compulsividad", "Ansiedad", "Estres", y "Tiempo de uso del celular" tienen relacion directa con el comportamiento,es decir un aumento en ellas generaria un aumento en la Nomofobia.

Pregunta V:
Analysis of Variance Table

Response: Data_Nomofobia$Nomofobia
                                            Df Sum Sq Mean Sq F value    Pr(>F)    
Data_Nomofobia$Ansiedad                      1   1813  1812.5  3.8950 0.0507286 .  
Data_Nomofobia$Compulsividad                 1   9368  9368.2 20.1316 1.669e-05 ***
Data_Nomofobia$Estrés                        1   6699  6698.9 14.3956 0.0002336 ***
Data_Nomofobia$`Habilidades blandas`         1    421   421.2  0.9052 0.3433135    
Data_Nomofobia$`Resolución de conflictos`    1      1     1.4  0.0029 0.9568987    
Data_Nomofobia$`Tiempo de uso del celular`   1  23935 23935.2 51.4350 6.604e-11 ***
Data_Nomofobia$Género                        1    106   105.6  0.2270 0.6346206    
Data_Nomofobia$Edad                          1     30    30.4  0.0654 0.7986304    
Residuals                                  120  55842   465.3                      
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
En el analisis anova se observan la significancia de las variables, en donde se puede observar que solo son significantes la compulsividad, el estres y el tiempo de uso del celular. De manera adicional, se observa que la ansiedad esta ligeramente fuera del rango sin embargo, pese a esto, se puede considerar con una significancia aceptable.

Pregunta VI:
Grafica de barra de estres:
  -Se observan que las mayores frecuencias estre entre los niveles de estres del 40 al 60, a su vez, se observa que fraficamente, hay poca gente con bajos niveles de estres, y que podria tener una tendencia a ser constante o "plano" en ambitos de niveles de estres presentes en la gente. Adicionalmente se observa que no se ve un comportamiento de campana como es usualmente esperado o deseado.
Grafico de caja/boxplot:
  -De primera instancia se observa que la mediana tiene a estar cercano al 50, y la presencia de outliners en la grafica, generando cierta duda si estos son datos obtenidos de manera arbitraria, es un sesgo, un error de tipeo u otro. No obstante, es un fenomeno que hay que observar, y considerar para futuros analisis, puesto que no necesariamente los outliners siempre seran valores erroneos, puede que el valor de este fenomeno si explique o ejemplifique algo, para esto, si es posible, se debe consultar a la fuente de origen para tener de manera mas clara cual es el procedimiento a seguir con relacion a dicho outliner. Omitiendo lo anterior, y siguiendo con lo observado, se observa que la mayoria de los valores convergen cercanos del 50, y que la mayoria de estos, no exeden al rango de los 100-150
Grafico de barras:
  -La grafica de barras muestra una gran cantidad de observaciones, en donde se puede destacar una cierta polarizacion de los niveles de ansiedad que se recolectaron, se observa que o son valores muy altos (mayores a 60), o valores muy bajos(menores a 40) dejando relativamente pocos datos en el centro. Adicionalmente, no se puede saber en estos momentos si hay forma de campana, niveles de frecuencia acomulada u otros, puesto a que son valores mas individuales.
  
Pregunta VII:
se utilizan los boxplot realizados con anterioridad, y a su vez, un analisis estadistico de estos boxplot o graficas de caja por medio de la operacion integrada en el software, de esta manera se observaron 2 outliners en la variable habilidades blandas.

Pregunta VIII: 
Se realizaron las busquedas entre los primeros y ultimos valores para encontrar las posiciones de dichos valores, una vez realizado esto, se procedio a eliminar la fila de valores con dicho outliner, ya que no se sabe la manera o metodologia utilizada para la recopilacion de la informacion, se consideraron como valores sesgados, por lo que pueden comprometer la base de datos y su analisis. Una vez realizado esta eliminacion, se realizo nuevamente un proceso de analisis de outliner, y se encontro uno nuevo, en la misma variable en otra posicion, por lo que se realizo el mismo procedimiento y se volvio a corroborar. Con esta ultima, se confirmo la no existencia de mas outliner en la base de datos.
No obstante, se pueden ver valores negativos en ciertas variables, los cuales no fueron considerados outliners, por lo que puede existir el caso de que estos valores hayan sido permitido por quien recopilo los datos, de no ser asi, se deberian considerar como outliners o sesgo y ver como proceder a eliminarlos o en su defecto, ajustarlos para que no afecten a la base de datos.
