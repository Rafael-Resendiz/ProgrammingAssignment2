# ProgrammingAssignment2

## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
makeCacheMatrix <- function(x = matrix()) {

}


## Task obtaining the Inverse of a Matrix 
This second programming assignment will require you to write an R
function that is able to cache potentially time-consuming computations.
For example, taking the mean of a numeric vector is typically a fast
operation. However, for a very long vector, it may take too long to
compute the mean, especially if it has to be computed repeatedly (e.g.
in a loop). If the contents of a vector are not changing, it may make
sense to cache the value of the mean so that when we need it again, it
can be looked up in the cache rather than recomputed. In this
Programming Assignment you will take advantage of the scoping rules of
the R language and how they can be manipulated to preserve state inside
of an R object.

### Example: Caching the Mean of a Vector

In this example we introduce the `<<-` operator which can be used to
assign a value to an object in an environment that is different from the
current environment. Below are two functions that are used to create a
special object that stores a numeric vector and caches its mean.

The first function, `makeVector` creates a special "vector", which is
really a list containing a function to

1.  set the value of the vector
2.  get the value of the vector
3.  set the value of the mean
4.  get the value of the mean


makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

#### Tarea obteniendo la Inversa deuna Matriz	
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
