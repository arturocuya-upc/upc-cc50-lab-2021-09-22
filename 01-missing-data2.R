# 3. Reemplazo de valores NA con la media o valores aleatorios

# Reemplazo de NA con la media poblacional

data <- read.csv("/cloud/project/missing-data.csv", na.strings = "")

# Previo a calcular la media debemos reemplazar valores 0 por NA
data$Income[data$Income == 0] <- NA

# Agregamos una columna al dataframe para almacenar el promedio de ingresos,
# solo para los que tengan valor NA
data$Income.mean <- ifelse(is.na(data$Income),mean(data$Income, na.rm = TRUE),data$Income)
