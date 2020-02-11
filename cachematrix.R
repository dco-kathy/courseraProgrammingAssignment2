## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#calculates the inverse of a matrix and stores it in a cache for later use

makeCacheMatrix <- function(x = matrix()) {
#initializes the cache to NULL to begin
        cache <- NULL
        
        #given a "value", creates the new matrix, stores it as x, and empties the cache to wait for the next input
        setMatrix <- function(value) {
                x <<- value
                cache <<- NULL
        }
        
        #grabs the new matrix 'x'
        getMatrix <- function() {
                x
        } 
        
        #calculates the inverse of the new matrix, and stores the answer in the cache
        cacheInverse <- function(solve) {
                cache <<- solve
        }
        
        #pulls that answer from the cache
        getInverse <- function() {
                cache
        }

        #return a list of the functions and what they return            
        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
        
}


## Write a short comment describing this function

#Returns a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
         #saves a value from the output of makeCacheMatrix.R
        matrixInverse <- x$getInverse()
        
        #if a value exists (is not null), print the status message, then show the answer 
        if (!is.null(matrixInverse)) {
                message("getting cached calculation")
                return(matrixInverse)
        }
        
        #if a value does not already exist, then get the matrix, solve the inverse, save it in the cache, 
        #then return the answer
        newMatrix <- x$getMatrix()
        newAnswer <- solve(newMatrix)
        x$cacheInverse(newAnswer)
        
        newAnswer
}
