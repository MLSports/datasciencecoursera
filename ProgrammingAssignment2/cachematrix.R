## makeCacheMatrix - creates a list of functions to set&get the inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {

  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(solve) inv <<- solve
  getinv <- function() inv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## cacheSolve - takes a CacheMatrix object created by the function above and computes its inverse if it has not been conmputed before, 
## otherwise it takes the cahded inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv<- x$getinv()
  if(!is.null(inv)) {
    message("getting inverse from cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinv(inv)
  inv
}
