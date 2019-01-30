# Authors: Anne-Juul Welsink and Marrit Leenstra
# 28th January 2019
# Final Project, Geoscripting, Wageningen University 

# Function to combine raster values of recorded animal movement with simulated raster values per animal.
#
# Input: 
#   df: a dataframe with raster values per recorded animal location
#   animalNames: a list of animal names
#   simEl: matrix with simulated raster values (one simulation per column)  
# Output: 
#   matrix with recorded and simulated altitude values (one column per simulation), grouped by animal
# 

combineSimTrack <- function(df, animalNames, simEl){
  
  for (animal in 1:length(animalNames)){
    # filter recorded values per animal from dataframe
    animalEl <- df[df$animal == animalNames[animal],]
    
    colNames <- colnames(simEl[[animal]])
    
    # add recorded values to simulations matrix
    simEl[[animal]] <- cbind(animalEl$rasterVal, simEl[[animal]])
    
    colnames(simEl[[animal]]) <- c("Rec", colNames)
  }
  return(simEl)
}
  