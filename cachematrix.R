## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This makeCacheMatrix function creates a special "matrix" object that can cache its inverse. 

# makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
	## initialize the inverse value.
	invs<-NULL

	## set matrix
	setmatrix<-function(matrix){
		matx<<-matrix
		invs<<-NULL
	}

	## get the matrix
	getmatrix<-function(){ 
		## return the matrix
		matx
	}

	setinversematrix<-function(matrix){
		## set and return the inverse matrix.
		invs <<- inverse
	}

	getinversematrix<-function(){
		## return the inverse matrix.
		invs
	}

	##Return a list of method.
	list(setmatrix = setmatrix, getmatrix = getmatrix, 
			setinversematrix = setinversematrix,
			getinversematrix = getinversematrix)

}


## Write a short comment describing this function

## This function computes the inverse of the 
## special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated 
## (and the matrix has not changed), then the 
## cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'a
	matx<-x$getinversematrix()
	
	##return the inverse if it is already defined.
	if(!is.null(matx)){
		message("getting the catched data.")
		return(matx)
	}

	##get the matrix from the object.	
	data<-x$getmatrix()
	
	##calculate the inverse using the matrix multiplication.
	matx<-solve(data)%*%data

	##set the inverse to the object.
	x$setinversematrix(matx)

	##return the matrix.
	matx
}
