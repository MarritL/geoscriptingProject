# Authors: Anne-Juul Welsink and Marrit Leenstra
# 28th January 2019
# Final Project, Geoscripting, Wageningen University 

# Function to plot the altitude of the simulations and the animal
#
# Input: 
#   simulations: dataframe with extracted raster values per point location as output from extractRasterValues
#   trajectories: dataframe with extracted raster values per point location  
# Output:
#    

plotProfiles <- function(simulations, trajectories){
  
  # make vector with different animals to loop over
  animalNames <- unique(trajectories$animal)
  
  for (animal in 1:length(animalNames)){
    print(animal)
    matrix <- simulations[[animal]]
    
    # create sequence for x axis
    timeseq <- seq(from = 1, by = 1, length.out = nrow(matrix))
    
    # create plot
    #png()
    matplot(timeseq, matrix, type='l', xlab='Points in time', ylab='Elevation', col = 'grey', lty = 1, main = paste("Simulated and real trajectory of", animalNames[animal]))
    #dev.off()
  }

}
