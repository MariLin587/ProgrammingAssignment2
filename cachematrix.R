## These two functions enable caching the computationally intensive inverse 
## of a matrix. It will be calculated once and after that a cached value is
## returned provided that the data remains the same. 


makeCacheMatrix <- function(x = matrix()) {
## Creates four functions set, get, setinverse, getinverse available for other functions
##
## Arg: x is a matrix
##
## Returns: a list of four functions making them available for other functions  
  
  m <- NULL
  set <- function(y) {
## Function set - sets the value
    x <<- y
    m <<- NULL
  }
  get <- function() x
## Function get - gets the value

  setinverse <- function(inverse) m <<- inverse
## Function setinverse - Sets the inverse of the matrix to m

  getinverse <- function() m
## Function getinverse - gets the value of m
  
}



cacheSolve <- function(x, ...) {
## cacheSolve returns an inverse of a matrix. 
##
## Args: matrix x
##
## Returns: inverse of a matrix   
##  
  m <- x$getinverse()
## If inverse has already been calculated before returns the cached value  
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  data <- x$get()
  m <- solve(data, ...)
## Calculates the inverse
  x$setinverse(m)
## Stores the calculated value
  m  

}
