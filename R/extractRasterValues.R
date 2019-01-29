# Authors: Anne-Juul Welsink and Marrit Leenstra
# 28th January 2019
# Final Project, Geoscripting, Wageningen University 

# Function to extract raster values based on the point locations of (simulated) animal movement. 
#
# Input: 
#    raster: the raster from which values are to be extracted
#    simulations: a list with point locations of animal movement structured as a list in a list in a list
# Output:
#    dataframe with extracted raster values per point location

extractRasterValues <- function(raster, simulations){
  
  df <- data.frame(ID = numeric(), rasterVal = numeric(), nSim = integer(), animal = character())
  for (animal in 1:length(simulations)){
    for (nSim in 1:length(simulations[[animal]])){
    traject <- simulations[[animal]][[nSim]][[1]]
     rasterValues <- extract(raster, traject[,c("x","y")], method='simple', na.rm=TRUE, df=TRUE)
     rasterValues$nSim <- nSim
     rasterValues$animal <- id(simulations[[animal]][[nSim]])
     colnames(rasterValues) <-  c("ID", "rasterVal", "nSim", "animal")
     df <- rbind(df, rasterValues)
    }
  }
  return(df)
} 
