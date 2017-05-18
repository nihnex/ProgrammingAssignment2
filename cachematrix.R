##Gives the inverse matrix of x avoiding unnecessary recalculation


## creates a special matrix to cache the inverse matrix of x

makeCacheMatrix <- function(x = matrix()) {
	z <- NULL
	set <- function(y) {
		x <<- y
		z <<- NULL
	}
	get <- function() {
		x	
	}
	setinverse <- function(inverse) {
		z <<- inverse	
	}
	getinverse <- function() {
		z
	}
	list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


##gets the inverse matrix of x, but first checks if it's already computed

cacheSolve <- function(x, ...) {
        z <- x$getinverse()
	  if(!is.null(z)) {
	  	message("getting cached inverse matrix")
		return(z)
	  }
	 
	data <- x$get()
	z <- solve(data,...)
	x$setinverse(z)
	z 
		## Return a matrix that is the inverse of 'x'
}
