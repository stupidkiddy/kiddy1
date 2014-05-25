## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## the makeCacheMatrix function start with reading in a matrix (x), m represent a
##blank matrix stored, by using inner function set  and get to add and get x into y
##and m, then use solve() to make the inverse matrix of x temporalily. since this
##function returns only a list of functions, so we need another function to display
##the inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
       m <- NULL
       set <- function(y) {
              x <<- y
              m <<- NULL
       }
       get <- function() x
       setsolve <- function(solve) m <<- solve
       getsolve <- function() m
       list(set = set, get = get,
            setsolve  = setsolve ,
            getsolve  = getsolve )       
}


## Write a short comment describing this function
## the cacheSolve first confirm if anything present in m, if not, working proceeds.
##since the x here present the list returns by makeCacheMatrix(), so it can retrieve
##the data in the list and finally returns the inverse matrix.

cacheSolve <- function(x, ...) {
       m <- x$getsolve()
       if(!is.null(m)) {
              message("getting cached data")
              return(m)
       }
       data <- x$get()
       m <- solve(data, ...)
       x$setsolve(m)
       m         
        ## Return a matrix that is the inverse of 'x'
}


aa <-  matrix(c(4,2,7,6) , 2,2)
makeCacheMatrix(aa)
cacheSolve(makeCacheMatrix(aa) )



