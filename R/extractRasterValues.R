# Authors: Anne-Juul Welsink and Marrit Leenstra
# 28th January 2019
# Final Project, Geoscripting, Wageningen University 

# Function to extract raster values based on the point locations of (simulated) animal movement. 
#
# Input: 
#    raster: the raster from which values are to be extracted
#    simulations: a list with point locations of animal movement structured as the output from the simulateMovement function
# Output:
#    list with matrix for every animal, every column of matrix contains extracted raster values per simulation

extractRasterValues <- function(raster, simulations){
  
  # Initialize empty list to store matrices
  rasterValuesMatrixlist <- list()
  
  # Access the inner list to obtain point locations of animal movement
  for (animal in 1:length(simulations)){
    
    # create empty matrix to store extracted values
    matrix <- matrix(nrow = nrow(simulations[[animal]][[1]][[1]]), ncol = length(simulations[[animal]]))
    columnNames <- as.character()
    
    for (nSim in 1:length(simulations[[animal]])){
    traject <- simulations[[animal]][[nSim]][[1]]
    
    # Extract raster values at point locations
     rasterValues <- extract(raster, traject[,c("x","y")], method='simple', na.rm=TRUE, df=TRUE)
     colnames(rasterValues) <-  c("ID", "rasterVal")
     
     # add to new column in matrix
     matrix[,nSim] <- rasterValues$rasterVal
     columnNames <- c(columnNames, paste0("Sim", nSim))
     
    }
    # add column names
    colnames(matrix) <- columnNames
    # add matrix to list
    rasterValuesMatrixlist <- list.append(rasterValuesMatrixlist, matrix)
  }
  return(rasterValuesMatrixlist)
} 
