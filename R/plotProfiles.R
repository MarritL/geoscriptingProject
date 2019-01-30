# Authors: Anne-Juul Welsink and Marrit Leenstra
# 28th January 2019
# Final Project, Geoscripting, Wageningen University 

# Function to plot the altitude of the simulations and the animal tracks
#
# Input: 
#   simulations: dataframe with extracted raster values per point location as output from extractRasterValues
#   trajectories: dataframe with extracted raster values per point location  
# Output:
#   plot of simulated trajectories in grey and real trajectory in red per animal

plotProfiles <- function(simulations, animalNames){
  
  #simulations <- simElCombi
  
  for (animal in 1:length(animalNames)){
    
    matrix <- simulations[[animal]]
    
    # create sequence for x axis
    timeseq <- seq(from = 1, by = 1, length.out = nrow(matrix))
    
    # create plot
    #png()
    matplot(timeseq, matrix[,2:ncol(matrix)], type='l', xlab='Points in time', ylab='Elevation', col = "grey", lty = 1, main = paste("Simulated and real trajectory of", animalNames[animal]))
    matlines(timeseq, matrix[,1], type='l', col = "red", lty = 1)
    #dev.off()
  }

}
