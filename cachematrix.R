## Put comments here that give an overall description of what your
## functions do
## Write a short comment describing this function
# makeCacheMatrix is a function that returns a list of functions
# Its puspose is to store a martix and a cached value of the inverse of the 
# matrix. Contains the following functions:
# * set          set the value of a matrix
# * get          get the value of a matrix
# * setinverse   get the cahced value (inverse of the matrix)
# * getinverse   get the cahced value (inverse of the matrix)
makeCacheMatrix <- function(x = numeric()) {
# initially nothing is cached so set c (cache) it to NULL
      inverse <- NULL
 # storing the matrix
      set <- function(y) {
            x <<- y
 # As the matrix is assigned a new value, flush the c(cache)
            inverse <<- NULL
      }
      
       # returns the matrix which is stored earliter
      get <- function() x
      
       # cache the given argument 
      setinverse <- function(input) inversre <<- input

        # get the cached value
      getinverse <- function() inverse

  # return a list. Each named element of the list is a function
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)
}


cacheSolve <- function(x, ...) {
 # get the cached value
      inverse <- x$getinverse()
 # if a cached value exists return it
      if(!is.null(inverse)) {
            message("getting cached data")
            return(inverse)
      }
  # otherwise get the matrix, caclulate the inverse and store it in the cache
      data <- x$get()
      inverse <- solve(data, ...)
      x$setinverse(inverse)
      # return the inverse
      inverse
}
