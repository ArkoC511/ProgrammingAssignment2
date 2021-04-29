makeCacheMatrix <- function( m = matrix() ) {
  i <- NULL ## initializing inverse
  set <- function( matrix ) {   ## creating set matrix
    m <<- matrix
    i <<- NULL
  }
  get <- function() {  ##getting the matrix
    m                  ##returning matrix
  }
  setInverse <- function(inverse) {  ## Method to make inverse matrix
    i <<- inverse
  }
  getInverse <- function() {         ## Method to get inverse matrix
    i                                ## Return the inverse
  }
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

cacheSolve <- function(x, ...) {
  m <- x$getInverse() ## Return the inverse of 'x'
  if( !is.null(m) ) {   ## Return inverse if its already set
    message("getting cached data")
    return(m)
  }
  data <- x$get() ## Get the matrix
  m <- solve(data) %*% data ## Calculate the inverse
  x$setInverse(m) ## Set the inverse
  m ## Return the matrix
}