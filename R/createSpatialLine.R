# Authors: Anne-Juul Welsink and Marrit Leenstra
# 28th January 2019
# Final Project, Geoscripting, Wageningen University 

# Function to create spatial lines from spatial locations in a dataframe
#
# Input: 
#    locationdata: dataframe containing the spatial location information in columns 'x' and 'y'
#    proj4dataframe: proj4string of the coordinates in the dataframe
#    proj4line: proj4string of the line, optional different projection than dataframe
#    lineId: line ID for the spatial line
#    
# Output:
#    Spatial line of the 

createSpatialLine <- function(locationdata, proj4dataframe, proj4line = proj4dataframe, lineId){
 
  # if dataframe is not a spatial dataframe, create one.
  if (!class(locationdata)[1] == "SpatialPointsDataFrame"){
    coords <- locationdata[,c("x","y")]
    locationdata <- SpatialPointsDataFrame(coords = coords, data = locationdata, proj4string = CRS(proj4dataframe))
  } 
  
  # transform to line coordinate system of line
  locationdata <- spTransform(locationdata, CRS(proj4line))
  
  # retrieve x and y coordinates 
  xcoord <- (locationdata@coords[,"x"])
  ycoord <- (locationdata@coords[,"y"])
  
  # create spatial line
  l1 = cbind(xcoord,ycoord)
  Sl1 = Line(l1)
  S1 = Lines(list(Sl1), ID = lineId)
  Sl = SpatialLines(list(S1), proj4string = CRS(proj4line))
  
  return(Sl)
}