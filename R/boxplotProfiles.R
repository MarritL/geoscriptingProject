# Authors: Anne-Juul Welsink and Marrit Leenstra
# 28th January 2019
# Final Project, Geoscripting, Wageningen University 

# Function to create boxplots of the simulations and the recoreded animal tracks
#
# Input: 
#   simulations: list with matrices with extracted raster values per point location as output from combineSimTrack
#   animalNames: vector with animalNames
# Output:
#   plot of simulated trajectories in grey and real trajectory in red per animal

boxplotProfiles <- function(simulations, animalNames, xlab, ylab, title, addName = FALSE){
  
  #simulations <- simElCombi
  #xlab <-  "Trajectory"
  #ylab <- "Elevation (m)"
  #title <- "Comparison of recorded and simulated GPS trajectories of"
  titlebase <- title
  
  # create empty list
  plotlist <- list()
  
  for (animal in 1:length(animalNames)){
    
    if (addName){
      title <- paste(titlebase, animalNames[animal])
    }
    
    DFsimulations <- stack(as.data.frame(simulations[[animal]]))
    
    plotlist <-  list.append(plotlist, assign(paste0("plt", animal), ggplot(DFsimulations) + geom_boxplot(aes(x = ind, y = values)) + xlab(xlab) + ylab(ylab) + ggtitle(title)))
    
    #plotlist <- list.append(paste0("plt", animal))
  }
  
  return(plotlist)
  
}
