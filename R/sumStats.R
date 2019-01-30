# Authors: Anne-Juul Welsink and Marrit Leenstra
# 30th January 2019
# Final Project, Geoscripting, Wageningen University 

# Function to compute summary statistics of recorded and simulated raster values per animal.
#
# Input: 
#   values: a list with one matrix per animal with recorded and simulated raster values (one simulation per column)
#   animalNames: a list of animal names
# Output: 
#   a list with one matrix per animal containing summary statistics of recorded and simulated data
#    

sumStats <- function(values, animalNames){
  
  matrixList <- list()
  
  for (animal in 1:length(animalNames)){
    # create one matrix with per animal. 
    matrix <- matrix(nrow = 3, ncol = ncol(values[[animal]]))
    columnNames <- "rec"
    rowNames <- c("Mean", "Sd", "Var")
    
    for (column in 1:ncol(values[[animal]])){
      # add row with mean values for recorded values and per simulation
      mean <- mean(values[[animal]][, column], na.rm = TRUE)
      matrix[1,column] <- mean
      
      # add row with variance
      var <- var(values[[animal]][, column], na.rm = TRUE)
      matrix[2,column] <- var
      
      # add row with standard deviation 
      sd <- sd(values[[animal]][, column], na.rm = TRUE)
      matrix[3,column] <- sd
      
      if(!column == 1){
        columnNames <- c(columnNames, paste0("Sim", column))
      }
    }
    colnames(matrix) <- columnNames
    rownames(matrix) <- rowNames
    matrixList <- list.append(matrixList, matrix)
  }
  return(matrixList)
}
