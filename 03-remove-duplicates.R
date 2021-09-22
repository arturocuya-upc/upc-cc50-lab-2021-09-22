# Evitando duplicación de observaciones

# Crearemos nuestros propios datos
familia.salario <- c(40000,60000,50000, 80000, 60000, 70000, 60000) 
familia.integrantes <- c(4,3,2,2,3,4,3) 
familia.auto <- c("Lujo", "Compacto", "SUV", "Lujo", "Compacto", "Compacto", "Compacto") 
familia <- data.frame(familia.salario, familia.integrantes, familia.auto)

# Consultamos qué observaciones están duplicadas
duplicated(familia)

# Consultamos la información de cada fila duplicada
familia[duplicated(familia),]

# Consultamos las observaciones únicas
unique(familia)

# Podemos almacenar las observaciones únicas en un nuevo dataframe
familias.unicas <- unique(familia)

# Para este punto ya no existen observaciones duplicadas
View(familias.unicas)
