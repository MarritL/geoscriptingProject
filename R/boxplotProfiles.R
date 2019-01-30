# Authors: Anne-Juul Welsink and Marrit Leenstra
# 28th January 2019
# Final Project, Geoscripting, Wageningen University 

# Function to create boxplots of the simulations and the recoreded animal tracks
#
# Input: 
#   simulations: list with matrices with extracted raster values per point location as output from combineSimTrack
#   animalNames: vector with animalNames
#   xlab: label for x-axis, default is no label
#   ylab: label for y-axis, default is no label
#   title: title for plot, default is no title
#   addName: optional: add name for every animal at and of title name
# Output:
#   list with boxplot of simulated trajectories and recorded trajectory per animal

boxplotProfiles <- function(simulations, animalNames, xlab = NULL, ylab = NULL, title = NULL, addName = FALSE){
  
  # title base to add animal name to if addName = TRUE
  titlebase <- title
  
  # create empty list
  plotlist <- list()
  
  for (animal in 1:length(animalNames)){
    
    # add name to title if addName = TRUE
    if (addName){
      title <- paste(titlebase, animalNames[animal])
    }
    
    # create stacked dataframe
    DFsimulations <- stack(as.data.frame(simulations[[animal]]))
    
    # create ggboxplot and add to list
    plotlist <-  list.append(plotlist, assign(paste0("plt", animal), 
                      ggplot(DFsimulations) + geom_boxplot(aes(x = ind, y = values)) + 
                      xlab(xlab) + ylab(ylab) + ggtitle(title)))
  }
  return(plotlist)
}
