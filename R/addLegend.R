# Authors: Anne-Juul Welsink and Marrit Leenstra
# 28th January 2019
# Final Project, Geoscripting, Wageningen University 

# Function to plot the altitude of the simulations and the animal tracks
#
# Input: 
#   simulations: list with matrices with extracted raster values per point location as output from combineSimTrack
#   animalNames: vector with animalNames
# Output:
#   list with stacked dataframe

addLegend <- function(simulations, legend, animalNames){
  
  # simulations = simLandCombi
  # legend = landUseLegend
  # animalNames = animalNames
  
  # create empty list to save output
  dataframeList <- list()
  
  for (animal in 1:length(animalNames)){
    
    dataframe <- stack(data.frame(simulations[[animal]]))
    
    dataframeWithLegend <- as.matrix(left_join(dataframe, legend, by = c("values" = "GRID_CODE")))
    
    dataframeList <- list.append(dataframeList, dataframeWithLegend)
    
  }

  return(dataframeList)
}
