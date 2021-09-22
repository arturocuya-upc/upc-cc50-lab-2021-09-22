
# 1. Eliminar datos sin valor

# El parámetro na.strings rellena los valores NA
data <- read.csv("/cloud/project/missing-data.csv", na.strings = "")

# na.omit elimina las filas que contengan un string NA
data.limpia <- na.omit(data)

# Consultando valores específicos con is.na
is.na(data[4,2])
is.na(data[4,1])
is.na(data$Income)

# 2. Limpieza selectiva de datos sin valor

# Eliminar NAs solo de la variable Income
data.income.limpio <- data[!is.na(data$Income),]

# complete.cases() devuelve un vector booleano que representa si cada
# fila contiene o no algún valor NA
complete.cases(data)
data.limpia2 <- data[complete.cases(data),]

# Limpiar valores 0:

# Convertir los 0 de Income en NA
data$Income[data$Income == 0] <- NA

# Al verificar de nuevo, vemos que todos los valores son NA, lo que
# significa que ningún valor es 0
data$Income[data$Income == 0]

# Limpiar valores NA para métricas estadísticas

# Al aplicar algunas funciones estadísticas a una columna de un dataframe,
# si esta contiene algún NA, el resultado de la función será NA
mean(data$Income)
sd(data$Income)
sum(data$Income)

# Podemos usar el argumento na.rm para evitar esto
mean(data$Income, na.rm=TRUE)
sd(data$Income, na.rm=TRUE)
sum(data$Income, na.rm=TRUE)
