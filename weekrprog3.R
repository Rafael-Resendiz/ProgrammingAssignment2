### Tarea obteniendo la Inversa deuna Matriz	
	 # Se requiere escribir el código de una función en R que sea capaz de 
	# almacenar en caché los cálculos pueden requerir mucho tiempo.
	# Por ejemplo, tomar la media de un vector numérico es típicamente
	# una operación rápida. 
	# Sin embargo, para un vector muy largo, puede tardar demasiado tiempo
	# calcular la media, especialmente si el cálculada es reiterado (ej. bucle).
	# Si el contenido de un vector no están cambiando,tiene sentido 
	# almacenar en caché el valor de la media, para que cuando se necesite de nuevo 
	# se pueda consultar en la memoria caché en lugar de recalcularla. 
	
	
	# En esta asignación se tomarán las ventaja de las scoping rules del lenguaje R 
	# y la forma en que se puede manipular para preservar el estado interior 
	# de un objeto R.
	
	# En este caso se ha tomado como modelo el ejemplo de la función makeVector
	# cuyo código tiene en cuanta la cración de un vector especial o lista que 
	# prepara una función para:
	
	
	# # 1.  set the value of the vector
	# # 2.  get the value of the vector
	# # 3.  set the value of the mean
	# # 4.  get the value of the mean


	
	# #     makeVector <- function(x = numeric()) {
	            # m <- NULL
	            # set <- function(y) {
	                    # x <<- y
	                    # m <<- NULL
	            # }
	            # get <- function() x
	            # setmean <- function(mean) m <<- mean
	            # getmean <- function() m
	            # list(set = set, get = get,
	                 # setmean = setmean,
	                 # getmean = getmean)
	    # }
		
	## <!-- -->	
	
		# En esta parte se ha escrito el posible resultado de las funciones, esperando 
		# que su ejecución proporcione el resultado esperado.
	
	# a<-makeCacheMatrix()
	# a$set(matrix(1:4,2))
	# cacheSolve(a)
	
	a <- makeCacheMatrix(matrix(1:4,2))
		a$get()
		a$getInversa()
		a$set(matrix(5:8,2))
		a$get()
		cacheSolve(a)
		a$getInversa()
		b = a$getInversa()
		a$get() %*% b
		
	# Replicación del prototipo con el código para  obtener los resultados que se solicitan
	# La tarea consiste en escribir un par de funciones para obtener la inversa de 1 matriz
	# Por lo que se escribirán dos funciones, la primera es similar a la anterior, 
	# pero deberá crear un objeto especial para obtener la inversa de la matriz
	# Así que teniendo en cuenta el objeto anterior el código desarrollado es el siguiente: 
	
	
	makeCacheMatrix <- function(x = matrix()) {
		
		## Crear una lista de funciones que puedan obtener la inversa de la matriz
		
	  m<-NULL
	  set<-function(y){
	  x<<-y
	  m<<-NULL
	}
	get<-function() x
	setInversa<-function(inversa) m<<- inversa
	getInversa<-function() m
	list(set=set, get=get,
	   setInversa=setInversa,
	   getInversa=getInversa)
	}
	
	
	## Escribir una función que calcula la inversa de la "matriz" especial
	## que devuelve la función "makeCacheMatrix". 
	## Si la inversa ya se ha calculado (y la matriz no ha cambiado), 
	## entonces "cacheSolve" debe recuperar la inversa de la memoria caché.
	
	## Función de ejemplo para la función cacheSolve
	
	# cachemean <- function(x, ...) {
            # m <- x$getmean()
            # if(!is.null(m)) {
                    # message("getting cached data")
                    # return(m)
            # }
            # data <- x$get()
            # m <- mean(data, ...)
            # x$setmean(m)
            # m
    # }
    
    ##Código de la función cacheSolve a partir del prototipo

	
	cacheSolve <- function(x, ...) {
		
		## Calcular la inversa de la matriz que devuelve la función makeCacheMatrix
	    m<-x$getInversa()
	    if(!is.null(m)){
	      message("Obtención de datos en caché")
	      return(m)
	    }
	    
	    data <- x$get()  
	    m<-solve(data,...)
	    x$setInversa(m)
	    m
	}