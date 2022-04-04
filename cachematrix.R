##creating a special "matrix" object that can cache its inverse.
##first I initialize the inverse and then set, get, set the inverse and then get the inverse while returning a list of methods. 

makeCacheMatrix <- function(mat=matrix()) {
  inv <- NULL
  set <- function(matrix) {
    mat <<- matrix
    inv <<- NULL
  }
  
  get <- function() {
    mat
  }
  
  setInverse <- function(inverse) {
    inv <<- inverse
  }
  
  getInverse <- function() {
    inv
  }
  
  list(set = set, 
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
  
}

## getting the inverse of the matrix returned by above function. 
##If we don't have the inverse then this below function will get the inverse from the cache.

cacheSolve <- function(x, ...) {
  y <- x$getInverse()
  if(!is.null(m)) {
    message("bellekteki datayı getiriyorum")
    return(y)
  }
  invertthematrix <- x$get()
  y <- solve(invertthematrix) %*% invertthematrix
  x$setInverse(y)
  y
}