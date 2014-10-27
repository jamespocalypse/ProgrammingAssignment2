## Assignment #2 for R programming to demonstrate lexical scoping and caching of variables to speed up costly
## operations which are run multiple times
## functions do

## Function accepts a matrix and caches its inverse values to be used elsewhere in the script

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
  x<<-y
  m<<-NULL
}
get<-function() x
setmatrix<-function(solve) m<<- solve
getmatrix<-function() m
list(set=set, get=get,
   setmatrix=setmatrix,
   getmatrix=getmatrix)
}


## computes the imverse square of a caches matrix object

cacheSolve <- function(x, ...) {
    m<-x$getmatrix()
    if(!is.null(m)){
      message("Retrieving matrix data cache")
      return(m)
    }
    matrix<-x$get()
    m<-solve(matrix, ...)
    x$setmatrix(m)
    m
}
