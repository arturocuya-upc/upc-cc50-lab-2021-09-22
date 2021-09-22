# Reemplazo de NA con un valor aleatorio simple

# Hay que tener en cuenta que no podemos obtener el promedio de variables
# categóricas, sino solo de numéricas.

# Creamos una función llamada rand.valor que nos dará un valor aleatorio
# para variables del dataframe que queremos reemplazar.

rand.valor <- function(x) { # Esta función recibe en x un vector de valores
  # Coloca en el vector booleano faltantes TRUE o False, dependiendo si cada
  # valor de x es NA o no.
  faltantes <- is.na(x)
  # Suma en tot.faltantes los que resultaron ser TRUE
  tot.faltantes <- sum(faltantes)
  # x.obs contiene los valores de las filas que tienen un valor diferente a NA
  x.obs <- x[!faltantes]
  # El vector valorado tiene los valores iniciales de x
  valorado <- x
  # Retornamos el vector valorado, que tendrá los valores iniciales de x
  # con las NA cambiadas por un valor aleatorio.
  valorado[faltantes] <- sample(x.obs, tot.faltantes, replace=TRUE)
  return(valorado)
}

# Creamos una nueva función llamada random.df que recibirá como parámetro un 
# dataframe y los nombres de las columnas que queremos preprocesar.

random.df <- function(df, cols) {
  # En el vector nombres obtenemos todos los nombres de las columnas de df
  nombres <- names(df)
  for (col in cols) {
    # Para cada columna concatenamos en la variable nombre un nuevo nombre que
    # es el original + "valorado", separado por el caracter "."
    nombre <- paste(nombres[col], "valorado", sep=".")
    
    # Ejecutamos la función creada previamente para crear una nueva columna con
    # el resultado de la función.
    df[nombre] <- rand.valor(df[,col])
  }
  # Finalmente retornamos el dataframe
  df
}

data.limpio <- random.df(data, c(1,2))
View(data.limpio)
