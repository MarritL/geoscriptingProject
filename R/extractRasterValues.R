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

  # Initialize empty data frame  
  df <- data.frame(ID = numeric(), rasterVal = numeric(), nSim = integer(), animal = character())
  
  # Access the inner list to obtain point locations of animal movement
  for (animal in 1:length(simulations)){
    for (nSim in 1:length(simulations[[animal]])){
    traject <- simulations[[animal]][[nSim]][[1]]
    
    # Extract raster values at point locations
     rasterValues <- extract(raster, traject[,c("x","y")], method='simple', na.rm=TRUE, df=TRUE)
     rasterValues$nSim <- nSim # add column for number of simulations
     rasterValues$animal <- id(simulations[[animal]][[nSim]]) # add animal name
     colnames(rasterValues) <-  c("ID", "rasterVal", "nSim", "animal") # add column names to bind to df
     
     # Bind rasterValues to dataframe
     df <- rbind(df, rasterValues)
    }
  }
  return(df)
} 
