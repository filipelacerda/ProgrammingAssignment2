## These functions allow us to create an R object containing a matrix and its inverse. 

## This function generates an R object including the original matrix and a placeholder for its inverse

makeCacheMatrix <- function(x = matrix()) {
        mat <- NULL
        set <- function(y) {
                x <<- y
                mat <<- NULL
        }
        get <- function() x
        setinverse <- function(matrix) mat <<- matrix
        getinverse <- function() mat
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## This function evaluates whether the object created in makeCachematrix has a stored inverse and, if not, creates it.

cacheSolve <- function(x, ...) {
        mat <- x$getinverse()
        if(!is.null(mat)) {
                message("getting cached data")
                return(mat)
        }
        data <- x$get()
        mat <- solve(data)
        x$setinverse(mat)
        mat 
}
