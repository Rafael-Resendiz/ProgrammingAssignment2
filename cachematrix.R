# ProgrammingAssignment2

## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
makeCacheMatrix <- function(x = matrix()) {

}

### Introduction

# This second programming assignment will require you to write an R
# function that is able to cache potentially time-consuming computations.
# For example, taking the mean of a numeric vector is typically a fast
# operation. However, for a very long vector, it may take too long to
# compute the mean, especially if it has to be computed repeatedly (e.g.
# in a loop). If the contents of a vector are not changing, it may make
# sense to cache the value of the mean so that when we need it again, it
# can be looked up in the cache rather than recomputed. In this

# Programming Assignment you will take advantage of the scoping rules of
# the R language and how they can be manipulated to preserve state inside
# of an R object.

### Example: Caching the Mean of a Vector

# In this example we introduce the `<<-` operator which can be used to
# assign a value to an object in an environment that is different from the
# current environment. Below are two functions that are used to create a
# special object that stores a numeric vector and caches its mean.

# The first function, `makeVector` creates a special "vector", which is
# really a list containing a function to

# 1.  set the value of the vector
# 2.  get the value of the vector
# 3.  set the value of the mean
# 4.  get the value of the mean

# <!-- -->

## In this case we have modeled the example makeVector function
## whose code has in mind the creation of a special vector preparing a function for

    # makeVector <- function(x = numeric()) {
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




## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}


	
# In this case we have modeled the example makeVector function 
# whose code has in mind the creation of a special vector 
# preparing a function for
	
	
	
	
# Replication of the prototype with the code to get the results you seek. 
# The task is to write a couple of functions to get the inverse matrix 1. 
# For what two functions will be written, the first is similar to the above, 
# but you must create a special object to obtain the inverse of the matrix. 
# So considering the above object code developed is as follows:
	
	
	makeCacheMatrix <- function(x = matrix()) { # Create the function and linked it at matrix
		
		## Create a list of functions that can obtain the inverse of the matrix
		
	  m<-NULL # Create objet for get the matrix
	  set<-function(y){ # create function for y values
	  x<<-y # link results that function at matrix
	  m<<-NULL
	}
	get<-function() x # Run the function
	setInversa<-function(inversa) m<<- inversa # Obtain the inverse of the matrix
	getInversa<-function() m # Get the results
	list(set=set, get=get, #list the results
	   setInversa=setInversa,
	   getInversa=getInversa)
	}
	
## Write a function that calculates the inverse of the especial "matrix"
## That returns the "makeCacheMatrix" function. 
## If the inverse matrix has been calculated (and the matrix has not changed), 
## Then "cacheSolve" must recover the inverse of the cache. 

## Example function for function cacheSolve
	
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
    
## Code for the "cacheSolve" function from the prototype

	
	cacheSolve <- function(x, ...) { # Create the function
		
		
	    m<-x$getInversa()  ## Calculate the inverse of the matrix returned by the "makeCacheMatrix" function
	    if(!is.null(m)){ ## If value is "null", send message
	      message("getting cached data")
	      return(m)
	    }
	    
	    data <- x$get()  # if data is not NULL, then result is store in a object
	    m<-solve(data,...) # Returns its inverse and store
	    x$setInversa(m)  # Retrieve the inverse from the cache
	    m
	} 
	
	
## In this part of the work, wrote the possible outcome of the functions, 
## waiting for its execution provide the expected result.

# First Example
	
d <- matrix(c(1:4),2)
e <- makeCacheMatrix(d)
e$get()
cacheSolve(e)

	
# Second example

j <- matrix(c(5:8),2)
k <- makeCacheMatrix(j)
cacheSolve(k)

# Third example

	a <- makeCacheMatrix(matrix(1:4,2))
		a$get()
		a$getInversa()
		a$set(matrix(5:8,2))
		a$get()
		cacheSolve(a)
		a$getInversa()
		b = a$getInversa()
		a$get() %*% b
		
